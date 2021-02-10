+++
title = "google_kms_crypto_key resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_kms_crypto_key"
    identifier = "inspec/resources/gcp/google_kms_crypto_key.md google_kms_crypto_key resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_kms_crypto_key` is used to test a Google CryptoKey resource

## Examples

```ruby
describe google_kms_crypto_key(project: 'chef-gcp-inspec', location: 'europe-west2', key_ring_name: 'kms-key-ring', name: 'kms-key') do
  it { should exist }
  its('crypto_key_name') { should cmp 'kms-key' }
  its('primary_state') { should eq "ENABLED" }
  its('purpose') { should eq "ENCRYPT_DECRYPT" }
  its('next_rotation_time') { should be > Time.now - 100000 }
  its('create_time') { should be > Time.now - 365*60*60*24*10 }
end

describe google_kms_crypto_key(project: 'chef-gcp-inspec', location: 'europe-west2', key_ring_name: 'kms-key-ring', name: "nonexistent") do
  it { should_not exist }
end
```

### Test that a GCP KMS crypto key was created recently

    describe google_kms_crypto_key(project: 'chef-inspec-gcp',   location: 'us-east1',  key_ring_name: 'key-ring', name: 'crypto-key') do
      its('create_time_date') { should be > Time.now - 365*60*60*24*10 }
    end

### Test when the next rotation time for a GCP KMS crypto key is scheduled

    describe google_kms_crypto_key(project: 'chef-inspec-gcp',   location: 'us-east1',  key_ring_name: 'key-ring', name: 'crypto-key') do
      its('next_rotation_time_date') { should be > Time.now - 100000 }
    end

### Check that the crypto key purpose is as expected

    describe google_kms_crypto_key(project: 'chef-inspec-gcp',   location: 'us-east1',  key_ring_name: 'key-ring', name: 'crypto-key') do
      its('purpose') { should eq "ENCRYPT_DECRYPT" }
    end

### Check that the crypto key primary is in "ENABLED" state

    describe google_kms_crypto_key(project: 'chef-inspec-gcp',   location: 'us-east1',  key_ring_name: 'key-ring', name: 'crypto-key') do
      its('primary_state') { should eq "ENABLED" }
    end

## Properties

Properties that can be accessed from the `google_kms_crypto_key` resource:

`crypto_key_name`
: The resource name for the CryptoKey.

`create_time`
: The time that this resource was created on the server. This is in RFC3339 text format.

`labels`
: Labels with user-defined metadata to apply to this resource.

`purpose`
: The immutable purpose of this CryptoKey. See the [purpose reference](https://cloud.google.com/kms/docs/reference/rest/v1/projects.locations.keyRings.cryptoKeys#CryptoKeyPurpose) for possible inputs.

  Possible values:

  - ENCRYPT_DECRYPT
  - ASYMMETRIC_SIGN
  - ASYMMETRIC_DECRYPT

`rotation_period`
: Every time this period passes, generate a new CryptoKeyVersion and set it as the primary. The first rotation will take place after the specified period. The rotation period has the format of a decimal number with up to 9 fractional digits, followed by the letter `s` (seconds). It must be greater than a day (ie, 86400).

`version_template`
: A template describing settings for new crypto key versions.

  `algorithm`
  : The algorithm to use when creating a version based on this template. See the [algorithm reference](https://cloud.google.com/kms/docs/reference/rest/v1/CryptoKeyVersionAlgorithm) for possible inputs.

  `protection_level`
  : The protection level to use when creating a version based on this template.

    Possible values:
    - SOFTWARE
    - HSM

`next_rotation_time`
: The time when KMS will create a new version of this Crypto Key.

`key_ring`
: The KeyRing that this key belongs to. Format: `'projects/{{project}}/locations/{{location}}/keyRings/{{keyRing}}'`.

## GCP Permissions

Ensure the [Cloud Key Management Service (KMS) API](https://console.cloud.google.com/apis/library/cloudkms.googleapis.com/) is enabled for the current project.
