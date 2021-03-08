+++
title = "google_container_node_pools resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_container_node_pools"
    identifier = "inspec/resources/gcp/google_container_node_pools.md google_container_node_pools resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_container_node_pools` is used to test a Google NodePool resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_container_node_pools(project: 'chef-gcp-inspec', location: 'europe-west2-a', cluster_name: 'gcp-inspec-kube-cluster') do
  its('initial_node_counts') { should include '1'}
end
```

### Test that there are no more than a specified number of node pools available for the project

    describe google_container_node_pools(project: 'chef-inspec-gcp') do
      its('count') { should be <= 10}
    end

### Test that an expected node pool is available for the project

    describe google_container_node_pools(project: 'chef-inspec-gcp') do
      its('node_pool_names') { should include "us-east1-b" }
    end

### Test that a subset of all node pools matching "mypool\*" are "UP"

    google_container_node_pools(project: 'chef-inspec-gcp', location: 'europe-west2-a', cluster_name: 'inspec-gcp-cluster').where(node_pool_name: /^mypool/).node_pool_names.each do |node_pool_name|
      describe google_container_node_pool(project: 'chef-inspec-gcp', location: 'europe-west2-a', cluster_name: 'inspec-gcp-cluster', nodepool_name: node_pool_name) do
        it { should exist }
        its('status') { should eq 'RUNNING' }
      end
    end

## Properties

Properties that can be accessed from the `google_container_node_pools` resource:

See the [google_container_node_pool](/inspec/resources/google_container_node_pool/#properties) resource for more information.

`node_pool_names`
: an array of `google_container_node_pool` name

`configs`
: an array of `google_container_node_pool` config

`initial_node_counts`
: an array of `google_container_node_pool` initial_node_count

`node_pool_statuses`
: an array of `google_container_node_pool` status

`status_messages`
: an array of `google_container_node_pool` status_message

`versions`
: an array of `google_container_node_pool` version

`autoscalings`
: an array of `google_container_node_pool` autoscaling

`managements`
: an array of `google_container_node_pool` management

`max_pods_constraints`
: an array of `google_container_node_pool` max_pods_constraint

`conditions`
: an array of `google_container_node_pool` conditions

`pod_ipv4_cidr_sizes`
: an array of `google_container_node_pool` pod_ipv4_cidr_size

`clusters`
: an array of `google_container_node_pool` cluster

`locations`
: an array of `google_container_node_pool` location

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Kubernetes Engine API](https://console.cloud.google.com/apis/library/container.googleapis.com/) is enabled for the current project.
