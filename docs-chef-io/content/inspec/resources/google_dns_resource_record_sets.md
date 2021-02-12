+++
title = "google_dns_resource_record_sets resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_dns_resource_record_sets"
    identifier = "inspec/resources/gcp/google_dns_resource_record_sets.md google_dns_resource_record_sets resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_dns_resource_record_sets` is used to test a Google ResourceRecordSet resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_dns_resource_record_sets(project: 'chef-gcp-inspec', name: 'backend.my.domain.com.', managed_zone: 'inspec-gcp-managed-zone') do
  its('count') { should eq 3 }
  its('types') { should include 'A' }
  its('ttls') { should include '300' }
  its('targets.flatten') { should include '8.8.8.8' }
  its('targets.flatten') { should include '8.8.4.4' }
end
```

## Properties

Properties that can be accessed from the `google_dns_resource_record_sets` resource:

See the [google_dns_resource_record_set](/inspec/resources/google_dns_resource_record_set/#properties) resource for more information.

`names`
: an array of `google_dns_resource_record_set` name

`types`
: an array of `google_dns_resource_record_set` type

`ttls`
: an array of `google_dns_resource_record_set` ttl

`targets`
: an array of `google_dns_resource_record_set` target

`managed_zones`
: an array of `google_dns_resource_record_set` managed_zone

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Google Cloud DNS API](https://console.cloud.google.com/apis/library/dns.googleapis.com/) is enabled for the current project.
