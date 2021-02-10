+++
title = "google_service_accounts resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_service_accounts"
    identifier = "inspec/resources/gcp/google_service_accounts.md google_service_accounts resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_service_accounts` is used to test a Google ServiceAccount resource

## Examples

```ruby
describe google_service_accounts(project: 'chef-gcp-inspec', name: "display-name@project-id.iam.gserviceaccount.com") do
  its('service_account_emails') { should include "display-name@project-id.iam.gserviceaccount.com" }
  its('count') { should be <= 1000 }
end
```

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

## Properties

Properties that can be accessed from the `google_service_accounts` resource:

See the [google_service_account](/inspec/resources/google_service_account/#properties) resource for more information.

`service_account_names`
: an array of `google_service_account` name

`project_ids`
: an array of `google_service_account` project_id

`service_account_ids`
: an array of `google_service_account` unique_id

`service_account_emails`
: an array of `google_service_account` email

`service_account_display_names`
: an array of `google_service_account` display_name

`oauth2_client_ids`
: an array of `google_service_account` oauth2_client_id

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Identity and Access Management (IAM) API](https://console.cloud.google.com/apis/library/iam.googleapis.com/) is enabled for the current project.
