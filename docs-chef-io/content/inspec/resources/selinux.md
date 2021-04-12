+++
title = "selinux resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "selinux"
    identifier = "inspec/resources/os/selinux.md selinux resource"
    parent = "inspec/resources/os"
+++

Use the `selinux` Chef InSpec audit resource to test the state/mode of SELinux policy.

selinux resource extracts and exposes data reported by the command 'sestatus'

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

## Syntax

The `selinux` Chef InSpec resource block tests the state/mode of the SELinux policy.

    describe selinux do
      it { should be_installed }
      it { should_not be_disabled }
      it { should be_enforcing }
      it { should_not be_permissive }
    end

## Examples

The following examples show how to use this Chef InSpec selinux resource.

### Test if selinux is installed and enabled

describe selinux do
  it { should be_installed }
  it { should_not be_disabled }
end

### Test if selinux is enabled and running in enforcing mode

describe selinux do
  it { should_not be_disabled }
  it { should be_enforcing }
end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### be_installed

The `be_installed` matcher tests if the selinux is installed on the system:

    it { should be_installed }

### be_disabled

The `be_disabled` matcher tests if the selinux is disabled on the system:

    it { should be_disabled }

### be_enforcing

The `be_enforcing` matcher tests if the selinux mode is set to enforcing:

    it { should be_enforcing }

### be_permissive

The `be_permissive` matcher tests if the selinux mode is set to permissive:

    it { should be_permissive }
