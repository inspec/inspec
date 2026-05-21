# PR Hygiene — Review Focus Discipline

**Walk Track — Exercise 11**
**Updated:** 2026-05-21

---

## Overview

A review-ready PR tells the reviewer **what to look at**, **how to verify it**,
and **how to roll back** — before they ask. This discipline reduces review
round-trips and surfaces risks that automated checks miss.

Walk track standard: every PR must include:
1. **3–5 review focus bullets** (what + why + verify command per bullet)
2. **Runnable verification steps** (copy-paste commands)
3. **Clear rollback** (a single command, not a description)

---

## Quick Start — Auto-generate Review Focus

```bash
# From your feature branch, after committing:
ruby scripts/pr-review-focus.rb                  # diff against HEAD~1
ruby scripts/pr-review-focus.rb HEAD~3..HEAD     # multi-commit range
ruby scripts/pr-review-focus.rb --full           # include full PR template sections
```

The script analyses `git diff` for `lib/inspec/impact.rb` and `test/unit/impact_test.rb`,
detects change categories, and generates tailored review bullets with verify commands.

**Always review and adjust the output** — the generator is a starting point, not a
final answer. Add context about *why* this specific change matters in this PR.

---

## Review Focus Bullet Formula

Each bullet follows this structure:

```
- [ ] **<area>** — <what changed and why it's the key risk>
  - Verify: `<command the reviewer can run>`
```

**Good bullet (specific, actionable):**
```
- [ ] **Observability hooks (`warn_impact`)** — WARN hooks fire at INFO log level;
  visible without debug mode. Verify toggle suppresses output and mid-band scores
  do NOT trigger WARN.
  - Verify: `ruby -I lib -e "require 'inspec/impact'; Inspec::Impact.string_from_impact(0.75)"`
```

**Bad bullet (vague, not actionable):**
```
- [ ] Check the logging changes
```

---

## Review Focus Categories for `impact.rb`

| Category | When to include | Verify command |
|----------|----------------|---------------|
| **Constants / data** | `IMPACT_SCORES` or `BOUNDARY_SCORES` changed | `ruby -e "require_relative 'lib/inspec/impact'; p Inspec::Impact::IMPACT_SCORES"` |
| **Public API** | `impact_from_string` / `string_from_impact` changed | Round-trip assertion (see below) |
| **Type guards** | `assert_type!` / `ImpactError` paths changed | Nil + wrong-type input test |
| **Observability** | `warn_impact` / `log_impact` / toggle changed | Boundary score + mid-band score |
| **Private helpers** | `number?` / `json_value` / `elapsed_ms_since` changed | Full test suite |
| **New tests** | Tests added | Determinism check, AAA structure review |
| **Coverage delta** | Any code change | `ruby scripts/coverage-impact.rb` |
| **Contract** | Data constants changed | `ruby -I lib test/contract/impact_contract_test.rb` |

---

## Standard Verification Steps Block

Paste this into every Walk PR (fill in branch name):

```bash
# 1. Checkout and install minimal deps
git checkout <branch>
gem install minitest -v "~> 6.0" --no-document

# 2. Run all track checks (4 checks: ruby version, tests, frozen_string_literal, bare rescue)
RUBY_BIN=$(which ruby) bash scripts/crawl-track-test.sh

# 3. Contract tests (golden file + API shape)
ruby -I lib test/contract/impact_contract_test.rb

# 4. Coverage (must be ≥ 75%, baseline 81.71%)
ruby scripts/coverage-impact.rb

# 5. Lint (RuboCop 1.86.2 pinned)
rubocop lib/inspec/impact.rb test/unit/impact_test.rb --format simple
```

---

## Rollback Standard

Every PR must include a single rollback command:

```
- Rollback: `git revert <commit SHA>`
```

For feature flags:
```
- Rollback: `Inspec::Impact.logging_enabled = false`  (zero-deploy toggle)
```

For dependency changes:
```
- Rollback: pin back `rubocop: 1.86.1` in .github/workflows/crawl-track-impact.yml
```

**Never write "just revert the PR"** — give the exact command so a reviewer on
call can act in 30 seconds without context.

---

## Walk Exercise PR Review Focus Examples

### Ex6 — Performance (before/after evidence pattern)
```
- [ ] **`number?` regex replacement** — replaces exception-based control flow with
  `NUMERIC_RE` regex. Verify the true (numeric) path isn't regressed; the hot path
  (named severity) should be ≥ 4× faster.
  - Verify: `ruby -I lib -e "require 'inspec/impact'; 10_000.times { Inspec::Impact.impact_from_string('high') }"`
```

### Ex8 — Security (false positive justification pattern)
```
- [ ] **`.gitleaks.toml` allowlist entries** — each allowlist entry must have a
  documented justification. Review the table in `ai-track-docs/security.md` to
  confirm no real credentials are suppressed.
  - Verify: `ruby scripts/secret-scan.rb lib/inspec/ lib/plugins/`
```

### Ex9 — Observability (WARN level visibility pattern)
```
- [ ] **WARN hooks on error paths** — errors now emit WARN (visible at INFO level)
  before raising ImpactError. Confirm the error is still raised; WARN is additional, not replacement.
  - Verify: `ruby -I lib -e "require 'inspec/impact'; Inspec::Impact.impact_from_string('bad') rescue puts $!.class"`
```

---

## Files Added / Changed (Ex11)

| File | Change |
|------|--------|
| `.copilot-track/walk/pr-template.md` | Enhanced: added structured review focus section + verification steps block |
| `scripts/pr-review-focus.rb` (new) | Generator: detects change categories from `git diff`, outputs tailored review bullets |
| `ai-track-docs/pr-hygiene.md` | This file (new) — discipline doc, examples, rollback standard |
