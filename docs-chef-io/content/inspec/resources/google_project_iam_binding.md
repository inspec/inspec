+++
title = "google_project_iam_binding resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_project_iam_binding"
    identifier = "inspec/resources/gcp/google_project_iam_binding.md google_project_iam_binding resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_project_iam_binding` is used to test a Google Project Iam Bindings

## Examples

```ruby
describe google_project_iam_binding(project: "project", role: "roles/editor") do
  it { should exist }
  its('members') { should include 'user:testuser@example.com' }
end
```

This resource supports [IAM conditions](https://cloud.google.com/iam/docs/conditions-overview). Specifying a `condition` in the constructor matches only bindings with that condition. `condition` has three possible fields, `title`, `expression` and `description`. If any of these fields are unspecified they will not be matched.

```
describe google_project_iam_binding(project: "project", role: "roles/browser", condition: { title: "my title" }) do
  it { should exist }
  its('members.count'){ should cmp 1 }
  its('members') { should include 'user:testuser@example.com' }
  its('condition.title') {should cmp 'my title' }
  its('condition.expression') { should cmp "request.time < timestamp('2020-10-01T00:00:00.000Z')" }
end
```

## Properties

Properties that can be accessed from the `google_project_iam_binding` resource:

`role`
: Role that is assigned to members. For example, roles/viewer, roles/editor, or roles/owner.

`members`
: Specifies the identities requesting access for a Cloud Platform resource.

`condition`
: Contains information about when this binding is to be applied.

`expression`
: Textual representation of an expression in Common Expression Language syntax.

`title`
: An optional title for the expression, i.e. a short string describing its purpose.

`description`
: An optional description of the expression. This is a longer text which describes the expression.

## GCP Permissions

Ensure the [Cloud Resource Manager API](https://console.cloud.google.com/apis/library/cloudresourcemanager.googleapis.com/) is enabled for the current project.
