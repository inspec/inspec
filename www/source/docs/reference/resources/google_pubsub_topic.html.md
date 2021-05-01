---
title: About the google_pubsub_topic resource
platform: gcp
---

## Syntax
A `google_pubsub_topic` is used to test a Google Topic resource

## Examples
```
describe google_pubsub_topic(project: 'chef-gcp-inspec', name: 'inspec-gcp-topic') do
  it { should exist }
end

describe google_pubsub_topic(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_pubsub_topic` resource:

  * `name`: Name of the topic.
