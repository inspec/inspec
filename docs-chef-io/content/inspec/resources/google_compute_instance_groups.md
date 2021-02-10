+++
title = "google_compute_instance_groups resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_instance_groups"
    identifier = "inspec/resources/gcp/google_compute_instance_groups.md google_compute_instance_groups resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_instance_groups` is used to test a Google InstanceGroup resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby

describe google_compute_instance_groups(project: 'chef-gcp-inspec', zone: 'zone') do
  its('instance_group_names') { should include 'inspec-instance-group' }
end
```

### Test that there are no more than a specified number of instance groups available for the project

    describe google_compute_instance_groups(project: 'chef-inspec-gcp') do
      its('count') { should be <= 100}
    end

### Test that an expected instance_group is available for the project

    describe google_compute_instance_groups(project: 'chef-inspec-gcp', zone: 'europe-west2-a') do
      its('instance_group_names') { should include "my-instance-group-name" }
    end

### Test that a subset of all instance_groups matching "mig\*" have size greater than zero

    google_compute_instance_groups(project: 'chef-inspec-gcp', zone: 'europe-west2-a').where(instance_group_name: /^mig/).instance_group_names.each do |instance_group_name|
      describe google_compute_instance_group(project: 'chef-inspec-gcp', zone: 'europe-west2-a', name: instance_group_name) do
        it { should exist }
        its('size') { should be > 0 }
      end
    end

## Properties

Properties that can be accessed from the `google_compute_instance_groups` resource:

See the [google_compute_instance_group](/inspec/resources/google_compute_instance_group/#properties) resource for more information.

`creation_timestamps`
: an array of `google_compute_instance_group` creation_timestamp

`descriptions`
: an array of `google_compute_instance_group` description

`instance_group_ids`
: an array of `google_compute_instance_group` id

`instance_group_names`
: an array of `google_compute_instance_group` name

`named_ports`
: an array of `google_compute_instance_group` named_ports

`networks`
: an array of `google_compute_instance_group` network

`regions`
: an array of `google_compute_instance_group` region

`subnetworks`
: an array of `google_compute_instance_group` subnetwork

`zones`
: an array of `google_compute_instance_group` zone

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
