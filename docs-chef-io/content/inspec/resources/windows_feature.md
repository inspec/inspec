+++
title = "windows_feature resource"
draft = false
gh_repo = "inspec"
platform = "windows"

[menu]
  [menu.inspec]
    title = "windows_feature"
    identifier = "inspec/resources/os/windows_feature.md windows_feature resource"
    parent = "inspec/resources/os"
+++

Use the `windows_feature` Chef InSpec audit resource to test features on Windows via the `Get-WindowsFeature` cmdlet.

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

- `('feature_name')` must specify a Windows feature name, such as `DHCP Server` or `IIS-Webserver`
- `be_installed` is a valid matcher for this resource

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

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### be_installed

The `be_installed` matcher tests if the named Windows feature is installed:

    it { should be_installed }
