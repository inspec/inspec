+++
title = "etc_hosts resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "etc_hosts"
    identifier = "inspec/resources/os/etc_hosts.md etc_hosts resource"
    parent = "inspec/resources/os"
+++

Use the `etc_hosts` Chef InSpec audit resource to test rules set to match IP addresses with hostnames.

## Availability

### Installation

{{% inspec/inspec_installation %}}

### Version

This resource first became available in v1.37.6 of InSpec.

## Syntax

An etc/hosts rule specifies an IP address and what its hostname is along with optional aliases it can have.

## Syntax

Use the `.where` clause to match a property to one or more rules in the hosts file:

    describe etc_hosts.where { ip_address == 'value' } do
      its('primary_name') { should cmp 'hostname' }
      its('all_host_names') { should cmp 'list' }
    end

Use the optional resource parameter to give an alternative path to the hosts file:

    describe etc_hosts('path/to/hosts').where { ip_address == 'value' } do
      its('primary_name') { should cmp 'hostname' }
      its('all_host_names') { should cmp 'list' }
    end

where

- `ip_address` is the IP address of the hostname in either ipv4 or ipv6 format.
- `primary_name` is the name associated with the IP address.
- `all_host_names` is a list including the primary_name as the first entry followed by any alias names the host has.

## Properties

### ip_address

The `ip_address` property returns a string array of ip addresses specified in the etc/hosts file.

    its('ip_address') { should cmp '127.0.1.154' }

### primary_name

The `primary_name` property returns a string array of primary_names specified in the etc/hosts file.

    its('primary_name') { should cmp 'localhost' }

### all_host_names

The `all_host_names` property returns a two-dimensional string array where each entry has the primary_name first followed by any aliases.

    its('all_host_names') { should cmp 'list' }

## Examples

### Test the IP address of the given primary name 'localhost'.

    describe etc_hosts.where { primary_name == 'localhost' } do
      its('ip_address') { should cmp '127.0.1.154' }
    end

### Test the primay name for where ip address is '::1'
    describe etc_hosts.where { ip_address == '::1' } do
      its('primary_name') { should cmp 'localhost' }
    end

### Test the list of primary names and their aliases for the given IP address.

    describe etc_hosts.where { ip_address == '127.0.1.154' } do
      its('all_host_names') { should eq [['localhost', 'localhost.localdomain', 'localhost4', 'localhost4.localdomain4'],  ['localhost', 'localhost.localdomain', 'localhost6', 'localhost6.localdomain6']] }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).
