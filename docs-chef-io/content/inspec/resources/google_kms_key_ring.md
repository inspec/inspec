+++
title = "google_kms_key_ring resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_kms_key_ring"
    identifier = "inspec/resources/gcp/google_kms_key_ring.md google_kms_key_ring resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_kms_key_ring` is used to test a Google KeyRing resource

## Examples

```ruby
describe google_kms_key_ring(project: 'chef-gcp-inspec', location: 'europe-west2', name: 'kms-key-ring') do
  it { should exist }
  its('create_time') { should be > Time.now - 365*60*60*24*10 }
  its('key_ring_name'){ should eq 'kms-key-ring' }
  its('key_ring_url'){ should match 'kms-key-ring' }
end

describe google_kms_key_ring(project: 'chef-gcp-inspec', location: 'europe-west2', name: "nonexistent") do
  it { should_not exist }
end
```

### Test that a GCP kms key ring exists

    describe google_kms_key_ring(project: 'chef-inspec-gcp',  location: 'us-east1', name: 'key-ring-name') do
      it { should exist }
    end

### Test that a GCP kms key ring is in the expected state

For any existing key ring, below should definitely be true!

    describe google_kms_key_ring(project: 'chef-inspec-gcp',  location: 'us-east1', name: 'key-ring-name') do
      its('create_time_date') { should be > Time.now - 365*60*60*24*50 }
    end

## Properties

Properties that can be accessed from the `google_kms_key_ring` resource:

`create_time`
: The time that this resource was created on the server. This is in RFC3339 text format.

`key_ring_url`
: The full resource name for the KeyRing

`location`
: The location for the KeyRing. A full list of valid locations can be found by running `gcloud kms locations list`.

## GCP Permissions

Ensure the [Cloud Key Management Service (KMS) API](https://console.cloud.google.com/apis/library/cloudkms.googleapis.com/) is enabled for the current project.
