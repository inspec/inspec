+++
title = "google_storage_buckets resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_storage_buckets"
    identifier = "inspec/resources/gcp/google_storage_buckets.md google_storage_buckets resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_storage_buckets` is used to test a Google Bucket resource

## Examples

```ruby
describe google_storage_buckets(project: 'chef-gcp-inspec') do
  its('bucket_names') { should include bucket-name }
end
```

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

## Properties

Properties that can be accessed from the `google_storage_buckets` resource:

See the [google_storage_bucket](/inspec/resources/google_storage_bucket/#properties) resource for more information.

`acls`
: an array of `google_storage_bucket` acl

`cors`
: an array of `google_storage_bucket` cors

`default_event_based_holds`
: an array of `google_storage_bucket` default_event_based_hold

`default_object_acls`
: an array of `google_storage_bucket` default_object_acl

`bucket_ids`
: an array of `google_storage_bucket` id

`lifecycles`
: an array of `google_storage_bucket` lifecycle

`bucket_locations`
: an array of `google_storage_bucket` location

`loggings`
: an array of `google_storage_bucket` logging

`metagenerations`
: an array of `google_storage_bucket` metageneration

`bucket_names`
: an array of `google_storage_bucket` name

`owners`
: an array of `google_storage_bucket` owner

`bucket_project_numbers`
: an array of `google_storage_bucket` project_number

`storage_classes`
: an array of `google_storage_bucket` storage_class

`time_createds`
: an array of `google_storage_bucket` time_created

`updateds`
: an array of `google_storage_bucket` updated

`versionings`
: an array of `google_storage_bucket` versioning

`websites`
: an array of `google_storage_bucket` website

`labels`
: an array of `google_storage_bucket` labels

`encryptions`
: an array of `google_storage_bucket` encryption

`retention_policies`
: an array of `google_storage_bucket` retention_policy

`projects`
: an array of `google_storage_bucket` project

`predefined_default_object_acls`
: an array of `google_storage_bucket` predefined_default_object_acl

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Google Cloud Storage](https://console.cloud.google.com/apis/library/storage-component.googleapis.com/) is enabled for the current project.
