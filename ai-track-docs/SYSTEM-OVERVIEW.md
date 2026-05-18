# InSpec System Overview

## What is InSpec?

InSpec is an open-source infrastructure testing framework written in Ruby. It provides a human-readable DSL for writing security and compliance tests that can be shared across development, operations, and security teams.

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

- **inspec** – full gem with all dependencies
- **inspec-core** – core without heavy CLI/transport deps
- **inspec-bin** / **inspec-core-bin** – CLI entry-point gems

## Execution Flow (simplified)

1. CLI parses options → `Inspec::Config`
2. Runner loads profile(s) and resolves dependencies
3. Transport backend connects to target (local or remote)
4. Controls are evaluated; resources query system state
5. Results collected and emitted through selected reporter(s)

## Key External Dependencies

- **Train** – transport abstraction (SSH, WinRM, Docker, etc.)
- **Thor** – CLI framework
- **ChefLicensing** – commercial entitlement checks
- **Habitat** – packaging for deployment
