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

## Properties

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

### Low-level information of docker image as `docker_image`'s Property

#### inspection
`:inspection` property allows testing the low-level information of docker image returned by `docker inspect [docker_image]`. Use hash format `'key' => 'value` for testing the information.

    its(:inspection) { should include "Key" => "Value" }
    its(:inspection) { should include "Key" =>
      {
        "SubKey" => "Value1",
        "SubKey" => "Value2"
      }
    }

#### Additionally, all keys of the low-level information are valid properties and can be passed in three ways when writing the test.
- Serverspec's syntax
```
  its(['key']) { should eq some_value }
  its(['key1.key2.key3']) { should include some_value }
```
- InSpec's syntax
```
  its(['key']) { should eq some_value }
  its(['key1', 'key2', 'key3']) { should include some_value }
```
- Combination of Serverspec and InSpec
```
  its(['key1.key2', 'key3']) { should include some_value }
```

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The `exist` matcher tests if the image is available on the node:

    it { should exist }

## Examples
### Test if a docker image exists and verify the image properties: `id`, `image`, `repo` and `tag`.

    describe docker_image('alpine:latest') do
      it { should exist }
      its('id') { should eq 'sha256:4a415e...a526' }
      its('image') { should eq 'alpine:latest' }
      its('repo') { should eq 'alpine' }
      its('tag') { should eq 'latest' }
    end

### Test if a docker image exists and verify the low level information: `Architecture`, `Config.Cmd`, `Os`, and `GraphDriver`

    describe docker_image('ubuntu:latest') do
      it { should exist }
      its(['Architecture']) { should eq 'arm64' }
      its(['Config.Cmd']) { should include 'bash' }
      its(['GraphDriver.Data.MergedDir']) { should include "/var/lib/docker/overlay2/4336ba2a87c8d82abaa9ee5afd3ac20ea275bf05502d74d8d8396f8f51a4736c/merged" }
      its(:inspection) { should include 'Architecture' => 'arm64' }
      its(:inspection) { should_not include 'Architecture' => 'i386' }
      its(:inspection) { should include "GraphDriver" =>
        {
          "Data" => {
            "MergedDir" => "/var/lib/docker/overlay2/4336ba2a87c8d82abaa9ee5afd3ac20ea275bf05502d74d8d8396f8f51a4736c/merged",
            "UpperDir" => "/var/lib/docker/overlay2/4336ba2a87c8d82abaa9ee5afd3ac20ea275bf05502d74d8d8396f8f51a4736c/diff",
            "WorkDir"=> "/var/lib/docker/overlay2/4336ba2a87c8d82abaa9ee5afd3ac20ea275bf05502d74d8d8396f8f51a4736c/work"
          },
          "Name" => "overlay2"
        }
      }
    end