# InSpec Manual Test Instructions

## Setup

```bash
bundle install
```

## Running Tests

### All tests
```bash
bundle exec rake test
```

### All unit tests
```bash
bundle exec rake test:default
```

### Single test file
```bash
bundle exec ruby -Ilib -Itest test/unit/resources/file_test.rb
```

### Single test by name
```bash
bundle exec ruby -Ilib -Itest test/unit/resources/file_test.rb -n "test name or /regex/"
```

### Functional tests
```bash
bundle exec ruby -Ilib -Itest test/functional/inspec_exec_test.rb
```

### Parallel test run
```bash
bundle exec rake test:parallel
```

### Linter (ChefStyle / RuboCop)
```bash
bundle exec rake test:lint
```

## Writing Unit Tests

Unit tests live in `test/unit/` and use **Minitest** with `describe`/`it` syntax.

```ruby
require "helper"
require "inspec/resources/my_resource"

describe Inspec::Resources::MyResource do
  it "does something on Ubuntu" do
    resource = MockLoader.new(:ubuntu).load_resource("my_resource", "/some/path")
    _(resource.exist?).must_equal true
  end

  it "does something on Windows" do
    resource = MockLoader.new(:windows).load_resource("my_resource", "C:/some/path")
    _(resource.exist?).must_equal true
  end
end
```

- Use `require "helper"` (not `require "minitest/autorun"` directly)
- Use `_(...).must_equal`, `_(...).must_raise`, `_(...).must_be_nil`, etc. for assertions
- Use `resource.stubs(:method_name).returns(value)` for mocking (via Mocha)

## MockLoader Platforms

Pass a platform symbol to `MockLoader.new(platform)` to emulate an OS:

| Symbol | OS / Family |
|--------|------------|
| `:ubuntu` | Ubuntu 22.04 (default) |
| `:centos7` | CentOS 7 |
| `:centos8` | CentOS 8 |
| `:debian8` | Debian 8 |
| `:debian10` | Debian 10 |
| `:windows` | Windows |
| `:windows2019` | Windows Server 2019 |
| `:macos10_16` | macOS (Darwin) |
| `:alpine` | Alpine Linux |
| `:freebsd12` | FreeBSD 12 |
| `:amazon2` | Amazon Linux 2 |
| `:aix` | AIX |
| `:solaris11` | Solaris 11 |
| `:linux` | Alias for `:ubuntu` |

## Functional Tests

Functional tests live in `test/functional/` and test real CLI invocations.

```ruby
require "functional/helper"

describe "inspec exec" do
  parallelize_me!
  include FunctionalHelper

  it "executes a profile" do
    out = inspec("exec #{profile_path} --no-create-lockfile")
    _(out.exit_status).must_equal 0
    _(stdout).must_include "0 failures"
  end
end
```

- Use `inspec("exec ...")` to invoke commands
- Access output via `stdout` and `stderr` helpers (ANSI codes are stripped automatically)
- Use `assert_exit_code 0, out` for exit code assertions
- `profile_path` resolves to `test/fixtures/profiles`

## Test Fixtures

Sample profiles and mock data are in `test/fixtures/`. Reference them in tests via:

```ruby
MockLoader.profile_path("profile-name")   # path to a fixture profile
```
