+++
title = "toml resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "toml"
    identifier = "inspec/resources/os/toml.md toml resource"
    parent = "inspec/resources/os"
+++

Use the `toml` Chef InSpec audit resource to test settings in a TOML file.

## Availability

### Installation

{{% inspec/inspec_installation %}}

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

An `toml` resource block declares the configuration settings to be tested:

```ruby
describe toml('path') do
  its('setting_name') { should eq 'value' }
end
```

where:

- `'setting_name'` is a setting key defined in the TOML file.
- `('path')` is the path to the TOML file.
- `{ should eq 'value' }` is the value that is expected.


## Properties

This resource supports any of the settings listed in a TOML file as properties.

## Examples

In the examples below, the `example.toml` file contains the following data:

```toml
port = 8080
fruits = ["apple", "banana", "cantaloupe"]

[section]
key1 = "value1"
```

**Verify the port number:**

```ruby
describe toml('path/to/example.toml') do
  its('port') { should eq 8080 }
end
```

**Verify the value of an array using brackets:**

```ruby
describe toml('path/to/example.toml') do
  its(['fruits', 0]) { should eq 'apple' }
end
```

**Verify the value of a key in a table using brackets:**

```ruby
describe toml('path/to/example.toml') do
  its(['section', 'key1']) { should cmp 'value1' }
end
```

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).
