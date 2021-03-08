+++
title = "google_cloudfunctions_cloud_function resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_cloudfunctions_cloud_function"
    identifier = "inspec/resources/gcp/google_cloudfunctions_cloud_function.md google_cloudfunctions_cloud_function resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_cloudfunctions_cloud_function` is used to test a Google CloudFunction resource

## Examples

```ruby
describe google_cloudfunctions_cloud_function(project: 'chef-gcp-inspec', location: 'europe-west1', name: 'inspec-gcp-function') do
  it { should exist }
  its('description') { should eq 'A description of the function' }
  its('available_memory_mb') { should eq '128' }
  its('https_trigger.url') { should match /\/inspec-gcp-function$/ }
  its('entry_point') { should eq 'hello' }
  its('environment_variables') { should include('MY_ENV_VAR' => 'val1') }
end

describe google_cloudfunctions_cloud_function(project: 'chef-gcp-inspec', location: 'europe-west1', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_cloudfunctions_cloud_function` resource:

`name`
: A user-defined name of the function. Function names must be unique globally and match pattern `projects/*/locations/*/functions/*`.

`description`
: User-provided description of a function.

`status`
: Status of the function deployment.

  Possible values:

  - CLOUD_FUNCTION_STATUS_UNSPECIFIED
  - ACTOVE
  - OFFLINE
  - DEPLOY_IN_PROGRESS
  - DELETE_IN_PROGRESS
  - UNKNOWN

`entry_point`
: The name of the function (as defined in source code) that will be executed. Defaults to the resource name suffix, if not specified. For backward compatibility, if function with given name is not found, then the system will try to use function named "function". For Node.js this is name of a function exported by the module specified in source_location.

`runtime`
: The runtime in which the function is going to run. If empty, defaults to Node.js 6.

`timeout`
: The function execution timeout. Execution is considered failed and can be terminated if the function is not completed at the end of the timeout period. Defaults to 60 seconds.

`available_memory_mb`
: The amount of memory in MB available for a function.

`service_account_email`
: The email of the service account for this function.

`update_time`
: The last update timestamp of a Cloud Function

`version_id`
: The version identifier of the Cloud Function. Each deployment attempt results in a new version of a function being created.

`labels`
: A set of key/value label pairs associated with this Cloud Function.

`environment_variables`
: Environment variables that shall be available during function execution.

`source_archive_url`
: The Google Cloud Storage URL, starting with gs://, pointing to the zip archive which contains the function.

`source_upload_url`
: The Google Cloud Storage signed URL used for source uploading.

`source_repository`
: The source repository where a function is hosted.

  `url`
  : The URL pointing to the hosted repository where the function is defined

  `deployed_url`
  : The URL pointing to the hosted repository where the function were defined at the time of deployment.

`https_trigger`
: An HTTPS endpoint type of source that can be triggered via URL.

  `url`
  : The deployed url for the function.

`event_trigger`
: An HTTPS endpoint type of source that can be triggered via URL.

  `event_type`
  : The type of event to observe. For example: `providers/cloud.storage/eventTypes/object.change` and `providers/cloud.pubsub/eventTypes/topic.publish`.

  `resource`
  : The resource(s) from which to observe events, for example, `projects/_/buckets/myBucket.`

  `service`
  : The hostname of the service that should be observed.

`location`
: The location of this cloud function.

## GCP Permissions

Ensure the [Cloud Functions API](https://console.cloud.google.com/apis/library/cloudfunctions.googleapis.com/) is enabled for the current project.
