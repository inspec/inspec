+++
title = "google_compute_networks resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_networks"
    identifier = "inspec/resources/gcp/google_compute_networks.md google_compute_networks resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_networks` is used to test a Google Network resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```
describe google_compute_networks(project: 'chef-gcp-inspec') do
	its('network_names') { should include 'inspec-network' }
end
```

### Test that there are no more than a specified number of networks available for the project

    describe google_compute_networks(project: 'chef-inspec-gcp') do
      its('count') { should be <= 100}
    end

### Test that an expected network identifier is present in the project

    describe google_compute_networks(project: 'chef-inspec-gcp') do
      its('network_ids') { should include 12345678975432 }
    end

### Test that an expected network name is available for the project

    describe google_compute_networks(project: 'chef-inspec-gcp') do
      its('network_names') { should include "network-name" }
    end

## Properties

Properties that can be accessed from the `google_compute_networks` resource:

See the [google_compute_network](/inspec/resources/google_compute_network/#properties) resource for more information.

`descriptions`
: an array of `google_compute_network` description

`gateway_ipv4s`
: an array of `google_compute_network` gateway_ipv4

`network_ids`
: an array of `google_compute_network` id

`network_names`
: an array of `google_compute_network` name

`subnetworks`
: an array of `google_compute_network` subnetworks

`auto_create_subnetworks`
: an array of `google_compute_network` auto_create_subnetworks

`creation_timestamps`
: an array of `google_compute_network` creation_timestamp

`routing_configs`
: an array of `google_compute_network` routing_config

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
