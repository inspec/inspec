---
title: About the google_project Resource
platform: gcp
---

# google\_project

Use the `google_project` InSpec audit resource to test properties of a GCP project.  

<br>

## Syntax

Google projects have a name, ID and number as described [here](https://cloud.google.com/resource-manager/docs/creating-managing-projects#identifying_projects).

A `google_project` resource block declares the tests for a single GCP project identified by `project_id` or `project_number`:

    describe google_project(project: 'chef-inspec-gcp') do
      it { should exist }
      its('name') { should eq 'chef-inspec-gcp'  }
      its('project_number') { should eq 12345678 }
    end

    describe google_project(project: 12345678) do
      it { should exist }
      its('name') { should eq 'chef-inspec-gcp'  }
      its('project_number') { should eq 12345678 }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that a GCP project has the expected project number

    describe google_project(project: 'chef-inspec-gcp') do
      its('project_number') { should eq 12345678 }
    end

### Test that a GCP project has the expected lifecycle state e.g. "ACTIVE"

    describe google_project(project: 'chef-inspec-gcp') do
      its('lifecycle_state') { should eq "ACTIVE" }
    end

### Validate that a GCP project has some arbitrary label with expected content (for example defined by regexp )

    describe google_project(project: 'chef-inspec-gcp').label_value_by_key('season') do
      it {should match '^(winter|spring|summer|autumn)$' }
    end

<br>

## Properties

*  `create_time`, `lifecycle_state`, `name`, `parent`, `project_id`, `project_number`, `label_value_by_key`

<br>


## GCP Permissions

Ensure the [Cloud Resource Manager API](https://console.cloud.google.com/apis/library/cloudresourcemanager.googleapis.com/) is enabled for the project.