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

### Install

{{< readfile file="content/inspec/reusable/md/inspec_installation.md" >}}

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

{{< readfile file="content/inspec/reusable/md/inspec_matchers_link.md" >}}

This resource has the following special matchers.

### virtualization.virtual_system? Helper

This helper returns, if any of the supported virtualization platforms was detected and the machine under test is a guest. You can use this in a `only_if { virtual_system? }` clause to execute test only on virtualized systems.

### virtualization.physical_system? Helper

If no virtualization platform is detected, this will return `true`. For unsupported virtualization platforms this can result in false positives.

### virtualization.container_system? Helper

This helper returns `true` when a supported container platform was detected and the machine under test is a guest.

The helper returns `true` for these detected systems: `container-other`, `docker`, `kubepods`, `linux-vserver`, `lxc`, `lxc-libvirt`, `openvz`, `podman`, `pouch`, `proot`, `rkt`, `systemd-nspawn`, and `wsl`.

This helper doesn't return `true` for `lxd` because LXD guests can be containers or virtual machines.

### virtualization.system names

The resource supports the following virtualization platforms:

On Linux machines:

- `acrn` (`guest` role only)
- `amazon` (`guest` role only)
- `apple` (`guest` role only)
- `bochs` (`guest` role only)
- `bhyve` (`guest` role only)
- `container-other` (`guest` role only)
- `docker` (`guest` role only)
- `google` (`guest` role only)
- `hyper-v` (`guest` role only)
- `kvm`
- `linux-vserver`
- `lxc` / `lxd`
- `lxc-libvirt` (`guest` role only)
- `microsoft` (`guest` role only)
- `openstack` (`host` role only)
- `openvz`
- `oracle` (`guest` role only)
- `parallels` (`guest` role only)
- `podman` (`guest` role only)
- `pouch` (`guest` role only)
- `powervm` (`guest` role only)
- `proot` (`guest` role only)
- `qemu` (`guest` role only)
- `qnx` (`guest` role only)
- `rkt` (`guest` role only)
- `sre` (`guest` role only)
- `systemd-nspawn` (`guest` role only)
- `uml` (`guest` role only)
- `vbox`
- `virtualbox`
- `vm-other` (`guest` role only)
- `vmware` (`guest` role only)
- `wsl` (`guest` role only)
- `xen`
- `zvm` (`guest` role only)

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
