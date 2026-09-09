# QA Inventory Value Replacement

## 1. Go to QA inventory

```bash
cd ~/oneclick-setup-private/ansible/inventory/qa
```

## 2. Files

Keep these files in the `qa` directory:

```text
qa/
├── replace_values.py
├── old-service-account.json
├── new-service-account.json
├── Core/
├── DataPipeline/
├── igot/
├── KnowledgePlatform/
├── Kubernetes/
├── Lern/
├── managed-learn/
└── Mentorship/
```

## 3. Old Service Account

Create:

```bash
vi old-service-account.json
```

Paste the existing/old GCP service-account JSON.

## 4. New Service Account

Create:

```bash
vi new-service-account.json
```

Paste the new GCP service-account JSON.

## 5. Configure IP/Domain/Bucket replacements

Edit:

```bash
vi replace_values.py
```

Update:

```python
NORMAL_REPLACEMENTS = {
    "10.175.3.38": "10.175.10.2",
    "qa.karmayogibharat.net": "oc.karmayogibharat.net",
    "igotqa": "ocbucket-1",

    # Add more if required
    # "10.175.3.39": "10.175.10.3",
    # "10.175.3.40": "10.175.10.4",
}
```

The script automatically replaces the old service-account values with the values from `new-service-account.json`.

## 6. Make script executable

```bash
chmod +x replace_values.py
```

## 7. Check old values

```bash
grep -Rni "10.175.3.38" .
grep -Rni "qa.karmayogibharat.net" .
grep -Rni "igotqa" .
grep -Rni "prj-kb-nprd-test" .
```

## 8. Run replacement

```bash
./replace_values.py
```

The script creates a backup directory automatically:

```text
replacement_backup_YYYYMMDD_HHMMSS/
```

## 9. Verify

Check that old values are removed:

```bash
grep -Rni "10.175.3.38" .
grep -Rni "qa.karmayogibharat.net" .
grep -Rni "igotqa" .
```

Check new values:

```bash
grep -Rni "10.175.10.2" .
grep -Rni "oc.karmayogibharat.net" .
grep -Rni "ocbucket-1" .
```

## 10. Check Git changes

```bash
git status
git diff
```

## 11. Rollback

If required, restore files from the backup directory:

```bash
cp -a replacement_backup_YYYYMMDD_HHMMSS/. .
```

## Important

Do not commit:

```text
old-service-account.json
new-service-account.json
replacement_backup_*/
```

These files may contain sensitive credentials.
