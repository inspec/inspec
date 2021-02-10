+++
title = "google_compute_ssl_policy resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_ssl_policy"
    identifier = "inspec/resources/gcp/google_compute_ssl_policy.md google_compute_ssl_policy resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_ssl_policy` is used to test a Google SslPolicy resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_ssl_policy(project: 'chef-gcp-inspec', name: 'inspec-gcp-ssl-policy') do
  it { should exist }
  its('min_tls_version') { should eq 'TLS_1_2' }
  its('profile') { should eq 'CUSTOM' }
  its('custom_features') { should include 'TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384' }
  its('custom_features') { should include 'TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384' }
end

describe google_compute_ssl_policy(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_ssl_policy` resource:

`creation_timestamp`
: Creation timestamp in RFC3339 text format.

`description`
: An optional description of this resource.

`id`
: The unique identifier for the resource.

`name`
: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

`profile`
: Profile specifies the set of SSL features that can be used by the load balancer when negotiating SSL with clients. If using `CUSTOM`, the set of SSL features to enable must be specified in the `customFeatures` field.

  Possible values:

  - COMPATIBLE
  - MODERN
  - RESTRICTED
  - CUSTOM


`min_tls_version`
: The minimum version of SSL protocol that can be used by the clients to establish a connection with the load balancer.

  Possible values:

  - TLS_1_0
  - TLS_1_1
  - TLS_1_2

`enabled_features`
: The list of features enabled in the SSL policy.

`custom_features`
: A list of features enabled when the selected profile is CUSTOM. The method returns the set of features that can be specified in this list. This field must be empty if the profile is not CUSTOM.

`fingerprint`
: Fingerprint of this resource. A hash of the contents stored in this object. This field is used in optimistic locking.

`warnings`
: If potential misconfigurations are detected for this SSL policy, this field will be populated with warning messages.

`code`
: A warning code, if applicable.

`message`
: A human-readable description of the warning code.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
