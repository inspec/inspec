+++
title = "google_compute_target_https_proxy resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_target_https_proxy"
    identifier = "inspec/resources/gcp/google_compute_target_https_proxy.md google_compute_target_https_proxy resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_target_https_proxy` is used to test a Google TargetHttpsProxy resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_target_https_proxy(project: 'chef-gcp-inspec', name: 'inspec-gcp-https-proxy') do
  it { should exist }
  its('url_map') { should match /\/inspec-gcp-url-map$/ }
  its('description') { should eq 'A HTTPS target proxy' }
end

describe google_compute_target_https_proxy(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_target_https_proxy` resource:

`creation_timestamp`
: Creation timestamp in RFC3339 text format.

`description`
: An optional description of this resource.

`id`
: The unique identifier for the resource.

`name`
: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

`quic_override`
: Specifies the QUIC override policy for this resource. This determines whether the load balancer will attempt to negotiate QUIC with clients or not. Can specify one of NONE, ENABLE, or DISABLE. If NONE is specified, uses the QUIC policy with no user overrides, which is equivalent to DISABLE.

  Possible values:

  - NONE
  - ENABLE
  - DISABLE

`ssl_certificates`
: A list of SslCertificate resources that are used to authenticate connections between users and the load balancer. At least one SSL certificate must be specified.

`ssl_policy`
: A reference to the SslPolicy resource that will be associated with the TargetHttpsProxy resource. If not set, the TargetHttpsProxy resource will not have any SSL policy configured.

`url_map`
: A reference to the UrlMap resource that defines the mapping from URL to the BackendService.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
