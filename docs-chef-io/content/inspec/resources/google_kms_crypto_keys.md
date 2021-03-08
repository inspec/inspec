+++
title = "google_kms_crypto_keys resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_kms_crypto_keys"
    identifier = "inspec/resources/gcp/google_kms_crypto_keys.md google_kms_crypto_keys resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_kms_crypto_keys` is used to test a Google CryptoKey resource

## Examples

```ruby
describe google_kms_crypto_keys(project: 'chef-gcp-inspec', location: 'europe-west2', key_ring_name: 'kms-key-ring') do
  its('count') { should be >= 1 }
  its('crypto_key_names') { should include 'kms-key' }
end
```

### Test that there are no more than a specified number of keys in the key ring

    describe google_kms_crypto_keys(project: 'chef-inspec-gcp',   location: 'us-east1',  key_ring_name: 'key-ring') do
      its('count') { should be <= 100}
    end

### Test that an expected key name is present in the key ring

    describe google_kms_crypto_keys(project: 'chef-inspec-gcp',   location: 'us-east1',  key_ring_name: 'key-ring') do
      its('crypto_key_names') { should include "my-crypto-key-name" }
    end

## Properties

Properties that can be accessed from the `google_kms_crypto_keys` resource:

See the [google_kms_crypto_key](/inspec/resources/google_kms_crypto_key/#properties) resource for more information.

`crypto_key_names`
: an array of `google_kms_crypto_key` crypto_key_name

`create_times`
: an array of `google_kms_crypto_key` create_time

`labels`
: an array of `google_kms_crypto_key` labels

`purposes`
: an array of `google_kms_crypto_key` purpose

`rotation_periods`
: an array of `google_kms_crypto_key` rotation_period

`version_templates`
: an array of `google_kms_crypto_key` version_template

`next_rotation_times`
: an array of `google_kms_crypto_key` next_rotation_time

`key_rings`
: an array of `google_kms_crypto_key` key_ring

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Cloud Key Management Service (KMS) API](https://console.cloud.google.com/apis/library/cloudkms.googleapis.com/) is enabled for the current project.
