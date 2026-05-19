# InSpec System Overview

## What is InSpec?

InSpec is an open-source infrastructure testing framework written in Ruby (≥ 3.1.0).
It provides a human-readable DSL for writing security and compliance tests that can be
shared across development, operations, and security teams.

---

## Languages

| Language | Role | Examples |
|----------|------|----------|
| Ruby | 100 % of application code | `lib/`, `test/`, `*.gemspec` |
| Shell | CI scripts, Habitat packaging (Linux) | `.expeditor/buildkite/`, `habitat/x86_64-linux/` |
| PowerShell | CI scripts, Habitat packaging (Windows) | `habitat/x86_64-windows/` |
| Go | Documentation site only | `docs-chef-io/main.go` |

---

## Entry Points

| Entry Point | Path | What it does |
|-------------|------|--------------|
| CLI binary | `inspec-bin/bin/inspec` | Calls `Inspec::InspecCLI.start(ARGV, enforce_license: true)` |
| Library root | `lib/inspec.rb` | Autoloads all core modules (~32 requires) |
| CLI implementation | `lib/inspec/cli.rb` | Thor subclass; defines commands (`exec`, `shell`, `check`, …) |
| Shared CLI options | `lib/inspec/base_cli.rb` | Target, profile, exec, and audit-log option groups |
| Runner | `lib/inspec/runner.rb` | Orchestrates: load profiles → connect backend → execute → report |
| Config | `lib/inspec/config.rb` | Merges CLI opts, config files, ENV vars into one object |

### Execution flow

```
inspec-bin/bin/inspec
  → lib/inspec/cli.rb  (Thor parses command + options)
  → lib/inspec/config.rb  (build unified config)
  → lib/inspec/runner.rb  (load profiles, connect transport, run controls)
  → lib/inspec/reporters/  (emit results)
```

---

## Core Components

| Component | Location | Purpose |
|-----------|----------|---------|
| CLI | `lib/inspec/cli.rb`, `lib/inspec/base_cli.rb` | Thor-based command-line interface |
| Runner | `lib/inspec/runner.rb` | Orchestrates profile loading and test execution |
| Profile | `lib/inspec/profile.rb` | Packages controls, resources, and metadata |
| Resources | `lib/inspec/resources/` | Built-in resource implementations (300+) |
| Plugins | `lib/plugins/` | Extension system for reporters, CLI commands, etc. |
| Transport | Train (external gem) | Abstracts SSH, WinRM, Docker, local connections |
| Config | `lib/inspec/config.rb` | Merges CLI opts, config files, and env vars |
| Reporters | `lib/inspec/reporters/` | Formats and emits results (JSON, CLI, Automate) |

## Gem Structure

- **inspec** (`inspec.gemspec`) – full gem with all dependencies
- **inspec-core** (`inspec-core.gemspec`) – core without heavy CLI/transport deps
- **inspec-bin** (`inspec-bin/inspec-bin.gemspec`) – CLI entry-point gem
- **inspec-core-bin** (`inspec-bin/inspec-core-bin.gemspec`) – alternative CLI distribution

---

## Test Approach

| Aspect | Detail |
|--------|--------|
| Framework | **Minitest** (`describe`/`it` syntax); some RSpec integration |
| Unit tests | `test/unit/` — 207+ files |
| Functional tests | `test/functional/` — end-to-end CLI exercises |
| Integration tests | `test/integration/` |
| Helper | `test/helper.rb` — sets up SimpleCov, mocking (Mocha, WebMock) |
| Resource testing | `MockLoader.new.load_resource("name", *args)` |
| Run all | `bundle exec rake test` |
| Run one file | `bundle exec ruby -Ilib:test test/unit/path/to_test.rb` |
| Parallel | `bundle exec rake test:parallel` |

---

## Key External Dependencies

- **Train** – transport abstraction (SSH, WinRM, Docker, etc.)
- **Thor** – CLI framework
- **ChefLicensing** – commercial entitlement checks
- **Habitat** – packaging for deployment

---

## Low-Risk Modules (safe first-edit candidates)

| # | Module | Path | Test file | Dependents | Risk |
|---|--------|------|-----------|------------|------|
| 1 | NginxParser | `lib/inspec/utils/nginx_parser.rb` | `test/unit/utils/nginx_parser_test.rb` | 1 (`lib/inspec/resources/nginx_conf.rb`) | Very low |
| 2 | FilterArray | `lib/inspec/utils/filter_array.rb` | `test/unit/utils/filter_array_test.rb` | 1 (`lib/inspec/resources/auditd.rb`) | Very low |
| 3 | YAML Reporter | `lib/inspec/reporters/yaml.rb` | `test/unit/reporters/yaml_test.rb` | Reporter registry only | Low |

### Recommended first target: NginxParser

**File:** `lib/inspec/utils/nginx_parser.rb` (~95 LOC)
**Test:** `test/unit/utils/nginx_parser_test.rb`

Why it's the safest practical choice:

1. **Single consumer** — only `lib/inspec/resources/nginx_conf.rb` imports it; blast radius is one resource.
2. **Pure logic** — Parslet-based parser with no I/O, no network, no shell-outs.
3. **Comprehensive tests** — existing test file covers empty files, comments, nested sections, quoted values.
4. **Meaningful size** — 95 lines of real parser logic; large enough for a substantive change.
5. **Concrete improvement opportunities:**
   - Stale comment references "rabbitmq config files" (copy-paste artefact).
   - Generic error messages on parse failure could be more specific.
   - Missing edge-case tests for deeply nested contexts.

### Runner-up: FilterArray

**File:** `lib/inspec/utils/filter_array.rb` (~20 LOC)
**Test:** `test/unit/utils/filter_array_test.rb`

- Tiny pure-logic utility; filters arrays of hashes by key/value.
- Uses `method_missing` without `respond_to_missing?` — textbook safe refactor.
- Only consumer: `lib/inspec/resources/auditd.rb`.

### Alternative: YAML Reporter

**File:** `lib/inspec/reporters/yaml.rb` (~15 LOC)
**Test:** `test/unit/reporters/yaml_test.rb`

- Thin wrapper that calls `run_data.to_yaml`.
- Not the default reporter (JSON/CLI are), so rarely on critical path.
- Potential improvement: no encoding-error handling.

---

## Assumptions & Verification

| Assumption | How to verify |
|------------|---------------|
| Ruby ≥ 3.1.0 required | `grep required_ruby_version inspec-core.gemspec` |
| 207+ unit test files | `find test/unit -name '*_test.rb' \| wc -l` |
| NginxParser has 1 consumer | `grep -r "nginx_parser" lib/ --include="*.rb" \| grep require` |
| FilterArray has 1 consumer | `grep -r "filter_array" lib/ --include="*.rb" \| grep require` |
| NginxParser test exists | `ls test/unit/utils/nginx_parser_test.rb` |
| FilterArray test exists | `ls test/unit/utils/filter_array_test.rb` |
| `bundle exec rake test` runs suite | `grep 'task.*default' Rakefile` |
