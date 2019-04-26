---
title: About the security_identifier Resource
platform: windows
---

# security_identifier

Use the `security_identifier` Chef InSpec resource to test the [Security Identifier (SID)](https://docs.microsoft.com/en-us/windows/desktop/secauthz/security-identifiers) for user and group trustees on Windows.  

<br>

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

## Resource Parameters

A `security_identifier` resource should specify the name and type of the trustee to test the SID for:

    describe security_identifier(group: 'Everyone') do
      its('sid') { should eq 'S-1-1-0' }
    end

where

* `group:` specifies that `'Everyone'` should be a group. `user:` can be used to specify a user account.
** It is necessary to declare the type of the trustee because Windows allows users, groups and other entities to share names. If you really need to not specify the type, `unspecified:` can be used. This will attempt to match the name to a group and then a useraccount. This may take longer to execute and comes with the risk of Chef InSpec matching the name to an unintended trustee.

<br>

## Examples

The following examples show how to use this Chef InSpec resource.

### Verify that the Admnistrator user has a SID

    describe security_identifier(user: 'Administrator') do
      it { should exist }
    end

### Verify that a SID is the expected value

    describe security_identifier(group: 'Everyone') do
      its('sid') { should eq 'S-1-1-0' }
    end

### Use in conjunction with the security_policy resource to specify the trustee to test for in the audit policy

    describe security_policy do
      its("SeRemoteInteractiveLogonRight") { should_not include security_identifier(group: 'Guests') }
    end

<br>

## Properties

* `sid`

## Property Examples

### sid

    describe security_identifier(group: 'Everyone') do
      its('sid') { should eq 'S-1-1-0' }
    end

## Matchers

This Chef InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).

### exist

For this resource, `exist` is true if a Security Identifier (SID) exists on the target host for the specified trustee.  

