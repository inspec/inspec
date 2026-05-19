# Build & Test Guide

## Prerequisites

- Ruby ≥ 3.1.0 (see `inspec-core.gemspec` for exact constraint)
- Bundler
- Git

## Setup

```bash
bundle install
```

For GitHub-hosted gem sources, set a token to avoid rate-limiting:

```bash
bundle config --global github.com YOUR_USERNAME:YOUR_TOKEN
export GITHUB_TOKEN=ghp_your-token
```

---

## Running Tests

### Full test suite

```bash
bundle exec rake test
```

### Unit tests only

```bash
bundle exec rake test:unit
```

### Single test file (fastest feedback loop)

```bash
bundle exec ruby -Ilib:test test/unit/utils/nginx_parser_test.rb
```

### Functional tests (CLI end-to-end)

```bash
bundle exec rake test:functional
```

### Integration tests

```bash
bundle exec rake test:integration
```

### Parallel execution

```bash
bundle exec rake test:parallel
```

---

## Linting

```bash
bundle exec chefstyle
```

---

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

---

## Verified Example (NginxParser)

The recommended low-risk module was tested successfully:

```bash
$ bundle exec ruby -Ilib:test test/unit/utils/nginx_parser_test.rb
Run options: --seed 1440

# Running:

........................

Finished in 0.014349s, 1672.5905 runs/s, 2648.2682 assertions/s.

24 runs, 38 assertions, 0 failures, 0 errors, 0 skips
```

Test file: `test/unit/utils/nginx_parser_test.rb`
Source file: `lib/inspec/utils/nginx_parser.rb`

---

## Common Pitfalls

- Frozen string literals: use `+""` for mutable strings.
- Ruby version-specific gems: check `Gemfile` conditionals before upgrading.
- `CHANGELOG.md` is auto-generated — never edit manually.
- Always run `bundle install` after switching branches (gem versions may differ).
- Use `-Ilib:test` when running individual test files to set the load path correctly.
