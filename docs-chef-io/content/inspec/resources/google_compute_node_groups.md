+++
title = "google_compute_node_groups resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_node_groups"
    identifier = "inspec/resources/gcp/google_compute_node_groups.md google_compute_node_groups resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_node_groups` is used to test a Google NodeGroup resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_node_groups(project: 'chef-gcp-inspec', zone: 'zone') do
  it { should exist }
  its('descriptions') { should include 'A description of the node group' }
  its('sizes') { should include '0' }
  its('names') { should include 'inspec-node-group' }
end
```

## Properties

Properties that can be accessed from the `google_compute_node_groups` resource:

See the [google_compute_node_group](/inspec/resources/google_compute_node_group/#properties) resource for more information.

`creation_timestamps`
: an array of `google_compute_node_group` creation_timestamp

`descriptions`
: an array of `google_compute_node_group` description

`names`
: an array of `google_compute_node_group` name

`node_templates`
: an array of `google_compute_node_group` node_template

`sizes`
: an array of `google_compute_node_group` size

`autoscaling_policies`
: (Beta only) an array of `google_compute_node_group` autoscaling_policy
`zones`
: an array of `google_compute_node_group` zone

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
