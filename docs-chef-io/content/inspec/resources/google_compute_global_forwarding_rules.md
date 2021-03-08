+++
title = "google_compute_global_forwarding_rules resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_global_forwarding_rules"
    identifier = "inspec/resources/gcp/google_compute_global_forwarding_rules.md google_compute_global_forwarding_rules resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_global_forwarding_rules` is used to test a Google GlobalForwardingRule resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_global_forwarding_rules(project: 'chef-gcp-inspec') do
  its('count') { should be >= 1 }
  its('port_ranges') { should include '80-80' }
end
```

## Properties

Properties that can be accessed from the `google_compute_global_forwarding_rules` resource:

See the [google_compute_global_forwarding_rule](/inspec/resources/google_compute_global_forwarding_rule/#properties) resource for more information.

`creation_timestamps`
: an array of `google_compute_global_forwarding_rule` creation_timestamp

`descriptions`
: an array of `google_compute_global_forwarding_rule` description

`ids`
: an array of `google_compute_global_forwarding_rule` id

`ip_addresses`
: an array of `google_compute_global_forwarding_rule` ip_address

`ip_protocols`
: an array of `google_compute_global_forwarding_rule` ip_protocol

`ip_versions`
: an array of `google_compute_global_forwarding_rule` ip_version

`labels`
: (Beta only) an array of `google_compute_global_forwarding_rule` labels

`label_fingerprints`
: (Beta only) an array of `google_compute_global_forwarding_rule` label_fingerprint

`load_balancing_schemes`
: an array of `google_compute_global_forwarding_rule` load_balancing_scheme

`metadata_filters`
: an array of `google_compute_global_forwarding_rule` metadata_filters

`names`
: an array of `google_compute_global_forwarding_rule` name

`networks`
: an array of `google_compute_global_forwarding_rule` network

`port_ranges`
: an array of `google_compute_global_forwarding_rule` port_range

`targets`
: an array of `google_compute_global_forwarding_rule` target

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
