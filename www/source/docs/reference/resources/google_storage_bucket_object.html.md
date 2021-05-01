---
title: About the google_storage_bucket_object Resource
platform: gcp
---

# google\_storage\_bucket\_object

Use the `google_storage_bucket_object` InSpec audit resource to test properties of a single GCP storage bucket object.

<br>

## Syntax

A `google_storage_bucket_object` resource block declares the tests for a single GCP storage bucket object by bucket name and object name:

    describe google_storage_bucket_object(bucket: 'bucket-buvsjjcndqz',  object: 'bucket-object-pmxbiikq') do
      it { should exist }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that a GCP compute zone exists

    describe google_storage_bucket_object(bucket: 'bucket-buvsjjcndqz',  object: 'bucket-object-pmxbiikq') do
      it { should exist }
    end

### Test that a GCP storage bucket object has non-zero size

    describe google_storage_bucket_object(bucket: 'bucket-buvsjjcndqz',  object: 'bucket-object-pmxbiikq') do
      its('size') { should be > 0 }
    end

### Test that a GCP storage bucket object has the expected content type

    describe google_storage_bucket_object(bucket: 'bucket-buvsjjcndqz',  object: 'bucket-object-pmxbiikq') do
      its('content_type') { should eq "text/plain; charset=utf-8" }
    end


### Test that a GCP storage bucket object was created within a certain time period

    describe google_storage_bucket_object(bucket: 'bucket-buvsjjcndqz',  object: 'bucket-object-pmxbiikq') do
      its('time_created_date') { should be > Time.now - 365*60*60*24*10 }
    end
    
    
### Test that a GCP storage bucket object was last updated within a certain time period

    describe google_storage_bucket_object(bucket: 'bucket-buvsjjcndqz',  object: 'bucket-object-pmxbiikq') do
      its('updated_date') { should be > Time.now - 365*60*60*24*10 }
    end
        

<br>

## Properties

*  `bucket`, `content_type`, `crc32c`, `etag`, `generation`, `id`, `kind`, `md5_hash`, `media_link`, `metageneration`, `name`, `size`, `storage_class`, `time_created_date`, `time_storage_class_updated_date`, `updated_date`

<br>


## GCP Permissions

Ensure the [Google Cloud Storage API](https://console.cloud.google.com/apis/api/storage-component.googleapis.com/) is enabled.