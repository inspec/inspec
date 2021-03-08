+++
title = "google_projects resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_projects"
    identifier = "inspec/resources/gcp/google_projects.md google_projects resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_projects` is used to test a Google Project resource

## Examples

```ruby
describe google_projects() do
  its('count') { should be >= 1 }
  its('project_ids') { should include 'chef-gcp-inspec' }
  its('lifecycle_states') { should include 'ACTIVE' }
end
```

### Test that there are no more than a specified number of projects available for the project

    describe google_projects do
      its('count') { should be <= 100}
    end

### Test that an expected named project is available

    describe google_projects do
      its('project_names'){ should include "GCP Project Name" }
    end

### Test that an expected project identifier is available

    describe google_projects do
      its('project_ids'){ should include "gcp_project_id" }
    end

### Test that an expected project number is available

    describe google_projects do
      its('project_numbers'){ should include 1122334455 }
    end

### Test that a particular subset of projects with id 'prod\*' are in ACTIVE lifecycle state

    google_projects.where(project_id: /^prod/).project_ids.each do |gcp_project_id|
      describe google_project(project: gcp_project_id) do
        it { should exist }
        its('lifecycle_state') { should eq "ACTIVE" }
      end
    end

### Test that a particular subset of ACTIVE projects with id 'prod\*' exist

    google_projects.where(project_id: /^prod/, lifecycle_state: 'ACTIVE').project_ids.each do |gcp_project_id|
      describe google_project(project: gcp_project_id) do
        it { should exist }
      end
    end

## Properties

Properties that can be accessed from the `google_projects` resource:

See the [google_project](/inspec/resources/google_project/#properties) resource for more information.

`project_numbers`
: an array of `google_project` number

`lifecycle_states`
: an array of `google_project` lifecycle_state

`project_names`
: an array of `google_project` name

`create_times`
: an array of `google_project` create_time

`labels`
: an array of `google_project` labels

`parents`
: an array of `google_project` parent

`project_ids`
: an array of `google_project` project_id

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Cloud Resource Manager API](https://console.cloud.google.com/apis/library/cloudresourcemanager.googleapis.com/) is enabled for the current project.
