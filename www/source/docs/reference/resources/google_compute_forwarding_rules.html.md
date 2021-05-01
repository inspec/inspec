---
title: About the google_compute_forwarding_rules Resource
platform: gcp
---

# google\_compute\_forwarding_rules

Use the `google_compute_forwarding_rules` InSpec audit resource to test properties of all, or a filtered group of, GCP compute forwarding_rules for a project and region.

<br>

## Syntax

A `google_compute_forwarding_rules` resource block collects GCP forwarding_rules by project and region, then tests that group.

    describe google_compute_forwarding_rules(project: 'chef-inspec-gcp', region: 'europe-west2') do
      it { should exist }
    end

Use this InSpec resource to enumerate IDs then test in-depth using `google_compute_forwarding_rule`.

    google_compute_forwarding_rules(project: 'chef-inspec-gcp', region:'europe-west2').forwarding_rule_names.each do |forwarding_rule_name|
      describe google_compute_forwarding_rule(project: 'chef-inspec-gcp', region: 'europe-west2', name: forwarding_rule_name) do
        its('creation_timestamp_date') { should be > Time.now - 365*60*60*24*10 }
        its('network') { should match "gcp_network_name" }
        its('load_balancing_scheme') { should match "INTERNAL" }
      end
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that there are no more than a specified number of forwarding_rules available for the project and region

    describe google_compute_forwarding_rules(project: 'chef-inspec-gcp', region: 'europe-west2') do
      its('count') { should be <= 100}
    end

### Test that an expected forwarding_rule identifier is present in the project and region

    describe google_compute_forwarding_rules(project: 'chef-inspec-gcp', region: 'europe-west2') do
      its('forwarding_rule_ids') { should include 12345678975432 }
    end


### Test that an expected forwarding_rule name is available for the project and region

    describe google_compute_forwarding_rules(project: 'chef-inspec-gcp', region: 'europe-west2') do
      its('forwarding_rule_names') { should include "forwarding_rule-name" }
    end

### Test that an expected forwarding_rule network name is not present for the project and region

    describe google_compute_forwarding_rules(project: 'chef-inspec-gcp', region: 'europe-west2') do
      its('forwarding_rule_networks') { should not include "network-name" }
    end

    
<br>

## Filter Criteria

This resource supports the following filter criteria:  `forwarding_rule_id`; `forwarding_rule_name`; `forwarding_rule_load_balancing_scheme`  and `forwarding_rule_network`. Any of these may be used with `where`, as a block or as a method.

## Properties

*  `forwarding_rule_ids` - an array of google_compute_forwarding_rule identifier integers
*  `forwarding_rule_names` - an array of google_compute_forwarding_rule name strings
*  `forwarding_rule_networks` - an array of google_compute_network name strings
*  `forwarding_rule_load_balancing_schemes` - an array of load_balancing_scheme strings

<br>


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the project where the resource is located.
