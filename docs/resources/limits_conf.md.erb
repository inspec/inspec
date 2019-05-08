---
title: About the limits_conf Resource
platform: linux
---

# limits_conf

Use the `limits_conf` Chef InSpec audit resource to test configuration settings in the `/etc/security/limits.conf` file. The `limits.conf` defines limits for processes (by user and/or group names) and helps ensure that the system running those processes remains stable. Each process may be assigned a hard or soft limit.

* Soft limits are maintained by the shell and defines the number of file handles (or open files) available to the user or group after login
* Hard limits are maintained by the kernel and defines the maximum number of allowed file handles

Entries in the `limits.conf` file are similar to:

    grantmc     soft   nofile   4096
    grantmc     hard   nofile   63536

    ^^^^^^^^^   ^^^^   ^^^^^^   ^^^^^
    domain      type    item    value

<br>

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `limits_conf` resource block declares a domain to be tested, along with associated type, item, and value:

    describe limits_conf('path') do
      its('domain') { should include ['type', 'item', 'value'] }
      its('domain') { should eq ['type', 'item', 'value'] }
    end

where

* `('path')` is the non-default path to the `inetd.conf` file
* `'domain'` is a user or group name, such as `grantmc`
* `'type'` is either `hard` or `soft`
* `'item'` is the item for which limits are defined, such as `core`, `nofile`, `stack`, `nproc`, `priority`, or `maxlogins`
* `'value'` is the value associated with the `item`

<br>

## Properties

* `domain`

<br>

## Examples

The following examples show how to use this Chef InSpec audit resource.

### domain

The `domain` property tests the domain in the `limits.conf` file, along with associated type, item, and value:

    its('domain') { should include ['type', 'item', 'value'] }
`
For example:

    its('grantmc') { should include ['hard', 'nofile', '63536'] }

### Test limits

    describe limits_conf('path') do
      its('*') { should include ['soft', 'core', '0'], ['hard', 'rss', '10000'] }
      its('ftp') { should eq ['hard', 'nproc', '0'] }
    end

<br>

## Matchers

For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).


