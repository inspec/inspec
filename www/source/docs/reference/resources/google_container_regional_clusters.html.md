---
title: About the google_container_regional_clusters resource
platform: gcp
---

## Syntax
A `google_container_regional_clusters` is used to test a Google RegionalCluster resource

## Examples
```
describe google_container_regional_clusters(project: 'chef-gcp-inspec', location: 'europe-west2') do
  its('count') { should be >= 1 }
  its('names') { should include 'inspec-gcp-regional-cluster' }
  its('initial_node_counts') { should include '1'}
end
```

## Properties
Properties that can be accessed from the `google_container_regional_clusters` resource:

See [google_container_regional_cluster.md](google_container_regional_cluster.md) for more detailed information
  * `names`: an array of `google_container_regional_cluster` name
  * `descriptions`: an array of `google_container_regional_cluster` description
  * `initial_node_counts`: an array of `google_container_regional_cluster` initial_node_count
  * `node_configs`: an array of `google_container_regional_cluster` node_config
  * `master_auths`: an array of `google_container_regional_cluster` master_auth
  * `logging_services`: an array of `google_container_regional_cluster` logging_service
  * `monitoring_services`: an array of `google_container_regional_cluster` monitoring_service
  * `networks`: an array of `google_container_regional_cluster` network
  * `cluster_ipv4_cidrs`: an array of `google_container_regional_cluster` cluster_ipv4_cidr
  * `addons_configs`: an array of `google_container_regional_cluster` addons_config
  * `subnetworks`: an array of `google_container_regional_cluster` subnetwork
  * `endpoints`: an array of `google_container_regional_cluster` endpoint
  * `initial_cluster_versions`: an array of `google_container_regional_cluster` initial_cluster_version
  * `current_master_versions`: an array of `google_container_regional_cluster` current_master_version
  * `current_node_versions`: an array of `google_container_regional_cluster` current_node_version
  * `create_times`: an array of `google_container_regional_cluster` create_time
  * `node_ipv4_cidr_sizes`: an array of `google_container_regional_cluster` node_ipv4_cidr_size
  * `services_ipv4_cidrs`: an array of `google_container_regional_cluster` services_ipv4_cidr
  * `current_node_counts`: an array of `google_container_regional_cluster` current_node_count
  * `expire_times`: an array of `google_container_regional_cluster` expire_time
  * `locations`: an array of `google_container_regional_cluster` location

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.
