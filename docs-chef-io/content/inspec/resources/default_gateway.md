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

Use the **default_gateway** Chef InSpec audit resource to test the assigned IP address and interface for the default route.

## Availability

### Install

This resource is distributed with Chef InSpec.

## Syntax

A `default_gateway` Chef InSpec audit resource allows to test the assigned IP address and interface for the default route.

```ruby

    describe default_gateway do
      its("ipaddress") { should eq '172.26.0.1' }
      its("interface") { should eq 'eth0' }
    end
```

> where
>
> - `'ipaddress' and 'interface'` are properties of this resource
> - `172.26.0.1` is the expected value for `'ipaddress'`
> - `eth0` is the expected value for `'interface'`

## Properties

Properties of the resources: `ipaddress` and `interface`.

### ipaddress

The `ipaddress` property tests the assigned IP address for the default route.

### interface

The `interface` property tests the assigned network interface for the default route.

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Ensure IP address matches default route

`ipaddress` fetches the assigned IP address for the default route and by making an comparison using the `eq` matcher.

```ruby

    describe default_gateway do
      its("ipaddress") { should eq '172.26.0.1' }
    end
```

### Ensure interface matches default route

`interface` fetches the assigned network interface for the default route and by making an comparison using the `eq` matcher.

```ruby

    describe default_gateway do
      its("interface") { should eq 'eth0' }
    end
```
