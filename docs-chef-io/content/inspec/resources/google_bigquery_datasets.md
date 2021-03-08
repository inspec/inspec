+++
title = "google_bigquery_datasets resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_bigquery_datasets"
    identifier = "inspec/resources/gcp/google_bigquery_datasets.md google_bigquery_datasets resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_bigquery_datasets` is used to test a Google Dataset resource

## Examples

```ruby
describe google_bigquery_datasets(project: 'chef-gcp-inspec') do
  its('count') { should be >= 1 }
  its('friendly_names') { should include 'A BigQuery dataset test' }
  its('locations') { should include 'EU' }
end

google_bigquery_datasets(project: 'chef-gcp-inspec').ids.each do |name|
  google_bigquery_dataset(project: 'chef-gcp-inspec', name: name.split(':').last).access.each do |access|
    describe access do
      # No bigquery dataset should allow access to allUsers
      its('iam_member') { should_not cmp 'allUsers' }
    end
  end
end
```

## Properties

Properties that can be accessed from the `google_bigquery_datasets` resource:

See the [google_bigquery_dataset](/inspec/resources/google_bigquery_dataset/#properties) resource for more information.

`dataset_references`
: an array of `google_bigquery_dataset` dataset_reference

`default_partition_expiration_ms`
: an array of `google_bigquery_dataset` default_partition_expiration_ms

`etags`
: an array of `google_bigquery_dataset` etag

`friendly_names`
: an array of `google_bigquery_dataset` friendly_name

`ids`
: an array of `google_bigquery_dataset` id

`labels`
: an array of `google_bigquery_dataset` labels

`locations`
: an array of `google_bigquery_dataset` location

`default_encryption_configurations`
: an array of `google_bigquery_dataset` default_encryption_configuration

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [BigQuery API](https://console.cloud.google.com/apis/library/bigquery-json.googleapis.com/) is enabled for the current project.
