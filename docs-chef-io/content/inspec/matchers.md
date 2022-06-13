+++
title = "Chef InSpec Universal Matchers Reference"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "Matchers"
    identifier = "inspec/reference/matchers.md Matchers"
    parent = "inspec/reference"
    weight = 40
+++

Chef InSpec uses **matchers**, a testing framework based on [RSpec](https://rspec.info/), to help compare resource values to expectations. The following matchers are available:

- [`be`](#be) - makes numeric comparisons.
- [`be_in`](#be_in) - looks for the property value in a list.
- [`cmp`](#cmp) - checks the equality (general-use).
- [`eq`](#eq) - checks the type-specific equality.
- [`include`](#include) - looks for an expected value in a list-valued property.
- [`match`](#match) - looks for patterns in text using regular expressions.

You can use any matcher provided by [RSpec::Expectations](https://relishapp.com/rspec/rspec-expectations/docs); however, these matchers are not [supported by InSpec](/inspec/inspec_and_friends/#rspec).

See [Test Expectations with Chef InSpec](https://learn.chef.io/courses/course-v1:chef+Inspec101+Perpetual/about) on Learn Chef to learn more about Chef InSpec's built-in matchers.

## be

Use the `be` matcher with comparison operators, and use numbers and not strings for these comparisons. For example:

```ruby
describe file('/proc/cpuinfo') do
  its('size') { should be >= 10 }
  its('size') { should be < 1000 }
end
```

## be_in

`be_in` verifies if an item is included in a list. For example:

```ruby
describe resource do
  its('item') { should be_in LIST }
end
```

## cmp

Unlike [`eq`](#eq), `cmp` makes less restrictive comparisons. It tries to fit the actual value to the type you are comparing. This matcher is meant to relieve the user from having to write type casts and resolutions.

Examples:

```ruby
describe sshd_config do
  its('Protocol') { should cmp 2 }
end

describe passwd.uid(0) do
  its('users') { should cmp 'root' }
end
```

The `cmp` matcher compares values in the following ways:

- `cmp` can compare strings to numbers:

  ```ruby
  describe sshd_config do
    # Only '2' works
    its('Protocol') { should eq '2' }

    # Both of these work
    its('Protocol') { should cmp '2' }
    its('Protocol') { should cmp 2 }
  end
  ```

- `cmp` comparisons are not case sensitive:

  ```ruby
  describe auditd_conf do
    its('log_format') { should cmp 'raw' }
    its('log_format') { should cmp 'RAW' }
  end
  ```

- `cmp` recognizes versions embedded in strings:

  ```ruby
  describe package('curl') do
    its('version') { should cmp > '7.35.0-1ubuntu2.10' }
  end
  ```

- `cmp` can compare a single-value array with a string to a value:

  ```ruby
  describe passwd.uids(0) do
    its('users') { should cmp 'root' }
    its('users') { should cmp ['root'] }
  end
  ```

- `cmp` can compare a single-value array with a string to a regular expression:

  ```ruby
  describe auditd_conf do
    its('log_format') { should cmp /raw/i }
  end
  ```

- `cmp` allows octal comparisons:

  ```ruby
  describe file('/proc/cpuinfo') do
    its('mode') { should cmp '0345' }
  end

  expected: 0345
  got: 0444
  ```

## eq

`eq` tests for exact equality of two values. For example:

```ruby
describe sshd_config do
  its('RSAAuthentication') { should_not eq 'no' }
  its('Protocol') { should eq '2' }
end
```

`eq` fails if types do not match. When comparing configuration entries that take numerical values, do not use quotes as it becomes a string.

```ruby
its('Port') { should eq '22' }
# passes

its('Port') { should eq 22 }
# fails: '2' != 2 (string vs integer)
```

Use [`cmp`](#cmp) for less restrictive comparisons.

## include

`include` verifies if a value is included in a list. For example:

```ruby
describe passwd do
  its('users') { should include 'my_user' }
end
```

## match

`match` checks if a string matches a regular expression. For example:

```ruby
describe sshd_config do
  its('Ciphers') { should_not match /cbc/ }
end
```
