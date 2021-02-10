+++
title = "apt resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "apt"
    identifier = "inspec/resources/os/apt.md apt resource"
    parent = "inspec/resources/os"
+++

Use the `apt` Chef InSpec audit resource to verify Apt repositories on the Debian and Ubuntu platforms, and also PPA repositories on the Ubuntu platform.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

An `apt` resource block tests the contents of Apt and PPA repositories:

    describe apt('path') do
      it { should exist }
      it { should be_enabled }
    end

where

- `apt('path')` must specify an Apt or PPA repository
- `('path')` may be an `http://` address, a `ppa:` address, or a short `repo-name/ppa` address
- `exist` and `be_enabled` are a valid matchers for this resource

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test if apt repository exists and is enabled

    describe apt('http://ppa.launchpad.net/juju/stable/ubuntu') do
      it { should exist }
      it { should be_enabled }
    end

### Verify that a PPA repository exists and is enabled

    describe apt('ppa:nginx/stable') do
      it { should exist }
      it { should be_enabled }
    end

### Verify that a repository is not present

    describe apt('ubuntu-wine/ppa') do
      it { should_not exist }
      it { should_not be_enabled }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### be_enabled

The `be_enabled` matcher tests if a repository is enabled on the system:

    it { should be_enabled }

### exist

The `exist` matcher tests if a repository exists on the system:

    it { should exist }
