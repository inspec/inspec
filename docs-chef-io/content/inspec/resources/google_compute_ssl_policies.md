+++
title = "google_compute_ssl_policies resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_ssl_policies"
    identifier = "inspec/resources/gcp/google_compute_ssl_policies.md google_compute_ssl_policies resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_ssl_policies` is used to test a Google SslPolicy resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_ssl_policies(project: 'chef-gcp-inspec') do
  it { should exist }
  its('names') { should include 'inspec-gcp-ssl-policy' }
  its('profiles') { should include 'CUSTOM' }
  its('count') { should eq 1 }
end

google_compute_ssl_policies(project: 'chef-gcp-inspec').names.each do |policy_name|
  describe google_compute_ssl_policy(project: 'chef-gcp-inspec', name: policy_name) do
    its('min_tls_version') { should eq 'TLS_1_2' }
  end
end
```

## Properties

Properties that can be accessed from the `google_compute_ssl_policies` resource:

See the [google_compute_ssl_policy](/inspec/resources/google_compute_ssl_policy/#properties) resource for more information.

`creation_timestamps`
: an array of `google_compute_ssl_policy` creation_timestamp

`descriptions`
: an array of `google_compute_ssl_policy` description

`ids`
: an array of `google_compute_ssl_policy` id

`names`
: an array of `google_compute_ssl_policy` name

`profiles`
: an array of `google_compute_ssl_policy` profile

`min_tls_versions`
: an array of `google_compute_ssl_policy` min_tls_version

`enabled_features`
: an array of `google_compute_ssl_policy` enabled_features

`custom_features`
: an array of `google_compute_ssl_policy` custom_features

`fingerprints`
: an array of `google_compute_ssl_policy` fingerprint

`warnings`
: an array of `google_compute_ssl_policy` warnings

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
