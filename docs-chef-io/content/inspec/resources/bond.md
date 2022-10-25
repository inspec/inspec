+++
title = "bond resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "bond"
    identifier = "inspec/resources/os/bond.md bond resource"
    parent = "inspec/resources/os"
+++

Use the `bond` Chef InSpec audit resource to test a logical, bonded network interface (i.e. "two or more network interfaces aggregated into a single, logical network interface"). On Linux platforms, any value in the `/proc/net/bonding` directory may be tested.

## Availability

### Installation

{{% inspec/inspec_installation %}}

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `bond` resource block declares a bonded network interface, and then specifies the properties of that bonded network interface to be tested:

    describe bond('name') do
      it { should exist }
    end

where

- `'name'` is the name of the bonded network interface
- `{ should exist }` is a valid matcher for this resource

## Properties

### content

The `content` property returns the contents in the file that defines the bonded network interface. The values of the `content` property are arbitrary.

    its('content') { should match('value') }

### interfaces

The `interfaces` property tests if the named secondary interfaces are available.

    its('interfaces') { should eq ['eth0', 'eth1', ...] }

### mode

The `mode` property returns the Bonding Mode.

    its('mode') { should eq 'IEEE 802.3ad Dynamic link aggregation' }

### params

The `params` property returns arbitrary parameters for the bonded network interface.

    its('params') { should eq 'value' }

## Examples

### Test if eth0 is a secondary interface for bond0

    describe bond('bond0') do
      it { should exist }
      it { should have_interface 'eth0' }
    end

### Test parameters for bond0

    describe bond('bond0') do
      its('mode') { should eq 'IEEE 802.3ad Dynamic link aggregation' }
      its('params') { should have_key 'Transmit Hash Policy' }
      its('params') { should include 'Transmit Hash Policy' => 'layer3+4 (1)' }
      its('params') { should have_key 'MII Status' }
      its('params') { should include 'MII Status' => 'up' }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The `exist` matcher tests if the bonded network interface is available:

    it { should exist }

### have_interface

The `have_interface` matcher tests if the bonded network interface has one (or more) secondary interfaces:

    it { should have_interface }
