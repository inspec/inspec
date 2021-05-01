---
title: About the google_storage_bucket_objects Resource
platform: gcp
---

# google\_storage\_bucket\_objects

Use the `google_storage_bucket_objects` InSpec audit resource to test properties of a GCP storage bucket objects.

<br>

## Syntax

A `google_storage_bucket_objects` resource block collects GCP bucket objects by project then tests that group.

    describe google_storage_bucket_objects(bucket: 'bucket-name') do
      it { should exist }
    end

Use this InSpec resource to enumerate IDs then test in-depth using `google_storage_bucket_object`.

    google_storage_bucket_objects(bucket: 'bucket-name').object_names.each do |object_name|
      describe google_storage_bucket_object(bucket: bucket_name, object: object_name) do
        it { should exist }
      end
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that there are no more than a specified number of storage buckets for the project

    describe google_storage_bucket_objects(bucket: 'bucket-name') do
      its('count') { should be <= 100 }
    end


### Test that an expected named bucket is available

    describe google_storage_bucket_objects(bucket: 'bucket-name') do
      its('object_buckets'){ should include 'my_expected_bucket' }
    end

### Test that an expected named bucket is available

    describe google_storage_bucket_objects(bucket: 'bucket-name') do
      its('object_names'){ should include 'my_expected_object' }
    end
        
### Test a filtered group of bucket objects created within the last 24hrs

    describe google_storage_bucket_objects(bucket: 'bucket-name').where(object_created_time > Time.now - 60*60*24) do
      it { should exist }
    end
<br>

## Filter Criteria

This resource supports the following filter criteria:  `object_bucket`; `object_name` and `object_created_time`. Any of these may be used with `where`, as a block or as a method.

## Properties

*  `object_buckets` - an array of google_storage_bucket identifier strings
*  `object_names` - an array of google_storage_bucket_object name strings
*  `object_created_times` - an array of time created Time objects

<br


## GCP Permissions

Ensure the [Google Cloud Storage API](https://console.cloud.google.com/apis/api/storage-component.googleapis.com/) is enabled.