+++
title = "google_compute_region_instance_group_managers resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_region_instance_group_managers"
    identifier = "inspec/resources/gcp/google_compute_region_instance_group_managers.md google_compute_region_instance_group_managers resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_region_instance_group_managers` is used to test a Google RegionInstanceGroupManager resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```
describe google_compute_region_instance_group_managers(project: 'chef-gcp-inspec', region: 'europe-west2') do
	its('instance_group_manager_names') { should include 'inspec-rigm' }
  its('base_instance_names') { should include 'rigm1' }
end
```

### Test that there are no more than a specified number of instance groups available for the project

    describe google_compute_region_instance_group_managers(project: 'chef-inspec-gcp', region: 'europe-west2') do
      its('count') { should be <= 100}
    end

### Test that an expected instance_group is available for the project

    describe google_compute_region_instance_group_managers(project: 'chef-inspec-gcp', region: 'europe-west2') do
      its('instance_group_names') { should include "my-instance-group-name" }
    end

### Test that a subset of all instance_groups matching "mig\*" have size greater than zero

    google_compute_region_instance_group_managers(project: 'chef-inspec-gcp', region: 'europe-west2').where(instance_group_name: /^mig/).instance_group_names.each do |instance_group_name|
      describe google_compute_instance_group(project: 'chef-inspec-gcp', region: 'europe-west2', name: instance_group_name) do
        it { should exist }
        its('target_size') { should be > 0 }
      end
    end

## Properties

Properties that can be accessed from the `google_compute_region_instance_group_managers` resource:

See the [google_compute_region_instance_group_manager](/inspec/resources/google_compute_region_instance_group_manager/#properties) resource for more information.

`base_instance_names`
: an array of `google_compute_region_instance_group_manager` base_instance_name

`creation_timestamps`
: an array of `google_compute_region_instance_group_manager` creation_timestamp

`current_actions`
: an array of `google_compute_region_instance_group_manager` current_actions

`descriptions`
: an array of `google_compute_region_instance_group_manager` description

`instance_group_manager_ids`
: an array of `google_compute_region_instance_group_manager` id

`instance_groups`
: an array of `google_compute_region_instance_group_manager` instance_group

`instance_templates`
: an array of `google_compute_region_instance_group_manager` instance_template

`instance_group_manager_names`
: an array of `google_compute_region_instance_group_manager` name

`named_ports`
: an array of `google_compute_region_instance_group_manager` named_ports

`target_pools`
: an array of `google_compute_region_instance_group_manager` target_pools

`target_sizes`
: an array of `google_compute_region_instance_group_manager` target_size

`auto_healing_policies`
: an array of `google_compute_region_instance_group_manager` auto_healing_policies

`regions`
: an array of `google_compute_region_instance_group_manager` region

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
