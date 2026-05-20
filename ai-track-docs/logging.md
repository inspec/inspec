# Structured Logging Guide — InSpec

**Updated:** 2026-05-20

---

## Log Fields (standard schema)

All structured log entries emitted by `Inspec::Impact` use these consistent fields:

| Field | Type | Description |
|-------|------|-------------|
| `op` | String | Operation name (`impact_from_string`, `string_from_impact`) |
| `status` | String | `ok` · `error` · `passthrough` |
| `input` | String/Number | Input value passed to the method |
| `result` | String/Number | Return value (omitted on error) |
| `elapsed_ms` | Float | Wall-clock time for the operation in milliseconds (3 dp) |

### Example log lines

```json
{"op":"impact_from_string","status":"ok","elapsed_ms":0.012,"input":"high","result":0.7}
{"op":"impact_from_string","status":"passthrough","elapsed_ms":0.004,"input":"0.5"}
{"op":"impact_from_string","status":"error","elapsed_ms":0.009,"input":"fake"}
{"op":"string_from_impact","status":"ok","elapsed_ms":0.011,"input":0.7,"result":"high"}
{"op":"string_from_impact","status":"error","elapsed_ms":0.008,"input":99.0}
```

---

## How to Enable Debug Logs

Logs are emitted at **DEBUG level only** — silent at INFO (the default).

### Via CLI flag

```bash
inspec exec my-profile --log-level debug
```

### Via environment variable

```bash
INSPEC_LOG_LEVEL=debug inspec exec my-profile
```

### Via config file (`~/.inspec/config.json`)

```json
{
  "log_level": "debug"
}
```

---

## How to View Structured (JSON) Logs

By default InSpec logs as plain text. To get machine-readable JSON output:

```bash
inspec exec my-profile --log-level debug --log-format json
```

### Pipe to `jq` for readable output

```bash
inspec exec my-profile --log-level debug --log-format json 2>&1 \
  | grep '"op"' \
  | jq .
```

### Filter by operation

```bash
# Only impact_from_string calls
inspec exec my-profile --log-level debug --log-format json 2>&1 \
  | jq 'select(.op == "impact_from_string")'

# Only errors
inspec exec my-profile --log-level debug --log-format json 2>&1 \
  | jq 'select(.status == "error")'

# Slow calls (> 1ms)
inspec exec my-profile --log-level debug --log-format json 2>&1 \
  | jq 'select(.elapsed_ms > 1)'
```

---

## Implementation Notes

### Where logs live in the code

`lib/inspec/impact.rb` — private helper `log_impact`:

```ruby
def self.log_impact(op:, status:, elapsed_ms:, input: nil, result: nil)
  return unless Inspec::Log.debug?   # zero cost when debug is off
  # ... build JSON entry and call Inspec::Log.debug
end
```

The guard `return unless Inspec::Log.debug?` means **no overhead in production**
(INFO level) — the timing and JSON serialisation are skipped entirely.

### Graceful fallback

`impact.rb` wraps its `require "inspec/log"` in a `rescue LoadError` block.
If the full InSpec stack isn't loaded (e.g. isolated unit tests), a no-op stub
is used automatically. Tests can override the stub to assert on log output.

### Adding logs to other modules

Follow the same pattern:
1. Use `Inspec::Log.debug?` guard before any work
2. Capture `t0 = Process.clock_gettime(Process::CLOCK_MONOTONIC)` at method entry
3. Call a `log_X(op:, status:, elapsed_ms:, ...)` private helper at each exit point
4. Keep fields consistent: always include `op`, `status`, `elapsed_ms`

---

## Feature Toggle: `Inspec::Impact.logging_enabled`

As of Exercise 13, impact debug logging has a **module-level kill switch** independent of log level.

### API

```ruby
Inspec::Impact.logging_enabled?        # => true (default)
Inspec::Impact.logging_enabled = false # silence all log_impact calls
Inspec::Impact.logging_enabled = true  # restore
```

### Behaviour matrix

| `logging_enabled?` | `Inspec::Log.debug?` | `log_impact` emits? |
|--------------------|----------------------|---------------------|
| `true` (default)   | `true`               | ✅ yes              |
| `true` (default)   | `false`              | ❌ no (log-level gate) |
| `false`            | `true`               | ❌ no (toggle gate — first guard) |
| `false`            | `false`              | ❌ no               |

### When to use

| Scenario | Setting |
|----------|---------|
| Normal operation | leave default (`true`) |
| Performance-critical tight loop | `false` before loop, restore after |
| Tests asserting on log output | `true` + log level DEBUG |
| Tests that must not emit logs | `false` in setup; restore in `teardown` |

### Toggle in tests (teardown pattern)

```ruby
def teardown
  Inspec::Impact.logging_enabled = true  # always restore default
end

it "silent path" do
  Inspec::Impact.logging_enabled = false
  # ... test code — no log entries emitted
end
```

### Rollback

```bash
git revert <commit-SHA>  # removes @logging_enabled, accessors, and log_impact guard
```

---

## Log Levels Reference

| Level | When to use |
|-------|-------------|
| `debug` | Structured operation traces (op/status/elapsed) — this module |
| `info` | Notable lifecycle events (profile loaded, run started) |
| `warn` | Recoverable issues (deprecated option, skipped input) |
| `error` | Non-recoverable failures before raising an exception |
