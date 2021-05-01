---
title: About the interface Resource
platform: os
---

# interface

Use the `interface` Chef InSpec audit resource to test basic network adapter properties, such as name, status, and link speed (in MB/sec).

* On Linux platforms, `/sys/class/net/#{iface}` is used as source
* On the Windows platform, the `Get-NetAdapter` cmdlet is used as source

<br>

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

An `interface` resource block declares network interface properties to be tested:

    describe interface('eth0') do
      it { should be_up }
      its('speed') { should eq 1000 }
      its('name') { should eq eth0 }
    end

<br>

## Properties

`name`, `speed`

<br>

## Resource Property Examples

### name

The `name` property tests if the named network interface exists:

    its('name') { should eq eth0 }

### speed

The `speed` property tests the speed of the network interface, in MB/sec:

    its('speed') { should eq 1000 }

### ipv4_addresses

The `ipv4_addresses` property tests if the specified address exists on the named network interface:

    its('ipv4_addresses') { should include '127.0.0.1' }

### ipv4_addresses_netmask

The `ipv4_addresses_netmask` property tests if the specified address and netmask exists on the named network interface:

    its('ipv4_addresses_netmask') { should include '127.0.0.1/255.0.0.0' }

### ipv6_addresses

The `ipv6_addresses` property tests if the specified address exists on the named network interface:

    its('ipv6_addresses') { should include '::1' }

### ipv4_cidrs

The `ipv4_cidrs` property tests if the specified address and netmask combination exists on the named network interface:

    its('ipv4_cidrs') { should include '127.0.0.1/8' }

### ipv6_cidrs

The `ipv6_cidrs` property tests if the specified address and netmask combination exists on the named network interface:

    its('ipv6_cidrs') { should include '::1/128' }

<br>

## Matchers

For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).

### be_up

The `be_up` matcher tests if the network interface is available:

    it { should be_up }

### have_an_ipv4_address

The `have_an_ipv4_address` matcher tests if the network interface has any IPv4 addresses assigned:

    it { should have_an_ipv4_address }

### have_an_ipv6_address

The `have_an_ipv6_address` matcher tests if the network interface has any IPv6 addresses assigned:

    it { should have_an_ipv6_address }
