---
title: About the google_storage_buckets Resource
platform: gcp
---

# google\_storage\_bucket

Use the `google_storage_buckets` InSpec audit resource to test properties of a GCP storage buckets.

<br>

## Syntax

A `google_storage_buckets` resource block collects GCP buckets by project then tests that group.

    describe google_storage_buckets(project: 'chef-inspec-gcp') do
      it { should exist }
    end

Use this InSpec resource to enumerate IDs then test in-depth using `google_storage_bucket`.

    google_storage_buckets(project: 'chef-inspec-gcp').bucket_names.each do |bucket_name|
      describe google_storage_bucket(name: bucket_name) do
        it { should exist }
        its('storage_class') { should eq 'STANDARD' }
      end
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that there are no more than a specified number of storage buckets for the project

    describe google_storage_buckets(project: 'chef-inspec-gcp') do
      its('count') { should be <= 100}
    end


### Test that an expected named bucket is available

    describe google_storage_buckets do
      its('bucket_names'){ should include "my_expected_bucket" }
    end
    
### Test that all buckets belong to the expected project number

    google_storage_buckets(project: 'chef-inspec-gcp').bucket_names.each do |bucket_name|
      describe google_storage_bucket(name: bucket_name) do
        it { should exist }
        its('project_number'){ should eq 1122334455 }
      end
    end

<br>

## Filter Criteria

This resource supports the following filter criteria:  `bucket_id`; `bucket_name`; `bucket_project_number` and `bucket_location`. Any of these may be used with `where`, as a block or as a method.

## Properties

*  `bucket_ids` - an array of google_storage_bucket identifier strings
*  `bucket_names` - an array of google_storage_bucket name strings
*  `bucket_project_numbers`- an array of google_storage_bucket identifier integers
*  `bucket_locations`- an array of google_storage_bucket location strings

<br


## GCP Permissions

Ensure the [Google Cloud Storage API](https://console.cloud.google.com/apis/api/storage-component.googleapis.com/) is enabled.