+++
title = "google_spanner_instance resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_spanner_instance"
    identifier = "inspec/resources/gcp/google_spanner_instance.md google_spanner_instance resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_spanner_instance` is used to test a Google Instance resource

## Examples

```ruby

describe google_spanner_instance(project: 'chef-gcp-inspec', name: 'spinstance', config: 'regional-us-east1') do
  it { should exist }
  its('config') { should match 'regional-us-east1' }
  its('name') { should match 'spinstance' }
  its('display_name') { should eq 'inspectest' }
  its('node_count') { should eq '1' }
  its('labels') { should include('env' => 'test') }
end
```

## Properties

Properties that can be accessed from the `google_spanner_instance` resource:

`name`
: A unique identifier for the instance, which cannot be changed after the instance is created. The name must be between 6 and 30 characters in length.

`config`
: The name of the instance's configuration (similar but not quite the same as a region) which defines defines the geographic placement and replication of your databases in this instance. It determines where your data is stored. Values are typically of the form `regional-europe-west1` , `us-central` etc. In order to obtain a valid list please consult the [Configuration section of the docs](https://cloud.google.com/spanner/docs/instances).

`display_name`
: The descriptive name for this instance as it appears in UIs. Must be unique per project and between 4 and 30 characters in length.

`node_count`
: The number of nodes allocated to this instance.

`labels`
: An object containing a list of `"key": "value"` pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }.

## GCP Permissions

Ensure the [Cloud Spanner API](https://console.cloud.google.com/apis/library/spanner.googleapis.com/) is enabled for the current project.
