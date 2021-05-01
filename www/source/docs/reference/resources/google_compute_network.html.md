---
title: About the google_compute_network Resource
platform: gcp
---

# google\_compute\_network

Use the `google_compute_network` InSpec audit resource to test properties of a single GCP compute network.

<br>

## Syntax

A `google_compute_network` resource block declares the tests for a single GCP zone by project and name.

    describe google_compute_network(project: 'chef-inspec-gcp',  name: 'gcp-inspec-network') do
      it { should exist }
      its('name') { should eq 'gcp-inspec-network' }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

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

<br>

## Properties

*  `auto_create_subnetworks`, `creation_timestamp`, `creation_timestamp_date`, `id`, `kind`, `name`, `routing_config`, `subnetworks`

<br>


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the project where the resource is located.