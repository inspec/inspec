---
title: About the google_compute_http_health_checks resource
platform: gcp
---

## Syntax
A `google_compute_http_health_checks` is used to test a Google HttpHealthCheck resource

## Examples
```
describe google_compute_http_health_checks(project: 'chef-gcp-inspec') do
  its('names') { should include 'inspec-gcp-http-health-check' }
  its('timeout_secs') { should include '20' }
  its('check_interval_secs') { should include '20' }
end
```

## Properties
Properties that can be accessed from the `google_compute_http_health_checks` resource:

See [google_compute_http_health_check.md](google_compute_http_health_check.md) for more detailed information
  * `check_interval_secs`: an array of `google_compute_http_health_check` check_interval_sec
  * `creation_timestamps`: an array of `google_compute_http_health_check` creation_timestamp
  * `descriptions`: an array of `google_compute_http_health_check` description
  * `healthy_thresholds`: an array of `google_compute_http_health_check` healthy_threshold
  * `hosts`: an array of `google_compute_http_health_check` host
  * `ids`: an array of `google_compute_http_health_check` id
  * `names`: an array of `google_compute_http_health_check` name
  * `ports`: an array of `google_compute_http_health_check` port
  * `request_paths`: an array of `google_compute_http_health_check` request_path
  * `timeout_secs`: an array of `google_compute_http_health_check` timeout_sec
  * `unhealthy_thresholds`: an array of `google_compute_http_health_check` unhealthy_threshold

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.
