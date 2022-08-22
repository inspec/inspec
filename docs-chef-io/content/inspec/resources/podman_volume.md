+++
title = "podman_volume resource"
draft = false
gh_repo = "inspec"
platform = "unix"

[menu]
  [menu.inspec]
    title = "podman_volume"
    identifier = "inspec/resources/os/podman_volume.md podman_volume resource"
    parent = "inspec/resources/os"
+++

Use the `podman_volume` Chef InSpec audit resource to test the properties of a volume on Podman.

## Availability

### Installation

This resource is distributed with Chef InSpec and is automatically available for use.

## Syntax

A `podman_volume` Chef InSpec audit resource aids in testing the properties of a volume on Podman.

```ruby
    describe podman_volume("my_volume") do
      it { should exist }
      its("name") { should eq "my_volume" }
      its("driver") { should eq "local" }
      its("mountpoint") { should eq "/var/home/core/.local/share/containers/storage/volumes/my_volume/_data" }
      its("created_at") { should eq "2022-07-14T13:21:19.965421792+05:30" }
    end
```

> where
>
> - `'name'`, `'driver'`, `'mountpoint'`, and `'created_at'` are properties of this resource to fetch the respective value of the podman volume.
> - `exist` is a matcher of this resource.

## Properties

- Properties of the resources: `name`, `driver`, `mountpoint`, `created_at`, `labels`, `scope`, `options`, `mount_count`, `needs_copy_up`, and `needs_chown`.

### name

The `name` property returns the name of the volume.

```ruby
  its("name") { should eq "my_volume" }
```

### driver

The `driver` property returns the value for the volume's driver environment.

```ruby
  its("driver") { should eq "local" }
```

### mountpoint

The `mountpoint` property returns the value for the volume's mount path.

```ruby
  its("mountpoint") { should eq "/var/home/core/.local/share/containers/storage/volumes/my_volume/_data" }
```

### created_at

The `created_at` property returns the creation date of the volume.

```ruby
  its("created_at") { should eq "2022-07-14T13:21:19.965421792+05:30" }
```

### labels

The `labels` property returns the labels associated with the volume.

```ruby
  its("labels") { should eq({}) }
```

### scope

The `scope` property returns the scope of the volume.

```ruby
  its("scope") { should eq "local" }
```

### options

The `options` property returns the options associated with the volume.

```ruby
  its("options") { should eq({}) }
```

### mount_count

The `mount_count` property returns the **MountCount** value from the volume's inspect information.

```ruby
  its("mount_count") { should eq 0 }
```

### needs_copy_up

The `needs_copy_up` property returns the **NeedsCopyUp** value from the volume's inspect information.

```ruby
  its("needs_copy_up") { should eq true }
```

### needs_chown

The `needs_chown` property returns the **NeedsChown** value from the volume's inspect information.

```ruby
  its("needs_chown") { should eq true }
```

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The `exist` matcher tests if the volume is available on Podman.

```ruby
  it { should exist }
```

## Examples

### Test if a volume exists on Podman and verifies volume properties

```ruby
  describe podman_volume("my_volume") do
    it { should exist }
    its("name") { should eq "my_volume" }
    its("driver") { should eq "local" }
    its("mountpoint") { should eq "/var/home/core/.local/share/containers/storage/volumes/my_volume/_data" }
    its("created_at") { should eq "2022-07-14T13:21:19.965421792+05:30" }
    its("labels") { should eq({}) }
    its("scope") { should eq "local" }
    its("options") { should eq({}) }
    its("mount_count") { should eq 0 }
    its("needs_copy_up") { should eq true }
    its("needs_chown") { should eq true }
  end
```
