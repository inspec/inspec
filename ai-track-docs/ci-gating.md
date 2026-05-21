# CI Gating — Advisory Soft Gate

**Walk Track — Exercise 10**
**Updated:** 2026-05-21

---

## Overview

The `ci-gate-summary` job in `.github/workflows/crawl-track-impact.yml` provides
a **soft, advisory-only CI gate**. It collects evidence from all blocking jobs
and writes a structured evidence table to the GitHub Actions **Job Summary** tab —
visible in every PR and push run.

**Key property**: `continue-on-error: true` — this job **never blocks a PR merge**,
regardless of its own outcome. It is purely informational.

---

## What the Gate Posts

After every push/PR to `learn/walk/**` branches, the job summary shows:

```
## 🔍 CI Evidence Summary — advisory gate (Walk Ex10)

> Non-blocking: this job is informational only.
> PR merges are never blocked by this gate.

### Blocking job results

| Job | Result |
|-----|--------|
| impact-tests (Ruby 3.1/3.2/3.3) | ✅ passed |
| contract-tests | ✅ passed |
| lint (RuboCop 1.86.2) | ✅ clean |
| coverage-baseline | ✅ passed |

### Soft-gate evidence

| Check | Status | Detail |
|-------|--------|--------|
| Unit tests | ✅ passed | 8189 runs |
| Coverage — impact.rb | ✅ above threshold (75%) | 84.75% |

Generated: 2026-05-21T10:15:30Z
```

---

## Where to View the Job Summary

1. Open the GitHub Actions run for any push or PR
2. Click the **CI Gate Summary — advisory** job
3. Scroll to the **Summary** section (or click the **Summary** tab at the top of the run)

Alternatively, view the consolidated summary for the whole run by clicking
the workflow run name and then the **Summary** tab.

---

## Job Design

| Property | Value | Reason |
|----------|-------|--------|
| `needs` | `[impact-tests, contract-tests, lint, coverage-baseline]` | Waits for all blocking jobs to complete |
| `if: always()` | Yes | Runs even if an upstream job fails — ensures evidence is always posted |
| `continue-on-error: true` | Yes | Advisory only — failure here never blocks merge |
| Ruby version | 3.3 | Consistent with lint job |
| Steps | Install gems → run tests → run coverage → write summary | Minimal reproducibility check |

### Steps summary

1. **Install test + coverage gems** — `minitest ~> 6.0`, `simplecov ~> 0.22`
2. **Run unit tests** — captures run count and pass/fail status via `scripts/crawl-track-test.sh`
3. **Run coverage** — captures `impact.rb` line coverage % via `scripts/coverage-impact.rb`
4. **Write job summary** — formats evidence as Markdown table and appends to `$GITHUB_STEP_SUMMARY`
5. **Advisory notice** — emits `::notice::` annotation (not `::error::`) so CI stays green

---

## How to Harden Into a Blocking Gate

When the team is ready to enforce coverage and test thresholds:

### Step 1 — Remove `continue-on-error`

In `.github/workflows/crawl-track-impact.yml`, change:

```yaml
  ci-gate-summary:
    continue-on-error: true   # remove or set to false
```

### Step 2 — Add an explicit failure step

```yaml
      - name: Fail if coverage below threshold
        if: steps.coverage.outputs.status != '✅ above threshold (75%)'
        run: |
          echo "::error::Coverage below 75% — see job summary for details."
          exit 1
```

### Step 3 — Raise the coverage threshold

In `scripts/coverage-impact.rb`:

```ruby
MIN_COVERAGE = 85   # raise from 75 once baseline is stable
```

### Step 4 — Add branch protection

In GitHub repo settings → Branches → Add rule:
- Branch name pattern: `main`
- ✅ Require status checks to pass: `CI Gate Summary — advisory`
- ✅ Do not allow bypassing the above settings

---

## Current Thresholds

| Metric | Current threshold | Current baseline | Status |
|--------|------------------|-----------------|--------|
| `impact.rb` line coverage | 75% | 84.75% | ✅ 9.75% headroom |
| Unit test runs | N/A (advisory) | 8189 runs | ✅ |
| Contract tests | blocking (separate job) | 16 tests, 42 assertions | ✅ |

---

## Files Changed (Ex10)

| File | Change |
|------|--------|
| `.github/workflows/crawl-track-impact.yml` | Added `ci-gate-summary` job (advisory, `continue-on-error: true`) |
| `ai-track-docs/ci-gating.md` | This file (new) — hardening guide + evidence reference |
