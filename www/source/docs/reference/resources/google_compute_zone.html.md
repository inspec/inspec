---
title: About the google_compute_zone Resource
platform: gcp
---

# google\_compute\_zone

Use the `google_compute_zone` InSpec audit resource to test properties of a single GCP compute zone.

<br>

## Syntax

A `google_compute_zone` resource block declares the tests for a single GCP zone by project and name.

    describe google_compute_zone(project: 'chef-inspec-gcp',  zone: 'us-east1-b') do
      its('name') { should match 'us-east1-b' }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that a GCP compute zone exists

    describe google_compute_zone(project: 'chef-inspec-gcp',  zone: 'us-east1-b') do
      it { should exist }
    end

### Test that a GCP compute zone is in the expected state

    describe google_compute_zone(project: 'chef-inspec-gcp',  zone: 'us-east1-b') do
      its('status') { should eq 'UP' }
      # or equivalently
      it { should be_up }
    end

### Test that a GCP compute zone has an expected CPU platform

    describe google_compute_zone(project: 'chef-inspec-gcp',  zone: 'us-east1-b') do
      its('available_cpu_platforms') { should include "Intel Skylake" }
    end

<br>

## Properties

*  `available_cpu_platforms`, `creation_timestamp`, `description`, `id`, `kind`, `name`, `region`, `status`, `region_name`

<br>


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the project where the resource is located.