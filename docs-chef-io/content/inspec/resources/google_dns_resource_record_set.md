+++
title = "google_dns_resource_record_set resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_dns_resource_record_set"
    identifier = "inspec/resources/gcp/google_dns_resource_record_set.md google_dns_resource_record_set resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_dns_resource_record_set` is used to test a Google ResourceRecordSet resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_dns_resource_record_set(project: 'chef-gcp-inspec', name: 'backend.my.domain.com.', type: 'A', managed_zone: 'inspec-gcp-managed-zone') do
  it { should exist }
  its('type') { should eq 'A' }
  its('ttl') { should eq '300' }
  its('target') { should include '8.8.8.8' }
  its('target') { should include '8.8.4.4' }
end
```

## Properties

Properties that can be accessed from the `google_dns_resource_record_set` resource:

`name`
: For example, `www.example.com`.

`type`
: One of valid DNS resource types.

  Possible values:

  - A
  - AAAA
  - CAA
  - CNAME
  - MX
  - NAPTR
  - NS
  - PTR
  - SOA
  - SPF
  - SRV
  - TLSA
  - TXT

`ttl`
: Number of seconds that this ResourceRecordSet can be cached by resolvers.

`target`
: As defined in RFC 1035 (section 5) and RFC 1034 (section 3.6.1)

`managed_zone`
: Identifies the managed zone addressed by this request.

## GCP Permissions

Ensure the [Google Cloud DNS API](https://console.cloud.google.com/apis/library/dns.googleapis.com/) is enabled for the current project.
