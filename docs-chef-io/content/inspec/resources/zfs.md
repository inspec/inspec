+++
title = "zfs resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "zfs"
    identifier = "inspec/resources/os/zfs.md zfs resource"
    parent = "inspec/resources/os"
+++

Use the `zfs` Chef InSpec audit resource to test the named ZFS Pool file system and its respective properties.

## Availability

### Installation

Chef Inspec distributes this resource.

## Syntax

A `zfs` Chef InSpec audit resource allows to test if the named ZFS Pool is present and/or has certain properties.

```ruby
    describe zfs(zfs_pool_name) do
      it { should exist }
      it { should have_property({ "key1" => "value1", "key2" => "value2" }) }
    end
```
> where
>
> - `'zfs_pool_name'` is the name of a ZFS Pool
> - `exist` and `have_property` are matchers of this resource
> - `{ "key1" => "value1", "key2" => "value2" }` are properties of the ZFS Pool to test.

## Matchers

For a full list of available matchers, please visit our [matchers page](https://docs.chef.io/inspec/matchers/).

The specific matchers of this resource are: `exist` and `have_property`

### exist

The `exist` matcher tests if the ZFS Pool exist on the system.

```ruby
    it { should exist }
```

### have_property

The `have_property` matcher accepts properties in hash format and tests if the given properties are valid ZFS Pool properties.

```ruby
    it { should have_property({ "key1" => "value1", "key2" => "value2" }) }
```

## Examples
The following examples show how to use this Chef InSpec audit resource.

### Test if the ZFS Pool exist on the system

`exist` matcher allows to test if the ZFS Pool exist on the system.

```ruby
    describe zfs("new-pool") do
      it { should exist }
    end
```

### Test if the given properties are valid ZFS Pool properties.

`have_property` matcher allows to test if the given properties are valid ZFS Pool properties.

```ruby
    describe zfs("new-pool") do
      it { should have_property({ "failmode" => "wait", "capacity" => "0" }) }
    end
```
