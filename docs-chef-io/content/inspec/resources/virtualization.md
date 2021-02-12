+++
title = "virtualization resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "virtualization"
    identifier = "inspec/resources/os/virtualization.md virtualization resource"
    parent = "inspec/resources/os"
+++

Use the `virtualization` Chef InSpec audit resource to test the virtualization platform on which the system is running.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.28.0 of InSpec.

## Syntax

An `virtualization` resource block declares the virtualization platform that should be tested:

    describe virtualization do
      its('system') { should MATCHER 'value' }
    end

where

- `('system')` is the name of the system information of the virtualization platform (e.g. docker, lxc, vbox, kvm, etc)
- `MATCHER` is a valid matcher for this resource
- `'value'` is the value to be tested

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test for Docker

    describe virtualization do
      its('system') { should eq 'docker' }
    end

### Test for VirtualBox

    describe virtualization do
      its('system') { should eq 'vbox' }
      its('role') { should eq 'guest' }
    end

### Detect the virtualization platform

    if virtualization.system == 'vbox'
      describe package('name') do
        it { should be_installed }
      end
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### virtualization.virtual_system? Helper

This helper returns, if any of the supported virtualization platforms was detected and the machine under test is a guest. You can use this in a `only_if { virtual_system? }` clause to execute test only on virtualized systems.

### virtualization.physical_system? Helper

If no virtualization platform is detected, this will return `true`. For unsupported virtualization platforms this can result in false posititves.

### virtualization.system names

The resource supports the following virtualization platforms:

On Linux machines:

- `docker` (`guest` role only)
- `hyper-v` (`guest` role only)
- `kvm`
- `linux vserver`
- `lxc` / `lxd`
- `openstack` (`host` role only)
- `openvz`
- `parallels` (`guest` role only)
- `virtualbox`
- `vmware` (`guest` role only)
- `xen`

On Windows machines (`guest` role only)

- `hyper-v`
- `kvm`
- `vmware`
- `virtualbox`
- `xen`

### virtualization.role

Can be either

- `guest`
- `host`

Please see the documentation on `virtualization.system` to check supported roles per platform.
