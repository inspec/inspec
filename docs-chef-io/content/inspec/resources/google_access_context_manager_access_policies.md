+++
title = "google_access_context_manager_access_policies resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_access_context_manager_access_policies"
    identifier = "inspec/resources/gcp/google_access_context_manager_access_policies.md google_access_context_manager_access_policies resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_access_context_manager_access_policies` is used to test a Google AccessPolicy resource

## Examples

```ruby
describe google_access_context_manager_access_policies(org_id: '190694428152') do
  its('count') { should be >= 1 }
  its('titles') { should include 'policytitle' }
end
```

## Properties

Properties that can be accessed from the `google_access_context_manager_access_policies` resource:

See the [google_access_context_manager_access_policy](/inspec/resources/google_access_context_manager_access_policy/#properties) resource for more information.

`names`
: an array of `google_access_context_manager_access_policy` name

`create_times`
: an array of `google_access_context_manager_access_policy` create_time

`update_times`
: an array of `google_access_context_manager_access_policy` update_time

`parents`
: an array of `google_access_context_manager_access_policy` parent

`titles`
: an array of `google_access_context_manager_access_policy` title

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
