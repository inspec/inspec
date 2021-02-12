+++
title = "bridge resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "bridge"
    identifier = "inspec/resources/os/bridge.md bridge resource"
    parent = "inspec/resources/os"
+++

Use the `bridge` Chef InSpec audit resource to test basic network bridge properties, such as name, if an interface is defined, and the associations for any defined interface.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `bridge` resource block declares the bridge to be tested and what interface it should be associated with:

    describe bridge('br0') do
      it { should exist }
      it { should have_interface 'eth0' }
    end

## Properties

- On Linux platforms, any value in the `/sys/class/net/{interface}/bridge` directory may be tested
- On the Windows platform, the `Get-NetAdapter` cmdlet is associated with the `Get-NetAdapterBinding` cmdlet and returns the `ComponentID ms_bridge` value as a JSON object

## Property Examples

### interfaces

The `interfaces` property tests if the named interface is present:

    its('interfaces') { should eq 'foo' }
    its('interfaces') { should eq 'bar' }
    its('interfaces') { should include('foo') }

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The `exist` matcher tests if the network bridge is available:

    it { should exist }

### have_interface

The `have_interface` matcher tests if the named interface is defined for the network bridge:

    it { should have_interface 'eth0' }
