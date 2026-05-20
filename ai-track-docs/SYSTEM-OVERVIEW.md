# InSpec System Overview

## What Is InSpec?
InSpec is an open-source **infrastructure testing and compliance framework** written in Ruby.
It lets engineers describe security and compliance rules as code, then audit any system — local, remote (SSH/WinRM), or container — against those rules.

## Repo at a Glance
| Item | Detail |
|------|--------|
| Version | 7.1.7 |
| Language | Ruby (multi-gem project) |
| Test framework | Minitest (unit + functional) |
| CLI framework | Thor |
| Transport layer | Train (SSH, WinRM, Docker, local) |

## Entry Points
| File | Role |
|------|------|
| `lib/inspec/cli.rb` | Main CLI (Thor commands: exec, check, shell…) |
| `lib/inspec/base_cli.rb` | Shared CLI option groups |
| `lib/inspec/runner.rb` | Profile execution engine |
| `lib/inspec/profile.rb` | Profile loading and validation |
| `lib/inspec/resources/` | 143 built-in resources (file, bash, user…) |

## Key Modules
- **Resources** (`lib/inspec/resources/`) — describe a system component (file, port, service…)
- **Reporters** (`lib/inspec/reporters/`) — format results (CLI, JSON, JUnit…)
- **Plugins** (`lib/plugins/`) — extensibility (compliance, parallel, license…)
- **Config** (`lib/inspec/config.rb`) — unified option/config management
- **Fetchers** (`lib/inspec/fetcher/`) — pull profiles from URL, git, Automate…

## Test Approach
| Type | Location | Run command |
|------|----------|-------------|
| Unit | `test/unit/**/*_test.rb` | `bundle exec ruby -Itest test/unit/<file>_test.rb` |
| Functional | `test/functional/**/*_test.rb` | `bundle exec rake test:functional` |
| All | — | `bundle exec rake test` |
| Lint | — | `bundle exec rake test:lint` |

Tests use **Minitest** with `describe/it` syntax and `MockLoader` for resource testing.

---

## Low-Risk Module Analysis

### 3 Candidates

| # | File | Lines | Has Dedicated Test? | External Deps? | Risk |
|---|------|-------|---------------------|----------------|------|
| 1 | `lib/inspec/impact.rb` | 36 | ✅ `test/unit/impact_test.rb` (72 lines) | None — pure Ruby | **Low** |
| 2 | `lib/inspec/resources/bash.rb` | 39 | ✅ `test/unit/resources/bash_test.rb` | `command.rb`, `command_wrapper.rb` | Low-Medium |
| 3 | `lib/inspec/utils/convert.rb` | 15 | ❌ Only indirect coverage | None — pure Ruby | Low (but less visible) |

### ✅ Recommended: `lib/inspec/impact.rb`

**Why it's low risk:**
- **36 lines** — tiny, fully readable in one glance
- **Self-contained** — zero external dependencies; pure Ruby module
- **Dedicated test file** (72 lines, `test/unit/impact_test.rb`) — changes are immediately verifiable
- **Clear domain** — maps CVSS 3.0 severity names (`none/low/medium/high/critical`) to float scores; any addition or change is obvious
- **No side effects** — no I/O, no state, no network; purely functional string↔float mapping
- **Used widely** but in a read-only way — callers pass through scores; no circular deps

**What's safe to practice here:**
- Adding a new named impact level
- Improving error messages
- Adding input validation
- Writing additional edge-case tests
