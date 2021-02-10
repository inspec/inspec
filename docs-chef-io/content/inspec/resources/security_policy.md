+++
title = "security_policy resource"
draft = false
gh_repo = "inspec"
platform = "windows"

[menu]
  [menu.inspec]
    title = "security_policy"
    identifier = "inspec/resources/os/security_policy.md security_policy resource"
    parent = "inspec/resources/os"
+++

Use the `security_policy` Chef InSpec audit resource to test security policies on the Windows platform.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `security_policy` resource block declares the name of a security policy and the value to be tested:

    describe security_policy do
      its('policy_name') { should eq 'value' }
    end

where

- `'policy_name'` must specify a security policy
- `{ should eq 'value' }` tests the value of `policy_name` against the value declared in the test

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Verify that only the Administrators group has remote access

    describe security_policy do
      its('SeRemoteInteractiveLogonRight') { should eq '*S-1-5-32-544' }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### policy_name

The `policy_name` matcher must be the name of a security policy:

    its('SeNetworkLogonRight') { should eq '*S-1-5-11' }
