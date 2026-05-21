# InSpec – Build & Test Reference

> Quick-start guide for local development, linting, and test execution.

---

## Prerequisites

| Tool | Minimum version |
|------|----------------|
| Ruby | 3.1 |
| Bundler | 2.x |
| Git | 2.x |
| Docker (optional) | 20.x (for integration tests against containers) |

---

## 1. Initial Setup

```bash
# Clone the repo
git clone https://github.com/inspec/inspec.git
cd inspec

# Avoid GitHub API rate-limits when bundling
bundle config --global github.com <username>:<token>

# Install dependencies
bundle install
```

---

## 2. Run the CLI Locally

```bash
# Run a profile against localhost
bundle exec inspec exec examples/profile

# Open an interactive shell (local)
bundle exec inspec shell

# Remote via SSH
bundle exec inspec exec examples/profile -t ssh://user@host
```

---

## 3. Linting

InSpec uses **RuboCop** for style and **Chefstyle** for project-specific rules.

```bash
# Run RuboCop (full)
bundle exec rubocop

# Run with auto-correct (safe fixes only)
bundle exec rubocop -a

# Lint a specific file
bundle exec rubocop lib/inspec/resources/file.rb
```

---

## 4. Unit Tests

Framework: **Minitest** with describe/it syntax.

```bash
# All unit tests
bundle exec rake test:unit

# Single test file
bundle exec ruby -Ilib -Itest test/unit/resources/file_test.rb

# Run tests matching a pattern
bundle exec rake test:unit TEST=test/unit/resources/file_test.rb
```

### Writing a Unit Test

```ruby
require "helper"

describe Inspec::Resources::MyResource do
  let(:backend) { MockLoader.new(:ubuntu2204).bind }
  let(:resource) { load_resource("my_resource", backend) }

  it "returns correct value" do
    _(resource.some_method).must_equal "expected"
  end
end
```

---

## 5. Functional Tests

Functional tests exercise the CLI end-to-end against fixture profiles.

```bash
bundle exec rake test:functional
```

---

## 6. Integration Tests

Require a live target (Docker, VM, or cloud). Set `INSPEC_TEST_TARGET` or use
profile-specific rake tasks:

```bash
# Docker-based integration
bundle exec rake test:integration
```

---

## 7. Full Test Suite

```bash
bundle exec rake test
```

---

## 8. Building the Gem

```bash
gem build inspec.gemspec
gem build inspec-core.gemspec
```

---

## 9. Habitat Package (local build)

```bash
hab studio enter
build
```

---

## 10. Useful Rake Tasks

```bash
bundle exec rake -T          # List all tasks
bundle exec rake lint        # Lint only
bundle exec rake test:unit   # Unit tests only
bundle exec rake test:functional
bundle exec rake test:integration
bundle exec rake docs        # Generate YARD docs
```

---

## 11. Environment Variables

| Variable | Purpose |
|----------|---------|
| `INSPEC_LOG_LEVEL` | Set log verbosity (`debug`, `info`, `warn`, `error`) |
| `INSPEC_CONFIG_DIR` | Override config directory (default `~/.inspec`) |
| `GITHUB_TOKEN` | Avoid Bundler GitHub API rate limits |
| `INSPEC_TEST_TARGET` | Default transport target for integration tests |

---

## 12. Common Issues

**Bundler can't resolve dependencies**  
→ Run `bundle update --conservative` or check Ruby version compatibility in `Gemfile`.

**Frozen string error in tests**  
→ Use `+""` for mutable strings: `out = +""; out << data`.

**RuboCop offense on new file**  
→ Add `# frozen_string_literal: true` at the top of every Ruby file.
