---
title: About the google_compute_health_checks resource
platform: gcp
---

## Syntax
A `google_compute_health_checks` is used to test a Google HealthCheck resource

## Examples
```
describe google_compute_health_checks(project: 'chef-gcp-inspec') do
  its('names') { should include 'inspec-gcp-health-check' }
  its('timeout_secs') { should include '10' }
end
```

## Properties
Properties that can be accessed from the `google_compute_health_checks` resource:

See [google_compute_health_check.md](google_compute_health_check.md) for more detailed information
  * `check_interval_secs`: an array of `google_compute_health_check` check_interval_sec
  * `creation_timestamps`: an array of `google_compute_health_check` creation_timestamp
  * `descriptions`: an array of `google_compute_health_check` description
  * `healthy_thresholds`: an array of `google_compute_health_check` healthy_threshold
  * `ids`: an array of `google_compute_health_check` id
  * `names`: an array of `google_compute_health_check` name
  * `timeout_secs`: an array of `google_compute_health_check` timeout_sec
  * `unhealthy_thresholds`: an array of `google_compute_health_check` unhealthy_threshold
  * `types`: an array of `google_compute_health_check` type
  * `http_health_checks`: an array of `google_compute_health_check` http_health_check
  * `https_health_checks`: an array of `google_compute_health_check` https_health_check
  * `tcp_health_checks`: an array of `google_compute_health_check` tcp_health_check
  * `ssl_health_checks`: an array of `google_compute_health_check` ssl_health_check

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.
