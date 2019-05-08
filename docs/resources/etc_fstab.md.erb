---
title: About the etc_fstab Resource
platform: linux
---

# etc_fstab

Use the `etc_fstab` Chef InSpec audit resource to test information about all partitions and storage devices on a Linux system.

<br>

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.37.6 of InSpec.

## Syntax

An etc_fstab rule specifies a device name, its mount point, its mount type, the options its mounted with,
its dump options, and the order the files system should be checked.

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

<br>

## Properties

* `device_name` is the name associated with the device.
* `mount_point` is the directory at which the filesystem is configured to be mounted.
* `file_system_type` is the type of file system of the device or partition.
* `mount_options` is the options for the device or partition.
* `dump_options` is a number used by dump to decide if a file system should be backed up.
* `file_system_options` is a number that specifies the order the file system should be checked.

<br>

## Property Examples

### device_name

`device_name` returns a string array of device names mounted on the system.

    describe etc_fstab.where { mount_point == '/mnt/sr0' } do
      its('device_name') { should cmp '/dev/sr0' }
    end

### mount_point

`mount_point` returns a string array of directories at which filesystems are configured to be mounted.

    describe etc_fstab.where { device_name == '/dev/sr0' } do
      its('mount_point') { should cmp '/mnt/sr0' }
    end

### file\_system_type

`file_system_type` returns a String array of each partitions file system type.

    describe etc_fstab.where { device_name == '/dev/sr0' } do
      its('file_system_type') { should cmp 'iso9660' }
    end

### mount_options

`mount_options` returns a two dimensional array of each partitions mount options.

    describe etc_fstab.where { mount_point == '/' } do
      its('mount_options') { should eq [['defaults', 'x-systemd.device-timeout=0']] }
    end

### dump_options

`dump_options` returns a integer array of each partitions dump option.

    describe etc_fstab.where { device_name == '/dev/sr0' } do
      its('dump_options') { should cmp 0 }
    end

### file\_system\_options

`file_system_options` returns a integer array of each partitions file system option.

    describe etc_fstab.where { device_name == '/dev/sr0' } do
      its('file_system_options') { should cmp 0 }
    end

### Check all partitions that have type of 'nfs'

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

<br>

## Matchers

For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).
