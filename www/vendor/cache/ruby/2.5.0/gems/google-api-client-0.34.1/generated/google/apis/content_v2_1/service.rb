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
    module ContentV2_1
      # Content API for Shopping
      #
      # Manages product items, inventory, and Merchant Center accounts for Google
      #  Shopping.
      #
      # @example
      #    require 'google/apis/content_v2_1'
      #
      #    Content = Google::Apis::ContentV2_1 # Alias the module
      #    service = Content::ShoppingContentService.new
      #
      # @see https://developers.google.com/shopping-content
      class ShoppingContentService < Google::Apis::Core::BaseService
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
          super('https://www.googleapis.com/', 'content/v2.1/')
          @batch_path = 'batch/content/v2.1'
        end
        
        # Returns information about the authenticated user.
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
        # @yieldparam result [Google::Apis::ContentV2_1::AccountsAuthInfoResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::AccountsAuthInfoResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def authinfo_account(fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'accounts/authinfo', options)
          command.response_representation = Google::Apis::ContentV2_1::AccountsAuthInfoResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::AccountsAuthInfoResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Claims the website of a Merchant Center sub-account.
        # @param [Fixnum] merchant_id
        #   The ID of the managing account. If this parameter is not the same as accountId,
        #   then this account must be a multi-client account and accountId must be the ID
        #   of a sub-account of this account.
        # @param [Fixnum] account_id
        #   The ID of the account whose website is claimed.
        # @param [Boolean] overwrite
        #   Only available to selected merchants. When set to True, this flag removes any
        #   existing claim on the requested website by another account and replaces it
        #   with a claim from this account.
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
        # @yieldparam result [Google::Apis::ContentV2_1::AccountsClaimWebsiteResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::AccountsClaimWebsiteResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def claimwebsite_account(merchant_id, account_id, overwrite: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/accounts/{accountId}/claimwebsite', options)
          command.response_representation = Google::Apis::ContentV2_1::AccountsClaimWebsiteResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::AccountsClaimWebsiteResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['overwrite'] = overwrite unless overwrite.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves, inserts, updates, and deletes multiple Merchant Center (sub-)
        # accounts in a single request.
        # @param [Google::Apis::ContentV2_1::AccountsCustomBatchRequest] accounts_custom_batch_request_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::AccountsCustomBatchResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::AccountsCustomBatchResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def custombatch_account(accounts_custom_batch_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'accounts/batch', options)
          command.request_representation = Google::Apis::ContentV2_1::AccountsCustomBatchRequest::Representation
          command.request_object = accounts_custom_batch_request_object
          command.response_representation = Google::Apis::ContentV2_1::AccountsCustomBatchResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::AccountsCustomBatchResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a Merchant Center sub-account.
        # @param [Fixnum] merchant_id
        #   The ID of the managing account. This must be a multi-client account, and
        #   accountId must be the ID of a sub-account of this account.
        # @param [Fixnum] account_id
        #   The ID of the account.
        # @param [Boolean] force
        #   Flag to delete sub-accounts with products. The default value is false.
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
        def delete_account(merchant_id, account_id, force: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, '{merchantId}/accounts/{accountId}', options)
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['force'] = force unless force.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The ID of the managing account. If this parameter is not the same as accountId,
        #   then this account must be a multi-client account and accountId must be the ID
        #   of a sub-account of this account.
        # @param [Fixnum] account_id
        #   The ID of the account.
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
        # @yieldparam result [Google::Apis::ContentV2_1::Account] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::Account]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_account(merchant_id, account_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/accounts/{accountId}', options)
          command.response_representation = Google::Apis::ContentV2_1::Account::Representation
          command.response_class = Google::Apis::ContentV2_1::Account
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a Merchant Center sub-account.
        # @param [Fixnum] merchant_id
        #   The ID of the managing account. This must be a multi-client account.
        # @param [Google::Apis::ContentV2_1::Account] account_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::Account] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::Account]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_account(merchant_id, account_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/accounts', options)
          command.request_representation = Google::Apis::ContentV2_1::Account::Representation
          command.request_object = account_object
          command.response_representation = Google::Apis::ContentV2_1::Account::Representation
          command.response_class = Google::Apis::ContentV2_1::Account
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Performs an action on a link between two Merchant Center accounts, namely
        # accountId and linkedAccountId.
        # @param [Fixnum] merchant_id
        #   The ID of the managing account. If this parameter is not the same as accountId,
        #   then this account must be a multi-client account and accountId must be the ID
        #   of a sub-account of this account.
        # @param [Fixnum] account_id
        #   The ID of the account that should be linked.
        # @param [Google::Apis::ContentV2_1::AccountsLinkRequest] accounts_link_request_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::AccountsLinkResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::AccountsLinkResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def link_account(merchant_id, account_id, accounts_link_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/accounts/{accountId}/link', options)
          command.request_representation = Google::Apis::ContentV2_1::AccountsLinkRequest::Representation
          command.request_object = accounts_link_request_object
          command.response_representation = Google::Apis::ContentV2_1::AccountsLinkResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::AccountsLinkResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the sub-accounts in your Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The ID of the managing account. This must be a multi-client account.
        # @param [Fixnum] max_results
        #   The maximum number of accounts to return in the response, used for paging.
        # @param [String] page_token
        #   The token returned by the previous request.
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
        # @yieldparam result [Google::Apis::ContentV2_1::AccountsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::AccountsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_accounts(merchant_id, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/accounts', options)
          command.response_representation = Google::Apis::ContentV2_1::AccountsListResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::AccountsListResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The ID of the managing account. If this parameter is not the same as accountId,
        #   then this account must be a multi-client account and accountId must be the ID
        #   of a sub-account of this account.
        # @param [Fixnum] account_id
        #   The ID of the account.
        # @param [Google::Apis::ContentV2_1::Account] account_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::Account] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::Account]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_account(merchant_id, account_id, account_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, '{merchantId}/accounts/{accountId}', options)
          command.request_representation = Google::Apis::ContentV2_1::Account::Representation
          command.request_object = account_object
          command.response_representation = Google::Apis::ContentV2_1::Account::Representation
          command.response_class = Google::Apis::ContentV2_1::Account
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves multiple Merchant Center account statuses in a single request.
        # @param [Google::Apis::ContentV2_1::AccountstatusesCustomBatchRequest] accountstatuses_custom_batch_request_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::AccountstatusesCustomBatchResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::AccountstatusesCustomBatchResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def custombatch_accountstatus(accountstatuses_custom_batch_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'accountstatuses/batch', options)
          command.request_representation = Google::Apis::ContentV2_1::AccountstatusesCustomBatchRequest::Representation
          command.request_object = accountstatuses_custom_batch_request_object
          command.response_representation = Google::Apis::ContentV2_1::AccountstatusesCustomBatchResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::AccountstatusesCustomBatchResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the status of a Merchant Center account. No itemLevelIssues are
        # returned for multi-client accounts.
        # @param [Fixnum] merchant_id
        #   The ID of the managing account. If this parameter is not the same as accountId,
        #   then this account must be a multi-client account and accountId must be the ID
        #   of a sub-account of this account.
        # @param [Fixnum] account_id
        #   The ID of the account.
        # @param [Array<String>, String] destinations
        #   If set, only issues for the specified destinations are returned, otherwise
        #   only issues for the Shopping destination.
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
        # @yieldparam result [Google::Apis::ContentV2_1::AccountStatus] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::AccountStatus]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_accountstatus(merchant_id, account_id, destinations: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/accountstatuses/{accountId}', options)
          command.response_representation = Google::Apis::ContentV2_1::AccountStatus::Representation
          command.response_class = Google::Apis::ContentV2_1::AccountStatus
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['destinations'] = destinations unless destinations.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the statuses of the sub-accounts in your Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The ID of the managing account. This must be a multi-client account.
        # @param [Array<String>, String] destinations
        #   If set, only issues for the specified destinations are returned, otherwise
        #   only issues for the Shopping destination.
        # @param [Fixnum] max_results
        #   The maximum number of account statuses to return in the response, used for
        #   paging.
        # @param [String] page_token
        #   The token returned by the previous request.
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
        # @yieldparam result [Google::Apis::ContentV2_1::AccountstatusesListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::AccountstatusesListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_accountstatuses(merchant_id, destinations: nil, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/accountstatuses', options)
          command.response_representation = Google::Apis::ContentV2_1::AccountstatusesListResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::AccountstatusesListResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.query['destinations'] = destinations unless destinations.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves and updates tax settings of multiple accounts in a single request.
        # @param [Google::Apis::ContentV2_1::AccounttaxCustomBatchRequest] accounttax_custom_batch_request_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::AccounttaxCustomBatchResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::AccounttaxCustomBatchResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def custombatch_accounttax(accounttax_custom_batch_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'accounttax/batch', options)
          command.request_representation = Google::Apis::ContentV2_1::AccounttaxCustomBatchRequest::Representation
          command.request_object = accounttax_custom_batch_request_object
          command.response_representation = Google::Apis::ContentV2_1::AccounttaxCustomBatchResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::AccounttaxCustomBatchResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the tax settings of the account.
        # @param [Fixnum] merchant_id
        #   The ID of the managing account. If this parameter is not the same as accountId,
        #   then this account must be a multi-client account and accountId must be the ID
        #   of a sub-account of this account.
        # @param [Fixnum] account_id
        #   The ID of the account for which to get/update account tax settings.
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
        # @yieldparam result [Google::Apis::ContentV2_1::AccountTax] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::AccountTax]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_accounttax(merchant_id, account_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/accounttax/{accountId}', options)
          command.response_representation = Google::Apis::ContentV2_1::AccountTax::Representation
          command.response_class = Google::Apis::ContentV2_1::AccountTax
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the tax settings of the sub-accounts in your Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The ID of the managing account. This must be a multi-client account.
        # @param [Fixnum] max_results
        #   The maximum number of tax settings to return in the response, used for paging.
        # @param [String] page_token
        #   The token returned by the previous request.
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
        # @yieldparam result [Google::Apis::ContentV2_1::AccounttaxListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::AccounttaxListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_accounttaxes(merchant_id, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/accounttax', options)
          command.response_representation = Google::Apis::ContentV2_1::AccounttaxListResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::AccounttaxListResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the tax settings of the account.
        # @param [Fixnum] merchant_id
        #   The ID of the managing account. If this parameter is not the same as accountId,
        #   then this account must be a multi-client account and accountId must be the ID
        #   of a sub-account of this account.
        # @param [Fixnum] account_id
        #   The ID of the account for which to get/update account tax settings.
        # @param [Google::Apis::ContentV2_1::AccountTax] account_tax_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::AccountTax] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::AccountTax]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_accounttax(merchant_id, account_id, account_tax_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, '{merchantId}/accounttax/{accountId}', options)
          command.request_representation = Google::Apis::ContentV2_1::AccountTax::Representation
          command.request_object = account_tax_object
          command.response_representation = Google::Apis::ContentV2_1::AccountTax::Representation
          command.response_class = Google::Apis::ContentV2_1::AccountTax
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes, fetches, gets, inserts and updates multiple datafeeds in a single
        # request.
        # @param [Google::Apis::ContentV2_1::DatafeedsCustomBatchRequest] datafeeds_custom_batch_request_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::DatafeedsCustomBatchResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::DatafeedsCustomBatchResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def custombatch_datafeed(datafeeds_custom_batch_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'datafeeds/batch', options)
          command.request_representation = Google::Apis::ContentV2_1::DatafeedsCustomBatchRequest::Representation
          command.request_object = datafeeds_custom_batch_request_object
          command.response_representation = Google::Apis::ContentV2_1::DatafeedsCustomBatchResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::DatafeedsCustomBatchResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a datafeed configuration from your Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The ID of the account that manages the datafeed. This account cannot be a
        #   multi-client account.
        # @param [Fixnum] datafeed_id
        #   The ID of the datafeed.
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
        def delete_datafeed(merchant_id, datafeed_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, '{merchantId}/datafeeds/{datafeedId}', options)
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['datafeedId'] = datafeed_id unless datafeed_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Invokes a fetch for the datafeed in your Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The ID of the account that manages the datafeed. This account cannot be a
        #   multi-client account.
        # @param [Fixnum] datafeed_id
        #   The ID of the datafeed to be fetched.
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
        # @yieldparam result [Google::Apis::ContentV2_1::DatafeedsFetchNowResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::DatafeedsFetchNowResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def fetchnow_datafeed(merchant_id, datafeed_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/datafeeds/{datafeedId}/fetchNow', options)
          command.response_representation = Google::Apis::ContentV2_1::DatafeedsFetchNowResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::DatafeedsFetchNowResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['datafeedId'] = datafeed_id unless datafeed_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a datafeed configuration from your Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The ID of the account that manages the datafeed. This account cannot be a
        #   multi-client account.
        # @param [Fixnum] datafeed_id
        #   The ID of the datafeed.
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
        # @yieldparam result [Google::Apis::ContentV2_1::Datafeed] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::Datafeed]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_datafeed(merchant_id, datafeed_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/datafeeds/{datafeedId}', options)
          command.response_representation = Google::Apis::ContentV2_1::Datafeed::Representation
          command.response_class = Google::Apis::ContentV2_1::Datafeed
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['datafeedId'] = datafeed_id unless datafeed_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Registers a datafeed configuration with your Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The ID of the account that manages the datafeed. This account cannot be a
        #   multi-client account.
        # @param [Google::Apis::ContentV2_1::Datafeed] datafeed_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::Datafeed] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::Datafeed]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_datafeed(merchant_id, datafeed_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/datafeeds', options)
          command.request_representation = Google::Apis::ContentV2_1::Datafeed::Representation
          command.request_object = datafeed_object
          command.response_representation = Google::Apis::ContentV2_1::Datafeed::Representation
          command.response_class = Google::Apis::ContentV2_1::Datafeed
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the configurations for datafeeds in your Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The ID of the account that manages the datafeeds. This account cannot be a
        #   multi-client account.
        # @param [Fixnum] max_results
        #   The maximum number of products to return in the response, used for paging.
        # @param [String] page_token
        #   The token returned by the previous request.
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
        # @yieldparam result [Google::Apis::ContentV2_1::DatafeedsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::DatafeedsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_datafeeds(merchant_id, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/datafeeds', options)
          command.response_representation = Google::Apis::ContentV2_1::DatafeedsListResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::DatafeedsListResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a datafeed configuration of your Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The ID of the account that manages the datafeed. This account cannot be a
        #   multi-client account.
        # @param [Fixnum] datafeed_id
        #   The ID of the datafeed.
        # @param [Google::Apis::ContentV2_1::Datafeed] datafeed_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::Datafeed] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::Datafeed]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_datafeed(merchant_id, datafeed_id, datafeed_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, '{merchantId}/datafeeds/{datafeedId}', options)
          command.request_representation = Google::Apis::ContentV2_1::Datafeed::Representation
          command.request_object = datafeed_object
          command.response_representation = Google::Apis::ContentV2_1::Datafeed::Representation
          command.response_class = Google::Apis::ContentV2_1::Datafeed
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['datafeedId'] = datafeed_id unless datafeed_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets multiple Merchant Center datafeed statuses in a single request.
        # @param [Google::Apis::ContentV2_1::DatafeedstatusesCustomBatchRequest] datafeedstatuses_custom_batch_request_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::DatafeedstatusesCustomBatchResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::DatafeedstatusesCustomBatchResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def custombatch_datafeedstatus(datafeedstatuses_custom_batch_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'datafeedstatuses/batch', options)
          command.request_representation = Google::Apis::ContentV2_1::DatafeedstatusesCustomBatchRequest::Representation
          command.request_object = datafeedstatuses_custom_batch_request_object
          command.response_representation = Google::Apis::ContentV2_1::DatafeedstatusesCustomBatchResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::DatafeedstatusesCustomBatchResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the status of a datafeed from your Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The ID of the account that manages the datafeed. This account cannot be a
        #   multi-client account.
        # @param [Fixnum] datafeed_id
        #   The ID of the datafeed.
        # @param [String] country
        #   The country for which to get the datafeed status. If this parameter is
        #   provided then language must also be provided. Note that this parameter is
        #   required for feeds targeting multiple countries and languages, since a feed
        #   may have a different status for each target.
        # @param [String] language
        #   The language for which to get the datafeed status. If this parameter is
        #   provided then country must also be provided. Note that this parameter is
        #   required for feeds targeting multiple countries and languages, since a feed
        #   may have a different status for each target.
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
        # @yieldparam result [Google::Apis::ContentV2_1::DatafeedStatus] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::DatafeedStatus]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_datafeedstatus(merchant_id, datafeed_id, country: nil, language: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/datafeedstatuses/{datafeedId}', options)
          command.response_representation = Google::Apis::ContentV2_1::DatafeedStatus::Representation
          command.response_class = Google::Apis::ContentV2_1::DatafeedStatus
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['datafeedId'] = datafeed_id unless datafeed_id.nil?
          command.query['country'] = country unless country.nil?
          command.query['language'] = language unless language.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the statuses of the datafeeds in your Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The ID of the account that manages the datafeeds. This account cannot be a
        #   multi-client account.
        # @param [Fixnum] max_results
        #   The maximum number of products to return in the response, used for paging.
        # @param [String] page_token
        #   The token returned by the previous request.
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
        # @yieldparam result [Google::Apis::ContentV2_1::DatafeedstatusesListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::DatafeedstatusesListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_datafeedstatuses(merchant_id, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/datafeedstatuses', options)
          command.response_representation = Google::Apis::ContentV2_1::DatafeedstatusesListResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::DatafeedstatusesListResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves and/or updates the LIA settings of multiple accounts in a single
        # request.
        # @param [Google::Apis::ContentV2_1::LiasettingsCustomBatchRequest] liasettings_custom_batch_request_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::LiasettingsCustomBatchResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::LiasettingsCustomBatchResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def custombatch_liasetting(liasettings_custom_batch_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'liasettings/batch', options)
          command.request_representation = Google::Apis::ContentV2_1::LiasettingsCustomBatchRequest::Representation
          command.request_object = liasettings_custom_batch_request_object
          command.response_representation = Google::Apis::ContentV2_1::LiasettingsCustomBatchResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::LiasettingsCustomBatchResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the LIA settings of the account.
        # @param [Fixnum] merchant_id
        #   The ID of the managing account. If this parameter is not the same as accountId,
        #   then this account must be a multi-client account and accountId must be the ID
        #   of a sub-account of this account.
        # @param [Fixnum] account_id
        #   The ID of the account for which to get or update LIA settings.
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
        # @yieldparam result [Google::Apis::ContentV2_1::LiaSettings] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::LiaSettings]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_liasetting(merchant_id, account_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/liasettings/{accountId}', options)
          command.response_representation = Google::Apis::ContentV2_1::LiaSettings::Representation
          command.response_class = Google::Apis::ContentV2_1::LiaSettings
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the list of accessible Google My Business accounts.
        # @param [Fixnum] merchant_id
        #   The ID of the managing account. If this parameter is not the same as accountId,
        #   then this account must be a multi-client account and accountId must be the ID
        #   of a sub-account of this account.
        # @param [Fixnum] account_id
        #   The ID of the account for which to retrieve accessible Google My Business
        #   accounts.
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
        # @yieldparam result [Google::Apis::ContentV2_1::LiasettingsGetAccessibleGmbAccountsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::LiasettingsGetAccessibleGmbAccountsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def getaccessiblegmbaccounts_liasetting(merchant_id, account_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/liasettings/{accountId}/accessiblegmbaccounts', options)
          command.response_representation = Google::Apis::ContentV2_1::LiasettingsGetAccessibleGmbAccountsResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::LiasettingsGetAccessibleGmbAccountsResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the LIA settings of the sub-accounts in your Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The ID of the managing account. This must be a multi-client account.
        # @param [Fixnum] max_results
        #   The maximum number of LIA settings to return in the response, used for paging.
        # @param [String] page_token
        #   The token returned by the previous request.
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
        # @yieldparam result [Google::Apis::ContentV2_1::LiasettingsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::LiasettingsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_liasettings(merchant_id, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/liasettings', options)
          command.response_representation = Google::Apis::ContentV2_1::LiasettingsListResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::LiasettingsListResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the list of POS data providers that have active settings for the all
        # eiligible countries.
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
        # @yieldparam result [Google::Apis::ContentV2_1::LiasettingsListPosDataProvidersResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::LiasettingsListPosDataProvidersResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def listposdataproviders_liasetting(fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'liasettings/posdataproviders', options)
          command.response_representation = Google::Apis::ContentV2_1::LiasettingsListPosDataProvidersResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::LiasettingsListPosDataProvidersResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Requests access to a specified Google My Business account.
        # @param [Fixnum] merchant_id
        #   The ID of the managing account. If this parameter is not the same as accountId,
        #   then this account must be a multi-client account and accountId must be the ID
        #   of a sub-account of this account.
        # @param [Fixnum] account_id
        #   The ID of the account for which GMB access is requested.
        # @param [String] gmb_email
        #   The email of the Google My Business account.
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
        # @yieldparam result [Google::Apis::ContentV2_1::LiasettingsRequestGmbAccessResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::LiasettingsRequestGmbAccessResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def requestgmbaccess_liasetting(merchant_id, account_id, gmb_email, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/liasettings/{accountId}/requestgmbaccess', options)
          command.response_representation = Google::Apis::ContentV2_1::LiasettingsRequestGmbAccessResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::LiasettingsRequestGmbAccessResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['gmbEmail'] = gmb_email unless gmb_email.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Requests inventory validation for the specified country.
        # @param [Fixnum] merchant_id
        #   The ID of the managing account. If this parameter is not the same as accountId,
        #   then this account must be a multi-client account and accountId must be the ID
        #   of a sub-account of this account.
        # @param [Fixnum] account_id
        #   The ID of the account that manages the order. This cannot be a multi-client
        #   account.
        # @param [String] country
        #   The country for which inventory validation is requested.
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
        # @yieldparam result [Google::Apis::ContentV2_1::LiasettingsRequestInventoryVerificationResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::LiasettingsRequestInventoryVerificationResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def requestinventoryverification_liasetting(merchant_id, account_id, country, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/liasettings/{accountId}/requestinventoryverification/{country}', options)
          command.response_representation = Google::Apis::ContentV2_1::LiasettingsRequestInventoryVerificationResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::LiasettingsRequestInventoryVerificationResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['country'] = country unless country.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets the inventory verification contract for the specified country.
        # @param [Fixnum] merchant_id
        #   The ID of the managing account. If this parameter is not the same as accountId,
        #   then this account must be a multi-client account and accountId must be the ID
        #   of a sub-account of this account.
        # @param [Fixnum] account_id
        #   The ID of the account that manages the order. This cannot be a multi-client
        #   account.
        # @param [String] contact_email
        #   The email of the inventory verification contact.
        # @param [String] contact_name
        #   The name of the inventory verification contact.
        # @param [String] country
        #   The country for which inventory verification is requested.
        # @param [String] language
        #   The language for which inventory verification is requested.
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
        # @yieldparam result [Google::Apis::ContentV2_1::LiasettingsSetInventoryVerificationContactResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::LiasettingsSetInventoryVerificationContactResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def setinventoryverificationcontact_liasetting(merchant_id, account_id, contact_email, contact_name, country, language, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/liasettings/{accountId}/setinventoryverificationcontact', options)
          command.response_representation = Google::Apis::ContentV2_1::LiasettingsSetInventoryVerificationContactResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::LiasettingsSetInventoryVerificationContactResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['contactEmail'] = contact_email unless contact_email.nil?
          command.query['contactName'] = contact_name unless contact_name.nil?
          command.query['country'] = country unless country.nil?
          command.query['language'] = language unless language.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets the POS data provider for the specified country.
        # @param [Fixnum] merchant_id
        #   The ID of the managing account. If this parameter is not the same as accountId,
        #   then this account must be a multi-client account and accountId must be the ID
        #   of a sub-account of this account.
        # @param [Fixnum] account_id
        #   The ID of the account for which to retrieve accessible Google My Business
        #   accounts.
        # @param [String] country
        #   The country for which the POS data provider is selected.
        # @param [Fixnum] pos_data_provider_id
        #   The ID of POS data provider.
        # @param [String] pos_external_account_id
        #   The account ID by which this merchant is known to the POS data provider.
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
        # @yieldparam result [Google::Apis::ContentV2_1::LiasettingsSetPosDataProviderResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::LiasettingsSetPosDataProviderResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def setposdataprovider_liasetting(merchant_id, account_id, country, pos_data_provider_id: nil, pos_external_account_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/liasettings/{accountId}/setposdataprovider', options)
          command.response_representation = Google::Apis::ContentV2_1::LiasettingsSetPosDataProviderResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::LiasettingsSetPosDataProviderResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['country'] = country unless country.nil?
          command.query['posDataProviderId'] = pos_data_provider_id unless pos_data_provider_id.nil?
          command.query['posExternalAccountId'] = pos_external_account_id unless pos_external_account_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the LIA settings of the account.
        # @param [Fixnum] merchant_id
        #   The ID of the managing account. If this parameter is not the same as accountId,
        #   then this account must be a multi-client account and accountId must be the ID
        #   of a sub-account of this account.
        # @param [Fixnum] account_id
        #   The ID of the account for which to get or update LIA settings.
        # @param [Google::Apis::ContentV2_1::LiaSettings] lia_settings_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::LiaSettings] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::LiaSettings]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_liasetting(merchant_id, account_id, lia_settings_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, '{merchantId}/liasettings/{accountId}', options)
          command.request_representation = Google::Apis::ContentV2_1::LiaSettings::Representation
          command.request_object = lia_settings_object
          command.response_representation = Google::Apis::ContentV2_1::LiaSettings::Representation
          command.response_class = Google::Apis::ContentV2_1::LiaSettings
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a charge invoice for a shipment group, and triggers a charge capture
        # for orderinvoice enabled orders.
        # @param [Fixnum] merchant_id
        #   The ID of the account that manages the order. This cannot be a multi-client
        #   account.
        # @param [String] order_id
        #   The ID of the order.
        # @param [Google::Apis::ContentV2_1::OrderinvoicesCreateChargeInvoiceRequest] orderinvoices_create_charge_invoice_request_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::OrderinvoicesCreateChargeInvoiceResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::OrderinvoicesCreateChargeInvoiceResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def createchargeinvoice_orderinvoice(merchant_id, order_id, orderinvoices_create_charge_invoice_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/orderinvoices/{orderId}/createChargeInvoice', options)
          command.request_representation = Google::Apis::ContentV2_1::OrderinvoicesCreateChargeInvoiceRequest::Representation
          command.request_object = orderinvoices_create_charge_invoice_request_object
          command.response_representation = Google::Apis::ContentV2_1::OrderinvoicesCreateChargeInvoiceResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::OrderinvoicesCreateChargeInvoiceResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['orderId'] = order_id unless order_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a refund invoice for one or more shipment groups, and triggers a
        # refund for orderinvoice enabled orders. This can only be used for line items
        # that have previously been charged using createChargeInvoice. All amounts (
        # except for the summary) are incremental with respect to the previous invoice.
        # @param [Fixnum] merchant_id
        #   The ID of the account that manages the order. This cannot be a multi-client
        #   account.
        # @param [String] order_id
        #   The ID of the order.
        # @param [Google::Apis::ContentV2_1::OrderinvoicesCreateRefundInvoiceRequest] orderinvoices_create_refund_invoice_request_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::OrderinvoicesCreateRefundInvoiceResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::OrderinvoicesCreateRefundInvoiceResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def createrefundinvoice_orderinvoice(merchant_id, order_id, orderinvoices_create_refund_invoice_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/orderinvoices/{orderId}/createRefundInvoice', options)
          command.request_representation = Google::Apis::ContentV2_1::OrderinvoicesCreateRefundInvoiceRequest::Representation
          command.request_object = orderinvoices_create_refund_invoice_request_object
          command.response_representation = Google::Apis::ContentV2_1::OrderinvoicesCreateRefundInvoiceResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::OrderinvoicesCreateRefundInvoiceResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['orderId'] = order_id unless order_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a report for disbursements from your Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The ID of the account that manages the order. This cannot be a multi-client
        #   account.
        # @param [String] disbursement_start_date
        #   The first date which disbursements occurred. In ISO 8601 format.
        # @param [String] disbursement_end_date
        #   The last date which disbursements occurred. In ISO 8601 format. Default:
        #   current date.
        # @param [Fixnum] max_results
        #   The maximum number of disbursements to return in the response, used for paging.
        # @param [String] page_token
        #   The token returned by the previous request.
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
        # @yieldparam result [Google::Apis::ContentV2_1::OrderreportsListDisbursementsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::OrderreportsListDisbursementsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def listdisbursements_orderreport(merchant_id, disbursement_start_date, disbursement_end_date: nil, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/orderreports/disbursements', options)
          command.response_representation = Google::Apis::ContentV2_1::OrderreportsListDisbursementsResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::OrderreportsListDisbursementsResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.query['disbursementEndDate'] = disbursement_end_date unless disbursement_end_date.nil?
          command.query['disbursementStartDate'] = disbursement_start_date unless disbursement_start_date.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of transactions for a disbursement from your Merchant Center
        # account.
        # @param [Fixnum] merchant_id
        #   The ID of the account that manages the order. This cannot be a multi-client
        #   account.
        # @param [String] disbursement_id
        #   The Google-provided ID of the disbursement (found in Wallet).
        # @param [String] transaction_start_date
        #   The first date in which transaction occurred. In ISO 8601 format.
        # @param [Fixnum] max_results
        #   The maximum number of disbursements to return in the response, used for paging.
        # @param [String] page_token
        #   The token returned by the previous request.
        # @param [String] transaction_end_date
        #   The last date in which transaction occurred. In ISO 8601 format. Default:
        #   current date.
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
        # @yieldparam result [Google::Apis::ContentV2_1::OrderreportsListTransactionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::OrderreportsListTransactionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def listtransactions_orderreport(merchant_id, disbursement_id, transaction_start_date, max_results: nil, page_token: nil, transaction_end_date: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/orderreports/disbursements/{disbursementId}/transactions', options)
          command.response_representation = Google::Apis::ContentV2_1::OrderreportsListTransactionsResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::OrderreportsListTransactionsResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['disbursementId'] = disbursement_id unless disbursement_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['transactionEndDate'] = transaction_end_date unless transaction_end_date.nil?
          command.query['transactionStartDate'] = transaction_start_date unless transaction_start_date.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves an order return from your Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The ID of the account that manages the order. This cannot be a multi-client
        #   account.
        # @param [String] return_id
        #   Merchant order return ID generated by Google.
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
        # @yieldparam result [Google::Apis::ContentV2_1::MerchantOrderReturn] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::MerchantOrderReturn]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_orderreturn(merchant_id, return_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/orderreturns/{returnId}', options)
          command.response_representation = Google::Apis::ContentV2_1::MerchantOrderReturn::Representation
          command.response_class = Google::Apis::ContentV2_1::MerchantOrderReturn
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['returnId'] = return_id unless return_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists order returns in your Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The ID of the account that manages the order. This cannot be a multi-client
        #   account.
        # @param [String] created_end_date
        #   Obtains order returns created before this date (inclusively), in ISO 8601
        #   format.
        # @param [String] created_start_date
        #   Obtains order returns created after this date (inclusively), in ISO 8601
        #   format.
        # @param [Fixnum] max_results
        #   The maximum number of order returns to return in the response, used for paging.
        #   The default value is 25 returns per page, and the maximum allowed value is
        #   250 returns per page.
        # @param [String] order_by
        #   Return the results in the specified order.
        # @param [String] page_token
        #   The token returned by the previous request.
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
        # @yieldparam result [Google::Apis::ContentV2_1::OrderreturnsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::OrderreturnsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_orderreturns(merchant_id, created_end_date: nil, created_start_date: nil, max_results: nil, order_by: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/orderreturns', options)
          command.response_representation = Google::Apis::ContentV2_1::OrderreturnsListResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::OrderreturnsListResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.query['createdEndDate'] = created_end_date unless created_end_date.nil?
          command.query['createdStartDate'] = created_start_date unless created_start_date.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Marks an order as acknowledged.
        # @param [Fixnum] merchant_id
        #   The ID of the account that manages the order. This cannot be a multi-client
        #   account.
        # @param [String] order_id
        #   The ID of the order.
        # @param [Google::Apis::ContentV2_1::OrdersAcknowledgeRequest] orders_acknowledge_request_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::OrdersAcknowledgeResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::OrdersAcknowledgeResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def acknowledge_order(merchant_id, order_id, orders_acknowledge_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/orders/{orderId}/acknowledge', options)
          command.request_representation = Google::Apis::ContentV2_1::OrdersAcknowledgeRequest::Representation
          command.request_object = orders_acknowledge_request_object
          command.response_representation = Google::Apis::ContentV2_1::OrdersAcknowledgeResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::OrdersAcknowledgeResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['orderId'] = order_id unless order_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sandbox only. Moves a test order from state "inProgress" to state "
        # pendingShipment".
        # @param [Fixnum] merchant_id
        #   The ID of the account that manages the order. This cannot be a multi-client
        #   account.
        # @param [String] order_id
        #   The ID of the test order to modify.
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
        # @yieldparam result [Google::Apis::ContentV2_1::OrdersAdvanceTestOrderResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::OrdersAdvanceTestOrderResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def advancetestorder_order(merchant_id, order_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/testorders/{orderId}/advance', options)
          command.response_representation = Google::Apis::ContentV2_1::OrdersAdvanceTestOrderResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::OrdersAdvanceTestOrderResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['orderId'] = order_id unless order_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Cancels all line items in an order, making a full refund.
        # @param [Fixnum] merchant_id
        #   The ID of the account that manages the order. This cannot be a multi-client
        #   account.
        # @param [String] order_id
        #   The ID of the order to cancel.
        # @param [Google::Apis::ContentV2_1::OrdersCancelRequest] orders_cancel_request_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::OrdersCancelResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::OrdersCancelResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def cancel_order(merchant_id, order_id, orders_cancel_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/orders/{orderId}/cancel', options)
          command.request_representation = Google::Apis::ContentV2_1::OrdersCancelRequest::Representation
          command.request_object = orders_cancel_request_object
          command.response_representation = Google::Apis::ContentV2_1::OrdersCancelResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::OrdersCancelResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['orderId'] = order_id unless order_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Cancels a line item, making a full refund.
        # @param [Fixnum] merchant_id
        #   The ID of the account that manages the order. This cannot be a multi-client
        #   account.
        # @param [String] order_id
        #   The ID of the order.
        # @param [Google::Apis::ContentV2_1::OrdersCancelLineItemRequest] orders_cancel_line_item_request_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::OrdersCancelLineItemResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::OrdersCancelLineItemResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def cancellineitem_order(merchant_id, order_id, orders_cancel_line_item_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/orders/{orderId}/cancelLineItem', options)
          command.request_representation = Google::Apis::ContentV2_1::OrdersCancelLineItemRequest::Representation
          command.request_object = orders_cancel_line_item_request_object
          command.response_representation = Google::Apis::ContentV2_1::OrdersCancelLineItemResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::OrdersCancelLineItemResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['orderId'] = order_id unless order_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sandbox only. Cancels a test order for customer-initiated cancellation.
        # @param [Fixnum] merchant_id
        #   The ID of the account that manages the order. This cannot be a multi-client
        #   account.
        # @param [String] order_id
        #   The ID of the test order to cancel.
        # @param [Google::Apis::ContentV2_1::OrdersCancelTestOrderByCustomerRequest] orders_cancel_test_order_by_customer_request_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::OrdersCancelTestOrderByCustomerResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::OrdersCancelTestOrderByCustomerResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def canceltestorderbycustomer_order(merchant_id, order_id, orders_cancel_test_order_by_customer_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/testorders/{orderId}/cancelByCustomer', options)
          command.request_representation = Google::Apis::ContentV2_1::OrdersCancelTestOrderByCustomerRequest::Representation
          command.request_object = orders_cancel_test_order_by_customer_request_object
          command.response_representation = Google::Apis::ContentV2_1::OrdersCancelTestOrderByCustomerResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::OrdersCancelTestOrderByCustomerResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['orderId'] = order_id unless order_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sandbox only. Creates a test order.
        # @param [Fixnum] merchant_id
        #   The ID of the account that should manage the order. This cannot be a multi-
        #   client account.
        # @param [Google::Apis::ContentV2_1::OrdersCreateTestOrderRequest] orders_create_test_order_request_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::OrdersCreateTestOrderResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::OrdersCreateTestOrderResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def createtestorder_order(merchant_id, orders_create_test_order_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/testorders', options)
          command.request_representation = Google::Apis::ContentV2_1::OrdersCreateTestOrderRequest::Representation
          command.request_object = orders_create_test_order_request_object
          command.response_representation = Google::Apis::ContentV2_1::OrdersCreateTestOrderResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::OrdersCreateTestOrderResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sandbox only. Creates a test return.
        # @param [Fixnum] merchant_id
        #   The ID of the account that manages the order. This cannot be a multi-client
        #   account.
        # @param [String] order_id
        #   The ID of the order.
        # @param [Google::Apis::ContentV2_1::OrdersCreateTestReturnRequest] orders_create_test_return_request_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::OrdersCreateTestReturnResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::OrdersCreateTestReturnResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def createtestreturn_order(merchant_id, order_id, orders_create_test_return_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/orders/{orderId}/testreturn', options)
          command.request_representation = Google::Apis::ContentV2_1::OrdersCreateTestReturnRequest::Representation
          command.request_object = orders_create_test_return_request_object
          command.response_representation = Google::Apis::ContentV2_1::OrdersCreateTestReturnResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::OrdersCreateTestReturnResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['orderId'] = order_id unless order_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves an order from your Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The ID of the account that manages the order. This cannot be a multi-client
        #   account.
        # @param [String] order_id
        #   The ID of the order.
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
        # @yieldparam result [Google::Apis::ContentV2_1::Order] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::Order]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_order(merchant_id, order_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/orders/{orderId}', options)
          command.response_representation = Google::Apis::ContentV2_1::Order::Representation
          command.response_class = Google::Apis::ContentV2_1::Order
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['orderId'] = order_id unless order_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves an order using merchant order ID.
        # @param [Fixnum] merchant_id
        #   The ID of the account that manages the order. This cannot be a multi-client
        #   account.
        # @param [String] merchant_order_id
        #   The merchant order ID to be looked for.
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
        # @yieldparam result [Google::Apis::ContentV2_1::OrdersGetByMerchantOrderIdResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::OrdersGetByMerchantOrderIdResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def getbymerchantorderid_order(merchant_id, merchant_order_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/ordersbymerchantid/{merchantOrderId}', options)
          command.response_representation = Google::Apis::ContentV2_1::OrdersGetByMerchantOrderIdResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::OrdersGetByMerchantOrderIdResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['merchantOrderId'] = merchant_order_id unless merchant_order_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sandbox only. Retrieves an order template that can be used to quickly create a
        # new order in sandbox.
        # @param [Fixnum] merchant_id
        #   The ID of the account that should manage the order. This cannot be a multi-
        #   client account.
        # @param [String] template_name
        #   The name of the template to retrieve.
        # @param [String] country
        #   The country of the template to retrieve. Defaults to US.
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
        # @yieldparam result [Google::Apis::ContentV2_1::OrdersGetTestOrderTemplateResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::OrdersGetTestOrderTemplateResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def gettestordertemplate_order(merchant_id, template_name, country: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/testordertemplates/{templateName}', options)
          command.response_representation = Google::Apis::ContentV2_1::OrdersGetTestOrderTemplateResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::OrdersGetTestOrderTemplateResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['templateName'] = template_name unless template_name.nil?
          command.query['country'] = country unless country.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deprecated. Notifies that item return and refund was handled directly by
        # merchant outside of Google payments processing (e.g. cash refund done in store)
        # .
        # Note: We recommend calling the returnrefundlineitem method to refund in-store
        # returns. We will issue the refund directly to the customer. This helps to
        # prevent possible differences arising between merchant and Google transaction
        # records. We also recommend having the point of sale system communicate with
        # Google to ensure that customers do not receive a double refund by first
        # refunding via Google then via an in-store return.
        # @param [Fixnum] merchant_id
        #   The ID of the account that manages the order. This cannot be a multi-client
        #   account.
        # @param [String] order_id
        #   The ID of the order.
        # @param [Google::Apis::ContentV2_1::OrdersInStoreRefundLineItemRequest] orders_in_store_refund_line_item_request_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::OrdersInStoreRefundLineItemResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::OrdersInStoreRefundLineItemResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def instorerefundlineitem_order(merchant_id, order_id, orders_in_store_refund_line_item_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/orders/{orderId}/inStoreRefundLineItem', options)
          command.request_representation = Google::Apis::ContentV2_1::OrdersInStoreRefundLineItemRequest::Representation
          command.request_object = orders_in_store_refund_line_item_request_object
          command.response_representation = Google::Apis::ContentV2_1::OrdersInStoreRefundLineItemResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::OrdersInStoreRefundLineItemResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['orderId'] = order_id unless order_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the orders in your Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The ID of the account that manages the order. This cannot be a multi-client
        #   account.
        # @param [Boolean] acknowledged
        #   Obtains orders that match the acknowledgement status. When set to true,
        #   obtains orders that have been acknowledged. When false, obtains orders that
        #   have not been acknowledged.
        #   We recommend using this filter set to false, in conjunction with the
        #   acknowledge call, such that only un-acknowledged orders are returned.
        # @param [Fixnum] max_results
        #   The maximum number of orders to return in the response, used for paging. The
        #   default value is 25 orders per page, and the maximum allowed value is 250
        #   orders per page.
        # @param [String] order_by
        #   Order results by placement date in descending or ascending order.
        #   Acceptable values are:
        #   - placedDateAsc
        #   - placedDateDesc
        # @param [String] page_token
        #   The token returned by the previous request.
        # @param [String] placed_date_end
        #   Obtains orders placed before this date (exclusively), in ISO 8601 format.
        # @param [String] placed_date_start
        #   Obtains orders placed after this date (inclusively), in ISO 8601 format.
        # @param [Array<String>, String] statuses
        #   Obtains orders that match any of the specified statuses. Please note that
        #   active is a shortcut for pendingShipment and partiallyShipped, and completed
        #   is a shortcut for shipped, partiallyDelivered, delivered, partiallyReturned,
        #   returned, and canceled.
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
        # @yieldparam result [Google::Apis::ContentV2_1::OrdersListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::OrdersListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_orders(merchant_id, acknowledged: nil, max_results: nil, order_by: nil, page_token: nil, placed_date_end: nil, placed_date_start: nil, statuses: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/orders', options)
          command.response_representation = Google::Apis::ContentV2_1::OrdersListResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::OrdersListResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.query['acknowledged'] = acknowledged unless acknowledged.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['placedDateEnd'] = placed_date_end unless placed_date_end.nil?
          command.query['placedDateStart'] = placed_date_start unless placed_date_start.nil?
          command.query['statuses'] = statuses unless statuses.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rejects return on an line item.
        # @param [Fixnum] merchant_id
        #   The ID of the account that manages the order. This cannot be a multi-client
        #   account.
        # @param [String] order_id
        #   The ID of the order.
        # @param [Google::Apis::ContentV2_1::OrdersRejectReturnLineItemRequest] orders_reject_return_line_item_request_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::OrdersRejectReturnLineItemResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::OrdersRejectReturnLineItemResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def rejectreturnlineitem_order(merchant_id, order_id, orders_reject_return_line_item_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/orders/{orderId}/rejectReturnLineItem', options)
          command.request_representation = Google::Apis::ContentV2_1::OrdersRejectReturnLineItemRequest::Representation
          command.request_object = orders_reject_return_line_item_request_object
          command.response_representation = Google::Apis::ContentV2_1::OrdersRejectReturnLineItemResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::OrdersRejectReturnLineItemResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['orderId'] = order_id unless order_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns and refunds a line item. Note that this method can only be called on
        # fully shipped orders.
        # @param [Fixnum] merchant_id
        #   The ID of the account that manages the order. This cannot be a multi-client
        #   account.
        # @param [String] order_id
        #   The ID of the order.
        # @param [Google::Apis::ContentV2_1::OrdersReturnRefundLineItemRequest] orders_return_refund_line_item_request_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::OrdersReturnRefundLineItemResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::OrdersReturnRefundLineItemResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def returnrefundlineitem_order(merchant_id, order_id, orders_return_refund_line_item_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/orders/{orderId}/returnRefundLineItem', options)
          command.request_representation = Google::Apis::ContentV2_1::OrdersReturnRefundLineItemRequest::Representation
          command.request_object = orders_return_refund_line_item_request_object
          command.response_representation = Google::Apis::ContentV2_1::OrdersReturnRefundLineItemResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::OrdersReturnRefundLineItemResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['orderId'] = order_id unless order_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets (or overrides if it already exists) merchant provided annotations in the
        # form of key-value pairs. A common use case would be to supply us with
        # additional structured information about a line item that cannot be provided
        # via other methods. Submitted key-value pairs can be retrieved as part of the
        # orders resource.
        # @param [Fixnum] merchant_id
        #   The ID of the account that manages the order. This cannot be a multi-client
        #   account.
        # @param [String] order_id
        #   The ID of the order.
        # @param [Google::Apis::ContentV2_1::OrdersSetLineItemMetadataRequest] orders_set_line_item_metadata_request_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::OrdersSetLineItemMetadataResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::OrdersSetLineItemMetadataResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def setlineitemmetadata_order(merchant_id, order_id, orders_set_line_item_metadata_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/orders/{orderId}/setLineItemMetadata', options)
          command.request_representation = Google::Apis::ContentV2_1::OrdersSetLineItemMetadataRequest::Representation
          command.request_object = orders_set_line_item_metadata_request_object
          command.response_representation = Google::Apis::ContentV2_1::OrdersSetLineItemMetadataResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::OrdersSetLineItemMetadataResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['orderId'] = order_id unless order_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Marks line item(s) as shipped.
        # @param [Fixnum] merchant_id
        #   The ID of the account that manages the order. This cannot be a multi-client
        #   account.
        # @param [String] order_id
        #   The ID of the order.
        # @param [Google::Apis::ContentV2_1::OrdersShipLineItemsRequest] orders_ship_line_items_request_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::OrdersShipLineItemsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::OrdersShipLineItemsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def shiplineitems_order(merchant_id, order_id, orders_ship_line_items_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/orders/{orderId}/shipLineItems', options)
          command.request_representation = Google::Apis::ContentV2_1::OrdersShipLineItemsRequest::Representation
          command.request_object = orders_ship_line_items_request_object
          command.response_representation = Google::Apis::ContentV2_1::OrdersShipLineItemsResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::OrdersShipLineItemsResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['orderId'] = order_id unless order_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates ship by and delivery by dates for a line item.
        # @param [Fixnum] merchant_id
        #   The ID of the account that manages the order. This cannot be a multi-client
        #   account.
        # @param [String] order_id
        #   The ID of the order.
        # @param [Google::Apis::ContentV2_1::OrdersUpdateLineItemShippingDetailsRequest] orders_update_line_item_shipping_details_request_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::OrdersUpdateLineItemShippingDetailsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::OrdersUpdateLineItemShippingDetailsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def updatelineitemshippingdetails_order(merchant_id, order_id, orders_update_line_item_shipping_details_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/orders/{orderId}/updateLineItemShippingDetails', options)
          command.request_representation = Google::Apis::ContentV2_1::OrdersUpdateLineItemShippingDetailsRequest::Representation
          command.request_object = orders_update_line_item_shipping_details_request_object
          command.response_representation = Google::Apis::ContentV2_1::OrdersUpdateLineItemShippingDetailsResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::OrdersUpdateLineItemShippingDetailsResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['orderId'] = order_id unless order_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the merchant order ID for a given order.
        # @param [Fixnum] merchant_id
        #   The ID of the account that manages the order. This cannot be a multi-client
        #   account.
        # @param [String] order_id
        #   The ID of the order.
        # @param [Google::Apis::ContentV2_1::OrdersUpdateMerchantOrderIdRequest] orders_update_merchant_order_id_request_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::OrdersUpdateMerchantOrderIdResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::OrdersUpdateMerchantOrderIdResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def updatemerchantorderid_order(merchant_id, order_id, orders_update_merchant_order_id_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/orders/{orderId}/updateMerchantOrderId', options)
          command.request_representation = Google::Apis::ContentV2_1::OrdersUpdateMerchantOrderIdRequest::Representation
          command.request_object = orders_update_merchant_order_id_request_object
          command.response_representation = Google::Apis::ContentV2_1::OrdersUpdateMerchantOrderIdResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::OrdersUpdateMerchantOrderIdResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['orderId'] = order_id unless order_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a shipment's status, carrier, and/or tracking ID.
        # @param [Fixnum] merchant_id
        #   The ID of the account that manages the order. This cannot be a multi-client
        #   account.
        # @param [String] order_id
        #   The ID of the order.
        # @param [Google::Apis::ContentV2_1::OrdersUpdateShipmentRequest] orders_update_shipment_request_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::OrdersUpdateShipmentResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::OrdersUpdateShipmentResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def updateshipment_order(merchant_id, order_id, orders_update_shipment_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/orders/{orderId}/updateShipment', options)
          command.request_representation = Google::Apis::ContentV2_1::OrdersUpdateShipmentRequest::Representation
          command.request_object = orders_update_shipment_request_object
          command.response_representation = Google::Apis::ContentV2_1::OrdersUpdateShipmentResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::OrdersUpdateShipmentResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['orderId'] = order_id unless order_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Batches multiple POS-related calls in a single request.
        # @param [Google::Apis::ContentV2_1::PosCustomBatchRequest] pos_custom_batch_request_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::PosCustomBatchResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::PosCustomBatchResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def custombatch_po(pos_custom_batch_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'pos/batch', options)
          command.request_representation = Google::Apis::ContentV2_1::PosCustomBatchRequest::Representation
          command.request_object = pos_custom_batch_request_object
          command.response_representation = Google::Apis::ContentV2_1::PosCustomBatchResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::PosCustomBatchResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a store for the given merchant.
        # @param [Fixnum] merchant_id
        #   The ID of the POS or inventory data provider.
        # @param [Fixnum] target_merchant_id
        #   The ID of the target merchant.
        # @param [String] store_code
        #   A store code that is unique per merchant.
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
        def delete_po(merchant_id, target_merchant_id, store_code, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, '{merchantId}/pos/{targetMerchantId}/store/{storeCode}', options)
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['targetMerchantId'] = target_merchant_id unless target_merchant_id.nil?
          command.params['storeCode'] = store_code unless store_code.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves information about the given store.
        # @param [Fixnum] merchant_id
        #   The ID of the POS or inventory data provider.
        # @param [Fixnum] target_merchant_id
        #   The ID of the target merchant.
        # @param [String] store_code
        #   A store code that is unique per merchant.
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
        # @yieldparam result [Google::Apis::ContentV2_1::PosStore] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::PosStore]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_po(merchant_id, target_merchant_id, store_code, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/pos/{targetMerchantId}/store/{storeCode}', options)
          command.response_representation = Google::Apis::ContentV2_1::PosStore::Representation
          command.response_class = Google::Apis::ContentV2_1::PosStore
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['targetMerchantId'] = target_merchant_id unless target_merchant_id.nil?
          command.params['storeCode'] = store_code unless store_code.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a store for the given merchant.
        # @param [Fixnum] merchant_id
        #   The ID of the POS or inventory data provider.
        # @param [Fixnum] target_merchant_id
        #   The ID of the target merchant.
        # @param [Google::Apis::ContentV2_1::PosStore] pos_store_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::PosStore] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::PosStore]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_po(merchant_id, target_merchant_id, pos_store_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/pos/{targetMerchantId}/store', options)
          command.request_representation = Google::Apis::ContentV2_1::PosStore::Representation
          command.request_object = pos_store_object
          command.response_representation = Google::Apis::ContentV2_1::PosStore::Representation
          command.response_class = Google::Apis::ContentV2_1::PosStore
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['targetMerchantId'] = target_merchant_id unless target_merchant_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Submit inventory for the given merchant.
        # @param [Fixnum] merchant_id
        #   The ID of the POS or inventory data provider.
        # @param [Fixnum] target_merchant_id
        #   The ID of the target merchant.
        # @param [Google::Apis::ContentV2_1::PosInventoryRequest] pos_inventory_request_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::PosInventoryResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::PosInventoryResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def inventory_po(merchant_id, target_merchant_id, pos_inventory_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/pos/{targetMerchantId}/inventory', options)
          command.request_representation = Google::Apis::ContentV2_1::PosInventoryRequest::Representation
          command.request_object = pos_inventory_request_object
          command.response_representation = Google::Apis::ContentV2_1::PosInventoryResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::PosInventoryResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['targetMerchantId'] = target_merchant_id unless target_merchant_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the stores of the target merchant.
        # @param [Fixnum] merchant_id
        #   The ID of the POS or inventory data provider.
        # @param [Fixnum] target_merchant_id
        #   The ID of the target merchant.
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
        # @yieldparam result [Google::Apis::ContentV2_1::PosListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::PosListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_pos(merchant_id, target_merchant_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/pos/{targetMerchantId}/store', options)
          command.response_representation = Google::Apis::ContentV2_1::PosListResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::PosListResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['targetMerchantId'] = target_merchant_id unless target_merchant_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Submit a sale event for the given merchant.
        # @param [Fixnum] merchant_id
        #   The ID of the POS or inventory data provider.
        # @param [Fixnum] target_merchant_id
        #   The ID of the target merchant.
        # @param [Google::Apis::ContentV2_1::PosSaleRequest] pos_sale_request_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::PosSaleResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::PosSaleResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def sale_po(merchant_id, target_merchant_id, pos_sale_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/pos/{targetMerchantId}/sale', options)
          command.request_representation = Google::Apis::ContentV2_1::PosSaleRequest::Representation
          command.request_object = pos_sale_request_object
          command.response_representation = Google::Apis::ContentV2_1::PosSaleResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::PosSaleResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['targetMerchantId'] = target_merchant_id unless target_merchant_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves, inserts, and deletes multiple products in a single request.
        # @param [Google::Apis::ContentV2_1::ProductsCustomBatchRequest] products_custom_batch_request_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::ProductsCustomBatchResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::ProductsCustomBatchResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def custombatch_product(products_custom_batch_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'products/batch', options)
          command.request_representation = Google::Apis::ContentV2_1::ProductsCustomBatchRequest::Representation
          command.request_object = products_custom_batch_request_object
          command.response_representation = Google::Apis::ContentV2_1::ProductsCustomBatchResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::ProductsCustomBatchResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a product from your Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The ID of the account that contains the product. This account cannot be a
        #   multi-client account.
        # @param [String] product_id
        #   The REST ID of the product.
        # @param [Fixnum] feed_id
        #   The Content API Supplemental Feed ID.
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
        def delete_product(merchant_id, product_id, feed_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, '{merchantId}/products/{productId}', options)
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['productId'] = product_id unless product_id.nil?
          command.query['feedId'] = feed_id unless feed_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a product from your Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The ID of the account that contains the product. This account cannot be a
        #   multi-client account.
        # @param [String] product_id
        #   The REST ID of the product.
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
        # @yieldparam result [Google::Apis::ContentV2_1::Product] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::Product]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_product(merchant_id, product_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/products/{productId}', options)
          command.response_representation = Google::Apis::ContentV2_1::Product::Representation
          command.response_class = Google::Apis::ContentV2_1::Product
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['productId'] = product_id unless product_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Uploads a product to your Merchant Center account. If an item with the same
        # channel, contentLanguage, offerId, and targetCountry already exists, this
        # method updates that entry.
        # @param [Fixnum] merchant_id
        #   The ID of the account that contains the product. This account cannot be a
        #   multi-client account.
        # @param [Google::Apis::ContentV2_1::Product] product_object
        # @param [Fixnum] feed_id
        #   The Content API Supplemental Feed ID.
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
        # @yieldparam result [Google::Apis::ContentV2_1::Product] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::Product]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_product(merchant_id, product_object = nil, feed_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/products', options)
          command.request_representation = Google::Apis::ContentV2_1::Product::Representation
          command.request_object = product_object
          command.response_representation = Google::Apis::ContentV2_1::Product::Representation
          command.response_class = Google::Apis::ContentV2_1::Product
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.query['feedId'] = feed_id unless feed_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the products in your Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The ID of the account that contains the products. This account cannot be a
        #   multi-client account.
        # @param [Fixnum] max_results
        #   The maximum number of products to return in the response, used for paging.
        # @param [String] page_token
        #   The token returned by the previous request.
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
        # @yieldparam result [Google::Apis::ContentV2_1::ProductsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::ProductsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_products(merchant_id, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/products', options)
          command.response_representation = Google::Apis::ContentV2_1::ProductsListResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::ProductsListResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the statuses of multiple products in a single request.
        # @param [Google::Apis::ContentV2_1::ProductstatusesCustomBatchRequest] productstatuses_custom_batch_request_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::ProductstatusesCustomBatchResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::ProductstatusesCustomBatchResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def custombatch_productstatus(productstatuses_custom_batch_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'productstatuses/batch', options)
          command.request_representation = Google::Apis::ContentV2_1::ProductstatusesCustomBatchRequest::Representation
          command.request_object = productstatuses_custom_batch_request_object
          command.response_representation = Google::Apis::ContentV2_1::ProductstatusesCustomBatchResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::ProductstatusesCustomBatchResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the status of a product from your Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The ID of the account that contains the product. This account cannot be a
        #   multi-client account.
        # @param [String] product_id
        #   The REST ID of the product.
        # @param [Array<String>, String] destinations
        #   If set, only issues for the specified destinations are returned, otherwise
        #   only issues for the Shopping destination.
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
        # @yieldparam result [Google::Apis::ContentV2_1::ProductStatus] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::ProductStatus]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_productstatus(merchant_id, product_id, destinations: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/productstatuses/{productId}', options)
          command.response_representation = Google::Apis::ContentV2_1::ProductStatus::Representation
          command.response_class = Google::Apis::ContentV2_1::ProductStatus
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['productId'] = product_id unless product_id.nil?
          command.query['destinations'] = destinations unless destinations.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the statuses of the products in your Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The ID of the account that contains the products. This account cannot be a
        #   multi-client account.
        # @param [Array<String>, String] destinations
        #   If set, only issues for the specified destinations are returned, otherwise
        #   only issues for the Shopping destination.
        # @param [Fixnum] max_results
        #   The maximum number of product statuses to return in the response, used for
        #   paging.
        # @param [String] page_token
        #   The token returned by the previous request.
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
        # @yieldparam result [Google::Apis::ContentV2_1::ProductstatusesListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::ProductstatusesListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_productstatuses(merchant_id, destinations: nil, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/productstatuses', options)
          command.response_representation = Google::Apis::ContentV2_1::ProductstatusesListResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::ProductstatusesListResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.query['destinations'] = destinations unless destinations.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates regional inventory for multiple products or regions in a single
        # request.
        # @param [Google::Apis::ContentV2_1::RegionalinventoryCustomBatchRequest] regionalinventory_custom_batch_request_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::RegionalinventoryCustomBatchResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::RegionalinventoryCustomBatchResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def custombatch_regionalinventory(regionalinventory_custom_batch_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'regionalinventory/batch', options)
          command.request_representation = Google::Apis::ContentV2_1::RegionalinventoryCustomBatchRequest::Representation
          command.request_object = regionalinventory_custom_batch_request_object
          command.response_representation = Google::Apis::ContentV2_1::RegionalinventoryCustomBatchResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::RegionalinventoryCustomBatchResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update the regional inventory of a product in your Merchant Center account. If
        # a regional inventory with the same region ID already exists, this method
        # updates that entry.
        # @param [Fixnum] merchant_id
        #   The ID of the account that contains the product. This account cannot be a
        #   multi-client account.
        # @param [String] product_id
        #   The REST ID of the product for which to update the regional inventory.
        # @param [Google::Apis::ContentV2_1::RegionalInventory] regional_inventory_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::RegionalInventory] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::RegionalInventory]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_regionalinventory(merchant_id, product_id, regional_inventory_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/products/{productId}/regionalinventory', options)
          command.request_representation = Google::Apis::ContentV2_1::RegionalInventory::Representation
          command.request_object = regional_inventory_object
          command.response_representation = Google::Apis::ContentV2_1::RegionalInventory::Representation
          command.response_class = Google::Apis::ContentV2_1::RegionalInventory
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['productId'] = product_id unless product_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Batches multiple return address related calls in a single request.
        # @param [Google::Apis::ContentV2_1::ReturnaddressCustomBatchRequest] returnaddress_custom_batch_request_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::ReturnaddressCustomBatchResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::ReturnaddressCustomBatchResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def custombatch_returnaddress(returnaddress_custom_batch_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'returnaddress/batch', options)
          command.request_representation = Google::Apis::ContentV2_1::ReturnaddressCustomBatchRequest::Representation
          command.request_object = returnaddress_custom_batch_request_object
          command.response_representation = Google::Apis::ContentV2_1::ReturnaddressCustomBatchResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::ReturnaddressCustomBatchResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a return address for the given Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The Merchant Center account from which to delete the given return address.
        # @param [String] return_address_id
        #   Return address ID generated by Google.
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
        def delete_returnaddress(merchant_id, return_address_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, '{merchantId}/returnaddress/{returnAddressId}', options)
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['returnAddressId'] = return_address_id unless return_address_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a return address of the Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The Merchant Center account to get a return address for.
        # @param [String] return_address_id
        #   Return address ID generated by Google.
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
        # @yieldparam result [Google::Apis::ContentV2_1::ReturnAddress] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::ReturnAddress]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_returnaddress(merchant_id, return_address_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/returnaddress/{returnAddressId}', options)
          command.response_representation = Google::Apis::ContentV2_1::ReturnAddress::Representation
          command.response_class = Google::Apis::ContentV2_1::ReturnAddress
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['returnAddressId'] = return_address_id unless return_address_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a return address for the Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The Merchant Center account to insert a return address for.
        # @param [Google::Apis::ContentV2_1::ReturnAddress] return_address_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::ReturnAddress] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::ReturnAddress]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_returnaddress(merchant_id, return_address_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/returnaddress', options)
          command.request_representation = Google::Apis::ContentV2_1::ReturnAddress::Representation
          command.request_object = return_address_object
          command.response_representation = Google::Apis::ContentV2_1::ReturnAddress::Representation
          command.response_class = Google::Apis::ContentV2_1::ReturnAddress
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the return addresses of the Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The Merchant Center account to list return addresses for.
        # @param [String] country
        #   List only return addresses applicable to the given country of sale. When
        #   omitted, all return addresses are listed.
        # @param [Fixnum] max_results
        #   The maximum number of addresses in the response, used for paging.
        # @param [String] page_token
        #   The token returned by the previous request.
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
        # @yieldparam result [Google::Apis::ContentV2_1::ReturnaddressListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::ReturnaddressListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_returnaddresses(merchant_id, country: nil, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/returnaddress', options)
          command.response_representation = Google::Apis::ContentV2_1::ReturnaddressListResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::ReturnaddressListResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.query['country'] = country unless country.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Batches multiple return policy related calls in a single request.
        # @param [Google::Apis::ContentV2_1::ReturnpolicyCustomBatchRequest] returnpolicy_custom_batch_request_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::ReturnpolicyCustomBatchResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::ReturnpolicyCustomBatchResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def custombatch_returnpolicy(returnpolicy_custom_batch_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'returnpolicy/batch', options)
          command.request_representation = Google::Apis::ContentV2_1::ReturnpolicyCustomBatchRequest::Representation
          command.request_object = returnpolicy_custom_batch_request_object
          command.response_representation = Google::Apis::ContentV2_1::ReturnpolicyCustomBatchResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::ReturnpolicyCustomBatchResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a return policy for the given Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The Merchant Center account from which to delete the given return policy.
        # @param [String] return_policy_id
        #   Return policy ID generated by Google.
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
        def delete_returnpolicy(merchant_id, return_policy_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, '{merchantId}/returnpolicy/{returnPolicyId}', options)
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['returnPolicyId'] = return_policy_id unless return_policy_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a return policy of the Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The Merchant Center account to get a return policy for.
        # @param [String] return_policy_id
        #   Return policy ID generated by Google.
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
        # @yieldparam result [Google::Apis::ContentV2_1::ReturnPolicy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::ReturnPolicy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_returnpolicy(merchant_id, return_policy_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/returnpolicy/{returnPolicyId}', options)
          command.response_representation = Google::Apis::ContentV2_1::ReturnPolicy::Representation
          command.response_class = Google::Apis::ContentV2_1::ReturnPolicy
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['returnPolicyId'] = return_policy_id unless return_policy_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a return policy for the Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The Merchant Center account to insert a return policy for.
        # @param [Google::Apis::ContentV2_1::ReturnPolicy] return_policy_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::ReturnPolicy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::ReturnPolicy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_returnpolicy(merchant_id, return_policy_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/returnpolicy', options)
          command.request_representation = Google::Apis::ContentV2_1::ReturnPolicy::Representation
          command.request_object = return_policy_object
          command.response_representation = Google::Apis::ContentV2_1::ReturnPolicy::Representation
          command.response_class = Google::Apis::ContentV2_1::ReturnPolicy
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the return policies of the Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The Merchant Center account to list return policies for.
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
        # @yieldparam result [Google::Apis::ContentV2_1::ReturnpolicyListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::ReturnpolicyListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_returnpolicies(merchant_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/returnpolicy', options)
          command.response_representation = Google::Apis::ContentV2_1::ReturnpolicyListResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::ReturnpolicyListResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves and updates the shipping settings of multiple accounts in a single
        # request.
        # @param [Google::Apis::ContentV2_1::ShippingsettingsCustomBatchRequest] shippingsettings_custom_batch_request_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::ShippingsettingsCustomBatchResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::ShippingsettingsCustomBatchResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def custombatch_shippingsetting(shippingsettings_custom_batch_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'shippingsettings/batch', options)
          command.request_representation = Google::Apis::ContentV2_1::ShippingsettingsCustomBatchRequest::Representation
          command.request_object = shippingsettings_custom_batch_request_object
          command.response_representation = Google::Apis::ContentV2_1::ShippingsettingsCustomBatchResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::ShippingsettingsCustomBatchResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the shipping settings of the account.
        # @param [Fixnum] merchant_id
        #   The ID of the managing account. If this parameter is not the same as accountId,
        #   then this account must be a multi-client account and accountId must be the ID
        #   of a sub-account of this account.
        # @param [Fixnum] account_id
        #   The ID of the account for which to get/update shipping settings.
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
        # @yieldparam result [Google::Apis::ContentV2_1::ShippingSettings] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::ShippingSettings]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_shippingsetting(merchant_id, account_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/shippingsettings/{accountId}', options)
          command.response_representation = Google::Apis::ContentV2_1::ShippingSettings::Representation
          command.response_class = Google::Apis::ContentV2_1::ShippingSettings
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves supported carriers and carrier services for an account.
        # @param [Fixnum] merchant_id
        #   The ID of the account for which to retrieve the supported carriers.
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
        # @yieldparam result [Google::Apis::ContentV2_1::ShippingsettingsGetSupportedCarriersResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::ShippingsettingsGetSupportedCarriersResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def getsupportedcarriers_shippingsetting(merchant_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/supportedCarriers', options)
          command.response_representation = Google::Apis::ContentV2_1::ShippingsettingsGetSupportedCarriersResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::ShippingsettingsGetSupportedCarriersResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves supported holidays for an account.
        # @param [Fixnum] merchant_id
        #   The ID of the account for which to retrieve the supported holidays.
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
        # @yieldparam result [Google::Apis::ContentV2_1::ShippingsettingsGetSupportedHolidaysResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::ShippingsettingsGetSupportedHolidaysResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def getsupportedholidays_shippingsetting(merchant_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/supportedHolidays', options)
          command.response_representation = Google::Apis::ContentV2_1::ShippingsettingsGetSupportedHolidaysResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::ShippingsettingsGetSupportedHolidaysResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the shipping settings of the sub-accounts in your Merchant Center
        # account.
        # @param [Fixnum] merchant_id
        #   The ID of the managing account. This must be a multi-client account.
        # @param [Fixnum] max_results
        #   The maximum number of shipping settings to return in the response, used for
        #   paging.
        # @param [String] page_token
        #   The token returned by the previous request.
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
        # @yieldparam result [Google::Apis::ContentV2_1::ShippingsettingsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::ShippingsettingsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_shippingsettings(merchant_id, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/shippingsettings', options)
          command.response_representation = Google::Apis::ContentV2_1::ShippingsettingsListResponse::Representation
          command.response_class = Google::Apis::ContentV2_1::ShippingsettingsListResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the shipping settings of the account.
        # @param [Fixnum] merchant_id
        #   The ID of the managing account. If this parameter is not the same as accountId,
        #   then this account must be a multi-client account and accountId must be the ID
        #   of a sub-account of this account.
        # @param [Fixnum] account_id
        #   The ID of the account for which to get/update shipping settings.
        # @param [Google::Apis::ContentV2_1::ShippingSettings] shipping_settings_object
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
        # @yieldparam result [Google::Apis::ContentV2_1::ShippingSettings] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2_1::ShippingSettings]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_shippingsetting(merchant_id, account_id, shipping_settings_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, '{merchantId}/shippingsettings/{accountId}', options)
          command.request_representation = Google::Apis::ContentV2_1::ShippingSettings::Representation
          command.request_object = shipping_settings_object
          command.response_representation = Google::Apis::ContentV2_1::ShippingSettings::Representation
          command.response_class = Google::Apis::ContentV2_1::ShippingSettings
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['accountId'] = account_id unless account_id.nil?
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
