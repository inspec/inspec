+++
title = "oracle_listener_conf resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "oracle_listener_conf"
    identifier = "inspec/resources/os/oracle_listener_conf.md oracle_listener_conf resource"
    parent = "inspec/resources/os"
+++

Use the `oracle_listener_conf` Chef InSpec audit resource to test the listeners settings of Oracle DB, typically located at `$ORACLE_HOME/network/admin/listener.ora` or `$ORACLE_HOME\network\admin\listener.ora` depending upon the platform.

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

## Syntax

A `oracle_listener_conf` resource block declares oracle listeners settings in the `listener.ora` file, and then compares the listeners settings in file to the value stated in the test:

  # Test parameters set within the listener file
  describe oracle_listener_conf do
    its('DEFAULT_SERVICE_LISTENER') { should eq 'XE' }
    its('EM_EXPRESS_PORT') { should eq '5500' }
  end 

## Examples

The following examples show how to use this Chef InSpec audit resource.

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).