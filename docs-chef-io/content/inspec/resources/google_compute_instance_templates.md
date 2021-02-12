+++
title = "google_compute_instance_templates resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_instance_templates"
    identifier = "inspec/resources/gcp/google_compute_instance_templates.md google_compute_instance_templates resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_instance_templates` is used to test a Google InstanceTemplate resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_instance_templates(project: 'chef-gcp-inspec') do
  its('names') { should include 'inspec-gcp-instance-template' }
end
```

## Properties

Properties that can be accessed from the `google_compute_instance_templates` resource:

See the [google_compute_instance_template](/inspec/resources/google_compute_instance_template/#properties) resource for more information.

`creation_timestamps`
: an array of `google_compute_instance_template` creation_timestamp

`descriptions`
: an array of `google_compute_instance_template` description

`ids`
: an array of `google_compute_instance_template` id

`names`
: an array of `google_compute_instance_template` name

`properties`
: an array of `google_compute_instance_template` properties

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
