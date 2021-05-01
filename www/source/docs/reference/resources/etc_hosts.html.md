---
title: About the etc_hosts Resource
platform: linux
---

# etc_hosts

Use the `etc_hosts` Chef InSpec audit resource to test rules set to match IP addresses with hostnames.

<br>

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.37.6 of InSpec.

## Syntax

An etc/hosts rule specifies an IP address and what its hostname is along with optional aliases it can have.

<br>

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

* `ip_address` is the ip address of the hostname in either ipv4 or ipv6 format.
* `primary_name` is the name associated with the ip address.
* `all_host_names` is a list including the primary_name as the first entry followed by any alias names the host has.

<br>

## Properties

    'ip_address', 'primary_name', 'all_host_names'

<br>

## Property Examples

### ip_address

`ip_address` returns a string array of ip addresses specified in the etc/hosts file.

    describe etc_hosts.where { primary_name == 'localhost' } do
      its('ip_address') { should cmp '127.0.1.154' }
    end

### primary_name

`primary_name` returns a string array of primary_names specified in the etc/hosts file.

    describe etc_hosts.where { ip_address == '::1' } do
      its('primary_name') { should cmp 'localhost' }
    end

### all\_host_names

`all_host_names` returns a two dimensional string array where each entry has the primary_name first followed by any aliases.

    describe etc_hosts.where { ip_address == '127.0.1.154' } do
      its('all_host_names') { should eq [['localhost', 'localhost.localdomain', 'localhost4', 'localhost4.localdomain4'],  ['localhost', 'localhost.localdomain', 'localhost6', 'localhost6.localdomain6']] }
    end

<br>

## Matchers

For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).
