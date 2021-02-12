+++
title = "google_compute_router resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_router"
    identifier = "inspec/resources/gcp/google_compute_router.md google_compute_router resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_router` is used to test a Google Router resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_router(project: 'chef-gcp-inspec', region: 'europe-west2', name: 'inspec-gcp-router') do
  it { should exist }
  its('bgp.asn') { should eq '64514' }
  its('bgp.advertise_mode') { should eq 'CUSTOM' }
  its('bgp.advertised_groups') { should include 'ALL_SUBNETS' }
  its('bgp.advertised_ip_ranges.count') { should eq 2 }
  its('bgp.advertised_ip_ranges.first.range') { should eq '1.2.3.4' }
  its('bgp.advertised_ip_ranges.last.range') { should eq '1.2.3.4' }
    its('network') { should match /\/gcp-inspec-network$/ }
  end

describe google_compute_router(project: 'chef-gcp-inspec', region: 'europe-west2', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_router` resource:

`id`
: The unique identifier for the resource.

`creation_timestamp`
: Creation timestamp in RFC3339 text format.

`name`
: Name of the resource. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

`description`
: An optional description of this resource.

`network`
: A reference to the network to which this router belongs.

`bgp`
: BGP information specific to this router.

  `asn`
  : Local BGP Autonomous System Number (ASN). Must be an RFC6996 private ASN, either 16-bit or 32-bit. The value will be fixed for this router resource. All VPN tunnels that link to this router will have the same local ASN.

  `advertise_mode`
  : User-specified flag to indicate which mode to use for advertisement.

    Possible values:
    - DEFAULT
    - CUSTOM

  `advertised_groups`
  : User-specified list of prefix groups to advertise in custom mode. This field can only be populated if advertiseMode is CUSTOM and is advertised to all peers of the router. These groups will be advertised in addition to any specified prefixes. Leave this field blank to advertise no custom groups.  This enum field has the one valid value: ALL_SUBNETS

  `advertised_ip_ranges`
  : User-specified list of individual IP ranges to advertise in custom mode. This field can only be populated if advertiseMode is CUSTOM and is advertised to all peers of the router. These IP ranges will be advertised in addition to any specified groups. Leave this field blank to advertise no custom IP ranges.

    `range`
    : The IP range to advertise. The value must be a CIDR-formatted string.

    `description`
    : User-specified description for the IP range.

`region`
: Region where the router resides.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
