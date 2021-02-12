+++
title = "sys_info resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "sys_info"
    identifier = "inspec/resources/os/sys_info.md sys_info resource"
    parent = "inspec/resources/os"
+++

Use the `sys_info` Chef InSpec audit resource to test for operating system properties for the named host, and then returns that info as standard output.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

An `sys_info` resource block declares the hostname to be tested:

    describe sys_info do
      its('hostname') { should eq 'value' }
    end

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Get system information for example.com

    describe sys_info do
      its('hostname') { should eq 'example.com' }
    end

### Compare content to hostname

    describe file('/path/to/some/file') do
      its('content') { should match sys_info.hostname }
    end

Options can be passed as arguments to hostname as well.

    describe file('/path/to/some/file') do
      its('content') { should match sys_info.hostname('full') }
    end

Currently supported arguments to `hostname` on Linux platforms are 'full'|'f'|'fqdn'|'long', 'domain'|'d', 'ip_address'|'i', and 'short'|'s'. Mac currently supports 'full'|'f'|'fqdn'|'long' and 'short'|'s'

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### hostname

The `hostname` matcher tests the host for which standard output is returned:

    its('hostname') { should eq 'value' }

### fqdn

The `fqdn` property tests the 'fully qualified domain name' of the system:

    its('fqdn') { should eq 'value' }

### domain

The `domain` property tests the name of the DNS domain:

    its('domain') { should eq 'value' }

### ip-address

The `ip-address` property tests all network addresses of the host:

    its('ip-address') { should eq 'value' }

### short

The `short` property tests the host name cut at the first dot:

    its('short') { should eq 'value' }

### manufacturer

The `manufacturer` matcher tests the host for which standard output is returned:

    its('manufacturer') { should eq 'ACME Corp.' }

### model

The `model` matcher tests the host for which standard output is returned:

    its('model') { should eq 'Flux Capacitor' }
