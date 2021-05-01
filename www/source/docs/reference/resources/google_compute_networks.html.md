---
title: About the google_compute_networks Resource
platform: gcp
---

# google\_compute\_networks

Use the `google_compute_networks` InSpec audit resource to test properties of all, or a filtered group of, GCP compute networks for a project.

<br>

## Syntax

A `google_compute_networks` resource block collects GCP networks by project then tests that group.

    describe google_compute_networks(project: 'chef-inspec-gcp') do
      it { should exist }
    end

Use this InSpec resource to enumerate IDs then test in-depth using `google_compute_network`.

    google_compute_networks(project: 'chef-inspec-gcp').network_names.each do |network_name|
      describe google_compute_network(project: 'chef-inspec-gcp',  name: network_name) do
        its ('subnetworks.count') { should be < 10 }
        its ('creation_timestamp_date') { should be > Time.now - 365*60*60*24*10 }
        its ('routing_config.routing_mode') { should eq "REGIONAL" }
        its ('auto_create_subnetworks'){ should be false }
      end
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that there are no more than a specified number of networks available for the project

    describe google_compute_networks(project: 'chef-inspec-gcp') do
      its('count') { should be <= 100}
    end

### Test that an expected network identifier is present in the project 

    describe google_compute_networks(project: 'chef-inspec-gcp') do
      its('network_ids') { should include 12345678975432 }
    end

### Test that an expected network name is available for the project

    describe google_compute_networks(project: 'chef-inspec-gcp') do
      its('network_names') { should include "network-name" }
    end

    
<br>

## Filter Criteria

This resource supports the following filter criteria:  `network_id` and `network_name`. Any of these may be used with `where`, as a block or as a method.

## Properties

*  `network_ids` - an array of google_compute_network identifier integers
*  `network_names` - an array of google_compute_network name strings

<br>


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the project where the resource is located.