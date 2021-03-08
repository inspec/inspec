+++
title = "google_logging_project_exclusion resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_logging_project_exclusion"
    identifier = "inspec/resources/gcp/google_logging_project_exclusion.md google_logging_project_exclusion resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_logging_project_exclusion` is used to test a Google ProjectExclusion resource

## Examples

```ruby

describe google_logging_project_exclusion(project: 'chef-gcp-inspec', name: 'inspec-project-exclusion') do
	it { should exist }
  its('description'){ should cmp 'My project exclusion description' }
  its('filter'){ should cmp 'resource.type = gce_instance AND severity <= DEBUG' }
end

describe google_logging_project_exclusion(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

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

## Properties

Properties that can be accessed from the `google_logging_project_exclusion` resource:

`project`
: Id of the project that this exclusion applies to.

`name`
: Name of the exclusion, specified by the server during create.

`description`
: A user provided description of this exclusion.

`filter`
: An advanced logs filter. The only exported log entries are those that are in the resource owning the sink and that match the filter.

`disabled`
: If set to true then this exclusion is disabled and it does not exclude any log entries.

## GCP Permissions

Ensure the [Stackdriver Logging API](https://console.cloud.google.com/apis/library/logging.googleapis.com/) is enabled for the current project.
