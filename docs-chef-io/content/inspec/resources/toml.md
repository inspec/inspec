+++
title = "toml resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "toml"
    identifier = "inspec/resources/os/toml.md toml resource"
    parent = "inspec/resources/toml"
+++

Use the `toml` Chef InSpec audit resource to test settings in a .toml file.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

An `toml` resource block declares the configuration settings to be tested:

    describe toml('path') do
      its('setting_name') { should eq 'value' }
    end

where

- `'setting_name'` is a setting key defined in the toml file
- `('path')` is the path to the toml file
- `{ should eq 'value' }` is the value that is expected

Assume the following TOML file:

    port = 8080
    fruits = ["apple", "banana", "cantaloupe"]

    [section]
    key1 = "value1"


For example:

    describe toml('path/to/toml_file.toml') do
      its('port') { should eq 8080 }
    end

Array values may be accessed by using brackets:

    describe toml('path/to/toml_file.toml') do
      its(['fruits', 0]) { should eq 'apple' }
    end

Settings inside of sections, such as the following can be retrieved by using brackets as well:

    describe toml('path/to/toml_file.toml') do
      its(['section', 'key1']) { should cmp 'value1' }
    end


## Properties

This resource supports any of the settings listed in an toml file as properties.

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).
