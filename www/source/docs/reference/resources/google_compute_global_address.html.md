---
title: About the google_compute_global_address resource
platform: gcp
---

## Syntax
A `google_compute_global_address` is used to test a Google GlobalAddress resource

## Examples
```
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

  * `address`: The static external IP address represented by this resource.

  * `creation_timestamp`: Creation timestamp in RFC3339 text format.

  * `description`: An optional description of this resource. Provide this property when you create the resource.

  * `id`: The unique identifier for the resource. This identifier is defined by the server.

  * `name`: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035.  Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `ip_version`: The IP Version that will be used by this address. Valid options are IPV4 or IPV6. The default value is IPV4.

  * `region`: A reference to the region where the regional address resides.

  * `address_type`: The type of the address to reserve, default is EXTERNAL.  * EXTERNAL indicates public/external single IP address. * INTERNAL indicates internal IP ranges belonging to some network.
