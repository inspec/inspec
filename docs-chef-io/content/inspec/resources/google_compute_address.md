+++
title = "google_compute_address resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_address"
    identifier = "inspec/resources/gcp/google_compute_address.md google_compute_address resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_address` is used to test a Google Address resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_address(project: 'chef-gcp-inspec', location: 'europe-west2', name: 'inspec-gcp-global-address') do
  it { should exist }
  its('address') { should eq '10.2.0.3' }
  its('address_type') { should eq 'INTERNAL' }
  its('user_count') { should eq 0 }
end

describe google_compute_address(project: 'chef-gcp-inspec', location: 'europe-west2', name: 'nonexistent') do
  it { should_not exist }
end
```

### Test that a GCP compute address IP exists

    describe google_compute_address(project: 'chef-inspec-gcp', location: 'europe-west2', name: 'compute-address') do
      its('address_ip_exists')  { should be true }
    end

### Test that a GCP compute address is in a particular status

    describe google_compute_address(project: 'chef-inspec-gcp', location: 'europe-west2', name: 'compute-address') do
      its('status') { should eq "IN_USE" }
    end

### Test that a GCP compute address IP has the expected number of users

    describe google_compute_address(project: 'chef-inspec-gcp', location: 'europe-west2', name: 'compute-address') do
      its('user_count') { should eq 1 }
    end

### Test that the first user of a GCP compute address has the expected resource name

    describe google_compute_address(project: 'chef-inspec-gcp', location: 'europe-west2', name: 'compute-address') do
      its('user_resource_name') { should eq "gcp_ext_vm_name" }
    end

## Properties

Properties that can be accessed from the `google_compute_address` resource:

`address`
: The static external IP address represented by this resource. Only IPv4 is supported. An address may only be specified for INTERNAL address types. The IP address must be inside the specified subnetwork, if any.

`address_type`
: The type of address to reserve.

  Possible values:

  - INTERNAL
  - EXTERNAL

`creation_timestamp`
: Creation timestamp in RFC3339 text format.

`description`
: An optional description of this resource.

`id`
: The unique identifier for the resource.

`name`
: Name of the resource. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

`purpose`
: The purpose of this resource, which can be one of the following values: - GCE_ENDPOINT for addresses that are used by VM instances, alias IP ranges, internal load balancers, and similar resources. This should only be set when using an Internal address.

  Possible values:

  - GCE_ENDPOINT

`network_tier`
: The networking tier used for configuring this address. If this field is not specified, it is assumed to be PREMIUM.

  Possible values:

  - PREMIUM
  - STANDARD

`subnetwork`
: The URL of the subnetwork in which to reserve the address. If an IP address is specified, it must be within the subnetwork's IP range. This field can only be used with INTERNAL type with GCE_ENDPOINT/DNS_RESOLVER purposes.

`users`
: The URLs of the resources that are using this address.

`labels`
: (Beta only) Labels to apply to this address. A list of key->value pairs.

`label_fingerprint`
: (Beta only) The fingerprint used for optimistic locking of this resource. Used internally during updates.

`status`
: The status of the address, which can be one of RESERVING, RESERVED, or IN_USE. An address that is RESERVING is currently in the process of being reserved. A RESERVED address is currently reserved and available to use. An IN_USE address is currently being used by another resource and is not available.

  Possible values:

  - RESERVING
  - RESERVED
  - IN_USE

`region`
: URL of the region where the regional address resides. This field is not applicable to global addresses.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
