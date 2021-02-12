+++
title = "login_defs resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "login_defs"
    identifier = "inspec/resources/os/login_defs.md login_defs resource"
    parent = "inspec/resources/os"
+++

Use the `login_defs` Chef InSpec audit resource to test configuration settings in the `/etc/login.defs` file. The `logins.defs` file defines site-specific configuration for the shadow password suite on Linux and Unix platforms, such as password expiration ranges, minimum/maximum values for automatic selection of user and group identifiers, or the method with which passwords are encrypted.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `login_defs` resource block declares the `login.defs` configuration data to be tested:

    describe login_defs do
      its('name') { should include('foo') }
    end

where

- `name` is a configuration setting in `login.defs`
- `{ should include('foo') }` tests the value of `name` as read from `login.defs` versus the value declared in the test

## Properties

This resource supports the properties found in the `login.defs` configuration settings.

## Examples

The following examples show how to use this Chef InSpec audit resource.

### name

The `name` matcher tests the value of `name` as read from `login.defs` versus the value declared in the test:

    its('name') { should eq 'foo' }

### Test password expiration settings

    describe login_defs do
      its('PASS_MAX_DAYS') { should eq '180' }
      its('PASS_MIN_DAYS') { should eq '1' }
      its('PASS_MIN_LEN') { should eq '15' }
      its('PASS_WARN_AGE') { should eq '30' }
    end

### Test the encryption method

    describe login_defs do
      its('ENCRYPT_METHOD') { should eq 'SHA512' }
    end

### Test umask setting

    describe login_defs do
      its('UMASK') { should eq '077' }
      its('PASS_MAX_DAYS') { should eq '90' }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).
