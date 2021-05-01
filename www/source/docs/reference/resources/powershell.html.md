---
title: About the powershell Resource
platform: windows
---

# powershell

Use the `powershell` Chef InSpec audit resource to test a Powershell script on the Windows platform.

<br>

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `powershell` resource block declares a Powershell script to be tested, and then compares the output of that command to the matcher in the test:

    script = <<-EOH
      # a PowerShell script
    EOH

    describe powershell(script) do
      its('property') { should eq 'output' }
    end

where

* `'script'` must specify a Powershell script to be run
* `'matcher'` is one of `exit_status`, `stderr`, or `stdout`
* `'output'` tests the output of the command run on the system versus the output value stated in the test

<br>

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Get all groups of Administrator user

    script = <<-EOH
      # find user
      $user = Get-WmiObject Win32_UserAccount -filter "Name = 'Administrator'"
      # get related groups
      $groups = $user.GetRelated('Win32_Group') | Select-Object -Property Caption, Domain, Name, LocalAccount, SID, SIDType, Status
      $groups | ConvertTo-Json
    EOH

    describe powershell(script) do
      its('stdout') { should_not eq '' }
    end

### Write-Output 'hello'

The following Powershell script:

    script = <<-EOH
      Write-Output 'hello'
    EOH

can be tested in the following ways.

For a newline:

    describe powershell(script) do
      its('stdout') { should eq "hello\r\n" }
      its('stderr') { should eq '' }
    end

Removing whitespace `\r\n` from `stdout`:

    describe powershell(script) do
      its('strip') { should eq "hello" }
    end

No newline:

    describe powershell("'hello' | Write-Host -NoNewLine") do
      its('stdout') { should eq 'hello' }
      its('stderr') { should eq '' }
    end

<br>

## Matchers

For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).

### exit_status

The `exit_status` matcher tests the exit status for the command:

    its('exit_status') { should eq 123 }

### stderr

The `stderr` matcher tests results of the command as returned in standard error (stderr):

    its('stderr') { should eq 'error' }

### stdout

The `stdout` matcher tests results of the command as returned in standard output (stdout):

    its('stdout') { should eq '/^1$/' }
