+++
title = "windows_hotfix resource"
draft = false
gh_repo = "inspec"
platform = "windows"

[menu]
  [menu.inspec]
    title = "windows_hotfix"
    identifier = "inspec/resources/os/windows_hotfix.md windows_hotfix resource"
    parent = "inspec/resources/os"
+++

Use the `windows_hotfix` Chef InSpec audit resource to test if the hotfix has been installed on a Windows system.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.39.1 of InSpec.

## Syntax

A `windows_hotfix` resource block declares a hotfix to validate:

    describe windows_hotfix('name') do
      it { should be_installed }
    end

where

- `('name')` must specify the name of a hotfix, such as `'KB4012213'`
- `be_installed` is a valid matcher for this resource

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test if KB4012213 is installed

    describe windows_hotfix('KB4012213') do
      it { should be_installed }
    end

### Test that a hotfix is not installed

    describe windows_hotfix('KB9999999') do
      it { should_not be_installed }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### be_installed

The `be_installed` matcher tests if the named hotfix is installed on the system:

    it { should be_installed }
