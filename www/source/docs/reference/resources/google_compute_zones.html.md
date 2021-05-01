---
title: About the google_compute_zones Resource
platform: gcp
---

# google\_compute\_zones

Use the `google_compute_zones` InSpec audit resource to test properties of all, or a filtered group of, GCP compute zones for a project in a particular zone.

<br>

## Syntax

A `google_compute_zones` resource block collects GCP zones by project then tests that group.

    describe google_compute_zones(project: 'chef-inspec-gcp') do
      it { should exist }
    end

Use this InSpec resource to enumerate IDs then test in-depth using `google_compute_zone`.

    google_compute_zones(project: 'chef-inspec-gcp').zone_names.each do |zone_name|
      describe google_compute_zone(project: 'chef-inspec-gcp',  zone: zone_name) do
        it { should exist }
        its('kind') { should eq "compute#zone" }
        its('status') { should eq 'UP' }
      end
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that there are no more than a specified number of zones available for the project

    describe google_compute_zones(project: 'chef-inspec-gcp') do
      its('count') { should be <= 100}
    end

### Test the exact number of zones in the project

    describe google_compute_zones(project: 'chef-inspec-gcp') do
      its('zone_ids.count') { should cmp 9 }
    end

### Test that an expected zone is available for the project

    describe google_compute_zones(project: 'chef-inspec-gcp') do
      its('zone_names') { should include "us-east1-b" }
    end

### Test whether any zones are in status "DOWN"

    describe google_compute_zones(project: 'chef-inspec-gcp') do
      its('zone_statuses') { should_not include "DOWN" }
    end

### Test that a subset of all zones matching "us*" are "UP"

    google_compute_zones(project: 'chef-inspec-gcp').where(zone_name: /^us/).zone_names.each do |zone_name|
      describe google_compute_zone(project: 'chef-inspec-gcp',  zone: zone_name) do
        it { should exist }
        its('kind') { should eq "compute#zone" }
        its('status') { should eq 'UP' }
      end
    end
    
<br>

## Filter Criteria

This resource supports the following filter criteria:  `zone_id`; `zone_name` and `zone_status`. Any of these may be used with `where`, as a block or as a method.

## Properties

*  `zone_ids` - an array of google_compute_zone identifier integers
*  `zone_names` - an array of google_compute_zone name strings
*  `zone_statuses`- an array of google_compute_zone statuses

<br>


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the project where the resource is located.