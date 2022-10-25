+++
title = "zfs_pool resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "zfs_pool"
    identifier = "inspec/resources/os/zfs_pool.md zfs_pool resource"
    parent = "inspec/resources/os"
+++

Use the `zfs_pool` Chef InSpec audit resource to test the ZFS pools on FreeBSD & Linux (Centos, RHEL, Ubuntu, CloudLinux, Debian) systems.

## Availability

### Installation

{{% inspec/inspec_installation %}}

### Version

This resource first became available in v1.16.0 of InSpec.

## Syntax

A `zfs_pool` resource block declares the ZFS pool properties that should be tested:

    describe zfs_pool('pool') do
      it { should MATCHER 'value' }
    end

where:

- `('pool')` is the name of the ZFS pool (eg: `'tank'`)
- `MATCHER` is a valid matcher for this resource
- `'value'` is the value to be tested

## Properties

This Chef InSpec audit resource dynamically exposes all ZFS pool properties available (see: `man zpool` for the list of supported properties).

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test a pool of 'tank'

    describe zfs_pool('tank') do
      its('autoexpand') { should eq  'off' }
      its('failmode') { should eq  'continue' }
      its('feature@lz4_compress') { should eq  'active' }
      its('health') { should eq  'ONLINE' }
      its('listsnapshots') { should eq  'off' }
      its('readonly') { should eq  'off' }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).
