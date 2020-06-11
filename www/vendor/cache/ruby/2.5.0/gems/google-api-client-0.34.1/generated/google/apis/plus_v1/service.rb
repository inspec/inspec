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
    module PlusV1
      # Google+ API
      #
      # Builds on top of the Google+ platform.
      #
      # @example
      #    require 'google/apis/plus_v1'
      #
      #    Plus = Google::Apis::PlusV1 # Alias the module
      #    service = Plus::PlusService.new
      #
      # @see https://developers.google.com/+/api/
      class PlusService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  An opaque string that represents a user for quota purposes. Must not exceed 40
        #  characters.
        attr_accessor :quota_user

        # @return [String]
        #  Deprecated. Please use quotaUser instead.
        attr_accessor :user_ip

        def initialize
          super('https://www.googleapis.com/', 'plus/v1/')
          @batch_path = 'batch/plus/v1'
        end
        
        # Shut down. See https://developers.google.com/+/api-shutdown for more details.
        # @param [String] activity_id
        #   The ID of the activity to get.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PlusV1::Activity] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PlusV1::Activity]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_activity(activity_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'activities/{activityId}', options)
          command.response_representation = Google::Apis::PlusV1::Activity::Representation
          command.response_class = Google::Apis::PlusV1::Activity
          command.params['activityId'] = activity_id unless activity_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Shut down. See https://developers.google.com/+/api-shutdown for more details.
        # @param [String] user_id
        #   The ID of the user to get activities for. The special value "me" can be used
        #   to indicate the authenticated user.
        # @param [String] collection
        #   The collection of activities to list.
        # @param [Fixnum] max_results
        #   The maximum number of activities to include in the response, which is used for
        #   paging. For any response, the actual number returned might be less than the
        #   specified maxResults.
        # @param [String] page_token
        #   The continuation token, which is used to page through large result sets. To
        #   get the next page of results, set this parameter to the value of "
        #   nextPageToken" from the previous response.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PlusV1::ActivityFeed] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PlusV1::ActivityFeed]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_activities(user_id, collection, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'people/{userId}/activities/{collection}', options)
          command.response_representation = Google::Apis::PlusV1::ActivityFeed::Representation
          command.response_class = Google::Apis::PlusV1::ActivityFeed
          command.params['userId'] = user_id unless user_id.nil?
          command.params['collection'] = collection unless collection.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Shut down. See https://developers.google.com/+/api-shutdown for more details.
        # @param [String] query
        #   Full-text search query string.
        # @param [String] language
        #   Specify the preferred language to search with. See search language codes for
        #   available values.
        # @param [Fixnum] max_results
        #   The maximum number of activities to include in the response, which is used for
        #   paging. For any response, the actual number returned might be less than the
        #   specified maxResults.
        # @param [String] order_by
        #   Specifies how to order search results.
        # @param [String] page_token
        #   The continuation token, which is used to page through large result sets. To
        #   get the next page of results, set this parameter to the value of "
        #   nextPageToken" from the previous response. This token can be of any length.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PlusV1::ActivityFeed] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PlusV1::ActivityFeed]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def search_activities(query, language: nil, max_results: nil, order_by: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'activities', options)
          command.response_representation = Google::Apis::PlusV1::ActivityFeed::Representation
          command.response_class = Google::Apis::PlusV1::ActivityFeed
          command.query['language'] = language unless language.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['query'] = query unless query.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Shut down. See https://developers.google.com/+/api-shutdown for more details.
        # @param [String] comment_id
        #   The ID of the comment to get.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PlusV1::Comment] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PlusV1::Comment]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_comment(comment_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'comments/{commentId}', options)
          command.response_representation = Google::Apis::PlusV1::Comment::Representation
          command.response_class = Google::Apis::PlusV1::Comment
          command.params['commentId'] = comment_id unless comment_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Shut down. See https://developers.google.com/+/api-shutdown for more details.
        # @param [String] activity_id
        #   The ID of the activity to get comments for.
        # @param [Fixnum] max_results
        #   The maximum number of comments to include in the response, which is used for
        #   paging. For any response, the actual number returned might be less than the
        #   specified maxResults.
        # @param [String] page_token
        #   The continuation token, which is used to page through large result sets. To
        #   get the next page of results, set this parameter to the value of "
        #   nextPageToken" from the previous response.
        # @param [String] sort_order
        #   The order in which to sort the list of comments.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PlusV1::CommentFeed] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PlusV1::CommentFeed]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_comments(activity_id, max_results: nil, page_token: nil, sort_order: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'activities/{activityId}/comments', options)
          command.response_representation = Google::Apis::PlusV1::CommentFeed::Representation
          command.response_class = Google::Apis::PlusV1::CommentFeed
          command.params['activityId'] = activity_id unless activity_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get a person's profile. If your app uses scope https://www.googleapis.com/auth/
        # plus.login, this method is guaranteed to return ageRange and language.
        # @param [String] user_id
        #   The ID of the person to get the profile for. The special value "me" can be
        #   used to indicate the authenticated user.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PlusV1::Person] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PlusV1::Person]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_person(user_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'people/{userId}', options)
          command.response_representation = Google::Apis::PlusV1::Person::Representation
          command.response_class = Google::Apis::PlusV1::Person
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all of the people in the specified collection.
        # @param [String] user_id
        #   Get the collection of people for the person identified. Use "me" to indicate
        #   the authenticated user.
        # @param [String] collection
        #   The collection of people to list.
        # @param [Fixnum] max_results
        #   The maximum number of people to include in the response, which is used for
        #   paging. For any response, the actual number returned might be less than the
        #   specified maxResults.
        # @param [String] order_by
        #   The order to return people in.
        # @param [String] page_token
        #   The continuation token, which is used to page through large result sets. To
        #   get the next page of results, set this parameter to the value of "
        #   nextPageToken" from the previous response.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PlusV1::PeopleFeed] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PlusV1::PeopleFeed]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_people(user_id, collection, max_results: nil, order_by: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'people/{userId}/people/{collection}', options)
          command.response_representation = Google::Apis::PlusV1::PeopleFeed::Representation
          command.response_class = Google::Apis::PlusV1::PeopleFeed
          command.params['userId'] = user_id unless user_id.nil?
          command.params['collection'] = collection unless collection.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Shut down. See https://developers.google.com/+/api-shutdown for more details.
        # @param [String] activity_id
        #   The ID of the activity to get the list of people for.
        # @param [String] collection
        #   The collection of people to list.
        # @param [Fixnum] max_results
        #   The maximum number of people to include in the response, which is used for
        #   paging. For any response, the actual number returned might be less than the
        #   specified maxResults.
        # @param [String] page_token
        #   The continuation token, which is used to page through large result sets. To
        #   get the next page of results, set this parameter to the value of "
        #   nextPageToken" from the previous response.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PlusV1::PeopleFeed] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PlusV1::PeopleFeed]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_people_by_activity(activity_id, collection, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'activities/{activityId}/people/{collection}', options)
          command.response_representation = Google::Apis::PlusV1::PeopleFeed::Representation
          command.response_class = Google::Apis::PlusV1::PeopleFeed
          command.params['activityId'] = activity_id unless activity_id.nil?
          command.params['collection'] = collection unless collection.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Shut down. See https://developers.google.com/+/api-shutdown for more details.
        # @param [String] query
        #   Specify a query string for full text search of public text in all profiles.
        # @param [String] language
        #   Specify the preferred language to search with. See search language codes for
        #   available values.
        # @param [Fixnum] max_results
        #   The maximum number of people to include in the response, which is used for
        #   paging. For any response, the actual number returned might be less than the
        #   specified maxResults.
        # @param [String] page_token
        #   The continuation token, which is used to page through large result sets. To
        #   get the next page of results, set this parameter to the value of "
        #   nextPageToken" from the previous response. This token can be of any length.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PlusV1::PeopleFeed] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PlusV1::PeopleFeed]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def search_people(query, language: nil, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'people', options)
          command.response_representation = Google::Apis::PlusV1::PeopleFeed::Representation
          command.response_class = Google::Apis::PlusV1::PeopleFeed
          command.query['language'] = language unless language.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['query'] = query unless query.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end

        protected

        def apply_command_defaults(command)
          command.query['key'] = key unless key.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
        end
      end
    end
  end
end
