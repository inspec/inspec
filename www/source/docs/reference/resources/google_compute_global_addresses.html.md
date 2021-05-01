---
title: About the google_compute_global_addresses resource
platform: gcp
---

## Syntax
A `google_compute_global_addresses` is used to test a Google GlobalAddress resource

## Examples
```
describe google_compute_global_addresses(project: 'chef-gcp-inspec', name: 'inspec-gcp-global-address') do
  its('count') { should be >= 1 }
  its('names') { should include 'inspec-gcp-global-address' }
  its('ip_versions') { should include 'IPV6' }
end
```

## Properties
Properties that can be accessed from the `google_compute_global_addresses` resource:

See [google_compute_global_address.md](google_compute_global_address.md) for more detailed information
  * `addresses`: an array of `google_compute_global_address` address
  * `creation_timestamps`: an array of `google_compute_global_address` creation_timestamp
  * `descriptions`: an array of `google_compute_global_address` description
  * `ids`: an array of `google_compute_global_address` id
  * `names`: an array of `google_compute_global_address` name
  * `ip_versions`: an array of `google_compute_global_address` ip_version
  * `regions`: an array of `google_compute_global_address` region
  * `address_types`: an array of `google_compute_global_address` address_type

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.
