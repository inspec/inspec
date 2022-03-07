+++
title = "mssql_sys_conf resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "mssql_sys_conf"
    identifier = "inspec/resources/os/mssql_sys_conf.md mssql_sys_conf resource"
    parent = "inspec/resources/os"
+++

Use the `mssql_sys_conf` Chef InSpec audit resource to test the configuration of a Microsoft SQL Server database.

## Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

## Requirements

You must have database access.

## Syntax

A `mssql_sys_conf` resource block declares the configuration item, user, and password to test.

```ruby
describe mssql_sys_conf("CONFIGURATION ITEM TO TEST", user: 'USER', password: 'PASSWORD') do
  its("value_in_use") { should cmp "EXPECTED_VALUE" }
  its("value_configured") { should cmp "EXPECTED_VALUE" }
end
```

where:

- `mssql_sys_conf` declares a configuration item, `user`, and `password` with permission to use `sys.configurations`.
- `its('value_in_use') { should cmp 'EXPECTED_VALUE' }` compares the current running value of the configuration item against an expected value.
- `its('value_configured') { should cmp 'EXPECTED_VALUE' }` compares the saved value of the configuration item against an expected value.

### Optional Parameters

`mssql_sys_conf` is based on the `mssql_session` resource and accepts all the parameters that `mssql_session` accepts.

#### `username`

The user name. Default value: `SA`.

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test parameters set within the database view

    describe mssql_sys_conf("clr_enabled", user: 'USER', password: 'PASSWORD') do
      its("value_in_use") { should cmp "0" }
      its("value_configured") { should cmp "0" }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).
