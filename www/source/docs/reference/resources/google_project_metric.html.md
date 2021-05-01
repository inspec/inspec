---
title: About the google_project_metric Resource
platform: gcp
---

# google\_project\_metric

Use the `google_project_metric` InSpec audit resource to test properties of a single GCP project metric.

<br>

## Syntax

A `google_project_metric` resource block declares the tests for a single GCP zone by project and name.

    describe google_project_metric(project: 'chef-inspec-gcp',  metric: 'metric_name') do
      it { should exist }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that a GCP project metric exists

    describe google_project_metric(project: 'chef-inspec-gcp',  metric: 'metric_name') do
      it { should exist }
    end

### Test that a GCP compute zone has an expected CPU platform

    describe google_project_metric(project: 'chef-inspec-gcp',  metric: 'metric_name') do
      its('filter') { should eq "(protoPayload.serviceName=\"cloudresourcemanager.googleapis.com\")" }
    end

<br>

## Properties

*  `filter`, `name`, `metric_descriptor`

<br>


## GCP Permissions

Ensure the [Stackdriver Logging API](https://console.cloud.google.com/apis/api/logging.googleapis.com/) is enabled for the project.