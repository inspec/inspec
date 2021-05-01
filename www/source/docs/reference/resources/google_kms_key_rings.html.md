---
title: About the google_kms_key_rings Resource
platform: gcp
---

# google\_kms\_key\_rings

Use the `google_kms_key_rings` InSpec audit resource to test properties of all, or a filtered group of, GCP KMS key rings for a project in a particular location.

<br>

## Syntax

A `google_kms_key_rings` resource block collects GCP kms_key_rings by project then tests that group.

    describe google_kms_key_rings(project: 'chef-inspec-gcp', location: 'us-east1') do
      it { should exist }
    end

Use this InSpec resource to enumerate IDs then test in-depth using `google_kms_key_ring`.

    google_kms_key_rings(project: 'chef-inspec-gcp', location: 'us-east1').key_ring_names.each do |kms_key_ring_name|
      describe google_kms_key_ring(project: 'chef-inspec-gcp',  kms_key_ring: kms_key_ring_name) do
        it { should exist }
        its('kind') { should eq "compute#kms_key_ring" }
        its('status') { should eq 'UP' }
      end
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

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
    
<br>

## Filter Criteria

This resource supports the following filter criteria: `key_ring_name`. This may be used with `where`, as a block or as a method.

## Properties

*  `key_ring_names` - an array of google_kms_key_ring name strings e.g.`['key-ring-name']`
*  `key_ring_urls` - an array of google_kms_key_ring name url strings e.g. `['projects/PROJECT/locations/LOCATION/keyRings/key-ring-name']`

<br>


## GCP Permissions

Ensure the [Cloud Key Management Service (KMS) API](https://console.cloud.google.com/apis/library/cloudkms.googleapis.com/) is enabled for the project where the resource is located.