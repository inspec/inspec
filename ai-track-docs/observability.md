# Observability — Impact Module

**Walk Track — Exercise 9**
**Updated:** 2026-05-21

---

## What Was Added

`Inspec::Impact` now emits **WARN-level structured log entries** for two
operator-visible events, in addition to the existing DEBUG-level timing entries
from prior exercises.

| Hook | Method | Level | Trigger |
|------|--------|-------|---------|
| Error path | `impact_from_string` | WARN | Unknown severity name passed (e.g. `"bogus"`) |
| Error path | `string_from_impact` | WARN | Score outside [0.0, 1.0] range |
| Boundary score | `string_from_impact` | WARN | Score is exactly on a band boundary (0.1, 0.4, 0.7, 0.9) |
| Happy path timing | both | DEBUG | Every successful call (existing, unchanged) |

### Why WARN for errors?

Previously all log output was at `DEBUG` level — invisible unless you explicitly
enabled verbose logging. Errors should be operator-visible at normal log levels
so they can surface in log aggregation without requiring debug mode.

### Why WARN for boundary scores?

CVSS 3.0 band boundaries (0.1, 0.4, 0.7, 0.9) are exact dividing lines between
severity levels. A score at exactly 0.7 is unambiguous (`high`), but any upstream
rounding or float drift could shift it into `medium`. The WARN signals operators
to inspect the upstream source when these values appear in production.

---

## Log Entry Format

All entries are JSON objects emitted as a single log message string.

### Error path entry (WARN)

```
# impact_from_string with invalid name
{"op":"impact_from_string","reason":"invalid_severity_name","input":"bogus"}

# string_from_impact with out-of-range score
{"op":"string_from_impact","reason":"out_of_range","input":99.0}
```

### Boundary score entry (WARN)

```
{"op":"string_from_impact","reason":"boundary_score","input":0.7,"result":"high"}
```

### Happy-path timing entry (DEBUG — existing)

```
{"op":"impact_from_string","status":"ok","elapsed_ms":0.012,"input":"high","result":0.7}
```

### Fields reference

| Field | Always present | Description |
|-------|---------------|-------------|
| `op` | ✅ | Method name: `impact_from_string` or `string_from_impact` |
| `reason` | WARN only | `invalid_severity_name` / `out_of_range` / `boundary_score` |
| `status` | DEBUG only | `ok` / `passthrough` / `error` |
| `input` | when non-nil | The caller-supplied value |
| `result` | on success | The resolved score or name |
| `elapsed_ms` | DEBUG only | Wall time in milliseconds (3 dp) |

---

## How to Enable and View

### Enable DEBUG output locally

```ruby
# In any InSpec context or REPL:
Inspec::Log.level = :debug

# Run a profile — impact resolution will emit timing lines:
inspec exec my-profile --log-level debug 2>&1 | grep '"op"'
```

### WARN output (always-on at INFO level)

WARN entries emit whenever InSpec's log level is INFO or below (the default).
No configuration needed — they appear in standard log output:

```bash
inspec exec my-profile 2>&1 | grep '"reason"'
```

### Expected output for a boundary-score hit

```
W, [2026-05-21T12:00:00.000000 #12345]  WARN -- : {"op":"string_from_impact","reason":"boundary_score","input":0.7,"result":"high"}
```

### Silence impact logs (performance-sensitive paths)

```ruby
Inspec::Impact.logging_enabled = false   # suppresses ALL impact log output (WARN + DEBUG)
Inspec::Impact.logging_enabled = true    # restore
```

The toggle is thread-global for the module; set per-test in unit tests with a
`teardown` block that resets it.

---

## CI Verification

The `impact-tests` job in `.github/workflows/crawl-track-impact.yml` exercises
all WARN hooks through unit tests in `test/unit/impact_test.rb`.

Relevant test group: **`observability — WARN hooks (Walk Ex9)`** — 5 tests:

| Test | Verifies |
|------|---------|
| `emits WARN with boundary_score reason for exact high boundary 0.7` | WARN fired + correct name returned |
| `does NOT emit WARN for mid-band score 0.75` | No spurious WARN for normal scores |
| `emits WARN with invalid_severity_name reason before raising ImpactError` | Error WARN fires before raise |
| `emits WARN with out_of_range reason before raising ImpactError` | Error WARN fires before raise |
| `does NOT emit WARN when logging_enabled is OFF` | Toggle suppresses warn_impact |

Run locally:

```bash
RUBY_BIN=/Users/mchhalot/.rbenv/versions/3.4.8/bin/ruby bash scripts/crawl-track-test.sh
```

Expected output:

```
✔ Unit tests passed (2786 runs)
All 4 checks passed
```

---

## Files Changed (Ex9)

| File | Change |
|------|--------|
| `lib/inspec/impact.rb` | Added `warn?`/`warn` to Log stub; `BOUNDARY_SCORES` constant; `warn_impact` private method; WARN calls on error paths + boundary check |
| `test/unit/impact_test.rb` | +5 observability tests (`capture_warns` spy helper + 5 cases) |
| `ai-track-docs/observability.md` | This file (new) |
