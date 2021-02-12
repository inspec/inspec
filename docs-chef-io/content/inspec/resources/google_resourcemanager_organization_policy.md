+++
title = "google_resourcemanager_organization_policy resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_resourcemanager_organization_policy"
    identifier = "inspec/resources/gcp/google_resourcemanager_organization_policy.md google_resourcemanager_organization_policy resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_resourcemanager_organization_policy` is used to test organization policy constraints. More information can be found here [Organization Policy Constraints](https://cloud.google.com/resource-manager/docs/organization-policy/org-policy-constraints)

## Examples

```ruby
describe google_resourcemanager_organization_policy(organization_name: "organizations/123456789", constraint: "constraints/compute.disableSerialPortAccess") do
  it { should exist }
  its('constraint') { should eq 'constraints/compute.disableSerialPortAccess' }
  its('boolean_policy.enforced') { should be true }
end
```

## Properties

Properties that can be accessed from the `google_resourcemanager_organization_policy` resource:

`version`
: The version of the policy.

`constraint`
: The name of the constraint the policy is configuring.

`update_time`
: The time stamp the policy was previously updated.

`list_policy`
: List of values either allowed or disallowed

  `allowed_values`
  : List of values allowed

  `denied_values`
  : List of values denied

`boolean_policy`
: Used to specify how a boolean policy will behave

  `enforced`
  : If true then the policy is enforced. If false then any configuration is acceptable

## GCP Permissions

Ensure the [Cloud Resource Manager API](https://console.cloud.google.com/apis/library/cloudresourcemanager.googleapis.com/) is enabled for the current project.
