+++
title = "windows_task resource"
draft = false
gh_repo = "inspec"
platform = "windows"

[menu]
  [menu.inspec]
    title = "windows_task"
    identifier = "inspec/resources/os/windows_task.md windows_task resource"
    parent = "inspec/resources/os"
+++

Use the `windows_task` Chef InSpec audit resource to test a scheduled tasks configuration on a Windows platform.
Microsoft and application vendors use scheduled tasks to perform a variety of system maintenance tasks but system administrators can schedule their own.

## Availability

### Installation

{{% inspec/inspec_installation %}}

### Version

This resource first became available in v1.10.0 of InSpec.

## Syntax

A `windows_task` resource block declares the name of the task (as its full path) and tests its configuration:

    describe windows_task('task name uri') do
      its('parameter') { should eq 'value' }
      it { should be_enabled }
    end

where

- `'parameter'` must be a valid parameter defined within this resource ie `logon_mode`, `last_result`, `task_to_run`, `run_as_user`
- `'value'` will be used to compare the value gather from your chosen parameter
- `'be_enabled'` is an example of a valid matcher that checks the state of a task, other examples are `exist` or `be_disabled`

## Examples

The following examples show how to use this Chef InSpec resource.

### Tests that a task is enabled

    describe windows_task('\Microsoft\Windows\Time Synchronization\SynchronizeTime') do
      it { should be_enabled }
    end

### Tests that a task is disabled

    describe windows_task('\Microsoft\Windows\AppID\PolicyConverter') do
      it { should be_disabled }
    end

### Tests the configuration parameters of a task

    describe windows_task('\Microsoft\Windows\AppID\PolicyConverter') do
      its('logon_mode') { should eq 'Interactive/Background' }
      its('last_result') { should eq '1' }
      its('task_to_run') { should cmp '%Windir%\system32\appidpolicyconverter.exe' }
      its('run_as_user') { should eq 'LOCAL SERVICE' }
    end

### Tests that a task is defined

    describe windows_task('\Microsoft\Windows\Defrag\ScheduledDefrag') do
      it { should exist }
    end

## Gathering Task Names

Rather than use the GUI, you can use the `schtasks.exe` to output a full list of tasks available on the system

`schtasks /query /FO list`

rather than use the `list` output you can use `CSV` if it is easier.

Please make sure you use the full TaskName (include the prefix `\`) within your control

    C:\>schtasks /query /FO list
    ...
    Folder: \Microsoft\Windows\Diagnosis
    HostName:      XPS15
    TaskName:      \Microsoft\Windows\Diagnosis\Scheduled
    Next Run Time: N/A
    Status:        Ready
    Logon Mode:    Interactive/Background
    ...

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).
