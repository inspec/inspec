+++
title = "google_compute_vpn_tunnels resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_vpn_tunnels"
    identifier = "inspec/resources/gcp/google_compute_vpn_tunnels.md google_compute_vpn_tunnels resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_vpn_tunnels` is used to test a Google VpnTunnel resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_vpn_tunnels(project: 'chef-gcp-inspec', region: 'europe-west2') do
	its('vpn_tunnel_names') { should include 'inspec-vpn-tunnel' }
  its('peer_ips') { should include '15.0.0.120' }
end
```

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

## Properties

Properties that can be accessed from the `google_compute_vpn_tunnels` resource:

See the [google_compute_vpn_tunnel](/inspec/resources/google_compute_vpn_tunnel/#properties) resource for more information.

`ids`
: an array of `google_compute_vpn_tunnel` id

`creation_timestamps`
: an array of `google_compute_vpn_tunnel` creation_timestamp

`vpn_tunnel_names`
: an array of `google_compute_vpn_tunnel` name

`descriptions`
: an array of `google_compute_vpn_tunnel` description

`target_vpn_gateways`
: an array of `google_compute_vpn_tunnel` target_vpn_gateway

`vpn_gateways`
: (Beta only) an array of `google_compute_vpn_tunnel` vpn_gateway

`vpn_gateway_interfaces`
: (Beta only) an array of `google_compute_vpn_tunnel` vpn_gateway_interface

`peer_external_gateways`
: (Beta only) an array of `google_compute_vpn_tunnel` peer_external_gateway

`peer_external_gateway_interfaces`
: (Beta only) an array of `google_compute_vpn_tunnel` peer_external_gateway_interface

`peer_gcp_gateways`
: (Beta only) an array of `google_compute_vpn_tunnel` peer_gcp_gateway

`routers`
: an array of `google_compute_vpn_tunnel` router

`peer_ips`
: an array of `google_compute_vpn_tunnel` peer_ip

`shared_secrets`
: an array of `google_compute_vpn_tunnel` shared_secret

`shared_secret_hashes`
: an array of `google_compute_vpn_tunnel` shared_secret_hash

`ike_versions`
: an array of `google_compute_vpn_tunnel` ike_version

`local_traffic_selectors`
: an array of `google_compute_vpn_tunnel` local_traffic_selector

`remote_traffic_selectors`
: an array of `google_compute_vpn_tunnel` remote_traffic_selector

`labels`
: (Beta only) an array of `google_compute_vpn_tunnel` labels

`label_fingerprints`
: (Beta only) an array of `google_compute_vpn_tunnel` label_fingerprint

`regions`
: an array of `google_compute_vpn_tunnel` region

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
