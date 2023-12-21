+++
title = "podman_container resource"
draft = false
gh_repo = "inspec"
platform = "unix"

[menu]
  [menu.inspec]
    title = "podman_container"
    identifier = "inspec/resources/os/podman_container.md podman_container resource"
    parent = "inspec/resources/os"
+++

Use the `podman_container` Chef InSpec audit resource to test the configuration of Podman containers.

## Availability

### Install

This resource is distributed with Chef InSpec and is automatically available for use.

## Syntax

Use the `podman_container` Chef InSpec audit resource to test the properties of a Podman container.

```ruby
describe podman_container("sweet_mendeleev") do
  it { should exist }
  it { should be_running }
  its("id") { should eq "591270d8d80d26671fd6ed622f367fbe19004d16e3b519c292313feb5f22e7f7" }
  its("image") { should eq "docker.io/library/nginx:latest" }
  its("labels") { should include "maintainer"=>"NGINX Docker Maintainers <docker-maint@nginx.com>" }
  its("ports") { should eq nil }
end
```

## Resource Parameter Examples

### name

The container name can be provided with the `name` resource parameter.

```ruby
describe podman_container(name: 'an-echo-server') do
  it { should exist }
  it { should be_running }
end
```

### container ID

Alternatively, you can pass the container ID.

```ruby
describe podman_container(id: '71b5df59442b') do
  it { should exist }
  it { should be_running }
end
```

## Properties

## Property Examples

The following examples show how to use this Chef InSpec resource.

### id

The `id` property tests the container ID.

```ruby
its('id') { should eq '71b5df59...442b' }
```

### image

The `image` property tests the value of the container image.

```ruby
its('image') { should eq 'docker.io/library/nginx:latest' }
```

### labels

The `labels` property tests the value of container image labels.

```ruby
its('labels') { should eq "maintainer" => "NGINX Docker Maintainers <docker-maint@nginx.com>" }
```

### ports

The `ports` property tests the value of the Podmans ports.

```ruby
its('ports') { should eq '0.0.0.0:1234->1234/tcp' }
```

### command

The `command` property tests the value of the container run command.

```ruby
its('command') { should eq 'nc -ll -p 1234 -e /bin/cat' }
```

## Matchers

{{< readfile file="content/inspec/reusable/md/inspec_matchers_link.md" >}}
 The specific matchers of this resource are: `exist` and `be_running`.

### exist

The `exist` matcher specifies if the container exists.

```ruby
it { should exist }
```

### be_running

The `be_running` matcher checks if the container is running.

```ruby
it { should be_running }
```

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Ensures container exists

The below test passes if the container `sweet_mendeleev` exists as part of the Podman instances.

```ruby
describe podman_container('sweet_mendeleev') do
  it { should exist }
end
```

### Ensures container is in running status

The below test passes if the container `sweet_mendeleev` exists as part of the Podman instances and the status is running.

```ruby
describe podman_container('sweet_mendeleev') do
  it { should be_running }
end
```
