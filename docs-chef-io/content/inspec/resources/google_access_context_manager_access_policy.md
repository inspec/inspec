+++
title = "google_access_context_manager_access_policy resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_access_context_manager_access_policy"
    identifier = "inspec/resources/gcp/google_access_context_manager_access_policy.md google_access_context_manager_access_policy resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_access_context_manager_access_policy` is used to test a Google AccessPolicy resource

## Examples

```ruby
describe.one do
  google_access_context_manager_access_policies(org_id: '190694428152').names.each do |policy_name|
    describe google_access_context_manager_access_policy(name: policy_name) do
      it { should exist }
      its('title') { should cmp 'policytitle' }
      its('parent') { should match '190694428152' }
    end
  end
end
```

## Properties

Properties that can be accessed from the `google_access_context_manager_access_policy` resource:

`name`
: Resource name of the AccessPolicy. Format: accessPolicies/{policy_id}

`create_time`
: Time the AccessPolicy was created in UTC.

`update_time`
: Time the AccessPolicy was updated in UTC.

`parent`
: The parent of this AccessPolicy in the Cloud Resource Hierarchy. Format: organizations/{organization_id}

`title`
: Human readable title. Does not affect behavior.

## GCP Permissions
