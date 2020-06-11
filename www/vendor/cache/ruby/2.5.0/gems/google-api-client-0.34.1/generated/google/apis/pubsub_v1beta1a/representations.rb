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
      
      class AcknowledgeRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Label
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListSubscriptionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListTopicsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ModifyAckDeadlineRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ModifyPushConfigRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PublishBatchRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PublishBatchResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PublishRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PubsubEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PubsubMessage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PullBatchRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PullBatchResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PullRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PullResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PushConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Subscription
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Topic
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AcknowledgeRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :ack_id, as: 'ackId'
          property :subscription, as: 'subscription'
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class Label
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          property :num_value, :numeric_string => true, as: 'numValue'
          property :str_value, as: 'strValue'
        end
      end
      
      class ListSubscriptionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :subscription, as: 'subscription', class: Google::Apis::PubsubV1beta1a::Subscription, decorator: Google::Apis::PubsubV1beta1a::Subscription::Representation
      
        end
      end
      
      class ListTopicsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :topic, as: 'topic', class: Google::Apis::PubsubV1beta1a::Topic, decorator: Google::Apis::PubsubV1beta1a::Topic::Representation
      
        end
      end
      
      class ModifyAckDeadlineRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ack_deadline_seconds, as: 'ackDeadlineSeconds'
          property :ack_id, as: 'ackId'
          collection :ack_ids, as: 'ackIds'
          property :subscription, as: 'subscription'
        end
      end
      
      class ModifyPushConfigRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :push_config, as: 'pushConfig', class: Google::Apis::PubsubV1beta1a::PushConfig, decorator: Google::Apis::PubsubV1beta1a::PushConfig::Representation
      
          property :subscription, as: 'subscription'
        end
      end
      
      class PublishBatchRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :messages, as: 'messages', class: Google::Apis::PubsubV1beta1a::PubsubMessage, decorator: Google::Apis::PubsubV1beta1a::PubsubMessage::Representation
      
          property :topic, as: 'topic'
        end
      end
      
      class PublishBatchResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :message_ids, as: 'messageIds'
        end
      end
      
      class PublishRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :message, as: 'message', class: Google::Apis::PubsubV1beta1a::PubsubMessage, decorator: Google::Apis::PubsubV1beta1a::PubsubMessage::Representation
      
          property :topic, as: 'topic'
        end
      end
      
      class PubsubEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :deleted, as: 'deleted'
          property :message, as: 'message', class: Google::Apis::PubsubV1beta1a::PubsubMessage, decorator: Google::Apis::PubsubV1beta1a::PubsubMessage::Representation
      
          property :subscription, as: 'subscription'
          property :truncated, as: 'truncated'
        end
      end
      
      class PubsubMessage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :data, :base64 => true, as: 'data'
          collection :label, as: 'label', class: Google::Apis::PubsubV1beta1a::Label, decorator: Google::Apis::PubsubV1beta1a::Label::Representation
      
          property :message_id, as: 'messageId'
          property :publish_time, :numeric_string => true, as: 'publishTime'
        end
      end
      
      class PullBatchRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :max_events, as: 'maxEvents'
          property :return_immediately, as: 'returnImmediately'
          property :subscription, as: 'subscription'
        end
      end
      
      class PullBatchResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :pull_responses, as: 'pullResponses', class: Google::Apis::PubsubV1beta1a::PullResponse, decorator: Google::Apis::PubsubV1beta1a::PullResponse::Representation
      
        end
      end
      
      class PullRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :return_immediately, as: 'returnImmediately'
          property :subscription, as: 'subscription'
        end
      end
      
      class PullResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ack_id, as: 'ackId'
          property :pubsub_event, as: 'pubsubEvent', class: Google::Apis::PubsubV1beta1a::PubsubEvent, decorator: Google::Apis::PubsubV1beta1a::PubsubEvent::Representation
      
        end
      end
      
      class PushConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :push_endpoint, as: 'pushEndpoint'
        end
      end
      
      class Subscription
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ack_deadline_seconds, as: 'ackDeadlineSeconds'
          property :name, as: 'name'
          property :push_config, as: 'pushConfig', class: Google::Apis::PubsubV1beta1a::PushConfig, decorator: Google::Apis::PubsubV1beta1a::PushConfig::Representation
      
          property :topic, as: 'topic'
        end
      end
      
      class Topic
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
        end
      end
    end
  end
end
