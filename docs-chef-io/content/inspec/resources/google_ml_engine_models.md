+++
title = "google_ml_engine_models resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_ml_engine_models"
    identifier = "inspec/resources/gcp/google_ml_engine_models.md google_ml_engine_models resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_ml_engine_models` is used to test a Google Model resource

## Examples

```ruby
describe google_ml_engine_models(project: 'chef-gcp-inspec') do
  its('descriptions') { should include 'My awesome ML model' }
  its('online_prediction_loggings') { should include 'true' }
  its('online_prediction_console_loggings') { should include 'true' }
end
```

## Properties

Properties that can be accessed from the `google_ml_engine_models` resource:

See the [google_ml_engine_model](/inspec/resources/google_ml_engine_model/#properties) resource for more information.

`names`
: an array of `google_ml_engine_model` name

`descriptions`
: an array of `google_ml_engine_model` description

`default_versions`
: an array of `google_ml_engine_model` default_version

`regions`
: an array of `google_ml_engine_model` regions

`online_prediction_loggings`
: an array of `google_ml_engine_model` online_prediction_logging

`online_prediction_console_loggings`
: an array of `google_ml_engine_model` online_prediction_console_logging

`labels`
: an array of `google_ml_engine_model` labels

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Cloud ML](https://console.cloud.google.com/apis/library/ml.googleapis.com) is enabled for the current project.
