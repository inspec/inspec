+++
title = "windows_firewall_rule resource"
draft = false
gh_repo = "inspec"
platform = "windows"

[menu]
  [menu.inspec]
    title = "windows_firewall_rule"
    identifier = "inspec/resources/os/windows_firewall_rule.md windows_firewall_rule resource"
    parent = "inspec/resources/os"
+++

Use the `windows_firewall_rule` Chef InSpec audit resource to test if a firewall rule is correctly configured on a Windows system.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

## Syntax

A `windows_firewall_rule` resource block specifies which rule to validate:

    describe windows_firewall_rule('name') do
      it { should be_enabled }
    end

where

* `('name')` must specify the name of a firewall rule, which is not the firewall rule's display name
* `be_enabled` is a valid matcher for this resource

## Examples

The following example shows how to use this Chef InSpec audit resource.

### Test If the Firewall Contains a Rule for Outbound HTTPS

    describe windows_firewall_rule('HTTPS Out') do
      it { should be_enabled }
      it { should be_allowed }
      it { should be_outbound }
      it { should be_tcp }

      its('remote_port') { should eq 443 }
    end

## Properties

The resource compiles the following list of firewall rule properties:

* `description`
* `displayname`
* `group`
* `local_address`
* `local_port`
* `remote_address`
* `remote_port`
* `direction`
* `protocol`
* `icmp_type`
* `action`
* `profile`
* `program`
* `service`
* `interface_type`

Each of these properties can be used in two distinct ways:

    its('remote_address') { should cmp '192.0.2.42' }

or via matcher:

    it { should have_remote_address '192.0.2.42' }

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The `be_enabled` matcher tests if the rule does exist:

    it { should exist }

### be_enabled

The `be_enabled` matcher tests if the rule is enabled:

    it { should be_enabled }

### be_allowed

The `be_allowed` matcher tests if the rule is allowing traffic:

    it { should be_allowed }

### be_inbound

The `be_inbound` matcher tests if the rule is an inbound rule:

    it { should be_inbound }

### be_outbound

The `be_outbound` matcher tests if the rule is an outbound rule:

    it { should be_outbound }

### be_tcp

The `be_tcp` matcher tests if the rule is for the TCP protocol:

    it { should be_tcp }

### be_ucp

The `be_ucp` matcher tests if the rule is for the DCP protocol:

    it { should be_dcp }

### be_icmp

The `be_icmp` matcher tests if the rule is for any ICMP protocol:

    it { should be_icmp }

### be_icmpv4

The `be_icmpv4` matcher tests if the rule is for the ICMPv4 protocol:

    it { should be_icmpv4 }

### be_icmpv6

The `be_icmpv6` matcher tests if the rule is for any ICMPv6 protocol:

    it { should be_icmpv6 }
