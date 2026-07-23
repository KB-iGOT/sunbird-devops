#!/bin/bash
###############################################################################
# post-deploy-verify.sh
#
# Automates the manual Step 7 verification routine from the New Service
# Deployment SOP (KB-iGOT / Karmayogi Bharat) — pod status, ConfigMap
# emptiness, log error-pattern triage, app health endpoint, and resource
# usage vs. limits, after a Helm/Ansible deploy.
#
# Usage:
#   ./post-deploy-verify.sh <namespace> <service-name> [tail-lines] [health-port] [health-path]
#
# Examples:
#   ./post-deploy-verify.sh dev ai-assessment 100
#   ./post-deploy-verify.sh dev cb-org-hierarchy-service 100 8080 /actuator/health
#
# health-port/health-path are optional — omit both to skip the health check
# (useful for services where you haven't confirmed the endpoint yet).
#
# Exit codes:
#   0 = all checks passed
#   1 = ConfigMap empty (redeploy needed — per known issue, do NOT restart pod)
#   2 = Pod not Running/Ready
#   3 = Error patterns found in logs
#   4 = Health endpoint check failed (only when health-port is provided)
#
# Resource usage (step 5) is informational only and never fails the build —
# metrics-server isn't guaranteed to be available in every cluster/namespace.
###############################################################################

set -uo pipefail

NAMESPACE="${1:?Usage: $0 <namespace> <service-name> [tail-lines] [health-port] [health-path]}"
SERVICE="${2:?Usage: $0 <namespace> <service-name> [tail-lines] [health-port] [health-path]}"
TAIL_LINES="${3:-50}"
HEALTH_PORT="${4:-}"
HEALTH_PATH="${5:-/health}"

CONFIGMAP_NAME="${SERVICE}-config"
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; NC='\033[0m'
FAIL=0

echo "=== Post-Deploy Verification: ${SERVICE} (ns: ${NAMESPACE}) ==="
echo

# --- 0. kubectl auth sanity check ------------------------------------------
if ! kubectl auth can-i get pods -n "$NAMESPACE" >/dev/null 2>&1; then
    echo -e "${RED}FAIL${NC}: kubectl cannot authenticate / lacks permission for namespace '${NAMESPACE}'."
    echo -e "${YELLOW}→ Check the Jenkins agent's kubeconfig context before trusting any result below.${NC}"
    exit 5
fi

# --- 1. Pod status ---------------------------------------------------------
# NOTE: pod.status.phase stays "Running" throughout a crash loop, and
# containerStatuses[0].ready can briefly read "true" in the instant after
# a restart, before the next crash. Checking phase+ready alone is a false
# negative for CrashLoopBackOff. Instead we check containerStatuses[].state
# for a waiting.reason (CrashLoopBackOff, ImagePullBackOff, etc.) — the same
# signal kubectl's own STATUS column is built from.
echo "[1/5] Checking pod status..."
RESTART_WARN_THRESHOLD=20

PODS_JSON=$(kubectl get pods -n "$NAMESPACE" -l app="$SERVICE" -o json 2>/dev/null)
POD_COUNT=$(echo "$PODS_JSON" | jq '.items | length' 2>/dev/null || echo 0)

if [[ "$POD_COUNT" -eq 0 ]]; then
    # Fallback for services whose pods don't carry a matching 'app' label
    FALLBACK_NAME=$(kubectl get pods -n "$NAMESPACE" --no-headers 2>/dev/null | grep "^${SERVICE}" | awk '{print $1}' | head -n1)
    if [[ -n "$FALLBACK_NAME" ]]; then
        PODS_JSON=$(kubectl get pod "$FALLBACK_NAME" -n "$NAMESPACE" -o json 2>/dev/null | jq '{items: [.]}')
        POD_COUNT=1
    fi
fi

POD_NAME=""
if [[ "$POD_COUNT" -eq 0 ]]; then
    echo -e "  ${RED}FAIL${NC}: No pod found matching '${SERVICE}' in namespace '${NAMESPACE}'"
    FAIL=2
else
    UNHEALTHY_FOUND=0
    STALE_FOUND=0
    while IFS=$'\t' read -r name phase ready restarts waitreason; do
        [[ -z "$name" ]] && continue
        [[ -z "$POD_NAME" ]] && POD_NAME="$name"   # first pod feeds steps 3-5

        if [[ "$phase" == "Unknown" || "$waitreason" == "ContainerStatusUnknown" ]]; then
            echo -e "  ${YELLOW}WARN${NC}: $name is stale (phase=$phase) — likely an orphaned pod from an old ReplicaSet, consider cleanup"
            STALE_FOUND=1
            continue
        fi

        if [[ -n "$waitreason" && "$waitreason" != "null" ]]; then
            echo -e "  ${RED}FAIL${NC}: $name is stuck in ${waitreason} (restarts: ${restarts})"
            UNHEALTHY_FOUND=1
        elif [[ "$phase" == "Running" && "$ready" == "true" ]]; then
            if [[ "$restarts" =~ ^[0-9]+$ && "$restarts" -gt "$RESTART_WARN_THRESHOLD" ]]; then
                echo -e "  ${YELLOW}WARN${NC}: $name is Running/Ready but has a high restart count (${restarts}) — check history even though it's currently up"
            else
                echo -e "  ${GREEN}OK${NC}: $name is Running/Ready (restarts: ${restarts})"
            fi
        else
            echo -e "  ${RED}FAIL${NC}: $name status=$phase ready=$ready restarts=$restarts"
            UNHEALTHY_FOUND=1
        fi
    done < <(echo "$PODS_JSON" | jq -r '.items[] | [.metadata.name, .status.phase, (.status.containerStatuses[0].ready // false), (.status.containerStatuses[0].restartCount // 0), (.status.containerStatuses[0].state.waiting.reason // "")] | @tsv')

    if [[ "$UNHEALTHY_FOUND" -eq 1 ]]; then
        FAIL=2
    elif [[ "$STALE_FOUND" -eq 1 && -z "$POD_NAME" ]]; then
        echo -e "  ${RED}FAIL${NC}: Only stale/orphaned pods found for '${SERVICE}'"
        FAIL=2
    fi
fi
echo

# --- 2. ConfigMap emptiness check ------------------------------------------
echo "[2/5] Checking ConfigMap '${CONFIGMAP_NAME}'..."
CM_DATA=$(kubectl get configmap "$CONFIGMAP_NAME" -n "$NAMESPACE" -o jsonpath='{.data}' 2>/dev/null)

if [[ -z "$CM_DATA" || "$CM_DATA" == "{}" || "$CM_DATA" == "map[]" ]]; then
    echo -e "  ${RED}FAIL${NC}: ConfigMap is empty or missing."
    echo -e "  ${YELLOW}→ Known issue: redeploy the Helm release. Do NOT restart the pod manually"
    echo -e "    (ConfigMap is only populated during deploy, per SOP lesson #5).${NC}"
    [[ $FAIL -eq 0 ]] && FAIL=1
else
    KEY_COUNT=$(kubectl get configmap "$CONFIGMAP_NAME" -n "$NAMESPACE" -o jsonpath='{.data}' | grep -o ':' | wc -l)
    echo -e "  ${GREEN}OK${NC}: ConfigMap populated (${KEY_COUNT} keys)"
fi
echo

# --- 3. Log error-pattern triage --------------------------------------------
echo "[3/5] Scanning last ${TAIL_LINES} log lines for known error patterns..."
if [[ -n "$POD_NAME" ]]; then
    LOGS=$(kubectl logs -n "$NAMESPACE" "$POD_NAME" --tail="$TAIL_LINES" 2>/dev/null)
    # Bare "Exception" is deliberately excluded — it false-positives on benign
    # Spring Boot startup lines like "ExceptionHandlerExceptionResolver".
    # Patterns cover Java/Spring, Node, Python, and Go log shapes.
    PATTERNS='  ERROR |connection refused|ECONNREFUSED|invalid_grant|UndefinedVariable|Exception:|Caused by:|OOMKilled|CrashLoopBackOff|127\.0\.0\.1|FATAL|panic:|UnhandledPromiseRejection|Unhandled Rejection|Traceback \(most recent call last\)'
    MATCHES=$(echo "$LOGS" | grep -iE "$PATTERNS")

    if [[ -n "$MATCHES" ]]; then
        echo -e "  ${RED}FAIL${NC}: Suspicious log lines found:"
        echo "$MATCHES" | sed 's/^/    /'
        [[ $FAIL -eq 0 ]] && FAIL=3
    else
        echo -e "  ${GREEN}OK${NC}: No known error patterns in recent logs"
    fi
else
    echo "  SKIPPED (no pod found)"
fi
echo

# --- 4. App-level health endpoint check -------------------------------------
echo "[4/5] Checking app health endpoint..."
if [[ -z "$HEALTH_PORT" ]]; then
    echo "  SKIPPED (no health-port provided — pass as 4th arg to enable)"
elif [[ -z "$POD_NAME" ]]; then
    echo "  SKIPPED (no pod found)"
else
    HEALTH_RESPONSE=$(kubectl exec -n "$NAMESPACE" "$POD_NAME" -- \
        wget -qO- --timeout=5 "http://127.0.0.1:${HEALTH_PORT}${HEALTH_PATH}" 2>/dev/null || \
        kubectl exec -n "$NAMESPACE" "$POD_NAME" -- \
        curl -sf --max-time 5 "http://127.0.0.1:${HEALTH_PORT}${HEALTH_PATH}" 2>/dev/null)

    if [[ -n "$HEALTH_RESPONSE" ]]; then
        echo -e "  ${GREEN}OK${NC}: ${HEALTH_PATH} responded"
        echo "    $(echo "$HEALTH_RESPONSE" | head -c 200)"
    else
        echo -e "  ${RED}FAIL${NC}: No response from http://127.0.0.1:${HEALTH_PORT}${HEALTH_PATH} inside the pod"
        echo -e "  ${YELLOW}→ Neither wget nor curl available in the container, or the endpoint is down/wrong path.${NC}"
        [[ $FAIL -eq 0 ]] && FAIL=4
    fi
fi
echo

# --- 5. Resource usage vs. limits (informational only) ----------------------
echo "[5/5] Checking resource usage vs. limits..."
if [[ -z "$POD_NAME" ]]; then
    echo "  SKIPPED (no pod found)"
else
    TOP_OUTPUT=$(kubectl top pod "$POD_NAME" -n "$NAMESPACE" --no-headers 2>/dev/null)
    if [[ -z "$TOP_OUTPUT" ]]; then
        echo "  SKIPPED (metrics-server unavailable or metrics not yet ready for this pod)"
    else
        CPU_USAGE=$(echo "$TOP_OUTPUT" | awk '{print $2}')
        MEM_USAGE=$(echo "$TOP_OUTPUT" | awk '{print $3}')
        CPU_LIMIT=$(kubectl get pod "$POD_NAME" -n "$NAMESPACE" -o jsonpath='{.spec.containers[0].resources.limits.cpu}' 2>/dev/null)
        MEM_LIMIT=$(kubectl get pod "$POD_NAME" -n "$NAMESPACE" -o jsonpath='{.spec.containers[0].resources.limits.memory}' 2>/dev/null)
        echo -e "  ${YELLOW}INFO${NC}: CPU ${CPU_USAGE} / limit ${CPU_LIMIT:-none}  |  Memory ${MEM_USAGE} / limit ${MEM_LIMIT:-none}"
        echo "    (Informational only — not a pass/fail check. Watch for usage close to limit, which risks OOMKill/throttling.)"
    fi
fi
echo

# --- Summary -----------------------------------------------------------------
echo "=== Summary ==="
if [[ $FAIL -eq 0 ]]; then
    echo -e "${GREEN}ALL CHECKS PASSED${NC} — ${SERVICE} looks healthy in ${NAMESPACE}."
else
    echo -e "${RED}VERIFICATION FAILED${NC} (exit code ${FAIL}) — see details above."
fi

exit $FAIL
