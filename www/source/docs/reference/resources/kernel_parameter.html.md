---
title: About the kernel_parameter Resource
platform: linux
---

# kernel_parameter

Use the `kernel_parameter` Chef InSpec audit resource to test kernel parameters on Linux platforms.
 These parameters are located under `/proc/cmdline`.
<br>

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `kernel_parameter` resource block declares a parameter and then a value to be tested:

    describe kernel_parameter('path.to.parameter') do
      its('value') { should eq 0 }
    end

where

* `'kernel.parameter'` must specify a kernel parameter, such as `'net.ipv4.conf.all.forwarding'`
* `{ should eq 0 }` states the value to be tested

<br>

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test if global forwarding is enabled for an IPv4 address

    describe kernel_parameter('net.ipv4.conf.all.forwarding') do
      its('value') { should eq 1 }
    end

### Test if global forwarding is disabled for an IPv6 address

    describe kernel_parameter('net.ipv6.conf.all.forwarding') do
      its('value') { should eq 0 }
    end

### Test if an IPv6 address accepts redirects

    describe kernel_parameter('net.ipv6.conf.interface.accept_redirects') do
      its('value') { should cmp 'true' }
    end

<br>

## Matchers

For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).
