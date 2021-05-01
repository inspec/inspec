---
title: About the google_compute_forwarding_rule Resource
platform: gcp
---

# google\_compute\_forwarding_rule

Use the `google_compute_forwarding_rule` InSpec audit resource to test properties of a single GCP compute forwarding_rule.

<br>

## Syntax

A `google_compute_forwarding_rule` resource block declares the tests for a single GCP forwarding_rule by project, region and name.

    describe google_compute_forwarding_rule(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-forwarding_rule') do
      it { should exist }
      its('name') { should eq 'gcp-inspec-forwarding_rule' }
      its('region') { should match 'europe-west2' }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that a GCP compute forwarding_rule exists

    describe google_compute_forwarding_rule(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-forwarding_rule') do
      it { should exist }
    end

### Test when a GCP compute forwarding_rule was created

    describe google_compute_forwarding_rule(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-forwarding_rule') do
      its('creation_timestamp_date') { should be > Time.now - 365*60*60*24*10 }
    end

### Test for an expected forwarding_rule identifier 

    describe google_compute_forwarding_rule(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-forwarding_rule') do
      its('id') { should eq 12345567789 }
    end    

### Test that a forwarding_rule load_balancing_scheme is as expected

    describe google_compute_forwarding_rule(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-forwarding_rule') do
      its('load_balancing_scheme') { should eq "INTERNAL" }
    end  

### Test that a forwarding_rule IP address is as expected

    describe google_compute_forwarding_rule(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-forwarding_rule') do
      its('ip_address') { should eq "10.0.0.1" }
    end  

### Test that a forwarding_rule is associated with the expected network

    describe google_compute_forwarding_rule(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-forwarding_rule') do
      its('network') { should match "gcp_network_name" }
    end  

<br>

## Properties

*  `backend_service`, `creation_timestamp`, `description`, `id`, `ip_address`, `ip_protocol`, `ip_version`, `kind`, `load_balancing_scheme`, `name`, `network`, `port_range`, `ports`, `region`, `self_link`, `subnetwork`, `target`

<br>


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the project where the resource is located.
