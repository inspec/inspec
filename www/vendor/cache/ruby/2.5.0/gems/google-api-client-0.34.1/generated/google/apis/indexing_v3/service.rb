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
    module IndexingV3
      # Indexing API
      #
      # Notifies Google when your web pages change.
      #
      # @example
      #    require 'google/apis/indexing_v3'
      #
      #    Indexing = Google::Apis::IndexingV3 # Alias the module
      #    service = Indexing::IndexingService.new
      #
      # @see https://developers.google.com/search/apis/indexing-api/
      class IndexingService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://indexing.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Gets metadata about a Web Document. This method can _only_ be used to query
        # URLs that were previously seen in successful Indexing API notifications.
        # Includes the latest `UrlNotification` received via this API.
        # @param [String] url
        #   URL that is being queried.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IndexingV3::UrlNotificationMetadata] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IndexingV3::UrlNotificationMetadata]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_url_notification_metadata(url: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v3/urlNotifications/metadata', options)
          command.response_representation = Google::Apis::IndexingV3::UrlNotificationMetadata::Representation
          command.response_class = Google::Apis::IndexingV3::UrlNotificationMetadata
          command.query['url'] = url unless url.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Notifies that a URL has been updated or deleted.
        # @param [Google::Apis::IndexingV3::UrlNotification] url_notification_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IndexingV3::PublishUrlNotificationResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IndexingV3::PublishUrlNotificationResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def publish_url_notification(url_notification_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v3/urlNotifications:publish', options)
          command.request_representation = Google::Apis::IndexingV3::UrlNotification::Representation
          command.request_object = url_notification_object
          command.response_representation = Google::Apis::IndexingV3::PublishUrlNotificationResponse::Representation
          command.response_class = Google::Apis::IndexingV3::PublishUrlNotificationResponse
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
