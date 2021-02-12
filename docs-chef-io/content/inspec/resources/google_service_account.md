+++
title = "google_service_account resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_service_account"
    identifier = "inspec/resources/gcp/google_service_account.md google_service_account resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_service_account` is used to test a Google ServiceAccount resource

## Examples

```ruby
describe google_service_account(project: 'chef-gcp-inspec', name: "display-name@project-id.iam.gserviceaccount.com") do
  it { should exist }
  its('display_name') { should cmp '' }
end

describe google_service_account(project: 'chef-gcp-inspec', name: "nonexistent@project-id.iam.gserviceaccount.com") do
  it { should_not exist }
end
```

### Test that a GCP project IAM service account has the expected unique identifier

    describe google_service_account(project: 'sample-project', name: 'sample-account@sample-project.iam.gserviceaccount.com') do
      its('unique_id') { should eq 12345678 }
    end

### Test that a GCP project IAM service account has the expected oauth2 client identifier

    describe google_service_account(project: 'sample-project', name: 'sample-account@sample-project.iam.gserviceaccount.com') do
      its('oauth2_client_id') { should eq 12345678 }
    end

### Test that a GCP project IAM service account does not have user managed keys

    	describe google_service_account_keys(project: 'chef-gcp-inspec', service_account: "display-name@project-id.iam.gserviceaccount.com") do
    	  its('key_types') { should_not include 'USER_MANAGED' }
    end

## Properties

Properties that can be accessed from the `google_service_account` resource:

`name`
: The name of the service account.

`project_id`
: Id of the project that owns the service account.

`unique_id`
: Unique and stable id of the service account

`email`
: Email address of the service account.

`display_name`
: User specified description of service account.

`oauth2_client_id`
: OAuth2 client id for the service account.

## GCP Permissions

Ensure the [Identity and Access Management (IAM) API](https://console.cloud.google.com/apis/library/iam.googleapis.com/) is enabled for the current project.
