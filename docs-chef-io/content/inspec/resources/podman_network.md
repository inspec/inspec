+++
title = "podman_network resource"
draft = false
gh_repo = "inspec"
platform = "unix"

[menu]
  [menu.inspec]
    title = "podman_network"
    identifier = "inspec/resources/os/podman_network.md podman_network resource"
    parent = "inspec/resources/os"
+++

Use the `podman_network` Chef InSpec audit resource to test the properties of existing Podman networks.

## Availability

### Install

This resource is distributed with Chef InSpec and is automatically available for use.

## Syntax

Use the `podman_network` Chef InSpec audit resource to test the properties of a Podman network.

```ruby
describe podman_network("minikube") do
  it { should exist }
  its("id") { should eq "3a7c94d937d5f3a0f1a9b1610589945aedfbe56207fd5d32fc8154aa1a8b007f" }
  its("name") { should eq "minikube" }
  its("ipv6_enabled") { should eq false }
  its("network_interface") { should eq "podman1" }
end
```

where:

- `id`, `name`, `ipv6_enabled`, and `network_interface` are properties of this resource to fetch the respective value of the Podman network.
- `exist` is a matcher of this resource.

### Resource Parameter Examples

The resource allows you to pass a network name.

```ruby
describe podman_network("minikube") do
  it { should exist }
end
```

The resource allows you to pass with a Network ID.

```ruby
describe podman_network("3a7c94d937d5") do
  it { should exist }
end
```

## Properties

### id

The `id` property returns the full Podman Network ID.

```ruby
  its("id") { should eq "3c19bafed22355e11a608c4b613d87d06b9cdd37d378e6e0176cbc8e7144d5c6" }
```

### name

The `name` property tests the value of the Podman network name.

```ruby
its("name") { should eq "minikube" }
```

### ipv6_enabled

The `ipv6_enabled` property tests whether ipv6 is enabled on the Podman network.

```ruby
its("ipv6_enabled") { should eq true }
```

### network_interface

The `network_interface` property tests the value of the network interface settings on the Podman network.

```ruby
its("network_interface") { should eq "podman0" }
```

### created

The `created` property tests the timestamp when the Podman network was created.

```ruby
its("created") { should eq "2022-07-06T08:51:11.735432521+05:30" }
```

### subnets

The `subnets` property tests the list of subnets on the Podman network.

```ruby
its("subnets") { should inclue "gateway"=>"192.168.49.1", "subnet"=>"192.168.49.0/24" }
```

### dns_enabled

The `dns_enabled` property tests whether the Podman network has DNS enabled.

```ruby
its("dns_enabled") { should be false }
```

### internal

The `internal` property tests whether the specified Podman network is internal.

```ruby
its("internal") { should eq true }
```

### ipam_options

The `ipam_options` property tests the IPAM options of the given Podman network.

```ruby
its("ipam_options") { should eq "driver" => "host-local" }
```

### labels

The `labels` property tests the labels set for the specified Podman network.

```ruby
its("labels") { should eq "created_by.minikube.sigs.k8s.io"=>"true", "name.minikube.sigs.k8s.io"=>"minikube" }
```

### driver

The `driver` property tests the value of the Podman network driver.

```ruby
its("driver") { should eq "bridge" }
```

### options

The `options` property tests the network options for the specified Podman network.

```ruby
its("options") { should eq nil }
```

## Matchers

{{< readfile file="content/inspec/reusable/md/inspec_matchers_link.md" >}}

This resource has the following special matchers.

### exist

The `exist` matcher tests if the specified network is available on Podman.

```ruby
it { should exist }
```

## Examples

### Tests if a given Podman network exists and verifies the various network properties

```ruby
describe podman_network("minikube") do
  it { should exist }
  its("id") { should eq "3a7c94d937d5f3a0f1a9b1610589945aedfbe56207fd5d32fc8154aa1a8b007f" }
  its("name") { should eq "minikube" }
  its("ipv6_enabled") { should eq false }
  its("network_interface") { should eq "podman1" }
  its("subnets") { should include "gateway"=>"192.168.49.1", "subnet"=>"192.168.49.0/24" }
  its("dns_enabled") { should eq true }
  its("internal") { should eq false }
  its("created") { should eq "2022-07-06T08:51:11.735432521+05:30" }
  its("ipam_options") { should eq "driver" => "host-local" }
  its("labels") { should eq "created_by.minikube.sigs.k8s.io"=>"true", "name.minikube.sigs.k8s.io"=>"minikube" }
  its("driver") { should eq "bridge" }
  its("options") { should eq nil }
end
```
