---
title: About the google_compute_region_instance_group_manager Resource
platform: gcp
---

# google\_compute\_region\_instance\_group\_manager

Use the `google_compute_region_instance_group_manager` InSpec audit resource to test properties of a single multi-zone GCP compute instance group.

<br>

## Syntax

A `google_compute_region_instance_group_manager` resource block declares the tests for a single GCP compute instance group by project, region and name.

    describe google_compute_region_instance_group_manager(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-test') do
      it { should exist }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that a GCP compute region instance group manager has the expected size

    describe google_compute_region_instance_group_manager(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-test') do
      its('target_size') { should eq 2 }
    end

### Test that a GCP compute region instance group manager has a port with supplied name and value

    describe google_compute_region_instance_group_manager(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-test') do
      its('named_ports') { should include "http" }
    end

<br>

## Properties

* `base_instance_name`, `creation_timestamp`, `current_actions`, `description`, `fingerprint`, `id`, `instance_group`, `instance_template`, `kind`, `name`, `named_ports`, `region`, `self_link`, `target_pools`, `target_size`, `region`

<br>


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the project where the resource is located.
