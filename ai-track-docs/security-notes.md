# Security & Secret Hygiene Notes

**InSpec version:** 5.24.10  
**Last reviewed:** 2026-05-21

---

## 1. Findings from Audit

### 1.1 Committed RSA Private Key (Remediated ✅)

| Item | Detail |
|------|--------|
| **File** | `test/fixtures/files/test_certificate.rsa.key.pem` |
| **Type** | RSA 2048 private key |
| **Risk** | ⚠️ Low — self-signed, expired Mar 2018, test-only subject |
| **In repo since** | Initial `x509_certificate` resource commit (2017) |
| **Action taken** | Added `SECRETS-NOTE.md` clearly annotating intent; added `.gitignore` negation rules so only these known test fixtures are allowed |

**Why it was safe:** The certificate `CN=Inspec Test Certificate / O=Chef Software Inc`
was never used to sign real artefacts. It is already expired and its corresponding CA
(`CN=Inspec Test CA`) is self-signed with no cross-signed trust. No rotation needed.

### 1.2 Placeholder Credentials in Resource Examples (Accepted ✅)

Several resources contain credential placeholders in `desc`/`example` blocks:

```ruby
# lib/inspec/resources/mssql_session.rb
mssql_session(user: 'myuser', password: 'mypassword', ...)

# lib/inspec/resources/oracledb_session.rb
password: 'password'

# lib/inspec/resources/cassandradb_session.rb
password: 'password'
```

These are **documentation strings only** — not evaluated at runtime.
They follow the project convention of using obvious placeholder strings
(`'password'`, `'USER'`, `'TOKEN'`). No action needed, but contributors
should continue using equally obvious placeholders in new resources.

### 1.3 No Real Secrets Found

Full scan found:
- No AWS access key patterns (`AKIA…`)
- No GitHub/GitLab personal access tokens
- No embedded PEM blocks outside the known test fixtures
- No `.env` files with real values
- No `*.tfvars` with credentials (file is already `.gitignore`d)

---

## 2. `.gitignore` Improvements (Applied ✅)

The following categories were added to `.gitignore`:

| Category | Patterns added |
|----------|----------------|
| Environment files | `.env`, `.env.*` (with `!.env.example` exception) |
| Private keys | `*.pem`, `*.key`, `*.p12`, `*.pfx`, `id_rsa*`, `id_ed25519*`, etc. |
| Certificate files | `*.cer`, `*.crt` |
| Secret config | `*.secret`, `secrets.yml`, `config/secrets.yml`, `.netrc` |
| Cloud credentials | `.aws/credentials`, `gcp_credentials.json` |
| Editor noise | `.DS_Store`, `.idea/workspace.xml`, `*.iml` |
| Test-fixture exceptions | `!test/fixtures/files/*.pem`, `!test/fixtures/files/*.key.pem` |

---

## 3. Ongoing Secret Hygiene Rules

### For contributors

1. **Never hard-code credentials** — use `ENV['MY_VAR']` or InSpec inputs.
2. **Use obvious placeholders** in `desc`/`example` blocks: `'USER'`, `'PASSWORD'`,
   `'TOKEN'` — not real-looking strings.
3. **Check before every commit:**
   ```bash
   git diff --cached | grep -iE "(password|secret|key|token)\s*[:=]\s*['\"][^'\"]{8,}"
   ```
4. **If you accidentally staged a secret:**
   ```bash
   git reset HEAD <file>   # unstage
   git rm --cached <file>  # remove from index if added
   # rotate the credential immediately — assume it's compromised
   ```

### For CI

- GitHub Actions uses `${{ secrets.GITHUB_TOKEN }}` (repository-scoped, auto-rotated).
  No long-lived tokens are stored in workflow files.
- Expeditor pipeline credentials are injected at runtime via Chef's secrets management.
  They are never written to disk or echoed in build logs.

### For test fixtures

- All PKI material in `test/fixtures/files/` must be:
  - Self-signed (no real CA trust chain)
  - Clearly named `test_*`
  - Annotated in `test/fixtures/files/SECRETS-NOTE.md`
  - Referenced by the `.gitignore` negation list if they are `*.pem` or `*.key`

---

## 4. Pre-Commit Scan (Recommended)

Add this as a local git hook to catch secrets before they are committed:

```bash
# .git/hooks/pre-commit  (chmod +x)
#!/usr/bin/env bash
set -e
PATTERNS="(AKIA[0-9A-Z]{16}|ghp_[a-zA-Z0-9]{36}|BEGIN (RSA|EC|OPENSSH) PRIVATE KEY)"
if git diff --cached --name-only | xargs grep -lP "$PATTERNS" 2>/dev/null; then
  echo "ERROR: Possible secret detected in staged files. Aborting commit."
  exit 1
fi
```

Or use [git-secrets](https://github.com/awslabs/git-secrets) /
[gitleaks](https://github.com/gitleaks/gitleaks) for broader coverage.

---

## 5. Related Files

| File | Purpose |
|------|---------|
| `.gitignore` | Prevents accidental secret commits |
| `test/fixtures/files/SECRETS-NOTE.md` | Annotates intentional test PKI material |
| `ai-track-docs/dependency-notes.md` | Dependency audit (token/auth gem constraints) |
