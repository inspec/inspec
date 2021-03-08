+++
title = "google_compute_forwarding_rules resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_forwarding_rules"
    identifier = "inspec/resources/gcp/google_compute_forwarding_rules.md google_compute_forwarding_rules resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_forwarding_rules` is used to test a Google ForwardingRule resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_forwarding_rules(project: 'chef-gcp-inspec', region: 'europe-west2') do
  its('forwarding_rule_names') { should include 'udp-forwarding-rule' }
end
```

### Test that there are no more than a specified number of forwarding_rules available for the project and region

    describe google_compute_forwarding_rules(project: 'chef-inspec-gcp', region: 'europe-west2') do
      its('count') { should be <= 100}
    end

### Test that an expected forwarding_rule identifier is present in the project and region

    describe google_compute_forwarding_rules(project: 'chef-inspec-gcp', region: 'europe-west2') do
      its('forwarding_rule_ids') { should include 12345678975432 }
    end

### Test that an expected forwarding_rule name is available for the project and region

    describe google_compute_forwarding_rules(project: 'chef-inspec-gcp', region: 'europe-west2') do
      its('forwarding_rule_names') { should include "forwarding_rule-name" }
    end

### Test that an expected forwarding_rule network name is not present for the project and region

    describe google_compute_forwarding_rules(project: 'chef-inspec-gcp', region: 'europe-west2') do
      its('forwarding_rule_networks') { should not include "network-name" }
    end

## Properties

Properties that can be accessed from the `google_compute_forwarding_rules` resource:

See the [google_compute_forwarding_rule](/inspec/resources/google_compute_forwarding_rule/#properties) resource for more information.

`creation_timestamps`
: an array of `google_compute_forwarding_rule` creation_timestamp

`is_mirroring_collectors`
: (Beta only) an array of `google_compute_forwarding_rule` is_mirroring_collector

`descriptions`
: an array of `google_compute_forwarding_rule` description

`forwarding_rule_ids`
: an array of `google_compute_forwarding_rule` id

`ip_addresses`
: an array of `google_compute_forwarding_rule` ip_address

`ip_protocols`
: an array of `google_compute_forwarding_rule` ip_protocol

`backend_services`
: an array of `google_compute_forwarding_rule` backend_service

`forwarding_rule_load_balancing_schemes`
: an array of `google_compute_forwarding_rule` load_balancing_scheme

`forwarding_rule_names`
: an array of `google_compute_forwarding_rule` name

`forwarding_rule_networks`
: an array of `google_compute_forwarding_rule` network

`port_ranges`
: an array of `google_compute_forwarding_rule` port_range

`ports`
: an array of `google_compute_forwarding_rule` ports

`subnetworks`
: an array of `google_compute_forwarding_rule` subnetwork

`targets`
: an array of `google_compute_forwarding_rule` target

`allow_global_accesses`
: an array of `google_compute_forwarding_rule` allow_global_access

`labels`
: (Beta only) an array of `google_compute_forwarding_rule` labels

`label_fingerprints`
: (Beta only) an array of `google_compute_forwarding_rule` label_fingerprint

`all_ports`
: an array of `google_compute_forwarding_rule` all_ports

`network_tiers`
: an array of `google_compute_forwarding_rule` network_tier

`service_labels`
: an array of `google_compute_forwarding_rule` service_label

`service_names`
: an array of `google_compute_forwarding_rule` service_name

`regions`
: an array of `google_compute_forwarding_rule` region

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
