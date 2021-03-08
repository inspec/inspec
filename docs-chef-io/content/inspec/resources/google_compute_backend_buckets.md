+++
title = "google_compute_backend_buckets resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_backend_buckets"
    identifier = "inspec/resources/gcp/google_compute_backend_buckets.md google_compute_backend_buckets resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_backend_buckets` is used to test a Google BackendBucket resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_backend_buckets(project: 'chef-gcp-inspec', name: 'inspec-gcp-backend-bucket') do
  its('descriptions') { should include 'Backend bucket example' }
  its('bucket_names') { should include 'gcp-inspec-storage-bucket' }
end
```

## Properties

Properties that can be accessed from the `google_compute_backend_buckets` resource:

See the [google_compute_backend_bucket](/inspec/resources/google_compute_backend_bucket/#properties) resource for more information.

`bucket_names`
: an array of `google_compute_backend_bucket` bucket_name

`cdn_policies`
: an array of `google_compute_backend_bucket` cdn_policy

`creation_timestamps`
: an array of `google_compute_backend_bucket` creation_timestamp

`descriptions`
: an array of `google_compute_backend_bucket` description

`enable_cdns`
: an array of `google_compute_backend_bucket` enable_cdn

`ids`
: an array of `google_compute_backend_bucket` id

`names`
: an array of `google_compute_backend_bucket` name

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
