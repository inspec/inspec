---
title: About the google_compute_instance_group Resource
platform: gcp
---

# google\_compute\_instance\_group

Use the `google_compute_instance_group` InSpec audit resource to test properties of a single GCP compute instance group.

<br>

## Syntax

A `google_compute_instance_group` resource block declares the tests for a single GCP compute instance group by project, zone and name.

    describe google_compute_instance_group(project: 'chef-inspec-gcp', zone: 'europe-west2-a', name: 'gcp-inspec-test') do
      it { should exist }
      its('size') { should eq 2 }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that a GCP compute instance group has the expected size

    describe google_compute_instance_group(project: 'chef-inspec-gcp', zone: 'europe-west2-a', name: 'gcp-inspec-test') do
      its('size') { should eq 2 }
    end

### Test that a GCP compute instance group has a port with supplied name and value

    describe google_compute_instance_group(project: 'chef-inspec-gcp', zone: 'europe-west2-a', name: 'gcp-inspec-test') do
      its('port_name') { should eq "http" }
      its('port_value') { should eq 80 }
    end

<br>

## Properties

*  `creation_timestamp`, `description`, `fingerprint`, `id`, `kind`, `name`, `named_ports`, `network`, `size`, `subnetwork`, `zone`

<br>


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the project where the resource is located.