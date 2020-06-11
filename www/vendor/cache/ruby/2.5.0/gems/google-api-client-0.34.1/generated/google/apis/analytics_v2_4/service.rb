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
    module AnalyticsV2_4
      # Google Analytics API
      #
      # Views and manages your Google Analytics data.
      #
      # @example
      #    require 'google/apis/analytics_v2_4'
      #
      #    Analytics = Google::Apis::AnalyticsV2_4 # Alias the module
      #    service = Analytics::AnalyticsService.new
      #
      # @see https://developers.google.com/analytics/
      class AnalyticsService < Google::Apis::Core::BaseService
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
          super('https://www.googleapis.com/', 'analytics/v2.4/')
          @batch_path = 'batch/analytics/v2.4'
        end
        
        # Returns Analytics report data for a view (profile).
        # @param [String] ids
        #   Unique table ID for retrieving report data. Table ID is of the form ga:XXXX,
        #   where XXXX is the Analytics view (profile) ID.
        # @param [String] start_date
        #   Start date for fetching report data. All requests should specify a start date
        #   formatted as YYYY-MM-DD.
        # @param [String] end_date
        #   End date for fetching report data. All requests should specify an end date
        #   formatted as YYYY-MM-DD.
        # @param [String] metrics
        #   A comma-separated list of Analytics metrics. E.g., 'ga:sessions,ga:pageviews'.
        #   At least one metric must be specified to retrieve a valid Analytics report.
        # @param [String] dimensions
        #   A comma-separated list of Analytics dimensions. E.g., 'ga:browser,ga:city'.
        # @param [String] filters
        #   A comma-separated list of dimension or metric filters to be applied to the
        #   report data.
        # @param [Fixnum] max_results
        #   The maximum number of entries to include in this feed.
        # @param [String] segment
        #   An Analytics advanced segment to be applied to the report data.
        # @param [String] sort
        #   A comma-separated list of dimensions or metrics that determine the sort order
        #   for the report data.
        # @param [Fixnum] start_index
        #   An index of the first entity to retrieve. Use this parameter as a pagination
        #   mechanism along with the max-results parameter.
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_datum(ids, start_date, end_date, metrics, dimensions: nil, filters: nil, max_results: nil, segment: nil, sort: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'data', options)
          command.query['dimensions'] = dimensions unless dimensions.nil?
          command.query['end-date'] = end_date unless end_date.nil?
          command.query['filters'] = filters unless filters.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['max-results'] = max_results unless max_results.nil?
          command.query['metrics'] = metrics unless metrics.nil?
          command.query['segment'] = segment unless segment.nil?
          command.query['sort'] = sort unless sort.nil?
          command.query['start-date'] = start_date unless start_date.nil?
          command.query['start-index'] = start_index unless start_index.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all accounts to which the user has access.
        # @param [Fixnum] max_results
        #   The maximum number of accounts to include in this response.
        # @param [Fixnum] start_index
        #   An index of the first account to retrieve. Use this parameter as a pagination
        #   mechanism along with the max-results parameter.
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_management_accounts(max_results: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accounts', options)
          command.query['max-results'] = max_results unless max_results.nil?
          command.query['start-index'] = start_index unless start_index.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists goals to which the user has access.
        # @param [String] account_id
        #   Account ID to retrieve goals for. Can either be a specific account ID or '~all'
        #   , which refers to all the accounts that user has access to.
        # @param [String] web_property_id
        #   Web property ID to retrieve goals for. Can either be a specific web property
        #   ID or '~all', which refers to all the web properties that user has access to.
        # @param [String] profile_id
        #   View (Profile) ID to retrieve goals for. Can either be a specific view (
        #   profile) ID or '~all', which refers to all the views (profiles) that user has
        #   access to.
        # @param [Fixnum] max_results
        #   The maximum number of goals to include in this response.
        # @param [Fixnum] start_index
        #   An index of the first goal to retrieve. Use this parameter as a pagination
        #   mechanism along with the max-results parameter.
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_management_goals(account_id, web_property_id, profile_id, max_results: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}/goals', options)
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['max-results'] = max_results unless max_results.nil?
          command.query['start-index'] = start_index unless start_index.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists views (profiles) to which the user has access.
        # @param [String] account_id
        #   Account ID for the views (profiles) to retrieve. Can either be a specific
        #   account ID or '~all', which refers to all the accounts to which the user has
        #   access.
        # @param [String] web_property_id
        #   Web property ID for the views (profiles) to retrieve. Can either be a specific
        #   web property ID or '~all', which refers to all the web properties to which the
        #   user has access.
        # @param [Fixnum] max_results
        #   The maximum number of views (profiles) to include in this response.
        # @param [Fixnum] start_index
        #   An index of the first entity to retrieve. Use this parameter as a pagination
        #   mechanism along with the max-results parameter.
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_management_profiles(account_id, web_property_id, max_results: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accounts/{accountId}/webproperties/{webPropertyId}/profiles', options)
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.query['max-results'] = max_results unless max_results.nil?
          command.query['start-index'] = start_index unless start_index.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists advanced segments to which the user has access.
        # @param [Fixnum] max_results
        #   The maximum number of advanced segments to include in this response.
        # @param [Fixnum] start_index
        #   An index of the first advanced segment to retrieve. Use this parameter as a
        #   pagination mechanism along with the max-results parameter.
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_management_segments(max_results: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/segments', options)
          command.query['max-results'] = max_results unless max_results.nil?
          command.query['start-index'] = start_index unless start_index.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists web properties to which the user has access.
        # @param [String] account_id
        #   Account ID to retrieve web properties for. Can either be a specific account ID
        #   or '~all', which refers to all the accounts that user has access to.
        # @param [Fixnum] max_results
        #   The maximum number of web properties to include in this response.
        # @param [Fixnum] start_index
        #   An index of the first entity to retrieve. Use this parameter as a pagination
        #   mechanism along with the max-results parameter.
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_management_webproperties(account_id, max_results: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accounts/{accountId}/webproperties', options)
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['max-results'] = max_results unless max_results.nil?
          command.query['start-index'] = start_index unless start_index.nil?
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
