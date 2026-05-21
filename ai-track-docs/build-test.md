# Build & Test Reference

## Coverage Baseline — `lib/inspec/impact.rb`

| Metric | Value | Notes |
|--------|-------|-------|
| **Line coverage** | **84.75%** | Measured at Walk Ex3 (after refactor) with 25 inline tests |
| Branch coverage | tracked | Enabled via `enable_coverage :branch` |
| Legitimate gaps | ~10 lines | `rescue LoadError` stub (never fires when mixlib-log is installed) + debug-log emission path (log level not set to DEBUG in tests) |
| Threshold | 75% | Script exits non-zero if coverage drops below this |

### Running coverage locally

```bash
# Standalone — no bundler needed
GEM_PATH=/path/to/rbenv/gems \
  GEM_HOME=/path/to/rbenv/gems \
  /path/to/ruby scripts/coverage-impact.rb

# With full test suite (requires CI_ENABLE_COVERAGE=1)
CI_ENABLE_COVERAGE=1 bundle exec rake test:unit
```

Report written to `coverage/impact/coverage.json` and `coverage/impact/index.html`.

### Coverage gaps explained

| Lines | Reason |
|-------|--------|
| `rescue LoadError` block (~10 lines) | Only fires when `mixlib-log` is absent; not installed in full-stack env |
| `Inspec::Log.debug? / debug` calls | Requires `Inspec::Log` log level set to DEBUG; not set in isolated tests |

---

## Contract Tests — `Inspec::Impact` API (Walk Ex5+)

Contract tests guard the **public API boundary**: severity name/score mapping,
method return types, and error types. They answer "Has the interface changed?"
rather than "Does the logic work?"

| File | Purpose |
|------|---------|
| `test/contract/impact_contract_test.rb` | 16 contract tests, 42 assertions |
| `test/fixtures/impact_scores_golden.json` | Golden file for `IMPACT_SCORES` mapping |
| `scripts/update-impact-contract.rb` | Regenerates the golden file after intentional changes |

### Running contract tests locally

```bash
# No bundler needed — uses stdlib json + minitest
/path/to/ruby -I lib test/contract/impact_contract_test.rb
```

### What is tested

| Contract | Test |
|----------|------|
| `IMPACT_SCORES` names match golden file | `has the same set of severity names` |
| `IMPACT_SCORES` scores match golden file | `has the same score for every severity name` |
| No undocumented severity names added | `has no extra severity names` |
| Scores in ascending order | `scores are in ascending order` |
| `impact_from_string` returns Float for names | `returns Float for every named severity` |
| `impact_from_string` returns String for numerics | `returns String (passthrough)` |
| `string_from_impact` returns String | `returns String for every golden-file score` |
| Both methods raise `Inspec::ImpactError` | error-path tests |
| Full round-trip `name → Float → name` | `round-trip contract` |

### How to update the contract (intentional changes only)

```bash
# 1. Edit IMPACT_SCORES in lib/inspec/impact.rb
# 2. Regenerate the golden file
ruby scripts/update-impact-contract.rb

# 3. Review the diff — confirm only expected values changed
git diff test/fixtures/impact_scores_golden.json

# 4. Commit BOTH files together
git add lib/inspec/impact.rb test/fixtures/impact_scores_golden.json
git commit -s -m "feat: update CVSS severity mapping + contract"
```

> **Never update the golden file without a matching code change.** The golden
> file is evidence that the change was intentional, not accidental.

---

## CI Status

| CI system | Config | Unit tests? |
|-----------|--------|------------|
| GitHub Actions | `.github/workflows/ci-main-pull-request-stub.yml` | `unit-tests: false` — delegated to Buildkite |
| Buildkite | `.buildkite/` (hooks only, no pipeline.yml) | Runs on Chef infra (external) |
| **Crawl Track GHA** | `.github/workflows/crawl-track-impact.yml` | ✅ Runs on every `learn/crawl/**` push |

> **Note:** The main CI stub delegates to `chef/common-github-actions` with
> `unit-tests: false`. Full unit tests run on internal Buildkite infra.
> The crawl-track workflow provides a self-contained alternative for this track.

---

## Local CI Script (Crawl Track)

Runs all impact.rb checks without bundler — works even with rvm/rbenv conflicts:

```bash
# Full run (tests + lint checks)
RUBY_BIN=/path/to/ruby bash scripts/crawl-track-test.sh

# Fast run (tests only, skip lint)
RUBY_BIN=/path/to/ruby bash scripts/crawl-track-test.sh --fast
```

Checks performed:
1. Ruby version >= 3.0
2. Inspec::Impact unit tests (standalone Minitest, no bundler)
3. `# frozen_string_literal: true` present in impact.rb
4. No bare `rescue` clauses

Exit code `0` = all green; `1` = one or more failures.

---

### All tests (unit + functional)
```bash
bundle exec rake test
```

### Unit tests only
```bash
bundle exec ruby -Itest test/unit/<file>_test.rb
```

### Single resource unit test
```bash
bundle exec ruby -Itest test/unit/resources/bash_test.rb
```

### Standalone test (no bundle needed — for pure-Ruby modules like impact.rb)
```bash
ruby -e "
require 'minitest/autorun'
require_relative 'lib/inspec/errors'
require_relative 'lib/inspec/impact'
# ... test code
"
```

> **Local env note**: If you have both rbenv and rvm installed, the full bundle test
> stack may fail due to native extension conflicts (`io-console`). Use the standalone
> runner above for pure-Ruby modules, or resolve the version manager conflict first:
> ```bash
> # Verify which Ruby runs tests successfully:
> /path/to/rbenv/ruby --version
> ```

### Functional tests only
```bash
bundle exec rake test:functional
```

### Lint (Chefstyle / RuboCop)
```bash
bundle exec rake test:lint
```

## Test File Conventions
| Type | Glob | Framework |
|------|------|-----------|
| Unit | `test/unit/**/*_test.rb` | Minitest `describe/it` |
| Functional | `test/functional/**/*_test.rb` | Minitest + FunctionalHelper |
| Integration | `test/integration/` | Kitchen-based |
| Plugin tests | `lib/plugins/*/test/**/*_test.rb` | Minitest |

## Typical Test Structure (Minitest)
```ruby
require "helper"

describe Inspec::Resources::MyResource do
  let(:backend) { MockLoader.new(:ubuntu).load_resource("my_resource") }

  it "returns expected value" do
    _(backend.some_method).must_equal "expected"
  end
end
```

## Fixtures & Mocks
- Test fixtures: `test/fixtures/`
- Mock loader: `test/helper.rb` → `MockLoader.new(:platform).load_resource(...)`

---

## Static Analysis (RuboCop)

InSpec uses **RuboCop** for static analysis. Config: `.rubocop.yml`

### How to run locally

```bash
# Via rbenv (no bundler needed)
GEM_PATH=/Users/mchhalot/.rbenv/versions/3.4.8/lib/ruby/gems/3.4.0 \
  /Users/mchhalot/.rbenv/versions/3.4.8/bin/ruby \
  $(gem contents rubocop | grep '/exe/rubocop$') \
  lib/inspec/impact.rb test/unit/impact_test.rb --format simple

# Via bundler (full stack)
bundle exec rubocop lib/inspec/impact.rb
```

### Current config highlights (`.rubocop.yml`)

| Setting | Value | Reason |
|---------|-------|--------|
| `AllCops.NewCops` | `enable` | Opt in to new cops as they land |
| `Layout/ArgumentAlignment` | `with_first_argument` | Existing project style |
| `Metrics/BlockLength` | exempt `test/**/*` | Minitest describe blocks are inherently long |
| `Metrics/MethodLength.Max` | `20` | impact.rb methods need nil-guard + timing + range check + logging |
| `Style/ClassAndModuleChildren` | disabled | Compact style (`module Inspec::X`) used in 160+ files |
| `Style/MultilineIfModifier` | disabled | `unless defined?(X)` guard on module stub is idiomatic |
| `Naming/MethodParameterName.AllowedNames` | `op` | log schema field name |

### Exercise 14 fixes applied

| Finding | Fix |
|---------|-----|
| `Lint/Syntax` — endless methods `def f() = val` in rescue stub | Converted to regular `def`/`end` methods |
| `Style/FrozenStringLiteralComment` in test file | Added `# frozen_string_literal: true` |
| `Metrics/BlockLength` in test describe blocks | Exempted `test/**/*` in config |
| `Style/StringLiterals` — double quotes without interpolation | Autocorrected to single quotes (71 occurrences) |
| `Naming/PredicatePrefix` — `is_number?` | Renamed to `number?` (private method) |
| `Layout/LineLength` — long error message strings | Extracted to `expected` variable or split across lines |
| `Style/TrivialAccessors` — manual writer method | Converted `logging_enabled=` to `attr_writer` |
| `Style/TrailingCommaInHashLiteral` | Autocorrected |
