---
title: About the google_storage_bucket_iam_binding Resource
platform: gcp
---

# google\_storage\_bucket\_iam\_binding

Use the `google_storage_bucket_iam_binding` InSpec audit resource to test properties of a single GCP storage bucket IAM binding.

<br>

## Syntax

A `google_storage_bucket_iam_binding` resource block declares the tests for a single GCP storage bucket IAM binding by bucket name and role.

    describe google_storage_bucket_iam_binding(bucket: 'bucket-buvsjjcndqz',  role: 'roles/storage.objectViewer') do
      it { should exist }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that a GCP storage bucket IAM binding exists

    describe google_storage_bucket_iam_binding(bucket: 'bucket-buvsjjcndqz',  role: 'roles/storage.admin') do
      it { should exist }
    end

### Test that a GCP storage bucket IAM binding role has the desired user or service account included

    describe google_storage_bucket_iam_binding(bucket: 'bucket-buvsjjcndqz',  role: 'roles/storage.admin') do
      its('members') {should include 'user:someuser@domain.com' }
      its('members') {should include 'serviceAccount:someserviceaccount@domain.com' }
    end

<br>

## Properties

*  `members`

<br>


## GCP Permissions

Ensure the [Google Cloud Storage API](https://console.cloud.google.com/apis/api/storage-component.googleapis.com/) is enabled.