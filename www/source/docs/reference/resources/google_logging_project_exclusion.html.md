---
title: About the google_logging_project_exclusion Resource
platform: gcp
---

# google\_logging\_project\_exclusion

Use the `google_logging_project_exclusion` InSpec audit resource to test properties of a single GCP logging project exclusion.

<br>

## Syntax

A `google_logging_project_exclusion` resource block declares the tests for a single GCP logging project exclusion by project and exclusion name.

    describe google_logging_project_exclusion(project: 'chef-inspec-gcp',  exclusion: 'exclusion-name-abcd') do
      it { should exist }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that a GCP project logging exclusion name is as expected

    describe google_logging_project_exclusion(project: 'chef-inspec-gcp',  exclusion: 'exclusion-name-abcd') do
      its('name') { should eq 'exclusion-name-abcd' }
    end

### Test that a GCP project logging exclusion filter is set correctly

    describe google_logging_project_exclusion(project: 'chef-inspec-gcp',  exclusion: 'exclusion-name-abcd') do
      its('filter') { should eq 'resource.type = gce_instance AND severity <= DEBUG' }
    end

### Test that a GCP project logging exclusion description is as expected

    describe google_logging_project_exclusion(project: 'chef-inspec-gcp',  exclusion: 'exclusion-name-abcd') do
      its('description') { should eq 'Exclude GCE instance debug logs' }
    end

<br>

## Properties

*  `description`, `filter`, `name`

<br>


## GCP Permissions

Ensure the [Stackdriver Logging API](https://console.cloud.google.com/apis/api/logging.googleapis.com/) is enabled for the project.