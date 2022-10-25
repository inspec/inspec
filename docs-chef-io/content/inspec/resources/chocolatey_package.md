+++
title = "chocolatey_package resource"
draft = false
gh_repo = "inspec"
platform = "windows"

[menu]
  [menu.inspec]
    title = "chocolatey_package"
    identifier = "inspec/resources/os/chocolatey_package.md chocolatey_package resource"
    parent = "inspec/resources/os"
+++

Use the `chocolatey_package` Chef InSpec audit resource to test if the named [Chocolatey](https://chocolatey.org/) package and/or package version is installed on the system.

## Availability

### Installation

{{% inspec/inspec_installation %}}

### Version

This resource first became available in v2.1.30 of InSpec.

## Syntax

A `chocolatey_package` resource block declares the name of a Chocolatey package to be tested:

    describe chocolatey_package('name') do
      it { should be_installed }
    end

where

- `('name')` must specify the (case-sensitive) name of a package, such as `'nssm'`
- `be_installed` is a valid matcher for this resource

## Examples

The following examples show how to use this Chef InSpec audit resource

### Test if NSSM version 2.1.0 is installed

    describe chocolatey_package('nssm') do
      it { should be_installed }
      its('version') { should eq '2.1.0' }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers).

### be_installed

The `be_installed` matcher tests if the named package is installed at all.

    it { should be_installed }

### version

The `version` matcher tests if the named package version is on the system:

    its('version') { should eq '2.1.0' }

You can also use the `cmp OPERATOR` matcher to perform comparisons using the version attribute:

    its('version') { should cmp >= '1.93.4-13debug84' }

`cmp` understands version numbers using Gem::Version, and can use the operators `==, <, <=, >=, and >`. It will compare versions by each segment, not as a string - so '7.4' is smaller than '7.30', for example.
