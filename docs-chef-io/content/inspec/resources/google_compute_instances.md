+++
title = "google_compute_instances resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_instances"
    identifier = "inspec/resources/gcp/google_compute_instances.md google_compute_instances resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_instances` is used to test a Google Instance resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby

describe google_compute_instances(project: 'chef-gcp-inspec', zone: 'zone') do
  its('instance_names') { should include 'inspec-instance' }
end
```

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

## Properties

Properties that can be accessed from the `google_compute_instances` resource:

See the [google_compute_instance](/inspec/resources/google_compute_instance/#properties) resource for more information.

`can_ip_forwards`
: an array of `google_compute_instance` can_ip_forward

`cpu_platforms`
: an array of `google_compute_instance` cpu_platform

`creation_timestamps`
: an array of `google_compute_instance` creation_timestamp

`deletion_protections`
: an array of `google_compute_instance` deletion_protection

`disks`
: an array of `google_compute_instance` disks

`guest_accelerators`
: an array of `google_compute_instance` guest_accelerators

`hostnames`
: an array of `google_compute_instance` hostname

`instance_ids`
: an array of `google_compute_instance` id

`label_fingerprints`
: an array of `google_compute_instance` label_fingerprint

`labels`
: an array of `google_compute_instance` labels

`metadata`
: an array of `google_compute_instance` metadata

`machine_types`
: an array of `google_compute_instance` machine_type

`min_cpu_platforms`
: an array of `google_compute_instance` min_cpu_platform

`instance_names`
: an array of `google_compute_instance` name

`network_interfaces`
: an array of `google_compute_instance` network_interfaces

`schedulings`
: an array of `google_compute_instance` scheduling

`service_accounts`
: an array of `google_compute_instance` service_accounts

`shielded_instance_configs`
: an array of `google_compute_instance` shielded_instance_config

`statuses`
: an array of `google_compute_instance` status

`status_messages`
: an array of `google_compute_instance` status_message

`tags`
: an array of `google_compute_instance` tags

`zones`
: an array of `google_compute_instance` zone

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
