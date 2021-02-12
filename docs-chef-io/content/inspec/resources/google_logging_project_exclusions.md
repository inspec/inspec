+++
title = "google_logging_project_exclusions resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_logging_project_exclusions"
    identifier = "inspec/resources/gcp/google_logging_project_exclusions.md google_logging_project_exclusions resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_logging_project_exclusions` is used to test a Google ProjectExclusion resource

## Examples

```ruby

describe google_logging_project_exclusions(project: 'chef-gcp-inspec') do
  its('names'){ should include 'inspec-folder-exclusion' }
end
```

## Properties

Properties that can be accessed from the `google_logging_project_exclusions` resource:

See the [google_logging_project_exclusion](/inspec/resources/google_logging_project_exclusion/#properties) resource for more information.

`projects`
: an array of `google_logging_project_exclusion` project

`names`
: an array of `google_logging_project_exclusion` name

`descriptions`
: an array of `google_logging_project_exclusion` description

`filters`
: an array of `google_logging_project_exclusion` filter

`disableds`
: an array of `google_logging_project_exclusion` disabled

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Stackdriver Logging API](https://console.cloud.google.com/apis/library/logging.googleapis.com/) is enabled for the current project.
