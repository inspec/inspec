+++
title = "etc_fstab resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "etc_fstab"
    identifier = "inspec/resources/os/etc_fstab.md etc_fstab resource"
    parent = "inspec/resources/os"
+++

Use the `etc_fstab` Chef InSpec audit resource to test information about all partitions and storage devices on a Linux system.

## Availability

### Installation

{{% inspec/inspec_installation %}}

### Version

This resource first became available in v1.37.6 of InSpec.

## Syntax

An etc_fstab rule specifies a device name, its mount point, its mount type, the options it mounted with,
its dump options and the files system options should be checked.

Use the where clause to match a property to one or more rules in the fstab file:

    describe etc_fstab.where { device_name == 'value' } do
      its('mount_point') { should cmp 'hostname' }
      its('file_system_type') { should cmp 'list' }
      its('mount_options') { should cmp 'list' }
      its('dump_options') { should cmp 'list' }
      its('file_system_options') { should cmp 'list' }
    end

Use the optional constructor parameter to give an alternative path to fstab file:

    describe etc_fstab(hosts_path).where { device_name == 'value' } do
      its('mount_point') { should cmp 'hostname' }
      its('file_system_type') { should cmp 'list' }
      its('mount_options') { should cmp 'list' }
      its('dump_options') { should cmp 'list' }
      its('file_system_options') { should cmp 'list ' }
    end

## Properties

### device_name

The `device_name` property returns a string array including the device names mounted on the system.

    describe etc_fstab.where { mount_point == '/mnt/sr0' } do
      its('device_name') { should cmp '/dev/sr0' }
    end

### mount_point

The `mount_point` property returns a string array including the path of directories at which filesystems are configured to be mounted.

    describe etc_fstab.where { device_name == '/dev/sr0' } do
      its('mount_point') { should cmp '/mnt/sr0' }
    end

### file_system_type

The `file_system_type` property returns a string array including each device or partitions file system type.

    describe etc_fstab.where { device_name == '/dev/sr0' } do
      its('file_system_type') { should cmp 'iso9660' }
    end

### mount_options

The `mount_options` property returns a two dimensional array of each partition's mount options.

    describe etc_fstab.where { mount_point == '/' } do
      its('mount_options') { should eq [['defaults', 'x-systemd.device-timeout=0']] }
    end

### dump_options

The `dump_options` property returns an integer array of each partitions dump option. This is a number used by dump to decide if a file system should be backed up.

    describe etc_fstab.where { device_name == '/dev/sr0' } do
      its('dump_options') { should cmp 0 }
    end

### file_system_options

The `file_system_options` property returns an integer array of each partitions file system option. This is a number that specifies the order in which the file system should be checked.

    describe etc_fstab.where { device_name == '/dev/sr0' } do
      its('file_system_options') { should cmp 0 }
    end

## Examples

### Check all partitions that have a type of 'nfs'

    nfs_systems = etc_fstab.nfs_file_systems.entries
    nfs_systems.each do |partition|
      describe partition do
        its('mount_options') { should include 'nosuid' }
      end
    end

### Check the partition mounted at /home contains 'nosuid' in its mount_options

    describe etc_fstab do
      its('home_mount_options') { should include 'nosuid' }
    end

### Check if a partition is mounted at a point

    describe etc_fstab.where { mount_point == '/home' } do
      it { should be_configured }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).
