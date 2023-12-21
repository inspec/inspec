+++
title = "etc_group resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "etc_group"
    identifier = "inspec/resources/os/etc_group.md etc_group resource"
    parent = "inspec/resources/os"
+++

Use the `etc_group` Chef InSpec audit resource to test groups that are defined on Linux and Unix platforms. The `/etc/group` file stores details about each group: group name, password, group identifier, along with a comma-separated list of users that belong to the group.

## Availability

### Install

{{< readfile file="content/inspec/reusable/md/inspec_installation.md" >}}

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `etc_group` resource block declares a collection of properties to be tested:

    describe etc_group('path') do
      its('property') { should eq 'some_value' }
    end

or:

    describe etc_group.where(item: 'value', item: 'value') do
      its('gids') { should_not contain_duplicates }
      its('groups') { should include 'user_name' }
      its('users') { should include 'user_name' }
    end

where

- `('path')` is the non-default path to the `\etc\group` file
- `.where()` filters for a specific item and value, to which the parameter are compared
- `.where` filter may be one or more of:
  - `name: 'name'`, `group_name: 'group_name'`, `password: 'password'`, `gid: 'gid'`, `group_id: 'gid'`, `users: 'user_name'`, `members: 'member_name'`

## Properties

### gids

The `gids` property returns the list of gids from `/etc/group` file.

    its('gids') { should include 'gid' }

### groups

The `groups` property returns the list of groups from `/etc/group` file.

    its('groups') { should include 'my_group' }

### users

The `users` property returns the list of users from `/etc/group `file.

    its('users') { should include 'my_user' }

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test group identifiers (GIDs) for duplicates

    describe etc_group do
      its('gids') { should_not contain_duplicates }
    end

### Test all groups to see if a specific user belongs to one (or more) groups

    describe etc_group do
      its('groups') { should include 'my_group' }
    end

### Test all groups for a specific user name

    describe etc_group do
      its('users') { should include 'my_user' }
    end

### Filter a list of groups for a specific user

    describe etc_group.where(name: 'my_group') do
      its('users') { should include 'my_user' }
    end

## Matchers

{{< readfile file="content/inspec/reusable/md/inspec_matchers_link.md" >}}
