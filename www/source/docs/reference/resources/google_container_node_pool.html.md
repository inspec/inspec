---
title: About the google_container_node_pool Resource
platform: gcp
---

# google\_container\_node\_pool

Use the `google_container_node_pool` InSpec audit resource to test properties of a single GCP container node pool.

<br>

## Syntax

A `google_container_node_pool` resource block declares the tests for a single GCP container node pool by project, zone, cluster name and nodepool name.

    describe google_container_node_pool(project: 'chef-inspec-gcp', zone: 'europe-west2-a', cluster_name: 'inspec-gcp-kube-cluster', nodepool_name: 'inspec-gcp-kube-node-pool') do
      it { should exist }
      its('name') { should eq 'inspec-gcp-kube-node-pool' }
      its('zone') { should match 'europe-west2-a' }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that a GCP container node pool is in a particular state e.g. "RUNNING"

    describe google_container_node_pool(project: 'chef-inspec-gcp', zone: 'europe-west2-a', cluster_name: 'inspec-gcp-kube-cluster', nodepool_name: 'inspec-gcp-kube-node-pool') do
      its('status') { should eq 'RUNNING' }
    end

### Test GCP container node pool disk size in GB is as expected

    describe google_container_node_pool(project: 'chef-inspec-gcp', zone: 'europe-west2-a', cluster_name: 'inspec-gcp-kube-cluster', nodepool_name: 'inspec-gcp-kube-node-pool') do
      its('node_config.disk_size_gb'){should eq 100}
    end

### Test GCP container node pool machine type is as expected

    describe google_container_node_pool(project: 'chef-inspec-gcp', zone: 'europe-west2-a', cluster_name: 'inspec-gcp-kube-cluster', nodepool_name: 'inspec-gcp-kube-node-pool') do
      its('node_config.machine_type'){should eq "n1-standard-1"}
    end

### Test GCP container node pool node image type is as expected

    describe google_container_node_pool(project: 'chef-inspec-gcp', zone: 'europe-west2-a', cluster_name: 'inspec-gcp-kube-cluster', nodepool_name: 'inspec-gcp-kube-node-pool') do
      its('node_config.image_type'){should eq "COS"}
    end

### Test GCP container node pool initial node count is as expected

    describe google_container_node_pool(project: 'chef-inspec-gcp', zone: 'europe-west2-a', cluster_name: 'inspec-gcp-kube-cluster', nodepool_name: 'inspec-gcp-kube-node-pool') do
      its('initial_node_count'){should eq 3}
    end

<br>

## Properties

*  `config`, `initial_node_count`, `instance_group_urls`, `management`, `name`, `status`, `version`

<br>


## GCP Permissions

Ensure the [Kubernetes Engine API](https://console.cloud.google.com/apis/library/container.googleapis.com) is enabled for the project where the resource is located.