+++
title = "google_compute_global_addresses resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_global_addresses"
    identifier = "inspec/resources/gcp/google_compute_global_addresses.md google_compute_global_addresses resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_global_addresses` is used to test a Google GlobalAddress resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_global_addresses(project: 'chef-gcp-inspec', name: 'inspec-gcp-global-address') do
  its('count') { should be >= 1 }
  its('names') { should include 'inspec-gcp-global-address' }
  its('ip_versions') { should include 'IPV6' }
end
```

## Properties

Properties that can be accessed from the `google_compute_global_addresses` resource:

See the [google_compute_global_address](/inspec/resources/google_compute_global_address/#properties) resource for more information.

`addresses`
: an array of `google_compute_global_address` address

`creation_timestamps`
: an array of `google_compute_global_address` creation_timestamp

`descriptions`
: an array of `google_compute_global_address` description

`ids`
: an array of `google_compute_global_address` id

`names`
: an array of `google_compute_global_address` name

`labels`
: (Beta only) an array of `google_compute_global_address` labels

`label_fingerprints`
: (Beta only) an array of `google_compute_global_address` label_fingerprint

`ip_versions`
: an array of `google_compute_global_address` ip_version

`regions`
: an array of `google_compute_global_address` region

`prefix_lengths`
: an array of `google_compute_global_address` prefix_length

`address_types`
: an array of `google_compute_global_address` address_type

`purposes`
: an array of `google_compute_global_address` purpose

`networks`
: an array of `google_compute_global_address` network

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
