+++
title = "google_compute_url_maps resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_url_maps"
    identifier = "inspec/resources/gcp/google_compute_url_maps.md google_compute_url_maps resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_url_maps` is used to test a Google UrlMap resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_url_maps(project: 'chef-gcp-inspec') do
  its('names') { should include 'inspec-gcp-url-map' }
end
```

## Properties

Properties that can be accessed from the `google_compute_url_maps` resource:

See the [google_compute_url_map](/inspec/resources/google_compute_url_map/#properties) resource for more information.

`creation_timestamps`
: an array of `google_compute_url_map` creation_timestamp

`default_services`
: an array of `google_compute_url_map` default_service

`descriptions`
: an array of `google_compute_url_map` description

`ids`
: an array of `google_compute_url_map` id

`fingerprints`
: an array of `google_compute_url_map` fingerprint

`header_actions`
: an array of `google_compute_url_map` header_action

`host_rules`
: an array of `google_compute_url_map` host_rules

`names`
: an array of `google_compute_url_map` name

`path_matchers`
: an array of `google_compute_url_map` path_matchers

`tests`
: an array of `google_compute_url_map` tests

`default_url_redirects`
: an array of `google_compute_url_map` default_url_redirect

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
