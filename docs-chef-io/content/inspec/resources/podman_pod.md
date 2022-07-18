+++
title = "podman_pod resource"
draft = false
gh_repo = "inspec"
platform = "unix"

[menu]
  [menu.inspec]
    title = "podman_pod"
    identifier = "inspec/resources/os/podman_pod.md podman_pod resource"
    parent = "inspec/resources/os"
+++

Use the `podman_pod` Chef InSpec audit resource to test the properties of a pod on Podman.

## Availability

### Installation

This resource is distributed with Chef InSpec and is automatically available for use.

## Syntax

A `podman_pod` Chef InSpec audit resource aids in testing the properties of a pod on Podman.

```ruby
    describe podman_pod("nginx-frontend") do
      it { should exist }
      its("id") { should eq "fcfe4d471cfface0d1b39bce23af7d31ab8736cd68c0360ade0b4afe364f79d4" }
      its("name") { should eq "nginx-frontend" }
      its("created_at") { should eq "2022-07-14T15:47:47.978078124+05:30" }
      its("create_command") { should include "new:nginx-frontend" }
      its("state") { should eq "Running" }
    end
```

> where
>
> - `'nginx-frontend'` is the name of the pod. Pod ID and Pod names are valid parameters accepted by `podman_pod`.
> - `'id'`, `'name'`, `'created_at'`, `'create_command'`, and `'state'`, are properties of this resource to fetch the respective value of the podman pod.
> - `exist` is a matcher of this resource.

## Properties

- Properties of the resources are: `'id'`, `'name'`, `'created_at'`, `'create_command'`, `'state'`, `'hostname'`, `'create_cgroup'`, `'cgroup_parent'`, `cgroup_path`, `'create_infra'`, `'infra_container_id'`, `'infra_config'`, `'shared_namespaces'`, `'num_containers'`, and `'containers'`

### `id`

The `id` property returns the id of the pod.

```ruby
  its("id") { should eq "fcfe4d471cfface0d1b39bce23af7d31ab8736cd68c0360ade0b4afe364f79d4" }
```

### `name`

The `name` property returns the name of the pod.

```ruby
  its("name") { should eq "nginx-frontend" }
```

### `created_at`

The `created_at` property returns the creation date of the pod.

```ruby
  its("created_at") { should eq "2022-07-14T15:47:47.978078124+05:30" }
```

### `create_command`

The `create_command` property returns an array of commands used to create the pod.

```ruby
  its("create_command") { should include "new:nginx-frontend" }
```

### `state`

The `state` property returns the state of the pod.

```ruby
  its("state") { should eq "Running" }
```

### `hostname`

The `hostname` property returns the hostname of the pod.

```ruby
  its("hostname") { should eq "" }
```

### `create_cgroup`

The `create_cgroup` property returns a boolean value for cgroup creation of the pod.

```ruby
  its("create_cgroup") { should eq true }
```

### `cgroup_parent`

The `cgroup_parent` property returns the name of the cgroup parent of the pod.

```ruby
  its("cgroup_parent") { should eq "user.slice" }
```

### `cgroup_path`

The `cgroup_path` property returns the path of the cgroup parent of the pod.

```ruby
  its("cgroup_path") { should eq "user.slice/user-libpod_pod_fcfe4d471cfface0d1b39bce23af7d31ab8736cd68c0360ade0b4afe364f79d4.slice" }
```

### `create_infra`

The `create_infra` property returns a boolean value for the pod infra creation.

```ruby
  its("create_infra") { should eq true }
```

### `infra_container_id`

The `infra_container_id` property returns the infra container ID of the pod.

```ruby
  its("infra_container_id") { should eq "727538044b32a165934729dc2d47d9d5e981b6496aebfad7de470f7e76ea4251" }
```

### `infra_config`

The `infra_config` property returns a hash of the infra configuration of the pod.

```ruby
  its("infra_config") { should include "DNSOption" }
```

### `shared_namespaces`

The `shared_namespaces` property returns an array of shared namespaces of the pod.

```ruby
  its("shared_namespaces") { should include "ipc" }
```

### `num_containers`

The `num_containers` property returns the number of containers in the pod.

```ruby
  its("num_containers") { should eq 2 }
```

### `containers`

The `containers` property returns an array of hashes about the information of containers in the pod.

```ruby
  its("containers") { should_not be nil }
```

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The `exist` matcher tests if the pod is available on Podman.

```ruby
  it { should exist }
```

## Examples

### Test if a pod exists on Podman and verifies pod properties

```ruby
  describe podman_pod("nginx-frontend") do
    it { should exist }
    its("id") { should eq "fcfe4d471cfface0d1b39bce23af7d31ab8736cd68c0360ade0b4afe364f79d4" }
    its("name") { should eq "nginx-frontend" }
    its("created_at") { should eq "2022-07-14T15:47:47.978078124+05:30" }
    its("create_command") { should include "new:nginx-frontend" }
    its("state") { should eq "Running" }
    its("hostname") { should eq "" }
    its("create_cgroup") { should eq true }
    its("cgroup_parent") { should eq "user.slice" }
    its("cgroup_path") { should eq "user.slice/user-libpod_pod_fcfe4d471cfface0d1b39bce23af7d31ab8736cd68c0360ade0b4afe364f79d4.slice" }
    its("create_infra") { should eq true }
    its("infra_container_id") { should eq "727538044b32a165934729dc2d47d9d5e981b6496aebfad7de470f7e76ea4251" }
    its("infra_config") { should include "DNSOption" }
    its("shared_namespaces") { should include "ipc" }
    its("num_containers") { should eq 2 }
    its("containers") { should_not be nil }
  end
```

### Test if a pod does not exist on Podman

```ruby
  describe podman_pod("non_existing_pod") do
    it { should_not exist }
  end
```
