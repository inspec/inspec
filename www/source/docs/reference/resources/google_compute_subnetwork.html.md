---
title: About the google_compute_subnetwork Resource
platform: gcp
---

# google\_compute\_subnetwork

Use the `google_compute_subnetwork` InSpec audit resource to test properties of a single GCP compute subnetwork.

<br>

## Syntax

A `google_compute_subnetwork` resource block declares the tests for a single GCP subnetwork by project, region and name.

    describe google_compute_subnetwork(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-subnetwork') do
      it { should exist }
      its('name') { should eq 'gcp-inspec-subnetwork' }
      its('region') { should match 'europe-west2' }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that a GCP compute subnetwork exists

    describe google_compute_subnetwork(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-subnetwork') do
      it { should exist }
    end

### Test when a GCP compute subnetwork was created

    describe google_compute_subnetwork(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-subnetwork') do
      its('creation_timestamp_date') { should be > Time.now - 365*60*60*24*10 }
    end

### Test for an expected subnetwork identifier 

    describe google_compute_subnetwork(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-subnetwork') do
      its('id') { should eq 12345567789 }
    end    

### Test that a subnetwork gateway address is as expected

    describe google_compute_subnetwork(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-subnetwork') do
      its('gateway_address') { should eq "10.2.0.1" }
    end  

### Test that a subnetwork IP CIDR range is as expected

    describe google_compute_subnetwork(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-subnetwork') do
      its('ip_cidr_range') { should eq "10.2.0.0/29" }
    end  

### Test that a subnetwork is associated with the expected network

    describe google_compute_subnetwork(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-subnetwork') do
      its('network') { should match "gcp_network_name" }
    end  

### Test whether VMs in this subnet can access Google services without assigning external IP addresses through Private Google Access

    describe google_compute_subnetwork(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-subnetwork') do
      its('private_ip_google_access') { should be false }
    end

<br>

## Properties

*  `creation_timestamp`, `creation_timestamp_date`, `gateway_address`, `id`, `ip_cidr_range`, `kind`, `name`, `network`, `private_ip_google_access`, `region`

<br>


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the project where the resource is located.