# Commit Message Guide — Crawl Track

## Conventional Commit Format (used in this track)

```
<type>(<scope>): <short summary>

<body — what and why, not how>

<footer: breaking changes, test evidence, rollback>
```

## Type → Conventional Commit mapping

| What you did | Type | Example |
|-------------|------|---------|
| New feature or behaviour | `feat` | `feat(impact): add structured debug logging` |
| Bug fix | `fix` | `fix(impact): uppercase severity names returned nil` |
| Docs only | `docs` | `docs(impact): add YARD docstrings and extending guide` |
| Refactor (no behaviour change) | `refactor` | `refactor(impact): extract normalized var, explicit rescue` |
| Tests only | `test` | `test(impact): add nil boundary negative tests` |
| CI/CD | `ci` | `ci: add GHA workflow for crawl-track branches` |
| Misc housekeeping | `chore` | `chore: bootstrap ai-track-docs scaffolding` |
| Performance | `perf` | `perf(impact): capture benchmark baseline` |
| Security | `security` | `security: add .gitignore patterns for secret files` |

## Proposed improvements to crawl-track commits

| Original | Improved | Why |
|----------|----------|-----|
| `chore: Exercise 0 - bootstrap repo understanding for InSpec` | `chore(crawl): bootstrap ai-track-docs and .copilot-track scaffold` | Drop exercise number from summary; scope to `crawl` |
| `fix+test: Exercise 2 - fix uppercase bug in impact_from_string + 3 new tests` | `fix(impact): uppercase severity names returned nil; add 3 tests` | Separate type from body; describe the bug, not the exercise |
| `refactor: Exercise 3 - readability improvements in impact.rb (behavior-preserving)` | `refactor(impact): extract normalized var, self-maintaining error msg, explicit rescue` | Spell out the actual changes in the summary |
| `feat: Exercise 9 - structured logging for Inspec::Impact` | `feat(impact): add structured debug logging (op/status/elapsed_ms)` | Include the schema fields — reviewers know what to grep for |

## Body checklist (for production PRs)

```
- What changed (the diff summary — 1 line per logical change)
- Why it changed (the motivation)
- Test evidence: "X runs, Y assertions, 0 failures"
- Risk: low/medium/high + one-line justification
- Rollback: git revert <SHA>
```

## Footer keywords

```bash
Fixes: #<issue>          # closes a GitHub issue
Refs: #<issue>           # references without closing
Breaking-change: <desc>  # triggers MAJOR version bump in semver
Rollback: git revert <SHA>
Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>
```

## Example: before vs after

### Before (too vague)
```
fix+test: Exercise 2 - fix uppercase bug in impact_from_string + 3 new tests
```

### After (actionable)
```
fix(impact): uppercase severity names silently returned nil

impact_from_string checked IMPACT_SCORES.key?(value.downcase) but then
looked up IMPACT_SCORES[value] (without downcase). Input like "HIGH" would
pass the guard but return nil.

Fix: change lookup to IMPACT_SCORES[value.downcase].

New tests:
- impact_from_string("HIGH") -> 0.7 (covers the fix)
- impact_from_string("0.5") -> "0.5" (documents passthrough)
- string_from_impact(0.0) -> "none" (boundary case)

Test run: 17 runs, 23 assertions, 0 failures, 0 errors, 0 skips
Risk: low — callers using lowercase strings are unaffected
Rollback: git revert <SHA>
```
