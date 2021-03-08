+++
title = "google_compute_zones resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_zones"
    identifier = "inspec/resources/gcp/google_compute_zones.md google_compute_zones resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_zones` is used to test a Google Zone resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```
google_compute_zones(project: 'chef-gcp-inspec').zone_names.each do |zone_name|
  describe google_compute_zone(project: 'chef-gcp-inspec', name: zone_name) do
    it { should exist }
    it { should be_up }
  end
end
```

### Test that there are no more than a specified number of zones available for the project

    describe google_compute_zones(project: 'chef-inspec-gcp') do
      its('count') { should be <= 100}
    end

### Test the exact number of zones in the project

    describe google_compute_zones(project: 'chef-inspec-gcp') do
      its('zone_ids.count') { should cmp 9 }
    end

### Test that an expected zone is available for the project

    describe google_compute_zones(project: 'chef-inspec-gcp') do
      its('zone_names') { should include "us-east1-b" }
    end

### Test whether any zones are in status "DOWN"

    describe google_compute_zones(project: 'chef-inspec-gcp') do
      its('zone_statuses') { should_not include "DOWN" }
    end

### Test that a subset of all zones matching "us\*" are "UP"

    google_compute_zones(project: 'chef-inspec-gcp').where(zone_name: /^us/).zone_names.each do |zone_name|
      describe google_compute_zone(project: 'chef-inspec-gcp',  zone: zone_name) do
        it { should exist }
        its('status') { should eq 'UP' }
      end
    end

## Properties

Properties that can be accessed from the `google_compute_zones` resource:

See the [google_compute_zone](/inspec/resources/google_compute_zone/#properties) resource for more information.

`creation_timestamps`
: an array of `google_compute_zone` creation_timestamp

`deprecateds`
: an array of `google_compute_zone` deprecated

`descriptions`
: an array of `google_compute_zone` description

`zone_ids`
: an array of `google_compute_zone` id

`zone_names`
: an array of `google_compute_zone` name

`regions`
: an array of `google_compute_zone` region

`zone_statuses`
: an array of `google_compute_zone` status

`available_cpu_platforms`
: an array of `google_compute_zone` available_cpu_platforms

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
