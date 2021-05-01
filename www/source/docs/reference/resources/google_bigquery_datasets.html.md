---
title: About the google_bigquery_datasets resource
platform: gcp
---

## Syntax
A `google_bigquery_datasets` is used to test a Google Dataset resource

## Examples
```
describe google_bigquery_datasets(project: 'chef-gcp-inspec') do
  its('count') { should be >= 1 }
  its('friendly_names') { should include 'A BigQuery dataset test' }
  its('locations') { should include 'EU' }
end
```

## Properties
Properties that can be accessed from the `google_bigquery_datasets` resource:

See [google_bigquery_dataset.md](google_bigquery_dataset.md) for more detailed information
  * `dataset_references`: an array of `google_bigquery_dataset` dataset_reference
  * `friendly_names`: an array of `google_bigquery_dataset` friendly_name
  * `ids`: an array of `google_bigquery_dataset` id
  * `labels`: an array of `google_bigquery_dataset` labels
  * `locations`: an array of `google_bigquery_dataset` location

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.
