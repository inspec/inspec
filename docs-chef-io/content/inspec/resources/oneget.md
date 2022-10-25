+++
title = "oneget resource"
draft = false
gh_repo = "inspec"
platform = "windows"

[menu]
  [menu.inspec]
    title = "oneget"
    identifier = "inspec/resources/os/oneget.md oneget resource"
    parent = "inspec/resources/os"
+++

Use the `oneget` Chef InSpec audit resource to test if the named package and/or package version is installed on the system. This resource uses Oneget, which is `part of the Windows Management Framework 5.0 and Windows 10 <https://github.com/OneGet/oneget>`. This resource uses the `Get-Package` cmdlet to return all of the package names in the Oneget repository.

## Availability

### Installation

{{% inspec/inspec_installation %}}

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `oneget` resource block declares a package and (optionally) a package version:

    describe oneget('name') do
      it { should be_installed }
    end

where

- `('name')` must specify the name of a package, such as `'VLC'`
- `be_installed` is a valid matcher for this resource

## Properties

### version

The `version` property tests if the named package version is on the system:

    its('version') { should eq '1.2.3' }

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test if VLC is installed

    describe oneget('VLC') do
      it { should be_installed }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### be_installed

The `be_installed` matcher tests if the named package is installed on the system:

    it { should be_installed }

