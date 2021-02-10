+++
title = "google_appengine_standard_app_version resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_appengine_standard_app_version"
    identifier = "inspec/resources/gcp/google_appengine_standard_app_version.md google_appengine_standard_app_version resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_appengine_standard_app_version` is used to test a Google StandardAppVersion resource

## Examples

```ruby
describe google_appengine_standard_app_version(project: 'chef-gcp-inspec', location: 'europe-west2', version_id: 'v2', service: 'default') do
  it { should exist }
  its('version_id') { should eq 'v2' }
  its('runtime') { should eq 'nodejs10' }
end
```

## Properties

Properties that can be accessed from the `google_appengine_standard_app_version` resource:

`name`
: Full path to the Version resource in the API. Example, "v1".

`version_id`
: Relative name of the version within the service. For example, `v1`. Version names can contain only lowercase letters, numbers, or hyphens. Reserved names,"default", "latest", and any name with the prefix "ah-".

`runtime`
: Desired runtime. Example python27.

`threadsafe`
: Whether multiple requests can be dispatched to this version at once.

`instance_class`
: Instance class that is used to run this version. Valid values are AutomaticScaling: F1, F2, F4, F4_1G BasicScaling or ManualScaling: B1, B2, B4, B4_1G, B8 Defaults to F1 for AutomaticScaling and B2 for ManualScaling and BasicScaling. If no scaling is specified, AutomaticScaling is chosen.

`automatic_scaling`
: Automatic scaling is based on request rate, response latencies, and other application metrics.

`max_concurrent_requests`
: Number of concurrent requests an automatic scaling instance can accept before the scheduler spawns a new instance. Defaults to a runtime-specific value.

`max_idle_instances`
: Maximum number of idle instances that should be maintained for this version.

`max_pending_latency`
: Maximum amount of time that a request should wait in the pending queue before starting a new instance to handle it. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s".

`min_idle_instances`
: Minimum number of idle instances that should be maintained for this version. Only applicable for the default version of a service.

`min_pending_latency`
: Minimum amount of time a request should wait in the pending queue before starting a new instance to handle it. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s".

`standard_scheduler_settings`
: Scheduler settings for standard environment.

  `target_cpu_utilization`
  : Target CPU utilization ratio to maintain when scaling. Should be a value in the range [0.50, 0.95], zero, or a negative value.

  `target_throughput_utilization`
  : Target throughput utilization ratio to maintain when scaling. Should be a value in the range [0.50, 0.95], zero, or a negative value.

  `min_instances`
  : Minimum number of instances to run for this version. Set to zero to disable minInstances configuration.

  `max_instances`
  : Maximum number of instances to run for this version. Set to zero to disable maxInstances configuration.

`basic_scaling`
: Basic scaling creates instances when your application receives requests. Each instance will be shut down when the application becomes idle. Basic scaling is ideal for work that is intermittent or driven by user activity.

`idle_timeout`
: Duration of time after the last request that an instance must wait before the instance is shut down. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". Defaults to 900s.

`max_instances`
: Maximum number of instances to create for this version. Must be in the range [1.0, 200.0].

`manual_scaling`
: A service with manual scaling runs continuously, allowing you to perform complex initialization and rely on the state of its memory over time.

`instances`
: Number of instances to assign to the service at the start. **Note:** When managing the number of instances at runtime through the App Engine Admin API or the (now deprecated) Python 2 Modules API set_num_instances() you must use `lifecycle.ignore_changes = ["manual_scaling"[0].instances]` to prevent drift detection.

## GCP Permissions

Ensure the [App Engine Admin API](https://console.cloud.google.com/apis/library/appengine.googleapis.com/) is enabled for the current project.
