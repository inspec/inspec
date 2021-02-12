+++
title = "google_compute_security_policies resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_security_policies"
    identifier = "inspec/resources/gcp/google_compute_security_policies.md google_compute_security_policies resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_security_policies` is used to test a Google SecurityPolicy resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_security_policies(project: 'chef-gcp-inspec') do
  its('count') { should be >= 1 }
  its('names') { should include 'sec-policy' }
end
```

## Properties

Properties that can be accessed from the `google_compute_security_policies` resource:

See the [google_compute_security_policy](/inspec/resources/google_compute_security_policy/#properties) resource for more information.

`names`
: an array of `google_compute_security_policy` name

`ids`
: an array of `google_compute_security_policy` id

`rules`
: an array of `google_compute_security_policy` rules

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
