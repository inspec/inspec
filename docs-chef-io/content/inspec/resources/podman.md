+++
title = "podman resource"
draft = false
gh_repo = "inspec"
platform = "unix"

[menu]
  [menu.inspec]
    title = "podman"
    identifier = "inspec/resources/os/podman.md podman resource"
    parent = "inspec/resources/os"
+++

Use the `podman` Chef InSpec audit resource to test the configuration of Podman resources.

## Availability

### Installation

This resource is distributed with Chef InSpec and is automatically available for use.

## Syntax

Use the `podman` Chef InSpec audit resource to test multiple Podman containers.

```ruby
describe podman.containers do
  its('ids') { should include "591270d8d80d26671fd6ed622f367fbe19004d16e3b519c292313feb5f22e7f7" }
  its('images') { should include "docker.io/library/ubuntu:latest" }
end
```

Or, if you want to query a specific container:

```ruby
describe podman.containers.where(id: "591270d8d80d26671fd6ed622f367fbe19004d16e3b519c292313feb5f22e7f7") do
  its('status') { should include "Up 44 hours ago" }
end
```

where:

- `.where()` specifies a specific item and value to which the resource parameters are compared.
- `commands`, `created_at`, `ids`, `images`, `names`, `status`, `image_ids`, `labels`, `mounts`, `networks`, `pods`, `ports`, `running_for`, and `sizes` are valid parameters for `containers`.

You can also use the `podman` resource block to test many images.

```ruby
describe podman.images do
  its('repositories') { should_not include 'docker.io/library/nginx' }
end
```

Or, if you want to query a specific `image`:

```ruby
describe podman.images.where(id: "c7db653c4397e6a4d1e468bb7c6400c022c62623bdb87c173d54bac7995b6d8f") do
  it { should exist }
end
```

where:

- `.where()` specifies a specific filter and expected value, against which parameters are compared.
- `repositories`, `tags`, `sizes`,  `digests`, `history`, `created_at`, `history`, and`created_since` are valid parameters for `images`.

You can also use the `podman` resource block to test multiple networks.

```ruby
describe podman.networks do
  its("names") { should include "podman" }
end
```

Or, if you want to query a specific network:

```ruby
describe podman.networks.where(id: "c7db653c4397e6a4d1e468bb7c6400c022c62623bdb87c173d54bac7995b6d8f") do
  it { should exist }
end
```

where:

- `.where()` specifies a specific filter and expected value, against which parameters are compared.
- `ids`, `names`, `drivers`, `network_interfaces`, `created`, `subnets`, `ipv6_enabled`, `internal`, `dns_enabled`, `options`, `labels`, and `ipam_options` are valid parameters for `networks`.

You can use the `podman` resource block to test many pods.

```ruby
describe podman.pods do
  its("names") { should include "cranky_allen" }
end
```

Or, if you want to query a specific pod:

```ruby
describe podman.pods.where(id: "95cadbb84df71e6374fceb3fd89ee3b8f2c7e1a831062cd9cea7d0e3e4b1dbcc") do
  it { should exist }
end
```

where:

- `.where()` may specify a specific filter and expected value, against which parameters are compared.
- `ids`, `cgroups`, `containers`, `created`, `infraids`, `names`, `namespaces`, `networks`, `status`, and `labels` are valid parameters for `pods`.

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Returns all running containers

```ruby
podman.containers.running?.ids.each do |id|
  describe podman.object(id) do
    its('State.Health.Status') { should eq 'healthy' }
  end
end
```

## Resource Parameter Examples

### containers

`containers` returns information about containers as returned by [podman ps -a](https://docs.podman.io/en/latest/markdown/podman.1.html).

```ruby
describe podman.containers do
  its("ids") { should include "591270d8d80d26671fd6ed622f367fbe19004d16e3b519c292313feb5f22e7f7" }
  its("labels") { should include "maintainer" => "NGINX Docker Maintainers \u003cdocker-maint@nginx.com\u003e" }
  its('names') { should include "sweet_mendeleev" }
  its("images") { should include "docker.io/library/nginx:latest" }
end
```

### images

`images` returns information about a Podman image as returned by [podman images -a](https://docs.podman.io/en/latest/markdown/podman-images.1.html).

```ruby
describe podman.images do
  its('ids') { should include 'sha256:c7db653c4397e6a4d1e468bb7c6400c022c62623bdb87c173d54bac7995b6d8f ' }
  its('sizes') { should_not include '80.3 GB' }
  its('repositories") { should include "docker.io/library/nginx"}
end
```

### pods

`pods` returns information about pods as returned by [podman pod ps](https://docs.podman.io/en/latest/markdown/podman-pod-ps.1.html).

```ruby
describe podman.pods do
  its("ids") { should include "95cadbb84df71e6374fceb3fd89ee3b8f2c7e1a831062cd9cea7d0e3e4b1dbcc" }
  its("containers") { should eq [{ "Id" => "a218dfc58fa28e0c58c55e508e5b57084876b42e894b98073c69c45dea06cbb2", "Names" => "95cadbb84df7-infra", "Status" => "running" } ]}
  its("names") { should include "cranky_allen" }
end
```

### networks

`networks` returns information about a Podman network as returned by [podman network ls](https://docs.podman.io/en/latest/markdown/podman-network-ls.1.html).

```ruby
describe podman.networks do
  its("names") { should include "podman" }
  its("ids") { should include "2f259bab93aaaaa2542ba43ef33eb990d0999ee1b9924b557b7be53c0b7a1bb9" }
  its("ipv6_enabled") { should eq [false] }
end
```

### volumes

`volumes` returns information about a Podman volume as returned by [podman volume ls](https://docs.podman.io/en/latest/markdown/podman-volume-ls.1.html).

```ruby
describe podman.volumes do
  its('names') { should include 'ae6be9ba838b9b150de47657229bb9b67142dbdb3d1ddbc5efa245cf1e95536a' }
  its('drivers') { should include 'local' }
end
```

### info

`info` returns the parsed result of [podman info](https://docs.podman.io/en/latest/markdown/podman-info.1.html).

```ruby
describe podman.info do
  its("host.os") { should eq "linux" }
end
```

### version

`version` returns the parsed result of [podman version](https://docs.podman.io/en/latest/markdown/podman-version.1.html)

```ruby
describe podman.version do
  its("Client.Version") { should eq "4.1.0"}
  its('Server.Version') { should eq '4.1.0'}
end
```

### object('id')

`object` returns low-level information about Podman objects as returned by [podman inspect](https://docs.podman.io/en/latest/markdown/podman-inspect.1.html).

```ruby
describe podman.object(id) do
  its('State.Running') { should eq true }
end
```

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).
