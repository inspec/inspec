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
    module FcmV1
      # Firebase Cloud Messaging API
      #
      # FCM send API that provides a cross-platform messaging solution to reliably
      #  deliver messages at no cost.
      #
      # @example
      #    require 'google/apis/fcm_v1'
      #
      #    Fcm = Google::Apis::FcmV1 # Alias the module
      #    service = Fcm::FirebaseCloudMessagingService.new
      #
      # @see https://firebase.google.com/docs/cloud-messaging
      class FirebaseCloudMessagingService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://fcm.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Send a message to specified target (a registration token, topic
        # or condition).
        # @param [String] parent
        #   Required. It contains the Firebase project id (i.e. the unique identifier
        #   for your Firebase project), in the format of `projects/`project_id``.
        #   For legacy support, the numeric project number with no padding is also
        #   supported in the format of `projects/`project_number``.
        # @param [Google::Apis::FcmV1::SendMessageRequest] send_message_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FcmV1::Message] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FcmV1::Message]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def send_message(parent, send_message_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}/messages:send', options)
          command.request_representation = Google::Apis::FcmV1::SendMessageRequest::Representation
          command.request_object = send_message_request_object
          command.response_representation = Google::Apis::FcmV1::Message::Representation
          command.response_class = Google::Apis::FcmV1::Message
          command.params['parent'] = parent unless parent.nil?
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
