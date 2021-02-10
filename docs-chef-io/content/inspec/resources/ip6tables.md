+++
title = "ip6tables resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "ip6tables"
    identifier = "inspec/resources/os/ip6tables.md ip6tables resource"
    parent = "inspec/resources/os"
+++

Use the `ip6tables` Chef InSpec audit resource to test rules that are defined in `ip6tables`, which maintains tables of IP packet filtering rules for IPv6. There may be more than one table. Each table contains one (or more) chains (both built-in and custom). A chain is a list of rules that match packets. When the rule matches, the rule defines what target to assign to the packet.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v4.6.9 of InSpec.

## Syntax

A `ip6tables` resource block declares tests for rules in IP tables:

    describe ip6tables(rule:'name', table:'name', chain: 'name') do
      it { should have_rule('RULE') }
    end

where

- `ip6tables()` may specify any combination of `rule`, `table`, or `chain`
- `rule:'name'` is the name of a rule that matches a set of packets
- `table:'name'` is the packet matching table against which the test is run
- `chain: 'name'` is the name of a user-defined chain or one of `ACCEPT`, `DROP`, `QUEUE`, or `RETURN`
- `have_rule('RULE')` tests that rule in the ip6tables list. This must match the entire line taken from `ip6tables -S CHAIN`.

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test if the INPUT chain is in default ACCEPT mode

    describe ip6tables do
      it { should have_rule('-P INPUT ACCEPT') }
    end

### Test if the INPUT chain from the mangle table is in ACCEPT mode

    describe ip6tables(table:'mangle', chain: 'INPUT') do
      it { should have_rule('-P INPUT ACCEPT') }
    end

### Test if there is a rule allowing Postgres (5432/TCP) traffic

    describe ip6tables do
      it { should have_rule('-A INPUT -p tcp -m tcp -m multiport --dports 5432 -m comment --comment "postgres" -j ACCEPT') }
    end

Note that the rule specification must exactly match what's in the output of `ip6tables -S INPUT`, which will depend on how you've built your rules.

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### have_rule

The `have_rule` matcher tests the named rule against the information in the `ip6tables` file:

    it { should have_rule('RULE') }
