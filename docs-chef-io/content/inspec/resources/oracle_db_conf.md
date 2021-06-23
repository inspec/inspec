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

Use the `oracle_db_conf` Chef InSpec audit resource to test the database system parameters defined in oracle database view `V$SYSTEM_PARAMETER`. These parameters are accessed through oracle session via SQL query. The permission of this `V$SYSTEM_PARAMETER` view is only limited to the DBA by default.

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

## Syntax

A `oracle_db_conf` resource block declares system parameters which are defined in `V$SYSTEM_PARAMETER` database view, and then compares those parameters to the values stated in the test:

  # Test parameters set within the database view
  describe oracle_db_conf(user: 'USER', password: 'PASSWORD') do
    its("audit_sys_operations") { should cmp "true" }
    its("sql92_security") { should cmp "true" }
  end

## Examples

The following examples show how to use this Chef InSpec audit resource.

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).