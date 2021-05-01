---
title: About the google_compute_zone Resource
platform: gcp
---

# google\_logging\_project\_sink

Use the `google_logging_project_sink` InSpec audit resource to test properties of a single GCP logging project sink.

<br>

## Syntax

A `google_logging_project_sink` resource block declares the tests for a single GCP logging project sink by project and sink name.

    describe google_logging_project_sink(project: 'chef-inspec-gcp',  sink: 'sink-name-abcd') do
      it { should exist }
      its('name') { should eq 'sink-name-abcd' }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.


### Test that a GCP project logging sink destination is correct

    describe google_logging_project_sink(project: 'chef-inspec-gcp',  sink: 'sink-name-abcd') do
      its('destination') { should eq 'storage.googleapis.com/gcp-inspec-logging-bucket' }
    end

### Test that a GCP project logging sink filter is correct

    describe google_logging_project_sink(project: 'chef-inspec-gcp',  sink: 'sink-name-abcd') do
      its('filter') { should eq "resource.type = gce_instance AND resource.labels.instance_id = \"12345678910123123\"" }
    end

### Test a GCP project logging sink output version format

    describe google_logging_project_sink(project: 'chef-inspec-gcp',  sink: 'sink-name-abcd') do
      its('output_version_format') { should eq "V2" }
    end

### Test a GCP project logging sink writer identity is as expected

    describe google_logging_project_sink(project: 'chef-inspec-gcp',  sink: 'sink-name-abcd') do
      its('writer_identity') { should eq "serviceAccount:my-logging-service-account.iam.gserviceaccount.com" }
    end


<br>

## Properties

*  `destination`, `filter`, `name`, `output_version_format`, `writer_identity`

<br>


## GCP Permissions

Ensure the [Stackdriver Logging API](https://console.cloud.google.com/apis/api/logging.googleapis.com/) is enabled for the project.