+++
title = "google_ml_engine_model resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_ml_engine_model"
    identifier = "inspec/resources/gcp/google_ml_engine_model.md google_ml_engine_model resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_ml_engine_model` is used to test a Google Model resource

## Examples

```ruby
describe google_ml_engine_model(project: 'chef-gcp-inspec', name: 'ml_model') do
  it { should exist }
  its('description') { should cmp 'My awesome ML model' }
  its('regions') { should include 'us-central1' }
  its('online_prediction_logging') { should cmp 'true' }
  its('online_prediction_console_logging') { should cmp 'true' }
end

describe google_ml_engine_model(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_ml_engine_model` resource:

`name`
: The name specified for the model.

`description`
: The description specified for the model when it was created.

`default_version`
: The default version of the model. This version will be used to handle prediction requests that do not specify a version.

  `name`
  : The name specified for the version when it was created.

`regions`
: The list of regions where the model is going to be deployed. Currently only one region per model is supported

`online_prediction_logging`
: If true, online prediction access logs are sent to StackDriver Logging.

`online_prediction_console_logging`
: If true, online prediction nodes send stderr and stdout streams to Stackdriver Logging

`labels`
: One or more labels that you can add, to organize your models.

## GCP Permissions

Ensure the [Cloud ML](https://console.cloud.google.com/apis/library/ml.googleapis.com) is enabled for the current project.
