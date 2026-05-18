# Build & Test Guide

## Prerequisites

- Ruby (see `.ruby-version` or gemspec for supported versions)
- Bundler
- Git

## Setup

```bash
bundle install
```

For GitHub-hosted gem sources, set a token to avoid rate-limiting:

```bash
bundle config --global github.com YOUR_USERNAME:YOUR_TOKEN
```

## Running Tests

### Full unit suite

```bash
bundle exec rake test
```

### Single unit test file

```bash
bundle exec ruby -Ilib:test test/unit/path/to_test.rb
```

### Functional tests

```bash
bundle exec rake test:functional
```

### Integration tests

```bash
bundle exec rake test:integration
```

## Linting

```bash
bundle exec chefstyle
```

## Building Gems

```bash
gem build inspec.gemspec
gem build inspec-core.gemspec
cd inspec-bin && gem build inspec-bin.gemspec
```

## Habitat Package (Linux)

```bash
cd habitat/x86_64-linux
hab pkg build .
```

## Common Pitfalls

- Frozen string literals: use `+""` for mutable strings.
- Ruby version-specific gems: check `Gemfile` conditionals before upgrading.
- `CHANGELOG.md` is auto-generated — never edit manually.
