+++
title = "routing_table resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "routing_table"
    identifier = "inspec/resources/os/routing_table.md routing_table resource"
    parent = "inspec/resources/os"
+++

Use the `routing_table` Chef InSpec audit resource to test the routing information parameters (viz. destination, gateway and interface) present in the routing table. The rule match is done against the output information of `netstat -rn`.


## Availability

### Installation

This resource is distributed with Chef InSpec.

## Syntax

A `routing_table` Chef InSpec audit resource test if an entry of destination, gateway and interface is present as part of the routing table information. All three keys and its value must be passed when testing.

    describe routing_table do
      it { should have_entry(destination: '0.0.0.0', interface: 'eth0', gateway: '172.31.80.1') }
    end
where

- `'destination', 'interface' and 'gateway'` are parameters of the routing table 
- `have_entry` is a matcher of this resource

## Matchers

For a full list of available matchers, please visit our [matchers page](https://docs.chef.io/inspec/matchers/).

The specific matchers of this resource is: `have_entry`

### have_entry

The `have_entry` matcher tests the if the given destination, interface and gateway exists as an entry in the routing table

    it { should have_entry(destination: '0.0.0.0', interface: 'eth0', gateway: '172.31.80.1') }

## Examples
The following examples show how to use this Chef InSpec audit resource.

### Check if an entry with destination as '10.123.137.0', gateway as '0.0.0.0' and interface as 'eth0' exists in the routing table

`have_entry` returns true if the given combination of destination, gateway and interface is a valid entry in the routing table

    describe routing_table do
      it { should have_entry(destination: '10.123.137.0', interface: 'eth0', gateway: '0.0.0.0') }
    end

### Check if an entry with destination as '192.168.43.1/32', gateway as '172.31.80.1' and interface as 'lxdbr0' exists in the routing table

    describe routing_table do
      it do
        should have_entry(
          :destination => '192.168.43.1/32',
          :interface   => 'lxdbr0',
          :gateway     => '172.31.80.1',
        )
      end
    end

