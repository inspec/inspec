---
title: About the bond Resource
platform: linux
---

# bond

Use the `bond` Chef InSpec audit resource to test a logical, bonded network interface (i.e. "two or more network interfaces aggregated into a single, logical network interface"). On Linux platforms, any value in the `/proc/net/bonding` directory may be tested.

<br>

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `bond` resource block declares a bonded network interface, and then specifies the properties of that bonded network interface to be tested:

    describe bond('name') do
      it { should exist }
    end

where

* `'name'` is the name of the bonded network interface
* `{ should exist }` is a valid matcher for this resource

<br>

## Property Examples

The following examples show how to use this Chef InSpec audit resource.

### content

The `content` matcher tests if contents in the file that defines the bonded network interface match the value specified in the test. The values of the `content` matcher are arbitrary.

    its('content') { should match('value') }

### interfaces

The `interfaces` matcher tests if the named secondary interfaces are available.

    its('interfaces') { should eq ['eth0', 'eth1', ...] }

### mode

The `mode` matcher tests the Bonding Mode.

    its('mode') { should eq 'IEEE 802.3ad Dynamic link aggregation' }

### params

The `params` matcher tests arbitrary parameters for the bonded network interface.

    its('params') { should eq 'value' }

### Test if eth0 is a secondary interface for bond0

    describe bond('bond0') do
      it { should exist }
      it { should have_interface 'eth0' }
    end

### Test parameters for bond0

    describe bond('bond0') do
      its('mode') { should eq 'IEEE 802.3ad Dynamic link aggregation' }
      its('Transmit Hash Policy') { should eq 'layer3+4 (1)' }
      its('MII Status') { should eq 'up' }
      its('MII Polling Interval (ms)') { should eq '100' }
      its('Up Delay (ms)') { should eq '0' }
      its('Down Delay (ms)') { should eq '0' }
    end

<br>

## Matchers

For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).

### exist

The `exist` matcher tests if the bonded network interface is available:

    it { should exist }

### have_interface

The `have_interface` matcher tests if the bonded network interface has one (or more) secondary interfaces:

    it { should have_interface }

