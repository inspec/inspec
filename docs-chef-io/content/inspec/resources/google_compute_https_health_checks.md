+++
title = "google_compute_https_health_checks resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_https_health_checks"
    identifier = "inspec/resources/gcp/google_compute_https_health_checks.md google_compute_https_health_checks resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_https_health_checks` is used to test a Google HttpsHealthCheck resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_https_health_checks(project: 'chef-gcp-inspec') do
  its('names') { should include 'inspec-gcp-https-health-check' }
  its('timeout_secs') { should include '15' }
  its('check_interval_secs') { should include '15' }
end
```

## Properties

Properties that can be accessed from the `google_compute_https_health_checks` resource:

See the [google_compute_https_health_check](/inspec/resources/google_compute_https_health_check/#properties) resource for more information.

`check_interval_secs`
: an array of `google_compute_https_health_check` check_interval_sec

`creation_timestamps`
: an array of `google_compute_https_health_check` creation_timestamp

`descriptions`
: an array of `google_compute_https_health_check` description

`healthy_thresholds`
: an array of `google_compute_https_health_check` healthy_threshold

`hosts`
: an array of `google_compute_https_health_check` host

`ids`
: an array of `google_compute_https_health_check` id

`names`
: an array of `google_compute_https_health_check` name

`ports`
: an array of `google_compute_https_health_check` port

`request_paths`
: an array of `google_compute_https_health_check` request_path

`timeout_secs`
: an array of `google_compute_https_health_check` timeout_sec

`unhealthy_thresholds`
: an array of `google_compute_https_health_check` unhealthy_threshold

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
