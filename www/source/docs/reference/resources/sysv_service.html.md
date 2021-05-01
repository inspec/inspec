---
title: About the sysv_service Resource
platform: linux
---

# sysv_service

Use the `sysv_service` Chef InSpec audit resource to test a service using SystemV.

<br>

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `sysv_service` resource block declares the name of a service and then one (or more) matchers to test the state of the service:

    describe sysv_service('service_name') do
      it { should be_installed }
      it { should be_enabled }
      it { should be_running }
    end

where

* `('service_name')` must specify a service name
* `be_installed`, `be_enabled`, and `be_running` are valid matchers for this resource; all matchers available to the `service` resource may be used

The path to the service manager's control may be specified for situations where the path isn't available in the current `PATH`. For example:

    describe sysv_service('service_name', '/path/to/control') do
      it { should be_enabled }
      it { should be_installed }
      it { should be_running }
    end

<br>

## Matchers

For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).

### be_enabled

The `be_enabled` matcher tests if the named service is enabled:

    it { should be_enabled }

### be_installed

The `be_installed` matcher tests if the named service is installed:

    it { should be_installed }

### be_running

The `be_running` matcher tests if the named service is running:

    it { should be_running }
