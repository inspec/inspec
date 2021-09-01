+++
title = "group resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "group"
    identifier = "inspec/resources/os/group.md group resource"
    parent = "inspec/resources/os"
+++

Use the `group` Chef InSpec audit resource to test a single group on the system.

The `group` resource uses the following system groups:

- On **non-Windows** systems the group resource tests a local group defined in the`/etc/group` file.

- On **Windows** systems the group resource tests a local group defined by Local Users and Groups.


## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `group` resource block declares a group, and then the details to be tested, such as if the group is a local group, the group identifier, or if the group exists:

    describe group('group_name') do
      it { should exist }
      its('gid') { should eq 0 }
    end

where

- `'group_name'` must specify the name of a group to be tested on the system
- `exist` and `'gid'` are valid matchers for this resource

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test the group identifier for the root group

    describe group('root') do
      it { should exist }
      its('gid') { should eq 0 }
    end

## Properties

### gid

The `gid` property tests the named group identifier:

    its('gid') { should eq 1234 }

### members

The `members` property tests the members that belong to the group:

    its('members') { should include 'root' }

where `members` returns:

- an array of group members for **Windows Platform**.

    Example: `["member1", "member2"]`

- a CSV formatted string of group members for **Non-Windows Platforms**.

    Example: `"member1,member2"`


### members_array

The `members_array` property tests the members that belong to a group just like the
`members` property,
but the value returned by this property is always an array of group members.

    its('members_array') { should include 'root' }

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### be_local

The `be_local` matcher tests if the group is a local group:

    it { should be_local }

### exist

The `exist` matcher tests if the named group exists:

    it { should exist }
