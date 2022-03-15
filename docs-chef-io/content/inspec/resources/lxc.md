+++
title = "lxc resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "lxc"
    identifier = "inspec/resources/os/lxc.md lxc resource"
    parent = "inspec/resources/os"
+++

Use the `lxc` Chef InSpec audit resource to test the information about Linux containers. LXC is a command-line client for LXD that manages your LXD instances (containers and virtual machines). The tests are against the container's information obtained on `lxc info [container-name]`. `lxc` resource allows the testing if the container exists or is in running status.

## Availability

### Installation

This resource is distributed with Chef InSpec.

## Syntax

An   `lxc` Chef InSpec audit resource allows testing if the container exists or is in running status.

    describe lxc("linux-container-name") do
      it { should exist }
      it { should be_running }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](https://docs.chef.io/inspec/matchers/).

The specific matchers of this resource are: `exist`, `be_running`.

### exist

The `exist` matcher is used to specify if the container exists:

    it { should exist }

### be_running

The `be_running` matcher is used to check if the container is running:

    it { should be_running }

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Ensures container exists

The below test passes if the container `immense-phoenix` exists as part of the LXD instances.

    describe lxc("immense-phoenix") do
      it { should exist }
    end

### Ensures container is in running status

The below test passes if the container `delicate-sloth` exists as part of the LXD instances and the status is running.

    describe lxc("delicate-sloth") do
      it { should be_running }
    end
