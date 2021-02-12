+++
title = "google_spanner_instances resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_spanner_instances"
    identifier = "inspec/resources/gcp/google_spanner_instances.md google_spanner_instances resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_spanner_instances` is used to test a Google Instance resource

## Examples

```ruby

describe.one do
  google_spanner_instances(project: 'chef-gcp-inspec', config: 'regional-us-east1').configs.each do |config|
    describe config do
      it { should match 'regional-us-east1' }
    end
  end
end
```

## Properties

Properties that can be accessed from the `google_spanner_instances` resource:

See the [google_spanner_instance](/inspec/resources/google_spanner_instance/#properties) resource for more information.

`names`
: an array of `google_spanner_instance` name

`configs`
: an array of `google_spanner_instance` config

`display_names`
: an array of `google_spanner_instance` display_name

`node_counts`
: an array of `google_spanner_instance` node_count

`labels`
: an array of `google_spanner_instance` labels

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Cloud Spanner API](https://console.cloud.google.com/apis/library/spanner.googleapis.com/) is enabled for the current project.
