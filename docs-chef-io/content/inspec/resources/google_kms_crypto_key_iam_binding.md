+++
title = "google_kms_crypto_key_iam_binding resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_kms_crypto_key_iam_binding"
    identifier = "inspec/resources/gcp/google_kms_crypto_key_iam_binding.md google_kms_crypto_key_iam_binding resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_kms_crypto_key_iam_binding` is used to test a Google CryptoKey Iam Bindings

## Examples

```ruby
describe google_kms_crypto_key_iam_binding(project: "project", location: "location", key_ring_name: "key_ring_name", crypto_key_name: "crypto_key_name", role: "roles/editor") do
  it { should exist }
  its('members') { should include 'user:testuser@example.com' }
end
```

## Properties

Properties that can be accessed from the `google_kms_crypto_key_iam_binding` resource:

`role`
: Role that is assigned to members. For example, roles/viewer, roles/editor, or roles/owner.

`members`
: Specifies the identities requesting access for a Cloud Platform resource.

## GCP Permissions

Ensure the [Cloud Key Management Service (KMS) API](https://console.cloud.google.com/apis/library/cloudkms.googleapis.com/) is enabled for the current project.
