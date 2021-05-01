---
title: About the google_logging_project_sinks Resource
platform: gcp
---

# google\_logging\_project\_sinks

Use the `google_logging_project_sinks` InSpec audit resource to test properties of all, or a filtered group of, GCP compute project logging sinks for a project.

<br>

## Syntax

A `google_logging_project_sinks` resource block collects GCP project logging sinks by project then tests that group.

    describe google_logging_project_sinks(project: 'chef-inspec-gcp') do
      it { should exist }
    end    

Use this InSpec resource to enumerate IDs then test in-depth using `google_logging_project_sink`.

    google_logging_project_sinks(project: 'chef-inspec-gcp').sink_names.each do |sink_name|
      describe google_logging_project_sink(project: 'chef-inspec-gcp',  sink: sink_name) do
        it { should exist }
      end
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that there are no more than a specified number of sinks available for the project

    describe google_logging_project_sinks(project: 'chef-inspec-gcp') do
      its('count') { should be <= 100}
    end

### Test that an expected sink name is available for the project

    describe google_logging_project_sinks(project: 'chef-inspec-gcp') do
      its('sink_names') { should include "my-sink" }
    end

### Test that an expected sink destination is available for the project

    describe google_logging_project_sinks(project: 'chef-inspec-gcp') do
      its('sink_destinations') { should include "storage.googleapis.com/a-logging-bucket" }
    end

### Test that a subset of all sinks matching "project*" have a particular writer identity 

    google_logging_project_sinks(project: 'chef-inspec-gcp').where(sink_name: /project/).sink_names.each do |sink_name|
      describe google_logging_project_sink(project: 'chef-inspec-gcp',  sink: sink_name) do
        its('writer_identity') { should eq "serviceAccount:my-logging-service-account.iam.gserviceaccount.com" }
      end
    end
    
<br>

## Filter Criteria

This resource supports the following filter criteria: `sink_name`; `sink_filter` and `sink_destination`. Any of these may be used with `where`, as a block or as a method.

## Properties

*  `sink_names` - an array of google_logging_project_sink name strings
*  `sink_destinations`- an array of google_logging_project_sink destinations
*  `sink_filters`- an array of google_logging_project_sink filters

<br>


## GCP Permissions

Ensure the [Stackdriver Logging API](https://console.cloud.google.com/apis/api/logging.googleapis.com/) is enabled for the project.