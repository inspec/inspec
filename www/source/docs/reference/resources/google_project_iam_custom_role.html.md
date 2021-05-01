---
title: About the google_project_iam_custom_role Resource
platform: gcp
---

# google\_project\_iam\_custom\_role

Use the `google_project_iam_custom_role` InSpec audit resource to test properties of a GCP project IAM custom role.

<br>s

## Syntax

A `google_project_iam_custom_role` resource block declares the tests for a single GCP project IAM custom role by project and name.

    describe google_project_iam_custom_role(project: 'chef-inspec-gcp', name: 'chef-inspec-gcp-role-abcd') do
      it { should exist }
      its('name') { should eq 'chef-inspec-gcp-role-abcd'  }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that a GCP project IAM custom role has the expected stage in the launch lifecycle

    describe google_project_iam_custom_role(project: 'chef-inspec-gcp', name: 'chef-inspec-gcp-role-abcd') do
      its('stage') { should eq "GA" }
    end

### Test that a GCP project IAM custom role has the expected included permissions

    describe google_project_iam_custom_role(project: 'chef-inspec-gcp', name: 'chef-inspec-gcp-role-abcd') do
      its('included_permissions') { should eq ["iam.roles.list"] }
    end

<br>

## Properties

*  `description`, `etag`, `included_permissions`, `name`, `stage`, `title`

<br>


## GCP Permissions

Ensure the [Identity and Access Management (IAM) API](https://console.cloud.google.com/apis/library/iam.googleapis.com/) is enabled for the project.