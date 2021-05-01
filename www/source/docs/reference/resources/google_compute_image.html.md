---
title: About the google_compute_image Resource
platform: gcp
---

# google\_compute\_image

Use the `google_compute_image` InSpec audit resource to test properties of a single GCP compute image.  This resource will attempt to retrieve a project custom image then image from a family before giving up.

<br>

## Syntax

A `google_compute_image` resource block declares the tests for a single GCP compute image by project and name.

    describe google_compute_image(project: 'chef-inspec-gcp', name: 'image-1') do
      it { should exist }
      its('name') { should eq 'image-1' }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that a GCP compute image is in a particular status e.g. "READY" means available for use

    describe google_compute_image(project: 'chef-inspec-gcp', location: 'europe-west2', name: 'compute-address') do
      its('status') { should eq "READY" }
    end

### Test that a GCP compute image has the expected family

    describe google_compute_image(project: 'chef-inspec-gcp', name: 'ubuntu') do
      its('family') { should match "ubuntu" }
    end

<br>

## Properties

*  `archive_size_bytes`, `creation_timestamp`, `description`, `disk_size_gb`, `family`, `guest_os_features`, `id`, `kind`, `label_fingerprint`, `licenses`, `name`, `raw_disk`, `source_type`, `status`

<br>


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the project where the resource is located.