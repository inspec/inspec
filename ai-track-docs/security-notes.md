# Security Notes

## Secret Hygiene

### .gitignore coverage

The `.gitignore` now explicitly excludes:

- `.env`, `.env.*`, `*.env` — environment variable files
- `.envrc.local` — direnv local overrides (`.envrc` is already ignored)
- `.secrets`, `.credentials`, `credentials.json` — credential stores
- `service-account*.json` — GCP service account keys
- `*secret*.yaml` — YAML files with "secret" in the name
- `.mcp.json` — MCP server config (can accumulate tokens)

**Exception:** `test/fixtures/**` is excluded from the secret-pattern rules
because it contains intentional test keys (see below).

### Test fixture keys (intentionally committed)

These files are **not real secrets** — they are synthetic keys generated
specifically for unit testing crypto-related resources:

| File | Purpose |
|------|---------|
| `test/fixtures/files/test_ca_public.key.pem` | CA public key fixture |
| `test/fixtures/files/test_certificate.rsa.crt.pem` | Test certificate |
| `test/fixtures/files/test_certificate.rsa.key.pem` | Test RSA private key (synthetic) |
| `test/fixtures/files/x509-secret-key` | Unencrypted RSA key fixture |
| `test/fixtures/files/x509-encrypted-secret-key` | Encrypted RSA key fixture |

**These must never be used in production.** They exist solely so the
`x509_certificate` and `key_rsa` resources can be tested without network access.

### Remediation applied

**Issue:** `.mcp.json` was untracked but not ignored. This file could
accumulate auth tokens for Jira/Atlassian MCP servers if future
configurations include bearer tokens.

**Fix:** Added `.mcp.json` to `.gitignore`. The file remains local-only.

---

## General Guidelines

1. **Never commit real credentials** — use environment variables or a secrets
   manager (Vault, 1Password CLI, etc.).
2. **Use `GITHUB_TOKEN` via env** — see `ai-track-docs/build-test.md` for setup.
3. **Review `git diff --cached`** before committing — look for tokens, passwords,
   or API keys in string literals.
4. **Rotate immediately** if a secret is accidentally committed — even if you
   force-push, the reflog retains it.
5. **Fixture keys are test-only** — grep for `BEGIN.*PRIVATE KEY` in non-fixture
   paths to catch accidental additions:
   ```bash
   git grep -l "PRIVATE KEY" -- ':!test/fixtures'
   ```

---

## Audit Commands

```bash
# Check for secrets in staged changes:
git diff --cached | grep -iE '(password|token|secret|api.?key)\s*[:=]'

# Find tracked files matching secret patterns:
git ls-files | grep -iE '\.(pem|key|p12|pfx|env|secrets|credentials)$'

# Verify fixture keys aren't real (check key size, expiry):
openssl rsa -in test/fixtures/files/test_certificate.rsa.key.pem -check -noout
```
