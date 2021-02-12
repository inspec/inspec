+++
title = "google_compute_network resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_network"
    identifier = "inspec/resources/gcp/google_compute_network.md google_compute_network resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_network` is used to test a Google Network resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_network(project: 'chef-gcp-inspec', name: 'inspec-network') do
  it { should exist }
  its('routing_config.routing_mode') { should cmp 'REGIONAL' }
end

describe google_compute_network(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

### Test that a GCP compute network exists

    describe google_compute_network(project: 'chef-inspec-gcp',  name: 'gcp-inspec-network') do
      it { should exist }
    end

### Test when a GCP compute network was created

    describe google_compute_network(project: 'chef-inspec-gcp',  name: 'gcp-inspec-network') do
      its('creation_timestamp_date') { should be > Time.now - 365*60*60*24*10 }
    end

### Test for an expected network identifier

    describe google_compute_network(project: 'chef-inspec-gcp',  name: 'gcp-inspec-network') do
      its('id') { should eq 12345567789 }
    end

### Test whether a single attached subnetwork name is correct

    describe google_compute_network(project: 'chef-inspec-gcp',  name: 'gcp-inspec-network') do
      its ('subnetworks.count') { should eq 1 }
      its ('subnetworks.first') { should match "subnetwork-name"}
    end

### Test whether the network is configured to automatically create subnetworks or not

    describe google_compute_network(project: 'chef-inspec-gcp',  name: 'gcp-inspec-network') do
      its ('auto_create_subnetworks'){ should be false }
    end

### Check the network routing configuration routing mode

    describe google_compute_network(project: 'chef-inspec-gcp',  name: 'gcp-inspec-network') do
      its ('routing_config.routing_mode') { should eq "REGIONAL" }
    end

## Properties

Properties that can be accessed from the `google_compute_network` resource:

`description`
: An optional description of this resource. The resource must be recreated to modify this field.

`gateway_ipv4`
: The gateway address for default routing out of the network. This value is selected by GCP.

`id`
: The unique identifier for the resource.

`name`
: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

`subnetworks`
: Server-defined fully-qualified URLs for all subnetworks in this network.

`auto_create_subnetworks`
: When set to `true`, the network is created in "auto subnet mode" and it will create a subnet for each region automatically across the `10.128.0.0/9` address range. When set to `false`, the network is created in "custom subnet mode" so the user can explicitly connect subnetwork resources.

`creation_timestamp`
: Creation timestamp in RFC3339 text format.

`routing_config`
: The network-level routing configuration for this network. Used by Cloud Router to determine what type of network-wide routing behavior to enforce.

  `routing_mode`
  : The network-wide routing mode to use. If set to `REGIONAL`, this network's cloud routers will only advertise routes with subnetworks of this network in the same region as the router. If set to `GLOBAL`, this network's cloud routers will advertise routes with all subnetworks of this network, across regions.

    Possible values:
    - REGIONAL
    - GLOBAL

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
