---
title: About the google_compute_project_info Resource
platform: gcp
---

# google\_compute\_project\_info

Use the `google_compute_project_info` InSpec audit resource to test GCP compute project information.

<br>

## Syntax

A `google_compute_project_info` resource block declares the tests for GCP compute project information by project identifier.

    describe google_compute_project_info(project: 'chef-inspec-gcp') do
      its('name') { should match 'chef-inspec-gcp' }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that GCP compute project information exists

    describe google_compute_project_info(project: 'chef-inspec-gcp') do
      it { should exist }
    end

### Test that GCP compute project default service account is as expected

    describe google_compute_project_info(project: 'chef-inspec-gcp') do
      its('default_service_account') { should eq '12345-compute@developer.gserviceaccount.com' }
    end

<br>

## Properties

*  `common_instance_metadata`, `creation_timestamp`,  `creation_timestamp_date`, `default_service_account`, `id`, `kind`, `name`, `quotas`, `xpn_project_status`

<br>


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the project where the resource is located.