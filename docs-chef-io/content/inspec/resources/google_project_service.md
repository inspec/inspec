+++
title = "google_project_service resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_project_service"
    identifier = "inspec/resources/gcp/google_project_service.md google_project_service resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_project_service` is used to test a Google Service resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_project_service(project: 'chef-gcp-inspec', name: 'maps-android-backend.googleapis.com') do
  it { should exist }
  its('state') { should cmp "ENABLED" }
end
```

## Properties

Properties that can be accessed from the `google_project_service` resource:

`name`
: The resource name of the service

`parent`
: The name of the parent of this service. For example 'projects/123'

`state`
: Whether or not the service has been enabled for use by the consumer.

  Possible values:

  - STATE_UNSPECIFIED
  - DISABLED
  - ENABLED

`disable_dependent_services`
: Indicates if dependent services should also be disabled. Can only be turned on if service is disabled.

`config`
: The service configuration of the available service.

  `name`
  : The DNS address at which this service is available.

  `title`
  : The product title for this service

  `apis`
  : The list of API interfaces exported by this service.

    `name`
    : Name of the API

    `version`
    : The version of the API

## GCP Permissions

Ensure the [Service Usage API](https://console.cloud.google.com/apis/library/serviceusage.googleapis.com/) is enabled for the current project.
