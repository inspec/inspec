---
title: About the docker_container Resource
platform: linux
---

# docker_container

Use the `docker_container` Chef InSpec audit resource to test a Docker container.

<br>

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.21.0 of InSpec.

## Syntax

A `docker_container` resource block declares the configuration data to be tested:

    describe docker_container('container') do
      it { should exist }
      it { should be_running }
      its('id') { should_not eq '' }
      its('image') { should eq 'busybox:latest' }
      its('repo') { should eq 'busybox' }
      its('tag') { should eq 'latest' }
      its('ports') { should eq [] }
      its('command') { should eq 'nc -ll -p 1234 -e /bin/cat' }
    end

<br>

## Resource Parameter Examples

### name

The container name can also be passed with the `name` resource parameter:

    describe docker_container(name: 'an-echo-server') do
      it { should exist }
      it { should be_running }
    end

### id

Alternatively, you can pass in the container id:

    describe docker_container(id: '71b5df59442b') do
      it { should exist }
      it { should be_running }
    end

<br>

## Property Examples

The following examples show how to use this Chef InSpec resource.

### id

The `id` property tests the container id:

    its('id') { should eq 'sha:71b5df59...442b' }

### repo

The `repo` property tests the value of the image repository:

    its('repo') { should eq 'busybox' }

### tag

The `tag` property tests the value of the image tag:

    its('tag') { should eq 'latest' }

### ports

The `ports` property tests the value the Docker ports:

    its('ports') { should eq '0.0.0.0:1234->1234/tcp' }

### command

The `command` property tests the value of the container run command:

    its('command') { should eq 'nc -ll -p 1234 -e /bin/cat' }


### Verify a running container:

    describe docker_container('an-echo-server') do
      it { should exist }
      it { should be_running }
      its('id') { should_not eq '' }
      its('image') { should eq 'busybox:latest' }
      its('repo') { should eq 'busybox' }
      its('tag') { should eq 'latest' }
      its('ports') { should eq [] }
      its('command') { should eq 'nc -ll -p 1234 -e /bin/cat' }
    end

<br>

## Matchers

For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).
