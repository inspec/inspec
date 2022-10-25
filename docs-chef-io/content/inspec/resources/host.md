+++
title = "host resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "host"
    identifier = "inspec/resources/os/host.md host resource"
    parent = "inspec/resources/os"
+++

Use the `host` Chef InSpec audit resource to test the specific host name and its availability. This test includes the internet protocols and ports on which the respective host name must be available.

## Availability

### Installation

The Chef InSpec distributes this resource.

### Version

This resource is available from InSpec version 1.0.

## Syntax

A `host` resource block declares a host name, a port, and a protocol.

    describe host('example.com', port: 80, protocol: 'tcp') do
      it { should be_reachable }
      it { should be_resolvable }
      its('ipaddress') { should include '12.34.56.78' }
    end

> where
>
> - `host()` must specify a host name. The port number and protocol are optional values.
> - `example.com` is the host name.
> - `port` is the port number.
> - `protocol` is the internet protocol, TCP (`protocol: 'tcp'`), UDP (`protocol: 'udp'`), and ICMP (`protocol: 'icmp'`)

## Properties

### ipaddress

The `ipaddress` property returns the IP addresses of the host.

    its('ipaddress') { should include '93.184.216.34' }

### ipv4_address

The `ipv4_address` property returns the IPv4 address of the host.

    its('ipv4_address') { should include '93.184.216.34' }

### ipv6_address

The `ipv6_address` property returns the IPv6 addresses of the host.

    its('ipv6_address') { should include '2404:6800:4009:82a::200e' }

### connection

The `connection` property returns the connection string.

    its('connection') { should match /connection refused/ }

### protocol

The `protocol` property returns the protocol the specified host uses.

    its('protocol') { should eq 'TCP' }

### socket property returns the socket value of the specified host

    its('socket') { should match /STATUS_OK/ }

## Matchers

This Chef InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### be_reachable

The `be_reachable` matcher tests if the host name is available.

    it { should be_reachable }

### be_resolvable

The `be_resolvable` matcher tests for host name resolution. For example, "resolvable to an IP address".

    it { should be_resolvable }

## Examples

### Verify host name is resolvable to a specific IP address

    describe host('example.com') do
      its('ipaddress') { should include '93.184.216.34' }
    end

### Verify host name is resolvable to a specific IPv4 address

    describe host('example.com') do
      its('ipv4_address') { should include '93.184.216.34' }
    end

### Verify host name is resolvable to a specific IPv6 address

    describe host('example.com') do
      its('ipv6_address') { should include '2404:6800:4009:82a::200e' }
    end

### Verify a specific IP address can be resolved

    describe host('example.com') do
      it { should be_resolvable }
      its('ipaddress') { should include '93.184.216.34' }
    end

### Verify host name is reachable over a specific protocol and port number

    describe host('example.com', port: 80, protocol: 'tcp') do
      it { should be_reachable }
    end

### Review the connection setup and socket contents when checking reachability

    describe host('example.com', port: 12345, protocol: 'tcp') do
      it { should be_reachable }
      its('connection') { should_not match /connection refused/ }
      its('socket') { should match /STATUS_OK/ }
    end
