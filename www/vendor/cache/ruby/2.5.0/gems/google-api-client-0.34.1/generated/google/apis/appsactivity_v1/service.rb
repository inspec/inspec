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
    module AppsactivityV1
      # Drive Activity API
      #
      # Provides a historical view of activity.
      #
      # @example
      #    require 'google/apis/appsactivity_v1'
      #
      #    Appsactivity = Google::Apis::AppsactivityV1 # Alias the module
      #    service = Appsactivity::AppsactivityService.new
      #
      # @see https://developers.google.com/google-apps/activity/
      class AppsactivityService < Google::Apis::Core::BaseService
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
          super('https://www.googleapis.com/', 'appsactivity/v1/')
          @batch_path = 'batch/appsactivity/v1'
        end
        
        # Returns a list of activities visible to the current logged in user. Visible
        # activities are determined by the visibility settings of the object that was
        # acted on, e.g. Drive files a user can see. An activity is a record of past
        # events. Multiple events may be merged if they are similar. A request is scoped
        # to activities from a given Google service using the source parameter.
        # @param [String] drive_ancestor_id
        #   Identifies the Drive folder containing the items for which to return
        #   activities.
        # @param [String] drive_file_id
        #   Identifies the Drive item to return activities for.
        # @param [String] grouping_strategy
        #   Indicates the strategy to use when grouping singleEvents items in the
        #   associated combinedEvent object.
        # @param [Fixnum] page_size
        #   The maximum number of events to return on a page. The response includes a
        #   continuation token if there are more events.
        # @param [String] page_token
        #   A token to retrieve a specific page of results.
        # @param [String] source
        #   The Google service from which to return activities. Possible values of source
        #   are:
        #   - drive.google.com
        # @param [String] user_id
        #   The ID used for ACL checks (does not filter the resulting event list by the
        #   assigned value). Use the special value me to indicate the currently
        #   authenticated user.
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
        # @yieldparam result [Google::Apis::AppsactivityV1::ListActivitiesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppsactivityV1::ListActivitiesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_activities(drive_ancestor_id: nil, drive_file_id: nil, grouping_strategy: nil, page_size: nil, page_token: nil, source: nil, user_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'activities', options)
          command.response_representation = Google::Apis::AppsactivityV1::ListActivitiesResponse::Representation
          command.response_class = Google::Apis::AppsactivityV1::ListActivitiesResponse
          command.query['drive.ancestorId'] = drive_ancestor_id unless drive_ancestor_id.nil?
          command.query['drive.fileId'] = drive_file_id unless drive_file_id.nil?
          command.query['groupingStrategy'] = grouping_strategy unless grouping_strategy.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['source'] = source unless source.nil?
          command.query['userId'] = user_id unless user_id.nil?
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
