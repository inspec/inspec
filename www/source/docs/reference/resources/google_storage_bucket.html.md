---
title: About the google_storage_bucket Resource
platform: gcp
---

# google\_storage\_bucket

Use the `google_storage_bucket` InSpec audit resource to test properties of a GCP storage bucket.

<br>s

## Syntax

A `google_storage_bucket` resource block declares the tests for a single GCP storage bucket by name.

    describe google_storage_bucket(name: 'chef-inspec-gcp-storage-bucket-abcd') do
      it { should exist }
      its('name') { should eq 'chef-inspec-gcp-storage-bucket-abcd'  }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that a GCP storage bucket is in the expected location

    describe google_storage_bucket(name: 'chef-inspec-gcp-storage-bucket-abcd') do
      its('location') { should eq "EUROPE-WEST2" }
    end

### Test that a GCP storage bucket has the expected project number

    describe google_storage_bucket(name: 'chef-inspec-gcp-storage-bucket-abcd') do
      its('project_number') {should eq 12345678 }
    end

### Test that a GCP storage bucket has the expected storage class

    describe google_storage_bucket(name: 'chef-inspec-gcp-storage-bucket-abcd') do
      its('storage_class') { should eq 'STANDARD' }
    end

<br>

## Properties

*  `etag`, `id`, `kind`, `location`, `metageneration`, `name`, `project_number`, `storage_class`, `time_created`, `updated`

<br>


## GCP Permissions

Ensure the [Google Cloud Storage API](https://console.cloud.google.com/apis/api/storage-component.googleapis.com/) is enabled.