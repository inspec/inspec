---
# Copilot Crawl Track — PR #1: Exercises 0–10
# Branch: learn/crawl/mohan-ex10-ci → main
# Drafted with GitHub Copilot assistance
---

## Title
`chore(crawl-track): Exercises 0–10 — InSpec repo orientation, impact.rb improvements, CI script`

---

## Summary

13 commits across 10 exercises building a working mental model of the InSpec repo
and making a series of small, safe improvements to `lib/inspec/impact.rb` — a
36-line pure-Ruby module that maps CVSS 3.0 severity names to float scores.

**Files touched:**
| Path | Change type |
|------|------------|
| `lib/inspec/impact.rb` | bug fix · refactor · validation · logging · frozen_string_literal |
| `test/unit/impact_test.rb` | +5 deterministic tests |
| `scripts/crawl-track-test.sh` | new — standalone CI script (no bundler) |
| `.github/workflows/crawl-track-impact.yml` | new — GHA workflow for crawl branches |
| `.github/instructions/exclude-submodules.instructions.md` | new — Copilot guard |
| `.gitignore` | +15 secret/credential patterns; `mcp.json` added |
| `ai-track-docs/` | 7 new docs: SYSTEM-OVERVIEW, build-test, architecture, extending-impact, perf-baseline, dependencies, logging, security |
| `.copilot-track/` | bootstrap scaffolding + prompts + PR template |

---

## Review Focus

**Please look hardest at these three things:**

1. **`lib/inspec/impact.rb` — bug fixes and validation** (lines 1–130)
   - Ex 2: `IMPACT_SCORES[value]` → `IMPACT_SCORES[value.downcase]` (was silently returning `nil` for uppercase input like `"HIGH"`)
   - Ex 5: `nil` guard on both `impact_from_string` and `string_from_impact` (was crashing with `NoMethodError` / silently returning `"none"`)
   - Confirm the behaviour change is intentional and the error messages are clear

2. **`scripts/crawl-track-test.sh`** — standalone test runner
   - Confirm the Minitest discovery logic handles different Ruby/gem setups
   - Check that `--fast` flag and `RUBY_BIN` override work as documented

3. **`.gitignore` additions**
   - Confirm no pattern accidentally ignores files that *should* be tracked
   - Specifically: `mcp.json` is intentionally ignored (local IDE config)

---

## Changes by Exercise

| Ex | Type | Change | Commit |
|----|------|--------|--------|
| 0 | chore | Bootstrap: `ai-track-docs/`, `.copilot-track/crawl/`, global resources | `1a1da86`, `ff4b8b3`, `5df3388` |
| 1 | docs | Repo orientation + chosen module (`impact.rb`) added to SYSTEM-OVERVIEW | `85c85a4` |
| 2 | **fix** | Bug: uppercase severities returned `nil`; +3 deterministic tests | `5486c51` |
| 3 | refactor | `normalized` var; explicit rescue; self-maintaining error msg; typo fix | `efb5ccb` |
| 4 | docs | YARD docstrings on all methods; `ai-track-docs/extending-impact.md` | `70ed592` |
| 5 | **fix** | Nil guard on both methods; 2 negative tests | `a2202be` |
| 6 | perf | Baseline measurements captured; no code changes | `18c61bb` |
| 7 | docs | Dependency audit; 4 minimal constraint proposals | `e5ba220` |
| 8 | security | `.gitignore` +15 patterns; `mcp.json` risk identified and mitigated | `46e6dfd` |
| 9 | feat | Structured debug logs (`op`/`status`/`elapsed_ms`) + `ai-track-docs/logging.md` | `c3b0dbb` |
| 10 | ci | Local test script + GHA workflow; `frozen_string_literal` fix | `c083d38` |

---

## Test & Risk Evidence

### Test output
```
scripts/crawl-track-test.sh output (Ruby 3.4.8, Apple Silicon):

  ✔ Ruby version OK
  ✔ Unit tests passed (22 runs, 37 assertions, 0 failures, 0 errors)
  ✔ frozen_string_literal present
  ✔ No bare rescue found
  All 4 checks passed
```

### To reproduce locally
```bash
RUBY_BIN=/path/to/ruby bash scripts/crawl-track-test.sh
```

### Performance impact of logging (Ex 9)
Debug logging is gated behind `return unless Inspec::Log.debug?` — zero overhead
at default INFO level. Perf baseline (Ex 6) shows ~985 ns/call for named severity
input; this is unaffected at INFO.

### Risk rating: **LOW**

| Area | Risk | Why |
|------|------|-----|
| `impact_from_string` bug fix | Low | Changes `nil` return → `ImpactError` for uppercase; callers passing valid lowercase strings are unaffected |
| `nil` validation | Low | Changes `NoMethodError`/silent `"none"` → `ImpactError`; callers never pass `nil` (no existing tests for `nil` input existed) |
| Logging addition | Low | No-op at INFO; only activates at DEBUG |
| `.gitignore` additions | Low | Additive only; no tracked files match new patterns |
| CI workflow | Low | Triggers only on `learn/crawl/**` branches; no effect on main CI |

---

## Rollback

Each exercise is a separate signed commit — any can be reverted independently:

```bash
# Revert a single exercise
git revert <commit-SHA>

# Revert all Crawl Track changes at once
git revert main..HEAD --no-commit
git commit -m "revert: roll back Crawl Track exercises 0-10"
```

**Fastest rollback for production risk:**
```bash
# Only the two bug fixes touch production behaviour
git revert 5486c51  # Ex 2: uppercase bug
git revert a2202be  # Ex 5: nil validation
```

---

## Track Metadata
- **Level:** crawl
- **Exercises:** 0–10
- **Evidence:** test output above · `ai-track-docs/perf-baseline.md` · `ai-track-docs/security.md`
- **AI assistance:** GitHub Copilot (claude-sonnet-4.6) used throughout per Progress AI policy
