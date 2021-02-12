+++
title = "google_project_services resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_project_services"
    identifier = "inspec/resources/gcp/google_project_services.md google_project_services resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_project_services` is used to test a Google Service resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe.one do
  google_project_services(project: 'chef-gcp-inspec').names.each do |name|
    describe name do
      it { should match 'maps-android-backend.googleapis.com' }
    end
  end
end
```

## Properties

Properties that can be accessed from the `google_project_services` resource:

See the [google_project_service](/inspec/resources/google_project_service/#properties) resource for more information.

`names`
: an array of `google_project_service` name

`parents`
: an array of `google_project_service` parent

`states`
: an array of `google_project_service` state

`disable_dependent_services`
: an array of `google_project_service` disable_dependent_services

`configs`
: an array of `google_project_service` config

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Service Usage API](https://console.cloud.google.com/apis/library/serviceusage.googleapis.com/) is enabled for the current project.
