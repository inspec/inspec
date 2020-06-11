# Copyright 2015 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'date'
require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module PubsubV1beta1a
      
      # Request for the Acknowledge method.
      class AcknowledgeRequest
        include Google::Apis::Core::Hashable
      
        # The acknowledgment ID for the message being acknowledged. This was
        # returned by the Pub/Sub system in the Pull response.
        # Corresponds to the JSON property `ackId`
        # @return [Array<String>]
        attr_accessor :ack_id
      
        # The subscription whose message is being acknowledged.
        # Corresponds to the JSON property `subscription`
        # @return [String]
        attr_accessor :subscription
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ack_id = args[:ack_id] if args.key?(:ack_id)
          @subscription = args[:subscription] if args.key?(:subscription)
        end
      end
      
      # An empty message that you can re-use to avoid defining duplicated empty
      # messages in your project. A typical example is to use it as argument or the
      # return value of a service API. For instance:
      # service Foo `
      # rpc Bar (proto2.Empty) returns (proto2.Empty) ` `;
      # `;
      # BEGIN GOOGLE-INTERNAL
      # The difference between this one and net/rpc/empty-message.proto is that
      # 1) The generated message here is in proto2 C++ API.
      # 2) The proto2.Empty has minimum dependencies
      # (no message_set or net/rpc dependencies)
      # END GOOGLE-INTERNAL
      class Empty
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # A key-value pair applied to a given object.
      class Label
        include Google::Apis::Core::Hashable
      
        # The key of a label is a syntactically valid URL (as per RFC 1738) with
        # the "scheme" and initial slashes omitted and with the additional
        # restrictions noted below.  Each key should be globally unique.  The
        # "host" portion is called the "namespace" and is not necessarily
        # resolvable to a network endpoint.  Instead, the namespace indicates what
        # system or entity defines the semantics of the label.  Namespaces do not
        # restrict the set of objects to which a label may be associated.
        # Keys are defined by the following grammar:
        # key          = hostname "/" kpath
        # kpath        = ksegment *[ "/" ksegment ]
        # ksegment     = alphadigit | *[ alphadigit | "-" | "_" | "." ]
        # where "hostname" and "alphadigit" are defined as in RFC 1738.
        # Example key:
        # spanner.google.com/universe
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # An integer value.
        # Corresponds to the JSON property `numValue`
        # @return [Fixnum]
        attr_accessor :num_value
      
        # A string value.
        # Corresponds to the JSON property `strValue`
        # @return [String]
        attr_accessor :str_value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @key = args[:key] if args.key?(:key)
          @num_value = args[:num_value] if args.key?(:num_value)
          @str_value = args[:str_value] if args.key?(:str_value)
        end
      end
      
      # Response for the ListSubscriptions method.
      class ListSubscriptionsResponse
        include Google::Apis::Core::Hashable
      
        # If not empty, indicates that there are more subscriptions that match the
        # request and this value should be passed to the next
        # <code>ListSubscriptionsRequest</code> to continue.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The subscriptions that match the request.
        # Corresponds to the JSON property `subscription`
        # @return [Array<Google::Apis::PubsubV1beta1a::Subscription>]
        attr_accessor :subscription
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @subscription = args[:subscription] if args.key?(:subscription)
        end
      end
      
      # Response for the ListTopics method.
      class ListTopicsResponse
        include Google::Apis::Core::Hashable
      
        # If not empty, indicates that there are more topics that match the request,
        # and this value should be passed to the next <code>ListTopicsRequest</code>
        # to continue.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The resulting topics.
        # Corresponds to the JSON property `topic`
        # @return [Array<Google::Apis::PubsubV1beta1a::Topic>]
        attr_accessor :topic
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @topic = args[:topic] if args.key?(:topic)
        end
      end
      
      # Request for the ModifyAckDeadline method.
      class ModifyAckDeadlineRequest
        include Google::Apis::Core::Hashable
      
        # The new ack deadline with respect to the time this request was sent to the
        # Pub/Sub system. Must be >= 0. For example, if the value is 10, the new ack
        # deadline will expire 10 seconds after the ModifyAckDeadline call was made.
        # Specifying zero may immediately make the message available for another pull
        # request.
        # Corresponds to the JSON property `ackDeadlineSeconds`
        # @return [Fixnum]
        attr_accessor :ack_deadline_seconds
      
        # The acknowledgment ID. Either this or ack_ids must be populated,
        # not both.
        # Corresponds to the JSON property `ackId`
        # @return [String]
        attr_accessor :ack_id
      
        # List of acknowledgment IDs. Either this field or ack_id
        # should be populated, not both.
        # Corresponds to the JSON property `ackIds`
        # @return [Array<String>]
        attr_accessor :ack_ids
      
        # Next Index: 5
        # The name of the subscription from which messages are being pulled.
        # Corresponds to the JSON property `subscription`
        # @return [String]
        attr_accessor :subscription
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ack_deadline_seconds = args[:ack_deadline_seconds] if args.key?(:ack_deadline_seconds)
          @ack_id = args[:ack_id] if args.key?(:ack_id)
          @ack_ids = args[:ack_ids] if args.key?(:ack_ids)
          @subscription = args[:subscription] if args.key?(:subscription)
        end
      end
      
      # Request for the ModifyPushConfig method.
      class ModifyPushConfigRequest
        include Google::Apis::Core::Hashable
      
        # Configuration for a push delivery endpoint.
        # Corresponds to the JSON property `pushConfig`
        # @return [Google::Apis::PubsubV1beta1a::PushConfig]
        attr_accessor :push_config
      
        # The name of the subscription.
        # Corresponds to the JSON property `subscription`
        # @return [String]
        attr_accessor :subscription
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @push_config = args[:push_config] if args.key?(:push_config)
          @subscription = args[:subscription] if args.key?(:subscription)
        end
      end
      
      # Request for the PublishBatch method.
      class PublishBatchRequest
        include Google::Apis::Core::Hashable
      
        # The messages to publish.
        # Corresponds to the JSON property `messages`
        # @return [Array<Google::Apis::PubsubV1beta1a::PubsubMessage>]
        attr_accessor :messages
      
        # The messages in the request will be published on this topic.
        # Corresponds to the JSON property `topic`
        # @return [String]
        attr_accessor :topic
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @messages = args[:messages] if args.key?(:messages)
          @topic = args[:topic] if args.key?(:topic)
        end
      end
      
      # Response for the PublishBatch method.
      class PublishBatchResponse
        include Google::Apis::Core::Hashable
      
        # The server-assigned ID of each published message, in the same order as
        # the messages in the request. IDs are guaranteed to be unique within
        # the topic.
        # Corresponds to the JSON property `messageIds`
        # @return [Array<String>]
        attr_accessor :message_ids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @message_ids = args[:message_ids] if args.key?(:message_ids)
        end
      end
      
      # Request for the Publish method.
      class PublishRequest
        include Google::Apis::Core::Hashable
      
        # A message data and its labels.
        # Corresponds to the JSON property `message`
        # @return [Google::Apis::PubsubV1beta1a::PubsubMessage]
        attr_accessor :message
      
        # The message in the request will be published on this topic.
        # Corresponds to the JSON property `topic`
        # @return [String]
        attr_accessor :topic
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @message = args[:message] if args.key?(:message)
          @topic = args[:topic] if args.key?(:topic)
        end
      end
      
      # An event indicating a received message or truncation event.
      class PubsubEvent
        include Google::Apis::Core::Hashable
      
        # Indicates that this subscription has been deleted. (Note that pull
        # subscribers will always receive NOT_FOUND in response in their pull
        # request on the subscription, rather than seeing this boolean.)
        # Corresponds to the JSON property `deleted`
        # @return [Boolean]
        attr_accessor :deleted
        alias_method :deleted?, :deleted
      
        # A message data and its labels.
        # Corresponds to the JSON property `message`
        # @return [Google::Apis::PubsubV1beta1a::PubsubMessage]
        attr_accessor :message
      
        # The subscription that received the event.
        # Corresponds to the JSON property `subscription`
        # @return [String]
        attr_accessor :subscription
      
        # Indicates that this subscription has been truncated.
        # Corresponds to the JSON property `truncated`
        # @return [Boolean]
        attr_accessor :truncated
        alias_method :truncated?, :truncated
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @deleted = args[:deleted] if args.key?(:deleted)
          @message = args[:message] if args.key?(:message)
          @subscription = args[:subscription] if args.key?(:subscription)
          @truncated = args[:truncated] if args.key?(:truncated)
        end
      end
      
      # A message data and its labels.
      class PubsubMessage
        include Google::Apis::Core::Hashable
      
        # The message payload.
        # Corresponds to the JSON property `data`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :data
      
        # Optional list of labels for this message. Keys in this collection must
        # be unique.
        # Corresponds to the JSON property `label`
        # @return [Array<Google::Apis::PubsubV1beta1a::Label>]
        attr_accessor :label
      
        # ID of this message assigned by the server at publication time. Guaranteed
        # to be unique within the topic. This value may be read by a subscriber
        # that receives a PubsubMessage via a Pull call or a push delivery. It must
        # not be populated by a publisher in a Publish call.
        # Corresponds to the JSON property `messageId`
        # @return [String]
        attr_accessor :message_id
      
        # The time at which the message was published.
        # The time is milliseconds since the UNIX epoch.
        # Corresponds to the JSON property `publishTime`
        # @return [Fixnum]
        attr_accessor :publish_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data = args[:data] if args.key?(:data)
          @label = args[:label] if args.key?(:label)
          @message_id = args[:message_id] if args.key?(:message_id)
          @publish_time = args[:publish_time] if args.key?(:publish_time)
        end
      end
      
      # Request for the PullBatch method.
      class PullBatchRequest
        include Google::Apis::Core::Hashable
      
        # The maximum number of PubsubEvents returned for this request. The Pub/Sub
        # system may return fewer than the number of events specified.
        # Corresponds to the JSON property `maxEvents`
        # @return [Fixnum]
        attr_accessor :max_events
      
        # If this is specified as true the system will respond immediately even if
        # it is not able to return a message in the Pull response. Otherwise the
        # system is allowed to wait until at least one message is available rather
        # than returning no messages. The client may cancel the request if it does
        # not wish to wait any longer for the response.
        # Corresponds to the JSON property `returnImmediately`
        # @return [Boolean]
        attr_accessor :return_immediately
        alias_method :return_immediately?, :return_immediately
      
        # The subscription from which messages should be pulled.
        # Corresponds to the JSON property `subscription`
        # @return [String]
        attr_accessor :subscription
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @max_events = args[:max_events] if args.key?(:max_events)
          @return_immediately = args[:return_immediately] if args.key?(:return_immediately)
          @subscription = args[:subscription] if args.key?(:subscription)
        end
      end
      
      # Response for the PullBatch method.
      class PullBatchResponse
        include Google::Apis::Core::Hashable
      
        # Received Pub/Sub messages or status events. The Pub/Sub system will return
        # zero messages if there are no more messages available in the backlog. The
        # Pub/Sub system may return fewer than the max_events requested even if
        # there are more messages available in the backlog.
        # Corresponds to the JSON property `pullResponses`
        # @return [Array<Google::Apis::PubsubV1beta1a::PullResponse>]
        attr_accessor :pull_responses
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @pull_responses = args[:pull_responses] if args.key?(:pull_responses)
        end
      end
      
      # Request for the Pull method.
      class PullRequest
        include Google::Apis::Core::Hashable
      
        # If this is specified as true the system will respond immediately even if
        # it is not able to return a message in the Pull response. Otherwise the
        # system is allowed to wait until at least one message is available rather
        # than returning FAILED_PRECONDITION. The client may cancel the request if
        # it does not wish to wait any longer for the response.
        # Corresponds to the JSON property `returnImmediately`
        # @return [Boolean]
        attr_accessor :return_immediately
        alias_method :return_immediately?, :return_immediately
      
        # The subscription from which a message should be pulled.
        # Corresponds to the JSON property `subscription`
        # @return [String]
        attr_accessor :subscription
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @return_immediately = args[:return_immediately] if args.key?(:return_immediately)
          @subscription = args[:subscription] if args.key?(:subscription)
        end
      end
      
      # Either a <code>PubsubMessage</code> or a truncation event. One of these two
      # must be populated.
      class PullResponse
        include Google::Apis::Core::Hashable
      
        # This ID must be used to acknowledge the received event or message.
        # Corresponds to the JSON property `ackId`
        # @return [String]
        attr_accessor :ack_id
      
        # An event indicating a received message or truncation event.
        # Corresponds to the JSON property `pubsubEvent`
        # @return [Google::Apis::PubsubV1beta1a::PubsubEvent]
        attr_accessor :pubsub_event
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ack_id = args[:ack_id] if args.key?(:ack_id)
          @pubsub_event = args[:pubsub_event] if args.key?(:pubsub_event)
        end
      end
      
      # Configuration for a push delivery endpoint.
      class PushConfig
        include Google::Apis::Core::Hashable
      
        # A URL locating the endpoint to which messages should be pushed.
        # For example, a Webhook endpoint might use "https://example.com/push".
        # Corresponds to the JSON property `pushEndpoint`
        # @return [String]
        attr_accessor :push_endpoint
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @push_endpoint = args[:push_endpoint] if args.key?(:push_endpoint)
        end
      end
      
      # A subscription resource.
      class Subscription
        include Google::Apis::Core::Hashable
      
        # For either push or pull delivery, the value is the maximum time after a
        # subscriber receives a message before the subscriber should acknowledge or
        # Nack the message. If the Ack deadline for a message passes without an
        # Ack or a Nack, the Pub/Sub system will eventually redeliver the message.
        # If a subscriber acknowledges after the deadline, the Pub/Sub system may
        # accept the Ack, but it is possible that the message has been already
        # delivered again. Multiple Acks to the message are allowed and will
        # succeed.
        # For push delivery, this value is used to set the request timeout for
        # the call to the push endpoint.
        # For pull delivery, this value is used as the initial value for the Ack
        # deadline. It may be overridden for each message using its corresponding
        # ack_id with <code>ModifyAckDeadline</code>.
        # While a message is outstanding (i.e. it has been delivered to a pull
        # subscriber and the subscriber has not yet Acked or Nacked), the Pub/Sub
        # system will not deliver that message to another pull subscriber
        # (on a best-effort basis).
        # Corresponds to the JSON property `ackDeadlineSeconds`
        # @return [Fixnum]
        attr_accessor :ack_deadline_seconds
      
        # Name of the subscription.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Configuration for a push delivery endpoint.
        # Corresponds to the JSON property `pushConfig`
        # @return [Google::Apis::PubsubV1beta1a::PushConfig]
        attr_accessor :push_config
      
        # The name of the topic from which this subscription is receiving messages.
        # Corresponds to the JSON property `topic`
        # @return [String]
        attr_accessor :topic
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ack_deadline_seconds = args[:ack_deadline_seconds] if args.key?(:ack_deadline_seconds)
          @name = args[:name] if args.key?(:name)
          @push_config = args[:push_config] if args.key?(:push_config)
          @topic = args[:topic] if args.key?(:topic)
        end
      end
      
      # A topic resource.
      class Topic
        include Google::Apis::Core::Hashable
      
        # Name of the topic.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
        end
      end
    end
  end
end
