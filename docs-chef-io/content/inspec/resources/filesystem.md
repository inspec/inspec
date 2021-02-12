+++
title = "filesystem resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "filesystem"
    identifier = "inspec/resources/os/filesystem.md filesystem resource"
    parent = "inspec/resources/os"
+++

Use the `filesystem` Chef InSpec resource to audit filesystem disk space usage.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.51.0 of InSpec.

The `free_kb`, `size_kb`, and `type` properties became available in v3.6 of InSpec.

### Note

Versions of this resource in Chef InSpec prior to 3.5.x offered a property `size`, which returned a value in GB when on Windows and a value in KB on Linux, though it was documented to always return KB. All new code should use `size_kb` which is unit-stable. The property `size` will remain available in Chef InSpec v3 and 4, but will be deprecated in the future.

## Syntax

A `filesystem` resource block declares tests for disk space in a partition:

    describe filesystem('/') do
      its('size_kb') { should be >= 32 * 1024 * 1024}
      its('free_kb') { should be >= 50 * 1024 }
      its('percent_free') { should be >= 20 }
      its('type') { should cmp 'ext4' }
    end

where

- `filesystem('/')` states that the resource will look at the root (/) partition.
- `size_kb` is the total partition size and is measured in kilobytes (KB).
- `free_kb` is the available space on the partition and is measured in kilobytes (KB).
- `percent_free` is the percentage of available free space, and ranges from 0 to 100.

## Resource Property Examples

The following examples show how to use this Chef InSpec audit resource.

### Test if the root partition is greater than 32000 KB

    describe filesystem('/') do
      its('size_kb') { should be >= 32000 }
    end

### Test that the root partition has more than 5GB free

    describe filesystem('/') do
      its('free_kb') { should be >= 5000000 }
    end

### Test if the C:\ partition is NTFS

Note that Windows filesystems (drives) are referred to without any slashes:

    describe filesystem('c:') do
      its('type') { should cmp 'NTFS' }
    end

### Test if the /var partition has sufficient free space

    describe filesystem('/var') do
      its('percent_free') { should be >= 20 }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).
