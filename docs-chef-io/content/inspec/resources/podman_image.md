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

This resource is distributed with Chef InSpec.

## Syntax

A `podman_image` Chef InSpec audit resource helps to test the properties of a container image on Podman

    describe podman_image("docker.io/library/busybox") do
      it { should exist }
      its("id") { should eq "sha256:3c19bafed22355e11a608c4b613d87d06b9cdd37d378e6e0176cbc8e7144d5c6" }
      its("image") { should eq "docker.io/library/busybox:latest" }
      its("repo") { should eq "docker.io/library/busybox" }
      its("tag") { should eq "latest" }
    end
where

- `'id'`, `'image'`, `'repo'`, `'tag'` are properties of this resource to fetch the respective properties of the container image
- `exist` is a matcher of this resource

### Resource Parameter Examples

The resource allows you to pass an image name. If the tag is missing for an image, `latest` is assumed as default.

    describe podman_image("docker.io/library/busybox") do
      it { should exist }
    end
    
The resource allows you to pass the repository and tag values as separate values.

    describe podman_image(repo: "docker.io/library/busybox", tag: "latest") do
      it { should exist }
    end

The resource allows you to pass with an image ID.

    describe podman_image(id: "8847e9bf6df8") do
      it { should exist }
    end


## Properties

### id

The `id` property returns the full image ID.

    its('id') { should eq 'sha256:3c19bafed22355e11a608c4b613d87d06b9cdd37d378e6e0176cbc8e7144d5c6' }

### image

The `image` property tests the value of the image. It is a combination of `repository:tag`.

    its('image') { should eq 'docker.io/library/busybox:latest' }

### repo

The `repo` property tests the value of the repository name.

    its('repo') { should eq 'docker.io/library/busybox' }

### tag

The `tag` property tests the value of the image tag.

    its('tag') { should eq 'latest' }


## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The `exist` matcher tests if the image is available on Podman.

    it { should exist }

## Examples

### Test if an image exists on Podman and verifies the image properties: id, image, repo, and tag

    describe podman_image("docker.io/library/busybox") do
      it { should exist }
      its("id") { should eq "sha256:3c19bafed22355e11a608c4b613d87d06b9cdd37d378e6e0176cbc8e7144d5c6" }
      its("image") { should eq "docker.io/library/busybox:latest" }
      its("repo") { should eq "docker.io/library/busybox" }
      its("tag") { should eq "latest" }
    end

