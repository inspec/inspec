# Dependency Hygiene Notes — InSpec

**Updated:** 2026-05-20  
**Scope:** `inspec-core.gemspec`, `inspec.gemspec`, `Gemfile`  
**Policy:** document, note risks, propose minimal constraints — no major upgrades.

---

## Ruby Version

| Constraint | File | Locked |
|-----------|------|--------|
| `>= 3.1.0` | both gemspecs | CI runs 3.2.x; dev machine 3.4.8 |

> ⚠️ **RVM/rbenv conflict noted locally.** Gems with native extensions compiled
> under rbenv 3.4.8 fail to load under rvm 3.2.5. Use one version manager.
> A `.ruby-version` file would enforce the correct version automatically.

**Proposal:** Add `.ruby-version` pinning the version used in CI (e.g. `3.2.5`)
to prevent silent cross-version native-ext failures. Zero dependency change required.

---

## Critical Runtime Dependencies

### Transport layer

| Gem | Constraint | Locked | Risk if changed |
|-----|-----------|--------|----------------|
| `train-core` | `~> 3.16, >= 3.16.1` | 3.16.3 | **High** — core SSH/local transport; minor bumps are safe, majors are not |
| `train` | `~> 3.16, >= 3.16.1` | 3.16.3 | **High** — adds WinRM/AWS/Habitat transports; keep in sync with train-core |
| `train-winrm` | `~> 0.4.0` | 0.4.3 | Medium — pinned at patch level; comment in gemspec notes SOCKS5h changes in 0.4.0 |
| `train-aws` | `~> 0.2` | 0.2.44 | Medium |
| `train-kubernetes` | `>= 0.3.1` | 0.3.1 | Low — lower bound only; **recommend adding upper bound** `< 1.0` |

### Licensing / commercial gating

| Gem | Constraint | Locked | Risk |
|-----|-----------|--------|------|
| `chef-licensing` | `>= 1.2.0` | 1.4.0 | **High** — no upper bound; a breaking major would gate all commands silently. **Recommend adding `< 2.0`** |
| `license-acceptance` | `>= 0.2.13, < 3.0` | — | Medium — already has upper bound ✅ |

### CLI / parsing

| Gem | Constraint | Locked | Risk |
|-----|-----------|--------|------|
| `thor` | `>= 0.20, < 1.5.0` | 1.4.0 | Medium — upper bound approaching locked version; watch for 1.5 release |
| `parslet` | `>= 1.5, < 3.0` | 2.0.0 | Medium — comment in gemspec references issue #5389; constraint is intentional |
| `rspec` | `>= 3.9, <= 3.14` | 3.13.2 | Low — tightly bounded ✅ |

### UI / output

| Gem | Constraint | Locked | Risk |
|-----|-----------|--------|------|
| `tty-prompt` | `~> 0.17` | 0.23.1 | Low — pessimistic lock covers patch/minor |
| `tty-table` | `~> 0.10` | — | Low |

### Networking

| Gem | Constraint | Locked | Risk |
|-----|-----------|--------|------|
| `faraday` | `>= 1, < 3` | 1.10.5 | Medium — wide range; v2 is a breaking API change; **recommend tightening to `~> 1.10`** |
| `faraday_middleware` | `~> 1.2, >= 1.2.1` | — | Low — tightly bounded ✅ |

---

## Proposed Minimal Constraints (no upgrades required)

These tighten existing loose bounds to reduce surprise breakage. No version bumps needed.

| # | File | Gem | Current | Proposed | Reason |
|---|------|-----|---------|----------|--------|
| 1 | `inspec-core.gemspec` | `chef-licensing` | `>= 1.2.0` | `>= 1.2.0, < 2.0` | No upper bound; major could silently gate all commands |
| 2 | `inspec-core.gemspec` | `train-kubernetes` | `>= 0.3.1` | `>= 0.3.1, < 1.0` | No upper bound; pre-1.0 semver is unstable |
| 3 | `inspec-core.gemspec` | `faraday` | `>= 1, < 3` | `~> 1.10` | Faraday v2 changed middleware API; current lock is 1.10.5 |
| 4 | repo root | `.ruby-version` | (missing) | `3.2.5` | Prevents native-ext mismatch between rvm and rbenv |

> All proposals are **additive constraints only** — they do not change the installed
> version today, they only prevent a future `bundle update` from jumping to a breaking release.

---

## Module-Level Note (`lib/inspec/impact.rb`)

`Inspec::Impact` has **zero gem dependencies** — it only requires `inspec/errors`
(part of this repo). No dependency hygiene action needed for this specific module.
It will remain safe across all dependency updates.

---

## How to Audit Dependencies

```bash
# Show all outdated gems (read-only, no changes)
bundle outdated

# Check for known vulnerabilities
gem install bundler-audit
bundle audit check --update
```

---

## References

- `inspec-core.gemspec` — core runtime dependencies
- `inspec.gemspec` — transport + integration dependencies  
- `Gemfile` — development/test overrides
- `Gemfile.lock` — locked versions (never edit manually)
