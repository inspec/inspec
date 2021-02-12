+++
title = "google_container_regional_clusters resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_container_regional_clusters"
    identifier = "inspec/resources/gcp/google_container_regional_clusters.md google_container_regional_clusters resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_container_regional_clusters` is used to test a Google RegionalCluster resource

## Examples

```ruby
describe google_container_regional_clusters(project: 'chef-gcp-inspec', location: 'europe-west2') do
  its('count') { should be >= 1 }
  its('names') { should include 'inspec-gcp-regional-cluster' }
  its('initial_node_counts') { should include '1'}
end
```

## Properties

Properties that can be accessed from the `google_container_regional_clusters` resource:

See the [google_container_regional_cluster](/inspec/resources/google_container_regional_cluster/#properties) resource for more information.

`names`
: an array of `google_container_regional_cluster` name

`descriptions`
: an array of `google_container_regional_cluster` description

`initial_node_counts`
: an array of `google_container_regional_cluster` initial_node_count

`node_configs`
: an array of `google_container_regional_cluster` node_config

`master_auths`
: an array of `google_container_regional_cluster` master_auth

`logging_services`
: an array of `google_container_regional_cluster` logging_service

`monitoring_services`
: an array of `google_container_regional_cluster` monitoring_service

`networks`
: an array of `google_container_regional_cluster` network

`private_cluster_configs`
: an array of `google_container_regional_cluster` private_cluster_config

`cluster_ipv4_cidrs`
: an array of `google_container_regional_cluster` cluster_ipv4_cidr

`enable_tpus`
: an array of `google_container_regional_cluster` enable_tpu

`tpu_ipv4_cidr_blocks`
: an array of `google_container_regional_cluster` tpu_ipv4_cidr_block

`addons_configs`
: an array of `google_container_regional_cluster` addons_config

`subnetworks`
: an array of `google_container_regional_cluster` subnetwork

`locations`
: an array of `google_container_regional_cluster` locations

`resource_labels`
: an array of `google_container_regional_cluster` resource_labels

`label_fingerprints`
: an array of `google_container_regional_cluster` label_fingerprint

`legacy_abacs`
: an array of `google_container_regional_cluster` legacy_abac

`network_policies`
: an array of `google_container_regional_cluster` network_policy

`default_max_pods_constraints`
: an array of `google_container_regional_cluster` default_max_pods_constraint

`ip_allocation_policies`
: an array of `google_container_regional_cluster` ip_allocation_policy

`endpoints`
: an array of `google_container_regional_cluster` endpoint

`initial_cluster_versions`
: an array of `google_container_regional_cluster` initial_cluster_version

`current_master_versions`
: an array of `google_container_regional_cluster` current_master_version

`current_node_versions`
: an array of `google_container_regional_cluster` current_node_version

`create_times`
: an array of `google_container_regional_cluster` create_time

`statuses`
: an array of `google_container_regional_cluster` status

`status_messages`
: an array of `google_container_regional_cluster` status_message

`node_ipv4_cidr_sizes`
: an array of `google_container_regional_cluster` node_ipv4_cidr_size

`services_ipv4_cidrs`
: an array of `google_container_regional_cluster` services_ipv4_cidr

`current_node_counts`
: an array of `google_container_regional_cluster` current_node_count

`expire_times`
: an array of `google_container_regional_cluster` expire_time

`conditions`
: an array of `google_container_regional_cluster` conditions

`master_authorized_networks_configs`
: an array of `google_container_regional_cluster` master_authorized_networks_config

`locations`
: an array of `google_container_regional_cluster` location

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Kubernetes Engine API](https://console.cloud.google.com/apis/library/container.googleapis.com/) is enabled for the current project.
