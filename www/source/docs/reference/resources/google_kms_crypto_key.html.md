---
title: About the google_kms_crypto_key Resource
platform: gcp
---

# google\_kms\_crypto\_key

Use the `google_kms_crypto_key` InSpec audit resource to test properties of a single GCP KMS crypto key.  See [this page](https://cloud.google.com/kms/docs/object-hierarchy?hl=en_US&_ga=2.223343707.-1730338523.1522320263#cryptokeyversion) for useful background.

<br>

## Syntax

A `google_kms_crypto_key` resource block declares the tests for a single GCP KMS crypto key by project, location, key ring name and key name. 

    describe google_kms_crypto_key(project: 'chef-inspec-gcp',   location: 'us-east1',  key_ring_name: 'key-ring', name: 'crypto-key') do
      it { should exist }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

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
    
    
<br>

## Properties

* `create_time`, `create_time_date`, `name`, `crypto_key_name`, `crypto_key_url`, `next_rotation_time`, `next_rotation_time_date`, `primary_create_time`, `primary_create_time_date`, `primary_name`, `primary_state`, `purpose`, `rotation_period`

<br>


## GCP Permissions

Ensure the [Cloud Key Management Service (KMS) API](https://console.cloud.google.com/apis/library/cloudkms.googleapis.com/) is enabled for the project where the resource is located.