---
title: About the google_compute_target_https_proxies resource
platform: gcp
---

## Syntax
A `google_compute_target_https_proxies` is used to test a Google TargetHttpsProxy resource

## Examples
```
describe google_compute_target_https_proxies(project: 'chef-gcp-inspec') do
  its('names') { should include 'inspec-gcp-https-proxy' }
  its('descriptions') { should include 'A HTTPS target proxy' }
end
```

## Properties
Properties that can be accessed from the `google_compute_target_https_proxies` resource:

See [google_compute_target_https_proxy.md](google_compute_target_https_proxy.md) for more detailed information
  * `creation_timestamps`: an array of `google_compute_target_https_proxy` creation_timestamp
  * `descriptions`: an array of `google_compute_target_https_proxy` description
  * `ids`: an array of `google_compute_target_https_proxy` id
  * `names`: an array of `google_compute_target_https_proxy` name
  * `quic_overrides`: an array of `google_compute_target_https_proxy` quic_override
  * `ssl_certificates`: an array of `google_compute_target_https_proxy` ssl_certificates
  * `ssl_policies`: an array of `google_compute_target_https_proxy` ssl_policy
  * `url_maps`: an array of `google_compute_target_https_proxy` url_map

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.
