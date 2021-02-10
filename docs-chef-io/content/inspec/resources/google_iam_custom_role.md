+++
title = "google_iam_custom_role resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_iam_custom_role"
    identifier = "inspec/resources/gcp/google_iam_custom_role.md google_iam_custom_role resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_iam_custom_role` is used to test a Google CustomRole resource

## Examples

```ruby
describe google_iam_custom_role(project: 'chef-gcp-inspec', name: 'admin-role') do
  it { should exist }
  its('stage') { should eq 'GA' }
  its('included_permissions') { should eq ["iam.roles.list"] }
end

describe google_iam_custom_role(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_iam_custom_role` resource:

`name`
: The name of the role.

`title`
: A human-readable title for the role. Typically this is limited to 100 UTF-8 bytes.

`description`
: Human-readable description for the role

`included_permissions`
: Names of permissions this role grants when bound in an IAM policy.

`stage`
: The current launch stage of the role.

`deleted`
: The current deleted state of the role

## GCP Permissions

Ensure the [Identity and Access Management (IAM) API](https://console.cloud.google.com/apis/library/iam.googleapis.com/) is enabled for the current project.
