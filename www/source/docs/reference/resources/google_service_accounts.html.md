---
title: About the google_service_accounts Resource
platform: gcp
---

# google\_service\_accounts

Use the `google_service_accounts` InSpec audit resource to test properties of all, or a filtered group of, GCP service accounts for a project.

<br>

## Syntax

A `google_service_accounts` resource block collects GCP service accounts by project then tests that group.

    describe google_service_accounts(project: 'chef-inspec-gcp') do
      it { should exist }
    end

Use this InSpec resource to enumerate IDs then test in-depth using `google_service_account`.

    google_service_accounts(project: 'chef-inspec-gcp').service_account_names.each do |sa_name|
      describe google_service_account(name: sa_name) do
        it { should exist }
      end
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that there are no more than a specified number of service accounts for the project

    describe google_service_accounts(project: 'chef-inspec-gcp') do
      its('count') { should be <= 1000}
    end

### Test that an expected service account display name is available

    describe google_service_accounts(project: 'chef-inspec-gcp') do
      its('service_account_display_names'){ should include "gcp_sa_name" }
    end
    
### Test that an expected service account unique identifier is available

    describe google_service_accounts(project: 'chef-inspec-gcp') do
      its('service_account_ids'){ should include 12345678 }
    end    

### Test that a service account with expected name is available

    describe google_service_accounts(project: 'dummy-project') do
      its('service_account_names'){ should include "projects/dummy-project/serviceAccounts/dummy-acct@dummy-project.iam.gserviceaccount.com" }
    end

### Use filtering to retrieve a particular service account

    google_service_accounts(project: 'chef-inspec-gcp').where(service_account_display_names: /^dummyaccount/).service_account_names.each do |sa_name|
      describe google_service_account(name: sa_name) do
        it { should exist }
      end
    end

<br>

## Filter Criteria

This resource supports the following filter criteria: `service_account_id`; `service_account_display_name`  and `service_account_name`. Any of these may be used with `where`, as a block or as a method.

## Properties

*  `service_account_ids` - an array of google_service_account identifier integers
*  `service_account_names` - an array of google_service_account name strings
*  `service_account_display_names` - an array of google_service_account display name strings
*  `service_account_emails` - an array of google_service_account email strings

<br>


## GCP Permissions

Ensure the [Identity and Access Management (IAM) API](https://console.cloud.google.com/apis/library/iam.googleapis.com/) is enabled for the project.