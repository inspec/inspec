---
title: About the oneget Resource
platform: windows
---

# oneget

Use the `oneget` Chef InSpec audit resource to test if the named package and/or package version is installed on the system. This resource uses Oneget, which is `part of the Windows Management Framework 5.0 and Windows 10 <https://github.com/OneGet/oneget>`__. This resource uses the `Get-Package` cmdlet to return all of the package names in the Oneget repository.

<br>

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `oneget` resource block declares a package and (optionally) a package version:

    describe oneget('name') do
      it { should be_installed }
    end

where

* `('name')` must specify the name of a package, such as `'VLC'`
* `be_installed` is a valid matcher for this resource

<br>

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test if VLC is installed

    describe oneget('VLC') do
      it { should be_installed }
    end

<br>

## Matchers

For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).

### be_installed

The `be_installed` matcher tests if the named package is installed on the system:

    it { should be_installed }

### version

The `version` matcher tests if the named package version is on the system:

    its('version') { should eq '1.2.3' }
