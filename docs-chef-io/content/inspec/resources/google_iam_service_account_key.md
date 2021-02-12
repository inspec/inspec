+++
title = "google_iam_service_account_key resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_iam_service_account_key"
    identifier = "inspec/resources/gcp/google_iam_service_account_key.md google_iam_service_account_key resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_iam_service_account_key` is used to test a Google ServiceAccountKey resource

## Examples

```ruby
google_iam_service_account_keys(project: 'chef-gcp-inspec', service_account: "display-name@project-id.iam.gserviceaccount.com").key_names.each do |sa_key_name|
	describe
end
```

## Properties

Properties that can be accessed from the `google_iam_service_account_key` resource:

`name`
: The name of the key.

`private_key_type`
: Output format for the service account key.

`key_algorithm`
: Specifies the algorithm for the key.

`private_key_data`
: Private key data. Base-64 encoded.

`public_key_data`
: Public key data. Base-64 encoded.

`valid_after_time`
: Key can only be used after this time.

`valid_before_time`
: Key can only be used before this time.

`key_type`
: Specifies the type of the key.

  Possible values include:
  - KEY_TYPE_UNSPECIFIED
  - USER_MANAGED
  - SYSTEM_MANAGED

`service_account`
: The name of the serviceAccount.

`path`
: The full name of the file that will hold the service account private key. The management of this file will depend on the value of sync_file parameter. File path must be absolute.

## GCP Permissions

Ensure the [Identity and Access Management (IAM) API](https://console.cloud.google.com/apis/library/iam.googleapis.com/) is enabled for the current project.
