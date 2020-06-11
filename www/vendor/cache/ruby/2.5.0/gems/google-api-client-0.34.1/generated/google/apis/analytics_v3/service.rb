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
    module AnalyticsV3
      # Google Analytics API
      #
      # Views and manages your Google Analytics data.
      #
      # @example
      #    require 'google/apis/analytics_v3'
      #
      #    Analytics = Google::Apis::AnalyticsV3 # Alias the module
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
          super('https://www.googleapis.com/', 'analytics/v3/')
          @batch_path = 'batch/analytics/v3'
        end
        
        # Returns Analytics data for a view (profile).
        # @param [String] ids
        #   Unique table ID for retrieving Analytics data. Table ID is of the form ga:XXXX,
        #   where XXXX is the Analytics view (profile) ID.
        # @param [String] start_date
        #   Start date for fetching Analytics data. Requests can specify a start date
        #   formatted as YYYY-MM-DD, or as a relative date (e.g., today, yesterday, or
        #   7daysAgo). The default value is 7daysAgo.
        # @param [String] end_date
        #   End date for fetching Analytics data. Request can should specify an end date
        #   formatted as YYYY-MM-DD, or as a relative date (e.g., today, yesterday, or
        #   7daysAgo). The default value is yesterday.
        # @param [String] metrics
        #   A comma-separated list of Analytics metrics. E.g., 'ga:sessions,ga:pageviews'.
        #   At least one metric must be specified.
        # @param [String] dimensions
        #   A comma-separated list of Analytics dimensions. E.g., 'ga:browser,ga:city'.
        # @param [String] filters
        #   A comma-separated list of dimension or metric filters to be applied to
        #   Analytics data.
        # @param [Boolean] include_empty_rows
        #   The response will include empty rows if this parameter is set to true, the
        #   default is true
        # @param [Fixnum] max_results
        #   The maximum number of entries to include in this feed.
        # @param [String] output
        #   The selected format for the response. Default format is JSON.
        # @param [String] sampling_level
        #   The desired sampling level.
        # @param [String] segment
        #   An Analytics segment to be applied to data.
        # @param [String] sort
        #   A comma-separated list of dimensions or metrics that determine the sort order
        #   for Analytics data.
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
        # @yieldparam result [Google::Apis::AnalyticsV3::GaData] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::GaData]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_ga_data(ids, start_date, end_date, metrics, dimensions: nil, filters: nil, include_empty_rows: nil, max_results: nil, output: nil, sampling_level: nil, segment: nil, sort: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'data/ga', options)
          command.response_representation = Google::Apis::AnalyticsV3::GaData::Representation
          command.response_class = Google::Apis::AnalyticsV3::GaData
          command.query['dimensions'] = dimensions unless dimensions.nil?
          command.query['end-date'] = end_date unless end_date.nil?
          command.query['filters'] = filters unless filters.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['include-empty-rows'] = include_empty_rows unless include_empty_rows.nil?
          command.query['max-results'] = max_results unless max_results.nil?
          command.query['metrics'] = metrics unless metrics.nil?
          command.query['output'] = output unless output.nil?
          command.query['samplingLevel'] = sampling_level unless sampling_level.nil?
          command.query['segment'] = segment unless segment.nil?
          command.query['sort'] = sort unless sort.nil?
          command.query['start-date'] = start_date unless start_date.nil?
          command.query['start-index'] = start_index unless start_index.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns Analytics Multi-Channel Funnels data for a view (profile).
        # @param [String] ids
        #   Unique table ID for retrieving Analytics data. Table ID is of the form ga:XXXX,
        #   where XXXX is the Analytics view (profile) ID.
        # @param [String] start_date
        #   Start date for fetching Analytics data. Requests can specify a start date
        #   formatted as YYYY-MM-DD, or as a relative date (e.g., today, yesterday, or
        #   7daysAgo). The default value is 7daysAgo.
        # @param [String] end_date
        #   End date for fetching Analytics data. Requests can specify a start date
        #   formatted as YYYY-MM-DD, or as a relative date (e.g., today, yesterday, or
        #   7daysAgo). The default value is 7daysAgo.
        # @param [String] metrics
        #   A comma-separated list of Multi-Channel Funnels metrics. E.g., 'mcf:
        #   totalConversions,mcf:totalConversionValue'. At least one metric must be
        #   specified.
        # @param [String] dimensions
        #   A comma-separated list of Multi-Channel Funnels dimensions. E.g., 'mcf:source,
        #   mcf:medium'.
        # @param [String] filters
        #   A comma-separated list of dimension or metric filters to be applied to the
        #   Analytics data.
        # @param [Fixnum] max_results
        #   The maximum number of entries to include in this feed.
        # @param [String] sampling_level
        #   The desired sampling level.
        # @param [String] sort
        #   A comma-separated list of dimensions or metrics that determine the sort order
        #   for the Analytics data.
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
        # @yieldparam result [Google::Apis::AnalyticsV3::McfData] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::McfData]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_mcf_data(ids, start_date, end_date, metrics, dimensions: nil, filters: nil, max_results: nil, sampling_level: nil, sort: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'data/mcf', options)
          command.response_representation = Google::Apis::AnalyticsV3::McfData::Representation
          command.response_class = Google::Apis::AnalyticsV3::McfData
          command.query['dimensions'] = dimensions unless dimensions.nil?
          command.query['end-date'] = end_date unless end_date.nil?
          command.query['filters'] = filters unless filters.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['max-results'] = max_results unless max_results.nil?
          command.query['metrics'] = metrics unless metrics.nil?
          command.query['samplingLevel'] = sampling_level unless sampling_level.nil?
          command.query['sort'] = sort unless sort.nil?
          command.query['start-date'] = start_date unless start_date.nil?
          command.query['start-index'] = start_index unless start_index.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns real time data for a view (profile).
        # @param [String] ids
        #   Unique table ID for retrieving real time data. Table ID is of the form ga:XXXX,
        #   where XXXX is the Analytics view (profile) ID.
        # @param [String] metrics
        #   A comma-separated list of real time metrics. E.g., 'rt:activeUsers'. At least
        #   one metric must be specified.
        # @param [String] dimensions
        #   A comma-separated list of real time dimensions. E.g., 'rt:medium,rt:city'.
        # @param [String] filters
        #   A comma-separated list of dimension or metric filters to be applied to real
        #   time data.
        # @param [Fixnum] max_results
        #   The maximum number of entries to include in this feed.
        # @param [String] sort
        #   A comma-separated list of dimensions or metrics that determine the sort order
        #   for real time data.
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
        # @yieldparam result [Google::Apis::AnalyticsV3::RealtimeData] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::RealtimeData]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_realtime_data(ids, metrics, dimensions: nil, filters: nil, max_results: nil, sort: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'data/realtime', options)
          command.response_representation = Google::Apis::AnalyticsV3::RealtimeData::Representation
          command.response_class = Google::Apis::AnalyticsV3::RealtimeData
          command.query['dimensions'] = dimensions unless dimensions.nil?
          command.query['filters'] = filters unless filters.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['max-results'] = max_results unless max_results.nil?
          command.query['metrics'] = metrics unless metrics.nil?
          command.query['sort'] = sort unless sort.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists account summaries (lightweight tree comprised of accounts/properties/
        # profiles) to which the user has access.
        # @param [Fixnum] max_results
        #   The maximum number of account summaries to include in this response, where the
        #   largest acceptable value is 1000.
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
        # @yieldparam result [Google::Apis::AnalyticsV3::AccountSummaries] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::AccountSummaries]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_account_summaries(max_results: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accountSummaries', options)
          command.response_representation = Google::Apis::AnalyticsV3::AccountSummaries::Representation
          command.response_class = Google::Apis::AnalyticsV3::AccountSummaries
          command.query['max-results'] = max_results unless max_results.nil?
          command.query['start-index'] = start_index unless start_index.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Removes a user from the given account.
        # @param [String] account_id
        #   Account ID to delete the user link for.
        # @param [String] link_id
        #   Link ID to delete the user link for.
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
        def delete_account_user_link(account_id, link_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'management/accounts/{accountId}/entityUserLinks/{linkId}', options)
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['linkId'] = link_id unless link_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Adds a new user to the given account.
        # @param [String] account_id
        #   Account ID to create the user link for.
        # @param [Google::Apis::AnalyticsV3::EntityUserLink] entity_user_link_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::EntityUserLink] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::EntityUserLink]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_account_user_link(account_id, entity_user_link_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'management/accounts/{accountId}/entityUserLinks', options)
          command.request_representation = Google::Apis::AnalyticsV3::EntityUserLink::Representation
          command.request_object = entity_user_link_object
          command.response_representation = Google::Apis::AnalyticsV3::EntityUserLink::Representation
          command.response_class = Google::Apis::AnalyticsV3::EntityUserLink
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists account-user links for a given account.
        # @param [String] account_id
        #   Account ID to retrieve the user links for.
        # @param [Fixnum] max_results
        #   The maximum number of account-user links to include in this response.
        # @param [Fixnum] start_index
        #   An index of the first account-user link to retrieve. Use this parameter as a
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
        # @yieldparam result [Google::Apis::AnalyticsV3::EntityUserLinks] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::EntityUserLinks]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_account_user_links(account_id, max_results: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accounts/{accountId}/entityUserLinks', options)
          command.response_representation = Google::Apis::AnalyticsV3::EntityUserLinks::Representation
          command.response_class = Google::Apis::AnalyticsV3::EntityUserLinks
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['max-results'] = max_results unless max_results.nil?
          command.query['start-index'] = start_index unless start_index.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates permissions for an existing user on the given account.
        # @param [String] account_id
        #   Account ID to update the account-user link for.
        # @param [String] link_id
        #   Link ID to update the account-user link for.
        # @param [Google::Apis::AnalyticsV3::EntityUserLink] entity_user_link_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::EntityUserLink] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::EntityUserLink]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_account_user_link(account_id, link_id, entity_user_link_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'management/accounts/{accountId}/entityUserLinks/{linkId}', options)
          command.request_representation = Google::Apis::AnalyticsV3::EntityUserLink::Representation
          command.request_object = entity_user_link_object
          command.response_representation = Google::Apis::AnalyticsV3::EntityUserLink::Representation
          command.response_class = Google::Apis::AnalyticsV3::EntityUserLink
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['linkId'] = link_id unless link_id.nil?
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
        # @yieldparam result [Google::Apis::AnalyticsV3::Accounts] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::Accounts]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_accounts(max_results: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accounts', options)
          command.response_representation = Google::Apis::AnalyticsV3::Accounts::Representation
          command.response_class = Google::Apis::AnalyticsV3::Accounts
          command.query['max-results'] = max_results unless max_results.nil?
          command.query['start-index'] = start_index unless start_index.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Hashes the given Client ID.
        # @param [Google::Apis::AnalyticsV3::HashClientIdRequest] hash_client_id_request_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::HashClientIdResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::HashClientIdResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def hash_client_id(hash_client_id_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'management/clientId:hashClientId', options)
          command.request_representation = Google::Apis::AnalyticsV3::HashClientIdRequest::Representation
          command.request_object = hash_client_id_request_object
          command.response_representation = Google::Apis::AnalyticsV3::HashClientIdResponse::Representation
          command.response_class = Google::Apis::AnalyticsV3::HashClientIdResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List custom data sources to which the user has access.
        # @param [String] account_id
        #   Account Id for the custom data sources to retrieve.
        # @param [String] web_property_id
        #   Web property Id for the custom data sources to retrieve.
        # @param [Fixnum] max_results
        #   The maximum number of custom data sources to include in this response.
        # @param [Fixnum] start_index
        #   A 1-based index of the first custom data source to retrieve. Use this
        #   parameter as a pagination mechanism along with the max-results parameter.
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
        # @yieldparam result [Google::Apis::AnalyticsV3::CustomDataSources] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::CustomDataSources]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_custom_data_sources(account_id, web_property_id, max_results: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accounts/{accountId}/webproperties/{webPropertyId}/customDataSources', options)
          command.response_representation = Google::Apis::AnalyticsV3::CustomDataSources::Representation
          command.response_class = Google::Apis::AnalyticsV3::CustomDataSources
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.query['max-results'] = max_results unless max_results.nil?
          command.query['start-index'] = start_index unless start_index.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get a custom dimension to which the user has access.
        # @param [String] account_id
        #   Account ID for the custom dimension to retrieve.
        # @param [String] web_property_id
        #   Web property ID for the custom dimension to retrieve.
        # @param [String] custom_dimension_id
        #   The ID of the custom dimension to retrieve.
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
        # @yieldparam result [Google::Apis::AnalyticsV3::CustomDimension] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::CustomDimension]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_custom_dimension(account_id, web_property_id, custom_dimension_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accounts/{accountId}/webproperties/{webPropertyId}/customDimensions/{customDimensionId}', options)
          command.response_representation = Google::Apis::AnalyticsV3::CustomDimension::Representation
          command.response_class = Google::Apis::AnalyticsV3::CustomDimension
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['customDimensionId'] = custom_dimension_id unless custom_dimension_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Create a new custom dimension.
        # @param [String] account_id
        #   Account ID for the custom dimension to create.
        # @param [String] web_property_id
        #   Web property ID for the custom dimension to create.
        # @param [Google::Apis::AnalyticsV3::CustomDimension] custom_dimension_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::CustomDimension] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::CustomDimension]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_custom_dimension(account_id, web_property_id, custom_dimension_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'management/accounts/{accountId}/webproperties/{webPropertyId}/customDimensions', options)
          command.request_representation = Google::Apis::AnalyticsV3::CustomDimension::Representation
          command.request_object = custom_dimension_object
          command.response_representation = Google::Apis::AnalyticsV3::CustomDimension::Representation
          command.response_class = Google::Apis::AnalyticsV3::CustomDimension
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists custom dimensions to which the user has access.
        # @param [String] account_id
        #   Account ID for the custom dimensions to retrieve.
        # @param [String] web_property_id
        #   Web property ID for the custom dimensions to retrieve.
        # @param [Fixnum] max_results
        #   The maximum number of custom dimensions to include in this response.
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
        # @yieldparam result [Google::Apis::AnalyticsV3::CustomDimensions] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::CustomDimensions]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_custom_dimensions(account_id, web_property_id, max_results: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accounts/{accountId}/webproperties/{webPropertyId}/customDimensions', options)
          command.response_representation = Google::Apis::AnalyticsV3::CustomDimensions::Representation
          command.response_class = Google::Apis::AnalyticsV3::CustomDimensions
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.query['max-results'] = max_results unless max_results.nil?
          command.query['start-index'] = start_index unless start_index.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing custom dimension. This method supports patch semantics.
        # @param [String] account_id
        #   Account ID for the custom dimension to update.
        # @param [String] web_property_id
        #   Web property ID for the custom dimension to update.
        # @param [String] custom_dimension_id
        #   Custom dimension ID for the custom dimension to update.
        # @param [Google::Apis::AnalyticsV3::CustomDimension] custom_dimension_object
        # @param [Boolean] ignore_custom_data_source_links
        #   Force the update and ignore any warnings related to the custom dimension being
        #   linked to a custom data source / data set.
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
        # @yieldparam result [Google::Apis::AnalyticsV3::CustomDimension] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::CustomDimension]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_custom_dimension(account_id, web_property_id, custom_dimension_id, custom_dimension_object = nil, ignore_custom_data_source_links: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'management/accounts/{accountId}/webproperties/{webPropertyId}/customDimensions/{customDimensionId}', options)
          command.request_representation = Google::Apis::AnalyticsV3::CustomDimension::Representation
          command.request_object = custom_dimension_object
          command.response_representation = Google::Apis::AnalyticsV3::CustomDimension::Representation
          command.response_class = Google::Apis::AnalyticsV3::CustomDimension
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['customDimensionId'] = custom_dimension_id unless custom_dimension_id.nil?
          command.query['ignoreCustomDataSourceLinks'] = ignore_custom_data_source_links unless ignore_custom_data_source_links.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing custom dimension.
        # @param [String] account_id
        #   Account ID for the custom dimension to update.
        # @param [String] web_property_id
        #   Web property ID for the custom dimension to update.
        # @param [String] custom_dimension_id
        #   Custom dimension ID for the custom dimension to update.
        # @param [Google::Apis::AnalyticsV3::CustomDimension] custom_dimension_object
        # @param [Boolean] ignore_custom_data_source_links
        #   Force the update and ignore any warnings related to the custom dimension being
        #   linked to a custom data source / data set.
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
        # @yieldparam result [Google::Apis::AnalyticsV3::CustomDimension] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::CustomDimension]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_custom_dimension(account_id, web_property_id, custom_dimension_id, custom_dimension_object = nil, ignore_custom_data_source_links: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'management/accounts/{accountId}/webproperties/{webPropertyId}/customDimensions/{customDimensionId}', options)
          command.request_representation = Google::Apis::AnalyticsV3::CustomDimension::Representation
          command.request_object = custom_dimension_object
          command.response_representation = Google::Apis::AnalyticsV3::CustomDimension::Representation
          command.response_class = Google::Apis::AnalyticsV3::CustomDimension
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['customDimensionId'] = custom_dimension_id unless custom_dimension_id.nil?
          command.query['ignoreCustomDataSourceLinks'] = ignore_custom_data_source_links unless ignore_custom_data_source_links.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get a custom metric to which the user has access.
        # @param [String] account_id
        #   Account ID for the custom metric to retrieve.
        # @param [String] web_property_id
        #   Web property ID for the custom metric to retrieve.
        # @param [String] custom_metric_id
        #   The ID of the custom metric to retrieve.
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
        # @yieldparam result [Google::Apis::AnalyticsV3::CustomMetric] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::CustomMetric]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_custom_metric(account_id, web_property_id, custom_metric_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accounts/{accountId}/webproperties/{webPropertyId}/customMetrics/{customMetricId}', options)
          command.response_representation = Google::Apis::AnalyticsV3::CustomMetric::Representation
          command.response_class = Google::Apis::AnalyticsV3::CustomMetric
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['customMetricId'] = custom_metric_id unless custom_metric_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Create a new custom metric.
        # @param [String] account_id
        #   Account ID for the custom metric to create.
        # @param [String] web_property_id
        #   Web property ID for the custom dimension to create.
        # @param [Google::Apis::AnalyticsV3::CustomMetric] custom_metric_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::CustomMetric] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::CustomMetric]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_custom_metric(account_id, web_property_id, custom_metric_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'management/accounts/{accountId}/webproperties/{webPropertyId}/customMetrics', options)
          command.request_representation = Google::Apis::AnalyticsV3::CustomMetric::Representation
          command.request_object = custom_metric_object
          command.response_representation = Google::Apis::AnalyticsV3::CustomMetric::Representation
          command.response_class = Google::Apis::AnalyticsV3::CustomMetric
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists custom metrics to which the user has access.
        # @param [String] account_id
        #   Account ID for the custom metrics to retrieve.
        # @param [String] web_property_id
        #   Web property ID for the custom metrics to retrieve.
        # @param [Fixnum] max_results
        #   The maximum number of custom metrics to include in this response.
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
        # @yieldparam result [Google::Apis::AnalyticsV3::CustomMetrics] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::CustomMetrics]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_custom_metrics(account_id, web_property_id, max_results: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accounts/{accountId}/webproperties/{webPropertyId}/customMetrics', options)
          command.response_representation = Google::Apis::AnalyticsV3::CustomMetrics::Representation
          command.response_class = Google::Apis::AnalyticsV3::CustomMetrics
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.query['max-results'] = max_results unless max_results.nil?
          command.query['start-index'] = start_index unless start_index.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing custom metric. This method supports patch semantics.
        # @param [String] account_id
        #   Account ID for the custom metric to update.
        # @param [String] web_property_id
        #   Web property ID for the custom metric to update.
        # @param [String] custom_metric_id
        #   Custom metric ID for the custom metric to update.
        # @param [Google::Apis::AnalyticsV3::CustomMetric] custom_metric_object
        # @param [Boolean] ignore_custom_data_source_links
        #   Force the update and ignore any warnings related to the custom metric being
        #   linked to a custom data source / data set.
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
        # @yieldparam result [Google::Apis::AnalyticsV3::CustomMetric] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::CustomMetric]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_custom_metric(account_id, web_property_id, custom_metric_id, custom_metric_object = nil, ignore_custom_data_source_links: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'management/accounts/{accountId}/webproperties/{webPropertyId}/customMetrics/{customMetricId}', options)
          command.request_representation = Google::Apis::AnalyticsV3::CustomMetric::Representation
          command.request_object = custom_metric_object
          command.response_representation = Google::Apis::AnalyticsV3::CustomMetric::Representation
          command.response_class = Google::Apis::AnalyticsV3::CustomMetric
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['customMetricId'] = custom_metric_id unless custom_metric_id.nil?
          command.query['ignoreCustomDataSourceLinks'] = ignore_custom_data_source_links unless ignore_custom_data_source_links.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing custom metric.
        # @param [String] account_id
        #   Account ID for the custom metric to update.
        # @param [String] web_property_id
        #   Web property ID for the custom metric to update.
        # @param [String] custom_metric_id
        #   Custom metric ID for the custom metric to update.
        # @param [Google::Apis::AnalyticsV3::CustomMetric] custom_metric_object
        # @param [Boolean] ignore_custom_data_source_links
        #   Force the update and ignore any warnings related to the custom metric being
        #   linked to a custom data source / data set.
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
        # @yieldparam result [Google::Apis::AnalyticsV3::CustomMetric] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::CustomMetric]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_custom_metric(account_id, web_property_id, custom_metric_id, custom_metric_object = nil, ignore_custom_data_source_links: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'management/accounts/{accountId}/webproperties/{webPropertyId}/customMetrics/{customMetricId}', options)
          command.request_representation = Google::Apis::AnalyticsV3::CustomMetric::Representation
          command.request_object = custom_metric_object
          command.response_representation = Google::Apis::AnalyticsV3::CustomMetric::Representation
          command.response_class = Google::Apis::AnalyticsV3::CustomMetric
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['customMetricId'] = custom_metric_id unless custom_metric_id.nil?
          command.query['ignoreCustomDataSourceLinks'] = ignore_custom_data_source_links unless ignore_custom_data_source_links.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Delete an experiment.
        # @param [String] account_id
        #   Account ID to which the experiment belongs
        # @param [String] web_property_id
        #   Web property ID to which the experiment belongs
        # @param [String] profile_id
        #   View (Profile) ID to which the experiment belongs
        # @param [String] experiment_id
        #   ID of the experiment to delete
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
        def delete_experiment(account_id, web_property_id, profile_id, experiment_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}/experiments/{experimentId}', options)
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['experimentId'] = experiment_id unless experiment_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns an experiment to which the user has access.
        # @param [String] account_id
        #   Account ID to retrieve the experiment for.
        # @param [String] web_property_id
        #   Web property ID to retrieve the experiment for.
        # @param [String] profile_id
        #   View (Profile) ID to retrieve the experiment for.
        # @param [String] experiment_id
        #   Experiment ID to retrieve the experiment for.
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
        # @yieldparam result [Google::Apis::AnalyticsV3::Experiment] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::Experiment]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_experiment(account_id, web_property_id, profile_id, experiment_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}/experiments/{experimentId}', options)
          command.response_representation = Google::Apis::AnalyticsV3::Experiment::Representation
          command.response_class = Google::Apis::AnalyticsV3::Experiment
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['experimentId'] = experiment_id unless experiment_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Create a new experiment.
        # @param [String] account_id
        #   Account ID to create the experiment for.
        # @param [String] web_property_id
        #   Web property ID to create the experiment for.
        # @param [String] profile_id
        #   View (Profile) ID to create the experiment for.
        # @param [Google::Apis::AnalyticsV3::Experiment] experiment_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::Experiment] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::Experiment]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_experiment(account_id, web_property_id, profile_id, experiment_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}/experiments', options)
          command.request_representation = Google::Apis::AnalyticsV3::Experiment::Representation
          command.request_object = experiment_object
          command.response_representation = Google::Apis::AnalyticsV3::Experiment::Representation
          command.response_class = Google::Apis::AnalyticsV3::Experiment
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists experiments to which the user has access.
        # @param [String] account_id
        #   Account ID to retrieve experiments for.
        # @param [String] web_property_id
        #   Web property ID to retrieve experiments for.
        # @param [String] profile_id
        #   View (Profile) ID to retrieve experiments for.
        # @param [Fixnum] max_results
        #   The maximum number of experiments to include in this response.
        # @param [Fixnum] start_index
        #   An index of the first experiment to retrieve. Use this parameter as a
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
        # @yieldparam result [Google::Apis::AnalyticsV3::Experiments] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::Experiments]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_experiments(account_id, web_property_id, profile_id, max_results: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}/experiments', options)
          command.response_representation = Google::Apis::AnalyticsV3::Experiments::Representation
          command.response_class = Google::Apis::AnalyticsV3::Experiments
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
        
        # Update an existing experiment. This method supports patch semantics.
        # @param [String] account_id
        #   Account ID of the experiment to update.
        # @param [String] web_property_id
        #   Web property ID of the experiment to update.
        # @param [String] profile_id
        #   View (Profile) ID of the experiment to update.
        # @param [String] experiment_id
        #   Experiment ID of the experiment to update.
        # @param [Google::Apis::AnalyticsV3::Experiment] experiment_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::Experiment] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::Experiment]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_experiment(account_id, web_property_id, profile_id, experiment_id, experiment_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}/experiments/{experimentId}', options)
          command.request_representation = Google::Apis::AnalyticsV3::Experiment::Representation
          command.request_object = experiment_object
          command.response_representation = Google::Apis::AnalyticsV3::Experiment::Representation
          command.response_class = Google::Apis::AnalyticsV3::Experiment
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['experimentId'] = experiment_id unless experiment_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update an existing experiment.
        # @param [String] account_id
        #   Account ID of the experiment to update.
        # @param [String] web_property_id
        #   Web property ID of the experiment to update.
        # @param [String] profile_id
        #   View (Profile) ID of the experiment to update.
        # @param [String] experiment_id
        #   Experiment ID of the experiment to update.
        # @param [Google::Apis::AnalyticsV3::Experiment] experiment_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::Experiment] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::Experiment]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_experiment(account_id, web_property_id, profile_id, experiment_id, experiment_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}/experiments/{experimentId}', options)
          command.request_representation = Google::Apis::AnalyticsV3::Experiment::Representation
          command.request_object = experiment_object
          command.response_representation = Google::Apis::AnalyticsV3::Experiment::Representation
          command.response_class = Google::Apis::AnalyticsV3::Experiment
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['experimentId'] = experiment_id unless experiment_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Delete a filter.
        # @param [String] account_id
        #   Account ID to delete the filter for.
        # @param [String] filter_id
        #   ID of the filter to be deleted.
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
        # @yieldparam result [Google::Apis::AnalyticsV3::Filter] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::Filter]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_filter(account_id, filter_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'management/accounts/{accountId}/filters/{filterId}', options)
          command.response_representation = Google::Apis::AnalyticsV3::Filter::Representation
          command.response_class = Google::Apis::AnalyticsV3::Filter
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['filterId'] = filter_id unless filter_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns filters to which the user has access.
        # @param [String] account_id
        #   Account ID to retrieve filters for.
        # @param [String] filter_id
        #   Filter ID to retrieve filters for.
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
        # @yieldparam result [Google::Apis::AnalyticsV3::Filter] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::Filter]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_filter(account_id, filter_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accounts/{accountId}/filters/{filterId}', options)
          command.response_representation = Google::Apis::AnalyticsV3::Filter::Representation
          command.response_class = Google::Apis::AnalyticsV3::Filter
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['filterId'] = filter_id unless filter_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Create a new filter.
        # @param [String] account_id
        #   Account ID to create filter for.
        # @param [Google::Apis::AnalyticsV3::Filter] filter_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::Filter] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::Filter]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_filter(account_id, filter_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'management/accounts/{accountId}/filters', options)
          command.request_representation = Google::Apis::AnalyticsV3::Filter::Representation
          command.request_object = filter_object
          command.response_representation = Google::Apis::AnalyticsV3::Filter::Representation
          command.response_class = Google::Apis::AnalyticsV3::Filter
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all filters for an account
        # @param [String] account_id
        #   Account ID to retrieve filters for.
        # @param [Fixnum] max_results
        #   The maximum number of filters to include in this response.
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
        # @yieldparam result [Google::Apis::AnalyticsV3::Filters] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::Filters]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_filters(account_id, max_results: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accounts/{accountId}/filters', options)
          command.response_representation = Google::Apis::AnalyticsV3::Filters::Representation
          command.response_class = Google::Apis::AnalyticsV3::Filters
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['max-results'] = max_results unless max_results.nil?
          command.query['start-index'] = start_index unless start_index.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing filter. This method supports patch semantics.
        # @param [String] account_id
        #   Account ID to which the filter belongs.
        # @param [String] filter_id
        #   ID of the filter to be updated.
        # @param [Google::Apis::AnalyticsV3::Filter] filter_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::Filter] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::Filter]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_filter(account_id, filter_id, filter_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'management/accounts/{accountId}/filters/{filterId}', options)
          command.request_representation = Google::Apis::AnalyticsV3::Filter::Representation
          command.request_object = filter_object
          command.response_representation = Google::Apis::AnalyticsV3::Filter::Representation
          command.response_class = Google::Apis::AnalyticsV3::Filter
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['filterId'] = filter_id unless filter_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing filter.
        # @param [String] account_id
        #   Account ID to which the filter belongs.
        # @param [String] filter_id
        #   ID of the filter to be updated.
        # @param [Google::Apis::AnalyticsV3::Filter] filter_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::Filter] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::Filter]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_filter(account_id, filter_id, filter_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'management/accounts/{accountId}/filters/{filterId}', options)
          command.request_representation = Google::Apis::AnalyticsV3::Filter::Representation
          command.request_object = filter_object
          command.response_representation = Google::Apis::AnalyticsV3::Filter::Representation
          command.response_class = Google::Apis::AnalyticsV3::Filter
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['filterId'] = filter_id unless filter_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a goal to which the user has access.
        # @param [String] account_id
        #   Account ID to retrieve the goal for.
        # @param [String] web_property_id
        #   Web property ID to retrieve the goal for.
        # @param [String] profile_id
        #   View (Profile) ID to retrieve the goal for.
        # @param [String] goal_id
        #   Goal ID to retrieve the goal for.
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
        # @yieldparam result [Google::Apis::AnalyticsV3::Goal] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::Goal]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_goal(account_id, web_property_id, profile_id, goal_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}/goals/{goalId}', options)
          command.response_representation = Google::Apis::AnalyticsV3::Goal::Representation
          command.response_class = Google::Apis::AnalyticsV3::Goal
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['goalId'] = goal_id unless goal_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Create a new goal.
        # @param [String] account_id
        #   Account ID to create the goal for.
        # @param [String] web_property_id
        #   Web property ID to create the goal for.
        # @param [String] profile_id
        #   View (Profile) ID to create the goal for.
        # @param [Google::Apis::AnalyticsV3::Goal] goal_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::Goal] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::Goal]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_goal(account_id, web_property_id, profile_id, goal_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}/goals', options)
          command.request_representation = Google::Apis::AnalyticsV3::Goal::Representation
          command.request_object = goal_object
          command.response_representation = Google::Apis::AnalyticsV3::Goal::Representation
          command.response_class = Google::Apis::AnalyticsV3::Goal
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['profileId'] = profile_id unless profile_id.nil?
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
        # @yieldparam result [Google::Apis::AnalyticsV3::Goals] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::Goals]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_goals(account_id, web_property_id, profile_id, max_results: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}/goals', options)
          command.response_representation = Google::Apis::AnalyticsV3::Goals::Representation
          command.response_class = Google::Apis::AnalyticsV3::Goals
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
        
        # Updates an existing goal. This method supports patch semantics.
        # @param [String] account_id
        #   Account ID to update the goal.
        # @param [String] web_property_id
        #   Web property ID to update the goal.
        # @param [String] profile_id
        #   View (Profile) ID to update the goal.
        # @param [String] goal_id
        #   Index of the goal to be updated.
        # @param [Google::Apis::AnalyticsV3::Goal] goal_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::Goal] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::Goal]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_goal(account_id, web_property_id, profile_id, goal_id, goal_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}/goals/{goalId}', options)
          command.request_representation = Google::Apis::AnalyticsV3::Goal::Representation
          command.request_object = goal_object
          command.response_representation = Google::Apis::AnalyticsV3::Goal::Representation
          command.response_class = Google::Apis::AnalyticsV3::Goal
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['goalId'] = goal_id unless goal_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing goal.
        # @param [String] account_id
        #   Account ID to update the goal.
        # @param [String] web_property_id
        #   Web property ID to update the goal.
        # @param [String] profile_id
        #   View (Profile) ID to update the goal.
        # @param [String] goal_id
        #   Index of the goal to be updated.
        # @param [Google::Apis::AnalyticsV3::Goal] goal_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::Goal] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::Goal]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_goal(account_id, web_property_id, profile_id, goal_id, goal_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}/goals/{goalId}', options)
          command.request_representation = Google::Apis::AnalyticsV3::Goal::Representation
          command.request_object = goal_object
          command.response_representation = Google::Apis::AnalyticsV3::Goal::Representation
          command.response_class = Google::Apis::AnalyticsV3::Goal
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['goalId'] = goal_id unless goal_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Delete a profile filter link.
        # @param [String] account_id
        #   Account ID to which the profile filter link belongs.
        # @param [String] web_property_id
        #   Web property Id to which the profile filter link belongs.
        # @param [String] profile_id
        #   Profile ID to which the filter link belongs.
        # @param [String] link_id
        #   ID of the profile filter link to delete.
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
        def delete_profile_filter_link(account_id, web_property_id, profile_id, link_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}/profileFilterLinks/{linkId}', options)
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['linkId'] = link_id unless link_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a single profile filter link.
        # @param [String] account_id
        #   Account ID to retrieve profile filter link for.
        # @param [String] web_property_id
        #   Web property Id to retrieve profile filter link for.
        # @param [String] profile_id
        #   Profile ID to retrieve filter link for.
        # @param [String] link_id
        #   ID of the profile filter link.
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
        # @yieldparam result [Google::Apis::AnalyticsV3::ProfileFilterLink] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::ProfileFilterLink]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_profile_filter_link(account_id, web_property_id, profile_id, link_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}/profileFilterLinks/{linkId}', options)
          command.response_representation = Google::Apis::AnalyticsV3::ProfileFilterLink::Representation
          command.response_class = Google::Apis::AnalyticsV3::ProfileFilterLink
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['linkId'] = link_id unless link_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Create a new profile filter link.
        # @param [String] account_id
        #   Account ID to create profile filter link for.
        # @param [String] web_property_id
        #   Web property Id to create profile filter link for.
        # @param [String] profile_id
        #   Profile ID to create filter link for.
        # @param [Google::Apis::AnalyticsV3::ProfileFilterLink] profile_filter_link_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::ProfileFilterLink] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::ProfileFilterLink]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_profile_filter_link(account_id, web_property_id, profile_id, profile_filter_link_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}/profileFilterLinks', options)
          command.request_representation = Google::Apis::AnalyticsV3::ProfileFilterLink::Representation
          command.request_object = profile_filter_link_object
          command.response_representation = Google::Apis::AnalyticsV3::ProfileFilterLink::Representation
          command.response_class = Google::Apis::AnalyticsV3::ProfileFilterLink
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all profile filter links for a profile.
        # @param [String] account_id
        #   Account ID to retrieve profile filter links for.
        # @param [String] web_property_id
        #   Web property Id for profile filter links for. Can either be a specific web
        #   property ID or '~all', which refers to all the web properties that user has
        #   access to.
        # @param [String] profile_id
        #   Profile ID to retrieve filter links for. Can either be a specific profile ID
        #   or '~all', which refers to all the profiles that user has access to.
        # @param [Fixnum] max_results
        #   The maximum number of profile filter links to include in this response.
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
        # @yieldparam result [Google::Apis::AnalyticsV3::ProfileFilterLinks] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::ProfileFilterLinks]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_profile_filter_links(account_id, web_property_id, profile_id, max_results: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}/profileFilterLinks', options)
          command.response_representation = Google::Apis::AnalyticsV3::ProfileFilterLinks::Representation
          command.response_class = Google::Apis::AnalyticsV3::ProfileFilterLinks
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
        
        # Update an existing profile filter link. This method supports patch semantics.
        # @param [String] account_id
        #   Account ID to which profile filter link belongs.
        # @param [String] web_property_id
        #   Web property Id to which profile filter link belongs
        # @param [String] profile_id
        #   Profile ID to which filter link belongs
        # @param [String] link_id
        #   ID of the profile filter link to be updated.
        # @param [Google::Apis::AnalyticsV3::ProfileFilterLink] profile_filter_link_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::ProfileFilterLink] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::ProfileFilterLink]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_profile_filter_link(account_id, web_property_id, profile_id, link_id, profile_filter_link_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}/profileFilterLinks/{linkId}', options)
          command.request_representation = Google::Apis::AnalyticsV3::ProfileFilterLink::Representation
          command.request_object = profile_filter_link_object
          command.response_representation = Google::Apis::AnalyticsV3::ProfileFilterLink::Representation
          command.response_class = Google::Apis::AnalyticsV3::ProfileFilterLink
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['linkId'] = link_id unless link_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update an existing profile filter link.
        # @param [String] account_id
        #   Account ID to which profile filter link belongs.
        # @param [String] web_property_id
        #   Web property Id to which profile filter link belongs
        # @param [String] profile_id
        #   Profile ID to which filter link belongs
        # @param [String] link_id
        #   ID of the profile filter link to be updated.
        # @param [Google::Apis::AnalyticsV3::ProfileFilterLink] profile_filter_link_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::ProfileFilterLink] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::ProfileFilterLink]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_profile_filter_link(account_id, web_property_id, profile_id, link_id, profile_filter_link_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}/profileFilterLinks/{linkId}', options)
          command.request_representation = Google::Apis::AnalyticsV3::ProfileFilterLink::Representation
          command.request_object = profile_filter_link_object
          command.response_representation = Google::Apis::AnalyticsV3::ProfileFilterLink::Representation
          command.response_class = Google::Apis::AnalyticsV3::ProfileFilterLink
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['linkId'] = link_id unless link_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Removes a user from the given view (profile).
        # @param [String] account_id
        #   Account ID to delete the user link for.
        # @param [String] web_property_id
        #   Web Property ID to delete the user link for.
        # @param [String] profile_id
        #   View (Profile) ID to delete the user link for.
        # @param [String] link_id
        #   Link ID to delete the user link for.
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
        def delete_profile_user_link(account_id, web_property_id, profile_id, link_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}/entityUserLinks/{linkId}', options)
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['linkId'] = link_id unless link_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Adds a new user to the given view (profile).
        # @param [String] account_id
        #   Account ID to create the user link for.
        # @param [String] web_property_id
        #   Web Property ID to create the user link for.
        # @param [String] profile_id
        #   View (Profile) ID to create the user link for.
        # @param [Google::Apis::AnalyticsV3::EntityUserLink] entity_user_link_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::EntityUserLink] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::EntityUserLink]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_profile_user_link(account_id, web_property_id, profile_id, entity_user_link_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}/entityUserLinks', options)
          command.request_representation = Google::Apis::AnalyticsV3::EntityUserLink::Representation
          command.request_object = entity_user_link_object
          command.response_representation = Google::Apis::AnalyticsV3::EntityUserLink::Representation
          command.response_class = Google::Apis::AnalyticsV3::EntityUserLink
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists profile-user links for a given view (profile).
        # @param [String] account_id
        #   Account ID which the given view (profile) belongs to.
        # @param [String] web_property_id
        #   Web Property ID which the given view (profile) belongs to. Can either be a
        #   specific web property ID or '~all', which refers to all the web properties
        #   that user has access to.
        # @param [String] profile_id
        #   View (Profile) ID to retrieve the profile-user links for. Can either be a
        #   specific profile ID or '~all', which refers to all the profiles that user has
        #   access to.
        # @param [Fixnum] max_results
        #   The maximum number of profile-user links to include in this response.
        # @param [Fixnum] start_index
        #   An index of the first profile-user link to retrieve. Use this parameter as a
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
        # @yieldparam result [Google::Apis::AnalyticsV3::EntityUserLinks] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::EntityUserLinks]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_profile_user_links(account_id, web_property_id, profile_id, max_results: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}/entityUserLinks', options)
          command.response_representation = Google::Apis::AnalyticsV3::EntityUserLinks::Representation
          command.response_class = Google::Apis::AnalyticsV3::EntityUserLinks
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
        
        # Updates permissions for an existing user on the given view (profile).
        # @param [String] account_id
        #   Account ID to update the user link for.
        # @param [String] web_property_id
        #   Web Property ID to update the user link for.
        # @param [String] profile_id
        #   View (Profile ID) to update the user link for.
        # @param [String] link_id
        #   Link ID to update the user link for.
        # @param [Google::Apis::AnalyticsV3::EntityUserLink] entity_user_link_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::EntityUserLink] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::EntityUserLink]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_profile_user_link(account_id, web_property_id, profile_id, link_id, entity_user_link_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}/entityUserLinks/{linkId}', options)
          command.request_representation = Google::Apis::AnalyticsV3::EntityUserLink::Representation
          command.request_object = entity_user_link_object
          command.response_representation = Google::Apis::AnalyticsV3::EntityUserLink::Representation
          command.response_class = Google::Apis::AnalyticsV3::EntityUserLink
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['linkId'] = link_id unless link_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a view (profile).
        # @param [String] account_id
        #   Account ID to delete the view (profile) for.
        # @param [String] web_property_id
        #   Web property ID to delete the view (profile) for.
        # @param [String] profile_id
        #   ID of the view (profile) to be deleted.
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
        def delete_profile(account_id, web_property_id, profile_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}', options)
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a view (profile) to which the user has access.
        # @param [String] account_id
        #   Account ID to retrieve the view (profile) for.
        # @param [String] web_property_id
        #   Web property ID to retrieve the view (profile) for.
        # @param [String] profile_id
        #   View (Profile) ID to retrieve the view (profile) for.
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
        # @yieldparam result [Google::Apis::AnalyticsV3::Profile] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::Profile]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_profile(account_id, web_property_id, profile_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}', options)
          command.response_representation = Google::Apis::AnalyticsV3::Profile::Representation
          command.response_class = Google::Apis::AnalyticsV3::Profile
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Create a new view (profile).
        # @param [String] account_id
        #   Account ID to create the view (profile) for.
        # @param [String] web_property_id
        #   Web property ID to create the view (profile) for.
        # @param [Google::Apis::AnalyticsV3::Profile] profile_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::Profile] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::Profile]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_profile(account_id, web_property_id, profile_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'management/accounts/{accountId}/webproperties/{webPropertyId}/profiles', options)
          command.request_representation = Google::Apis::AnalyticsV3::Profile::Representation
          command.request_object = profile_object
          command.response_representation = Google::Apis::AnalyticsV3::Profile::Representation
          command.response_class = Google::Apis::AnalyticsV3::Profile
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists views (profiles) to which the user has access.
        # @param [String] account_id
        #   Account ID for the view (profiles) to retrieve. Can either be a specific
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
        # @yieldparam result [Google::Apis::AnalyticsV3::Profiles] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::Profiles]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_profiles(account_id, web_property_id, max_results: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accounts/{accountId}/webproperties/{webPropertyId}/profiles', options)
          command.response_representation = Google::Apis::AnalyticsV3::Profiles::Representation
          command.response_class = Google::Apis::AnalyticsV3::Profiles
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.query['max-results'] = max_results unless max_results.nil?
          command.query['start-index'] = start_index unless start_index.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing view (profile). This method supports patch semantics.
        # @param [String] account_id
        #   Account ID to which the view (profile) belongs
        # @param [String] web_property_id
        #   Web property ID to which the view (profile) belongs
        # @param [String] profile_id
        #   ID of the view (profile) to be updated.
        # @param [Google::Apis::AnalyticsV3::Profile] profile_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::Profile] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::Profile]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_profile(account_id, web_property_id, profile_id, profile_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}', options)
          command.request_representation = Google::Apis::AnalyticsV3::Profile::Representation
          command.request_object = profile_object
          command.response_representation = Google::Apis::AnalyticsV3::Profile::Representation
          command.response_class = Google::Apis::AnalyticsV3::Profile
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing view (profile).
        # @param [String] account_id
        #   Account ID to which the view (profile) belongs
        # @param [String] web_property_id
        #   Web property ID to which the view (profile) belongs
        # @param [String] profile_id
        #   ID of the view (profile) to be updated.
        # @param [Google::Apis::AnalyticsV3::Profile] profile_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::Profile] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::Profile]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_profile(account_id, web_property_id, profile_id, profile_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}', options)
          command.request_representation = Google::Apis::AnalyticsV3::Profile::Representation
          command.request_object = profile_object
          command.response_representation = Google::Apis::AnalyticsV3::Profile::Representation
          command.response_class = Google::Apis::AnalyticsV3::Profile
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Delete a remarketing audience.
        # @param [String] account_id
        #   Account ID to which the remarketing audience belongs.
        # @param [String] web_property_id
        #   Web property ID to which the remarketing audience belongs.
        # @param [String] remarketing_audience_id
        #   The ID of the remarketing audience to delete.
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
        def delete_management_remarketing_audience(account_id, web_property_id, remarketing_audience_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'management/accounts/{accountId}/webproperties/{webPropertyId}/remarketingAudiences/{remarketingAudienceId}', options)
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['remarketingAudienceId'] = remarketing_audience_id unless remarketing_audience_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a remarketing audience to which the user has access.
        # @param [String] account_id
        #   The account ID of the remarketing audience to retrieve.
        # @param [String] web_property_id
        #   The web property ID of the remarketing audience to retrieve.
        # @param [String] remarketing_audience_id
        #   The ID of the remarketing audience to retrieve.
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
        # @yieldparam result [Google::Apis::AnalyticsV3::RemarketingAudience] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::RemarketingAudience]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_management_remarketing_audience(account_id, web_property_id, remarketing_audience_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accounts/{accountId}/webproperties/{webPropertyId}/remarketingAudiences/{remarketingAudienceId}', options)
          command.response_representation = Google::Apis::AnalyticsV3::RemarketingAudience::Representation
          command.response_class = Google::Apis::AnalyticsV3::RemarketingAudience
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['remarketingAudienceId'] = remarketing_audience_id unless remarketing_audience_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new remarketing audience.
        # @param [String] account_id
        #   The account ID for which to create the remarketing audience.
        # @param [String] web_property_id
        #   Web property ID for which to create the remarketing audience.
        # @param [Google::Apis::AnalyticsV3::RemarketingAudience] remarketing_audience_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::RemarketingAudience] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::RemarketingAudience]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_management_remarketing_audience(account_id, web_property_id, remarketing_audience_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'management/accounts/{accountId}/webproperties/{webPropertyId}/remarketingAudiences', options)
          command.request_representation = Google::Apis::AnalyticsV3::RemarketingAudience::Representation
          command.request_object = remarketing_audience_object
          command.response_representation = Google::Apis::AnalyticsV3::RemarketingAudience::Representation
          command.response_class = Google::Apis::AnalyticsV3::RemarketingAudience
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists remarketing audiences to which the user has access.
        # @param [String] account_id
        #   The account ID of the remarketing audiences to retrieve.
        # @param [String] web_property_id
        #   The web property ID of the remarketing audiences to retrieve.
        # @param [Fixnum] max_results
        #   The maximum number of remarketing audiences to include in this response.
        # @param [Fixnum] start_index
        #   An index of the first entity to retrieve. Use this parameter as a pagination
        #   mechanism along with the max-results parameter.
        # @param [String] type
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
        # @yieldparam result [Google::Apis::AnalyticsV3::RemarketingAudiences] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::RemarketingAudiences]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_management_remarketing_audiences(account_id, web_property_id, max_results: nil, start_index: nil, type: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accounts/{accountId}/webproperties/{webPropertyId}/remarketingAudiences', options)
          command.response_representation = Google::Apis::AnalyticsV3::RemarketingAudiences::Representation
          command.response_class = Google::Apis::AnalyticsV3::RemarketingAudiences
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.query['max-results'] = max_results unless max_results.nil?
          command.query['start-index'] = start_index unless start_index.nil?
          command.query['type'] = type unless type.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing remarketing audience. This method supports patch semantics.
        # @param [String] account_id
        #   The account ID of the remarketing audience to update.
        # @param [String] web_property_id
        #   The web property ID of the remarketing audience to update.
        # @param [String] remarketing_audience_id
        #   The ID of the remarketing audience to update.
        # @param [Google::Apis::AnalyticsV3::RemarketingAudience] remarketing_audience_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::RemarketingAudience] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::RemarketingAudience]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_management_remarketing_audience(account_id, web_property_id, remarketing_audience_id, remarketing_audience_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'management/accounts/{accountId}/webproperties/{webPropertyId}/remarketingAudiences/{remarketingAudienceId}', options)
          command.request_representation = Google::Apis::AnalyticsV3::RemarketingAudience::Representation
          command.request_object = remarketing_audience_object
          command.response_representation = Google::Apis::AnalyticsV3::RemarketingAudience::Representation
          command.response_class = Google::Apis::AnalyticsV3::RemarketingAudience
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['remarketingAudienceId'] = remarketing_audience_id unless remarketing_audience_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing remarketing audience.
        # @param [String] account_id
        #   The account ID of the remarketing audience to update.
        # @param [String] web_property_id
        #   The web property ID of the remarketing audience to update.
        # @param [String] remarketing_audience_id
        #   The ID of the remarketing audience to update.
        # @param [Google::Apis::AnalyticsV3::RemarketingAudience] remarketing_audience_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::RemarketingAudience] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::RemarketingAudience]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_management_remarketing_audience(account_id, web_property_id, remarketing_audience_id, remarketing_audience_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'management/accounts/{accountId}/webproperties/{webPropertyId}/remarketingAudiences/{remarketingAudienceId}', options)
          command.request_representation = Google::Apis::AnalyticsV3::RemarketingAudience::Representation
          command.request_object = remarketing_audience_object
          command.response_representation = Google::Apis::AnalyticsV3::RemarketingAudience::Representation
          command.response_class = Google::Apis::AnalyticsV3::RemarketingAudience
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['remarketingAudienceId'] = remarketing_audience_id unless remarketing_audience_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists segments to which the user has access.
        # @param [Fixnum] max_results
        #   The maximum number of segments to include in this response.
        # @param [Fixnum] start_index
        #   An index of the first segment to retrieve. Use this parameter as a pagination
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
        # @yieldparam result [Google::Apis::AnalyticsV3::Segments] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::Segments]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_segments(max_results: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/segments', options)
          command.response_representation = Google::Apis::AnalyticsV3::Segments::Representation
          command.response_class = Google::Apis::AnalyticsV3::Segments
          command.query['max-results'] = max_results unless max_results.nil?
          command.query['start-index'] = start_index unless start_index.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes an unsampled report.
        # @param [String] account_id
        #   Account ID to delete the unsampled report for.
        # @param [String] web_property_id
        #   Web property ID to delete the unsampled reports for.
        # @param [String] profile_id
        #   View (Profile) ID to delete the unsampled report for.
        # @param [String] unsampled_report_id
        #   ID of the unsampled report to be deleted.
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
        def delete_unsampled_report(account_id, web_property_id, profile_id, unsampled_report_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}/unsampledReports/{unsampledReportId}', options)
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['unsampledReportId'] = unsampled_report_id unless unsampled_report_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a single unsampled report.
        # @param [String] account_id
        #   Account ID to retrieve unsampled report for.
        # @param [String] web_property_id
        #   Web property ID to retrieve unsampled reports for.
        # @param [String] profile_id
        #   View (Profile) ID to retrieve unsampled report for.
        # @param [String] unsampled_report_id
        #   ID of the unsampled report to retrieve.
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
        # @yieldparam result [Google::Apis::AnalyticsV3::UnsampledReport] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::UnsampledReport]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_unsampled_report(account_id, web_property_id, profile_id, unsampled_report_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}/unsampledReports/{unsampledReportId}', options)
          command.response_representation = Google::Apis::AnalyticsV3::UnsampledReport::Representation
          command.response_class = Google::Apis::AnalyticsV3::UnsampledReport
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['unsampledReportId'] = unsampled_report_id unless unsampled_report_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Create a new unsampled report.
        # @param [String] account_id
        #   Account ID to create the unsampled report for.
        # @param [String] web_property_id
        #   Web property ID to create the unsampled report for.
        # @param [String] profile_id
        #   View (Profile) ID to create the unsampled report for.
        # @param [Google::Apis::AnalyticsV3::UnsampledReport] unsampled_report_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::UnsampledReport] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::UnsampledReport]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_unsampled_report(account_id, web_property_id, profile_id, unsampled_report_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}/unsampledReports', options)
          command.request_representation = Google::Apis::AnalyticsV3::UnsampledReport::Representation
          command.request_object = unsampled_report_object
          command.response_representation = Google::Apis::AnalyticsV3::UnsampledReport::Representation
          command.response_class = Google::Apis::AnalyticsV3::UnsampledReport
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists unsampled reports to which the user has access.
        # @param [String] account_id
        #   Account ID to retrieve unsampled reports for. Must be a specific account ID, ~
        #   all is not supported.
        # @param [String] web_property_id
        #   Web property ID to retrieve unsampled reports for. Must be a specific web
        #   property ID, ~all is not supported.
        # @param [String] profile_id
        #   View (Profile) ID to retrieve unsampled reports for. Must be a specific view (
        #   profile) ID, ~all is not supported.
        # @param [Fixnum] max_results
        #   The maximum number of unsampled reports to include in this response.
        # @param [Fixnum] start_index
        #   An index of the first unsampled report to retrieve. Use this parameter as a
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
        # @yieldparam result [Google::Apis::AnalyticsV3::UnsampledReports] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::UnsampledReports]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_unsampled_reports(account_id, web_property_id, profile_id, max_results: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}/unsampledReports', options)
          command.response_representation = Google::Apis::AnalyticsV3::UnsampledReports::Representation
          command.response_class = Google::Apis::AnalyticsV3::UnsampledReports
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
        
        # Delete data associated with a previous upload.
        # @param [String] account_id
        #   Account Id for the uploads to be deleted.
        # @param [String] web_property_id
        #   Web property Id for the uploads to be deleted.
        # @param [String] custom_data_source_id
        #   Custom data source Id for the uploads to be deleted.
        # @param [Google::Apis::AnalyticsV3::DeleteUploadDataRequest] delete_upload_data_request_object
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
        def delete_upload_data(account_id, web_property_id, custom_data_source_id, delete_upload_data_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'management/accounts/{accountId}/webproperties/{webPropertyId}/customDataSources/{customDataSourceId}/deleteUploadData', options)
          command.request_representation = Google::Apis::AnalyticsV3::DeleteUploadDataRequest::Representation
          command.request_object = delete_upload_data_request_object
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['customDataSourceId'] = custom_data_source_id unless custom_data_source_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List uploads to which the user has access.
        # @param [String] account_id
        #   Account Id for the upload to retrieve.
        # @param [String] web_property_id
        #   Web property Id for the upload to retrieve.
        # @param [String] custom_data_source_id
        #   Custom data source Id for upload to retrieve.
        # @param [String] upload_id
        #   Upload Id to retrieve.
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
        # @yieldparam result [Google::Apis::AnalyticsV3::Upload] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::Upload]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_upload(account_id, web_property_id, custom_data_source_id, upload_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accounts/{accountId}/webproperties/{webPropertyId}/customDataSources/{customDataSourceId}/uploads/{uploadId}', options)
          command.response_representation = Google::Apis::AnalyticsV3::Upload::Representation
          command.response_class = Google::Apis::AnalyticsV3::Upload
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['customDataSourceId'] = custom_data_source_id unless custom_data_source_id.nil?
          command.params['uploadId'] = upload_id unless upload_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List uploads to which the user has access.
        # @param [String] account_id
        #   Account Id for the uploads to retrieve.
        # @param [String] web_property_id
        #   Web property Id for the uploads to retrieve.
        # @param [String] custom_data_source_id
        #   Custom data source Id for uploads to retrieve.
        # @param [Fixnum] max_results
        #   The maximum number of uploads to include in this response.
        # @param [Fixnum] start_index
        #   A 1-based index of the first upload to retrieve. Use this parameter as a
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
        # @yieldparam result [Google::Apis::AnalyticsV3::Uploads] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::Uploads]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_uploads(account_id, web_property_id, custom_data_source_id, max_results: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accounts/{accountId}/webproperties/{webPropertyId}/customDataSources/{customDataSourceId}/uploads', options)
          command.response_representation = Google::Apis::AnalyticsV3::Uploads::Representation
          command.response_class = Google::Apis::AnalyticsV3::Uploads
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['customDataSourceId'] = custom_data_source_id unless custom_data_source_id.nil?
          command.query['max-results'] = max_results unless max_results.nil?
          command.query['start-index'] = start_index unless start_index.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Upload data for a custom data source.
        # @param [String] account_id
        #   Account Id associated with the upload.
        # @param [String] web_property_id
        #   Web property UA-string associated with the upload.
        # @param [String] custom_data_source_id
        #   Custom data source Id to which the data being uploaded belongs.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [IO, String] upload_source
        #   IO stream or filename containing content to upload
        # @param [String] content_type
        #   Content type of the uploaded content.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AnalyticsV3::Upload] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::Upload]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def upload_data(account_id, web_property_id, custom_data_source_id, fields: nil, quota_user: nil, user_ip: nil, upload_source: nil, content_type: nil, options: nil, &block)
          if upload_source.nil?
            command = make_simple_command(:post, 'management/accounts/{accountId}/webproperties/{webPropertyId}/customDataSources/{customDataSourceId}/uploads', options)
          else
            command = make_upload_command(:post, 'management/accounts/{accountId}/webproperties/{webPropertyId}/customDataSources/{customDataSourceId}/uploads', options)
            command.upload_source = upload_source
            command.upload_content_type = content_type
          end
          command.response_representation = Google::Apis::AnalyticsV3::Upload::Representation
          command.response_class = Google::Apis::AnalyticsV3::Upload
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['customDataSourceId'] = custom_data_source_id unless custom_data_source_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a web property-Google Ads link.
        # @param [String] account_id
        #   ID of the account which the given web property belongs to.
        # @param [String] web_property_id
        #   Web property ID to delete the Google Ads link for.
        # @param [String] web_property_ad_words_link_id
        #   Web property Google Ads link ID.
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
        def delete_web_property_ad_words_link(account_id, web_property_id, web_property_ad_words_link_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'management/accounts/{accountId}/webproperties/{webPropertyId}/entityAdWordsLinks/{webPropertyAdWordsLinkId}', options)
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['webPropertyAdWordsLinkId'] = web_property_ad_words_link_id unless web_property_ad_words_link_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a web property-Google Ads link to which the user has access.
        # @param [String] account_id
        #   ID of the account which the given web property belongs to.
        # @param [String] web_property_id
        #   Web property ID to retrieve the Google Ads link for.
        # @param [String] web_property_ad_words_link_id
        #   Web property-Google Ads link ID.
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
        # @yieldparam result [Google::Apis::AnalyticsV3::EntityAdWordsLink] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::EntityAdWordsLink]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_web_property_ad_words_link(account_id, web_property_id, web_property_ad_words_link_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accounts/{accountId}/webproperties/{webPropertyId}/entityAdWordsLinks/{webPropertyAdWordsLinkId}', options)
          command.response_representation = Google::Apis::AnalyticsV3::EntityAdWordsLink::Representation
          command.response_class = Google::Apis::AnalyticsV3::EntityAdWordsLink
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['webPropertyAdWordsLinkId'] = web_property_ad_words_link_id unless web_property_ad_words_link_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a webProperty-Google Ads link.
        # @param [String] account_id
        #   ID of the Google Analytics account to create the link for.
        # @param [String] web_property_id
        #   Web property ID to create the link for.
        # @param [Google::Apis::AnalyticsV3::EntityAdWordsLink] entity_ad_words_link_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::EntityAdWordsLink] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::EntityAdWordsLink]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_web_property_ad_words_link(account_id, web_property_id, entity_ad_words_link_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'management/accounts/{accountId}/webproperties/{webPropertyId}/entityAdWordsLinks', options)
          command.request_representation = Google::Apis::AnalyticsV3::EntityAdWordsLink::Representation
          command.request_object = entity_ad_words_link_object
          command.response_representation = Google::Apis::AnalyticsV3::EntityAdWordsLink::Representation
          command.response_class = Google::Apis::AnalyticsV3::EntityAdWordsLink
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists webProperty-Google Ads links for a given web property.
        # @param [String] account_id
        #   ID of the account which the given web property belongs to.
        # @param [String] web_property_id
        #   Web property ID to retrieve the Google Ads links for.
        # @param [Fixnum] max_results
        #   The maximum number of webProperty-Google Ads links to include in this response.
        # @param [Fixnum] start_index
        #   An index of the first webProperty-Google Ads link to retrieve. Use this
        #   parameter as a pagination mechanism along with the max-results parameter.
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
        # @yieldparam result [Google::Apis::AnalyticsV3::EntityAdWordsLinks] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::EntityAdWordsLinks]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_web_property_ad_words_links(account_id, web_property_id, max_results: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accounts/{accountId}/webproperties/{webPropertyId}/entityAdWordsLinks', options)
          command.response_representation = Google::Apis::AnalyticsV3::EntityAdWordsLinks::Representation
          command.response_class = Google::Apis::AnalyticsV3::EntityAdWordsLinks
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.query['max-results'] = max_results unless max_results.nil?
          command.query['start-index'] = start_index unless start_index.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing webProperty-Google Ads link. This method supports patch
        # semantics.
        # @param [String] account_id
        #   ID of the account which the given web property belongs to.
        # @param [String] web_property_id
        #   Web property ID to retrieve the Google Ads link for.
        # @param [String] web_property_ad_words_link_id
        #   Web property-Google Ads link ID.
        # @param [Google::Apis::AnalyticsV3::EntityAdWordsLink] entity_ad_words_link_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::EntityAdWordsLink] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::EntityAdWordsLink]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_web_property_ad_words_link(account_id, web_property_id, web_property_ad_words_link_id, entity_ad_words_link_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'management/accounts/{accountId}/webproperties/{webPropertyId}/entityAdWordsLinks/{webPropertyAdWordsLinkId}', options)
          command.request_representation = Google::Apis::AnalyticsV3::EntityAdWordsLink::Representation
          command.request_object = entity_ad_words_link_object
          command.response_representation = Google::Apis::AnalyticsV3::EntityAdWordsLink::Representation
          command.response_class = Google::Apis::AnalyticsV3::EntityAdWordsLink
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['webPropertyAdWordsLinkId'] = web_property_ad_words_link_id unless web_property_ad_words_link_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing webProperty-Google Ads link.
        # @param [String] account_id
        #   ID of the account which the given web property belongs to.
        # @param [String] web_property_id
        #   Web property ID to retrieve the Google Ads link for.
        # @param [String] web_property_ad_words_link_id
        #   Web property-Google Ads link ID.
        # @param [Google::Apis::AnalyticsV3::EntityAdWordsLink] entity_ad_words_link_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::EntityAdWordsLink] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::EntityAdWordsLink]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_web_property_ad_words_link(account_id, web_property_id, web_property_ad_words_link_id, entity_ad_words_link_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'management/accounts/{accountId}/webproperties/{webPropertyId}/entityAdWordsLinks/{webPropertyAdWordsLinkId}', options)
          command.request_representation = Google::Apis::AnalyticsV3::EntityAdWordsLink::Representation
          command.request_object = entity_ad_words_link_object
          command.response_representation = Google::Apis::AnalyticsV3::EntityAdWordsLink::Representation
          command.response_class = Google::Apis::AnalyticsV3::EntityAdWordsLink
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['webPropertyAdWordsLinkId'] = web_property_ad_words_link_id unless web_property_ad_words_link_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a web property to which the user has access.
        # @param [String] account_id
        #   Account ID to retrieve the web property for.
        # @param [String] web_property_id
        #   ID to retrieve the web property for.
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
        # @yieldparam result [Google::Apis::AnalyticsV3::Webproperty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::Webproperty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_web_property(account_id, web_property_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accounts/{accountId}/webproperties/{webPropertyId}', options)
          command.response_representation = Google::Apis::AnalyticsV3::Webproperty::Representation
          command.response_class = Google::Apis::AnalyticsV3::Webproperty
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Create a new property if the account has fewer than 20 properties. Web
        # properties are visible in the Google Analytics interface only if they have at
        # least one profile.
        # @param [String] account_id
        #   Account ID to create the web property for.
        # @param [Google::Apis::AnalyticsV3::Webproperty] webproperty_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::Webproperty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::Webproperty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_web_property(account_id, webproperty_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'management/accounts/{accountId}/webproperties', options)
          command.request_representation = Google::Apis::AnalyticsV3::Webproperty::Representation
          command.request_object = webproperty_object
          command.response_representation = Google::Apis::AnalyticsV3::Webproperty::Representation
          command.response_class = Google::Apis::AnalyticsV3::Webproperty
          command.params['accountId'] = account_id unless account_id.nil?
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
        # @yieldparam result [Google::Apis::AnalyticsV3::Webproperties] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::Webproperties]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_web_properties(account_id, max_results: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accounts/{accountId}/webproperties', options)
          command.response_representation = Google::Apis::AnalyticsV3::Webproperties::Representation
          command.response_class = Google::Apis::AnalyticsV3::Webproperties
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['max-results'] = max_results unless max_results.nil?
          command.query['start-index'] = start_index unless start_index.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing web property. This method supports patch semantics.
        # @param [String] account_id
        #   Account ID to which the web property belongs
        # @param [String] web_property_id
        #   Web property ID
        # @param [Google::Apis::AnalyticsV3::Webproperty] webproperty_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::Webproperty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::Webproperty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_web_property(account_id, web_property_id, webproperty_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'management/accounts/{accountId}/webproperties/{webPropertyId}', options)
          command.request_representation = Google::Apis::AnalyticsV3::Webproperty::Representation
          command.request_object = webproperty_object
          command.response_representation = Google::Apis::AnalyticsV3::Webproperty::Representation
          command.response_class = Google::Apis::AnalyticsV3::Webproperty
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing web property.
        # @param [String] account_id
        #   Account ID to which the web property belongs
        # @param [String] web_property_id
        #   Web property ID
        # @param [Google::Apis::AnalyticsV3::Webproperty] webproperty_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::Webproperty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::Webproperty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_web_property(account_id, web_property_id, webproperty_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'management/accounts/{accountId}/webproperties/{webPropertyId}', options)
          command.request_representation = Google::Apis::AnalyticsV3::Webproperty::Representation
          command.request_object = webproperty_object
          command.response_representation = Google::Apis::AnalyticsV3::Webproperty::Representation
          command.response_class = Google::Apis::AnalyticsV3::Webproperty
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Removes a user from the given web property.
        # @param [String] account_id
        #   Account ID to delete the user link for.
        # @param [String] web_property_id
        #   Web Property ID to delete the user link for.
        # @param [String] link_id
        #   Link ID to delete the user link for.
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
        def delete_web_property_user_link(account_id, web_property_id, link_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'management/accounts/{accountId}/webproperties/{webPropertyId}/entityUserLinks/{linkId}', options)
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['linkId'] = link_id unless link_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Adds a new user to the given web property.
        # @param [String] account_id
        #   Account ID to create the user link for.
        # @param [String] web_property_id
        #   Web Property ID to create the user link for.
        # @param [Google::Apis::AnalyticsV3::EntityUserLink] entity_user_link_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::EntityUserLink] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::EntityUserLink]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_web_property_user_link(account_id, web_property_id, entity_user_link_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'management/accounts/{accountId}/webproperties/{webPropertyId}/entityUserLinks', options)
          command.request_representation = Google::Apis::AnalyticsV3::EntityUserLink::Representation
          command.request_object = entity_user_link_object
          command.response_representation = Google::Apis::AnalyticsV3::EntityUserLink::Representation
          command.response_class = Google::Apis::AnalyticsV3::EntityUserLink
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists webProperty-user links for a given web property.
        # @param [String] account_id
        #   Account ID which the given web property belongs to.
        # @param [String] web_property_id
        #   Web Property ID for the webProperty-user links to retrieve. Can either be a
        #   specific web property ID or '~all', which refers to all the web properties
        #   that user has access to.
        # @param [Fixnum] max_results
        #   The maximum number of webProperty-user Links to include in this response.
        # @param [Fixnum] start_index
        #   An index of the first webProperty-user link to retrieve. Use this parameter as
        #   a pagination mechanism along with the max-results parameter.
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
        # @yieldparam result [Google::Apis::AnalyticsV3::EntityUserLinks] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::EntityUserLinks]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_web_property_user_links(account_id, web_property_id, max_results: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'management/accounts/{accountId}/webproperties/{webPropertyId}/entityUserLinks', options)
          command.response_representation = Google::Apis::AnalyticsV3::EntityUserLinks::Representation
          command.response_class = Google::Apis::AnalyticsV3::EntityUserLinks
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.query['max-results'] = max_results unless max_results.nil?
          command.query['start-index'] = start_index unless start_index.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates permissions for an existing user on the given web property.
        # @param [String] account_id
        #   Account ID to update the account-user link for.
        # @param [String] web_property_id
        #   Web property ID to update the account-user link for.
        # @param [String] link_id
        #   Link ID to update the account-user link for.
        # @param [Google::Apis::AnalyticsV3::EntityUserLink] entity_user_link_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::EntityUserLink] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::EntityUserLink]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_web_property_user_link(account_id, web_property_id, link_id, entity_user_link_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'management/accounts/{accountId}/webproperties/{webPropertyId}/entityUserLinks/{linkId}', options)
          command.request_representation = Google::Apis::AnalyticsV3::EntityUserLink::Representation
          command.request_object = entity_user_link_object
          command.response_representation = Google::Apis::AnalyticsV3::EntityUserLink::Representation
          command.response_class = Google::Apis::AnalyticsV3::EntityUserLink
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['webPropertyId'] = web_property_id unless web_property_id.nil?
          command.params['linkId'] = link_id unless link_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all columns for a report type
        # @param [String] report_type
        #   Report type. Allowed Values: 'ga'. Where 'ga' corresponds to the Core
        #   Reporting API
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
        # @yieldparam result [Google::Apis::AnalyticsV3::Columns] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::Columns]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_metadata_columns(report_type, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'metadata/{reportType}/columns', options)
          command.response_representation = Google::Apis::AnalyticsV3::Columns::Representation
          command.response_class = Google::Apis::AnalyticsV3::Columns
          command.params['reportType'] = report_type unless report_type.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates an account ticket.
        # @param [Google::Apis::AnalyticsV3::AccountTicket] account_ticket_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::AccountTicket] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::AccountTicket]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_account_ticket(account_ticket_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'provisioning/createAccountTicket', options)
          command.request_representation = Google::Apis::AnalyticsV3::AccountTicket::Representation
          command.request_object = account_ticket_object
          command.response_representation = Google::Apis::AnalyticsV3::AccountTicket::Representation
          command.response_class = Google::Apis::AnalyticsV3::AccountTicket
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Provision account.
        # @param [Google::Apis::AnalyticsV3::AccountTreeRequest] account_tree_request_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::AccountTreeResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::AccountTreeResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_provisioning_account_tree(account_tree_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'provisioning/createAccountTree', options)
          command.request_representation = Google::Apis::AnalyticsV3::AccountTreeRequest::Representation
          command.request_object = account_tree_request_object
          command.response_representation = Google::Apis::AnalyticsV3::AccountTreeResponse::Representation
          command.response_class = Google::Apis::AnalyticsV3::AccountTreeResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Insert or update a user deletion requests.
        # @param [Google::Apis::AnalyticsV3::UserDeletionRequest] user_deletion_request_object
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
        # @yieldparam result [Google::Apis::AnalyticsV3::UserDeletionRequest] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AnalyticsV3::UserDeletionRequest]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def upsert_user_deletion_user_deletion_request(user_deletion_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userDeletion/userDeletionRequests:upsert', options)
          command.request_representation = Google::Apis::AnalyticsV3::UserDeletionRequest::Representation
          command.request_object = user_deletion_request_object
          command.response_representation = Google::Apis::AnalyticsV3::UserDeletionRequest::Representation
          command.response_class = Google::Apis::AnalyticsV3::UserDeletionRequest
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
