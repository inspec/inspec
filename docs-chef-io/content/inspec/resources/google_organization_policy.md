+++
title = "google_organization_policy resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_organization_policy"
    identifier = "inspec/resources/gcp/google_organization_policy.md google_organization_policy resource"
    parent = "inspec/resources/gcp"
+++

Use the `google_organization_policy` InSpec audit resource to test constraints set on a GCP organization.

## Syntax

Google organization policies can restrict certain GCP services. For more information see https://cloud.google.com/resource-manager/docs/organization-policy/understanding-constraints

A `google_organization_policy` resource block declares the tests for a single GCP organization constraint identified by the pair of the `name` of the organization and the `constraint`:

    describe google_organization_policy(name: 'organizations/123456', constraint: 'constraints/compute.disableGuestAttributesAccess') do
      it { should exist }
      its('boolean_policy.enforced') { should be true }
    end

## Examples

The following examples show how to use this InSpec audit resource.

### Test that a GCP organization has a specific constraint enforced

    describe google_organization_policy(name: 'organizations/123456', constraint: 'constraints/compute.disableGuestAttributesAccess') do
      it { should exist }
      its('boolean_policy.enforced') { should be true }
    end

### Test that a GCP organization has certain values allowed for a list constraint

    describe google_organization_policy(name: 'organizations/123456', constraint: 'constraints/someListConstraint') do
      it { should exist }
      its('list_policy.allowed_values') { should include 'included_val' }
      its('list_policy.allowed_values') { should_not include 'excluded' }
      its('list_policy.denied_values') { should include 'denied' }
    end

## Properties

`update_time`
: The time stamp this policy was last updated.

`boolean_policy`
: Only available for constraints that are boolean policies.

  `enforced`
  : Boolean for if this policy is enforced.

`list_policy`
: Available for list policies.

  `allowed_values`
  : List of values allowed at this resource.

  `denied_values`
  : List of values denied at this resource.

## GCP Permissions

Ensure the [Cloud Resource Manager API](https://console.cloud.google.com/apis/library/cloudresourcemanager.googleapis.com/) is enabled for the project.
