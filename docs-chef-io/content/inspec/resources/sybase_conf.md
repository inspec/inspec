+++
title = "sybase_conf resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "sybase_conf"
    identifier = "inspec/resources/os/sybase_conf.md sybase_conf resource"
    parent = "inspec/resources/os"
+++

Use the `sybase_conf` Chef InSpec audit resource to test the configuration of an SAP Adaptive Server Enterprise (ASE) database.

## Availability

### Installation

{{% inspec/inspec_installation %}}

### Requirements

The `isql` command line tool must be installed on the target system.

You must have access to a database user that has access to the `sa` role on the `master` database.

## Syntax

A `sybase_conf` resource block declares the configuration item name, server, and password to use.

    describe sybase_session('config item', server: 'SYBASE', password: 'PASSWORD') do
      its('run_value') { should cmp 'EXPECTED' }
      its('config_value') { should cmp 'EXPECTED' }
    end

where

- `sybase_conf` declares a configuration item, server, and password with permission to run `sp_configure`.
- `its('run_value') { should cmp 'expected' }` compares the current running value of the configuration item against an expected value.
- `its('config_value') { should cmp 'expected' }` compares the saved value of the configuration item against an expected value.

### Optional Parameters

The `sybase_conf` resource is based on the `sybase_session` resource and accepts all parameters that `sybase_session` accepts, including optional parameters `username`, `database`, `sybase_home`, and `bin`.

In particular:

#### `database`

Defaults to `master`.

#### `username`

Defaults to `sa`.

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test for max memory configuration

```ruby
describe sybase_session('max memory', server: 'SYBASE', password: 'PASSWORD') do
  its('run_value') { should cmp 180224 }
  its('config_value') { should cmp 180224 }
end
```

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).
