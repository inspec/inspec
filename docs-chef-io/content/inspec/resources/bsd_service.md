+++
title = "bsd_service resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "bsd_service"
    identifier = "inspec/resources/os/bsd_service.md bsd_service resource"
    parent = "inspec/resources/os"
+++

Use the `bsd_service` Chef InSpec audit resource to test a service using a Berkeley OS-style `init` on the FreeBSD platform.

## Availability

### Installation

{{% inspec/inspec_installation %}}

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `bsd_service` resource block declares the name of a service and then one (or more) matchers to test the state of the service:

    describe bsd_service('service_name') do
      it { should be_installed }
      it { should be_enabled }
      it { should be_running }
    end

where

- `('service_name')` must specify a service name
- `be_installed`, `be_enabled`, and `be_running` are the different [matchers](#matchers) for this resource.

## Parameters

### Path

The path to the service manager's control may be specified for situations where the path isn't available in the current `PATH`. For example:

    describe bsd_service('service_name', '/path/to/control') do
      it { should be_enabled }
      it { should be_installed }
      it { should be_running }
    end

## Properties

All properties available to the [`service`](/inspec/resources/service/) resource may be used.

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### be_enabled

The `be_enabled` matcher tests if the named service is enabled:

    it { should be_enabled }

### be_installed

The `be_installed` matcher tests if the named service is installed:

    it { should be_installed }

### be_running

The `be_running` matcher tests if the named service is running:

    it { should be_running }
