+++
title = "interfaces resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "interfaces"
    identifier = "inspec/resources/os/interfaces.md interfaces resource"
    parent = "inspec/resources/os"
+++

Use the `interfaces` Chef InSpec audit resource to test the properties of multiple network interfaces on the system.

## Syntax

An `interfaces` resource block may take no arguments, in which case it will list all interfaces:

    describe interfaces do
      its('names') { should include 'eth0' }
    end

An `interfaces` resource block may take a where clause, filtering on a Filter Criterion:

    # All eth- interfaces
    describe interfaces.where(name: /^eth\d+/)
      its('names') { should include 'eth0' }
    end

Like any Chef InSpec resource, you may also use it for data lookup instead of testing:

    # We are an IPv6 shop
    interfaces.where(name: /^eth/).names do |name|
      describe interface(name) do
        it { should have_ipv6_address }
      end
    end

    # Obtain the machine's main IP address
    my_ip = interfaces.ipv4_address

## Filter Criteria

### name

String. The name of an interface.

## Properties

### count

The `count` property returns an Integer describing how many interfaces matched.

  its("count") { should eq 6 }

### ipv4_address

Attempts to guess the "first" "real" IPv4 address on any interface. Looks for interfaces that are up and have IPv4 addresses assigned, then tries to filter out loopback, management (10/8) and local (192.168/16) IP addresses, returning the best of of those that it can; you may still get nil, or a loopback address.  Note that if the machine is behind NAT this will not be the external IP address; use the `http` resource to query an IP lookup service for that.

  its('ipv4_address') { should_not eq '127.0.0.1' }

### names

The `names` property returns an Array of Strings representing the names of the interfaces.

  its("names") { should include "eth0" }

## Matchers

For a full list of available universal matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The `exist` matcher tests true if at least one interface exists on the system. This is almost always the case.

    it { should exist }
