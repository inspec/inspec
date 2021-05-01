---
title: About the google_compute_regions Resource
platform: gcp
---

# google\_compute\_regions

Use the `google_compute_regions` InSpec audit resource to test properties of all, or a filtered group of, GCP compute regions for a project.

<br>

## Syntax

A `google_compute_regions` resource block collects GCP regions by project then tests that group.

    describe google_compute_regions(project: 'chef-inspec-gcp') do
      it { should exist }
    end

Use this InSpec resource to enumerate IDs then test in-depth using `google_compute_region`.

    google_compute_regions(project: 'chef-inspec-gcp').region_names.each do |region_name|
      describe google_compute_region(project: 'chef-inspec-gcp',  region: region_name) do
        it { should be_up }
      end
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that there are more than a specified number of regions available for the project

    describe google_compute_regions(project: 'chef-inspec-gcp') do
      its('count') { should be >= 10}
    end

### Test that an expected region is available for the project

    describe google_compute_regions(project: 'chef-inspec-gcp') do
      its('region_names') { should include 'europe-west2' }
    end

### Test whether any regions are in status "DOWN"

    describe google_compute_regions(project: 'chef-inspec-gcp') do
      its('region_statuses') { should_not include "DOWN" }
    end

### Test that a subset of all regions matching "europe*" are "UP"

    describe google_compute_regions(project: gcp_project_id).where(region_name: /^europe/).region_names.each do |region_name|
      describe google_compute_region(project: 'chef-inspec-gcp',  region: region_name) do
        it { should be_up }
      end
    end
    
<br>

## Filter Criteria

This resource supports the following filter criteria:  `region_id`; `region_name` and `region_status`. Any of these may be used with `where`, as a block or as a method.

## Properties

*  `region_ids` - an array of google_compute_region identifier integers
*  `region_names` - an array of google_compute_region name strings
*  `region_statuses`- an array of google_compute_region statuses

<br>


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the project.