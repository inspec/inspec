+++
title = "google_container_regional_node_pools resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_container_regional_node_pools"
    identifier = "inspec/resources/gcp/google_container_regional_node_pools.md google_container_regional_node_pools resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_container_regional_node_pools` is used to test a Google RegionalNodePool resource

## Examples

```ruby
describe google_container_regional_node_pools(project: 'chef-gcp-inspec', location: 'europe-west2', cluster: 'inspec-gcp-regional-cluster') do
  its('initial_node_counts') { should include '1'}
end
```

## Properties

Properties that can be accessed from the `google_container_regional_node_pools` resource:

See the [google_container_regional_node_pool](/inspec/resources/google_container_regional_node_pool/#properties) resource for more information.

`names`
: an array of `google_container_regional_node_pool` name

`configs`
: an array of `google_container_regional_node_pool` config

`initial_node_counts`
: an array of `google_container_regional_node_pool` initial_node_count

`statuses`
: an array of `google_container_regional_node_pool` status

`status_messages`
: an array of `google_container_regional_node_pool` status_message

`versions`
: an array of `google_container_regional_node_pool` version

`autoscalings`
: an array of `google_container_regional_node_pool` autoscaling

`managements`
: an array of `google_container_regional_node_pool` management

`max_pods_constraints`
: an array of `google_container_regional_node_pool` max_pods_constraint

`conditions`
: an array of `google_container_regional_node_pool` conditions

`pod_ipv4_cidr_sizes`
: an array of `google_container_regional_node_pool` pod_ipv4_cidr_size

`clusters`
: an array of `google_container_regional_node_pool` cluster

`locations`
: an array of `google_container_regional_node_pool` location

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Kubernetes Engine API](https://console.cloud.google.com/apis/library/container.googleapis.com/) is enabled for the current project.
