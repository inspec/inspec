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

Use the `nftables` Chef InSpec audit resource to test rules and sets that are defined using `nftables`, which maintains tables of IP packet filtering rules. There may be more than one table. Each table contains one (or more) chains. A chain is a list of rules that match packets. When a rule matches a packet, the rule defines what target to assign to the packet.

## Availability

### Install

{{< readfile file="content/inspec/reusable/md/inspec_installation.md" >}}

### Version

This resource first became available in v5.21.30 of InSpec.

## Syntax

A `nftables` resource block declares tests for rules in IP tables:

```ruby
describe nftables(family:'name', table:'name', chain: 'name') do
  its('PROPERTY') { should eq 'value' }
  it { should have_rule('RULE') }
end

describe nftables(family:'name', table:'name', set: 'name') do
  its('PROPERTY') { should eq 'value' }
  it { should have_element('ELEMENT') }
end
```

where

- `nftables()` has to specify `family` and `table`. It also has to specify one of `chain` or `set` (exclusively).
- `family:'name'` is the name of the `family` the table belongs to, one of `ip`, `ip6`, `inet`, `arp`, `bridge`, `netdev`.
- `table:'name'` is the packet matching table against which the test is run.
- `chain: 'name'` is the name of a user-defined chain.
- `set: 'name'` is the name of a user-defined named set.
- `have_rule('RULE')` tests that the chain has a given rule in the nftables ruleset. This must match the entire line taken from `nftables -nn list chain FAMILY TABLE CHAIN`.
- `have_element('ELEMENT')` tests that element is a member of the nftables named set.

See the [NFT man page](https://www.netfilter.org/projects/nftables/manpage.html) and [nftables wiki](https://wiki.nftables.org/wiki-nftables/index.php/Main_Page) for more information about nftables.

## Properties

### Chain Properties

`hook`
: The hook type. Possible values: `ingress`, `prerouting`, `forward`, `input`, `output`, `postrouting`, and `egress`.

`prio`
: The numerical chain priority.

`policy`
: The policy type. Possible values: `accept`, `drop`.

`type`
: The chain type.  Possible values: `filter`, `nat`, and `route`.

### Set Properties

`flags`
: The set flags. Possible values: `constant`, `dynamic`, `interval`, and `timeout`.

`size`
: The maximum number of elements in the set.

`type`
: The data type of set elements. Possible values: `ipv4_addr`, `ipv6_addr`, `ether_addr`, `inet_proto`, `inet_service`, and `mark`.

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test if the `CHAIN_NAME` chain from the `TABLE_NAME` table has the default `accept` policy

```ruby
describe nftables(family: 'inet', table: 'TABLE_NAME', chain: 'CHAIN_NAME') do
  its('policy') { should eq 'accept' }
end
```

### Test the attributes of the `CHAIN_NAME` chain from the `TABLE_NAME` table

```ruby
describe nftables(family: 'inet', table: 'mangle', chain: 'INPUT') do
  its('type') { should eq 'filter' }
  its('hook') { should eq 'input' }
  its('prio') { should eq (-150) } # mangle
  its('policy') { should eq 'accept' }
end
```

### Test if there is a rule allowing Postgres (5432/TCP) traffic

```ruby
describe nftables(family: 'inet', table: 'TABLE_NAME', chain: 'CHAIN_NAME') do
  it { should have_rule('tcp dport 5432 comment "postgres" accept') }
end
```

Note that the rule specification must exactly match what's in the output of `nftables -nn list chain inet TABLE_NAME CHAIN_NAME`, which will depend on how you've built your rules.

### Test if there is an element `1.1.1.1` in the `SET_NAME` named set

```ruby
describe nftables(family: 'inet', table: 'TABLE_NAME', set: 'SET_NAME') do
  it { should have_element('1.1.1.1') }
end
```

## Matchers

{{< readfile file="content/inspec/reusable/md/inspec_matchers_link.md" >}}

This resource has the following special matchers.

### have_rule

The `have_rule` matcher tests the named rule against the information in the `nftables` ruleset:

```ruby
it { should have_rule('RULE') }
```

### have_element

The `have_element` matcher tests the named set against the information in the `nftables` ruleset:

```ruby
it { should have_element('SET_ELEMENT') }
```
