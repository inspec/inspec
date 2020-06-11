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
    module AdsensehostV4_1
      # AdSense Host API
      #
      # Generates performance reports, generates ad codes, and provides publisher
      #  management capabilities for AdSense Hosts.
      #
      # @example
      #    require 'google/apis/adsensehost_v4_1'
      #
      #    Adsensehost = Google::Apis::AdsensehostV4_1 # Alias the module
      #    service = Adsensehost::AdSenseHostService.new
      #
      # @see https://developers.google.com/adsense/host/
      class AdSenseHostService < Google::Apis::Core::BaseService
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
          super('https://www.googleapis.com/', 'adsensehost/v4.1/')
          @batch_path = 'batch/adsensehost/v4.1'
        end
        
        # Get information about the selected associated AdSense account.
        # @param [String] account_id
        #   Account to get information about.
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
        # @yieldparam result [Google::Apis::AdsensehostV4_1::Account] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdsensehostV4_1::Account]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_account(account_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'accounts/{accountId}', options)
          command.response_representation = Google::Apis::AdsensehostV4_1::Account::Representation
          command.response_class = Google::Apis::AdsensehostV4_1::Account
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List hosted accounts associated with this AdSense account by ad client id.
        # @param [Array<String>, String] filter_ad_client_id
        #   Ad clients to list accounts for.
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
        # @yieldparam result [Google::Apis::AdsensehostV4_1::Accounts] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdsensehostV4_1::Accounts]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_accounts(filter_ad_client_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'accounts', options)
          command.response_representation = Google::Apis::AdsensehostV4_1::Accounts::Representation
          command.response_class = Google::Apis::AdsensehostV4_1::Accounts
          command.query['filterAdClientId'] = filter_ad_client_id unless filter_ad_client_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get information about one of the ad clients in the specified publisher's
        # AdSense account.
        # @param [String] account_id
        #   Account which contains the ad client.
        # @param [String] ad_client_id
        #   Ad client to get.
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
        # @yieldparam result [Google::Apis::AdsensehostV4_1::AdClient] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdsensehostV4_1::AdClient]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_account_ad_client(account_id, ad_client_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'accounts/{accountId}/adclients/{adClientId}', options)
          command.response_representation = Google::Apis::AdsensehostV4_1::AdClient::Representation
          command.response_class = Google::Apis::AdsensehostV4_1::AdClient
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['adClientId'] = ad_client_id unless ad_client_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all hosted ad clients in the specified hosted account.
        # @param [String] account_id
        #   Account for which to list ad clients.
        # @param [Fixnum] max_results
        #   The maximum number of ad clients to include in the response, used for paging.
        # @param [String] page_token
        #   A continuation token, used to page through ad clients. To retrieve the next
        #   page, set this parameter to the value of "nextPageToken" from the previous
        #   response.
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
        # @yieldparam result [Google::Apis::AdsensehostV4_1::AdClients] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdsensehostV4_1::AdClients]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_account_ad_clients(account_id, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'accounts/{accountId}/adclients', options)
          command.response_representation = Google::Apis::AdsensehostV4_1::AdClients::Representation
          command.response_class = Google::Apis::AdsensehostV4_1::AdClients
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Delete the specified ad unit from the specified publisher AdSense account.
        # @param [String] account_id
        #   Account which contains the ad unit.
        # @param [String] ad_client_id
        #   Ad client for which to get ad unit.
        # @param [String] ad_unit_id
        #   Ad unit to delete.
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
        # @yieldparam result [Google::Apis::AdsensehostV4_1::AdUnit] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdsensehostV4_1::AdUnit]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_account_ad_unit(account_id, ad_client_id, ad_unit_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'accounts/{accountId}/adclients/{adClientId}/adunits/{adUnitId}', options)
          command.response_representation = Google::Apis::AdsensehostV4_1::AdUnit::Representation
          command.response_class = Google::Apis::AdsensehostV4_1::AdUnit
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['adClientId'] = ad_client_id unless ad_client_id.nil?
          command.params['adUnitId'] = ad_unit_id unless ad_unit_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get the specified host ad unit in this AdSense account.
        # @param [String] account_id
        #   Account which contains the ad unit.
        # @param [String] ad_client_id
        #   Ad client for which to get ad unit.
        # @param [String] ad_unit_id
        #   Ad unit to get.
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
        # @yieldparam result [Google::Apis::AdsensehostV4_1::AdUnit] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdsensehostV4_1::AdUnit]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_account_ad_unit(account_id, ad_client_id, ad_unit_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'accounts/{accountId}/adclients/{adClientId}/adunits/{adUnitId}', options)
          command.response_representation = Google::Apis::AdsensehostV4_1::AdUnit::Representation
          command.response_class = Google::Apis::AdsensehostV4_1::AdUnit
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['adClientId'] = ad_client_id unless ad_client_id.nil?
          command.params['adUnitId'] = ad_unit_id unless ad_unit_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get ad code for the specified ad unit, attaching the specified host custom
        # channels.
        # @param [String] account_id
        #   Account which contains the ad client.
        # @param [String] ad_client_id
        #   Ad client with contains the ad unit.
        # @param [String] ad_unit_id
        #   Ad unit to get the code for.
        # @param [Array<String>, String] host_custom_channel_id
        #   Host custom channel to attach to the ad code.
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
        # @yieldparam result [Google::Apis::AdsensehostV4_1::AdCode] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdsensehostV4_1::AdCode]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_account_ad_unit_ad_code(account_id, ad_client_id, ad_unit_id, host_custom_channel_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'accounts/{accountId}/adclients/{adClientId}/adunits/{adUnitId}/adcode', options)
          command.response_representation = Google::Apis::AdsensehostV4_1::AdCode::Representation
          command.response_class = Google::Apis::AdsensehostV4_1::AdCode
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['adClientId'] = ad_client_id unless ad_client_id.nil?
          command.params['adUnitId'] = ad_unit_id unless ad_unit_id.nil?
          command.query['hostCustomChannelId'] = host_custom_channel_id unless host_custom_channel_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Insert the supplied ad unit into the specified publisher AdSense account.
        # @param [String] account_id
        #   Account which will contain the ad unit.
        # @param [String] ad_client_id
        #   Ad client into which to insert the ad unit.
        # @param [Google::Apis::AdsensehostV4_1::AdUnit] ad_unit_object
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
        # @yieldparam result [Google::Apis::AdsensehostV4_1::AdUnit] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdsensehostV4_1::AdUnit]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_account_ad_unit(account_id, ad_client_id, ad_unit_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'accounts/{accountId}/adclients/{adClientId}/adunits', options)
          command.request_representation = Google::Apis::AdsensehostV4_1::AdUnit::Representation
          command.request_object = ad_unit_object
          command.response_representation = Google::Apis::AdsensehostV4_1::AdUnit::Representation
          command.response_class = Google::Apis::AdsensehostV4_1::AdUnit
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['adClientId'] = ad_client_id unless ad_client_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all ad units in the specified publisher's AdSense account.
        # @param [String] account_id
        #   Account which contains the ad client.
        # @param [String] ad_client_id
        #   Ad client for which to list ad units.
        # @param [Boolean] include_inactive
        #   Whether to include inactive ad units. Default: true.
        # @param [Fixnum] max_results
        #   The maximum number of ad units to include in the response, used for paging.
        # @param [String] page_token
        #   A continuation token, used to page through ad units. To retrieve the next page,
        #   set this parameter to the value of "nextPageToken" from the previous response.
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
        # @yieldparam result [Google::Apis::AdsensehostV4_1::AdUnits] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdsensehostV4_1::AdUnits]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_account_ad_units(account_id, ad_client_id, include_inactive: nil, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'accounts/{accountId}/adclients/{adClientId}/adunits', options)
          command.response_representation = Google::Apis::AdsensehostV4_1::AdUnits::Representation
          command.response_class = Google::Apis::AdsensehostV4_1::AdUnits
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['adClientId'] = ad_client_id unless ad_client_id.nil?
          command.query['includeInactive'] = include_inactive unless include_inactive.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update the supplied ad unit in the specified publisher AdSense account. This
        # method supports patch semantics.
        # @param [String] account_id
        #   Account which contains the ad client.
        # @param [String] ad_client_id
        #   Ad client which contains the ad unit.
        # @param [String] ad_unit_id
        #   Ad unit to get.
        # @param [Google::Apis::AdsensehostV4_1::AdUnit] ad_unit_object
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
        # @yieldparam result [Google::Apis::AdsensehostV4_1::AdUnit] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdsensehostV4_1::AdUnit]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_account_ad_unit(account_id, ad_client_id, ad_unit_id, ad_unit_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'accounts/{accountId}/adclients/{adClientId}/adunits', options)
          command.request_representation = Google::Apis::AdsensehostV4_1::AdUnit::Representation
          command.request_object = ad_unit_object
          command.response_representation = Google::Apis::AdsensehostV4_1::AdUnit::Representation
          command.response_class = Google::Apis::AdsensehostV4_1::AdUnit
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['adClientId'] = ad_client_id unless ad_client_id.nil?
          command.query['adUnitId'] = ad_unit_id unless ad_unit_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update the supplied ad unit in the specified publisher AdSense account.
        # @param [String] account_id
        #   Account which contains the ad client.
        # @param [String] ad_client_id
        #   Ad client which contains the ad unit.
        # @param [Google::Apis::AdsensehostV4_1::AdUnit] ad_unit_object
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
        # @yieldparam result [Google::Apis::AdsensehostV4_1::AdUnit] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdsensehostV4_1::AdUnit]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_account_ad_unit(account_id, ad_client_id, ad_unit_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'accounts/{accountId}/adclients/{adClientId}/adunits', options)
          command.request_representation = Google::Apis::AdsensehostV4_1::AdUnit::Representation
          command.request_object = ad_unit_object
          command.response_representation = Google::Apis::AdsensehostV4_1::AdUnit::Representation
          command.response_class = Google::Apis::AdsensehostV4_1::AdUnit
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['adClientId'] = ad_client_id unless ad_client_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Generate an AdSense report based on the report request sent in the query
        # parameters. Returns the result as JSON; to retrieve output in CSV format
        # specify "alt=csv" as a query parameter.
        # @param [String] account_id
        #   Hosted account upon which to report.
        # @param [String] start_date
        #   Start of the date range to report on in "YYYY-MM-DD" format, inclusive.
        # @param [String] end_date
        #   End of the date range to report on in "YYYY-MM-DD" format, inclusive.
        # @param [Array<String>, String] dimension
        #   Dimensions to base the report on.
        # @param [Array<String>, String] filter
        #   Filters to be run on the report.
        # @param [String] locale
        #   Optional locale to use for translating report output to a local language.
        #   Defaults to "en_US" if not specified.
        # @param [Fixnum] max_results
        #   The maximum number of rows of report data to return.
        # @param [Array<String>, String] metric
        #   Numeric columns to include in the report.
        # @param [Array<String>, String] sort
        #   The name of a dimension or metric to sort the resulting report on, optionally
        #   prefixed with "+" to sort ascending or "-" to sort descending. If no prefix is
        #   specified, the column is sorted ascending.
        # @param [Fixnum] start_index
        #   Index of the first row of report data to return.
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
        # @yieldparam result [Google::Apis::AdsensehostV4_1::Report] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdsensehostV4_1::Report]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def generate_account_report(account_id, start_date, end_date, dimension: nil, filter: nil, locale: nil, max_results: nil, metric: nil, sort: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'accounts/{accountId}/reports', options)
          command.response_representation = Google::Apis::AdsensehostV4_1::Report::Representation
          command.response_class = Google::Apis::AdsensehostV4_1::Report
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['dimension'] = dimension unless dimension.nil?
          command.query['endDate'] = end_date unless end_date.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['locale'] = locale unless locale.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['metric'] = metric unless metric.nil?
          command.query['sort'] = sort unless sort.nil?
          command.query['startDate'] = start_date unless start_date.nil?
          command.query['startIndex'] = start_index unless start_index.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get information about one of the ad clients in the Host AdSense account.
        # @param [String] ad_client_id
        #   Ad client to get.
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
        # @yieldparam result [Google::Apis::AdsensehostV4_1::AdClient] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdsensehostV4_1::AdClient]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_ad_client(ad_client_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'adclients/{adClientId}', options)
          command.response_representation = Google::Apis::AdsensehostV4_1::AdClient::Representation
          command.response_class = Google::Apis::AdsensehostV4_1::AdClient
          command.params['adClientId'] = ad_client_id unless ad_client_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all host ad clients in this AdSense account.
        # @param [Fixnum] max_results
        #   The maximum number of ad clients to include in the response, used for paging.
        # @param [String] page_token
        #   A continuation token, used to page through ad clients. To retrieve the next
        #   page, set this parameter to the value of "nextPageToken" from the previous
        #   response.
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
        # @yieldparam result [Google::Apis::AdsensehostV4_1::AdClients] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdsensehostV4_1::AdClients]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_ad_clients(max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'adclients', options)
          command.response_representation = Google::Apis::AdsensehostV4_1::AdClients::Representation
          command.response_class = Google::Apis::AdsensehostV4_1::AdClients
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Create an association session for initiating an association with an AdSense
        # user.
        # @param [Array<String>, String] product_code
        #   Products to associate with the user.
        # @param [String] website_url
        #   The URL of the user's hosted website.
        # @param [String] user_locale
        #   The preferred locale of the user.
        # @param [String] website_locale
        #   The locale of the user's hosted website.
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
        # @yieldparam result [Google::Apis::AdsensehostV4_1::AssociationSession] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdsensehostV4_1::AssociationSession]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def start_association_session(product_code, website_url, user_locale: nil, website_locale: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'associationsessions/start', options)
          command.response_representation = Google::Apis::AdsensehostV4_1::AssociationSession::Representation
          command.response_class = Google::Apis::AdsensehostV4_1::AssociationSession
          command.query['productCode'] = product_code unless product_code.nil?
          command.query['userLocale'] = user_locale unless user_locale.nil?
          command.query['websiteLocale'] = website_locale unless website_locale.nil?
          command.query['websiteUrl'] = website_url unless website_url.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Verify an association session after the association callback returns from
        # AdSense signup.
        # @param [String] token
        #   The token returned to the association callback URL.
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
        # @yieldparam result [Google::Apis::AdsensehostV4_1::AssociationSession] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdsensehostV4_1::AssociationSession]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def verify_association_session(token, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'associationsessions/verify', options)
          command.response_representation = Google::Apis::AdsensehostV4_1::AssociationSession::Representation
          command.response_class = Google::Apis::AdsensehostV4_1::AssociationSession
          command.query['token'] = token unless token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Delete a specific custom channel from the host AdSense account.
        # @param [String] ad_client_id
        #   Ad client from which to delete the custom channel.
        # @param [String] custom_channel_id
        #   Custom channel to delete.
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
        # @yieldparam result [Google::Apis::AdsensehostV4_1::CustomChannel] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdsensehostV4_1::CustomChannel]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_custom_channel(ad_client_id, custom_channel_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'adclients/{adClientId}/customchannels/{customChannelId}', options)
          command.response_representation = Google::Apis::AdsensehostV4_1::CustomChannel::Representation
          command.response_class = Google::Apis::AdsensehostV4_1::CustomChannel
          command.params['adClientId'] = ad_client_id unless ad_client_id.nil?
          command.params['customChannelId'] = custom_channel_id unless custom_channel_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get a specific custom channel from the host AdSense account.
        # @param [String] ad_client_id
        #   Ad client from which to get the custom channel.
        # @param [String] custom_channel_id
        #   Custom channel to get.
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
        # @yieldparam result [Google::Apis::AdsensehostV4_1::CustomChannel] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdsensehostV4_1::CustomChannel]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_custom_channel(ad_client_id, custom_channel_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'adclients/{adClientId}/customchannels/{customChannelId}', options)
          command.response_representation = Google::Apis::AdsensehostV4_1::CustomChannel::Representation
          command.response_class = Google::Apis::AdsensehostV4_1::CustomChannel
          command.params['adClientId'] = ad_client_id unless ad_client_id.nil?
          command.params['customChannelId'] = custom_channel_id unless custom_channel_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Add a new custom channel to the host AdSense account.
        # @param [String] ad_client_id
        #   Ad client to which the new custom channel will be added.
        # @param [Google::Apis::AdsensehostV4_1::CustomChannel] custom_channel_object
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
        # @yieldparam result [Google::Apis::AdsensehostV4_1::CustomChannel] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdsensehostV4_1::CustomChannel]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_custom_channel(ad_client_id, custom_channel_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'adclients/{adClientId}/customchannels', options)
          command.request_representation = Google::Apis::AdsensehostV4_1::CustomChannel::Representation
          command.request_object = custom_channel_object
          command.response_representation = Google::Apis::AdsensehostV4_1::CustomChannel::Representation
          command.response_class = Google::Apis::AdsensehostV4_1::CustomChannel
          command.params['adClientId'] = ad_client_id unless ad_client_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all host custom channels in this AdSense account.
        # @param [String] ad_client_id
        #   Ad client for which to list custom channels.
        # @param [Fixnum] max_results
        #   The maximum number of custom channels to include in the response, used for
        #   paging.
        # @param [String] page_token
        #   A continuation token, used to page through custom channels. To retrieve the
        #   next page, set this parameter to the value of "nextPageToken" from the
        #   previous response.
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
        # @yieldparam result [Google::Apis::AdsensehostV4_1::CustomChannels] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdsensehostV4_1::CustomChannels]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_custom_channels(ad_client_id, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'adclients/{adClientId}/customchannels', options)
          command.response_representation = Google::Apis::AdsensehostV4_1::CustomChannels::Representation
          command.response_class = Google::Apis::AdsensehostV4_1::CustomChannels
          command.params['adClientId'] = ad_client_id unless ad_client_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update a custom channel in the host AdSense account. This method supports
        # patch semantics.
        # @param [String] ad_client_id
        #   Ad client in which the custom channel will be updated.
        # @param [String] custom_channel_id
        #   Custom channel to get.
        # @param [Google::Apis::AdsensehostV4_1::CustomChannel] custom_channel_object
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
        # @yieldparam result [Google::Apis::AdsensehostV4_1::CustomChannel] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdsensehostV4_1::CustomChannel]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_custom_channel(ad_client_id, custom_channel_id, custom_channel_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'adclients/{adClientId}/customchannels', options)
          command.request_representation = Google::Apis::AdsensehostV4_1::CustomChannel::Representation
          command.request_object = custom_channel_object
          command.response_representation = Google::Apis::AdsensehostV4_1::CustomChannel::Representation
          command.response_class = Google::Apis::AdsensehostV4_1::CustomChannel
          command.params['adClientId'] = ad_client_id unless ad_client_id.nil?
          command.query['customChannelId'] = custom_channel_id unless custom_channel_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update a custom channel in the host AdSense account.
        # @param [String] ad_client_id
        #   Ad client in which the custom channel will be updated.
        # @param [Google::Apis::AdsensehostV4_1::CustomChannel] custom_channel_object
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
        # @yieldparam result [Google::Apis::AdsensehostV4_1::CustomChannel] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdsensehostV4_1::CustomChannel]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_custom_channel(ad_client_id, custom_channel_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'adclients/{adClientId}/customchannels', options)
          command.request_representation = Google::Apis::AdsensehostV4_1::CustomChannel::Representation
          command.request_object = custom_channel_object
          command.response_representation = Google::Apis::AdsensehostV4_1::CustomChannel::Representation
          command.response_class = Google::Apis::AdsensehostV4_1::CustomChannel
          command.params['adClientId'] = ad_client_id unless ad_client_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Generate an AdSense report based on the report request sent in the query
        # parameters. Returns the result as JSON; to retrieve output in CSV format
        # specify "alt=csv" as a query parameter.
        # @param [String] start_date
        #   Start of the date range to report on in "YYYY-MM-DD" format, inclusive.
        # @param [String] end_date
        #   End of the date range to report on in "YYYY-MM-DD" format, inclusive.
        # @param [Array<String>, String] dimension
        #   Dimensions to base the report on.
        # @param [Array<String>, String] filter
        #   Filters to be run on the report.
        # @param [String] locale
        #   Optional locale to use for translating report output to a local language.
        #   Defaults to "en_US" if not specified.
        # @param [Fixnum] max_results
        #   The maximum number of rows of report data to return.
        # @param [Array<String>, String] metric
        #   Numeric columns to include in the report.
        # @param [Array<String>, String] sort
        #   The name of a dimension or metric to sort the resulting report on, optionally
        #   prefixed with "+" to sort ascending or "-" to sort descending. If no prefix is
        #   specified, the column is sorted ascending.
        # @param [Fixnum] start_index
        #   Index of the first row of report data to return.
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
        # @yieldparam result [Google::Apis::AdsensehostV4_1::Report] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdsensehostV4_1::Report]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def generate_report(start_date, end_date, dimension: nil, filter: nil, locale: nil, max_results: nil, metric: nil, sort: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'reports', options)
          command.response_representation = Google::Apis::AdsensehostV4_1::Report::Representation
          command.response_class = Google::Apis::AdsensehostV4_1::Report
          command.query['dimension'] = dimension unless dimension.nil?
          command.query['endDate'] = end_date unless end_date.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['locale'] = locale unless locale.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['metric'] = metric unless metric.nil?
          command.query['sort'] = sort unless sort.nil?
          command.query['startDate'] = start_date unless start_date.nil?
          command.query['startIndex'] = start_index unless start_index.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Delete a URL channel from the host AdSense account.
        # @param [String] ad_client_id
        #   Ad client from which to delete the URL channel.
        # @param [String] url_channel_id
        #   URL channel to delete.
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
        # @yieldparam result [Google::Apis::AdsensehostV4_1::UrlChannel] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdsensehostV4_1::UrlChannel]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_url_channel(ad_client_id, url_channel_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'adclients/{adClientId}/urlchannels/{urlChannelId}', options)
          command.response_representation = Google::Apis::AdsensehostV4_1::UrlChannel::Representation
          command.response_class = Google::Apis::AdsensehostV4_1::UrlChannel
          command.params['adClientId'] = ad_client_id unless ad_client_id.nil?
          command.params['urlChannelId'] = url_channel_id unless url_channel_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Add a new URL channel to the host AdSense account.
        # @param [String] ad_client_id
        #   Ad client to which the new URL channel will be added.
        # @param [Google::Apis::AdsensehostV4_1::UrlChannel] url_channel_object
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
        # @yieldparam result [Google::Apis::AdsensehostV4_1::UrlChannel] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdsensehostV4_1::UrlChannel]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_url_channel(ad_client_id, url_channel_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'adclients/{adClientId}/urlchannels', options)
          command.request_representation = Google::Apis::AdsensehostV4_1::UrlChannel::Representation
          command.request_object = url_channel_object
          command.response_representation = Google::Apis::AdsensehostV4_1::UrlChannel::Representation
          command.response_class = Google::Apis::AdsensehostV4_1::UrlChannel
          command.params['adClientId'] = ad_client_id unless ad_client_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all host URL channels in the host AdSense account.
        # @param [String] ad_client_id
        #   Ad client for which to list URL channels.
        # @param [Fixnum] max_results
        #   The maximum number of URL channels to include in the response, used for paging.
        # @param [String] page_token
        #   A continuation token, used to page through URL channels. To retrieve the next
        #   page, set this parameter to the value of "nextPageToken" from the previous
        #   response.
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
        # @yieldparam result [Google::Apis::AdsensehostV4_1::UrlChannels] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdsensehostV4_1::UrlChannels]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_url_channels(ad_client_id, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'adclients/{adClientId}/urlchannels', options)
          command.response_representation = Google::Apis::AdsensehostV4_1::UrlChannels::Representation
          command.response_class = Google::Apis::AdsensehostV4_1::UrlChannels
          command.params['adClientId'] = ad_client_id unless ad_client_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
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
