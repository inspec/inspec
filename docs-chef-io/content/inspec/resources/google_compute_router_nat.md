+++
title = "google_compute_router_nat resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_router_nat"
    identifier = "inspec/resources/gcp/google_compute_router_nat.md google_compute_router_nat resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_router_nat` is used to test a Google RouterNat resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_router_nat(project: 'chef-gcp-inspec', region: 'europe-west2', router: 'inspec-gcp-router', name: 'inspec-router-nat') do
  it { should exist }
  its('nat_ip_allocate_option') { should cmp 'AUTO_ONLY' }
  its('source_subnetwork_ip_ranges_to_nat') { should cmp 'ALL_SUBNETWORKS_ALL_IP_RANGES' }
  its('min_ports_per_vm') { should cmp '2' }
  its('log_config.enable') { should cmp 'true' }
  its('log_config.filter') { should cmp 'ERRORS_ONLY' }
end

describe google_compute_router(project: 'chef-gcp-inspec', region: 'europe-west2', router: 'nonexistent', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_router_nat` resource:

`name`
: Name of the NAT service. The name must be 1-63 characters long and comply with RFC1035.

`nat_ip_allocate_option`
: How external IPs should be allocated for this NAT. Valid values are `AUTO_ONLY` for only allowing NAT IPs allocated by Google Cloud Platform, or `MANUAL_ONLY` for only user-allocated NAT IP addresses.

  Possible values:

  - MANUAL_ONLY
  - AUTO_ONLY

`nat_ips`
: Self-links of NAT IPs. Only valid if natIpAllocateOption is set to MANUAL_ONLY.

`drain_nat_ips`
: A list of URLs of the IP resources to be drained. These IPs must be valid static external IPs that have been assigned to the NAT.

`source_subnetwork_ip_ranges_to_nat`
: How NAT should be configured per Subnetwork. If `ALL_SUBNETWORKS_ALL_IP_RANGES`, all of the IP ranges in every Subnetwork are allowed to Nat. If `ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES`, all of the primary IP ranges in every Subnetwork are allowed to Nat. `LIST_OF_SUBNETWORKS`: A list of Subnetworks are allowed to Nat (specified in the field subnetwork below). Note that if this field contains ALL_SUBNETWORKS_ALL_IP_RANGES or ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES, then there should not be any other RouterNat section in any Router for this network in this region.

  Possible values:

  - ALL_SUBNETWORKS_ALL_IP_RANGES
  - ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES
  - LIST_OF_SUBNETWORKS

`subnetwork`
: One or more subnetwork NAT configurations. Only used if `source_subnetwork_ip_ranges_to_nat` is set to `LIST_OF_SUBNETWORKS`

`name`
: Self-link of subnetwork to NAT

`source_ip_ranges_to_nat`
: List of options for which source IPs in the subnetwork should have NAT enabled.

  Supported values include:

  - `ALL_IP_RANGES`
  - `LIST_OF_SECONDARY_IP_RANGES`
  - `PRIMARY_IP_RANGE`

`secondary_ip_range_names`
: List of the secondary ranges of the subnetwork that are allowed to use NAT. This can be populated only if `LIST_OF_SECONDARY_IP_RANGES` is one of the values in sourceIpRangesToNat

`min_ports_per_vm`
: Minimum number of ports allocated to a VM from this NAT.

`udp_idle_timeout_sec`
: Timeout (in seconds) for UDP connections. Defaults to 30s if not set.

`icmp_idle_timeout_sec`
: Timeout (in seconds) for ICMP connections. Defaults to 30s if not set.

`tcp_established_idle_timeout_sec`
: Timeout (in seconds) for TCP established connections. Defaults to 1200s if not set.

`tcp_transitory_idle_timeout_sec`
: Timeout (in seconds) for TCP transitory connections. Defaults to 30s if not set.

`log_config`
: Configuration for logging on NAT

`enable`
: Indicates whether or not to export logs.

`filter`
: Specifies the desired filtering of logs on this NAT.

  Possible values:

  - ERRORS_ONLY
  - TRANSLATIONS_ONLY
  - ALL

`router`
: The name of the Cloud Router in which this NAT will be configured.

`region`
: Region where the router and NAT reside.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
