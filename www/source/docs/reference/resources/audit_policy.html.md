---
title: About the audit_policy Resource
platform: linux
---

# audit_policy

Use the `audit_policy` Chef InSpec audit resource to test auditing policies on the Windows platform. An auditing policy is a category of security-related events to be audited. Auditing is disabled by default and may be enabled for categories like account management, logon events, policy changes, process tracking, privilege use, system events, or object access. For each enabled auditing category property, the auditing level may be set to `No Auditing`, `Not Specified`, `Success`, `Success and Failure`, or `Failure`.

<br>

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

An `audit_policy` resource block declares a parameter that belongs to an audit policy category or subcategory:

    describe audit_policy do
      its('parameter') { should eq 'value' }
    end

where

* `'parameter'` must specify a parameter
* `'value'` must be one of `No Auditing`, `Not Specified`, `Success`, `Success and Failure`, or `Failure`

<br>

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test that a parameter is not set to "No Auditing"

    describe audit_policy do
      its('Other Account Logon Events') { should_not eq 'No Auditing' }
    end

### Test that a parameter is set to "Success"

    describe audit_policy do
      its('User Account Management') { should eq 'Success' }
    end

<br>

## Matchers

For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).
