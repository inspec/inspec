+++
title = "google_compute_router_nats resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_router_nats"
    identifier = "inspec/resources/gcp/google_compute_router_nats.md google_compute_router_nats resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_router_nats` is used to test a Google RouterNat resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_router_nats(project: 'chef-gcp-inspec', region: 'europe-west2', router: 'inspec-gcp-router') do
  its('names') { should include 'inspec-router-nat' }
end
```

## Properties

Properties that can be accessed from the `google_compute_router_nats` resource:

See the [google_compute_router_nat](/inspec/resources/google_compute_router_nat/#properties) resource for more information.

`names`
: an array of `google_compute_router_nat` name

`nat_ip_allocate_options`
: an array of `google_compute_router_nat` nat_ip_allocate_option

`nat_ips`
: an array of `google_compute_router_nat` nat_ips

`drain_nat_ips`
: an array of `google_compute_router_nat` drain_nat_ips

`source_subnetwork_ip_ranges_to_nats`
: an array of `google_compute_router_nat` source_subnetwork_ip_ranges_to_nat

`subnetworks`
: an array of `google_compute_router_nat` subnetwork

`min_ports_per_vms`
: an array of `google_compute_router_nat` min_ports_per_vm

`udp_idle_timeout_secs`
: an array of `google_compute_router_nat` udp_idle_timeout_sec

`icmp_idle_timeout_secs`
: an array of `google_compute_router_nat` icmp_idle_timeout_sec

`tcp_established_idle_timeout_secs`
: an array of `google_compute_router_nat` tcp_established_idle_timeout_sec

`tcp_transitory_idle_timeout_secs`
: an array of `google_compute_router_nat` tcp_transitory_idle_timeout_sec

`log_configs`
: an array of `google_compute_router_nat` log_config

`routers`
: an array of `google_compute_router_nat` router

`regions`
: an array of `google_compute_router_nat` region

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
