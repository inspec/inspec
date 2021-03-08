+++
title = "google_compute_target_http_proxy resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_target_http_proxy"
    identifier = "inspec/resources/gcp/google_compute_target_http_proxy.md google_compute_target_http_proxy resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_target_http_proxy` is used to test a Google TargetHttpProxy resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_target_http_proxy(project: 'chef-gcp-inspec', name: 'inspec-gcp-http-proxy') do
  it { should exist }
  its('description') { should eq 'A HTTP proxy' }
  its('url_map') { should  match /\/inspec-gcp-url-map$/ }
end

describe google_compute_target_http_proxy(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_target_http_proxy` resource:

`creation_timestamp`
: Creation timestamp in RFC3339 text format.

`description`
: An optional description of this resource.

`id`
: The unique identifier for the resource.

`name`
: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

`url_map`
: A reference to the UrlMap resource that defines the mapping from URL to the BackendService.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
