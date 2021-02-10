+++
title = "google_compute_zone resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_zone"
    identifier = "inspec/resources/gcp/google_compute_zone.md google_compute_zone resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_zone` is used to test a Google Zone resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_zone(project: 'chef-gcp-inspec', name: "us-central1-a") do
  it { should exist }
  it { should be_up }
end
```

### Test that a GCP compute zone exists

    describe google_compute_zone(project: 'chef-inspec-gcp',  zone: 'us-east1-b') do
      it { should exist }
    end

### Test that a GCP compute zone is in the expected state

    describe google_compute_zone(project: 'chef-inspec-gcp',  zone: 'us-east1-b') do
      its('status') { should eq 'UP' }
      # or equivalently
      it { should be_up }
    end

### Test that a GCP compute zone has an expected CPU platform

    describe google_compute_zone(project: 'chef-inspec-gcp',  zone: 'us-east1-b') do
      its('available_cpu_platforms') { should include "Intel Skylake" }
    end

## Properties

Properties that can be accessed from the `google_compute_zone` resource:

`creation_timestamp`
: Creation timestamp in RFC3339 text format.

`deprecated`
: The deprecation status associated with this machine type.

  `deleted`
  : An optional RFC3339 timestamp on or after which the state of this resource is intended to change to DELETED. This is only informational and the status will not change unless the client explicitly changes it.

  `deprecated`
  : An optional RFC3339 timestamp on or after which the state of this resource is intended to change to DEPRECATED. This is only informational and the status will not change unless the client explicitly changes it.

  `obsolete`
  : An optional RFC3339 timestamp on or after which the state of this resource is intended to change to OBSOLETE. This is only informational and the status will not change unless the client explicitly changes it.

  `replacement`
  : The URL of the suggested replacement for a deprecated resource. The suggested replacement resource must be the same kind of resource as the deprecated resource.

  `state`
  : The deprecation state of this resource. This can be DEPRECATED, OBSOLETE, or DELETED. Operations which create a new resource using a DEPRECATED resource will return successfully, but with a warning indicating the deprecated resource and recommending its replacement. Operations which use OBSOLETE or DELETED resources will be rejected and result in an error.

    Possible values:

    - DEPRECATED
    - OBSOLETE
    - DELETED

`description`
: An optional textual description of the resource.

`id`
: The unique identifier for the resource.

`name`
: Name of the resource.

`region`
: The region where the zone is located.

`status`
: The status of the zone.

  Possible values:

  - UP
  - DOWN

`available_cpu_platforms`
: The available CPU platforms in this zone

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
