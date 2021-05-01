---
title: About the google_pubsub_subscription resource
platform: gcp
---

## Syntax
A `google_pubsub_subscription` is used to test a Google Subscription resource

## Examples
```
describe google_pubsub_subscription(project: 'chef-gcp-inspec', name: 'inspec-gcp-subscription') do
  it { should exist }
end

describe google_pubsub_subscription(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_pubsub_subscription` resource:

  * `name`: Name of the subscription.

  * `topic`: A reference to a Topic resource.

  * `push_config`: If push delivery is used with this subscription, this field is used to configure it. An empty pushConfig signifies that the subscriber will pull and ack messages using API methods.

    * `pushEndpoint`: A URL locating the endpoint to which messages should be pushed. For example, a Webhook endpoint might use "https://example.com/push".

  * `ack_deadline_seconds`: This value is the maximum time after a subscriber receives a message before the subscriber should acknowledge the message. After message delivery but before the ack deadline expires and before the message is acknowledged, it is an outstanding message and will not be delivered again during that time (on a best-effort basis).  For pull subscriptions, this value is used as the initial value for the ack deadline. To override this value for a given message, call subscriptions.modifyAckDeadline with the corresponding ackId if using pull. The minimum custom deadline you can specify is 10 seconds. The maximum custom deadline you can specify is 600 seconds (10 minutes). If this parameter is 0, a default value of 10 seconds is used.  For push delivery, this value is also used to set the request timeout for the call to the push endpoint.  If the subscriber never acknowledges the message, the Pub/Sub system will eventually redeliver the message.
