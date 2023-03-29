+++
title = "nftables resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "nftables"
    identifier = "inspec/resources/os/nftables.md nftables resource"
    parent = "inspec/resources/os"
+++

Use the `nftables` Chef InSpec audit resource to test rules and sets that are defined using `nftables`, which maintains tables of IP packet filtering rules. There may be more than one table. Each table contains one (or more) chains. A chain is a list of rules that match packets. When the rule matches, the rule defines what target to assign to the packet.

## Availability

### Installation

{{% inspec/inspec_installation %}}

### Version

This resource first became available in v4.6.9 of InSpec.

## Syntax

A `nftables` resource block declares tests for rules in IP tables:

    describe nftables(family:'name', table:'name', chain: 'name') do
      its('PROPERTY') { should eq 'value' }
      it { should have_rule('RULE') }
    end
    o
    describe nftables(family:'name', table:'name', set: 'name') do
      its('PROPERTY') { should eq 'value' }
      it { should have_element('ELEMENT') }
    end

where

- `nftables()` has to specify `family` and `table`. It also has to specify one of `chain` or `set` (exclusively).
- `family:'name'` is the name of the `family` the table belongs to, one of `ip`, `ip6`, `inet`, `arp`, `bridge`, `netdev`.
- `table:'name'` is the packet matching table against which the test is run.
- `chain: 'name'` is the name of a user-defined chain.
- `set: 'name'` is the name of a user-defined named set.
- `have_rule('RULE')` tests that the chain has a given rule in the nftables ruleset. This must match the entire line taken from `nftables -nn list chain FAMILY TABLE CHAIN`.
- `have_element('ELEMENT')` tests that element is a member of the nftables named set.

## Properties

### Chain Properties

- `hook`
- `prio`
- `policy`
- `type`

### Set Properties

- `flags`
- `size`
- `type`

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test if the my_input chain is in default ACCEPT mode

    describe nftables(family: 'inet', table: 'my_filter', chain: 'my_input') do
      its('policy') { should eq 'accept' }
    end

### Test if the INPUT chain from the mangle table is in ACCEPT mode

    describe nftables(family: 'inet', table: 'mangle', chain: 'INPUT') do
      its('type') { should eq 'filter' }
      its('hook') { should eq 'input' }
      its('prio') { should eq (-150) } # maangle
      its('policy') { should eq 'accept' }
    end

### Test if there is a rule allowing Postgres (5432/TCP) traffic

    describe nftables(family: 'inet', table: 'my_filter', chain: 'my_input') do
      it { should have_rule('tcp dport 5432 comment "postgres" accept') }
    end

Note that the rule specification must exactly match what's in the output of `nftables -nn list chain inet my_filter my_input`, which will depend on how you've built your rules.

### Test if there is an element `1.1.1.1` in the OPEN_PORTS named set

    describe nftables(family: 'inet', table: 'my_filter', set: 'OPOEN_PORTS') do
      it { should have_element('1.1.1.1') }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### have_rule

The `have_rule` matcher tests the named rule against the information in the `nftables` ruleset:

    it { should have_rule('RULE') }

### have_element

The `have_element` matcher tests the named set against the information in the `nftables` ruleset:

    it { should have_element('SET_ELEMENT') }
