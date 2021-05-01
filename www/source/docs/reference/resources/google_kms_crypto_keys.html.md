---
title: About the google_kms_crypto_keys Resource
platform: gcp
---

# google\_kms\_crypto\_keys

Use the `google_kms_crypto_keys` InSpec audit resource to test properties of all, or a filtered group of, GCP KMS crypto keys for supplied project, location and key ring name.

<br>

## Syntax

A `google_kms_crypto_keys` resource block collects GCP KMS crypto keys then tests that group.

    describe google_kms_crypto_keys(project: 'chef-inspec-gcp',   location: 'us-east1',  key_ring_name: 'key-ring') do
      it { should exist }
    end

Use this InSpec resource to enumerate IDs then test in-depth using `google_kms_crypto_key`.

    google_kms_crypto_keys(project: 'chef-inspec-gcp',   location: 'us-east1',  key_ring_name: 'key-ring').crypto_key_names.each do |key_name|
      describe google_kms_crypto_key(project: 'chef-inspec-gcp',   location: 'us-east1',  key_ring_name: 'key-ring', name: key_name) do
        it { should exist }
        its('create_time_date') { should be > Time.now - 365*60*60*24*10 }
        its('purpose') { should eq "ENCRYPT_DECRYPT" }
        its('primary_state') { should eq "ENABLED" }
      end
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that there are no more than a specified number of keys in the key ring

    describe google_kms_crypto_keys(project: 'chef-inspec-gcp',   location: 'us-east1',  key_ring_name: 'key-ring') do
      its('count') { should be <= 100}
    end

### Test that an expected key name is present in the key ring 

    describe google_kms_crypto_keys(project: 'chef-inspec-gcp',   location: 'us-east1',  key_ring_name: 'key-ring') do
      its('crypto_key_names') { should include "my-crypto-key-name" }
    end
    
<br>

## Filter Criteria

This resource supports the following filter criteria: `key_name`. This may be used with `where`, as a block or as a method.

## Properties

*  `crypto_key_names` - an array of google_kms_crypto_key name strings e.g. `['key-name']`
*  `crypto_key_urls` - an array of google_kms_crypto_key url strings e.g. `['projects/PROJECT/locations/LOCATION/keyRings/key-ring-name/cryptoKeys/key-name']`

<br>


## GCP Permissions

Ensure the [Cloud Key Management Service (KMS) API](https://console.cloud.google.com/apis/library/cloudkms.googleapis.com/) is enabled for the project where the resource is located.