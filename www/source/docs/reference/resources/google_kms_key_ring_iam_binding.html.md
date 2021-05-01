---
title: About the google_kms_key_ring_iam_binding Resource
platform: gcp
---

# google\_kms\_key\_ring\_iam\_binding

Use the `google_kms_key_ring_iam_binding` InSpec audit resource to test properties of a single GCP KMS key ring IAM binding.

<br>

## Syntax

A `google_kms_key_ring_iam_binding` resource block declares the tests for a single GCP KMS key ring IAM binding by role.

    describe google_kms_key_ring_iam_binding(key_ring_url: 'projects/project/locations/europe-west2/keyRings/key-ring', role: 'roles/compute.admin') do
      it { should exist }
      its('members') {should include 'user:someuser@domain.com' }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that a GCP project KMS key ring IAM binding exists

    describe google_kms_key_ring_iam_binding(key_ring_url: 'projects/project/locations/europe-west2/keyRings/key-ring', role: 'roles/compute.admin') do
      it { should exist }
    end

### Test that a GCP project KMS key ring IAM binding has the desired user included

    describe google_kms_key_ring_iam_binding(key_ring_url: 'projects/project/locations/europe-west2/keyRings/key-ring', role: 'roles/compute.admin') do
      its('members') {should include 'user:someuser@domain.com' }
    end

<br>

## Properties

*  `members`

<br>


## GCP Permissions

Ensure the [Cloud Key Management Service (KMS) API](https://console.cloud.google.com/apis/library/cloudkms.googleapis.com/) is enabled for the project where the resource is located.