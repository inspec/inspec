+++
title = "google_organization_iam_binding resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_organization_iam_binding"
    identifier = "inspec/resources/gcp/google_organization_iam_binding.md google_organization_iam_binding resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_organization_iam_binding` is used to test a Google Organization Iam Bindings

## Examples

```ruby
describe google_organization_iam_binding(name: "name", role: "roles/editor") do
  it { should exist }
  its('members') { should include 'user:testuser@example.com' }
end
```

## Properties

Properties that can be accessed from the `google_organization_iam_binding` resource:

`role`
: Role that is assigned to members. For example, roles/viewer, roles/editor, or roles/owner.

`members`
: Specifies the identities requesting access for a Cloud Platform resource.

## GCP Permissions

Ensure the [Cloud Resource Manager API](https://console.cloud.google.com/apis/library/cloudresourcemanager.googleapis.com/) is enabled for the current project.
