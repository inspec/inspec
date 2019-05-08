---
title: About the groups Resource
platform: os
---

# groups

Use the `groups` Chef InSpec audit resource to test multiple groups on the system.

<br>

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

<br>

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test the group identifier for the wheel group

    describe groups.where { name == 'wheel' } do
      it { should exist }
      its('members') { should include 'root' }
    end

<br>

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

## Matchers

For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).

### exist

The `exist` matcher tests if the named user exists:

    it { should exist }
