# Exercise 0: Bootstrap — InSpec Repo Understanding

## Version
- InSpec 7.1.7

## Entry Points
- **CLI**: `lib/inspec/cli.rb`, `lib/inspec/base_cli.rb`
- **Runner**: `lib/inspec/runner.rb`
- **Resources**: `lib/inspec/resources/` (143 resources)

## Key Modules
| Module | Path | Purpose |
|--------|------|---------|
| CLI | `lib/inspec/cli.rb` | Command-line interface (Thor-based) |
| Runner | `lib/inspec/runner.rb` | Profile execution engine |
| Resources | `lib/inspec/resources/` | 143 built-in resources (bash, file, etc.) |
| Config | `lib/inspec/config.rb` | Configuration management |
| Reporters | `lib/inspec/reporters/` | Output formatters (JSON, CLI, etc.) |
| Plugins | `lib/plugins/` | Extensibility layer |

## How Tests Are Run
```bash
# All tests (unit + functional)
bundle exec rake test

# Unit tests only
bundle exec ruby -Itest test/unit/<test_file>_test.rb

# Functional tests only
bundle exec rake test:functional
```

Test files follow pattern: `test/unit/**/*_test.rb`

## Safe Practice Module
- **Resource**: `lib/inspec/resources/bash.rb`
- **Tests**: `test/unit/resources/bash_test.rb` (if exists)
- Why safe: Small, self-contained, no external dependencies

## Guardrails
- Keep PRs small and reversible
- No secrets in prompts or commits
- Keep CI green (attach local logs if no CI)
- Exclude submodules/vendor from edits
