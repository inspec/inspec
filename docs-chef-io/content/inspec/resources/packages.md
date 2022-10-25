+++
title = "packages resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "packages"
    identifier = "inspec/resources/os/packages.md packages resource"
    parent = "inspec/resources/os"
+++

Use the `packages` Chef InSpec audit resource to test the properties of multiple packages on the system.

## Availability

### Installation

{{% inspec/inspec_installation %}}

### Version

This resource first became available in v1.51.15 of InSpec.

## Syntax

A `packages` resource block declares a regular expression search to select packages

    describe packages(/name/) do
      its('statuses') { should cmp 'installed' }
    end

## Properties

### statuses

The `statuses` property tests if packages are installed on the system:

    its('statuses') { should cmp 'installed' }

### versions

The `versions` property tests the versions of the packages installed on the system

    its('versions') { should cmp '3.4.0.2-4.el7' }

### architectures

The `architectures` property tests the architecture of packages installed on the system

    its('architectures') { should include 'i686' }

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Verify that no `xserver` packages are installed

    describe packages(/xserver/) do
      its('statuses') { should_not cmp 'installed' }
    end

### Verify all `openssl` packages match a certain version

    describe packages(/openssl/) do
      its('versions') { should cmp '1.0.1e-42.el7' }
    end

### Verify that both the `i686` and `x86_64` versions of `libgcc` are installed

    describe packages(/libgcc/) do
      its('architectures') { should include 'x86_64' }
      its('architectures') { should include 'i686' }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).
