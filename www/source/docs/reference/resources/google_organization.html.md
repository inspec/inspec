---
title: About the google_organization Resource
platform: gcp
---

# google\_organization

Use the `google_organization` InSpec audit resource to test properties of a GCP organization.  

<br>

## Syntax

Google organization have a name, display name (or domain) and lifecycle state. For more info, please see [here](https://cloud.google.com/resource-manager/docs/creating-managing-organization).

A `google_organization` resource block declares the tests for a single GCP organization identified by `display_name` or `name`:

    describe google_organization(display_name: 'google.com') do
      it { should exist }
      its('name') { should eq 'organizations/1234'  }
      its('display_name') { should eq 'google.com' }
    end

    describe google_organization(name: 'organizations/1234') do
      it { should exist }
      its('name') { should eq 'google.com'  }
      its('lifecycle_state') { should eq 'ACTIVE' }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that a GCP organization has the expected name

    describe google_organization(name: 'organizations/1234') do
      its('name') { should eq 'organizations/1234' }
    end

### Test that a GCP organization has the expected lifecycle state e.g. "ACTIVE"

    describe google_organization(display_name: 'google.com') do
      its('lifecycle_state') { should eq "ACTIVE" }
    end

<br>

## Properties

*  `name`, `display_name`, `lifecycle_state`

<br>


## GCP Permissions

Ensure the [Cloud Resource Manager API](https://console.cloud.google.com/apis/library/cloudresourcemanager.googleapis.com/) is enabled for the project.