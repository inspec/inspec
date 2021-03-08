+++
title = "google_compute_project_info resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_project_info"
    identifier = "inspec/resources/gcp/google_compute_project_info.md google_compute_project_info resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_project_info` is used to test a Google ProjectInfo resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```
describe google_compute_project_info(project: 'chef-gcp-inspec') do
  it { should exist }
  its('default_service_account') { should match "developer.gserviceaccount.com" }
end
```

### Test that GCP compute project information exists

    describe google_compute_project_info(project: 'chef-inspec-gcp') do
      it { should exist }
    end

### Test that GCP compute project default service account is as expected

    describe google_compute_project_info(project: 'chef-inspec-gcp') do
      its('default_service_account') { should eq '12345-compute@developer.gserviceaccount.com' }
    end

## Properties

Properties that can be accessed from the `google_compute_project_info` resource:

`name`
: The name of this project

`common_instance_metadata`
: Metadata shared for all instances in this project

`items`
: Array of key/values

  `key`
  : Key of the metadata key/value pair

  `value`
  : Value of the metadata key/value pair

`enabled_features`
: Restricted features enabled for use on this project

`default_service_account`
: Default service account used by VMs in this project

`xpn_project_status`
: The role this project has in a shared VPC configuration.

`default_network_tier`
: The default network tier used for configuring resources in this project

`quotas`
: Quotas applied to this project

`metric`
: Name of the quota metric

`limit`
: Quota limit for this metric

`usage`
: Current usage of this metric

`owner`
: Owning resource. This is the resource on which this quota is applied.

`creation_timestamp`
: Creation timestamp in RFC3339 text format.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
