---
title: About the google_pubsub_subscriptions resource
platform: gcp
---

## Syntax
A `google_pubsub_subscriptions` is used to test a Google Subscription resource

## Examples
```
describe google_pubsub_subscriptions(project: 'chef-gcp-inspec') do
  its('count') { should be >= 1 }
end

google_pubsub_subscriptions(project: 'chef-gcp-inspec').names.each do |subscription_name|
  describe google_pubsub_subscription(project: 'chef-gcp-inspec', name: subscription_name) do
    it { should exist }
  end
end
```

## Properties
Properties that can be accessed from the `google_pubsub_subscriptions` resource:

See [google_pubsub_subscription.md](google_pubsub_subscription.md) for more detailed information
  * `names`: an array of `google_pubsub_subscription` name
  * `topics`: an array of `google_pubsub_subscription` topic
  * `push_configs`: an array of `google_pubsub_subscription` push_config
  * `ack_deadline_seconds`: an array of `google_pubsub_subscription` ack_deadline_seconds

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.
