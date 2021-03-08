+++
title = "google_kms_key_rings resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_kms_key_rings"
    identifier = "inspec/resources/gcp/google_kms_key_rings.md google_kms_key_rings resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_kms_key_rings` is used to test a Google KeyRing resource

## Examples

```ruby
describe google_kms_key_rings(project: 'chef-gcp-inspec', location: 'europe-west2') do
  its('key_ring_names'){ should include 'kms-key-ring' }
end

describe.one do
  google_kms_key_rings(project: 'chef-gcp-inspec', location: 'europe-west2').key_ring_urls do |url|
    describe url do
      it { should match 'kms-key-ring' }
    end
  end
end
```

### Test that there are no more than a specified number of kms_key_rings available for the project

    describe google_kms_key_rings(project: 'chef-inspec-gcp', location: 'us-east1') do
      its('count') { should be <= 200}
    end

### Test that an expected kms_key_ring is available for the project

    describe google_kms_key_rings(project: 'chef-inspec-gcp', location: 'us-east1') do
      its('key_ring_names') { should include "a-named-key" }
    end

### Test that all KMS key rings were created in the past year

    describe google_kms_key_rings(project: gcp_project_id, location: 'us-east1').key_ring_names.each do |key_ring_name|
      describe google_kms_key_ring(project: 'chef-inspec-gcp', location: 'us-east1', 'name: key_ring_name) do
        it { should exist }
        its('create_time_date') { should be > Time.now - 365*60*60*24 }
      end
    end

## Properties

Properties that can be accessed from the `google_kms_key_rings` resource:

See the [google_kms_key_ring](/inspec/resources/google_kms_key_ring/#properties) resource for more information.

`create_times`
: an array of `google_kms_key_ring` create_time

`key_ring_urls`
: an array of `google_kms_key_ring` key_ring_url

`locations`
: an array of `google_kms_key_ring` location

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Cloud Key Management Service (KMS) API](https://console.cloud.google.com/apis/library/cloudkms.googleapis.com/) is enabled for the current project.
