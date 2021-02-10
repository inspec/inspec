+++
title = "google_compute_target_pools resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_target_pools"
    identifier = "inspec/resources/gcp/google_compute_target_pools.md google_compute_target_pools resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_target_pools` is used to test a Google TargetPool resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_target_pools(project: 'chef-gcp-inspec', region: 'europe-west2') do
  its('names') { should include 'inspec-gcp-target-pool' }
  its('session_affinities') { should include 'CLIENT_IP' }
end
```

## Properties

Properties that can be accessed from the `google_compute_target_pools` resource:

See the [google_compute_target_pool](/inspec/resources/google_compute_target_pool/#properties) resource for more information.

`backup_pools`
: an array of `google_compute_target_pool` backup_pool

`creation_timestamps`
: an array of `google_compute_target_pool` creation_timestamp

`descriptions`
: an array of `google_compute_target_pool` description

`failover_ratios`
: an array of `google_compute_target_pool` failover_ratio

`health_checks`
: an array of `google_compute_target_pool` health_check

`ids`
: an array of `google_compute_target_pool` id

`instances`
: an array of `google_compute_target_pool` instances

`names`
: an array of `google_compute_target_pool` name

`session_affinities`
: an array of `google_compute_target_pool` session_affinity

`regions`
: an array of `google_compute_target_pool` region

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
