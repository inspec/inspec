+++
title = "google_compute_firewalls resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_firewalls"
    identifier = "inspec/resources/gcp/google_compute_firewalls.md google_compute_firewalls resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_firewalls` is used to test a Google Firewall resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_firewalls(project: 'chef-gcp-inspec') do
  its('count') { should be >= 1 }
  its('firewall_names') { should include 'inspec-gcp-firewall' }
  its('firewall_directions') { should include 'INGRESS' }
end
```

### Test that there are no more than a specified number of firewalls available for the project

    describe google_compute_firewalls(project: 'chef-inspec-gcp') do
      its('count') { should be <= 100}
    end

### Test that an expected firewall is available for the project

    describe google_compute_firewalls(project: 'chef-inspec-gcp') do
      its('firewall_names') { should include "my-app-firewall-rule" }
    end

### Test that a particular named rule does not exist

    describe google_compute_firewalls(project: 'chef-inspec-gcp') do
      its('firewall_names') { should_not include "default-allow-ssh" }
    end

### Test there are no firewalls for the "INGRESS" direction

    describe google_compute_firewalls(project: 'chef-inspec-gcp').where(firewall_direction: 'INGRESS') do
      it { should_not exist }
    end

## Properties

Properties that can be accessed from the `google_compute_firewalls` resource:

See the [google_compute_firewall](/inspec/resources/google_compute_firewall/#properties) resource for more information.

`alloweds`
: an array of `google_compute_firewall` allowed

`creation_timestamps`
: an array of `google_compute_firewall` creation_timestamp

`denieds`
: an array of `google_compute_firewall` denied

`descriptions`
: an array of `google_compute_firewall` description

`destination_ranges`
: an array of `google_compute_firewall` destination_ranges

`firewall_directions`
: an array of `google_compute_firewall` direction

`disableds`
: an array of `google_compute_firewall` disabled

`log_configs`
: an array of `google_compute_firewall` log_config

`firewall_ids`
: an array of `google_compute_firewall` id

`firewall_names`
: an array of `google_compute_firewall` name

`networks`
: an array of `google_compute_firewall` network

`priorities`
: an array of `google_compute_firewall` priority

`source_ranges`
: an array of `google_compute_firewall` source_ranges

`source_service_accounts`
: an array of `google_compute_firewall` source_service_accounts

`source_tags`
: an array of `google_compute_firewall` source_tags

`target_service_accounts`
: an array of `google_compute_firewall` target_service_accounts

`target_tags`
: an array of `google_compute_firewall` target_tags

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
