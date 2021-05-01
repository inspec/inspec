---
title: About the docker_plugin Resource
platform: linux
---

# docker_plugin

Use the `docker_plugin` Chef InSpec audit resource to verify a Docker plugin.

<br>

## Syntax

A `docker_plugin` resource block declares the plugin:

    describe docker_plugin('rexray/ebs') do
      it { should exist }
      its('id') { should_not eq '0ac30b93ad40' }
      its('version') { should eq '0.11.1' }
      it { should be_enabled }
    end

<br>

## Resource Parameter Examples

The resource allows you to pass in an plugin id:

    describe docker_plugin(id: plugin_id) do
      it { should be_enabled }
    end

<br>

## Properties

### id

The `id` property returns the full plugin id:

    describe docker_plugin('cloudstor/aws') do
      its('id') { should eq '0ac30b93ad40' }
    end

### version

The `version` property tests the value of plugin version:

    describe docker_plugin('cloudstor/aws') do
      its('version') { should eq '0.11.0' }
    end

## Examples

### Test a Docker plugin

    describe docker_plugin('rexray/ebs') do
      it { should exist }
      its('id') { should_not eq '0ac30b93ad40' }
      its('version') { should eq '0.11.1' }
      it { should be_enabled }
    end

<br>

## Matchers

For a full list of available matchers, please visit our [Universal Matchers](https://www.inspec.io/docs/reference/matchers/).

### exist

The `exist` matcher tests if the plugin is available on the node:

    describe docker_plugin('rexray/ebs') do
      it { should exist }
    end

### enabled

The `be_enabled` matches tests if the plugin is enabled
