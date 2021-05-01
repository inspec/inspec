---
title: About the google_compute_url_maps resource
platform: gcp
---

## Syntax
A `google_compute_url_maps` is used to test a Google UrlMap resource

## Examples
```
describe google_compute_url_maps(project: 'chef-gcp-inspec') do
  its('names') { should include 'inspec-gcp-url-map' }
end
```

## Properties
Properties that can be accessed from the `google_compute_url_maps` resource:

See [google_compute_url_map.md](google_compute_url_map.md) for more detailed information
  * `creation_timestamps`: an array of `google_compute_url_map` creation_timestamp
  * `default_services`: an array of `google_compute_url_map` default_service
  * `descriptions`: an array of `google_compute_url_map` description
  * `host_rules`: an array of `google_compute_url_map` host_rules
  * `ids`: an array of `google_compute_url_map` id
  * `fingerprints`: an array of `google_compute_url_map` fingerprint
  * `names`: an array of `google_compute_url_map` name
  * `path_matchers`: an array of `google_compute_url_map` path_matchers
  * `tests`: an array of `google_compute_url_map` tests

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.
