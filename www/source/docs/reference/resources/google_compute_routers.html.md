---
title: About the google_compute_routers resource
platform: gcp
---

## Syntax
A `google_compute_routers` is used to test a Google Router resource

## Examples
```
describe google_compute_routers(project: 'chef-gcp-inspec', region: 'europe-west2') do
  its('names') { should include 'inspec-gcp-router' }
end
```

## Properties
Properties that can be accessed from the `google_compute_routers` resource:

See [google_compute_router.md](google_compute_router.md) for more detailed information
  * `ids`: an array of `google_compute_router` id
  * `creation_timestamps`: an array of `google_compute_router` creation_timestamp
  * `names`: an array of `google_compute_router` name
  * `descriptions`: an array of `google_compute_router` description
  * `networks`: an array of `google_compute_router` network
  * `bgps`: an array of `google_compute_router` bgp
  * `regions`: an array of `google_compute_router` region

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.
