+++
title = "interface resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "interface"
    identifier = "inspec/resources/os/interface.md interface resource"
    parent = "inspec/resources/os"
+++

Use the `interface` Chef InSpec audit resource to test basic network adapter properties, such as name, status, IP addresses, and link speed (in MB/sec).

- On Linux platforms, `/sys/class/net/#{iface}` is used as source
- On the Windows platform, the `Get-NetAdapter` cmdlet is used as source
- On BSD and MacOS platforms, the `ifconfig` command is used as source. Link speed may not be available.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of Chef InSpec.

## Syntax

An `interface` resource block declares network interface properties to be tested:

    describe interface('eth0') do
      it { should be_up }
      its('speed') { should eq 1000 }
      its('name') { should eq eth0 }
      its('ipv4_addresses') { should include '10.0.0.5' }
    end

## Properties

`ipv4_address`, `ipv4_addresses`, `ipv4_addresses_netmask`, `ipv4_cidrs`, `ipv6_addresses`, `ipv6_cidrs`, `name`, `speed`

## Resource Property Examples

### ipv4_address

Returns the first `ipv4_addresses` entry as a String. Note: this property is incompatible with ServerSpec, which returns the value including the CIDR range, such as '10.0.0.5/32'.

    its('ipv4_address') { should eq '10.0.0.5' }

### ipv4_addresses

The `ipv4_addresses` property returns an Array of IPv4 addresses as Strings. You may then test if the specified address exists on the named network interface:

    its('ipv4_addresses') { should include '127.0.0.1' }

### ipv4_addresses_netmask

The `ipv4_addresses_netmask` property returns an Array of Strings with each containing the IPv4 address, a slash, and the netmask. You may then test if the specified address and netmask exists on the named network interface:

    its('ipv4_addresses_netmask') { should include '127.0.0.1/255.0.0.0' }

### ipv6_address

Returns the first `ipv6_address` entry. Note: this property is incompatible with ServerSpec, which returns the value including the CIDR range.

    its('ipv6_address') { should eq '2089:98b::faeb' }

### ipv6_addresses

The `ipv6_addresses` property returns an Array of Strings and tests if the specified address exists on the named network interface:

    its('ipv6_addresses') { should include '::1' }

### ipv4_cidrs

The `ipv4_cidrs` property returns an Array of Strings and tests if the specified address and netmask combination exists on the named network interface:

    its('ipv4_cidrs') { should include '127.0.0.1/8' }

### ipv6_cidrs

The `ipv6_cidrs` property returns an Array of Strings and tests if the specified address and netmask combination exists on the named network interface:

    its('ipv6_cidrs') { should include '::1/128' }

### name

The `name` property returns the name of the interface:

    its('name') { should eq 'eth0' }

### speed

The `speed` property tests the speed of the network interface, in MB/sec. Note: On BSD and MacOS platforms, this value may be nil, because it difficult to obtain reliably.

    its('speed') { should eq 1000 }

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### be_up

The `be_up` matcher tests if the network interface is available:

    it { should be_up }

### exist

The `exist` matcher tests if the network interface exists:

    it { should exist }

### have\_an\_ipv4\_address

The `have_an_ipv4_address` matcher tests if the network interface has any IPv4 addresses assigned:

    it { should have_an_ipv4_address }

### have_an_ipv6_address

The `have_an_ipv6_address` matcher tests if the network interface has any IPv6 addresses assigned:

    it { should have_an_ipv6_address }
