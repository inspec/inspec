+++
title = "pip resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "pip"
    identifier = "inspec/resources/os/pip.md pip resource"
    parent = "inspec/resources/os"
+++

Use the `pip` Chef InSpec audit resource to test packages that are installed using the Python PIP installer.

## Availability

### Installation

{{% inspec/inspec_installation %}}

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `pip` resource block declares a package and (optionally) a package version:

    describe pip('package_name') do
      it { should be_installed }
    end

where

- `'package_name'` is the name of the package, such as `'Jinja2'`
- `be_installed` tests to see if the package described above is installed

## Properties

### version

The `version` property tests if the named package version is on the system:

    its('version') { should eq '1.2.3' }

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test if Jinja2 is installed on the system

    describe pip('Jinja2') do
      it { should be_installed }
    end

### Test if Jinja2 2.8 is installed on the system

    describe pip('Jinja2') do
      it { should be_installed }
      its('version') { should eq '2.8' }
    end

### Test packages installed into a non-default location (e.g. virtualenv) by passing a custom path to pip executable

    describe pip('Jinja2', '/path/to/bin/pip') do
      it { should be_installed }
      its('version') { should eq '2.8' }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### be_installed

The `be_installed` matcher tests if the named package is installed on the system:

    it { should be_installed }

