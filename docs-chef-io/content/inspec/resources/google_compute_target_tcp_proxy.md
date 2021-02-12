+++
title = "google_compute_target_tcp_proxy resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_target_tcp_proxy"
    identifier = "inspec/resources/gcp/google_compute_target_tcp_proxy.md google_compute_target_tcp_proxy resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_target_tcp_proxy` is used to test a Google TargetTcpProxy resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_target_tcp_proxy(project: 'chef-gcp-inspec', name: 'inspec-gcp-target-tcp-proxy') do
  it { should exist }
  its('proxy_header') { should eq 'NONE' }
  its('service') { should  match /\/gcp-inspec-tcp-backend-service$/ }
end

describe google_compute_target_tcp_proxy(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_target_tcp_proxy` resource:

`creation_timestamp`
: Creation timestamp in RFC3339 text format.

`description`
: An optional description of this resource.

`id`
: The unique identifier for the resource.

`name`
: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

`proxy_header`
: Specifies the type of proxy header to append before sending data to the backend.

  Possible values:

  - NONE
  - PROXY_V1

`service`
: A reference to the BackendService resource.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
