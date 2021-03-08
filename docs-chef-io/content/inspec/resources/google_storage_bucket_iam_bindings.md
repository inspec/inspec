+++
title = "google_storage_bucket_iam_bindings resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_storage_bucket_iam_bindings"
    identifier = "inspec/resources/gcp/google_storage_bucket_iam_bindings.md google_storage_bucket_iam_bindings resource"
    parent = "inspec/resources/gcp"
+++

**This resource is deprecated. Please use `google_storage_bucket_iam_policy` instead**

Use the `google_storage_bucket_iam_bindings` InSpec audit resource to test properties of all, or a filtered group of, GCP storage bucket IAM bindings.

## Syntax

A `google_storage_bucket_iam_bindings` resource block collects GCP storage bucket IAM bindings then tests that group.

    describe google_storage_bucket_iam_bindings(bucket: 'bucket-buvsjjcndqz') do
      it { should exist }
    end

Use this InSpec resource to enumerate roles then test in-depth using `google_project_iam_binding`.

    google_storage_bucket_iam_bindings(bucket: 'bucket-buvsjjcndqz').iam_binding_roles.each do |iam_binding_role|
      describe google_storage_bucket_iam_binding(bucket: 'bucket-buvsjjcndqz',  role: iam_binding_role) do
        it { should exist }
        its('members') {should include 'user:someuser@domain.com' }
      end
    end

## Examples

The following examples show how to use this InSpec audit resource.

### Test that there are no more than a specified number of IAM bindings roles available for the bucket

    describe google_storage_bucket_iam_bindings(bucket: 'bucket-buvsjjcndqz') do
      its('count') { should be <= 100}
    end

### Test that an expected role is available for the bucket

    describe google_storage_bucket_iam_bindings(bucket: 'bucket-buvsjjcndqz') do
      its('iam_binding_roles') { should include "roles/storage.admin" }
    end

### Test that a particular role does not exist using filtering of the plural resource

    describe google_storage_bucket_iam_bindings(bucket: 'bucket-buvsjjcndqz').where(iam_binding_role: "roles/iam.securityReviewer") do
      it { should_not exist }
    end

## Filter Criteria

This resource supports the following filter criteria: `iam_binding_role`. This may be used with `where`, as a block or as a method.

## Properties

- `iam_binding_roles` - an array of google_storage_bucket_iam_binding role strings e.g. `["roles/storage.admin", "roles/owner"]`

## GCP Permissions

Ensure the [Google Cloud Storage API](https://console.cloud.google.com/apis/api/storage-component.googleapis.com/) is enabled.
