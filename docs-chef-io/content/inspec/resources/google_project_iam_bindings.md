+++
title = "google_project_iam_bindings resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_project_iam_bindings"
    identifier = "inspec/resources/gcp/google_project_iam_bindings.md google_project_iam_bindings resource"
    parent = "inspec/resources/gcp"
+++

**This resource is deprecated. Please use `google_project_iam_policy` instead**

Use the `google_project_iam_bindings` InSpec audit resource to test properties of all, or a filtered group of, GCP project IAM bindings.

## Syntax

A `google_project_iam_bindings` resource block collects GCP project IAM bindings then tests that group.

    describe google_project_iam_bindings(project: 'chef-inspec-gcp') do
      it { should exist }
    end

Use this InSpec resource to enumerate roles then test in-depth using `google_project_iam_binding`.

    google_project_iam_bindings(project: 'chef-inspec-gcp').iam_binding_roles.each do |iam_binding_role|
      describe google_project_iam_binding(project: 'chef-inspec-gcp',  role: iam_binding_role) do
        it { should exist }
        its('members') {should include 'user:someuser@domain.com' }
      end
    end

## Examples

The following examples show how to use this InSpec audit resource.

### Test that there are no more than a specified number of IAM bindings roles available for the project

    describe google_project_iam_bindings(project: 'chef-inspec-gcp') do
      its('count') { should be <= 100}
    end

### Test that an expected role is available for the project

    describe google_project_iam_bindings(project: 'chef-inspec-gcp') do
      its('iam_binding_roles') { should include "roles/storage.admin" }
    end

### Test that a particular role does not exist using filtering of the plural resource

    describe google_project_iam_bindings(project: 'chef-inspec-gcp').where(iam_binding_role: "roles/iam.securityReviewer") do
      it { should_not exist }
    end

## Filter Criteria

This resource supports the following filter criteria: `iam_binding_role`. This may be used with `where`, as a block or as a method.

## Properties

- `iam_binding_roles` - an array of google_project_iam_binding role strings e.g. `["roles/compute.admin", "roles/owner"]`

## GCP Permissions

Ensure the [Cloud Resource Manager API](https://console.cloud.google.com/apis/library/cloudresourcemanager.googleapis.com/) is enabled for the project.
