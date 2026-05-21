# Resilience Improvements

Updated: 2026-05-21  
Branch: `ch/githubcrwl`

## Improvement 1 — UTF-8 Encoding Normalisation in `ini` parse

### Problem

When InSpec audits a remote target (SSH or WinRM), the raw content of config
files is transferred as bytes. Windows servers commonly write INI files in
CP1252 or Latin-1 encoding (e.g. `é` = `\xE9`, a single byte). Without
normalisation:

1. `SimpleConfig.new(content)` succeeds — but silently produces `ASCII-8BIT`
   encoded strings inside the `params` hash.
2. When InSpec serialises audit results to JSON (reporter step), Ruby raises:
   ```
   JSON::GeneratorError: "\xE9" from ASCII-8BIT to UTF-8
   ```
   The error appears in the reporter, far from the resource that caused it,
   making it very hard to debug.

**Reproduction (without the fix):**
```ruby
raw = "[S]\nkey=caf\xe9\n".force_encoding('BINARY')
params = SimpleConfig.new(raw).params
JSON.generate(params)   # => JSON::GeneratorError: "\xE9" from ASCII-8BIT to UTF-8
```

### Fix

`lib/inspec/resources/ini.rb` — inside `parse`, before calling `SimpleConfig`:

```ruby
# Transcode to UTF-8. Invalid/undefined bytes become '?' so that
# downstream JSON serialization never raises JSON::GeneratorError.
safe_content = content.encode('UTF-8', invalid: :replace, undef: :replace, replace: '?')
```

The `encode` call:
- Transcodes any encoding → UTF-8
- Replaces bytes that are invalid in the source encoding with `?`
- Replaces codepoints with no UTF-8 mapping with `?`
- Never raises — the `?` replacement makes this a safe, lossy operation

### Behaviour Contract

| Input | Behaviour |
|-------|-----------|
| Clean UTF-8 | Unchanged — no performance cost (already UTF-8) |
| Latin-1/CP1252 byte in value | Replaced by `?` in the parsed value |
| Pure binary content (garbage) | Replaced by `?` throughout; `params` may be `{}` |
| nil | `ResourceFailed` raised before encode is reached |

**Operators auditing Windows targets:** accented characters in INI values will
appear as `?` in InSpec output. The resource will still run without crashing,
and all non-accented values will be correct. If precise accented characters are
needed, the target file should be saved in UTF-8.

### Tests Added

```
test/unit/resources/ini_test.rb
```

| Test | What it pins |
|------|-------------|
| `parses content containing non-UTF-8 bytes without raising` | Resilience: parse succeeds and `JSON.generate` does not raise |
| `replaces non-UTF-8 bytes with ? in parsed values` | Replacement contract: `\xE9` → `?` |

### How to Verify

```bash
# Run focused tests
bundle exec ruby -Ilib -Itest test/unit/resources/ini_test.rb

# Reproduce the pre-fix failure (expected to raise without the fix)
ruby -Ilib -e '
require "inspec/utils/simpleconfig"
require "json"
raw = (+"[S]\nkey=caf\xe9\n").force_encoding("BINARY")
params = SimpleConfig.new(raw).params
JSON.generate(params)   # raises JSON::GeneratorError without encode() fix
'

# Confirm the fix resolves it
ruby -Ilib -e '
require "inspec/utils/simpleconfig"
require "json"
raw = (+"[S]\nkey=caf\xe9\n").force_encoding("BINARY")
safe = raw.encode("UTF-8", invalid: :replace, undef: :replace, replace: "?")
params = SimpleConfig.new(safe).params
puts JSON.generate(params)  # => {"S":{"key":"caf?"}}
'
```

## Candidates for Future Resilience Work

| Area | Problem | Suggested fix |
|------|---------|---------------|
| All YAML resources (`yaml.rb`, `cassandradb_conf.rb`) | Same `ASCII-8BIT` risk as INI | Add `encode` guard in each `parse` method (BACKLOG-003 scope) |
| `json.rb#load_raw_from_command` | No timeout; command hang = InSpec hang | Add `timeout:` option flowing from CLI through `inspec.command` |
| All `return skip_resource` patterns (40 occurrences) | Silent no-op in `initialize` | Split into `skip_resource(...); return` (BACKLOG-007) |
| `Security/YAMLLoad` in 4 remaining files | RCE via crafted YAML on target | `YAML.safe_load` (BACKLOG-006) |
