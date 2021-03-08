+++
title = "google_compute_autoscalers resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_autoscalers"
    identifier = "inspec/resources/gcp/google_compute_autoscalers.md google_compute_autoscalers resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_autoscalers` is used to test a Google Autoscaler resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
autoscalers = google_compute_autoscalers(project: 'chef-gcp-inspec', zone: 'zone')
describe.one do
  autoscalers.autoscaling_policies.each do |autoscaling_policy|
    describe autoscaling_policy do
        its('max_num_replicas') { should eq '5' }
        its('min_num_replicas') { should eq '1' }
        its('cool_down_period_sec') { should eq '60' }
        its('cpu_utilization.utilization_target') { should eq '0.5' }
    end
  end
end
```

## Properties

Properties that can be accessed from the `google_compute_autoscalers` resource:

See the [google_compute_autoscaler](/inspec/resources/google_compute_autoscaler/#properties) resource for more information.

`ids`
: an array of `google_compute_autoscaler` id

`creation_timestamps`
: an array of `google_compute_autoscaler` creation_timestamp

`names`
: an array of `google_compute_autoscaler` name

`descriptions`
: an array of `google_compute_autoscaler` description

`autoscaling_policies`
: an array of `google_compute_autoscaler` autoscaling_policy

`targets`
: an array of `google_compute_autoscaler` target

`zones`
: an array of `google_compute_autoscaler` zone

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
