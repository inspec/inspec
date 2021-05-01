---
title: About the host Resource
platform: os
---

# host

Use the `host` Chef InSpec audit resource to test the name used to refer to a specific host and its availability, including the Internet protocols and ports over which that host name should be available.

<br>

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `host` resource block declares a host name, and then (depending on what is to be tested) a port and/or a protocol:

    describe host('example.com', port: 80, protocol: 'tcp') do
      it { should be_reachable }
      it { should be_resolvable }
      its('ipaddress') { should include '12.34.56.78' }
    end

where

* `host()` must specify a host name and may specify a port number and/or a protocol
* `'example.com'` is the host name
* `port:` is the port number
* `protocol: 'name'` is the Internet protocol: TCP (`protocol: 'tcp'`), UDP (`protocol: 'udp'` or  ICMP (`protocol: 'icmp'`))

<br>

## Resource Properties

* `connection`, `ipaddress`, `protocol`, `socket`

<br>

## Resource Examples

The following examples show how to use this Chef InSpec audit resource.

### ipaddress

The `ipaddress` matcher tests if a host name is resolvable to a specific IP address:

    describe host('example.com') do
      its('ipaddress') { should include '93.184.216.34' }
    end

### Verify host name is reachable over a specific protocol and port number

    describe host('example.com', port: 80, protocol: 'tcp') do
      it { should be_reachable }
    end

### Verify that a specific IP address can be resolved

    describe host('example.com') do
      it { should be_resolvable }
      its('ipaddress') { should include '93.184.216.34' }
    end

### Review the connection setup and socket contents when checking reachability

    describe host('example.com', port: 12345, protocol: 'tcp') do
      it { should be_reachable }
      its('connection') { should_not match /connection refused/ }
      its('socket') { should match /STATUS_OK/ }
    end

<br>

## Matchers

This Chef InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).

### be_reachable

The `be_reachable` matcher tests if the host name is available:

    it { should be_reachable }

### be_resolvable

The `be_resolvable` matcher tests for host name resolution, i.e. "resolvable to an IP address":

    it { should be_resolvable }
