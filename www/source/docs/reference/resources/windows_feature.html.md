---
title: About the windows_feature Resource
platform: windows
---

# windows_feature

Use the `windows_feature` Chef InSpec audit resource to test features on Windows via the `Get-WindowsFeature` cmdlet.

<br>

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `windows_feature` resource block declares the name of the Windows feature, tests if that feature is installed, and then returns information about that feature:

    describe windows_feature('feature_name') do
      it { should be_installed }
    end

where

* `('feature_name')` must specify a Windows feature name, such as `DHCP Server` or `IIS-Webserver`
* `be_installed` is a valid matcher for this resource

<br>

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test the DHCP feature (Attempts PowerShell then DISM)

    describe windows_feature('DHCP') do
      it{ should be_installed }
    end

### Test the IIS-WebServer feature using DISM

    describe windows_feature('IIS-WebServer', DISM) do
      it{ should be_installed }
    end

### Test the NetFx3 feature using DISM

    describe windows_feature('NetFx3', :dism) do
      it{ should be_installed }
    end

<br>

## Matchers

For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).

### be_installed

The `be_installed` matcher tests if the named Windows feature is installed:

    it { should be_installed }
