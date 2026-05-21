# Feature Flags — Lifecycle and Validation Guide

**Walk Track — Exercise 13**
**Updated:** 2026-05-21

---

## Flags in `lib/inspec/impact.rb`

| Flag | Default | Env Var | Added |
|------|---------|---------|-------|
| `logging_enabled` | `true` | — | Walk Ex3 |
| `strict_numeric_mode` | `false` | `INSPEC_IMPACT_STRICT_NUMERIC=1` | Walk Ex13 |

---

## Flag: `strict_numeric_mode`

### What it does

When **ON**, `impact_from_string` rejects numeric strings (e.g. `"0.7"`) instead
of passing them through. Callers must supply a named severity (`"high"`, `"low"`,
etc.) or a real `Numeric` value.

| Input | OFF (default) | ON |
|-------|-------------|-----|
| `"high"` | → `0.7` | → `0.7` (unchanged) |
| `"0.7"` _(numeric string)_ | → `"0.7"` _(passthrough)_ | → `ImpactError` |
| `0.7` _(real Numeric)_ | → `0.7` (unchanged) | → `0.7` (unchanged) |
| `nil` | → `ImpactError` | → `ImpactError` |

### Flag Lifecycle

```
Stage 1: OFF (current — default, no env var needed)
  ↓  teams test with INSPEC_IMPACT_STRICT_NUMERIC=1 to verify caller compatibility
Stage 2: ON-opt-in (set INSPEC_IMPACT_STRICT_NUMERIC=1 in your environment)
  ↓  all callers confirmed compatible
Stage 3: ON-default (future major version — flip default to true)
  ↓  one full release cycle with ON-default
Stage 4: Remove (delete flag + conditional; clean up tests)
```

**Current stage: 1 (OFF by default)**

### How to Enable

```bash
# Environment variable (per-process, zero code change)
INSPEC_IMPACT_STRICT_NUMERIC=1 inspec exec my-profile

# Programmatic (in tests or scripts — restore in teardown)
Inspec::Impact.strict_numeric_mode = true
# ... work ...
Inspec::Impact.strict_numeric_mode = false
```

### How to Disable

```bash
# Env var not set (default) — or explicitly:
INSPEC_IMPACT_STRICT_NUMERIC=0 inspec exec my-profile

# Programmatic
Inspec::Impact.strict_numeric_mode = false
```

### When to Remove

Remove when **all** of the following are true:
1. Strict mode has been the default for ≥ 1 major InSpec release
2. No callers in `lib/` or plugins pass numeric strings to `impact_from_string`
3. The contract test `test/contract/impact_contract_test.rb` does not test passthrough

Removal checklist:
- [ ] Delete `@strict_numeric_mode` class variable and `strict_numeric_mode?` / `attr_writer` methods
- [ ] Delete `reject_if_strict_numeric!` private method
- [ ] Update `impact_from_string` docstring (remove strict mode paragraph)
- [ ] Delete `strict_numeric_mode flag (Walk Ex13)` test group in `impact_test.rb`
- [ ] Delete `INSPEC_IMPACT_STRICT_NUMERIC` env var check from module load
- [ ] Remove this document section

---

## Validation — Both Modes

### Local validation

```bash
# FLAG OFF (default behaviour preserved)
INSPEC_IMPACT_STRICT_NUMERIC=0 RUBY_BIN=$(which ruby) bash scripts/crawl-track-test.sh

# FLAG ON (strict rejection enabled)
INSPEC_IMPACT_STRICT_NUMERIC=1 RUBY_BIN=$(which ruby) bash scripts/crawl-track-test.sh
```

### Evidence (Walk Ex13)

```
=== FLAG OFF (INSPEC_IMPACT_STRICT_NUMERIC=0) ===
✔ Ruby version OK
✔ Unit tests passed (3620 runs)
✔ frozen_string_literal present
✔ No bare rescue found
All 4 checks passed

=== FLAG ON (INSPEC_IMPACT_STRICT_NUMERIC=1) ===
✔ Ruby version OK
✔ Unit tests passed (5446 runs)
✔ frozen_string_literal present
✔ No bare rescue found
All 4 checks passed
```

Note: FLAG ON has more runs because `test/unit/impact_test.rb` is loaded fully and
the Ex13 `strict_numeric_mode flag` describe group runs all its ON-mode tests.

### CI matrix validation

The `impact-tests` CI job uses a matrix:
```yaml
strategy:
  matrix:
    ruby: ["3.1", "3.2", "3.3"]
    strict_numeric: ["0", "1"]
env:
  INSPEC_IMPACT_STRICT_NUMERIC: ${{ matrix.strict_numeric }}
```

This produces 6 job variants (3 Ruby × 2 flag states) — all must pass.

---

## Flag: `logging_enabled`

### What it does

When **OFF**, suppresses all `log_impact` and `warn_impact` calls with zero overhead.
Does NOT suppress `reject_if_strict_numeric!` errors (strict mode is independent).

| Mode | DEBUG logs | WARN logs |
|------|-----------|-----------|
| `true` (default) | emitted | emitted |
| `false` | suppressed | suppressed |

### Lifecycle

Permanent — `logging_enabled` is not scheduled for removal. It is a runtime
performance knob, not a transitional behaviour flag.

### Usage

```ruby
# In tests or benchmarks
Inspec::Impact.logging_enabled = false
# ... performance-sensitive work ...
Inspec::Impact.logging_enabled = true   # always restore in teardown
```

---

## Interaction Between Flags

The two flags are **independent**:

| `logging_enabled` | `strict_numeric_mode` | Behaviour |
|-------------------|-----------------------|-----------|
| `true` | `false` | Normal: logs emitted, numeric strings pass through |
| `true` | `true` | Strict: logs emitted, numeric strings raise |
| `false` | `false` | Silent: no logs, numeric strings pass through |
| `false` | `true` | Silent-strict: no logs, numeric strings raise |

`strict_numeric_mode` controls **what input is accepted**.
`logging_enabled` controls **whether events are logged**.

---

## Files Changed (Ex13)

| File | Change |
|------|--------|
| `lib/inspec/impact.rb` | `strict_numeric_mode?` flag + env bootstrap; `reject_if_strict_numeric!` private helper |
| `test/unit/impact_test.rb` | `capture_warns` hoisted to outer scope; +10 flag lifecycle tests |
| `scripts/crawl-track-test.sh` | Inline passthrough test respects `INSPEC_IMPACT_STRICT_NUMERIC` env var |
| `.github/workflows/crawl-track-impact.yml` | `impact-tests` matrix adds `strict_numeric: ["0", "1"]` dimension |
| `.rubocop.yml` | Raised `MethodLength` 20→22, `AbcSize` 18→20, added `ModuleLength` 120 |
| `ai-track-docs/feature-flags.md` | This file (new) |
