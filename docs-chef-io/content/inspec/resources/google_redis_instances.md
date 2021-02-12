+++
title = "google_redis_instances resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_redis_instances"
    identifier = "inspec/resources/gcp/google_redis_instances.md google_redis_instances resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_redis_instances` is used to test a Google Instance resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_redis_instances(project: 'chef-gcp-inspec', region: 'us-central1') do
  its('tiers') { should include 'STANDARD_HA' }
  its('memory_size_gbs') { should include '1' }
  its('alternative_location_ids') { should include 'us-central1-f' }
  its('redis_versions') { should include 'REDIS_3_2' }
  its('display_names') { should include 'InSpec test instance' }
  its('reserved_ip_ranges') { should include '192.168.0.0/29' }
end
```

## Properties

Properties that can be accessed from the `google_redis_instances` resource:

See the [google_redis_instance](/inspec/resources/google_redis_instance/#properties) resource for more information.

`alternative_location_ids`
: an array of `google_redis_instance` alternative_location_id

`authorized_networks`
: an array of `google_redis_instance` authorized_network

`connect_modes`
: an array of `google_redis_instance` connect_mode

`create_times`
: an array of `google_redis_instance` create_time

`current_location_ids`
: an array of `google_redis_instance` current_location_id

`display_names`
: an array of `google_redis_instance` display_name

`hosts`
: an array of `google_redis_instance` host

`labels`
: an array of `google_redis_instance` labels

`redis_configs`
: an array of `google_redis_instance` redis_configs

`location_ids`
: an array of `google_redis_instance` location_id

`names`
: an array of `google_redis_instance` name

`memory_size_gbs`
: an array of `google_redis_instance` memory_size_gb

`ports`
: an array of `google_redis_instance` port

`redis_versions`
: an array of `google_redis_instance` redis_version

`reserved_ip_ranges`
: an array of `google_redis_instance` reserved_ip_range

`tiers`
: an array of `google_redis_instance` tier

`regions`
: an array of `google_redis_instance` region

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
