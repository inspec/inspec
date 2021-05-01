---
title: About the google_compute_firewalls Resource
platform: gcp
---

# google\_compute\_firewalls

Use the `google_compute_firewalls` InSpec audit resource to test properties of all, or a filtered group of, GCP compute firewalls for a project.

<br>

## Syntax

A `google_compute_firewalls` resource block collects GCP firewalls by project then tests that group.

    describe google_compute_firewalls(project: 'chef-inspec-gcp') do
      it { should exist }
    end

Use this InSpec resource to enumerate IDs then test in-depth using `google_compute_firewall`.

    google_compute_firewalls(project: 'chef-inspec-gcp').firewall_names.each do |firewall_name|
      describe google_compute_firewall(project: 'chef-inspec-gcp',  name: firewall_name) do
        it { should exist }
        its('kind') { should eq "compute#firewall" }
      end
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that there are no more than a specified number of firewalls available for the project

    describe google_compute_firewalls(project: 'chef-inspec-gcp') do
      its('count') { should be <= 100}
    end

### Test that an expected firewall is available for the project

    describe google_compute_firewalls(project: 'chef-inspec-gcp') do
      its('firewall_names') { should include "my-app-firewall-rule" }
    end

### Test that a particular named rule does not exist

    describe google_compute_firewalls(project: 'chef-inspec-gcp') do
      its('firewall_names') { should_not include "default-allow-ssh" }
    end

### Test there are no firewalls for the "INGRESS" direction

    describe google_compute_firewalls(project: 'chef-inspec-gcp').where(firewall_direction: 'INGRESS') do
      it { should_not exist }
    end

<br>

## Filter Criteria

This resource supports the following filter criteria:  `firewall_id`; `firewall_name`; and `firewall_direction`. Any of these may be used with `where`, as a block or as a method.

## Properties

*  `firewall_ids` - an array of google_compute_firewall identifier integers
*  `firewall_names` - an array of google_compute_firewall name strings
*  `firewall_directions`- an array of google_compute_firewall directions containing strings e.g. "INGRESS" or "EGRESS"

<br>


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the project where the resource is located.