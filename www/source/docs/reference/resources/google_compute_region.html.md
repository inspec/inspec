---
title: About the google_compute_region Resource
platform: gcp
---

# google\_compute\_region

Use the `google_compute_region` InSpec audit resource to test properties of a single GCP compute region.

<br>

## Syntax

A `google_compute_region` resource block declares the tests for a single GCP region by project and name.

    describe google_compute_region(project: 'chef-inspec-gcp',  region: 'us-east1') do
      its('name') { should match 'us-east1' }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that a GCP compute region exists

    describe google_compute_region(project: 'chef-inspec-gcp',  region: 'europe-west2') do
      it { should exist }
    end

### Test that a GCP compute region is in the expected state

    describe google_compute_region(project: 'chef-inspec-gcp',  region: 'europe-west2') do
      its('status') { should eq 'UP' }
      # or equivalently
      it { should be_up }
    end

### Test a GCP compute region identifier

    describe google_compute_region(project: 'chef-inspec-gcp',  region: "asia-east1") do
      its('id') { should eq 1220 }
    end

### Check that a region is associated with the expected zone fully qualified name 

    describe google_compute_region(project: 'chef-inspec-gcp',  region: "asia-east1") do
      its('zones') { should include "https://www.googleapis.com/compute/v1/projects/spaterson-project/zones/asia-east1-a" }
    end
    
### Check that a region is associated with the expected zone short name

    describe google_compute_region(project: 'chef-inspec-gcp',  region: "asia-east1") do
      its('zone_names') { should include "asia-east1-a" }
    end    

The `zone_names` property is also useful for subsequently looping over associated `google_compute_zone` resources.  For example:

    google_compute_region(project: 'chef-inspec-gcp',  region: "asia-east1").zone_names.each do |zone_name|
      describe google_compute_zone(project: 'chef-inspec-gcp', name: zone_name) do
        it { should be_up }
      end
    end  

<br>

## Properties

*  `creation_timestamp`, `description`, `id`, `kind`, `name`, `quotas`, `status`, `zones`, `zone_names`

<br>


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the project where the resource is located.