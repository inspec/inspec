---
title: About the google_compute_instance_group_managers resource
platform: gcp
---

## Syntax
A `google_compute_instance_group_managers` is used to test a Google InstanceGroupManager resource

## Examples
```
describe google_compute_instance_group_managers(project: 'chef-gcp-inspec', zone: 'zone') do
  its('base_instance_names') { should include 'igm' }
end
```

## Properties
Properties that can be accessed from the `google_compute_instance_group_managers` resource:

See [google_compute_instance_group_manager.md](google_compute_instance_group_manager.md) for more detailed information
  * `base_instance_names`: an array of `google_compute_instance_group_manager` base_instance_name
  * `creation_timestamps`: an array of `google_compute_instance_group_manager` creation_timestamp
  * `current_actions`: an array of `google_compute_instance_group_manager` current_actions
  * `descriptions`: an array of `google_compute_instance_group_manager` description
  * `ids`: an array of `google_compute_instance_group_manager` id
  * `instance_groups`: an array of `google_compute_instance_group_manager` instance_group
  * `instance_templates`: an array of `google_compute_instance_group_manager` instance_template
  * `names`: an array of `google_compute_instance_group_manager` name
  * `named_ports`: an array of `google_compute_instance_group_manager` named_ports
  * `regions`: an array of `google_compute_instance_group_manager` region
  * `target_pools`: an array of `google_compute_instance_group_manager` target_pools
  * `target_sizes`: an array of `google_compute_instance_group_manager` target_size
  * `zones`: an array of `google_compute_instance_group_manager` zone

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.
