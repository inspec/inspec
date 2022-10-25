+++
title = "processes resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "processes"
    identifier = "inspec/resources/os/processes.md processes resource"
    parent = "inspec/resources/os"
+++

Use the `processes` Chef InSpec audit resource to test the properties of system programs.

## Availability

### Installation

The Chef InSpec distributes this resource.

### Version

This resource is available from InSpec 1.0 version.

## Syntax

A `processes` resource block declares the process name that must be tested and defines one or more property and value pairs.

    describe processes('NAME') do
      its('property_name') { should eq ['VALUE'] }
    end

> where
>
> - `process_name` specifies the name of the process to test. If the value is a string, it is converted to a `Regexp`. You can pass a `Regexp` directly for more accurate results. If left blank returns all processes.
> - `property_name` is a valid property of this resource.
> - `property_value` is the expected value for the specified property.

## Properties

The specific properties of this resource are: `labels`, `pids`, `cpus`, `mem`, `vsz`, `rss`, `tty`, `states`, `start`, `time`, `users`, `commands`, `count`, and `list`

Usage of these properties is as follows:

    its('property_name') { should eq ['VALUE'] }

## Matchers

For a full list of available matchers, please visit the [matchers page](/inspec/matchers/).

The specific matcher of this resource is: `be_running`.

### be_running

The `be_running` matcher tests if the named process is running:

    it { should be_running }

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test if the mysqld process list length is 1

    describe processes('SQLD') do
      its('list.length') { should eq 1 }
    end

### Test if the mysqld process count is 1

    describe processes('SQLD') do
      its('count') { should eq 1 }
    end

### Test if the user owns the process

    describe processes('init') do
      its('users') { should eq ['ROOT'] }
    end

    describe processes('winlogon') do
      its('users') { should cmp "NT AUTHORITY\\SYSTEM" }
    end

### Test if a high-priority process is running

    describe processes('linux_process') do
      its('states') { should eq ['R<'] }
    end

    describe processes('windows_process') do
      its('labels') { should cmp "HIGH" }
    end

### Test if a process exists on the system

    describe processes('some_process') do
      it { should exist }
    end

### Test if a process is running on the system

    describe processes('some_process') do
      it { should be_running }
    end

### Test for a process using a specific Regexp

Use `regexp` if the process name is too common for a string to find it uniquely. You may need to include whitespace characters.

    describe processes(Regexp.new("/usr/local/bin/swap -d")) do
      its('list.length') { should eq 1 }
    end

### Notes for auditing Windows systems

Sometimes there is no direct comparison between different operating systems and system properties. Most of the `property_name` do align between the various operating systems.

However, there are some exceptions. For example, within Linux operating system, `states` offer multiple properties. Windows operating systems do not have a direct comparison on a single property. Hence, `states` is mapped to the property of `Responding` and determines a boolean (true/false) flag if the process is hung.

The following mapping table aids you in understanding the Unix field property mapping to the Windows `Get-Process` property:

| _unix ps field_ | _windows PowerShell Property_ |
| :-------------: | :---------------------------: |
|     labels      |         PriorityClass         |
|      pids       |              Id               |
|      cpus       |              CPU              |
|       mem       |              PM               |
|       vsz       |       VirtualMemorySize       |
|       rss       |              NPM              |
|       tty       |           SessionId           |
|     states      |          Responding           |
|      start      |           StartTime           |
|      time       |      TotalProcessorTime       |
|      users      |           UserName            |
|    commands     |             Path              |
