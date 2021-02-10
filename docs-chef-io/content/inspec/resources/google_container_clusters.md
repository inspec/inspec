+++
title = "google_container_clusters resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_container_clusters"
    identifier = "inspec/resources/gcp/google_container_clusters.md google_container_clusters resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_container_clusters` is used to test a Google Cluster resource.

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource.

## Examples

```ruby
describe google_container_clusters(project: 'chef-gcp-inspec', location: 'europe-west2-a') do
  its('cluster_names') { should include 'gcp-inspec-kube-cluster' }
end
```

### Test that there are no more than a specified number of clusters available for the project in a particular zone

    describe google_container_clusters(project: 'chef-inspec-gcp', location: 'europe-west2-a') do
      its('count') { should be <= 5}
    end

### Test that an expected cluster is available for the project

    describe google_container_clusters(project: 'chef-inspec-gcp', location: 'europe-west2-a') do
      its('cluster_names') { should include "my-cluster" }
    end

### Test whether any clusters are in status "STOPPING"

    describe google_container_clusters(project: 'chef-inspec-gcp', location: 'europe-west2-a') do
      its('cluster_statuses') { should_not include "STOPPING" }
    end

### Test that a subset of all clusters matching "kube\*" are "RUNNING"

    google_container_clusters(project: gcp_project_id).where(cluster_name: /^kube/).cluster_names.each do |cluster_name|
      describe google_container_cluster(project: 'chef-inspec-gcp', location: 'europe-west2-a', name: cluster_name) do
        it { should exist }
        its('status') { should eq 'RUNNING' }
      end
    end

## Properties

Properties that can be accessed from the `google_container_clusters` resource:

See the [google_container_cluster](/inspec/resources/google_container_cluster/#properties) resource for more information.

`cluster_names`
: an array of `google_container_cluster` name

`descriptions`
: an array of `google_container_cluster` description

`initial_node_counts`
: an array of `google_container_cluster` initial_node_count

`node_configs`
: an array of `google_container_cluster` node_config

`master_auths`
: an array of `google_container_cluster` master_auth

`logging_services`
: an array of `google_container_cluster` logging_service

`monitoring_services`
: an array of `google_container_cluster` monitoring_service

`cluster_networks`
: an array of `google_container_cluster` network

`private_cluster_configs`
: an array of `google_container_cluster` private_cluster_config

`cluster_ipv4_cidrs`
: an array of `google_container_cluster` cluster_ipv4_cidr

`enable_tpus`
: an array of `google_container_cluster` enable_tpu

`tpu_ipv4_cidr_blocks`
: an array of `google_container_cluster` tpu_ipv4_cidr_block

`addons_configs`
: an array of `google_container_cluster` addons_config

`subnetworks`
: an array of `google_container_cluster` subnetwork

`locations`
: an array of `google_container_cluster` locations

`resource_labels`
: an array of `google_container_cluster` resource_labels

`label_fingerprints`
: an array of `google_container_cluster` label_fingerprint

`legacy_abacs`
: an array of `google_container_cluster` legacy_abac

`network_policies`
: an array of `google_container_cluster` network_policy

`default_max_pods_constraints`
: an array of `google_container_cluster` default_max_pods_constraint

`ip_allocation_policies`
: an array of `google_container_cluster` ip_allocation_policy

`endpoints`
: an array of `google_container_cluster` endpoint

`initial_cluster_versions`
: an array of `google_container_cluster` initial_cluster_version

`current_master_versions`
: an array of `google_container_cluster` current_master_version

`current_node_versions`
: an array of `google_container_cluster` current_node_version

`create_times`
: an array of `google_container_cluster` create_time

`cluster_statuses`
: an array of `google_container_cluster` status

`status_messages`
: an array of `google_container_cluster` status_message

`node_ipv4_cidr_sizes`
: an array of `google_container_cluster` node_ipv4_cidr_size

`services_ipv4_cidrs`
: an array of `google_container_cluster` services_ipv4_cidr

`current_node_counts`
: an array of `google_container_cluster` current_node_count

`expire_times`
: an array of `google_container_cluster` expire_time

`conditions`
: an array of `google_container_cluster` conditions

`master_authorized_networks_configs`
: an array of `google_container_cluster` master_authorized_networks_config

`node_pools`
: an array of `google_container_cluster` node_pools

`pod_security_policy_configs`
: (Beta only) an array of `google_container_cluster` pod_security_policy_config

`binary_authorizations`
: an array of `google_container_cluster` binary_authorization

`locations`
: an array of `google_container_cluster` location

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Kubernetes Engine API](https://console.cloud.google.com/apis/library/container.googleapis.com/) is enabled for the current project.
