+++
title = "google_compute_route resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_route"
    identifier = "inspec/resources/gcp/google_compute_route.md google_compute_route resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_route` is used to test a Google Route resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_route(project: 'chef-gcp-inspec', name: 'inspec-gcp-route') do
  it { should exist }
  its('dest_range') { should eq '15.0.0.0/24' }
  its('network') { should match /\/gcp-inspec-network$/ }
  its('next_hop_ip') { should eq '10.2.0.1' }
  its('priority') { should eq '100' }
end

describe google_compute_route(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_route` resource:

`dest_range`
: The destination range of outgoing packets that this route applies to. Only IPv4 is supported.

`description`
: An optional description of this resource. Provide this property when you create the resource.

`name`
: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

`network`
: The network that this route applies to.

`priority`
: The priority of this route. Priority is used to break ties in cases where there is more than one matching route of equal prefix length. In the case of two routes with equal prefix length, the one with the lowest-numbered priority value wins. Default value is 1000. Valid range is 0 through 65535.

`tags`
: A list of instance tags to which this route applies.

`next_hop_gateway`
: URL to a gateway that should handle matching packets. Currently, you can only specify the internet gateway, using a full or partial valid URL: _ https://www.googleapis.com/compute/v1/projects/project/ global/gateways/default-internet-gateway _ projects/project/global/gateways/default-internet-gateway \* global/gateways/default-internet-gateway

`next_hop_instance`
: URL to an instance that should handle matching packets. You can specify this as a full or partial URL. For example: _ https://www.googleapis.com/compute/v1/projects/project/zones/zone/ instances/instance _ projects/project/zones/zone/instances/instance \* zones/zone/instances/instance

`next_hop_ip`
: Network IP address of an instance that should handle matching packets.

`next_hop_vpn_tunnel`
: URL to a VpnTunnel that should handle matching packets.

`next_hop_network`
: URL to a Network that should handle matching packets.

`next_hop_ilb`
: The URL to a forwarding rule of type loadBalancingScheme=INTERNAL that should handle matching packets. You can only specify the forwarding rule as a partial or full URL. For example, the following are all valid URLs: https://www.googleapis.com/compute/v1/projects/project/regions/region/forwardingRules/forwardingRule regions/region/forwardingRules/forwardingRule Note that this can only be used when the destinationRange is a public (non-RFC 1918) IP CIDR range.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
