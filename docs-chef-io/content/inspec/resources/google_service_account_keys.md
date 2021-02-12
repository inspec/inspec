+++
title = "google_service_account_keys resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_service_account_keys"
    identifier = "inspec/resources/gcp/google_service_account_keys.md google_service_account_keys resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_service_account_keys` is used to test a Google ServiceAccountKey resource

## Examples

```ruby
describe google_service_account_keys(project: 'chef-gcp-inspec', service_account: "display-name@project-id.iam.gserviceaccount.com") do
  its('count') { should be <= 1000 }
  its('key_types') { should_not include 'USER_MANAGED' }
end
```

### Test that there are no more than a specified number of keys for the service account

    describe google_service_account_keys(project: 'sample-project', service_account: 'sample-account@sample-project.iam.gserviceaccount.com') do
      its('count') { should be <= 1000}
    end

### Test that a service account with expected name is available

    describe google_service_account_keys(project: 'sample-project', service_account: 'sample-account@sample-project.iam.gserviceaccount.com') do
      its('key_names'){ should include "projects/sample-project/serviceAccounts/test-sa@sample-project.iam.gserviceaccount.com/keys/c6bd986da9fac6d71178db41d1741cbe751a5080" }
    end

## Properties

Properties that can be accessed from the `google_service_account_keys` resource:

See the [google_service_account_key](/inspec/resources/google_service_account_key/#properties) resource for more information.

`key_names`
: an array of `google_service_account_key` name

`private_key_types`
: an array of `google_service_account_key` private_key_type

`key_algorithms`
: an array of `google_service_account_key` key_algorithm

`private_key_data`
: an array of `google_service_account_key` private_key_data

`public_key_data`
: an array of `google_service_account_key` public_key_data

`valid_after_times`
: an array of `google_service_account_key` valid_after_time

`valid_before_times`
: an array of `google_service_account_key` valid_before_time

`key_types`
: an array of `google_service_account_key` key_type

`service_accounts`
: an array of `google_service_account_key` service_account

`paths`
: an array of `google_service_account_key` path

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Identity and Access Management (IAM) API](https://console.cloud.google.com/apis/library/iam.googleapis.com/) is enabled for the current project.
