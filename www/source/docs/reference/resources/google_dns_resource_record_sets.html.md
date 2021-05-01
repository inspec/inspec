---
title: About the google_dns_resource_record_sets resource
platform: gcp
---

## Syntax
A `google_dns_resource_record_sets` is used to test a Google ResourceRecordSet resource

## Examples
```
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

See [google_dns_resource_record_set.md](google_dns_resource_record_set.md) for more detailed information
  * `names`: an array of `google_dns_resource_record_set` name
  * `types`: an array of `google_dns_resource_record_set` type
  * `ttls`: an array of `google_dns_resource_record_set` ttl
  * `targets`: an array of `google_dns_resource_record_set` target
  * `managed_zones`: an array of `google_dns_resource_record_set` managed_zone

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.
