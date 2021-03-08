+++
title = "google_compute_vpn_tunnel resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_vpn_tunnel"
    identifier = "inspec/resources/gcp/google_compute_vpn_tunnel.md google_compute_vpn_tunnel resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_vpn_tunnel` is used to test a Google VpnTunnel resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_vpn_tunnel(project: 'chef-gcp-inspec', region: 'europe-west2', name: 'inspec-vpn-tunnel') do
  it { should exist }
  its('peer_ip') { should eq '15.0.0.120' }
end

describe google_compute_vpn_tunnel(project: 'chef-gcp-inspec', region: 'europe-west2', name: 'nonexistent') do
  it { should_not exist }
end
```

### Test that a GCP compute vpn_tunnel exists

    describe google_compute_vpn_tunnel(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-vpn-tunnel') do
      it { should exist }
    end

### Test when a GCP compute vpn_tunnel was created

    describe google_compute_vpn_tunnel(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-vpn-tunnel') do
      its('creation_timestamp_date') { should be > Time.now - 365*60*60*24*10 }
    end

### Test for an expected vpn_tunnel identifier

    describe google_compute_vpn_tunnel(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-vpn-tunnel') do
      its('id') { should eq 12345567789 }
    end

### Test that a vpn_tunnel peer address is as expected

    describe google_compute_vpn_tunnel(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-vpn-tunnel') do
      its('peer_ip') { should eq "123.123.123.123" }
    end

### Test that a vpn_tunnel status is as expected

    describe google_compute_vpn_tunnel(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-vpn_tunnel') do
      its('status') { should eq "ESTABLISHED" }
    end

## Properties

Properties that can be accessed from the `google_compute_vpn_tunnel` resource:

`id`
: The unique identifier for the resource. This identifier is defined by the server.

`creation_timestamp`
: Creation timestamp in RFC3339 text format.

`name`
: Name of the resource. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

`description`
: An optional description of this resource.

`target_vpn_gateway`
: URL of the Target VPN gateway with which this VPN tunnel is associated.

`vpn_gateway`
: (Beta only) URL of the VPN gateway with which this VPN tunnel is associated. This must be used if a High Availability VPN gateway resource is created.

`vpn_gateway_interface`
: (Beta only) The interface ID of the VPN gateway with which this VPN tunnel is associated.

`peer_external_gateway`
: (Beta only) URL of the peer side external VPN gateway to which this VPN tunnel is connected.

`peer_external_gateway_interface`
: (Beta only) The interface ID of the external VPN gateway to which this VPN tunnel is connected.

`peer_gcp_gateway`
: (Beta only) URL of the peer side HA GCP VPN gateway to which this VPN tunnel is connected. If provided, the VPN tunnel will automatically use the same vpn_gateway_interface ID in the peer GCP VPN gateway.

`router`
: URL of router resource to be used for dynamic routing.

`peer_ip`
: IP address of the peer VPN gateway. Only IPv4 is supported.

`shared_secret`
: Shared secret used to set the secure session between the Cloud VPN gateway and the peer VPN gateway.

`shared_secret_hash`
: Hash of the shared secret.

`ike_version`
: IKE protocol version to use when establishing the VPN tunnel with peer VPN gateway. Acceptable IKE versions are 1 or 2. Default version is 2.

`local_traffic_selector`
: Local traffic selector to use when establishing the VPN tunnel with peer VPN gateway. The value should be a CIDR formatted string, for example `192.168.0.0/16`. The ranges should be disjoint. Only IPv4 is supported.

`remote_traffic_selector`
: Remote traffic selector to use when establishing the VPN tunnel with peer VPN gateway. The value should be a CIDR formatted string, for example `192.168.0.0/16`. The ranges should be disjoint. Only IPv4 is supported.

`labels`
: (Beta only) Labels to apply to this VpnTunnel.

`label_fingerprint`
: (Beta only) The fingerprint used for optimistic locking of this resource. Used internally during updates.

`region`
: The region where the tunnel is located.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
