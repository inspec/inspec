+++
title = "google_compute_network_endpoint_group resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_network_endpoint_group"
    identifier = "inspec/resources/gcp/google_compute_network_endpoint_group.md google_compute_network_endpoint_group resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_network_endpoint_group` is used to test a Google NetworkEndpointGroup resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby

describe google_compute_network_endpoint_group(project: 'chef-gcp-inspec', zone: 'zone', name: 'inspec-gcp-endpoint-group') do
  it { should exist }
  its('default_port') { should cmp '90' }
end

describe google_compute_network_endpoint_group(project: 'chef-gcp-inspec', zone: 'zone', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_network_endpoint_group` resource:

`id`
: The unique identifier for the resource.

`name`
: Name of the resource; provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

`description`
: An optional description of this resource. Provide this property when you create the resource.

`network_endpoint_type`
: Type of network endpoints in this network endpoint group.

  Possible values:
  - GCE_VM_IP_PORT

`size`
: Number of network endpoints in the network endpoint group.

`network`
: The network to which all network endpoints in the NEG belong. Uses "default" project network if unspecified.

`subnetwork`
: Optional subnetwork to which all network endpoints in the NEG belong.

`default_port`
: The default port used if the port number is not specified in the network endpoint.

`zone`
: Zone where the network endpoint group is located.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
