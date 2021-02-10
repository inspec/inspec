+++
title = "google_compute_routers resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_routers"
    identifier = "inspec/resources/gcp/google_compute_routers.md google_compute_routers resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_routers` is used to test a Google Router resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_routers(project: 'chef-gcp-inspec', region: 'europe-west2') do
  its('names') { should include 'inspec-gcp-router' }
end
```

## Properties

Properties that can be accessed from the `google_compute_routers` resource:

See the [google_compute_router](/inspec/resources/google_compute_router/#properties) resource for more information.

`ids`
: an array of `google_compute_router` id

`creation_timestamps`
: an array of `google_compute_router` creation_timestamp

`names`
: an array of `google_compute_router` name

`descriptions`
: an array of `google_compute_router` description

`networks`
: an array of `google_compute_router` network

`bgps`
: an array of `google_compute_router` bgp

`regions`
: an array of `google_compute_router` region

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
