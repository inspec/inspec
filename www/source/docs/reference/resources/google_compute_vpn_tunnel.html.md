---
title: About the google_compute_vpn_tunnel Resource
platform: gcp
---

# google\_compute\_vpn\_tunnel

Use the `google_compute_vpn_tunnel` InSpec audit resource to test properties of a single GCP compute vpn_tunnel.

<br>

## Syntax

A `google_compute_vpn_tunnel` resource block declares the tests for a single GCP vpn_tunnel by project, region and name.

    describe google_compute_vpn_tunnel(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-vpn-tunnel') do
      it { should exist }
      its('name') { should eq 'gcp-inspec-vpn-tunnel' }
      its('region') { should match 'europe-west2' }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

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

<br>

## Properties

* `creation_timestamp`, `description`, `detailed_status`, `id`, `ike_version`, `kind`, `local_traffic_selector`, `name`, `peer_ip`, `region`, `remote_traffic_selector`, `router`, `self_link`, `shared_secret`, `shared_secret_hash`, `status`, `target_vpn_gateway`

<br>


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the project where the resource is located.
