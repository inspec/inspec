---
title: About the google_compute_region_instance_group_managers Resource
platform: gcp
---

# google\_compute\_region\_instance\_group\_managers

Use the `google_compute_region_instance_group_managerss` InSpec audit resource to test properties of all, or a filtered group of, GCP compute instance groups for a project in a particular region.

<br>

## Syntax

A `google_compute_region_instance_group_managers` resource block collects GCP instance groups by project and region, then tests that group.

    describe google_compute_region_instance_group_managers(project: 'chef-inspec-gcp') do
      it { should exist }
    end

Use this InSpec resource to enumerate IDs then test in-depth using `google_compute_instance_group`.

    google_compute_region_instance_group_managers(project: 'chef-inspec-gcp', region: 'europe-west2').instance_group_names.each do |instance_group_name|
      describe google_compute_instance_group(project: 'chef-inspec-gcp', region: 'europe-west2', instance_group: instance_group_name) do
        it { should exist }
      end
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that there are no more than a specified number of instance groups available for the project

    describe google_compute_region_instance_group_managers(project: 'chef-inspec-gcp', region: 'europe-west2') do
      its('count') { should be <= 100}
    end

### Test that an expected instance_group is available for the project

    describe google_compute_region_instance_group_managers(project: 'chef-inspec-gcp', region: 'europe-west2') do
      its('instance_group_names') { should include "my-instance-group-name" }
    end

### Test that a subset of all instance_groups matching "mig*" have size greater than zero

    google_compute_region_instance_group_managers(project: 'chef-inspec-gcp', region: 'europe-west2').where(instance_group_name: /^mig/).instance_group_names.each do |instance_group_name|
      describe google_compute_instance_group(project: 'chef-inspec-gcp', region: 'europe-west2', name: instance_group_name) do
        it { should exist }
        its('target_size') { should be > 0 }
      end
    end
    
<br>

## Filter Criteria

This resource supports the following filter criteria:  `instance_group_id` and `instance_group_name`. Any of these may be used with `where`, as a block or as a method.

## Properties

*  `instance_group_ids` - an array of google_compute_instance_group identifier integers
*  `instance_group_names` - an array of google_compute_instance_group name strings

<br>


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the project where the resource is located.
