+++
title = "google_compute_target_tcp_proxies resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_target_tcp_proxies"
    identifier = "inspec/resources/gcp/google_compute_target_tcp_proxies.md google_compute_target_tcp_proxies resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_target_tcp_proxies` is used to test a Google TargetTcpProxy resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_target_tcp_proxies(project: 'chef-gcp-inspec') do
  its('names') { should include 'inspec-gcp-target-tcp-proxy' }
  its('proxy_headers') { should include 'NONE' }
end
```

## Properties

Properties that can be accessed from the `google_compute_target_tcp_proxies` resource:

See the [google_compute_target_tcp_proxy](/inspec/resources/google_compute_target_tcp_proxy/#properties) resource for more information.

`creation_timestamps`
: an array of `google_compute_target_tcp_proxy` creation_timestamp

`descriptions`
: an array of `google_compute_target_tcp_proxy` description

`ids`
: an array of `google_compute_target_tcp_proxy` id

`names`
: an array of `google_compute_target_tcp_proxy` name

`proxy_headers`
: an array of `google_compute_target_tcp_proxy` proxy_header

`services`
: an array of `google_compute_target_tcp_proxy` service

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
