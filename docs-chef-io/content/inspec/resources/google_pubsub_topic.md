+++
title = "google_pubsub_topic resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_pubsub_topic"
    identifier = "inspec/resources/gcp/google_pubsub_topic.md google_pubsub_topic resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_pubsub_topic` is used to test a Google Topic resource

## Examples

```ruby
describe google_pubsub_topic(project: 'chef-gcp-inspec', name: 'inspec-gcp-topic') do
  it { should exist }
end

describe google_pubsub_topic(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_pubsub_topic` resource:

`name`
: Name of the topic.

`kms_key_name`
: The resource name of the Cloud KMS CryptoKey to be used to protect access to messages published on this topic. Your project's PubSub service account (`service-{{PROJECT_NUMBER}}@gcp-sa-pubsub.iam.gserviceaccount.com`) must have `roles/cloudkms.cryptoKeyEncrypterDecrypter` to use this feature. The expected format is `projects/*/locations/*/keyRings/*/cryptoKeys/*`

`labels`
: A set of key/value label pairs to assign to this Topic.

`message_storage_policy`
: Policy constraining the set of Google Cloud Platform regions where messages published to the topic may be stored. If not present, then no constraints are in effect.

  `allowed_persistence_regions`
  : A list of IDs of GCP regions where messages that are published to the topic may be persisted in storage. Messages published by publishers running in non-allowed GCP regions (or running outside of GCP altogether) will be routed for storage in one of the allowed regions. An empty list means that no regions are allowed, and is not a valid configuration.

## GCP Permissions

Ensure the [Cloud Pub/Sub API](https://console.cloud.google.com/apis/library/pubsub.googleapis.com/) is enabled for the current project.
