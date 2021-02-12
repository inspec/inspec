+++
title = "google_bigquery_tables resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_bigquery_tables"
    identifier = "inspec/resources/gcp/google_bigquery_tables.md google_bigquery_tables resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_bigquery_tables` is used to test a Google Table resource

## Examples

```ruby
describe.one do
  google_bigquery_tables(project: 'chef-gcp-inspec', dataset: 'inspec_gcp_dataset').table_references.each do |table_reference|
    describe google_bigquery_table(project: 'chef-gcp-inspec', dataset: 'inspec_gcp_dataset', name: table_reference.table_id) do
      its('expiration_time') { should cmp '1738882264000' }
      its('description') { should eq 'A BigQuery table' }
    end
  end
end
```

## Properties

Properties that can be accessed from the `google_bigquery_tables` resource:

See the [google_bigquery_table](/inspec/resources/google_bigquery_table/#properties) resource for more information.

`table_references`
: an array of `google_bigquery_table` table_reference

`clusterings`
: an array of `google_bigquery_table` clustering

`creation_times`
: an array of `google_bigquery_table` creation_time

`friendly_names`
: an array of `google_bigquery_table` friendly_name

`ids`
: an array of `google_bigquery_table` id

`labels`
: an array of `google_bigquery_table` labels

`last_modified_times`
: an array of `google_bigquery_table` last_modified_time

`locations`
: an array of `google_bigquery_table` location

`num_bytes`
: an array of `google_bigquery_table` num_bytes

`num_long_term_bytes`
: an array of `google_bigquery_table` num_long_term_bytes

`num_rows`
: an array of `google_bigquery_table` num_rows

`require_partition_filters`
: an array of `google_bigquery_table` require_partition_filter

`types`
: an array of `google_bigquery_table` type

`views`
: an array of `google_bigquery_table` view

`time_partitionings`
: an array of `google_bigquery_table` time_partitioning

`streaming_buffers`
: an array of `google_bigquery_table` streaming_buffer

`schemas`
: an array of `google_bigquery_table` schema

`encryption_configurations`
: an array of `google_bigquery_table` encryption_configuration

`expiration_times`
: an array of `google_bigquery_table` expiration_time

`external_data_configurations`
: an array of `google_bigquery_table` external_data_configuration

`datasets`
: an array of `google_bigquery_table` dataset

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [BigQuery API](https://console.cloud.google.com/apis/library/bigquery-json.googleapis.com/) is enabled for the current project.
