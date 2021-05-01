---
title: About the google_dns_resource_record_set resource
platform: gcp
---

## Syntax
A `google_dns_resource_record_set` is used to test a Google ResourceRecordSet resource

## Examples
```
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

  * `name`: For example, www.example.com.

  * `type`: One of valid DNS resource types.

  * `ttl`: Number of seconds that this ResourceRecordSet can be cached by resolvers.

  * `target`: As defined in RFC 1035 (section 5) and RFC 1034 (section 3.6.1)

  * `managed_zone`: Identifies the managed zone addressed by this request. Can be the managed zone name or id.
