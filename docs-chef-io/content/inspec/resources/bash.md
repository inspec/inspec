+++
title = "bash resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "bash"
    identifier = "inspec/resources/os/bash.md bash resource"
    parent = "inspec/resources/os"
+++

Use the `bash` Chef InSpec audit resource to test an arbitrary command that is run on the system using a Bash script.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `command` resource block declares a command to be run, one (or more) expected outputs, and the location to which that output is sent:

    describe bash('command') do
      it { should exist }
      its('property') { should eq 'expected value' }
    end

where

- `'command'` must specify a command to be run
- `'property'` is one of `exit_status`, `stderr`, or `stdout`
- `'expected value'` tests the output of the command run on the system versus the expected output stated in the test

For example:

    describe bash('ls -al /') do
      its('stdout') { should match /bin/ }
      its('stderr') { should eq '' }
      its('exit_status') { should eq 0 }
    end

## Properties

- `exit_status`
- `stderr`
- `stdout`

## Property Examples

### exit_status

The `exit_status` property tests the exit status for the command:

    its('exit_status') { should eq 0 }

### stderr

The `stderr` property tests results of the command as returned in standard error (stderr):

    its('stderr') { should eq '' }

### stdout

The `stdout` property tests results of the command as returned in standard output (stdout).

    its('stdout') { should match /bin/ }

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

If an absolute path is provided, the `exist` matcher tests if the command exists on the filesystem at the specified location. Otherwise, the `exist` matcher tests if the command is found in the PATH.

    it { should exist }
