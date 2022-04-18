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

- On **non-Windows** systems, the group resource tests a local group defined in the`/etc/group` file.

- On **Windows** systems, the group resource tests a local group defined by Local Users and Groups.

## Availability

### Installation

The Chef InSpec resource distributes this resource.

### Version

This resource is available from Chef Inspec 1.0.0.

## Syntax

A `group` resource block declares a group and the details to be tested, such as if the group is a local group, the group identifier, or if the group exists.

```ruby
    describe group('group_name') do
      it { should exist }
      its('gid') { should eq 0 }
    end
```

> where
>
> - `group_name` must specify the group's name to be tested on the system.
> - `exist` and `gid` are valid matchers for this resource.

## Properties

### gid

The `gid` property returns the named group identifier.

```ruby
    its('gid') { should eq 1234 }
```

### members

The `members` property returns the members that belong to the group.

```ruby
    its('members') { should include 'root' }
```

> where `members` returns:
>
> - an array of group members for **Windows Platform**.
>
> For example, ["member1", "member2"]
>
> - a CSV formatted string of group members for **Non-Windows Platforms**.
>
> For example, `"member1,member2"`

### members_array

The `members_array` property returns the members that belong to a group like the `members` property, however the value returned by this property is always an array of group members.

```ruby
    its('members_array') { should include 'root' }
```

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test the group identifier for the root group

```ruby
    describe group('root') do
      it { should exist }
      its('gid') { should eq 0 }
    end
```

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### be_local

The `be_local` matcher tests if the group is a local group.

```ruby
    it { should be_local }
```

### exist

The `exist` matcher tests if the named group exists.

```ruby
    it { should exist }
```

### have_gid

The `have_gid` matcher tests if the named group has the given gid.

```ruby
    it { should have_gid 0 }
```
