---
title: About the processes Resource
platform: os
---

# processes

Use the `processes` Chef InSpec audit resource to test properties for programs that are running on the system.

<br>

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `processes` resource block declares the name of the process to be tested, and then declares one (or more) property/value pairs:

    describe processes('process_name') do
      its('property_name') { should eq ['property_value'] }
    end

where

* `processes('process_name')` specifies the name of a process to check. If this is a string, it will be converted to a Regexp. For more specificity, pass a Regexp directly. If left blank, all processes will be returned.
* `property_name` may be used to test user (`its('users')`) and state properties (`its('states')`)

<br>

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test if the list length for the mysqld process is 1

    describe processes('mysqld') do
      its('list.length') { should eq 1 }
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

| *unix ps field* | *windows PowerShell Property* |
|:---------------:|:-----------------------------:|
|labels           |PriorityClass|
|pids             |Id|
|cpus             |CPU|
|mem              |PM|
|vsz              |VirtualMemorySize|
|rss              |NPM|
|tty              |SessionId|
|states           |Responding|
|start            |StartTime|
|time             |TotalProcessorTime|
|users            |UserName|
|commands         |Path|

<br>

## Matchers

For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).

### property_name

The `property_name` matcher tests the named property for the specified value:

    its('property_name') { should eq ['property_value'] }
