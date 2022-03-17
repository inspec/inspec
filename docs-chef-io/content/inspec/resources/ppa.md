+++
title = "ppa resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "ppa"
    identifier = "inspec/resources/os/ppa.md ppa resource"
    parent = "inspec/resources/os"
+++

Use the `ppa` Chef InSpec audit resource to verify PPA repositories on Debian-based linux distributions. Personal Package Archives (PPAs) are software repositories designed for Ubuntu users and are easier to install than other third-party repositories.

The following ppa formats are supported:
- `ubuntu-wine/ppa`
- `ppa:ubuntu-wine/ppa`
- `http://ppa.launchpad.net/juju/stable/ubuntu`

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

## Syntax

A `ppa` Chef InSpec audit resource verifies PPA repositories on Debian-based linux distributions

    describe ppa('path) do
      it { should exist }
      it { should be_enabled }
    end
where

- `ppa('path')` must specify a PPA repository
- `exist` and `be_enabled` are a valid matchers for this resource

## Matchers

For a full list of available matchers, please visit our [matchers page](https://docs.chef.io/inspec/matchers/).

The specific matchers of this resource are: `exist` and `be_enabled`

### exist

The `exist` matcher tests if a repository exists on the system:

    it { should exist }

### be_enabled

The `be_enabled` matcher tests if a repository is enabled on the system:

    it { should be_enabled }
## Examples
The following example shows how to use this Chef InSpec audit resource.

### Verify that a PPA repository exists and is enabled

    describe ppa('ppa:nginx/stable') do
      it { should exist }
      it { should be_enabled }
    end

