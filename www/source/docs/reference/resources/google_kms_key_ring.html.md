---
title: About the google_kms_key_ring Resource
platform: gcp
---

# google\_kms\_key\_ring

Use the `google_kms_key_ring` InSpec audit resource to test properties of a single GCP kms key ring.

<br>

## Syntax

A `google_kms_key_ring` resource block declares the tests for a single GCP key ring by project and name.

    describe google_kms_key_ring(project: 'chef-inspec-gcp',  location: 'us-east1', name: 'key-ring-name') do
      it { should exist }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that a GCP kms key ring exists

    describe google_kms_key_ring(project: 'chef-inspec-gcp',  location: 'us-east1', name: 'key-ring-name') do
      it { should exist }
    end

### Test that a GCP kms key ring is in the expected state 

For any existing key ring, below should definitely be true!

    describe google_kms_key_ring(project: 'chef-inspec-gcp',  location: 'us-east1', name: 'key-ring-name') do
      its('create_time_date') { should be > Time.now - 365*60*60*24*50 }
    end

<br>

## Properties

*  `create_time`, `create_time_date`, `name`,  `key_ring_name`, `key_ring_url`

<br>


## GCP Permissions

Ensure the [Cloud Key Management Service (KMS) API](https://console.cloud.google.com/apis/library/cloudkms.googleapis.com/) is enabled for the project where the resource is located.