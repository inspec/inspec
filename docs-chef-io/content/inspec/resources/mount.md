+++
title = "mount resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "mount"
    identifier = "inspec/resources/os/mount.md mount resource"
    parent = "inspec/resources/os"
+++

Use the `mount` Chef InSpec audit resource to test the mount points on FreeBSD and Linux systems.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

An `mount` resource block declares the synchronization settings that should be tested:

    describe mount('path') do
      it { should MATCHER 'value' }
    end

where

- `('path')` is the path to the mounted directory
- `MATCHER` is a valid matcher for this resource
- `'value'` is the value to be tested

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test a the mount point on '/'

    describe mount('/') do
      it { should be_mounted }
      its('device') { should eq  '/dev/mapper/VolGroup-lv_root' }
      its('type') { should eq  'ext4' }
      its('options') { should eq ['rw', 'mode=620'] }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### be_mounted

The `be_mounted` matcher tests if the file is accessible from the file system:

    it { should be_mounted }

### device

The `device` matcher tests the device from the `fstab` table:

    its('device') { should eq  '/dev/mapper/VolGroup-lv_root' }

### options

The `options` matcher tests the mount options for the file system from the `fstab` table:

    its('options') { should eq ['rw', 'mode=620'] }

### type

The `type` matcher tests the file system type:

    its('type') { should eq  'ext4' }
