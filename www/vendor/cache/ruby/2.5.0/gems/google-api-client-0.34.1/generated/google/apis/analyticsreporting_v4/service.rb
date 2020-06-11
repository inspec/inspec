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
    module AnalyticsreportingV4
      # Analytics Reporting API
      #
      # Accesses Analytics report data.
      #
      # @example
      #    require 'google/apis/analyticsreporting_v4'
      #
      #    Analyticsreporting = Google::Apis::AnalyticsreportingV4 # Alias the module
      #    service = Analyticsreporting::AnalyticsReportingService.new
      #
      # @see https://developers.google.com/analytics/devguides/reporting/core/v4/
      class AnalyticsReportingService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://analyticsreporting.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Returns the Analytics data.
        # @param [Google::Apis::AnalyticsreportingV4::GetReportsRequest] get_reports_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AnalyticsreportingV4::GetReportsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsreportingV4::GetReportsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_get_reports(get_reports_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v4/reports:batchGet', options)
          command.request_representation = Google::Apis::AnalyticsreportingV4::GetReportsRequest::Representation
          command.request_object = get_reports_request_object
          command.response_representation = Google::Apis::AnalyticsreportingV4::GetReportsResponse::Representation
          command.response_class = Google::Apis::AnalyticsreportingV4::GetReportsResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns User Activity data.
        # @param [Google::Apis::AnalyticsreportingV4::SearchUserActivityRequest] search_user_activity_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AnalyticsreportingV4::SearchUserActivityResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsreportingV4::SearchUserActivityResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def search_user_activity(search_user_activity_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v4/userActivity:search', options)
          command.request_representation = Google::Apis::AnalyticsreportingV4::SearchUserActivityRequest::Representation
          command.request_object = search_user_activity_request_object
          command.response_representation = Google::Apis::AnalyticsreportingV4::SearchUserActivityResponse::Representation
          command.response_class = Google::Apis::AnalyticsreportingV4::SearchUserActivityResponse
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
