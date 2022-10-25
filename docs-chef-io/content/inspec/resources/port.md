+++
title = "port resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "port"
    identifier = "inspec/resources/os/port.md port resource"
    parent = "inspec/resources/os"
+++

Use the `port` Chef InSpec audit resource to test basic port properties, such as port, process, if it's listening.

## Availability

### Installation

{{% inspec/inspec_installation %}}

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `port` resource block declares a port, and then depending on what needs to be tested, a process, protocol, process identifier, and its state (is it listening?):

    describe port(514) do
      it { should be_listening }
      its('processes') {should include 'syslog'}
    end

where the `processes` returns the processes listening on port 514.

A filter may specify an attribute:

    describe port.where { protocol =~ /tcp/ && port > 22 && port < 80 } do
      it { should_not be_listening }
    end

where

- `.where{}` specifies a block in which one (or more) attributes---`port`, `address`, `protocol`, `process`, `pid`, or `listening?`----scope the test to ports that match those attributes

For example, to test if the SSH daemon is available on a Linux machine via the default port (22):

    describe port(22) do
      its('processes') { should include 'sshd' }
      its('protocols') { should include 'tcp' }
      its('addresses') { should include '0.0.0.0' }
    end

## Properties

### address

The `addresses` property tests if the specified address is associated with a port:

    its('addresses') { should include '0.0.0.0' }

### be_listening

The `be_listening` property tests if the port is listening for traffic:

    it { should be_listening }

### pids

The `pids` property tests the process identifiers (PIDs):

    its('pids') { should cmp 27808 }

### processes

The `processes` property tests if the named process is running on the system:

    its('processes') { should cmp 'syslog' }

### protocols

The `protocols` property tests the Internet protocol: ICMP (`'icmp'`), TCP (`'tcp'` or `'tcp6'`), or UDP (`'udp'` or `'udp6'`):

    its('protocols') { should include 'tcp' }

or for the IPv6 protocol:

    its('protocols') { should include 'tcp6' }

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test port 80, listening with the TCP protocol

    describe port(80) do
      it { should be_listening }
      its('protocols') { should cmp 'tcp' }
    end

### Test port 80, on a specific address

A specific port address may be checked using either of the following examples:

    describe port(80) do
      it { should be_listening }
      its('addresses') {should include '0.0.0.0'}
    end

or:

    describe port('0.0.0.0', 80) do
      it { should be_listening }
    end

### Test port 80, listening with TCP version IPv6 protocol

    describe port(80) do
      it { should be_listening }
      its('protocols') { should cmp 'tcp6' }
    end

### Test that only secure ports accept requests

    describe port(80) do
      it { should_not be_listening }
    end

    describe port(443) do
      it { should be_listening }
      its('protocols') { should cmp 'tcp' }
    end

### Verify port 65432 is not listening

    describe port(22) do
      it { should be_listening }
      its('protocols') { should include('tcp') }
      its('protocols') { should_not include('udp') }
    end

    describe port(65432) do
      it { should_not be_listening }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).
