#!/bin/bash
###############################################################################
# post-deploy-verify.sh
#
# Automates the manual Step 7 verification routine from the New Service
# Deployment SOP (KB-iGOT / Karmayogi Bharat) — pod status, ConfigMap
# emptiness, and log error-pattern triage after a Helm/Ansible deploy.
#
# Usage:
#   ./post-deploy-verify.sh <namespace> <service-name> [tail-lines]
#
# Example:
#   ./post-deploy-verify.sh dev ai-assessment 100
#
# Exit codes:
#   0 = all checks passed
#   1 = ConfigMap empty (redeploy needed — per known issue, do NOT restart pod)
#   2 = Pod not Running/Ready
#   3 = Error patterns found in logs
###############################################################################

set -uo pipefail

NAMESPACE="${1:?Usage: $0 <namespace> <service-name> [tail-lines]}"
SERVICE="${2:?Usage: $0 <namespace> <service-name> [tail-lines]}"
TAIL_LINES="${3:-50}"

CONFIGMAP_NAME="${SERVICE}-config"
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; NC='\033[0m'
FAIL=0

echo "=== Post-Deploy Verification: ${SERVICE} (ns: ${NAMESPACE}) ==="
echo

# --- 1. Pod status ---------------------------------------------------------
echo "[1/3] Checking pod status..."
POD_NAME=$(kubectl get pods -n "$NAMESPACE" --no-headers 2>/dev/null | grep "^${SERVICE}" | awk '{print $1}' | head -n1)

if [[ -z "$POD_NAME" ]]; then
    echo -e "  ${RED}FAIL${NC}: No pod found matching '${SERVICE}' in namespace '${NAMESPACE}'"
    FAIL=2
else
    POD_STATUS=$(kubectl get pod "$POD_NAME" -n "$NAMESPACE" -o jsonpath='{.status.phase}')
    READY=$(kubectl get pod "$POD_NAME" -n "$NAMESPACE" -o jsonpath='{.status.containerStatuses[0].ready}')
    RESTARTS=$(kubectl get pod "$POD_NAME" -n "$NAMESPACE" -o jsonpath='{.status.containerStatuses[0].restartCount}')

    if [[ "$POD_STATUS" == "Running" && "$READY" == "true" ]]; then
        echo -e "  ${GREEN}OK${NC}: $POD_NAME is Running/Ready (restarts: ${RESTARTS})"
    else
        echo -e "  ${RED}FAIL${NC}: $POD_NAME status=$POD_STATUS ready=$READY restarts=$RESTARTS"
        FAIL=2
    fi
fi
echo

# --- 2. ConfigMap emptiness check ------------------------------------------
echo "[2/3] Checking ConfigMap '${CONFIGMAP_NAME}'..."
CM_DATA=$(kubectl get configmap "$CONFIGMAP_NAME" -n "$NAMESPACE" -o jsonpath='{.data}' 2>/dev/null)

if [[ -z "$CM_DATA" || "$CM_DATA" == "{}" || "$CM_DATA" == "map[]" ]]; then
    echo -e "  ${RED}FAIL${NC}: ConfigMap is empty or missing."
    echo -e "  ${YELLOW}→ Known issue: redeploy the Helm release. Do NOT restart the pod manually"
    echo -e "    (ConfigMap is only populated during deploy, per SOP lesson #5).${NC}"
    FAIL=1
else
    KEY_COUNT=$(kubectl get configmap "$CONFIGMAP_NAME" -n "$NAMESPACE" -o jsonpath='{.data}' | grep -o ':' | wc -l)
    echo -e "  ${GREEN}OK${NC}: ConfigMap populated (${KEY_COUNT} keys)"
fi
echo

# --- 3. Log error-pattern triage --------------------------------------------
echo "[3/3] Scanning last ${TAIL_LINES} log lines for known error patterns..."
if [[ -n "$POD_NAME" ]]; then
    LOGS=$(kubectl logs -n "$NAMESPACE" "$POD_NAME" --tail="$TAIL_LINES" 2>/dev/null)
    # Note: bare "Exception" is deliberately excluded — it false-positives on
    # benign Spring Boot startup lines like "ExceptionHandlerExceptionResolver"
    # and "@ExceptionHandler methods in exceptionHandler". Instead we look for
    # an actual ERROR log level, a thrown exception message ("Exception:"),
    # or a stack trace marker ("Caused by:").
    PATTERNS='  ERROR |connection refused|ECONNREFUSED|invalid_grant|UndefinedVariable|Exception:|Caused by:|OOMKilled|CrashLoopBackOff|127\.0\.0\.1'
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

# --- Summary -----------------------------------------------------------------
echo "=== Summary ==="
if [[ $FAIL -eq 0 ]]; then
    echo -e "${GREEN}ALL CHECKS PASSED${NC} — ${SERVICE} looks healthy in ${NAMESPACE}."
else
    echo -e "${RED}VERIFICATION FAILED${NC} (exit code ${FAIL}) — see details above."
fi

exit $FAIL
