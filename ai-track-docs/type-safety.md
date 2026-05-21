# Type Safety / Static Analysis — Walk Ex14

## Overview

Walk Ex14 adds a **scoped strict static analysis gate** for `lib/inspec/impact.rb`.
A dedicated RuboCop configuration (`.rubocop-strict-impact.yml`) enforces tighter
quality thresholds on this module only, with zero impact on the rest of the codebase.
A new CI job (`lint-strict-impact`) gates every push to `learn/walk/**` branches.

---

## What Changed

### New: `.rubocop-strict-impact.yml`

Inherits from `.rubocop.yml` but applies to `lib/inspec/impact.rb` exclusively:

| Cop | Repo-wide limit | Strict limit | Rationale |
|-----|-----------------|--------------|-----------|
| `Metrics/MethodLength` | 22 | **15** | impact.rb has no framework boilerplate that legitimately inflates line count |
| `Metrics/AbcSize` | 20 | **15** | Pure-logic module — ABC growth signals a method is accumulating branches |
| `Metrics/CyclomaticComplexity` | 7 (default) | **5** | Most helpers have CC ≤ 3; a CC > 5 signals a design problem worth addressing |
| `Metrics/PerceivedComplexity` | 8 (default) | **5** | Mirrors CC limit; divergence between CC and PC is itself a signal |

### Fix Applied: `build_log_entry` extraction (CyclomaticComplexity)

`log_impact` and `warn_impact` previously contained duplicated Hash-building logic,
inflating both their ABC and CC scores above the strict limits.

**Before** (duplicated in both methods):
```ruby
entry = { op: op, ... }
entry[:input]  = input  unless input.nil?
entry[:result] = result unless result.nil?
Inspec::Log.debug(entry.map { |k,v| ... }.then { ... })
```

**After** (shared helper):
```ruby
# Extracted private class method
def self.build_log_entry(**fields)
  fields.compact
        .map { |key, val| "\"#{key}\":#{json_value(val)}" }
        .then { |parts| "{#{parts.join(',')}}" }
end

# Callers simplified to one line each
Inspec::Log.debug(build_log_entry(op: op, status: status, ...))
Inspec::Log.warn(build_log_entry(op: op, reason: reason, ...))
```

Also applied: `Hash#compact` instead of `reject { |_, v| v.nil? }` — flagged by
`Style/CollectionCompact` (auto-correctable, high signal, zero-risk fix).

---

## Suppressions Decision Log

Suppressions are declared via `AllowedMethods` in `.rubocop-strict-impact.yml`,
**not** as inline `rubocop:disable` comments. This keeps source code clean while
centralising the decision audit trail in the config file.

| Method | Cop suppressed | Measured value | Rationale | Approved |
|--------|----------------|----------------|-----------|---------|
| `impact_from_string` | `Metrics/MethodLength` | 20 lines | 5 irreducible branches (nil-guard → type-guard → strict-numeric reject → numeric passthrough → key lookup), each with its own observability call. Splitting into sub-helpers would obscure the decision tree. | Walk Ex14 |
| `impact_from_string` | `Metrics/AbcSize` | 17.4 | Same branching as above inflates ABC. The public API contract requires all 5 branches in one method for caller clarity. | Walk Ex14 |
| `string_from_impact` | `Metrics/MethodLength` | 16 lines | 3 mandatory guard phases (type, range, boundary), each with a log/warn call. The observability calls add lines without adding logical complexity; their arguments still count in ABC so extracting them does not help. | Walk Ex14 |
| `string_from_impact` | `Metrics/AbcSize` | 16.3 | Same three guard phases; range check adds ABC through the comparison and condition. | Walk Ex14 |

### Not Suppressed (fixed)

| Method | Cop | Was | Now | Fix |
|--------|-----|-----|-----|-----|
| `log_impact` | `Metrics/CyclomaticComplexity` | 6 | 3 | Extracted `build_log_entry` |
| `log_impact` | `Metrics/PerceivedComplexity` | 6 | 3 | Same extraction |
| `warn_impact` | `Metrics/AbcSize` | 12.3 | ~5 | Same extraction |
| `build_log_entry` | `Style/CollectionCompact` | — | clean | Applied `compact` |

---

## CI Job: `lint-strict-impact`

Added to `.github/workflows/crawl-track-impact.yml`:

```yaml
lint-strict-impact:
  name: "Strict static analysis — impact.rb (Walk Ex14)"
  runs-on: ubuntu-latest
  steps:
    - uses: actions/checkout@v4
    - uses: ruby/setup-ruby@v1
      with: { ruby-version: "3.3" }
    - run: gem install rubocop -v '1.86.2' --no-document
    - run: rubocop lib/inspec/impact.rb --config .rubocop-strict-impact.yml --format simple
```

**Scope:** `lib/inspec/impact.rb` only — the strict config excludes all other paths
via `AllCops.Exclude: ['**/*']` with `Include` overriding for the impact module.

**Non-blocking paths:** The `ci-gate-summary` advisory job includes this result but
the job itself is a **blocking** check (no `continue-on-error`). The intent is that
impact.rb must stay clean to merge into walk/** branches.

---

## How to Run Locally

```bash
# Standard lint (repo-wide)
rubocop lib/inspec/impact.rb --format simple

# Strict lint (impact module only)
rubocop lib/inspec/impact.rb --config .rubocop-strict-impact.yml --format simple

# See all cops in effect for the strict config
rubocop lib/inspec/impact.rb --config .rubocop-strict-impact.yml --show-cops
```

---

## Adding a New Suppression

1. Run the strict config locally and identify the violation.
2. Determine whether it can be fixed (prefer fix over suppression).
3. If suppression is justified, add the method name to `AllowedMethods` in
   `.rubocop-strict-impact.yml` with a rationale comment.
4. Add a row to the suppressions table above.
5. Include the decision in your PR description under "Suppressions documented".

**Do not** use inline `rubocop:disable` comments for impact.rb — they conflict with
the repo-wide config's `Lint/RedundantCopDisableDirective` check.

---

## Verification Evidence (Walk Ex14)

```
=== Strict config (MethodLength ≤ 15, AbcSize ≤ 15, CyclomaticComplexity ≤ 5) ===
rubocop lib/inspec/impact.rb --config .rubocop-strict-impact.yml --format simple
1 file inspected, no offenses detected   ✅

=== Base config (MethodLength ≤ 22, AbcSize ≤ 20) ===
rubocop lib/inspec/impact.rb --format simple
1 file inspected, no offenses detected   ✅

=== Unit tests (FLAG OFF) ===
INSPEC_IMPACT_STRICT_NUMERIC=0 ... bash scripts/crawl-track-test.sh
✔ Unit tests passed (2482 runs) | All 4 checks passed   ✅

=== Unit tests (FLAG ON) ===
INSPEC_IMPACT_STRICT_NUMERIC=1 ... bash scripts/crawl-track-test.sh
✔ Unit tests passed (2508 runs) | All 4 checks passed   ✅
```
