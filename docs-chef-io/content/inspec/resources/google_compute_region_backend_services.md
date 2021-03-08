+++
title = "google_compute_region_backend_services resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_region_backend_services"
    identifier = "inspec/resources/gcp/google_compute_region_backend_services.md google_compute_region_backend_services resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_region_backend_services` is used to test a Google RegionBackendService resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_region_backend_services(project: 'chef-gcp-inspec', region: 'europe-west2') do
  its('count') { should be >= 1 }
  its('names') { should include 'inspec-gcp-region-backend-service' }
  its('protocols') { should include 'TCP' }
  its('timeout_secs') { should include '15' }
end
```

## Properties

Properties that can be accessed from the `google_compute_region_backend_services` resource:

See the [google_compute_region_backend_service](/inspec/resources/google_compute_region_backend_service/#properties) resource for more information.

`affinity_cookie_ttl_secs`
: an array of `google_compute_region_backend_service` affinity_cookie_ttl_sec

`backends`
: an array of `google_compute_region_backend_service` backends

`circuit_breakers`
: an array of `google_compute_region_backend_service` circuit_breakers

`consistent_hashes`
: an array of `google_compute_region_backend_service` consistent_hash

`connection_drainings`
: an array of `google_compute_region_backend_service` connection_draining

`creation_timestamps`
: an array of `google_compute_region_backend_service` creation_timestamp

`descriptions`
: an array of `google_compute_region_backend_service` description

`failover_policies`
: an array of `google_compute_region_backend_service` failover_policy

`fingerprints`
: an array of `google_compute_region_backend_service` fingerprint

`health_checks`
: an array of `google_compute_region_backend_service` health_checks

`ids`
: an array of `google_compute_region_backend_service` id

`load_balancing_schemes`
: an array of `google_compute_region_backend_service` load_balancing_scheme

`locality_lb_policies`
: an array of `google_compute_region_backend_service` locality_lb_policy

`names`
: an array of `google_compute_region_backend_service` name

`outlier_detections`
: an array of `google_compute_region_backend_service` outlier_detection

`port_names`
: an array of `google_compute_region_backend_service` port_name

`protocols`
: an array of `google_compute_region_backend_service` protocol

`session_affinities`
: an array of `google_compute_region_backend_service` session_affinity

`timeout_secs`
: an array of `google_compute_region_backend_service` timeout_sec

`log_configs`
: an array of `google_compute_region_backend_service` log_config

`networks`
: an array of `google_compute_region_backend_service` network

`regions`
: an array of `google_compute_region_backend_service` region

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
