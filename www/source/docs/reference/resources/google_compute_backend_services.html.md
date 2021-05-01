---
title: About the google_compute_backend_services resource
platform: gcp
---

## Syntax
A `google_compute_backend_services` is used to test a Google BackendService resource

## Examples
```
describe google_compute_backend_services(project: 'chef-gcp-inspec') do
  its('count') { should be >= 1 }
  its('names') { should include 'inspec-gcp-backend-service' }
  its('port_names') { should include 'http' }
  its('protocols') { should include 'HTTP' }
  its('timeout_secs') { should include '10' }
end
```

## Properties
Properties that can be accessed from the `google_compute_backend_services` resource:

See [google_compute_backend_service.md](google_compute_backend_service.md) for more detailed information
  * `affinity_cookie_ttl_secs`: an array of `google_compute_backend_service` affinity_cookie_ttl_sec
  * `backends`: an array of `google_compute_backend_service` backends
  * `cdn_policies`: an array of `google_compute_backend_service` cdn_policy
  * `connection_drainings`: an array of `google_compute_backend_service` connection_draining
  * `creation_timestamps`: an array of `google_compute_backend_service` creation_timestamp
  * `descriptions`: an array of `google_compute_backend_service` description
  * `enable_cdns`: an array of `google_compute_backend_service` enable_cdn
  * `health_checks`: an array of `google_compute_backend_service` health_checks
  * `ids`: an array of `google_compute_backend_service` id
  * `iaps`: an array of `google_compute_backend_service` iap
  * `load_balancing_schemes`: an array of `google_compute_backend_service` load_balancing_scheme
  * `names`: an array of `google_compute_backend_service` name
  * `port_names`: an array of `google_compute_backend_service` port_name
  * `protocols`: an array of `google_compute_backend_service` protocol
  * `regions`: an array of `google_compute_backend_service` region
  * `session_affinities`: an array of `google_compute_backend_service` session_affinity
  * `timeout_secs`: an array of `google_compute_backend_service` timeout_sec

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.
