+++
title = "podman_image resource"
draft = false
gh_repo = "inspec"
platform = "unix"

[menu]
  [menu.inspec]
    title = "podman_image"
    identifier = "inspec/resources/os/podman_image.md podman_image resource"
    parent = "inspec/resources/os"
+++

Use the `podman_image` Chef InSpec audit resource to test the properties of a container image on Podman.

## Availability

### Installation

This resource is distributed with Chef InSpec and is automatically available for use.

## Syntax

Use the `podman_image` Chef InSpec audit resource to test the properties of a container image on Podman.

```ruby
describe podman_image("docker.io/library/busybox") do
  it { should exist }
  its("id") { should eq "3c19bafed22355e11a608c4b613d87d06b9cdd37d378e6e0176cbc8e7144d5c6" }
  its("repo_tags") { should include "docker.io/library/busybox:latest" }
  its("size") { should eq 1636053 }
  its("os") { should eq "linux" }
end
```

where:

- `id`, `repo_tags`, `size`, and `os` are properties of this resource to fetch the respective value of the container image.
- `exist` is a matcher of this resource.

### Resource Parameter Examples

The resource allows you to pass an image name. If the tag is missing for an image, `latest` is assumed as default.

```ruby
describe podman_image("docker.io/library/busybox") do
  it { should exist }
end
```

The resource allows you to pass the repository and tag values as separate values.

```ruby
describe podman_image(repo: "docker.io/library/busybox", tag: "latest") do
  it { should exist }
end
```

- The resource allows you to pass with an image ID.

```ruby
describe podman_image(id: "8847e9bf6df8") do
  it { should exist }
end
```

## Properties

### id

The `id` property returns the full image ID.

```ruby
its("id") { should eq "3c19bafed22355e11a608c4b613d87d06b9cdd37d378e6e0176cbc8e7144d5c6" }
```

### repo_tags

The `repo_tags` property tests the value of the repository name.

```ruby
its("repo_tags") { should include "docker.io/library/busybox:latest" }
```

### size

The `size` property tests the size of the image in bytes

```ruby
its("size") { should eq 1636053 }
```

### digest

The `digest` property tests the value of the image digest.

```ruby
its("digest") { should eq "sha256:3614ca5eacf0a3a1bcc361c939202a974b4902b9334ff36eb29ffe9011aaad83" }
```

### created_at

The `created_at` property tests the time of the image creation.

```ruby
its("created_at") { should eq "2022-06-08T00:39:28.175020858Z" }
```

### version

The `version` property tests the version of the image.

```ruby
its("version") { should eq "20.10.12" }
```

### names_history

The `names_history` property tests the names history of the image.

```ruby
its("names_history") { should include "docker.io/library/busybox:latest" }
```

### repo_digests

The `repo_digests` tests the digest of the repository of the given image.

```ruby
its("repo_digests") { should include "docker.io/library/busybox@sha256:2c5e2045f35086c019e80c86880fd5b7c7a619878b59e3b7592711e1781df51a" }
```

### architecture

The `architecture` tests the architecture of the given image.

```ruby
its("architecture") { should eq "arm64" }
```

### os

The `os` property tests the operating system of the given image.

```ruby
its("os") { should eq "linux" }
```

### virtual_size

The `virtual_size` property tests the virtual size of the given image.

```ruby
its("virtual_size") { should eq 1636053 }
```

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The `exist` matcher tests if the image is available on Podman.

```ruby
it { should exist }
```

## Examples

### Test if an image exists on Podman and verify the various image properties

```ruby
describe podman_image("docker.io/library/busybox") do
  it { should exist }
  its("id") { should eq "3c19bafed22355e11a608c4b613d87d06b9cdd37d378e6e0176cbc8e7144d5c6" }
  its("repo_tags") { should include "docker.io/library/busybox:latest" }
  its("size") { should eq 1636053 }
  its("digest") { should eq "sha256:3614ca5eacf0a3a1bcc361c939202a974b4902b9334ff36eb29ffe9011aaad83" }
  its("created_at") { should eq "2022-06-08T00:39:28.175020858Z" }
  its("version") { should eq "20.10.12" }
  its("names_history") { should include "docker.io/library/busybox:latest" }
  its("repo_digests") { should include "docker.io/library/busybox@sha256:2c5e2045f35086c019e80c86880fd5b7c7a619878b59e3b7592711e1781df51a" }
  its("architecture") { should eq "arm64" }
  its("os") { should eq "linux" }
  its("virtual_size") { should eq 1636053 }
  its("resource_id") { should eq "docker.io/library/busybox:latest" }
end
```
