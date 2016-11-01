---
title: InSpec Matchers Reference
---

# InSpec Matchers Reference

Inspec uses matchers to help compare resource values to expectations.
The following matchers are available:

* `be`
* `cmp`
* `eq`
* `include`
* `match`

## be

This matcher can be followed by many different comparison operators.
Always make sure to use numbers, not strings, for these comparisons.

```ruby
describe file('/proc/cpuinfo') do
  its('size') { should be >= 10 }
  its('size') { should be < 1000 }
end
```

## cmp

Unlike `eq`, cmp is a matcher for less-restrictive comparisons. It will
try to fit the actual value to the type you are comparing it to. This is
meant to relieve the user from having to write type-casts and
resolutions.

```ruby
describe sshd_config do
  its('Protocol') { should cmp 2 }
end

describe passwd.uid(0) do
  its('users') { should cmp 'root' }
end
```

`cmp` behaves in the following way:

* Compare strings to numbers

    ```ruby
    describe sshd_config do
      its('Protocol') { should eq '2' }

      its('Protocol') { should cmp '2' }
      its('Protocol') { should cmp 2 }
    end
    ```

* String comparisons are not case-sensitive

    ```ruby
    describe auditd_conf do
      its('log_format') { should cmp 'raw' }
      its('log_format') { should cmp 'RAW' }
    end
    ```

* Compare arrays with only one entry to a value

    ```ruby
    describe passwd.uids(0) do
      its('users') { should cmp 'root' }
      its('users') { should cmp ['root'] }
    end
    ```

* Single-value arrays of strings may also be compared to a regex

    ```ruby
    describe auditd_conf do
      its('log_format') { should cmp /raw/i }
    end
    ```

* Improved printing of octal comparisons

    ```ruby
    describe file('/proc/cpuinfo') do
      its('mode') { should cmp '0345' }
    end

    expected: 0345
    got: 0444
    ```

## eq

Test for exact equality of two values.

```ruby
describe sshd_config do
  its('RSAAuthentication') { should_not eq 'no' }
  its('Protocol') { should eq '2' }
end
```

It fails if types don't match. Please keep this in mind, when comparing
configuration entries that are numbers:

```ruby
its('Port') { should eq '22' } # ok

its('Port') { should eq 22 }
# fails: '2' != 2 (string vs int)
```

For less restrictive comparisons, please use `cmp`.

## include

Verifies if a value is included in a list.

```ruby
describe passwd do
  its('users') { should include 'my_user' }
end
```

## match

Check if a string matches a regular expression.

```ruby
describe sshd_config do
  its('Ciphers') { should_not match /cbc/ }
end
```
