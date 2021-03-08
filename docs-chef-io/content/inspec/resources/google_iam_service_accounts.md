+++
title = "google_iam_service_accounts resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_iam_service_accounts"
    identifier = "inspec/resources/gcp/google_iam_service_accounts.md google_iam_service_accounts resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_iam_service_accounts` is used to test a Google ServiceAccount resource

## Examples

```ruby
describe google_iam_service_accounts(project: 'chef-gcp-inspec', name: "display-name@project-id.iam.gserviceaccount.com") do
  its('service_account_emails') { should include "display-name@project-id.iam.gserviceaccount.com" }
  its('count') { should be <= 1000 }
end
```

## Properties

Properties that can be accessed from the `google_iam_service_accounts` resource:

See the [google_iam_service_account](/inspec/resources/google_iam_service_account/#properties) resource for more information.

`service_account_names`
: an array of `google_iam_service_account` name

`project_ids`
: an array of `google_iam_service_account` project_id

`service_account_ids`
: an array of `google_iam_service_account` unique_id

`service_account_emails`
: an array of `google_iam_service_account` email

`service_account_display_names`
: an array of `google_iam_service_account` display_name

`oauth2_client_ids`
: an array of `google_iam_service_account` oauth2_client_id

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Identity and Access Management (IAM) API](https://console.cloud.google.com/apis/library/iam.googleapis.com/) is enabled for the current project.
