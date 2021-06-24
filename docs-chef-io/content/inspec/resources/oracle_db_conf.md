+++
title = "oracle_db_conf resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "oracle_db_conf"
    identifier = "inspec/resources/os/oracle_db_conf.md oracle_db_conf resource"
    parent = "inspec/resources/os"
+++

Use the `oracle_db_conf` Chef InSpec audit resource to test the system parameters of Oracle.

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Requirements

You must have access to a database user that has access to the `DBA` role.

## Syntax

A `oracle_db_conf` resource block declares user and password to use. It fetches system parameters which are defined in `V$SYSTEM_PARAMETER` database view, and then compares those parameters to the values stated in the test:

    describe oracle_db_conf(user: 'USER', password: 'PASSWORD') do
      its("config item") { should cmp "value" }
    end

### Optional Parameters

`oracle_db_conf` is based on `oracle_session`, and accepts all parameters that `oracle_session` accepts.

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test parameters set within the database view

    describe oracle_db_conf(user: 'USER', password: 'PASSWORD') do
      its("audit_sys_operations") { should cmp "true" }
      its("sql92_security") { should cmp "true" }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).