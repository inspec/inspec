+++
title = "docker_image resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "docker_image"
    identifier = "inspec/resources/os/docker_image.md docker_image resource"
    parent = "inspec/resources/os"
+++

Use the `docker_image` Chef InSpec audit resource to verify a Docker image.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.21.0 of InSpec.

## Syntax

A `docker_image` resource block declares the image:

    describe docker_image('alpine:latest') do
      it { should exist }
      its('id') { should eq 'sha256:4a415e...a526' }
      its('repo') { should eq 'alpine' }
      its('tag') { should eq 'latest' }
    end

## Resource Parameter Examples

The resource allows you to pass in an image id:

    describe docker_image(id: alpine_id) do
      ...
    end

If the tag is missing for an image, `latest` is assumed as default:

    describe docker_image('alpine') do
      ...
    end

You can also pass in repository and tag as separate values

    describe docker_image(repo: 'alpine', tag: 'latest') do
      ...
    end

## Property Examples

### id

The `id` property returns the full image id:

    its('id') { should eq 'sha256:4a415e3663882fbc554ee830889c68a33b3585503892cc718a4698e91ef2a526' }

### image

The `image` property tests the value of the image. It is a combination of `repository/tag`:

    its('image') { should eq 'alpine:latest' }

### repo

The `repo` property tests the value of the repository name:

    its('repo') { should eq 'alpine' }

### tag

The `tag` property tests the value of image tag:

    its('tag') { should eq 'latest' }

### Test a Docker Image

    describe docker_image('alpine:latest') do
      it { should exist }
      its('id') { should eq 'sha256:4a415e...a526' }
      its('image') { should eq 'alpine:latest' }
      its('repo') { should eq 'alpine' }
      its('tag') { should eq 'latest' }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The `exist` matcher tests if the image is available on the node:

    it { should exist }
