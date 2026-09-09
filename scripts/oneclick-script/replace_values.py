#!/usr/bin/env python3

import json
import os
import shutil
from datetime import datetime


# ============================================================
# CONFIGURATION
# ============================================================

BASE_DIR = os.getcwd()

OLD_SA_FILE = "old-service-account.json"
NEW_SA_FILE = "new-service-account.json"

NORMAL_REPLACEMENTS = {
    "10.175.3.38": "10.175.10.2",
    "10.175.3.193": "10.175.10.3",
    # "10.175.3.36": "<IP-3>"  ###igotDB-IP
    # "10.175.3.37": "<IP-4>"  ###CoreDB-IP
    # "10.175.3.83": "<IP-5>"  ###keycloak24-IP
    # "10.175.3.44": "<IP-6>"  ###DP-IP
    # "10.175.3.36": "<IP-3>"  ###igotDB-IP
    # "10.175.3.100": "<IP-8>"  ###private-ingres-IP
    "qa.karmayogibharat.net": "oc.karmayogibharat.net",
    "igotqa": "ocbucket-1",
    # Add more replacements here
    # "10.175.3.39": "10.175.10.3",
    # "10.175.3.40": "10.175.10.4",
}


# ============================================================
# BACKUP DIRECTORY
# ============================================================

BACKUP_DIR = os.path.join(
    BASE_DIR,
    "replacement_backup_" + datetime.now().strftime("%Y%m%d_%H%M%S")
)

os.makedirs(BACKUP_DIR, exist_ok=True)


# ============================================================
# LOAD SERVICE ACCOUNT JSON
# ============================================================

with open(OLD_SA_FILE, "r", encoding="utf-8") as f:
    old_sa = json.load(f)

with open(NEW_SA_FILE, "r", encoding="utf-8") as f:
    new_sa = json.load(f)


# ============================================================
# CREATE REPLACEMENT MAPPINGS
# ============================================================

replacements = dict(NORMAL_REPLACEMENTS)

SA_FIELDS = [
    "project_id",
    "private_key_id",
    "private_key",
    "client_email",
    "client_id",
    "auth_uri",
    "token_uri",
    "auth_provider_x509_cert_url",
    "client_x509_cert_url",
    "universe_domain",
]


for field in SA_FIELDS:

    old_value = old_sa.get(field)
    new_value = new_sa.get(field)

    if old_value and new_value and old_value != new_value:

        replacements[old_value] = new_value

        # In YAML files private_key is normally stored
        # with literal \n characters.
        if field == "private_key":

            old_escaped = old_value.replace("\n", "\\n")
            new_escaped = new_value.replace("\n", "\\n")

            replacements[old_escaped] = new_escaped


# ============================================================
# BACKUP FUNCTION
# ============================================================

def backup_file(filepath):

    relative_path = os.path.relpath(filepath, BASE_DIR)

    backup_path = os.path.join(
        BACKUP_DIR,
        relative_path
    )

    os.makedirs(
        os.path.dirname(backup_path),
        exist_ok=True
    )

    shutil.copy2(filepath, backup_path)


# ============================================================
# SHOW REPLACEMENTS
# ============================================================

print()
print("=" * 70)
print("Replacement mappings")
print("=" * 70)

for old_value, new_value in replacements.items():

    if "PRIVATE KEY" in old_value:
        print("[PRIVATE KEY] -> [PRIVATE KEY]")
    else:
        print(f"{old_value} -> {new_value}")

print("=" * 70)
print()


# ============================================================
# PROCESS FILES
# ============================================================

files_changed = 0

for root, dirs, files in os.walk(BASE_DIR):

    # Ignore backup directories
    dirs[:] = [
        d for d in dirs
        if not d.startswith("replacement_backup_")
    ]

    for filename in files:

        # Don't process service-account source files
        if filename in {
            OLD_SA_FILE,
            NEW_SA_FILE
        }:
            continue

        filepath = os.path.join(root, filename)

        # Process only configuration files
        if not filename.endswith((
            ".yml",
            ".yaml",
            ".json",
            ".conf",
            ".cfg",
            ".txt"
        )):
            continue

        try:
            with open(
                filepath,
                "r",
                encoding="utf-8"
            ) as f:
                content = f.read()

        except (UnicodeDecodeError, PermissionError):
            continue

        original_content = content

        # ====================================================
        # APPLY REPLACEMENTS
        # ====================================================

        for old_value, new_value in replacements.items():

            if old_value in content:

                content = content.replace(
                    old_value,
                    new_value
                )

        # ====================================================
        # WRITE ONLY IF CHANGED
        # ====================================================

        if content != original_content:

            backup_file(filepath)

            with open(
                filepath,
                "w",
                encoding="utf-8"
            ) as f:
                f.write(content)

            files_changed += 1

            print(f"Updated: {filepath}")


# ============================================================
# RESULT
# ============================================================

print()
print("=" * 70)
print("Replacement completed")
print("=" * 70)

print(f"Files changed : {files_changed}")
print(f"Backup        : {BACKUP_DIR}")

print("=" * 70)
