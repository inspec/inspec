+++
title = "google_iam_organization_custom_roles resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_iam_organization_custom_roles"
    identifier = "inspec/resources/gcp/google_iam_organization_custom_roles.md google_iam_organization_custom_roles resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_iam_organization_custom_roles` is used to test a Google OrganizationCustomRole resource

## Examples

```ruby
describe google_iam_organization_custom_roles(org_id: '190694428152') do
  its('names') { should include "organizations/123456/roles/role-id" }
end
```

## Properties

Properties that can be accessed from the `google_iam_organization_custom_roles` resource:

See the [google_iam_organization_custom_role](/inspec/resources/google_iam_organization_custom_role/#properties) resource for more information.

`names`
: an array of `google_iam_organization_custom_role` name

`titles`
: an array of `google_iam_organization_custom_role` title

`descriptions`
: an array of `google_iam_organization_custom_role` description

`included_permissions`
: an array of `google_iam_organization_custom_role` included_permissions

`stages`
: an array of `google_iam_organization_custom_role` stage

`deleteds`
: an array of `google_iam_organization_custom_role` deleted

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Identity and Access Management (IAM) API](https://console.cloud.google.com/apis/library/iam.googleapis.com/) is enabled for the current project.
