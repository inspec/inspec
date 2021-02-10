+++
title = "google_compute_routes resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_routes"
    identifier = "inspec/resources/gcp/google_compute_routes.md google_compute_routes resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_routes` is used to test a Google Route resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_routes(project: 'chef-gcp-inspec') do
  its('count') { should be >= 1 }
  its('dest_ranges') { should include '15.0.0.0/24' }
  its('next_hop_ips') { should include '10.2.0.1' }
  its('priorities') { should include '100' }
end
```

## Properties

Properties that can be accessed from the `google_compute_routes` resource:

See the [google_compute_route](/inspec/resources/google_compute_route/#properties) resource for more information.

`dest_ranges`
: an array of `google_compute_route` dest_range

`descriptions`
: an array of `google_compute_route` description

`names`
: an array of `google_compute_route` name

`networks`
: an array of `google_compute_route` network

`priorities`
: an array of `google_compute_route` priority

`tags`
: an array of `google_compute_route` tags

`next_hop_gateways`
: an array of `google_compute_route` next_hop_gateway

`next_hop_instances`
: an array of `google_compute_route` next_hop_instance

`next_hop_ips`
: an array of `google_compute_route` next_hop_ip

`next_hop_vpn_tunnels`
: an array of `google_compute_route` next_hop_vpn_tunnel

`next_hop_networks`
: an array of `google_compute_route` next_hop_network

`next_hop_ilbs`
: an array of `google_compute_route` next_hop_ilb

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
