---
title: About the google_pubsub_topics resource
platform: gcp
---

## Syntax
A `google_pubsub_topics` is used to test a Google Topic resource

## Examples
```
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

See [google_pubsub_topic.md](google_pubsub_topic.md) for more detailed information
  * `names`: an array of `google_pubsub_topic` name

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.
