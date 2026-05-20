# Security & Secrets Hygiene — InSpec

**Updated:** 2026-05-20  
**Scope:** repo-wide hygiene; `lib/inspec/impact.rb` specific notes

---

## Threat Model (scope of this doc)

| Threat | Likelihood | Mitigation |
|--------|-----------|------------|
| Secret committed to git accidentally | Medium | `.gitignore` patterns + pre-commit hook |
| Hardcoded credential in source code | Low (found none in lib/) | Regular grep scan |
| Auth token in test fixture | Low (found `FAKETOKEN` — safe) | Verify fakes stay fake |
| MCP/IDE config with embedded token | Medium | Added `mcp.json` to `.gitignore` |

---

## Changes Made (Exercise 8)

### 1. `.gitignore` expanded with secret file patterns

Patterns added in the `# Secret / credential hygiene` block:

| Pattern | Why |
|---------|-----|
| `.env`, `.env.*` | dotenv files frequently hold API keys |
| `*.pem`, `*.p12`, `*.pfx`, `*.key` | TLS/SSH private keys |
| `id_rsa`, `id_ed25519`, `id_dsa`, `id_ecdsa` | SSH identity files |
| `*.ovpn` | VPN configs may include inline certs/keys |
| `.aws/credentials`, `.aws/config` | AWS credential files |
| `mcp.json` | IDE/MCP server config — can embed auth tokens |
| `config/secrets.yml`, `config/master.key` | Rails-style secrets |

> `.env.example` is **explicitly not ignored** (`!.env.example`) so safe template
> files can still be committed.

### 2. `mcp.json` identified as concrete risk

`mcp.json` exists in the repo root and contains server URLs/config for the
Atlassian MCP integration. If a user adds bearer tokens to this file locally,
it would have been committed without the new ignore rule.

**Action:** `mcp.json` added to `.gitignore`. If you need to share server config,
create `mcp.json.example` with placeholder values instead.

---

## Scan Results

### Hardcoded secrets in `lib/` — NONE found

```bash
grep -rn "password\|secret\|token\|api_key" lib/ --include="*.rb" \
  | grep -v "#\|desc\|option\|:password\|:token\|:secret"
# → no real credentials found
```

### Test fixtures — safe fake tokens only

`lib/plugins/inspec-habitat/test/unit/profile_test.rb` contains:
```ruby
"auth_token" => "FAKETOKEN"
```
This is intentional — a placeholder for unit testing. ✅

`lib/plugins/inspec-compliance/` references tokens via `ENV["HAB_AUTH_TOKEN"]`
and config objects — no hardcoded values. ✅

---

## Ongoing Security Practices

### Pre-commit scan (recommended)
```bash
# Install detect-secrets (Python)
pip install detect-secrets
detect-secrets scan > .secrets.baseline
detect-secrets audit .secrets.baseline

# Or use truffleHog
trufflehog git file://. --since-commit HEAD --only-verified
```

### Before every PR — checklist
- [ ] No `.env` files staged (`git status` should not show them)
- [ ] No `*.pem` / `*.key` files staged
- [ ] No real tokens/passwords in test fixtures (fakes only)
- [ ] `git log --all --full-history -- '*.pem' '*.key' '.env'` returns nothing

### If a secret is accidentally committed
```bash
# Immediately rotate the exposed credential (don't just delete the file)
# Then remove from history:
git filter-repo --path <secret-file> --invert-paths
# Force push and notify the team
```

---

## Notes on `Inspec::Impact`

`lib/inspec/impact.rb` handles only numeric score data — no auth, no I/O,
no secrets. No security action needed for this module specifically.

---

## References

- [GitHub: Removing sensitive data](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository)
- [detect-secrets](https://github.com/Yelp/detect-secrets)
- [gitignore.io](https://www.toptal.com/developers/gitignore) for language-specific templates
