---
title: About the google_compute_subnetworks Resource
platform: gcp
---

# google\_compute\_subnetworks

Use the `google_compute_subnetworks` InSpec audit resource to test properties of all, or a filtered group of, GCP compute subnetworks for a project and region.

<br>

## Syntax

A `google_compute_subnetworks` resource block collects GCP subnetworks by project and region, then tests that group.

    describe google_compute_subnetworks(project: 'chef-inspec-gcp', region: 'europe-west2') do
      it { should exist }
    end

Use this InSpec resource to enumerate IDs then test in-depth using `google_compute_subnetwork`.

    google_compute_subnetworks(project: 'chef-inspec-gcp', region:'europe-west2').subnetwork_names.each do |subnetwork_name|
      describe google_compute_subnetwork(project: 'chef-inspec-gcp', region: 'europe-west2', name: name: subnetwork_name) do
        its('creation_timestamp_date') { should be > Time.now - 365*60*60*24*10 }
        its('ip_cidr_range') { should eq "10.2.0.0/29" }
        its('network') { should match "gcp_network_name" }
        its('private_ip_google_access') { should be false }
      end
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that there are no more than a specified number of subnetworks available for the project and region

    describe google_compute_subnetworks(project: 'chef-inspec-gcp', region: 'europe-west2') do
      its('count') { should be <= 100}
    end

### Test that an expected subnetwork identifier is present in the project and region

    describe google_compute_subnetworks(project: 'chef-inspec-gcp', region: 'europe-west2') do
      its('subnetwork_ids') { should include 12345678975432 }
    end


### Test that an expected subnetwork name is available for the project and region

    describe google_compute_subnetworks(project: 'chef-inspec-gcp', region: 'europe-west2') do
      its('subnetwork_names') { should include "subnetwork-name" }
    end

### Test that an expected subnetwork network name is not present for the project and region

    describe google_compute_subnetworks(project: 'chef-inspec-gcp', region: 'europe-west2') do
      its('subnetwork_networks') { should not include "network-name" }
    end

    
<br>

## Filter Criteria

This resource supports the following filter criteria:  `subnetwork_id`; `subnetwork_name`; `enable_flow_logs`  and `subnetwork_network`. Any of these may be used with `where`, as a block or as a method.

## Properties

*  `subnetwork_ids` - an array of google_compute_subnetwork identifier integers
*  `subnetwork_names` - an array of google_compute_subnetwork name strings
*  `subnetwork_networks` - an array of google_compute_network name strings
*  `enable_flow_logs` - an array of enable_flow_log booleans

<br>


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the project where the resource is located.