# Build & Test Reference

## Prerequisites
```bash
gem install bundler
bundle install
```

> Tip: set `BUNDLE_GITHUB__COM=username:token` to avoid GitHub API rate limits.

## Running Tests

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
