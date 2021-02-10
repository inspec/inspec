+++
title = "google_compute_global_address resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_global_address"
    identifier = "inspec/resources/gcp/google_compute_global_address.md google_compute_global_address resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_global_address` is used to test a Google GlobalAddress resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_global_address(project: 'chef-gcp-inspec', name: 'inspec-gcp-global-address') do
  it { should exist }
  its('ip_version') { should eq 'IPV6' }
end

describe google_compute_global_address(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_global_address` resource:

`address`
: The static external IP address represented by this resource.

`creation_timestamp`
: Creation timestamp in RFC3339 text format.

`description`
: An optional description of this resource.

`id`
: The unique identifier for the resource. This identifier is defined by the server.

`name`
: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

`labels`
: (Beta only) Labels to apply to this address. A list of key->value pairs.

`label_fingerprint`
: (Beta only) The fingerprint used for optimistic locking of this resource. Used internally during updates.

`ip_version`
: The IP Version that will be used by this address. The default value is `IPV4`.

  Possible values:

  - IPV4
  - IPV6

`region`
: A reference to the region where the regional address resides.

`prefix_length`
: The prefix length of the IP range. If not present, it means the address field is a single IP address. This field is not applicable to addresses with addressType=EXTERNAL.

`address_type`
: The type of the address to reserve. _ EXTERNAL indicates public/external single IP address. _ INTERNAL indicates internal IP ranges belonging to some network.

  Possible values:

  - EXTERNAL
  - INTERNAL

`purpose`
: The purpose of the resource. For global internal addresses it can be _ VPC_PEERING - for peer networks This should only be set when using an Internal address.

  Possible values:

  - VPC_PEERING

`network`
: The URL of the network in which to reserve the IP range. The IP range must be in RFC1918 space. The network cannot be deleted if there are any reserved IP ranges referring to it. This should only be set when using an Internal address.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
