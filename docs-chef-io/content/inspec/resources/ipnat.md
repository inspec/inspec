+++
title = "ipnat resource"
draft = false
gh_repo = "inspec"
platform = "bsd"

[menu]
  [menu.inspec]
    title = "ipnat"
    identifier = "inspec/resources/os/ipnat.md ipnat resource"
    parent = "inspec/resources/os"
+++

Use the `ipnat` Chef InSpec audit resource to test rules that are defined for `IP NAT`. The purpose of the ipnat utility is to add or remove set of IP NAT rules. Rules are added to the end of the internal lists, matching the order in which they appear when given to ipnat. `ipnat -l` helps to view the current NAT table entry mappings. The rule match is done against the output rules of `ipnat -l`.

## Availability

### Install

{{< readfile file="content/inspec/reusable/md/inspec_installation.md" >}}

## Syntax

An `ipnat` resource block declares tests for rules set for IP NAT:

    describe ipnat do
      it { should have_rule("RULE") }
    end

where

- `have_rule('RULE')` tests the active rule for IP NAT. This must match the entire line taken from `ipnat -l`.

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test to ensure mapping rule of the internally used IP address with ISP provided 8-bit subnet at 10.9.0.1

    describe ipnat do
      it { should have_rule("map en0 192.0.0.0/8 -> 10.9.0.1/24") }
    end

### Test to ensure if there is a NAT rule to use the builtin ftp-proxy

    describe ipnat do
      it { should have_rule("map en0 192.0.0.0/8 -> 10.9.0.1/32 proxy port ftp ftp/tcp") }
    end

{{< note >}}

The rule specification must match the output of `ipnat -l` that depends on how you have built your rules.

{{< /note >}}

## Matchers

{{< readfile file="content/inspec/reusable/md/inspec_matchers_link.md" >}}

This resource has the following special matchers.

### have_rule

The `have_rule` matcher tests the named rule against the information in the output rule of `ipnat -l`:

    it { should have_rule("RULE") }
