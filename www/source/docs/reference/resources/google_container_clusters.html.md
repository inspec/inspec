---
title: About the google_container_clusters Resource
platform: gcp
---

# google\_container\_clusters

Use the `google_container_clusters` InSpec audit resource to test properties of all, or a filtered group of, GCP container clusters for a project in a particular `google_compute_zone`.

<br>

## Syntax

A `google_container_clusters` resource block collects GCP clusters by project and zone, then tests that group.

    describe google_container_clusters(project: 'chef-inspec-gcp', zone: 'europe-west2-a') do
      it { should exist }
    end

Use this InSpec resource to enumerate IDs then test in-depth using `google_container_cluster`.

    google_container_clusters(project: 'chef-inspec-gcp', zone: 'europe-west2-a').cluster_names.each do |cluster_name|
      describe google_container_cluster(project: 'chef-inspec-gcp', zone: 'europe-west2-a', name: cluster_name) do
        it { should exist }
      end
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that there are no more than a specified number of clusters available for the project in a particular zone

    describe google_container_clusters(project: 'chef-inspec-gcp', zone: 'europe-west2-a') do
      its('count') { should be <= 5}
    end

### Test that an expected cluster is available for the project

    describe google_container_clusters(project: 'chef-inspec-gcp', zone: 'europe-west2-a') do
      its('cluster_names') { should include "my-cluster" }
    end

### Test whether any clusters are in status "STOPPING"

    describe google_container_clusters(project: 'chef-inspec-gcp', zone: 'europe-west2-a') do
      its('cluster_statuses') { should_not include "STOPPING" }
    end

### Test that a subset of all clusters matching "kube*" are "RUNNING"

    google_container_clusters(project: gcp_project_id).where(cluster_name: /^kube/).cluster_names.each do |cluster_name|
      describe google_container_cluster(project: 'chef-inspec-gcp', zone: 'europe-west2-a', name: cluster_name) do
        it { should exist }
        its('status') { should eq 'RUNNING' }
      end
    end
    
<br>

## Filter Criteria

This resource supports the following filter criteria: `cluster_name`, `cluster_subnetwork`, and `cluster_status`. Any of these may be used with `where`, as a block or as a method.

## Properties

*  `cluster_names` - an array of google_container_cluster name strings
*  `cluster_subnetworks` - an array of google_compute_subnetwork name strings
*  `cluster_statuses`- an array of google_container_cluster status strings

<br>


## GCP Permissions

Ensure the [Kubernetes Engine API](https://console.cloud.google.com/apis/library/container.googleapis.com) is enabled for the project where the resource is located.