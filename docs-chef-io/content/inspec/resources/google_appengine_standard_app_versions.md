+++
title = "google_appengine_standard_app_versions resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_appengine_standard_app_versions"
    identifier = "inspec/resources/gcp/google_appengine_standard_app_versions.md google_appengine_standard_app_versions resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_appengine_standard_app_versions` is used to test a Google StandardAppVersion resource

## Examples

```ruby
describe google_appengine_standard_app_versions(project: 'chef-gcp-inspec', location: 'europe-west2',service: 'default') do
  its('runtimes') { should include 'nodejs10' }
end
```

## Properties

Properties that can be accessed from the `google_appengine_standard_app_versions` resource:

See the [google_appengine_standard_app_version](/inspec/resources/google_appengine_standard_app_version/#properties) resource for more information.

`names`
: an array of `google_appengine_standard_app_version` name

`version_ids`
: an array of `google_appengine_standard_app_version` version_id

`runtimes`
: an array of `google_appengine_standard_app_version` runtime

`threadsaves`
: an array of `google_appengine_standard_app_version` threadsafe

`instance_classes`
: an array of `google_appengine_standard_app_version` instance_class

`automatic_scalings`
: an array of `google_appengine_standard_app_version` automatic_scaling

`basic_scalings`
: an array of `google_appengine_standard_app_version` basic_scaling

`manual_scalings`
: an array of `google_appengine_standard_app_version` manual_scaling

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [App Engine Admin API](https://console.cloud.google.com/apis/library/appengine.googleapis.com/) is enabled for the current project.
