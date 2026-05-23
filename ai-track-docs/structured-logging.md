# Structured Logging Guide

## Log Format

Structured debug logs use consistent key=value fields for machine-parseable output:

```
[timestamp] DEBUG: nginx_parser: op=parse status=ok bytes=1184 elapsed_ms=8.77
```

### Standard Fields

| Field | Type | Description |
|-------|------|-------------|
| `op` | string | Operation name (e.g. `parse`) |
| `status` | string | Outcome: `ok`, `skip`, `error` |
| `elapsed_ms` | float | Wall-clock time in milliseconds |
| `bytes` | int | Input size (when relevant) |
| `reason` | string | Why an operation was skipped |
| `error` | string | Truncated error message (on failure) |

### Example Output

```
# Successful parse
[2026-05-23T14:35:01+05:30] DEBUG: nginx_parser: op=parse status=ok bytes=1184 elapsed_ms=8.77

# Empty input (fast path)
[2026-05-23T14:35:01+05:30] DEBUG: nginx_parser: op=parse status=skip reason=empty_input

# Parse failure
[2026-05-23T14:35:01+05:30] DEBUG: nginx_parser: op=parse status=error elapsed_ms=0.3 error=Expected "}", but got...
```

---

## How to View Logs

### CLI (most common)

```bash
# Enable debug logging for any inspec command:
inspec exec myprofile --log-level debug

# Write logs to a file:
inspec exec myprofile --log-level debug --log-location /tmp/inspec.log

# Then grep for structured entries:
grep "nginx_parser:" /tmp/inspec.log
```

### In Ruby code / tests

```ruby
require "inspec/log"
Inspec::Log.level = :debug  # show debug messages on stderr
```

### Environment variable

```bash
# Set globally before running:
export INSPEC_LOG_LEVEL=debug
inspec shell -t local
```

---

## Filtering Structured Logs

Since fields use `key=value` format, standard tools work:

```bash
# All nginx_parser entries:
grep "nginx_parser:" /tmp/inspec.log

# Only errors:
grep "nginx_parser:.*status=error" /tmp/inspec.log

# Slow parses (> 10ms) — extract elapsed_ms with awk:
grep "nginx_parser:.*status=ok" /tmp/inspec.log | \
  awk -F'elapsed_ms=' '{if ($2+0 > 10) print}'
```

---

## Adding Structured Logs to Other Modules

Follow this pattern:

```ruby
require "inspec/log"

start = Process.clock_gettime(Process::CLOCK_MONOTONIC)
# ... do work ...
elapsed = ((Process.clock_gettime(Process::CLOCK_MONOTONIC) - start) * 1000).round(2)
Inspec::Log.debug { "module_name: op=operation status=ok elapsed_ms=#{elapsed}" }
```

Key conventions:
- Use **block form** (`Inspec::Log.debug { ... }`) to avoid string allocation when debug is off.
- Prefix with **module name** for easy grep filtering.
- Always include `op` and `status`; add `elapsed_ms` for timed operations.
- Truncate error messages to ~80 chars to keep log lines scannable.
