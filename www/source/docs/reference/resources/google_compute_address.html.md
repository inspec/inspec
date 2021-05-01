---
title: About the google_compute_address Resource
platform: gcp
---

# google\_compute\_address

Use the `google_compute_address` InSpec audit resource to test properties of a single GCP compute address.

<br>

## Syntax

A `google_compute_address` resource block declares the tests for a single GCP compute address by project, region and name.

    describe google_compute_address(project: 'chef-inspec-gcp', location: 'europe-west2', name: 'compute-address') do
      it { should exist }
      its('name') { should eq 'compute-address' }
      its('region') { should match 'europe-west2' }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that a GCP compute address IP exists

    describe google_compute_address(project: 'chef-inspec-gcp', location: 'europe-west2', name: 'compute-address') do
      its('address_ip_exists')  { should be true }
    end

### Test that a GCP compute address is in a particular status

    describe google_compute_address(project: 'chef-inspec-gcp', location: 'europe-west2', name: 'compute-address') do
      its('status') { should eq "IN_USE" }
    end

### Test that a GCP compute address IP has the expected number of users

    describe google_compute_address(project: 'chef-inspec-gcp', location: 'europe-west2', name: 'compute-address') do
      its('user_count') { should eq 1 }
    end

### Test that the first user of a GCP compute address has the expected resource name

    describe google_compute_address(project: 'chef-inspec-gcp', location: 'europe-west2', name: 'compute-address') do
      its('user_resource_name') { should eq "gcp_ext_vm_name" }
    end

<br>

## Properties

*  `address`, `creation_timestamp`, `description`, `id`, `kind`, `name`, `region`, `status`, `users`

<br>


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the project where the resource is located.