+++
title = "google_project_logging_audit_config resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_project_logging_audit_config"
    identifier = "inspec/resources/gcp/google_project_logging_audit_config.md google_project_logging_audit_config resource"
    parent = "inspec/resources/gcp"
+++

Use the `google_compute_zone` InSpec audit resource to test properties of a single GCP compute zone.

## Syntax

A `google_project_logging_audit_config` resource block declares the tests for a single GCP zone by project and name.

    describe google_project_logging_audit_config(project: 'chef-inspec-gcp') do
      it { should exist }
    end

## Examples

The following examples show how to use this InSpec audit resource.

### Test that a GCP project logging audit configuration has a default type defined

    describe google_project_logging_audit_config(project: 'chef-inspec-gcp') do
      its('default_types') { should include 'ADMIN_READ' }
    end

### Test that a GCP project logging audit configuration has default exempted members

    describe google_compute_zone(project: 'chef-inspec-gcp',  zone: 'us-east1-b') do
      it { should_not have_default_exempted_members }
    end

## Properties

- `default_types`, `default_exempted_members`

## GCP Permissions

Ensure the [Cloud Resource Manager API](https://console.cloud.google.com/apis/library/cloudresourcemanager.googleapis.com/) is enabled for the project.
