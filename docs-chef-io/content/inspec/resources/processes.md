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

Use the `processes` Chef InSpec audit resource to test properties for programs that are running on the system.

## Availability

### Installation

This resource is distributed with Chef InSpec.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `processes` resource block declares the name of the process to be tested, and then declares one (or more) property/value pairs:

    describe processes('process_name') do
      its('property_name') { should eq ['property_value'] }
    end

where

- `'process_name'` specifies the name of a process to check. If this is a string, it will be converted to a Regexp. For more specificity, pass a Regexp directly. If left blank, all processes will be returned.
- `property_name` is some valid property of this resource.
- `property_value` is the expected value for the specified property.

## Properties

The specific properties of this resource are: `labels`, `pids`, `cpus`, `mem`, `vsz`, `rss`, `tty`, `states`, `start`, `time`, `users`, `commands`, `count` and `list`

The properties can be used as:

    its('property_name') { should eq ['property_value'] }

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

The specific matcher of this resource is: `be_running`

### be_running

The `be_running` matcher tests if the named process is running:

    it { should be_running }

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test if the list length for the mysqld process is 1

    describe processes('mysqld') do
      its('list.length') { should eq 1 }
    end

### Test if the process count for the mysqld process is 1

    describe processes('mysqld') do
      its('count') { should eq 1 }
    end

### Test if the process is owned by a specific user

    describe processes('init') do
      its('users') { should eq ['root'] }
    end

    describe processes('winlogon') do
      its('users') { should cmp "NT AUTHORITY\\SYSTEM" }
    end

### Test if a high-priority process is running

    describe processes('linux_process') do
      its('states') { should eq ['R<'] }
    end

    describe processes('windows_process') do
      its('labels') { should cmp "High" }
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

If the process name is too common for a string to uniquely find it,
you may use a regexp. Inclusion of whitespace characters may be
needed.

    describe processes(Regexp.new("/usr/local/bin/swap -d")) do
      its('list.length') { should eq 1 }
    end

### Notes for auditing Windows systems

Sometimes with system properties there isn't a direct comparison between different operating systems.
Most of the `property_name`'s do align between the different OS's.

There are however some exception's, for example, within linux `states` offers multiple properties.
Windows doesn't have direct comparison that is a single property so instead `states` is mapped to the property of `Responding`, This is a boolean true/false flag to help determine if the process is hung.

Below is a mapping table to help you understand what property the unix field maps to the windows `Get-Process` Property

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

