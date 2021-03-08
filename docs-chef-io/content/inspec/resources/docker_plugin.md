+++
title = "docker_plugin resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "docker_plugin"
    identifier = "inspec/resources/os/docker_plugin.md docker_plugin resource"
    parent = "inspec/resources/os"
+++

Use the `docker_plugin` Chef InSpec audit resource to verify a Docker plugin.

## Syntax

A `docker_plugin` resource block declares the plugin:

    describe docker_plugin('rexray/ebs') do
      it { should exist }
      its('id') { should_not eq '0ac30b93ad40' }
      its('version') { should eq '0.11.1' }
      it { should be_enabled }
    end

## Resource Parameter Examples

The resource allows you to pass in an plugin id:

    describe docker_plugin(id: plugin_id) do
      it { should be_enabled }
    end

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

## Matchers

For a full list of available matchers, please visit our [Universal Matchers](/inspec/matchers/).

### exist

The `exist` matcher tests if the plugin is available on the node:

    describe docker_plugin('rexray/ebs') do
      it { should exist }
    end

### enabled

The `be_enabled` matches tests if the plugin is enabled
