+++
title = "ssh_config resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "ssh_config"
    identifier = "inspec/resources/os/ssh_config.md ssh_config resource"
    parent = "inspec/resources/os"
+++

Use the `ssh_config` Chef InSpec audit resource to test OpenSSH client configuration data located at `/etc/ssh/ssh_config` on Linux and Unix platforms.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

An `ssh_config` resource block declares the client OpenSSH configuration data to be tested:

    describe ssh_config('path') do
      its('name') { should include('foo') }
    end

where

- `name` is a configuration setting in `ssh_config`
- `('path')` is the non-default `/path/to/ssh_config`
- `{ should include('foo') }` tests the value of `name` as read from `ssh_config` versus the value declared in the test

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test SSH configuration settings

    describe ssh_config do
      its('cipher') { should contain '3des' }
      its('port') { should eq '22' }
      its('hostname') { should include('example.com') }
    end

### Test which variables from the local environment are sent to the server

    only_if do
      command('sshd').exist? or command('ssh').exists?
    end

    describe ssh_config do
      its('SendEnv') { should include('CI_ENABLE_COVERAGE') }
    end

### Test SSH configuration

    describe ssh_config do
      its('Host') { should eq '*' }
      its('Tunnel') { should eq nil }
      its('SendEnv') { should eq 'LANG LC_*' }
      its('HashKnownHosts') { should eq 'yes' }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### name

The `name` matcher tests the value of `name` as read from `ssh_config` versus the value declared in the test:

    its('name') { should eq 'foo' }

or:

    its('name') { should include('bar') }
