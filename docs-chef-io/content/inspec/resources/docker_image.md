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

Use the `docker_image` Chef InSpec audit resource to verify a Docker image. A Docker Image is a template that contains the application and all the dependencies required to run an application on Docker.

## Availability

### Install

This resource is distributed with Chef InSpec.

### Version

This resource is available from the InSpec version, 1.21.0.

## Syntax

A `docker_image` resource block declares the image.

    describe docker_image('ALPINE:LATEST') do
      it { should exist }
      its('id') { should eq 'sha256:4a415e...a526' }
      its('repo') { should eq 'ALPINE' }
      its('tag') { should eq 'LATEST' }
    end

### Resource Parameter Examples

The resource allows you to pass with an image ID.

    describe docker_image(id: ID) do
      ...
    end

If the tag is missing for an image, `LATEST` is assumed as default.

    describe docker_image('ALPINE') do
      ...
    end

You can also pass the repository and tag values as separate values.

    describe docker_image(repo: 'ALPINE', tag: 'LATEST') do
     ...
    end

## Properties

### id

The `id` property returns the full image ID.

    its('id') { should eq 'sha256:4a415e3663882fbc554ee830889c68a33b3585503892cc718a4698e91ef2a526' }

### image

The `image` property tests the value of the image. It is a combination of `repository/tag`.

    its('image') { should eq 'ALPINE:LATEST' }

### repo

The `repo` property tests the value of the repository name.

    its('repo') { should eq 'ALPINE' }

### tag

The `tag` property tests the value of the image tag.

    its('tag') { should eq 'LATEST' }

### Low-level information of docker image as docker_image's property

#### inspection

The property allows testing the low-level information of docker image returned by `docker inspect [docker_image]`. Use hash format `'key' => 'value` for testing the information.

    its(:inspection) { should include "Key" => "Value" }
    its(:inspection) { should include "Key" =>
      {
        "SubKey" => "Value1",
        "SubKey" => "Value2"
      }
    }

Additionally, all keys of the low-level information are valid properties and can be passed in three ways when writing the test.

- Serverspec's syntax

      its(['key']) { should eq some_value }
      its(['key1.key2.key3']) { should include some_value }

- InSpec's syntax

      its(['key']) { should eq some_value }
      its(['key1', 'key2', 'key3']) { should include some_value }

- Combination of Serverspec and InSpec

      its(['key1.key2', 'key3']) { should include some_value }

## Matchers

{{< readfile file="content/inspec/reusable/md/inspec_matchers_link.md" >}}

This resource has the following special matchers.

### exist

The `exist` matcher tests if the image is available on the node.

    it { should exist }

## Examples

### Test if a docker image exists and verifies the image properties: ID, image, repo, and tag

    describe docker_image('ALPINE:LATEST') do
      it { should exist }
      its('id') { should eq 'sha256:4a415e...a526' }
      its('image') { should eq 'ALPINE:LATEST' }
      its('repo') { should eq 'ALPINE' }
      its('tag') { should eq 'LATEST' }
    end

### Test if a docker image exists and verifies the low-level information: Architecture, Config.Cmd, and GraphDriver

    describe docker_image('ubuntu:latest') do
      it { should exist }
      its(['Architecture']) { should eq 'ARM64' }
      its(['Config.Cmd']) { should include 'BASH' }
      its(['GraphDriver.Data.MergedDir']) { should include "/var/lib/docker/overlay2/4336ba2a87c8d82abaa9ee5afd3ac20ea275bf05502d74d8d8396f8f51a4736c/merged" }
      its(:inspection) { should include 'Architecture' => 'ARM64' }
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
