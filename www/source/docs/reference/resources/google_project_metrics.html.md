---
title: About the google_project_metrics Resource
platform: gcp
---

# google\_project\_metrics

Use the `google_project_metrics` InSpec audit resource to test properties of all, or a filtered group of, GCP project metrics.

<br>

## Syntax

A `google_project_metrics` resource block collects GCP project logging sinks by project then tests that group.

    describe google_project_metrics(project: 'chef-inspec-gcp') do
      it { should exist }
    end    

Use this InSpec resource to enumerate IDs then test in-depth using `google_project_metric`.

    google_project_metrics(project: 'chef-inspec-gcp').sink_names.each do |metric_name|
      describe google_project_metric(project: 'chef-inspec-gcp',  metric: metric_name) do
        it { should exist }
      end
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that there are no more than a specified number of metrics available for the project

    describe google_project_metrics(project: 'chef-inspec-gcp') do
      its('count') { should be <= 100}
    end

### Test that an expected metric name is available for the project

    describe google_project_metrics(project: 'chef-inspec-gcp') do
      its('metric_names') { should include "metric-name" }
    end

### Test that a subset of all metrics with name matching "*project*" have a particular writer identity 

    google_project_metrics(project: 'chef-inspec-gcp').where(metric_name: /project/).metric_names.each do |metric_name|
      describe google_project_metric(project: 'chef-inspec-gcp',  metric: metric_name) do
        its('filter') { should eq "(protoPayload.serviceName=\"cloudresourcemanager.googleapis.com\")" }
      end
    end
    
<br>

## Filter Criteria

This resource supports the following filter criteria: `metric_name`; `metric_type` and `metric_filter`. Either of these may be used with `where`, as a block or as a method.

## Properties

*  `metric_names` - an array of google_project_metric name strings
*  `metric_filters`- an array of google_project_metric filter strings
*  `metric_types` - an array of google_project_metric type strings

<br>


## GCP Permissions

Ensure the [Stackdriver Logging API](https://console.cloud.google.com/apis/api/logging.googleapis.com/) is enabled for the project.