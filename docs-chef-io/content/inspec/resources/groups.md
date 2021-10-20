+++
title = "groups resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "groups"
    identifier = "inspec/resources/os/groups.md groups resource"
    parent = "inspec/resources/os"
+++

Use the `groups` Chef InSpec audit resource to test multiple groups on the system.

The `groups` resource uses the following system groups:

- On **non-Windows** systems the group resource tests local groups defined in the`/etc/group` file.

- On **Windows** systems the group resource tests local groups defined by Local Users and Groups.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `groups` resource block uses `where` to filter entries from the systems groups. If `where` is omitted, all entries are selected.

    describe groups do
      its('names') { should eq ['wheel', 'daemon', 'sys', 'adm'] }
      its('names') { should include 'wheel' }
    end

    describe groups.where { members =~ /root/ } do
      its('names') { should eq ['wheel', 'daemon', 'sys', 'adm'] }
    end

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test the group identifier for the wheel group

    describe groups.where { name == 'wheel' } do
      it { should exist }
      its('members') { should include 'root' }
    end

## Properties

### gids

The `gids` property tests the named group identifier:

    its('gids') { should eq 1234 }

### names

The `names` property tests the name field on a Windows group:

its('names') { should include 'Power Users' }

### domains

The `domains` property tests the domain on a Windows group:

its('domains') { should include 'WIN-CIV7VMLVHLD' }

### members

The `members` property tests the members that belong to a group:

    its('members') { should include 'root' }
    its('members') { should include 'Administrator' }

where `members` returns:

- an array of group members for **Windows Platform**.

    Example: `["member1", "member2"]`

- a single element array that contains a CSV string of group members for **Non-Windows Platforms**.

    Example: `["member1,member2"]`

### members_array

The `members_array` property tests the group members just like the `members` property,
but the value returned by this property is always an array of group members.

    its('members_array') { should include 'root' }
    its('members_array') { should include 'Administrator' }

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The `exist` matcher tests if the named user exists:

    it { should exist }
