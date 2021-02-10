+++
title = "google_storage_bucket_object resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_storage_bucket_object"
    identifier = "inspec/resources/gcp/google_storage_bucket_object.md google_storage_bucket_object resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_storage_bucket_object` is used to test a Google BucketObject resource

## Examples

```
describe google_storage_bucket_object(bucket: 'bucket-with-object', object: 'image1') do
  it { should exist }
  its('size.to_i') { should be > 0 }

  its('time_created') { should be > Time.now - 60*60*24*10 }
  its('time_updated') { should be > Time.now - 60*60*24*10 }
end

describe google_storage_bucket_object(bucket: 'bucket-with-object', object: "nonexistent") do
  it { should_not exist }
end
```

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
      its('time_updated') { should be > Time.now - 365*60*60*24*10 }
    end

## Properties

Properties that can be accessed from the `google_storage_bucket_object` resource:

`bucket`
: The name of the bucket.

`object`
: The name of the object.

`content_type`
: The Content-Type of the object data. See https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types/Complete_list_of_MIME_types for more information on possible Content-Types

`crc32c`
: CRC32c checksum.

`etag`
: The object entity tag.

`generation`
: The content generation of this object. Used for object versioning.

`id`
: The ID of the object, including the bucket name, object name, and generation number.

`md5_hash`
: MD5 hash of the data; encoded using base64.

`media_link`
: Media download link.

`metageneration`
: The version of the metadata for this object at this generation. Used for preconditions and for detecting changes in metadata. A metageneration number is only meaningful in the context of a particular generation of a particular object.

`name`
: The name of the object.

`size`
: Content-Length of the data in bytes.

`storage_class`
: Storage class of the object.

`time_created`
: The time this object was created.

`time_deleted`
: The time this object was deleted. Returned if and only if this version of the object is no longer a live version, but remains in the bucket as a noncurrent version.

`time_storage_class_updated`
: The time at which the object's storage class was last changed.

`time_updated`
: The modification time of the object metadata.

## GCP Permissions

Ensure the [Google Cloud Storage](https://console.cloud.google.com/apis/library/storage-component.googleapis.com/) is enabled for the current project.
