# Build & Test Reference

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
