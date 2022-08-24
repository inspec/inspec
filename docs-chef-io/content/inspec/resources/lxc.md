+++
title = "lxc resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "lxc"
    identifier = "inspec/resources/os/lxc.md lxc resource"
    parent = "inspec/resources/os"
+++

Use the `lxc` Chef InSpec audit resource to test the information about Linux containers. LXC is a command-line client for LXD that manages your LXD instances (containers and virtual machines). The tests are against the container's information obtained on `lxc info [container-name]`. `lxc` resource allows the testing if the container exists or is in *running* status.

## Availability

### Installation

This resource is distributed with Chef InSpec and is automatically available for use.

## Syntax

An `lxc` Chef InSpec audit resource allows testing if the container exists or is in *running* status.

```ruby
  describe lxc("linux-container-name") do
    it { should exist }
    it { should be_running }
  end
```

## Matchers

For a full list of available matchers, please visit our [matchers page](https://docs.chef.io/inspec/matchers/).

The specific matchers of this resource are: `exist` and `be_running`.

### exist

The `exist` matcher is used to specify if the container exists:

```ruby
  it { should exist }
```

### be_running

The `be_running` matcher is used to check if the container is running:

```ruby
  it { should be_running }
```

## Properties

### name

Returns the instance name.

```ruby
its("name") { should eq "ubuntu-container" }
```

### status

Returns the instance status.

```ruby
  its("status") { should cmp "Running" }
```

### type

Returns the instance type (for example, container).

```ruby
  its("type") { should eq "container" }
```

### architecture

Returns the architecture of the instance.

```ruby
  its("architecture") { should eq "x86_64" }
```

### pid

Returns the pid of the instance.

```ruby
  its("pid") { should eq 1378 }
```

### created_at

Returns the creation date of the instance.

```ruby
  its("created_at") { should eq "2022/08/16 12:07 UTC" }
```

### last_used_at

Returns the last used date of the instance.

```ruby
  its("last_used_at") { should eq "2022/08/17 05:06 UTC" }
```

### resources

Returns the resource information of the instance.

```ruby
  its("resources") { should include "Disk usage" }
```

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Ensures container exists

The below test passes if the container `immense-phoenix` exists as part of the LXD instances.

```ruby
  describe lxc("immense-phoenix") do
    it { should exist }
  end
```

### Ensures container is in running status

The below test passes if the container `delicate-sloth` exists as part of the LXD instances and the status is running.

```ruby
  describe lxc("delicate-sloth") do
    it { should be_running }
  end
```

### Ensures container exists, is in running status, and verifies the different container properties

The below test passes if the container `ubuntu-container` exists, is running, and the properties value matches against the desired value.

```ruby
  describe lxc("ubuntu-container") do
    it { should exist }
    it { should be_running }
    its("name") { should eq "ubuntu-container" }
    its("status") { should cmp "Running" }
    its("type") { should eq "container" }
    its("architecture") { should eq "x86_64" }
    its("pid") { should eq 1378 }
    its("created_at") { should eq "2022/08/16 12:07 UTC" }
    its("last_used_at") { should eq "2022/08/17 05:06 UTC" }
    its("resources") { should include "Disk usage" }
  end
```
