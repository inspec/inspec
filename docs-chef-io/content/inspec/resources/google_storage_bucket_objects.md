+++
title = "google_storage_bucket_objects resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_storage_bucket_objects"
    identifier = "inspec/resources/gcp/google_storage_bucket_objects.md google_storage_bucket_objects resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_storage_bucket_objects` is used to test a Google BucketObject resource

## Examples

```ruby
describe google_storage_bucket_objects(bucket: 'bucket-with-object') do
	its('object_names') { should include 'image1' }
	its('count') { should be <= 10 }
end
```

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

## Properties

Properties that can be accessed from the `google_storage_bucket_objects` resource:

See the [google_storage_bucket_object](/inspec/resources/google_storage_bucket_object/#properties) resource for more information.

`object_buckets`
: an array of `google_storage_bucket_object` bucket

`objects`
: an array of `google_storage_bucket_object` object

`content_types`
: an array of `google_storage_bucket_object` content_type

`crc32cs`
: an array of `google_storage_bucket_object` crc32c

`etags`
: an array of `google_storage_bucket_object` etag

`generations`
: an array of `google_storage_bucket_object` generation

`ids`
: an array of `google_storage_bucket_object` id

`md5_hashes`
: an array of `google_storage_bucket_object` md5_hash

`media_links`
: an array of `google_storage_bucket_object` media_link

`metagenerations`
: an array of `google_storage_bucket_object` metageneration

`object_names`
: an array of `google_storage_bucket_object` name

`sizes`
: an array of `google_storage_bucket_object` size

`storage_classes`
: an array of `google_storage_bucket_object` storage_class

`object_created_times`
: an array of `google_storage_bucket_object` time_created

`time_deleteds`
: an array of `google_storage_bucket_object` time_deleted

`time_storage_class_updateds`
: an array of `google_storage_bucket_object` time_storage_class_updated

`time_updateds`
: an array of `google_storage_bucket_object` time_updated

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Google Cloud Storage](https://console.cloud.google.com/apis/library/storage-component.googleapis.com/) is enabled for the current project.
