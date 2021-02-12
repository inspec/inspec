+++
title = "google_compute_https_health_check resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_https_health_check"
    identifier = "inspec/resources/gcp/google_compute_https_health_check.md google_compute_https_health_check resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_https_health_check` is used to test a Google HttpsHealthCheck resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_https_health_check(project: 'chef-gcp-inspec', name: 'inspec-gcp-https-health-check') do
  it { should exist }
  its('timeout_sec') { should eq '15' }
  its('request_path') { should eq '/https_health_check' }
  its('check_interval_sec') { should eq '15' }
  its('unhealthy_threshold') { should eq '3' }
end

describe google_compute_https_health_check(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_https_health_check` resource:

`check_interval_sec`
: How often (in seconds) to send a health check. The default value is 5 seconds.

`creation_timestamp`
: Creation timestamp in RFC3339 text format.

`description`
: An optional description of this resource. Provide this property when you create the resource.

`healthy_threshold`
: A so-far unhealthy instance will be marked healthy after this many consecutive successes. The default value is 2.

`host`
: The value of the host header in the HTTPS health check request. If left empty (default value), the public IP on behalf of which this health check is performed will be used.

`id`
: The unique identifier for the resource. This identifier is defined by the server.

`name`
: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

`port`
: The TCP port number for the HTTPS health check request. The default value is 80.

`request_path`
: The request path of the HTTPS health check request. The default value is /.

`timeout_sec`
: How long (in seconds) to wait before claiming failure. The default value is 5 seconds. It is invalid for timeoutSec to have greater value than checkIntervalSec.

`unhealthy_threshold`
: A so-far healthy instance will be marked unhealthy after this many consecutive failures. The default value is 2.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
