+++
title = "google_cloud_scheduler_job resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_cloud_scheduler_job"
    identifier = "inspec/resources/gcp/google_cloud_scheduler_job.md google_cloud_scheduler_job resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_cloud_scheduler_job` is used to test a Google Job resource

## Examples

```ruby
describe google_cloud_scheduler_job(project: 'chef-gcp-inspec', region: us-central1, name: 'job-name') do
  it { should exist }

  its('description') { should cmp 'A description' }
  its('schedule') { should cmp '*/8 * * * *' }
  its('time_zone') { should cmp 'America/New_York' }
  its('http_target.http_method') { should cmp 'POST' }
  its('http_target.uri') { should cmp 'https://example.com/ping' }
end
```

## Properties

Properties that can be accessed from the `google_cloud_scheduler_job` resource:

`name`
: The name of the job.

`description`
: A human-readable description for the job. This string must not contain more than 500 characters.

`schedule`
: Describes the schedule on which the job will be executed.

`time_zone`
: Specifies the time zone to be used in interpreting schedule. The value of this field must be a time zone name from the tz database.

`attempt_deadline`
: The deadline for job attempts. If the request handler does not respond by this deadline then the request is cancelled and the attempt is marked as a DEADLINE_EXCEEDED failure. The failed attempt can be viewed in execution logs. Cloud Scheduler will retry the job according to the RetryConfig. The allowed duration for this deadline is: For HTTP targets, between 15 seconds and 30 minutes, for App Engine HTTP targets, between 15 seconds and 24 hours. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s"

`retry_config`
: By default, if a job does not complete successfully, meaning that an acknowledgement is not received from the handler, then it will be retried with exponential backoff according to the settings

`retry_count`
: The number of attempts that the system will make to run a job using the exponential backoff procedure described by maxDoublings. Values greater than 5 and negative values are not allowed.

`max_retry_duration`
: The time limit for retrying a failed job, measured from time when an execution was first attempted. If specified with retryCount, the job will be retried until both limits are reached. A duration in seconds with up to nine fractional digits, terminated by 's'.

`min_backoff_duration`
: The minimum amount of time to wait before retrying a job after it fails. A duration in seconds with up to nine fractional digits, terminated by 's'.

`max_backoff_duration`
: The maximum amount of time to wait before retrying a job after it fails. A duration in seconds with up to nine fractional digits, terminated by 's'.

`max_doublings`
: The time between retries will double maxDoublings times. A job's retry interval starts at minBackoffDuration, then doubles maxDoublings times, then increases linearly, and finally retries retries at intervals of maxBackoffDuration up to retryCount times.

`pubsub_target`
: Pub/Sub target If the job providers a Pub/Sub target the cron will publish a message to the provided topic

`topic_name`
: The full resource name for the Cloud Pub/Sub topic to which messages will be published when a job is delivered.

  {{< note spaces=2 >}}
  The topic name must be in the same format as required by PubSub's PublishRequest.name, e.g. `projects/my-project/topics/my-topic`.
  {{< /note >}}

`data`
: The message payload for PubsubMessage. Pubsub message must contain either non-empty data, or at least one attribute.

`attributes`
: Attributes for PubsubMessage. Pubsub message must contain either non-empty data, or at least one attribute.

`app_engine_http_target`
: App Engine HTTP target. If the job providers a App Engine HTTP target the cron will send a request to the service instance

`http_method`
: Which HTTP method to use for the request.

`app_engine_routing`
: App Engine Routing setting for the job.

  `service`
  : App service. By default, the job is sent to the service which is the default service when the job is attempted.

  `version`
  : App version. By default, the job is sent to the version which is the default version when the job is attempted.

  `instance`
  : App instance. By default, the job is sent to an instance which is available when the job is attempted.

`relative_uri`
: The relative URI. The relative URL must begin with "/" and must be a valid HTTP relative URL. It can contain a path, query string arguments, and \# fragments. If the relative URL is empty, then the root path "/" will be used. No spaces are allowed, and the maximum length allowed is 2083 characters

`body`
: HTTP request body. A request body is allowed only if the HTTP method is POST or PUT. It will result in invalid argument error to set a body on a job with an incompatible HttpMethod.

`headers`
: HTTP request headers. This map contains the header field names and values. Headers can be set when the job is created.

`http_target`
: HTTP target. If the job providers a http_target the cron will send a request to the targeted url

`uri`
: The full URI path that the request will be sent to.

`http_method`
: Which HTTP method to use for the request.

`body`
: HTTP request body. A request body is allowed only if the HTTP method is POST, PUT, or PATCH. It is an error to set body on a job with an incompatible HttpMethod.

`headers`
: This map contains the header field names and values. Repeated headers are not supported, but a header value can contain commas.

`oauth_token`
: Contains information needed for generating an OAuth token. This type of authorization should be used when sending requests to a GCP endpoint.

  `service_account_email`
  : Service account email to be used for generating OAuth token. The service account must be within the same project as the job.

  `scope`
  : OAuth scope to be used for generating OAuth access token. If not specified, "https://www.googleapis.com/auth/cloud-platform" will be used.

`oidc_token`
: Contains information needed for generating an OpenID Connect token. This type of authorization should be used when sending requests to third party endpoints or Cloud Run.

`service_account_email`
: Service account email to be used for generating OAuth token. The service account must be within the same project as the job.

  `audience`
  : Audience to be used when generating OIDC token. If not specified, the URI specified in target will be used.

`region`
: Region where the scheduler job resides

## GCP Permissions
