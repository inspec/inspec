+++
title = "docker_container resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "docker_container"
    identifier = "inspec/resources/os/docker_container.md docker_container resource"
    parent = "inspec/resources/os"
+++

Use the `docker_container` Chef InSpec audit resource to test a Docker container.

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

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).
The specific matchers of this resource are: `exist`, `be_running`, `have_volume?`.

### exist

The `exist` matcher is used to specify if the container exists:

    it { should exist }

### be_running

The `be_running` matcher is used to check if the container is running:

    it { should be_running }

### have_volume?

The `have_volume?` matcher is used to check if the container has a mounted volumes:

    it { should have_volume?(destination_path_in_container, source_path_in_source) }

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Ensures container exists

The below test passes if the container `wonderful_wozniak` exists as part of the Docker instances.

    describe docker_container('wonderful_wozniak') do
      it { should exist }
    end

### Ensures container is in running status

The below test passes if the container `trusting_williams` exists as part of the Docker instances and the status is running.

    describe docker_container('trusting_williams') do
      it { should be_running }
    end

### Ensures container has mounted volumes

The below test passes if the container `quizzical_williamson` exists as part of the Docker instances, the status is running and has mounted volume on `/app` in the container from the source path of `/var/lib/docker/volumes/myvol2/_data`

    describe docker_container('quizzical_williamson') do
      it { should have_volume('/app', '/var/lib/docker/volumes/myvol2/_data') }
    end
