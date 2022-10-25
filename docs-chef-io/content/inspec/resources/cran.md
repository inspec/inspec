+++
title = "cran resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "cran"
    identifier = "inspec/resources/os/cran.md cran resource"
    parent = "inspec/resources/os"
+++

Use the `cran` Chef InSpec audit resource to test R modules that are installed from CRAN package repository.

## Availability

### Installation

{{% inspec/inspec_installation %}}

### Version

This resource first became available in v1.43.5 of InSpec.

## Syntax

A `cran` resource block declares a package and (optionally) a package version:

    describe cran('package_name') do
      it { should be_installed }
    end

where

- `'package_name'` is the name of the package, such as `'DBI'`
- `be_installed` tests to see if the package described above is installed

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test if DBI is installed on the system

    describe cran('DBI') do
      it { should be_installed }
    end

### Test if DBI 0.5.1 is installed on the system

    describe cran('DBI') do
      it { should be_installed }
      its('version') { should eq '0.5.1' }
    end

## Property Examples

### version

The `version` property tests if the named package version is on the system:

    its('version') { should eq '1.2.3' }

## Matchers

This Chef InSpec audit resource has the following matchers:

### be_installed

The `be_installed` matcher tests if the named package is installed on the system:

    it { should be_installed }
