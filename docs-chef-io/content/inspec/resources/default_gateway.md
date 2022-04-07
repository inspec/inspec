+++
title = "default_gateway resource"
draft = false
gh_repo = "inspec"
platform = "unix"

[menu]
  [menu.inspec]
    title = "default_gateway"
    identifier = "inspec/resources/os/default_gateway.md default_gateway resource"
    parent = "inspec/resources/os"
+++

Use the `default_gateway` Chef InSpec audit resource to test the assigned ip address and interface for the default route.


## Availability

### Installation

This resource is distributed with Chef InSpec.

## Syntax

A `default_gateway` Chef InSpec audit resource allows to test the assigned ip address and interface for the default route.

    describe default_gateway do
      its("ipaddress") { should eq '172.26.0.1' }
      its("interface") { should eq 'eth0' }
    end
where

- `'ipaddress' and 'interface'` are property of this resource
- `172.26.0.1` is the expected value for `'ipaddress'`
- `172.26.4.74` is the expected value for `'interface'`

## Properties

- Properties of the resources: `ipaddress` and `interface`

### ipaddress

The ipaddress property tests the assigned ip address for the default route.

### interface

The interface property tests the assigned network interface for the default route.

## Examples
The following examples show how to use this Chef InSpec audit resource.

### ipaddress 

`ipaddress` fetches the assigned ip address for the default route and comparison is done using the `eq` matcher against the value.

    describe default_gateway do
      its("ipaddress") { should eq '172.26.0.1' }
    end

### interface

`interface` fetches the assigned network interface for the default route and comparison is done using the `eq` matcher against the value.

    describe default_gateway do
      its("interface") { should eq 'eth0' }
    end

