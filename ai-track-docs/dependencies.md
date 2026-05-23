# Dependency Notes

## Critical Dependencies

These are the runtime gems that directly affect InSpec's core parsing,
execution, and transport layers. Changes here have high blast radius.

| Gem | Constraint | Role | Risk if broken |
|-----|-----------|------|----------------|
| `train-core` | `~> 3.16, >= 3.16.1` | Transport abstraction (local, SSH, WinRM, Docker) | All remote execution fails |
| `train` | `~> 3.16, >= 3.16.1` | Full train with all plugins | Same as above + plugin load failures |
| `thor` | `>= 0.20, < 1.5.0` | CLI framework | CLI won't start |
| `parslet` | `>= 1.5, < 3.0` | PEG parser (nginx, erlang configs) | Config resource parsing breaks |
| `rspec` | `>= 3.9, <= 3.14` | Matcher DSL used in controls | All profile execution breaks |
| `chef-licensing` | `>= 1.2.0` | License enforcement | InSpec refuses to start |
| `faraday` | `>= 1, < 3` | HTTP client for Automate, fetchers | Remote profiles + reporting fail |
| `rubyzip` | `>= 1.2.2, < 4.0` | Profile archive support | Can't load .zip profiles |
| `hashie` | `>= 3.4, < 6.0` | Deep hash/struct access in configs | Resource data access fails |

## Pinning Rationale

### Already pinned (with known reasons)

| Gem | Pin | Why |
|-----|-----|-----|
| `thor` | `< 1.5.0` | Thor 1.3+ broke alias handling in CLI tests (see gemspec TODO) |
| `ffi` | `>= 1.15.5, < 1.17.0` | v1.17.0 requires rubygems >= 3.3.22, breaks verify pipeline |
| `parslet` | `< 3.0` | Upstream note references issue #5389; major API change risk |
| `train-winrm` | `~> 0.4.0` | socks5h proxy support added in 0.4.0; patch-only updates safe |

### Proposed minimal constraints (no upgrades needed)

These are conservative pins to prevent accidental breakage from
future major-version yanks or incompatible releases:

```ruby
# Already safe — no changes needed:
# thor, ffi, parslet, train-core, train — all adequately bounded

# Could tighten (optional, low-priority):
# hashie ">= 3.4, < 6.0"    → consider "~> 5.0" once < 5.x support dropped
# faraday ">= 1, < 3"        → already bounded; no action needed
# rubyzip ">= 1.2.2, < 4.0"  → already bounded; no action needed
```

**Verdict:** Current constraints are well-maintained. No tightening required
at this time. The existing upper bounds prevent surprise major-version jumps.

## Gems to Watch

| Gem | Concern | Action |
|-----|---------|--------|
| `thor` | Pin at `< 1.5.0`; monitor for alias fix upstream | Re-evaluate after Thor 1.5 release |
| `ffi` | Pinned `< 1.17.0`; blocks native gem updates | Re-evaluate when CI rubygems is upgraded |
| `parslet` | No release since 2020; effectively unmaintained | Low risk (stable), but no upstream fixes |
| `ostruct` | `>= 0.1, < 0.7` — extracted from stdlib in Ruby 3.4 | Monitor Ruby 3.5 changes |
| `mutex_m` | Commented out; needed for chef-licensing on Ruby 3.4 | Uncomment once chef-licensing ships fix |

## Ruby Version

- **Required:** `>= 3.1.0` (both `inspec-core.gemspec` and `inspec.gemspec`)
- **Gemfile conditionals:** None currently (previous Ruby < 3.1 guards removed)

## How to Audit

```bash
# Show outdated gems with available updates:
bundle outdated

# Check for known vulnerabilities:
bundle audit check --update

# Visualize dependency tree for a specific gem:
bundle info parslet
bundle exec gem dependency parslet --reverse
```
