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

## Safe Practice Module
`lib/inspec/resources/bash.rb` — small, self-contained, no external deps.
