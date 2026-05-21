# Security & Secrets Hygiene — InSpec

**Updated:** 2026-05-21 (Walk Ex8 — gitleaks CI + local scan script added)
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

## Walk Ex8 Security Scan Improvements (2026-05-21)

### Tools added

| Tool | Where | Purpose |
|------|-------|---------|
| `gitleaks/gitleaks-action@v2` | `.github/workflows/crawl-track-impact.yml` | CI secret scan on every `learn/walk/**` push |
| `scripts/secret-scan.rb` | Repo root | Lightweight local scan (no external install) |
| `.gitleaks.toml` | Repo root | Gitleaks config with allowlist for known-safe patterns |

### Local scan usage

```bash
# Scan track files (default targets)
ruby scripts/secret-scan.rb

# Scan broader lib/
ruby scripts/secret-scan.rb lib/inspec/ lib/plugins/

# Exit 0 = clean; exit 1 = findings requiring review
```

### Scan results (Walk Ex8)

**Track files (30 files):** 0 raw matches ✅

**Broader lib/ scan (483 files):** 5 raw matches → 5 suppressed by documented allowlist ✅

| File | Finding | Verdict | Justification |
|------|---------|---------|--------------|
| `lib/inspec/resources/users.rb:536` | `passwd = parse_passwd_line(...)` | ✅ False positive | `passwd` is a local variable holding a parsed `/etc/passwd` struct — no credential value |
| `lib/inspec/resources/users.rb:682` | `passwd = parse_passwd_line(...)` | ✅ False positive | Same as above |
| `lib/plugins/inspec-compliance/README.md:326` | `COMPLIANCE_ACCESSTOKEN='mycompliancetoken'` | ✅ False positive | Explicit documentation placeholder — value is `mycompliancetoken` |
| `lib/plugins/inspec-compliance/lib/inspec-compliance/api.rb:185` | `config["refresh_token"]` | ✅ False positive | Reads token from config object — no hardcoded value |

All four false positives are documented in `scripts/secret-scan.rb` ALLOWLIST and in `.gitleaks.toml`.

### CI gitleaks config

Gitleaks uses `.gitleaks.toml` which:
- Extends the default upstream ruleset
- Allows `test/fixtures/**` paths (controlled mock data)
- Allows `.github/workflows/**` (safe `secrets.GITHUB_TOKEN` references)
- Allows `ai-track-docs/security.md` (discusses patterns, not values)

### How to update allowlists

If a new false positive appears in CI:
1. Identify the finding in the gitleaks job output
2. Add an allowlist entry to `.gitleaks.toml` (paths or regexes section)
3. For the local script, add a lambda to the `ALLOWLIST` array in `scripts/secret-scan.rb`
4. Document the justification in this file's table above

---

## Ongoing Security Practices

### Running scans locally

```bash
# Fast track scan (no install needed)
ruby scripts/secret-scan.rb

# Full repo scan (if gitleaks installed)
gitleaks detect --config .gitleaks.toml --source . --no-git

# Legacy truffleHog (Chef main CI uses this on main branch)
trufflehog git file://. --since-commit HEAD --only-verified
```

### Before every PR — checklist
- [ ] No `.env` files staged (`git status` should not show them)
- [ ] No `*.pem` / `*.key` files staged
- [ ] No real tokens/passwords in test fixtures (fakes only)
- [ ] `ruby scripts/secret-scan.rb` exits 0
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
