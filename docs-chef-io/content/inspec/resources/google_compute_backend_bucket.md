+++
title = "google_compute_backend_bucket resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_backend_bucket"
    identifier = "inspec/resources/gcp/google_compute_backend_bucket.md google_compute_backend_bucket resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_backend_bucket` is used to test a Google BackendBucket resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_backend_bucket(project: 'chef-gcp-inspec', name: 'inspec-gcp-backend-bucket') do
  it { should exist }
  its('description') { should eq 'Backend bucket example' }
  its('enable_cdn') { should be 'true' }
  its('bucket_name') { should eq 'gcp-inspec-storage-bucket' }
end

describe google_compute_backend_bucket(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_backend_bucket` resource:

`bucket_name`
: Cloud Storage bucket name.

`cdn_policy`
: Cloud CDN configuration for this Backend Bucket.

  `signed_url_cache_max_age_sec`
  : Maximum number of seconds the response to a signed URL request will be considered fresh. After this time period, the response will be revalidated before being served. When serving responses to signed URL requests, Cloud CDN will internally behave as though all responses from this backend had a "Cache-Control: public, max-age=[TTL]" header, regardless of any existing Cache-Control header. The actual headers served in responses will not be altered.

`creation_timestamp`
: Creation timestamp in RFC3339 text format.

`description`
: An optional textual description of the resource; provided by the client when the resource is created.

`enable_cdn`
: If true, enable Cloud CDN for this BackendBucket.

`id`
: Unique identifier for the resource.

`name`
: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
