+++
title = "google_cloudfunctions_cloud_functions resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_cloudfunctions_cloud_functions"
    identifier = "inspec/resources/gcp/google_cloudfunctions_cloud_functions.md google_cloudfunctions_cloud_functions resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_cloudfunctions_cloud_functions` is used to test a Google CloudFunction resource

## Examples

```ruby
describe google_cloudfunctions_cloud_functions(project: 'chef-gcp-inspec', location: 'europe-west1') do
  its('descriptions') { should include 'A description of the function' }
  its('entry_points') { should include 'hello' }
end
```

## Properties

Properties that can be accessed from the `google_cloudfunctions_cloud_functions` resource:

See the [google_cloudfunctions_cloud_function](/inspec/resources/google_cloudfunctions_cloud_function/#properties) resource for more information.

`names`
: an array of `google_cloudfunctions_cloud_function` name

`descriptions`
: an array of `google_cloudfunctions_cloud_function` description

`statuses`
: an array of `google_cloudfunctions_cloud_function` status

`entry_points`
: an array of `google_cloudfunctions_cloud_function` entry_point

`runtimes`
: an array of `google_cloudfunctions_cloud_function` runtime

`timeouts`
: an array of `google_cloudfunctions_cloud_function` timeout

`available_memory_mbs`
: an array of `google_cloudfunctions_cloud_function` available_memory_mb

`service_account_emails`
: an array of `google_cloudfunctions_cloud_function` service_account_email

`update_times`
: an array of `google_cloudfunctions_cloud_function` update_time

`version_ids`
: an array of `google_cloudfunctions_cloud_function` version_id

`labels`
: an array of `google_cloudfunctions_cloud_function` labels

`environment_variables`
: an array of `google_cloudfunctions_cloud_function` environment_variables

`source_archive_urls`
: an array of `google_cloudfunctions_cloud_function` source_archive_url

`source_upload_urls`
: an array of `google_cloudfunctions_cloud_function` source_upload_url

`source_repositories`
: an array of `google_cloudfunctions_cloud_function` source_repository

`https_triggers`
: an array of `google_cloudfunctions_cloud_function` https_trigger

`event_triggers`
: an array of `google_cloudfunctions_cloud_function` event_trigger

`locations`
: an array of `google_cloudfunctions_cloud_function` location

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Cloud Functions API](https://console.cloud.google.com/apis/library/cloudfunctions.googleapis.com/) is enabled for the current project.
