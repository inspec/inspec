---
title: About the google_container_node_pools Resource
platform: gcp
---

# google\_container\_node_pools

Use the `google_container_node_pools` InSpec audit resource to test properties of all, or a filtered group of, GCP container node_pools for a project, cluster and zone.

<br>

## Syntax

A `google_container_node_pools` resource block collects GCP node pools by project, cluster and zone then tests that group.

    describe google_container_node_pools(project: 'chef-inspec-gcp', zone: 'europe-west2-a', cluster_name: 'inspec-gcp-cluster') do
      it { should exist }
    end

Use this InSpec resource to enumerate IDs then test in-depth using `google_container_node_pool`.

    google_container_node_pools(project: 'chef-inspec-gcp', zone: 'europe-west2-a', cluster_name: 'inspec-gcp-cluster').node_pool_names.each do |node_pool_name|
      describe google_container_node_pool(project: 'chef-inspec-gcp', zone: 'europe-west2-a', cluster_name: 'inspec-gcp-cluster', nodepool_name: node_pool_name) do
        it { should exist }
        its('status') { should eq 'RUNNING' }
      end
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that there are no more than a specified number of node pools available for the project

    describe google_container_node_pools(project: 'chef-inspec-gcp') do
      its('count') { should be <= 10}
    end

### Test that an expected node pool is available for the project

    describe google_container_node_pools(project: 'chef-inspec-gcp') do
      its('node_pool_names') { should include "us-east1-b" }
    end

### Test that a subset of all node pools matching "mypool*" are "UP"

    google_container_node_pools(project: 'chef-inspec-gcp', zone: 'europe-west2-a', cluster_name: 'inspec-gcp-cluster').where(node_pool_name: /^mypool/).node_pool_names.each do |node_pool_name|
      describe google_container_node_pool(project: 'chef-inspec-gcp', zone: 'europe-west2-a', cluster_name: 'inspec-gcp-cluster', nodepool_name: node_pool_name) do
        it { should exist }
        its('status') { should eq 'RUNNING' }
      end
    end
    
<br>

## Filter Criteria

This resource supports the following filter criteria: `node_pool_name` and `node_pool_status`. Any of these may be used with `where`, as a block or as a method.

## Properties

*  `node_pool_names` - an array of google_container_node_pool name strings
*  `node_pool_statuses`- an array of google_container_node_pool status stringss

<br>


## GCP Permissions

Ensure the [Kubernetes Engine API](https://console.cloud.google.com/apis/library/container.googleapis.com) is enabled for the project where the resource is located.