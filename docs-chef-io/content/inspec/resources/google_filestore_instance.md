+++
title = "google_filestore_instance resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_filestore_instance"
    identifier = "inspec/resources/gcp/google_filestore_instance.md google_filestore_instance resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_filestore_instance` is used to test a Google Instance resource

## Examples

```ruby
describe google_filestore_instance(project: 'chef-gcp-inspec', zone: 'us-central1-b', name: 'inspecgcp') do
  it { should exist }
  its('tier') { should cmp 'PREMIUM' }
  its('file_shares.count') { should cmp 1 }
  its('file_shares.first.capacity_gb') { should cmp '2660' }
  its('file_shares.first.name') { should cmp 'inspecgcp' }
  its('networks.count') { should cmp 1 }
  its('networks.first.network') { should cmp 'default' }
  its('networks.first.modes') { should include 'MODE_IPV4' }
end

describe google_filestore_instance(project: 'chef-gcp-inspec', zone: 'us-central1-b', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_filestore_instance` resource:

`name`
: The resource name of the instance.

`description`
: A description of the instance.

`create_time`
: Creation timestamp in RFC3339 text format.

`tier`
: The service tier of the instance.

  Possible values:

  - TIER_UNSPECIFIED
  - STANDARD
  - PREMIUM

`labels`
: Resource labels to represent user-provided metadata.

`file_shares`
: File system shares on the instance. For this version, only a single file share is supported.

  `name`
  : The name of the fileshare (16 characters or less)

  `capacity_gb`
  : File share capacity in GiB. This must be at least 1024 GiB for the standard tier, or 2560 GiB for the premium tier.

`networks`
: VPC networks to which the instance is connected. For this version, only a single network is supported.

  `network`
  : The name of the GCE VPC network to which the instance is connected.

  `modes`
  : IP versions for which the instance has IP addresses assigned.

  `reserved_ip_range`
  : A /29 CIDR block that identifies the range of IP addresses reserved for this instance.

  `ip_addresses`
  : A list of IPv4 or IPv6 addresses.

`etag`
: Server-specified ETag for the instance resource to prevent simultaneous updates from overwriting each other.

`zone`
: The name of the Filestore zone of the instance.

## GCP Permissions
