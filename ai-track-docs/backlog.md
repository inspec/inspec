# InSpec AI-Track Backlog

Generated: 2026-05-21  
Branch: `ch/githubcrwl`  
Based on findings from the ini-resource hardening crawl (v5.24.10).

Each item is self-contained: it includes the exact file/line evidence that
motivated it, acceptance criteria, and a suggested approach.

---

## BACKLOG-001 · Enable unit tests and RuboCop in GitHub Actions CI

**Priority:** High  
**Effort:** S (config change + smoke-test)  
**Source finding:** `.github/workflows/ci-main-pull-request-stub.yml` L88, L91

```yaml
# Current — tests never run on PRs:
build: false          # L88
unit-tests: false     # L91
perform-language-linting: false  # L66
```

### Problem
Ruby unit tests and RuboCop linting are disabled in the only GitHub Actions
workflow that runs on pull requests. The CI stub calls an internal Buildkite
pipeline (Chef infrastructure) that is inaccessible to community contributors.
Any regression that `rake test:unit` would catch ships silently.

### Acceptance Criteria
- [ ] A GitHub Actions job runs `bundle exec rake test:unit` on every PR targeting `main` / `inspec-5`
- [ ] A GitHub Actions job runs `bundle exec rubocop --no-color` (scoped or full) on every PR
- [ ] Both jobs run on `ubuntu-latest` with the Ruby version declared in `inspec-core.gemspec` (`>= 3.1.0`, pin to `3.1`)
- [ ] Jobs are gated: PRs cannot merge if either job fails
- [ ] The known pre-existing failure in `json_test.rb:129` is either fixed (see BACKLOG-002) or explicitly excluded so the gate is actionable

### Suggested Approach
```yaml
# .github/workflows/unit-tests.yml  (new file)
on: [pull_request]
jobs:
  unit:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: ruby/setup-ruby@v1
        with: { ruby-version: '3.1', bundler-cache: true }
      - run: bundle exec rake test:unit
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: ruby/setup-ruby@v1
        with: { ruby-version: '3.1', bundler-cache: true }
      - run: bundle exec rubocop --no-color
```

**Code links:**
- Stub workflow: [`.github/workflows/ci-main-pull-request-stub.yml` L66–L91](../../.github/workflows/ci-main-pull-request-stub.yml#L66)
- Local harness (interim workaround): [`scripts/ci-local.sh`](../../scripts/ci-local.sh)

---

## BACKLOG-002 · Fix pre-existing NoMethodError in `json_test.rb:129`

**Priority:** High  
**Effort:** S (one-line fix + test update)  
**Source finding:** `test/unit/resources/json_test.rb:129` — confirmed pre-existing via `git stash`

```
NoMethodError: undefined method `chomp' for nil:NilClass
  test/unit/resources/json_test.rb:129  assert_equal ..., resource.raw_content.chomp
```

### Problem
`JsonConfig#raw_content` is set from `load_raw_content` at construction time
([`lib/inspec/resources/json.rb` L37–L38](../../lib/inspec/resources/json.rb#L37)).
When the resource is constructed with a `:command` option, `load_raw_content`
returns the command stdout — which the test mock returns as `nil` for this
fixture. The test then calls `.chomp` on nil, raising `NoMethodError`.

This breaks `rake test:unit`, blocking BACKLOG-001 from being actionable.

### Acceptance Criteria
- [ ] `bundle exec ruby -Ilib -Itest test/unit/resources/json_test.rb` exits 0
- [ ] `rake test:unit` exits 0 (no pre-existing failures remain)
- [ ] Either `load_raw_content` returns `""` instead of `nil` for command output, OR the test is updated to handle nil gracefully
- [ ] No change to the public `raw_content` API (attr_reader stays)

### Suggested Approach
Option A (minimal): guard in `load_raw_content`:
```ruby
# lib/inspec/resources/json.rb ~L90
def load_raw_content(opts)
  # ... existing logic ...
  cmd.stdout || ""   # was: cmd.stdout (can be nil)
end
```
Option B: fix the test mock to return a non-nil stdout.

**Code links:**
- [`lib/inspec/resources/json.rb` L28–L38](../../lib/inspec/resources/json.rb#L28) — `attr_reader :raw_content`, constructor
- [`lib/inspec/resources/json.rb` L79–L115](../../lib/inspec/resources/json.rb#L79) — `load_raw_content`
- [`test/unit/resources/json_test.rb` L129](../../test/unit/resources/json_test.rb#L129) — failing assertion

---

## BACKLOG-003 · Add nil-content guard to `csv`, `yaml`, and `cassandradb_conf` parse methods

**Priority:** Medium  
**Effort:** S (3-line change per resource + 1 negative test each)  
**Source finding:** sibling `parse` overrides lack the guard added to `ini.rb`

```ruby
# csv.rb:37 — no nil check; CSV.new(nil) raises TypeError (confusing message)
def parse(content)
  CSV::Converters[:blank_to_nil] = ...
  csv = CSV.new(content, ...)   # raises "no implicit conversion of nil into String"

# yaml.rb:28 — no nil check; YAML.safe_load(nil) returns nil silently
def parse(content)
  YAML.safe_load(content)       # returns nil, params becomes nil, value() raises NoMethodError

# cassandradb_conf.rb:41 — no nil check
def parse(content)
  SimpleConfig.new(content).params   # same silent-empty risk as pre-fix ini.rb
```

### Acceptance Criteria
- [ ] Each resource raises `Inspec::Exceptions::ResourceFailed` with a descriptive message when `content` is `nil`
- [ ] Message follows the pattern: `"<FORMAT> file content is nil — check that the file exists and is readable"`
- [ ] One negative unit test per resource: `must_raise Inspec::Exceptions::ResourceFailed` + `must_include` on message
- [ ] Existing positive tests continue to pass

### Suggested Approach
Mirror the `ini.rb` pattern exactly:
```ruby
def parse(content)
  if content.nil?
    raise Inspec::Exceptions::ResourceFailed,
          'CSV file content is nil — check that the file exists and is readable'
  end
  # ... existing logic
end
```

**Code links:**
- Reference implementation: [`lib/inspec/resources/ini.rb` L38–L47](../../lib/inspec/resources/ini.rb#L38)
- [`lib/inspec/resources/csv.rb` L37](../../lib/inspec/resources/csv.rb#L37)
- [`lib/inspec/resources/yaml.rb` L28](../../lib/inspec/resources/yaml.rb#L28)
- [`lib/inspec/resources/cassandradb_conf.rb` L41](../../lib/inspec/resources/cassandradb_conf.rb#L41)

---

## BACKLOG-004 · Extract structured-logging helpers into `JsonConfig` (or a shared concern)

**Priority:** Low  
**Effort:** M (refactor + update ini.rb to delegate + tests)  
**Source finding:** `lib/inspec/resources/ini.rb` — logging helpers are local private methods

```ruby
# ini.rb — currently duplicated if other resources adopt the same pattern
def log_parse_event(**fields)      # L83
def elapsed_ms_since(start_time)   # L88
def total_key_count(result)        # L93
```

### Problem
If `csv.rb`, `yaml.rb`, and `cassandradb_conf.rb` (BACKLOG-003) also adopt
structured parse logging, they will each copy these three ~10-line helpers.
The right home is `JsonConfig` (all three inherit it) or a
`Inspec::Resources::ParseInstrumentation` module.

### Acceptance Criteria
- [ ] `log_parse_event`, `elapsed_ms_since`, and `total_key_count` live in `JsonConfig` or a dedicated module included by `JsonConfig`
- [ ] `ini.rb` delegates to the shared implementation (no local copies)
- [ ] Log output for ini is unchanged (same JSON schema, same fields)
- [ ] All existing ini log tests pass without modification
- [ ] No change to the public API of `JsonConfig` or any resource

### Suggested Approach
```ruby
# lib/inspec/resources/json.rb — add to JsonConfig private section
def log_parse_event(**fields)
  Inspec::Log.debug(JSON.generate(fields))
end

def elapsed_ms_since(start_time)
  ((Process.clock_gettime(Process::CLOCK_MONOTONIC) - start_time) * 1000).round(3)
end

def total_key_count(result)
  return 0 unless result.is_a?(Hash)
  result.values.sum { |v| v.is_a?(Hash) ? v.size : 1 }
end
```

**Code links:**
- Current helpers: [`lib/inspec/resources/ini.rb` L82–L97](../../lib/inspec/resources/ini.rb#L82)
- Target base class: [`lib/inspec/resources/json.rb` L20–L45](../../lib/inspec/resources/json.rb#L20)
- Log schema reference: [`ai-track-docs/structured-logging.md`](structured-logging.md)

---

## BACKLOG-005 · Lift `addressable` upper-bound pin from `< 2.8.8` to `~> 2.8`

**Priority:** Low  
**Effort:** S (gemspec edit + full test run + verification)  
**Source finding:** `inspec-core.gemspec` L47; documented in `ai-track-docs/dependency-notes.md` §3

```ruby
# inspec-core.gemspec:47 — current strict upper bound
spec.add_dependency "addressable", "< 2.8.8"
```

### Problem
The `< 2.8.8` ceiling was set to guard against a specific regression in an
older addressable release. `addressable 2.8.x` (x ≥ 8) has been stable since
2023. The strict pin forces bundler to solve against an old minor, blocks
security patches, and can conflict with transitive dependencies that have
already moved on.

### Acceptance Criteria
- [ ] `inspec-core.gemspec` uses `~> 2.8` (allows `2.8.x` patch updates, blocks `2.9+` until reviewed)
- [ ] `bundle update addressable` resolves without conflicts
- [ ] `bundle exec rake test:unit` exits 0 with the new version
- [ ] `bundle exec inspec exec examples/profile` runs without error
- [ ] Change is documented in `ai-track-docs/dependency-notes.md` with the addressable version actually resolved

### Suggested Approach
```ruby
# inspec-core.gemspec
spec.add_dependency "addressable", "~> 2.8"
```
Then run:
```bash
bundle update addressable
bundle exec rake test:unit
bundle exec inspec exec examples/profile --no-create-lockfile
```

**Code links:**
- [`inspec-core.gemspec` L47](../../inspec-core.gemspec#L47)
- Dependency audit: [`ai-track-docs/dependency-notes.md`](dependency-notes.md) §3 (Risk-rated table)

---

## Summary Table

| ID | Title | Priority | Effort | Blocks |
|----|-------|----------|--------|--------|
| BACKLOG-001 | Enable unit tests + RuboCop in GitHub Actions CI | High | S | — |
| BACKLOG-002 | Fix pre-existing `json_test.rb:129` NoMethodError | High | S | BACKLOG-001 |
| BACKLOG-003 | Nil-content guard for csv / yaml / cassandradb_conf | Medium | S | — |
| BACKLOG-004 | Extract structured-logging helpers into JsonConfig | Low | M | BACKLOG-003 |
| BACKLOG-005 | Lift `addressable` pin from `< 2.8.8` to `~> 2.8` | Low | S | — |

**Dependency order:** BACKLOG-002 should be resolved before BACKLOG-001 goes
live as a merge gate (otherwise the gate is permanently red).  
All other items are independent.

---

## BACKLOG-006 · Fix remaining `Security/YAMLLoad` across resource files

**Priority:** High  
**Effort:** S (grep-replace + test run)  
**Source finding:** RuboCop sweep — 4 remaining after this PR fixed `yaml.rb` + `cassandradb_conf.rb`

Remaining files: `file.rb:208`, `lxc.rb:107`, `mongodb_conf.rb:35`, `opa.rb:21`

### Acceptance Criteria
- [ ] All 4 files use `YAML.safe_load` instead of `YAML.load`
- [ ] `bundle exec rubocop --only Security/YAMLLoad lib/inspec/resources/` reports 0 offenses
- [ ] Existing unit tests for each resource pass

---

## BACKLOG-007 · Fix `Lint/ReturnInVoidContext` across 40 resource `initialize` methods

**Priority:** Medium  
**Effort:** M (40 occurrences in 28 files — pattern is `return skip_resource(...)`)  
**Source finding:** RuboCop sweep — pattern: `return skip_resource "..."` in `initialize`

Top files by count: `elasticsearch.rb` (3), `nginx.rb` (3), `users.rb` (2), `zfs_*.rb` (2 each)

### Fix pattern
```ruby
# Before (buggy — return value discarded by Ruby):
return skip_resource "reason"

# After:
skip_resource "reason"
return
```

### Acceptance Criteria
- [ ] `bundle exec rubocop --only Lint/ReturnInVoidContext lib/inspec/resources/` reports 0 offenses
- [ ] All existing resource unit tests pass
