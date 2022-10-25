+++
title = "docker_service resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "docker_service"
    identifier = "inspec/resources/os/docker_service.md docker_service resource"
    parent = "inspec/resources/os"
+++

Use the `docker_service` Chef InSpec audit resource to verify a docker swarm service.

## Availability

### Installation

{{% inspec/inspec_installation %}}

### Version

This resource first became available in v1.51.0 of InSpec.

## Syntax

A `docker_service` resource block declares the service by name:

    describe docker_service('foo') do
      it { should exist }
      its('id') { should eq 'docker-service-id' }
      its('repo') { should eq 'alpine' }
      its('tag') { should eq 'latest' }
    end

## Resource Parameter Examples

The resource allows you to pass in a service id:

    describe docker_service(id: 'docker-service-id') do
      ...
    end

You can also pass in the fully-qualified image:

    describe docker_service(image: 'localhost:5000/alpine:latest') do
      ...
    end

## Property Examples

The following examples show how to use Chef InSpec `docker_service` resource.

### id

The `id` property returns the service id:

    its('id') { should eq 'docker-service-id' }

### image

The `image` property is a combination of `repository:tag` it tests the value of the image:

    its('image') { should eq 'alpine:latest' }

### mode

The `mode` property tests the value of the service mode:

    its('mode') { should eq 'replicated' }

### name

The `name` property tests the value of the service name:

    its('name') { should eq 'foo' }

### ports

The `ports` property tests the value of the service's published ports:

    its('ports') { should include '*:8000->8000/tcp' }

### repo

The `repo` property tests the value of the repository name:

    its('repo') { should eq 'alpine' }

### replicas

The `replicas` property tests the value of the service's replica count:

    its('replicas') { should eq '3/3' }

### tag

The `tag` property tests the value of image tag:

    its('tag') { should eq 'latest' }

### Test a docker service

    describe docker_service('foo') do
      it { should exist }
      its('id') { should eq 'docker-service-id' }
      its('repo') { should eq 'alpine' }
      its('tag') { should eq 'latest' }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The `exist` matcher tests if the image is available on the node:

    it { should exist }
