---
title: About the google_storage_bucket_acl Resource
platform: gcp
---

# google\_storage\_bucket\_acl

Use the `google_storage_bucket_acl` InSpec audit resource to test properties of a single GCP storage bucket ACL.  The 'entity' property below is as described in the [Google documentation here](https://cloud.google.com/storage/docs/json_api/v1/bucketAccessControls).

<br>

## Syntax

A `google_storage_bucket_acl` resource block declares the tests for a single GCP storage bucket ACL by bucket name and entity.

    describe google_storage_bucket_acl(bucket: 'bucket-buvsjjcndqz',  entity: 'user-object-viewer@spaterson-project.iam.gserviceaccount.com') do
      it { should exist }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that a GCP storage bucket ACL exists

     describe google_storage_bucket_acl(bucket: 'bucket-buvsjjcndqz',  entity: 'user-object-viewer@spaterson-project.iam.gserviceaccount.com') do
      it { should exist }
    end

### Test that a GCP storage bucket ACL has the expected role (READER, WRITER or OWNER)

    describe google_storage_bucket_acl(bucket: 'bucket-buvsjjcndqz',  entity: 'user-object-viewer@spaterson-project.iam.gserviceaccount.com') do
      its('role') { should eq 'OWNER' }
    end

<br>

## Properties

*  `bucket`, `email`, `entity`, `etag`, `id`, `kind`, `role`

<br>


## GCP Permissions

Ensure the [Google Cloud Storage API](https://console.cloud.google.com/apis/api/storage-component.googleapis.com/) is enabled.