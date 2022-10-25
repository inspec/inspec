+++
title = "sshd_config resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "sshd_config"
    identifier = "inspec/resources/os/sshd_config.md sshd_config resource"
    parent = "inspec/resources/os"
+++

Use the `sshd_config` Chef InSpec audit resource to test configuration data for the OpenSSH daemon located at `/etc/ssh/sshd_config` on Linux and Unix platforms. sshd---the OpenSSH daemon---listens on dedicated ports, starts a daemon for each incoming connection, and then handles encryption, authentication, key exchanges, command execution, and data exchanges.

## Availability

### Installation

{{% inspec/inspec_installation %}}

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

An `sshd_config` resource block declares the OpenSSH daemon configuration data to be tested:

    describe sshd_config('path') do
      its('name') { should include('foo') }
    end

where

- `name` is a configuration setting in `sshd_config`
- `('path')` is the non-default `/path/to/sshd_config`
- `{ should include('foo') }` tests the value of `name` as read from `sshd_config` versus the value declared in the test

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test which variables may be sent to the server

    describe sshd_config do
      its('AcceptEnv') { should include('CI_ENABLE_COVERAGE') }
    end

### Test for IPv6-only addresses

    describe sshd_config do
      its('AddressFamily') { should cmp 'inet6' }
    end

### Test the Protocol setting

    describe sshd_config do
      its('Protocol') { should cmp 2 }
    end

### Test for approved, strong ciphers

    describe sshd_config do
      its('Ciphers') { should cmp('chacha20-poly1305@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr') }
    end

### Test SSH protocols

    describe sshd_config do
      its('Port') { should cmp  22 }
      its('UsePAM') { should eq 'yes' }
      its('ListenAddress') { should eq nil }
      its('HostKey') do
        should eq [
          '/etc/ssh/ssh_host_rsa_key',
          '/etc/ssh/ssh_host_dsa_key',
          '/etc/ssh/ssh_host_ecdsa_key',
        ]
      end
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### name

The `name` matcher tests the value of `name` as read from `sshd_config` versus the value declared in the test:

    its('name') { should cmp 'foo' }

or:

    its('name') {should include('bar') }
