# InSpec Linting Reference

Updated: 2026-05-21  
Branch: `ch/githubcrwl`

## Tool

RuboCop (`rubocop` gem, version in `Gemfile.lock`).  
Config: `.rubocop.yml` at repo root (minimal — extends RuboCop defaults).

## How to Run Locally

```bash
# Full repo scan (slow — ~5,726 offenses pre-existing across 166 resource files)
bundle exec rubocop --no-color

# Targeted: only the files you changed
bundle exec rubocop --no-color lib/inspec/resources/ini.rb test/unit/resources/ini_test.rb

# Auto-correct safe offenses (string quotes, frozen_string_literal, etc.)
bundle exec rubocop -a lib/inspec/resources/ini.rb

# Auto-correct unsafe offenses too (use with care — review diff after)
bundle exec rubocop -A lib/inspec/resources/ini.rb

# Run only specific cops (e.g. security sweep)
bundle exec rubocop --only Security/YAMLLoad,Lint/ReturnInVoidContext,Style/RescueStandardError \
  lib/inspec/resources/

# JSON output for scripting / CI parsing
bundle exec rubocop --format json lib/inspec/resources/ini.rb | python3 -c "
import json,sys; d=json.load(sys.stdin)
for f in d['files']:
  for o in f['offenses']:
    print(f\"{f['path']}:{o['location']['line']} {o['cop_name']}\")
"

# Via local CI harness (lint + unit in one command)
bash scripts/ci-local.sh --lint-only
```

## Current Enforcement Scope

`.rubocop.yml` enforces the following explicitly:

| Cop | Scope | Severity | Reason |
|-----|-------|----------|--------|
| `Layout/ArgumentAlignment` | All | convention | Style consistency |
| `Metrics/BlockLength` | Excluded: `test/**/*_test.rb` | — | Test blocks legitimately long |
| `Metrics/MethodLength` | Excluded: `lib/inspec/resources/ini.rb` | — | Timing instrumentation |
| `Security/YAMLLoad` | All | **error** | RCE risk via deserialization |
| `Style/RescueStandardError` | `lib/inspec/resources/**/*.rb` | **error** | Prevents masking signals |
| `Lint/ReturnInVoidContext` | All | **error** | Silent bug in `initialize` |

## High-Signal Findings Fixed in This PR

| File | Line | Cop | Fix Applied |
|------|------|-----|-------------|
| `yaml.rb` | 29 | `Security/YAMLLoad` | `YAML.load` → `YAML.safe_load` |
| `cassandradb_conf.rb` | 42 | `Security/YAMLLoad` | `YAML.load` → `YAML.safe_load` |
| `cassandradb_conf.rb` | 28 | `Lint/ReturnInVoidContext` | Split `return skip_resource` into two statements |
| `json.rb` | 75 | `Style/RescueStandardError` | `rescue =>` → `rescue StandardError =>` |
| `csv.rb` | 54 | `Style/RescueStandardError` | `rescue =>` → `rescue StandardError =>` |
| `yaml.rb` | 30 | `Style/RescueStandardError` | `rescue =>` → `rescue StandardError =>` |
| `cassandradb_conf.rb` | 43 | `Style/RescueStandardError` | `rescue =>` → `rescue StandardError =>` |

## Known Pre-existing Findings (Backlogged)

| Count | Cop | Backlog item |
|-------|-----|--------------|
| 4 | `Security/YAMLLoad` | BACKLOG-006 |
| 40 | `Lint/ReturnInVoidContext` | BACKLOG-007 |
| ~15 more | `Style/RescueStandardError` | Included in BACKLOG-007 scope |
| 3,123 | `Style/StringLiterals` | Pre-existing, not enforced — auto-correctable when touching a file |
| 160 | `Style/FrozenStringLiteralComment` | Pre-existing — add `# frozen_string_literal: true` when touching a file |

## Why `Security/YAMLLoad` Matters

`YAML.load` in Ruby deserializes arbitrary objects when the input contains
`!ruby/object:` or similar YAML tags. On an InSpec audit run against a
remote node, the config file content comes from the target — an attacker who
controls the target (or a misconfigured node) can craft a YAML file that
executes arbitrary Ruby in the InSpec process.

`YAML.safe_load` restricts deserialization to scalars, arrays, and hashes.
This is the correct default for all config-file parsing.

## CI Gap

GitHub Actions currently has `unit-tests: false` and `perform-language-linting: false`
in `.github/workflows/ci-main-pull-request-stub.yml` — RuboCop **does not run on PRs**.

Use `bash scripts/ci-local.sh --lint-only` as the local gate until BACKLOG-001 is resolved.
