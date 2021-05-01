---
title: About the google_compute_target_tcp_proxies resource
platform: gcp
---

## Syntax
A `google_compute_target_tcp_proxies` is used to test a Google TargetTcpProxy resource

## Examples
```
describe google_compute_target_tcp_proxies(project: 'chef-gcp-inspec') do
  its('names') { should include 'inspec-gcp-target-tcp-proxy' }
  its('proxy_headers') { should include 'NONE' }
end
```

## Properties
Properties that can be accessed from the `google_compute_target_tcp_proxies` resource:

See [google_compute_target_tcp_proxy.md](google_compute_target_tcp_proxy.md) for more detailed information
  * `creation_timestamps`: an array of `google_compute_target_tcp_proxy` creation_timestamp
  * `descriptions`: an array of `google_compute_target_tcp_proxy` description
  * `ids`: an array of `google_compute_target_tcp_proxy` id
  * `names`: an array of `google_compute_target_tcp_proxy` name
  * `proxy_headers`: an array of `google_compute_target_tcp_proxy` proxy_header
  * `services`: an array of `google_compute_target_tcp_proxy` service

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.
