# Backlog — InSpec Impact Module: Hardening & Observability Epic

**Walk Track — Exercise 12**
**Created:** 2026-05-21
**Epic scope:** `lib/inspec/impact.rb` and supporting track infrastructure

---

## Epic Summary

> **"InSpec Impact Module — Hardening and Observability"**
>
> Five actionable improvements identified during Walk track exercises Ex1–Ex11.
> Each item has clear acceptance criteria, links to the relevant code path,
> and noted dependencies. Items are ordered by recommended implementation sequence.

**Why this matters:**
The impact module is InSpec's CVSS severity mapping core — used on every control
evaluation. Small improvements here have high leverage: better reliability,
faster feedback, and lower on-call burden across all InSpec users.

---

## WALK-01 · Raise and Enforce the Coverage Threshold

**Source exercise:** Ex2 (Coverage Surfacing), Ex10 (CI Gate)
**Effort:** Small (~1–2h) | **Priority:** High

### Goal
The CI gate uses `MIN_COVERAGE = 75` but the actual baseline is **81.71%** (8189 run suite).
The 6.71 percentage-point gap means coverage can regress silently before CI objects.
Raise the threshold to match the baseline and make the gate blocking.

### Acceptance Criteria
- [ ] `MIN_COVERAGE` in `scripts/coverage-impact.rb` raised to `82` (or current run value, whichever is higher)
- [ ] `ci-gate-summary` job in `.github/workflows/crawl-track-impact.yml` changed to `continue-on-error: false`
- [ ] A branch protection rule requires `CI Gate Summary — advisory` to pass before merging
- [ ] A PR that intentionally drops coverage below the new threshold is demonstrably blocked (evidence in PR)
- [ ] `ai-track-docs/ci-gating.md` hardening guide updated to reflect the gate is now active

### Code Paths
- [`scripts/coverage-impact.rb` line 18](scripts/coverage-impact.rb) — `MIN_COVERAGE = 75`
- [`.github/workflows/crawl-track-impact.yml`](.github/workflows/crawl-track-impact.yml) — `ci-gate-summary` job → `continue-on-error: true`
- [`ai-track-docs/ci-gating.md`](ai-track-docs/ci-gating.md) — Step 1–3 hardening guide

### Dependencies
None — safe to start immediately.

---

## WALK-02 · Add Schema Version to the Impact Contract Golden File

**Source exercise:** Ex5 (Contract Hardening)
**Effort:** Small (~1–2h) | **Priority:** Medium

### Goal
`test/fixtures/impact_scores_golden.json` has no schema version field.
When `IMPACT_SCORES` is intentionally updated, there is no structured signal
confirming the golden file was deliberately regenerated vs. accidentally overwritten.
A `"schema_version"` field makes intent explicit and enables future migration tooling.

### Acceptance Criteria
- [ ] `test/fixtures/impact_scores_golden.json` gains `"schema_version": "1"` and `"last_updated": "<ISO-8601>"`
- [ ] `scripts/update-impact-contract.rb` auto-increments `schema_version` and writes `last_updated` on every regeneration
- [ ] `test/contract/impact_contract_test.rb` asserts `schema_version` is present and matches constant `EXPECTED_SCHEMA_VERSION = "1"`
- [ ] Contract failure message includes: _"If IMPACT_SCORES changed intentionally, run: `ruby scripts/update-impact-contract.rb`"_
- [ ] `ai-track-docs/build-test.md` updated with schema version change workflow

### Code Paths
- [`test/fixtures/impact_scores_golden.json`](test/fixtures/impact_scores_golden.json) — golden data (no version field currently)
- [`test/contract/impact_contract_test.rb`](test/contract/impact_contract_test.rb) — assertions, lines 1–60
- [`scripts/update-impact-contract.rb`](scripts/update-impact-contract.rb) — regeneration script
- [`ai-track-docs/build-test.md`](ai-track-docs/build-test.md) — contract update section

### Dependencies
None — can be parallelised with WALK-01.

---

## WALK-03 · Extend Secret Scanner to Full Repo with CI Report

**Source exercise:** Ex8 (Security Scan)
**Effort:** Medium (~3–4h) | **Priority:** Medium

### Goal
`scripts/secret-scan.rb` scans only 30 track files by default. The full-repo
scan (483 files) was run ad-hoc in Ex8, finding 5 false positives — all documented.
Automate the full-repo scan so new false positives are caught before merge.

### Acceptance Criteria
- [ ] `scripts/secret-scan.rb` default scan targets expanded to `lib/` and `lib/plugins/`
- [ ] Script accepts `--help` flag printing usage and default scan directories
- [ ] CI `secret-scan` job runs `scripts/secret-scan.rb` as a pre-flight check before gitleaks
- [ ] All 5 previously identified false positives remain in the allowlist with documented justifications
- [ ] `ai-track-docs/security.md` updated: new default scope, `--help` output, updated scan result table

### Code Paths
- [`scripts/secret-scan.rb`](scripts/secret-scan.rb) — `SCAN_TARGETS` constant; `ALLOWLIST` array
- [`.gitleaks.toml`](.gitleaks.toml) — reference for rule alignment
- [`.github/workflows/crawl-track-impact.yml`](.github/workflows/crawl-track-impact.yml) — `secret-scan` job steps
- [`ai-track-docs/security.md`](ai-track-docs/security.md) — false-positive table and scan scope

### Dependencies
**WALK-01 must merge first** — ensures CI is blocking before adding another enforcement check.

---

## WALK-04 · Add In-Memory Metrics Counter for Impact Resolution Events

**Source exercise:** Ex9 (Observability)
**Effort:** Medium (~3–5h) | **Priority:** Low-Medium

### Goal
`warn_impact` and `log_impact` emit log strings that are hard to aggregate at scale.
In production InSpec profiles (hundreds of controls), knowing _how many_ boundary-score
hits or invalid-severity calls occurred requires parsing log strings. A lightweight
in-memory counter enables structured per-run reporting.

### Acceptance Criteria
- [ ] `Inspec::Impact.metrics` returns a frozen Hash:
  ```ruby
  { calls: Integer, errors: Integer, boundary_hits: Integer, warn_emits: Integer }
  ```
- [ ] Counters increment on every `impact_from_string` / `string_from_impact` call
- [ ] `Inspec::Impact.reset_metrics!` clears all counters (required for test isolation)
- [ ] Counter increments are independent of `logging_enabled?` toggle (metrics always collected)
- [ ] Thread-safe: counter mutations use `Mutex` or Ruby's atomic integer pattern
- [ ] New unit tests cover: counter increments per code path, `reset_metrics!`, toggle-off does not suppress counts
- [ ] `ai-track-docs/observability.md` updated with `metrics` API reference and `reset_metrics!` usage

### Code Paths
- [`lib/inspec/impact.rb`](lib/inspec/impact.rb) — `warn_impact` (line ~183), `log_impact` (line ~202), module-level `@logging_enabled`
- [`test/unit/impact_test.rb`](test/unit/impact_test.rb) — new `metrics counter` describe block
- [`ai-track-docs/observability.md`](ai-track-docs/observability.md) — log format and fields reference

### Dependencies
**WALK-01 must merge first** (blocking CI). WALK-05 is a soft dependency (easier review once gate enforced).

---

## WALK-05 · CODEOWNERS + Required PR Review for Impact Module

**Source exercise:** Ex11 (PR Hygiene)
**Effort:** Small (~1h) | **Priority:** Medium

### Goal
`scripts/pr-review-focus.rb` and the enhanced PR template exist but are not enforced.
Adding `CODEOWNERS` rules and a repo-level PR template ensures every contributor
follows the review focus discipline without manual policing.

### Acceptance Criteria
- [ ] `.github/CODEOWNERS` updated: `lib/inspec/impact.rb` and `test/unit/impact_test.rb` require 1 approver from a nominated reviewer handle
- [ ] `.github/pull_request_template.md` updated (or created) with the Walk PR template structure from `.copilot-track/walk/pr-template.md`
- [ ] `scripts/pr-review-focus.rb` referenced in `CONTRIBUTING.md` Walk section and project `README.md` quick-start
- [ ] `ai-track-docs/pr-hygiene.md` linked from `CONTRIBUTING.md`
- [ ] Verified: a new PR without a review focus section shows the GitHub template prompt

### Code Paths
- [`.github/CODEOWNERS`](.github/CODEOWNERS) — ownership rules (create if missing)
- [`.copilot-track/walk/pr-template.md`](.copilot-track/walk/pr-template.md) — source template (Ex11)
- [`CONTRIBUTING.md`](CONTRIBUTING.md) — Walk workflow section (added in Ex4)
- [`ai-track-docs/pr-hygiene.md`](ai-track-docs/pr-hygiene.md) — discipline reference (Ex11)

### Dependencies
**WALK-01 must merge first** — CODEOWNERS reviews are most useful once CI baseline is enforced.

---

## Dependency Map

```
WALK-01 (Coverage + CI Gate) ──┬──────────────────────────────────────────► merge
                               │
WALK-02 (Contract version) ────┼──────────────────────────────────────────► merge (parallel)
                               │
                               ├── WALK-03 (Scanner full-repo) ────────────► merge
                               │
                               ├── WALK-05 (CODEOWNERS + PR template) ─────► merge
                               │       │
                               └───────└── WALK-04 (Metrics counter) ───────► merge
```

**Recommended merge order:** WALK-02 → WALK-01 → WALK-03 → WALK-05 → WALK-04

---

## Summary Table

| ID | Title | Effort | Priority | Depends on |
|----|-------|--------|----------|-----------|
| WALK-01 | Raise + enforce coverage threshold | Small | **High** | — |
| WALK-02 | Contract golden file schema version | Small | Medium | — |
| WALK-03 | Extend secret scanner to full repo | Medium | Medium | WALK-01 |
| WALK-04 | Structured metrics counter | Medium | Low-Med | WALK-01 |
| WALK-05 | CODEOWNERS + required PR review | Small | Medium | WALK-01 |

---

## How to Use This Backlog

1. Pick the top-priority unblocked item
2. Create a branch chained from the current Walk head:
   `git checkout -b learn/walk/mohan-exN-<slug>`
3. Write a plan before touching code (Walk discipline)
4. Use acceptance criteria as your definition of done
5. Use `ruby scripts/pr-review-focus.rb` to generate the PR review focus section

