+++
title = "google_iam_service_account_keys resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_iam_service_account_keys"
    identifier = "inspec/resources/gcp/google_iam_service_account_keys.md google_iam_service_account_keys resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_iam_service_account_keys` is used to test a Google ServiceAccountKey resource

## Examples

```ruby
describe google_iam_service_account_keys(project: 'chef-gcp-inspec', service_account: "display-name@project-id.iam.gserviceaccount.com") do
  its('count') { should be <= 1000 }
end
```

## Properties

Properties that can be accessed from the `google_iam_service_account_keys` resource:

See the [google_iam_service_account_key](/inspec/resources/google_iam_service_account_key/#properties) resource for more information.

`key_names`
: an array of `google_iam_service_account_key` name

`private_key_types`
: an array of `google_iam_service_account_key` private_key_type

`key_algorithms`
: an array of `google_iam_service_account_key` key_algorithm

`private_key_data`
: an array of `google_iam_service_account_key` private_key_data

`public_key_data`
: an array of `google_iam_service_account_key` public_key_data

`valid_after_times`
: an array of `google_iam_service_account_key` valid_after_time

`valid_before_times`
: an array of `google_iam_service_account_key` valid_before_time

`key_types`
: an array of `google_iam_service_account_key` key_type

`service_accounts`
: an array of `google_iam_service_account_key` service_account

`paths`
: an array of `google_iam_service_account_key` path

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Identity and Access Management (IAM) API](https://console.cloud.google.com/apis/library/iam.googleapis.com/) is enabled for the current project.
