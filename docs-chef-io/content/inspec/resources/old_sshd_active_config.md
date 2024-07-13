+++
title = "sshd_active_config resource"
draft = false
gh_repo = "inspec"
platform = "linux"
dsads
[menu]
  [menu.inspec]
    title = "sshd_active_config"
    identifier = "inspec/resources/os/sshd_active_config.md sshd_active_config resource"
    parent = "inspec/resources/os"
+++
# todo: explain how active is diff from normal resource
Use the `sshd_active_config` Chef InSpec audit resource to test configuration data for the OpenSSH daemon located at `/etc/ssh/sshd_active_config` on Linux and Unix platforms. sshd---the OpenSSH daemon---listens on dedicated ports, starts a daemon for each incoming connection, and then handles encryption, authentication, key exchanges, command execution, and data exchanges.
## Availability

### Install

{{< readfile file="content/inspec/reusable/md/inspec_installation.md" >}}

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

An `sshd_active_config` resource block declares the OpenSSH daemon configuration data to be tested:

    describe sshd_active_config do
      its('name') { should include('foo') }
    end

where

- `name` is a configuration setting in `sshd_active_config`
- `{ should include('foo') }` tests the value of `name` as read from `sshd_active_config` versus the value declared in the test

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test which variables may be sent to the server

    describe sshd_active_config do
      its('AcceptEnv') { should include('CI_ENABLE_COVERAGE') }
    end

### Test for IPv6-only addresses

    describe sshd_active_config do
      its('AddressFamily') { should cmp 'inet6' }
    end

### Test the Protocol setting

    describe sshd_active_config do
      its('Protocol') { should cmp 2 }
    end

### Test for approved, strong ciphers

    describe sshd_active_config do
      its('Ciphers') { should cmp('chacha20-poly1305@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr') }
    end

### Test SSH protocols

    describe sshd_active_config do
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

{{< readfile file="content/inspec/reusable/md/inspec_matchers_link.md" >}}

This resource has the following special matchers.

### name

The `name` matcher tests the value of `name` as read from `sshd_active_config` versus the value declared in the test:

    its('name') { should cmp 'foo' }

or:

    its('name') {should include('bar') }
