+++
title = "google_pubsub_topics resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_pubsub_topics"
    identifier = "inspec/resources/gcp/google_pubsub_topics.md google_pubsub_topics resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_pubsub_topics` is used to test a Google Topic resource

## Examples

```ruby
describe google_pubsub_topics(project: 'chef-gcp-inspec') do
  it { should exist }
  its('names') { should include 'inspec-gcp-topic' }
  its('count') { should be >=1 }
end

describe.one do
  google_pubsub_topics(project: 'chef-gcp-inspec').names.each do |topic_name|
    describe google_pubsub_topic(project: 'chef-gcp-inspec', name: topic_name) do
      it { should exist }
    end
  end
end
```

## Properties

Properties that can be accessed from the `google_pubsub_topics` resource:

See the [google_pubsub_topic](/inspec/resources/google_pubsub_topic/#properties) resource for more information.

`names`
: an array of `google_pubsub_topic` name

`kms_key_names`
: an array of `google_pubsub_topic` kms_key_name

`labels`
: an array of `google_pubsub_topic` labels

`message_storage_policies`
: an array of `google_pubsub_topic` message_storage_policy

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Cloud Pub/Sub API](https://console.cloud.google.com/apis/library/pubsub.googleapis.com/) is enabled for the current project.
