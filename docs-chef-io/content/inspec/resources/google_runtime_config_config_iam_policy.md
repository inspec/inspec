+++
title = "google_runtime_config_config_iam_policy resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_runtime_config_config_iam_policy"
    identifier = "inspec/resources/gcp/google_runtime_config_config_iam_policy.md google_runtime_config_config_iam_policy resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_runtime_config_config_iam_policy` is used to test a Google Config Iam Policy resource

## Examples

```ruby
describe google_runtime_config_config_iam_policy(project: "project", name: "name") do
  it { should exist }
end

google_runtime_config_config_iam_policy(project: "project", name: "name").bindings.each do |binding|
  describe binding do
    its('role') { should eq 'roles/editor'}
    its('members') { should include 'user:testuser@example.com'}
  end
end
```

## Properties

Properties that can be accessed from the `google_runtime_config_config_iam_policy` resource:

`iam_binding_roles`
: The list of roles that exist on the policy.

`bindings`
: Associates a list of members to a role.

  `role`
  : Role that is assigned to members. For example, roles/viewer, roles/editor, or roles/owner.

  `members`
  : Specifies the identities requesting access for a Cloud Platform resource.

`audit_configs`
: Specifies cloud audit logging configuration for this policy.

  `service`
  : Specifies a service that will be enabled for audit logging. For example, `storage.googleapis.com`, `cloudsql.googleapis.com`. `allServices`  is a special value that covers all services.

  `audit_log_configs`
  : The configuration for logging of each type of permission.

    `log_type`
    : The log type that this config enables. For example, ADMIN_READ, DATA_WRITE or DATA_READ

    `exempted_members`
    : Specifies the identities that do not cause logging for this type of permission.

## GCP Permissions

Ensure the [Cloud Resource Manager API](https://console.cloud.google.com/apis/library/cloudresourcemanager.googleapis.com/) is enabled for the current project.
