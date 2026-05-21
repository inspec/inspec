# Structured Logging in InSpec — Viewing Guide

Applies to: `IniConfig#parse` (and any future resource that calls `log_parse_event`).

---

## 1. Log Schema

Every event emitted by `IniConfig#parse` is a single-line JSON object on
`stderr`. All entries share these fields:

| Field | Type | Description |
|-------|------|-------------|
| `op` | String | Operation name — always `"ini_parse"` |
| `status` | String | `"ok"` or `"failed"` |
| `elapsed_ms` | Float | Wall-clock milliseconds for the `SimpleConfig` parse step |
| `file` | String\|null | Resource path supplied by the caller (`nil` for inline content) |
| `keys` | Integer | Total leaf-key count across all sections — **ok path only** |
| `error` | String | Exception message — **failed path only** |

### Example — ok path
```json
{"op":"ini_parse","status":"ok","elapsed_ms":0.182,"file":"rootwrap.conf","keys":2}
```

### Example — failed path
```json
{"op":"ini_parse","status":"failed","elapsed_ms":0.041,"file":"bad.conf","error":"Unable to parse INI content: ..."}
```

---

## 2. How to Enable

Logs are emitted at **debug** level. They are silent by default.

### Option A — CLI flag
```bash
inspec exec myprofile --log-level debug
```

### Option B — Environment variable
```bash
INSPEC_LOG_LEVEL=debug inspec exec myprofile
```

### Option C — Config file (`~/.inspec/config.json`)
```json
{
  "version": "1.1",
  "cli_options": {
    "log_level": "debug"
  }
}
```

---

## 3. Output Format

### Plain text (default)
Debug lines appear inline on stderr interleaved with other log output:
```
D, [2026-05-21T11:50:00.123456 #12345] DEBUG -- : {"op":"ini_parse","status":"ok","elapsed_ms":0.182,"file":"/etc/app.ini","keys":4}
```

### JSON format (machine-readable, recommended for pipelines)
```bash
inspec exec myprofile --log-level debug --log-format json
```
Each line is a complete JSON object:
```json
{"progname":null,"severity":"DEBUG","time":"2026-05-21T11:50:00+05:30","msg":"{\"op\":\"ini_parse\",\"status\":\"ok\",\"elapsed_ms\":0.182,\"file\":\"/etc/app.ini\",\"keys\":4}"}
```
The `msg` field value is itself a JSON string — parse it twice, or use `jq` (see §4).

### Redirect logs to a file
```bash
inspec exec myprofile --log-level debug --log-location /tmp/inspec-debug.log
```

---

## 4. Querying Logs with `jq`

```bash
# Stream only ini_parse events from a JSON log
inspec exec myprofile --log-level debug --log-format json 2>&1 \
  | jq 'select(.severity == "DEBUG") | .msg | fromjson | select(.op == "ini_parse")'

# Show only failures
... | jq '... | select(.status == "failed")'

# Show files that took longer than 5 ms
... | jq '... | select(.elapsed_ms > 5)'

# Summarise key counts per file
... | jq -s '[.[] | select(.op=="ini_parse" and .status=="ok")] | group_by(.file)[] | {file: .[0].file, keys: .[0].keys}'
```

---

## 5. Adding Structured Logs to Another Resource

Follow the same pattern used in `IniConfig`:

```ruby
# 1. Require JSON at the top of the file
require "json" unless defined?(JSON)

# 2. Time the expensive operation
t0 = Process.clock_gettime(Process::CLOCK_MONOTONIC)
result = do_the_work(...)
elapsed = ((Process.clock_gettime(Process::CLOCK_MONOTONIC) - t0) * 1000).round(3)

# 3. Emit with consistent field names
Inspec::Log.debug(JSON.generate(
  op:         "my_resource_parse",   # snake_case: <resource>_<action>
  status:     "ok",                  # always "ok" or "failed"
  elapsed_ms: elapsed,               # always present, always Float
  file:       @resource_name_supplement,
  # add resource-specific fields below the required three
  keys:       result.size
))
```

**Required fields:** `op`, `status`, `elapsed_ms` — always present, always these names.  
**Optional fields:** anything else useful (`file`, `keys`, `error`, `rows`, `host`, …).

---

## 6. Log Level Reference

| Level | Flag | What is shown |
|-------|------|---------------|
| `error` | `--log-level error` | Fatal errors only |
| `warn` | `--log-level warn` | Warnings + errors (default for most commands) |
| `info` | `--log-level info` | Informational messages |
| `debug` | `--log-level debug` | Everything, including structured parse events |
