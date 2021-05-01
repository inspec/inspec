---
title: About the google_compute_instances Resource
platform: gcp
---

# google\_compute\_instances

Use the `google_compute_instances` InSpec audit resource to test properties of all, or a filtered group of, GCP compute instances for a project in a particular zone.

<br>

## Syntax

A `google_compute_instances` resource block collects GCP instances by project and zone then tests that group.

    describe google_compute_instances(project: 'chef-inspec-gcp',  zone: 'europe-west2-a') do
      it { should exist }
    end

Use this InSpec resource to enumerate IDs then test in-depth using `google_compute_instance`.

    google_compute_instances(project: 'chef-inspec-gcp',  zone: 'europe-west2-a').instance_names.each do |instance_name|
      describe google_compute_instance(project: 'chef-inspec-gcp',  zone: 'europe-west2-a', name: instance_name) do
        it { should exist }
        its('zone') { should match gcp_zone }
        its('kind') { should eq "compute#instance" }
        its('status') { should eq 'RUNNING' }
        its('tag_count'){ should be >= 1 }
      end
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that there are no more than a specified number of instances in the project and zone

    describe google_compute_instances(project: 'chef-inspec-gcp',  zone: 'europe-west2-a') do
      its('count') { should be <= 100}
    end

### Test the exact number of instances in the project and zone

    describe google_compute_instances(project: 'chef-inspec-gcp',  zone: 'europe-west2-a') do
      its('instance_ids.count') { should cmp 9 }
    end

### Test that an instance with a particular name exists in the project and zone

    describe google_compute_instances(project: 'chef-inspec-gcp',  zone: 'europe-west2-a') do
      its('instance_names') { should include "my-favourite-instance" }
    end

<br>

## Filter Criteria

This resource supports the following filter criteria:  `instance_id` and `instance_name`. Either of these may be used with `where`, as a block or as a method.

## Properties

*  `instance_ids` - an array of google_compute_instance identifier integers
*  `instance_names` - an array of google_compute_instance name strings

<br>


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the project where the resource is located.