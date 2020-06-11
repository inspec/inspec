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

require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module PubsubV1beta1a
      # Cloud Pub/Sub API
      #
      # Provides reliable, many-to-many, asynchronous messaging between applications.
      #
      # @example
      #    require 'google/apis/pubsub_v1beta1a'
      #
      #    Pubsub = Google::Apis::PubsubV1beta1a # Alias the module
      #    service = Pubsub::PubsubService.new
      #
      # @see https://cloud.google.com/pubsub/docs
      class PubsubService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://pubsub.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Acknowledges a particular received message: the Pub/Sub system can remove
        # the given message from the subscription. Acknowledging a message whose
        # Ack deadline has expired may succeed, but the message could have been
        # already redelivered. Acknowledging a message more than once will not
        # result in an error. This is only used for messages received via pull.
        # @param [Google::Apis::PubsubV1beta1a::AcknowledgeRequest] acknowledge_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1beta1a::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1beta1a::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def acknowledge_subscription(acknowledge_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1a/subscriptions/acknowledge', options)
          command.request_representation = Google::Apis::PubsubV1beta1a::AcknowledgeRequest::Representation
          command.request_object = acknowledge_request_object
          command.response_representation = Google::Apis::PubsubV1beta1a::Empty::Representation
          command.response_class = Google::Apis::PubsubV1beta1a::Empty
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a subscription on a given topic for a given subscriber.
        # If the subscription already exists, returns ALREADY_EXISTS.
        # If the corresponding topic doesn't exist, returns NOT_FOUND.
        # If the name is not provided in the request, the server will assign a random
        # name for this subscription on the same project as the topic.
        # @param [Google::Apis::PubsubV1beta1a::Subscription] subscription_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1beta1a::Subscription] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1beta1a::Subscription]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_subscription(subscription_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1a/subscriptions', options)
          command.request_representation = Google::Apis::PubsubV1beta1a::Subscription::Representation
          command.request_object = subscription_object
          command.response_representation = Google::Apis::PubsubV1beta1a::Subscription::Representation
          command.response_class = Google::Apis::PubsubV1beta1a::Subscription
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes an existing subscription. All pending messages in the subscription
        # are immediately dropped. Calls to Pull after deletion will return
        # NOT_FOUND.
        # @param [String] subscription
        #   The subscription to delete.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1beta1a::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1beta1a::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_subscription(subscription, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1beta1a/subscriptions/{+subscription}', options)
          command.response_representation = Google::Apis::PubsubV1beta1a::Empty::Representation
          command.response_class = Google::Apis::PubsubV1beta1a::Empty
          command.params['subscription'] = subscription unless subscription.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the configuration details of a subscription.
        # @param [String] subscription
        #   The name of the subscription to get.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1beta1a::Subscription] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1beta1a::Subscription]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_subscription(subscription, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1a/subscriptions/{+subscription}', options)
          command.response_representation = Google::Apis::PubsubV1beta1a::Subscription::Representation
          command.response_class = Google::Apis::PubsubV1beta1a::Subscription
          command.params['subscription'] = subscription unless subscription.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists matching subscriptions.
        # @param [Fixnum] max_results
        #   Maximum number of subscriptions to return.
        # @param [String] page_token
        #   The value obtained in the last <code>ListSubscriptionsResponse</code>
        #   for continuation.
        # @param [String] query
        #   A valid label query expression.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1beta1a::ListSubscriptionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1beta1a::ListSubscriptionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_subscriptions(max_results: nil, page_token: nil, query: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1a/subscriptions', options)
          command.response_representation = Google::Apis::PubsubV1beta1a::ListSubscriptionsResponse::Representation
          command.response_class = Google::Apis::PubsubV1beta1a::ListSubscriptionsResponse
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['query'] = query unless query.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Modifies the Ack deadline for a message received from a pull request.
        # @param [Google::Apis::PubsubV1beta1a::ModifyAckDeadlineRequest] modify_ack_deadline_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1beta1a::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1beta1a::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def modify_subscription_ack_deadline(modify_ack_deadline_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1a/subscriptions/modifyAckDeadline', options)
          command.request_representation = Google::Apis::PubsubV1beta1a::ModifyAckDeadlineRequest::Representation
          command.request_object = modify_ack_deadline_request_object
          command.response_representation = Google::Apis::PubsubV1beta1a::Empty::Representation
          command.response_class = Google::Apis::PubsubV1beta1a::Empty
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Modifies the <code>PushConfig</code> for a specified subscription.
        # This method can be used to suspend the flow of messages to an endpoint
        # by clearing the <code>PushConfig</code> field in the request. Messages
        # will be accumulated for delivery even if no push configuration is
        # defined or while the configuration is modified.
        # @param [Google::Apis::PubsubV1beta1a::ModifyPushConfigRequest] modify_push_config_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1beta1a::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1beta1a::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def modify_subscription_push_config(modify_push_config_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1a/subscriptions/modifyPushConfig', options)
          command.request_representation = Google::Apis::PubsubV1beta1a::ModifyPushConfigRequest::Representation
          command.request_object = modify_push_config_request_object
          command.response_representation = Google::Apis::PubsubV1beta1a::Empty::Representation
          command.response_class = Google::Apis::PubsubV1beta1a::Empty
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Pulls a single message from the server.
        # If return_immediately is true, and no messages are available in the
        # subscription, this method returns FAILED_PRECONDITION. The system is free
        # to return an UNAVAILABLE error if no messages are available in a
        # reasonable amount of time (to reduce system load).
        # @param [Google::Apis::PubsubV1beta1a::PullRequest] pull_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1beta1a::PullResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1beta1a::PullResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def pull_subscription(pull_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1a/subscriptions/pull', options)
          command.request_representation = Google::Apis::PubsubV1beta1a::PullRequest::Representation
          command.request_object = pull_request_object
          command.response_representation = Google::Apis::PubsubV1beta1a::PullResponse::Representation
          command.response_class = Google::Apis::PubsubV1beta1a::PullResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Pulls messages from the server. Returns an empty list if there are no
        # messages available in the backlog. The system is free to return UNAVAILABLE
        # if there are too many pull requests outstanding for the given subscription.
        # @param [Google::Apis::PubsubV1beta1a::PullBatchRequest] pull_batch_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1beta1a::PullBatchResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1beta1a::PullBatchResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def pull_subscription_batch(pull_batch_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1a/subscriptions/pullBatch', options)
          command.request_representation = Google::Apis::PubsubV1beta1a::PullBatchRequest::Representation
          command.request_object = pull_batch_request_object
          command.response_representation = Google::Apis::PubsubV1beta1a::PullBatchResponse::Representation
          command.response_class = Google::Apis::PubsubV1beta1a::PullBatchResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates the given topic with the given name.
        # @param [Google::Apis::PubsubV1beta1a::Topic] topic_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1beta1a::Topic] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1beta1a::Topic]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_topic(topic_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1a/topics', options)
          command.request_representation = Google::Apis::PubsubV1beta1a::Topic::Representation
          command.request_object = topic_object
          command.response_representation = Google::Apis::PubsubV1beta1a::Topic::Representation
          command.response_class = Google::Apis::PubsubV1beta1a::Topic
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the topic with the given name. Returns NOT_FOUND if the topic does
        # not exist. After a topic is deleted, a new topic may be created with the
        # same name.
        # @param [String] topic
        #   Name of the topic to delete.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1beta1a::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1beta1a::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_topic(topic, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1beta1a/topics/{+topic}', options)
          command.response_representation = Google::Apis::PubsubV1beta1a::Empty::Representation
          command.response_class = Google::Apis::PubsubV1beta1a::Empty
          command.params['topic'] = topic unless topic.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the configuration of a topic. Since the topic only has the name
        # attribute, this method is only useful to check the existence of a topic.
        # If other attributes are added in the future, they will be returned here.
        # @param [String] topic
        #   The name of the topic to get.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1beta1a::Topic] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1beta1a::Topic]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_topic(topic, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1a/topics/{+topic}', options)
          command.response_representation = Google::Apis::PubsubV1beta1a::Topic::Representation
          command.response_class = Google::Apis::PubsubV1beta1a::Topic
          command.params['topic'] = topic unless topic.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists matching topics.
        # @param [Fixnum] max_results
        #   Maximum number of topics to return.
        # @param [String] page_token
        #   The value obtained in the last <code>ListTopicsResponse</code>
        #   for continuation.
        # @param [String] query
        #   A valid label query expression.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1beta1a::ListTopicsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1beta1a::ListTopicsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_topics(max_results: nil, page_token: nil, query: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1a/topics', options)
          command.response_representation = Google::Apis::PubsubV1beta1a::ListTopicsResponse::Representation
          command.response_class = Google::Apis::PubsubV1beta1a::ListTopicsResponse
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['query'] = query unless query.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Adds a message to the topic.  Returns NOT_FOUND if the topic does not
        # exist.
        # @param [Google::Apis::PubsubV1beta1a::PublishRequest] publish_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1beta1a::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1beta1a::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def publish_topic(publish_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1a/topics/publish', options)
          command.request_representation = Google::Apis::PubsubV1beta1a::PublishRequest::Representation
          command.request_object = publish_request_object
          command.response_representation = Google::Apis::PubsubV1beta1a::Empty::Representation
          command.response_class = Google::Apis::PubsubV1beta1a::Empty
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Adds one or more messages to the topic. Returns NOT_FOUND if the topic does
        # not exist.
        # @param [Google::Apis::PubsubV1beta1a::PublishBatchRequest] publish_batch_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1beta1a::PublishBatchResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1beta1a::PublishBatchResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def publish_topic_batch(publish_batch_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1a/topics/publishBatch', options)
          command.request_representation = Google::Apis::PubsubV1beta1a::PublishBatchRequest::Representation
          command.request_object = publish_batch_request_object
          command.response_representation = Google::Apis::PubsubV1beta1a::PublishBatchResponse::Representation
          command.response_class = Google::Apis::PubsubV1beta1a::PublishBatchResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end

        protected

        def apply_command_defaults(command)
          command.query['key'] = key unless key.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
        end
      end
    end
  end
end
