---
title: About the google_compute_vpn_tunnels Resource
platform: gcp
---

# google\_compute\_vpn\_tunnels

Use the `google_compute_vpn_tunnels` InSpec audit resource to test properties of all, or a filtered group of, GCP compute vpn_tunnels for a project and region.

<br>

## Syntax

A `google_compute_vpn_tunnels` resource block collects GCP vpn_tunnels by project and region, then tests that group.

    describe google_compute_vpn_tunnels(project: 'chef-inspec-gcp', region: 'europe-west2') do
      it { should exist }
    end

Use this InSpec resource to enumerate IDs then test in-depth using `google_compute_vpn_tunnel`.

    google_compute_vpn_tunnels(project: 'chef-inspec-gcp', region:'europe-west2').vpn_tunnel_names.each do |vpn_tunnel_name|
      describe google_compute_vpn_tunnel(project: 'chef-inspec-gcp', region: 'europe-west2', name: vpn_tunnel_name) do
        its('creation_timestamp_date') { should be > Time.now - 365*60*60*24*10 }
        its('target_vpn_gateway') { should match /gateway_name/ }
        its('remote_traffic_selector') { should include "0.0.0.0/0" }
        its('status') { should_not eq "ESTABLISHED" }
      end
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that there are no more than a specified number of vpn_tunnels available for the project and region

    describe google_compute_vpn_tunnels(project: 'chef-inspec-gcp', region: 'europe-west2') do
      its('count') { should be <= 100}
    end

### Test that an expected vpn_tunnel name is available for the project and region

    describe google_compute_vpn_tunnels(project: 'chef-inspec-gcp', region: 'europe-west2') do
      its('vpn_tunnel_names') { should include "vpn_tunnel-name" }
    end

### Test that an expected vpn_tunnel target_vpn_gateways name is not present for the project and region

    describe google_compute_vpn_tunnels(project: 'chef-inspec-gcp', region: 'europe-west2') do
      its('vpn_tunnel_target_vpn_gateways') { should not include "gateway-name" }
    end

    
<br>

## Filter Criteria

This resource supports the following filter criteria:  `vpn_tunnel_name` and `vpn_tunnel_target_vpn_gateway`. Any of these may be used with `where`, as a block or as a method.

## Properties

*  `vpn_tunnel_names` - an array of google_compute_vpn_tunnel name strings
*  `vpn_tunnel_target_vpn_gateway` - an array of google_compute_target_vpn_gateway name strings

<br>


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the project where the resource is located.
