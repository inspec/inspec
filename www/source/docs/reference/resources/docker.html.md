---
title: About the docker Resource
platform: linux
---

# docker

Use the `docker` Chef InSpec audit resource to test configuration data for the Docker daemon. It is a very comprehensive resource. See also: [docker_container](https://www.inspec.io/docs/reference/resources/docker_container/) and [docker_image](https://www.inspec.io/docs/reference/resources/docker_image/), too.

<br>

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.21.0 of InSpec.

## Syntax

A `docker` resource block declares allows you to write test for many containers:

    describe docker.containers do
      its('images') { should_not include 'u12:latest' }
    end

or:

    describe docker.containers.where { names == 'flamboyant_colden' } do
      it { should be_running }
    end

where

* `.where()` may specify a specific item and value, to which the resource parameters are compared
* `commands`, `ids`, `images`, `labels`, `local_volumes`, `mounts`, `names`, `networks`, `ports`, `sizes`  and `status` are valid parameters for `containers`

The `docker` resource block also declares allows you to write test for many images:

    describe docker.images do
      its('repositories') { should_not include 'inssecure_image' }
    end

or if you want to query specific images:

    describe docker.images.where { repository == 'ubuntu' && tag == '12.04' } do
      it { should_not exist }
    end

where

* `.where()` may specify a specific filter and expected value, against which parameters are compared

<br>

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Return all running containers

    docker.containers.running?.ids.each do |id|
      describe docker.object(id) do
        its('State.Health.Status') { should eq 'healthy' }
      end
    end

### Verify a Docker Server and Client version

    describe docker.version do
      its('Server.Version') { should cmp >= '1.12'}
      its('Client.Version') { should cmp >= '1.12'}
    end

### Iterate over all containers to verify host configuration

    docker.containers.ids.each do |id|
      # call Docker inspect for a specific container id
      describe docker.object(id) do
        its(%w(HostConfig Privileged)) { should cmp false }
        its(%w(HostConfig Privileged)) { should_not cmp true }
      end
    end

### Iterate over all images to verify the container was built without ADD instruction

    docker.images.ids.each do |id|
      describe command("docker history #{id}| grep 'ADD'") do
        its('stdout') { should eq '' }
      end
    end

### Verify that health-checks are enabled for a container

    describe docker.object('71b5df59442b') do
      its(%w(Config Healthcheck)) { should_not eq nil }
    end

<br>

## How to run the DevSec Docker baseline profile

There are two ways to run the `docker-baseline` profile to test Docker via the `docker` resource.

Clone the profile:

    $ git clone https://github.com/dev-sec/cis-docker-benchmark.git

and then run:

    $ inspec exec cis-docker-benchmark

Or execute the profile directly via URL:

    $ inspec exec https://github.com/dev-sec/cis-docker-benchmark

<br>

## Resource Parameters

* `commands`, `ids`, `images`, `labels`, `local_volumes`, `mounts`, `names`, `networks`, `ports`, `sizes` and `status` are valid parameters for `containers`

<br>

## Resource Parameter Examples

### containers

`containers` returns information about containers as returned by [docker ps -a](https://docs.docker.com/engine/reference/commandline/ps/).

    describe docker.containers do
      its('ids') { should include 'sha:71b5df59...442b' }
      its('commands') { should_not include '/bin/sh' }
      its('images') { should_not include 'u12:latest' }
      its('ports') { should include '0.0.0.0:1234->1234/tcp' }
      its('labels') { should include 'License=GPLv2' }
    end

### object('id')

`object` returns low-level information about Docker objects. It is calling [docker inspect](https://docs.docker.com/engine/reference/commandline/info/) under the hood.

    describe docker.object(id) do
      its('Configuration.Path') { should eq 'value' }
    end

### images

`images` returns information about a Docker image as returned by [docker images](https://docs.docker.com/engine/reference/commandline/images/).

    describe docker.images do
      its('ids') { should include 'sha:12b5df59...442b' }
      its('repositories') { should_not include 'my_image' }
      its('tags') { should_not include 'unwanted_tag' }
      its('sizes') { should_not include '1.41 GB' }
    end

### plugins

`plugins` returns information about Docker plugins as returned by [docker plugin ls](https://docs.docker.com/engine/reference/commandline/plugin/).

    describe docker.plugins do
      its('names') { should include ['store/weaveworks/net-plugin', 'docker4x/cloudstor'] }
      its('ids') { should cmp ['6ea8176de74b', '771d3ee7c7ea'] }
      its('versions') { should cmp ['2.3.0', '18.03.1-ce-aws1'] }
      its('enabled') { should cmp [true, false] }
    end

### info

`info` returns the parsed result of [docker info](https://docs.docker.com/engine/reference/commandline/info/)

    describe docker.info do
      its('Configuration.Path') { should eq 'value' }
    end

### version

`info` returns the parsed result of [docker version](https://docs.docker.com/engine/reference/commandline/version/)

    describe docker.version do
      its('Server.Version') { should cmp >= '1.12'}
      its('Client.Version') { should cmp >= '1.12'}
    end

<br>

## Properties

* `id`, `image`, `repo`, `tag`, `ports`, `command`

<br>

## Property Examples

### id

    describe docker_container(name: 'an-echo-server') do
      its('id') { should_not eq '' }
    end

### image

    describe docker_container(name: 'an-echo-server') do
      its('image') { should eq 'busybox:latest' }
    end

### repo

    describe docker_container(name: 'an-echo-server') do
      its('repo') { should eq 'busybox' }
    end

### tag

    describe docker_container(name: 'an-echo-server') do
      its('tag') { should eq 'latest' }
    end

### ports

    describe docker_container(name: 'an-echo-server') do
      its('ports') { should eq '0.0.0.0:1234->1234/tcp' }
    end

### command

    describe docker_container(name: 'an-echo-server') do
      its('command') { should eq 'nc -ll -p 1234 -e /bin/cat' }
    end

<br>

## Matchers

For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).

