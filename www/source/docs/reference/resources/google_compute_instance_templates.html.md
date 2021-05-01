---
title: About the google_compute_instance_templates resource
platform: gcp
---

## Syntax
A `google_compute_instance_templates` is used to test a Google InstanceTemplate resource

## Examples
```
describe google_compute_instance_templates(project: 'chef-gcp-inspec') do
  its('names') { should include 'inspec-gcp-instance-template' }
end
```

## Properties
Properties that can be accessed from the `google_compute_instance_templates` resource:

See [google_compute_instance_template.md](google_compute_instance_template.md) for more detailed information
  * `creation_timestamps`: an array of `google_compute_instance_template` creation_timestamp
  * `descriptions`: an array of `google_compute_instance_template` description
  * `ids`: an array of `google_compute_instance_template` id
  * `names`: an array of `google_compute_instance_template` name
  * `properties`: an array of `google_compute_instance_template` properties

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.
