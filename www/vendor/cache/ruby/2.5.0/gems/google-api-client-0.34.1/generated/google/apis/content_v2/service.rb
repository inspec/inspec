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
    module ContentV2
      # Content API for Shopping
      #
      # Manages product items, inventory, and Merchant Center accounts for Google
      #  Shopping.
      #
      # @example
      #    require 'google/apis/content_v2'
      #
      #    Content = Google::Apis::ContentV2 # Alias the module
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
          super('https://www.googleapis.com/', 'content/v2/')
          @batch_path = 'batch/content/v2'
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
        # @yieldparam result [Google::Apis::ContentV2::AccountsAuthInfoResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::AccountsAuthInfoResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_account_authinfo(fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'accounts/authinfo', options)
          command.response_representation = Google::Apis::ContentV2::AccountsAuthInfoResponse::Representation
          command.response_class = Google::Apis::ContentV2::AccountsAuthInfoResponse
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
        # @yieldparam result [Google::Apis::ContentV2::AccountsClaimWebsiteResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::AccountsClaimWebsiteResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def claimwebsite_account(merchant_id, account_id, overwrite: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/accounts/{accountId}/claimwebsite', options)
          command.response_representation = Google::Apis::ContentV2::AccountsClaimWebsiteResponse::Representation
          command.response_class = Google::Apis::ContentV2::AccountsClaimWebsiteResponse
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
        # @param [Google::Apis::ContentV2::BatchAccountsRequest] batch_accounts_request_object
        # @param [Boolean] dry_run
        #   Flag to simulate a request like in a live environment. If set to true, dry-run
        #   mode checks the validity of the request and returns errors (if any).
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
        # @yieldparam result [Google::Apis::ContentV2::BatchAccountsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::BatchAccountsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_account(batch_accounts_request_object = nil, dry_run: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'accounts/batch', options)
          command.request_representation = Google::Apis::ContentV2::BatchAccountsRequest::Representation
          command.request_object = batch_accounts_request_object
          command.response_representation = Google::Apis::ContentV2::BatchAccountsResponse::Representation
          command.response_class = Google::Apis::ContentV2::BatchAccountsResponse
          command.query['dryRun'] = dry_run unless dry_run.nil?
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
        # @param [Boolean] dry_run
        #   Flag to simulate a request like in a live environment. If set to true, dry-run
        #   mode checks the validity of the request and returns errors (if any).
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
        def delete_account(merchant_id, account_id, dry_run: nil, force: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, '{merchantId}/accounts/{accountId}', options)
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['dryRun'] = dry_run unless dry_run.nil?
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
        # @yieldparam result [Google::Apis::ContentV2::Account] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::Account]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_account(merchant_id, account_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/accounts/{accountId}', options)
          command.response_representation = Google::Apis::ContentV2::Account::Representation
          command.response_class = Google::Apis::ContentV2::Account
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
        # @param [Google::Apis::ContentV2::Account] account_object
        # @param [Boolean] dry_run
        #   Flag to simulate a request like in a live environment. If set to true, dry-run
        #   mode checks the validity of the request and returns errors (if any).
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
        # @yieldparam result [Google::Apis::ContentV2::Account] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::Account]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_account(merchant_id, account_object = nil, dry_run: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/accounts', options)
          command.request_representation = Google::Apis::ContentV2::Account::Representation
          command.request_object = account_object
          command.response_representation = Google::Apis::ContentV2::Account::Representation
          command.response_class = Google::Apis::ContentV2::Account
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.query['dryRun'] = dry_run unless dry_run.nil?
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
        # @param [Google::Apis::ContentV2::AccountsLinkRequest] accounts_link_request_object
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
        # @yieldparam result [Google::Apis::ContentV2::AccountsLinkResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::AccountsLinkResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def link_account(merchant_id, account_id, accounts_link_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/accounts/{accountId}/link', options)
          command.request_representation = Google::Apis::ContentV2::AccountsLinkRequest::Representation
          command.request_object = accounts_link_request_object
          command.response_representation = Google::Apis::ContentV2::AccountsLinkResponse::Representation
          command.response_class = Google::Apis::ContentV2::AccountsLinkResponse
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
        # @yieldparam result [Google::Apis::ContentV2::ListAccountsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::ListAccountsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_accounts(merchant_id, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/accounts', options)
          command.response_representation = Google::Apis::ContentV2::ListAccountsResponse::Representation
          command.response_class = Google::Apis::ContentV2::ListAccountsResponse
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
        # @param [Google::Apis::ContentV2::Account] account_object
        # @param [Boolean] dry_run
        #   Flag to simulate a request like in a live environment. If set to true, dry-run
        #   mode checks the validity of the request and returns errors (if any).
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
        # @yieldparam result [Google::Apis::ContentV2::Account] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::Account]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_account(merchant_id, account_id, account_object = nil, dry_run: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, '{merchantId}/accounts/{accountId}', options)
          command.request_representation = Google::Apis::ContentV2::Account::Representation
          command.request_object = account_object
          command.response_representation = Google::Apis::ContentV2::Account::Representation
          command.response_class = Google::Apis::ContentV2::Account
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['dryRun'] = dry_run unless dry_run.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves multiple Merchant Center account statuses in a single request.
        # @param [Google::Apis::ContentV2::BatchAccountStatusesRequest] batch_account_statuses_request_object
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
        # @yieldparam result [Google::Apis::ContentV2::BatchAccountStatusesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::BatchAccountStatusesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_account_status(batch_account_statuses_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'accountstatuses/batch', options)
          command.request_representation = Google::Apis::ContentV2::BatchAccountStatusesRequest::Representation
          command.request_object = batch_account_statuses_request_object
          command.response_representation = Google::Apis::ContentV2::BatchAccountStatusesResponse::Representation
          command.response_class = Google::Apis::ContentV2::BatchAccountStatusesResponse
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
        # @yieldparam result [Google::Apis::ContentV2::AccountStatus] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::AccountStatus]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_account_status(merchant_id, account_id, destinations: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/accountstatuses/{accountId}', options)
          command.response_representation = Google::Apis::ContentV2::AccountStatus::Representation
          command.response_class = Google::Apis::ContentV2::AccountStatus
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
        # @yieldparam result [Google::Apis::ContentV2::ListAccountStatusesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::ListAccountStatusesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_account_statuses(merchant_id, destinations: nil, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/accountstatuses', options)
          command.response_representation = Google::Apis::ContentV2::ListAccountStatusesResponse::Representation
          command.response_class = Google::Apis::ContentV2::ListAccountStatusesResponse
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
        # @param [Google::Apis::ContentV2::BatchAccountTaxRequest] batch_account_tax_request_object
        # @param [Boolean] dry_run
        #   Flag to simulate a request like in a live environment. If set to true, dry-run
        #   mode checks the validity of the request and returns errors (if any).
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
        # @yieldparam result [Google::Apis::ContentV2::BatchAccountTaxResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::BatchAccountTaxResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_account_tax(batch_account_tax_request_object = nil, dry_run: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'accounttax/batch', options)
          command.request_representation = Google::Apis::ContentV2::BatchAccountTaxRequest::Representation
          command.request_object = batch_account_tax_request_object
          command.response_representation = Google::Apis::ContentV2::BatchAccountTaxResponse::Representation
          command.response_class = Google::Apis::ContentV2::BatchAccountTaxResponse
          command.query['dryRun'] = dry_run unless dry_run.nil?
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
        # @yieldparam result [Google::Apis::ContentV2::AccountTax] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::AccountTax]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_account_tax(merchant_id, account_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/accounttax/{accountId}', options)
          command.response_representation = Google::Apis::ContentV2::AccountTax::Representation
          command.response_class = Google::Apis::ContentV2::AccountTax
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
        # @yieldparam result [Google::Apis::ContentV2::ListAccountTaxResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::ListAccountTaxResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_account_taxes(merchant_id, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/accounttax', options)
          command.response_representation = Google::Apis::ContentV2::ListAccountTaxResponse::Representation
          command.response_class = Google::Apis::ContentV2::ListAccountTaxResponse
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
        # @param [Google::Apis::ContentV2::AccountTax] account_tax_object
        # @param [Boolean] dry_run
        #   Flag to simulate a request like in a live environment. If set to true, dry-run
        #   mode checks the validity of the request and returns errors (if any).
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
        # @yieldparam result [Google::Apis::ContentV2::AccountTax] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::AccountTax]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_account_tax(merchant_id, account_id, account_tax_object = nil, dry_run: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, '{merchantId}/accounttax/{accountId}', options)
          command.request_representation = Google::Apis::ContentV2::AccountTax::Representation
          command.request_object = account_tax_object
          command.response_representation = Google::Apis::ContentV2::AccountTax::Representation
          command.response_class = Google::Apis::ContentV2::AccountTax
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['dryRun'] = dry_run unless dry_run.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes, fetches, gets, inserts and updates multiple datafeeds in a single
        # request.
        # @param [Google::Apis::ContentV2::BatchDatafeedsRequest] batch_datafeeds_request_object
        # @param [Boolean] dry_run
        #   Flag to simulate a request like in a live environment. If set to true, dry-run
        #   mode checks the validity of the request and returns errors (if any).
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
        # @yieldparam result [Google::Apis::ContentV2::BatchDatafeedsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::BatchDatafeedsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_datafeed(batch_datafeeds_request_object = nil, dry_run: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'datafeeds/batch', options)
          command.request_representation = Google::Apis::ContentV2::BatchDatafeedsRequest::Representation
          command.request_object = batch_datafeeds_request_object
          command.response_representation = Google::Apis::ContentV2::BatchDatafeedsResponse::Representation
          command.response_class = Google::Apis::ContentV2::BatchDatafeedsResponse
          command.query['dryRun'] = dry_run unless dry_run.nil?
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
        # @param [Boolean] dry_run
        #   Flag to simulate a request like in a live environment. If set to true, dry-run
        #   mode checks the validity of the request and returns errors (if any).
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
        def delete_datafeed(merchant_id, datafeed_id, dry_run: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, '{merchantId}/datafeeds/{datafeedId}', options)
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['datafeedId'] = datafeed_id unless datafeed_id.nil?
          command.query['dryRun'] = dry_run unless dry_run.nil?
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
        # @param [Boolean] dry_run
        #   Flag to simulate a request like in a live environment. If set to true, dry-run
        #   mode checks the validity of the request and returns errors (if any).
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
        # @yieldparam result [Google::Apis::ContentV2::DatafeedsFetchNowResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::DatafeedsFetchNowResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def fetchnow_datafeed(merchant_id, datafeed_id, dry_run: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/datafeeds/{datafeedId}/fetchNow', options)
          command.response_representation = Google::Apis::ContentV2::DatafeedsFetchNowResponse::Representation
          command.response_class = Google::Apis::ContentV2::DatafeedsFetchNowResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['datafeedId'] = datafeed_id unless datafeed_id.nil?
          command.query['dryRun'] = dry_run unless dry_run.nil?
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
        # @yieldparam result [Google::Apis::ContentV2::Datafeed] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::Datafeed]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_datafeed(merchant_id, datafeed_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/datafeeds/{datafeedId}', options)
          command.response_representation = Google::Apis::ContentV2::Datafeed::Representation
          command.response_class = Google::Apis::ContentV2::Datafeed
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
        # @param [Google::Apis::ContentV2::Datafeed] datafeed_object
        # @param [Boolean] dry_run
        #   Flag to simulate a request like in a live environment. If set to true, dry-run
        #   mode checks the validity of the request and returns errors (if any).
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
        # @yieldparam result [Google::Apis::ContentV2::Datafeed] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::Datafeed]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_datafeed(merchant_id, datafeed_object = nil, dry_run: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/datafeeds', options)
          command.request_representation = Google::Apis::ContentV2::Datafeed::Representation
          command.request_object = datafeed_object
          command.response_representation = Google::Apis::ContentV2::Datafeed::Representation
          command.response_class = Google::Apis::ContentV2::Datafeed
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.query['dryRun'] = dry_run unless dry_run.nil?
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
        # @yieldparam result [Google::Apis::ContentV2::ListDatafeedsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::ListDatafeedsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_datafeeds(merchant_id, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/datafeeds', options)
          command.response_representation = Google::Apis::ContentV2::ListDatafeedsResponse::Representation
          command.response_class = Google::Apis::ContentV2::ListDatafeedsResponse
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
        # @param [Google::Apis::ContentV2::Datafeed] datafeed_object
        # @param [Boolean] dry_run
        #   Flag to simulate a request like in a live environment. If set to true, dry-run
        #   mode checks the validity of the request and returns errors (if any).
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
        # @yieldparam result [Google::Apis::ContentV2::Datafeed] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::Datafeed]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_datafeed(merchant_id, datafeed_id, datafeed_object = nil, dry_run: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, '{merchantId}/datafeeds/{datafeedId}', options)
          command.request_representation = Google::Apis::ContentV2::Datafeed::Representation
          command.request_object = datafeed_object
          command.response_representation = Google::Apis::ContentV2::Datafeed::Representation
          command.response_class = Google::Apis::ContentV2::Datafeed
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['datafeedId'] = datafeed_id unless datafeed_id.nil?
          command.query['dryRun'] = dry_run unless dry_run.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets multiple Merchant Center datafeed statuses in a single request.
        # @param [Google::Apis::ContentV2::BatchDatafeedStatusesRequest] batch_datafeed_statuses_request_object
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
        # @yieldparam result [Google::Apis::ContentV2::BatchDatafeedStatusesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::BatchDatafeedStatusesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_datafeed_status(batch_datafeed_statuses_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'datafeedstatuses/batch', options)
          command.request_representation = Google::Apis::ContentV2::BatchDatafeedStatusesRequest::Representation
          command.request_object = batch_datafeed_statuses_request_object
          command.response_representation = Google::Apis::ContentV2::BatchDatafeedStatusesResponse::Representation
          command.response_class = Google::Apis::ContentV2::BatchDatafeedStatusesResponse
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
        # @yieldparam result [Google::Apis::ContentV2::DatafeedStatus] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::DatafeedStatus]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_datafeed_status(merchant_id, datafeed_id, country: nil, language: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/datafeedstatuses/{datafeedId}', options)
          command.response_representation = Google::Apis::ContentV2::DatafeedStatus::Representation
          command.response_class = Google::Apis::ContentV2::DatafeedStatus
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
        # @yieldparam result [Google::Apis::ContentV2::ListDatafeedStatusesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::ListDatafeedStatusesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_datafeed_statuses(merchant_id, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/datafeedstatuses', options)
          command.response_representation = Google::Apis::ContentV2::ListDatafeedStatusesResponse::Representation
          command.response_class = Google::Apis::ContentV2::ListDatafeedStatusesResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates price and availability for multiple products or stores in a single
        # request. This operation does not update the expiration date of the products.
        # @param [Google::Apis::ContentV2::BatchInventoryRequest] batch_inventory_request_object
        # @param [Boolean] dry_run
        #   Flag to simulate a request like in a live environment. If set to true, dry-run
        #   mode checks the validity of the request and returns errors (if any).
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
        # @yieldparam result [Google::Apis::ContentV2::BatchInventoryResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::BatchInventoryResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_inventory(batch_inventory_request_object = nil, dry_run: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'inventory/batch', options)
          command.request_representation = Google::Apis::ContentV2::BatchInventoryRequest::Representation
          command.request_object = batch_inventory_request_object
          command.response_representation = Google::Apis::ContentV2::BatchInventoryResponse::Representation
          command.response_class = Google::Apis::ContentV2::BatchInventoryResponse
          command.query['dryRun'] = dry_run unless dry_run.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates price and availability of a product in your Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The ID of the account that contains the product. This account cannot be a
        #   multi-client account.
        # @param [String] store_code
        #   The code of the store for which to update price and availability. Use online
        #   to update price and availability of an online product.
        # @param [String] product_id
        #   The REST ID of the product for which to update price and availability.
        # @param [Google::Apis::ContentV2::SetInventoryRequest] set_inventory_request_object
        # @param [Boolean] dry_run
        #   Flag to simulate a request like in a live environment. If set to true, dry-run
        #   mode checks the validity of the request and returns errors (if any).
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
        # @yieldparam result [Google::Apis::ContentV2::SetInventoryResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::SetInventoryResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def set_inventory(merchant_id, store_code, product_id, set_inventory_request_object = nil, dry_run: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/inventory/{storeCode}/products/{productId}', options)
          command.request_representation = Google::Apis::ContentV2::SetInventoryRequest::Representation
          command.request_object = set_inventory_request_object
          command.response_representation = Google::Apis::ContentV2::SetInventoryResponse::Representation
          command.response_class = Google::Apis::ContentV2::SetInventoryResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['storeCode'] = store_code unless store_code.nil?
          command.params['productId'] = product_id unless product_id.nil?
          command.query['dryRun'] = dry_run unless dry_run.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves and/or updates the LIA settings of multiple accounts in a single
        # request.
        # @param [Google::Apis::ContentV2::LiasettingsCustomBatchRequest] liasettings_custom_batch_request_object
        # @param [Boolean] dry_run
        #   Flag to simulate a request like in a live environment. If set to true, dry-run
        #   mode checks the validity of the request and returns errors (if any).
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
        # @yieldparam result [Google::Apis::ContentV2::LiasettingsCustomBatchResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::LiasettingsCustomBatchResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def custombatch_liasetting(liasettings_custom_batch_request_object = nil, dry_run: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'liasettings/batch', options)
          command.request_representation = Google::Apis::ContentV2::LiasettingsCustomBatchRequest::Representation
          command.request_object = liasettings_custom_batch_request_object
          command.response_representation = Google::Apis::ContentV2::LiasettingsCustomBatchResponse::Representation
          command.response_class = Google::Apis::ContentV2::LiasettingsCustomBatchResponse
          command.query['dryRun'] = dry_run unless dry_run.nil?
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
        # @yieldparam result [Google::Apis::ContentV2::LiaSettings] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::LiaSettings]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_liasetting(merchant_id, account_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/liasettings/{accountId}', options)
          command.response_representation = Google::Apis::ContentV2::LiaSettings::Representation
          command.response_class = Google::Apis::ContentV2::LiaSettings
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
        # @yieldparam result [Google::Apis::ContentV2::LiasettingsGetAccessibleGmbAccountsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::LiasettingsGetAccessibleGmbAccountsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def getaccessiblegmbaccounts_liasetting(merchant_id, account_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/liasettings/{accountId}/accessiblegmbaccounts', options)
          command.response_representation = Google::Apis::ContentV2::LiasettingsGetAccessibleGmbAccountsResponse::Representation
          command.response_class = Google::Apis::ContentV2::LiasettingsGetAccessibleGmbAccountsResponse
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
        # @yieldparam result [Google::Apis::ContentV2::LiasettingsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::LiasettingsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_liasettings(merchant_id, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/liasettings', options)
          command.response_representation = Google::Apis::ContentV2::LiasettingsListResponse::Representation
          command.response_class = Google::Apis::ContentV2::LiasettingsListResponse
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
        # @yieldparam result [Google::Apis::ContentV2::LiasettingsListPosDataProvidersResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::LiasettingsListPosDataProvidersResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def listposdataproviders_liasetting(fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'liasettings/posdataproviders', options)
          command.response_representation = Google::Apis::ContentV2::LiasettingsListPosDataProvidersResponse::Representation
          command.response_class = Google::Apis::ContentV2::LiasettingsListPosDataProvidersResponse
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
        # @yieldparam result [Google::Apis::ContentV2::LiasettingsRequestGmbAccessResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::LiasettingsRequestGmbAccessResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def requestgmbaccess_liasetting(merchant_id, account_id, gmb_email, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/liasettings/{accountId}/requestgmbaccess', options)
          command.response_representation = Google::Apis::ContentV2::LiasettingsRequestGmbAccessResponse::Representation
          command.response_class = Google::Apis::ContentV2::LiasettingsRequestGmbAccessResponse
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
        # @yieldparam result [Google::Apis::ContentV2::LiasettingsRequestInventoryVerificationResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::LiasettingsRequestInventoryVerificationResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def requestinventoryverification_liasetting(merchant_id, account_id, country, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/liasettings/{accountId}/requestinventoryverification/{country}', options)
          command.response_representation = Google::Apis::ContentV2::LiasettingsRequestInventoryVerificationResponse::Representation
          command.response_class = Google::Apis::ContentV2::LiasettingsRequestInventoryVerificationResponse
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
        # @yieldparam result [Google::Apis::ContentV2::LiasettingsSetInventoryVerificationContactResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::LiasettingsSetInventoryVerificationContactResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def setinventoryverificationcontact_liasetting(merchant_id, account_id, contact_email, contact_name, country, language, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/liasettings/{accountId}/setinventoryverificationcontact', options)
          command.response_representation = Google::Apis::ContentV2::LiasettingsSetInventoryVerificationContactResponse::Representation
          command.response_class = Google::Apis::ContentV2::LiasettingsSetInventoryVerificationContactResponse
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
        # @yieldparam result [Google::Apis::ContentV2::LiasettingsSetPosDataProviderResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::LiasettingsSetPosDataProviderResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def setposdataprovider_liasetting(merchant_id, account_id, country, pos_data_provider_id: nil, pos_external_account_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/liasettings/{accountId}/setposdataprovider', options)
          command.response_representation = Google::Apis::ContentV2::LiasettingsSetPosDataProviderResponse::Representation
          command.response_class = Google::Apis::ContentV2::LiasettingsSetPosDataProviderResponse
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
        # @param [Google::Apis::ContentV2::LiaSettings] lia_settings_object
        # @param [Boolean] dry_run
        #   Flag to simulate a request like in a live environment. If set to true, dry-run
        #   mode checks the validity of the request and returns errors (if any).
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
        # @yieldparam result [Google::Apis::ContentV2::LiaSettings] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::LiaSettings]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_liasetting(merchant_id, account_id, lia_settings_object = nil, dry_run: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, '{merchantId}/liasettings/{accountId}', options)
          command.request_representation = Google::Apis::ContentV2::LiaSettings::Representation
          command.request_object = lia_settings_object
          command.response_representation = Google::Apis::ContentV2::LiaSettings::Representation
          command.response_class = Google::Apis::ContentV2::LiaSettings
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['dryRun'] = dry_run unless dry_run.nil?
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
        # @param [Google::Apis::ContentV2::OrderinvoicesCreateChargeInvoiceRequest] orderinvoices_create_charge_invoice_request_object
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
        # @yieldparam result [Google::Apis::ContentV2::OrderinvoicesCreateChargeInvoiceResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::OrderinvoicesCreateChargeInvoiceResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def createchargeinvoice_orderinvoice(merchant_id, order_id, orderinvoices_create_charge_invoice_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/orderinvoices/{orderId}/createChargeInvoice', options)
          command.request_representation = Google::Apis::ContentV2::OrderinvoicesCreateChargeInvoiceRequest::Representation
          command.request_object = orderinvoices_create_charge_invoice_request_object
          command.response_representation = Google::Apis::ContentV2::OrderinvoicesCreateChargeInvoiceResponse::Representation
          command.response_class = Google::Apis::ContentV2::OrderinvoicesCreateChargeInvoiceResponse
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
        # @param [Google::Apis::ContentV2::OrderinvoicesCreateRefundInvoiceRequest] orderinvoices_create_refund_invoice_request_object
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
        # @yieldparam result [Google::Apis::ContentV2::OrderinvoicesCreateRefundInvoiceResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::OrderinvoicesCreateRefundInvoiceResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def createrefundinvoice_orderinvoice(merchant_id, order_id, orderinvoices_create_refund_invoice_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/orderinvoices/{orderId}/createRefundInvoice', options)
          command.request_representation = Google::Apis::ContentV2::OrderinvoicesCreateRefundInvoiceRequest::Representation
          command.request_object = orderinvoices_create_refund_invoice_request_object
          command.response_representation = Google::Apis::ContentV2::OrderinvoicesCreateRefundInvoiceResponse::Representation
          command.response_class = Google::Apis::ContentV2::OrderinvoicesCreateRefundInvoiceResponse
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
        # @yieldparam result [Google::Apis::ContentV2::OrderreportsListDisbursementsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::OrderreportsListDisbursementsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def listdisbursements_orderreport(merchant_id, disbursement_start_date, disbursement_end_date: nil, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/orderreports/disbursements', options)
          command.response_representation = Google::Apis::ContentV2::OrderreportsListDisbursementsResponse::Representation
          command.response_class = Google::Apis::ContentV2::OrderreportsListDisbursementsResponse
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
        # @yieldparam result [Google::Apis::ContentV2::OrderreportsListTransactionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::OrderreportsListTransactionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def listtransactions_orderreport(merchant_id, disbursement_id, transaction_start_date, max_results: nil, page_token: nil, transaction_end_date: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/orderreports/disbursements/{disbursementId}/transactions', options)
          command.response_representation = Google::Apis::ContentV2::OrderreportsListTransactionsResponse::Representation
          command.response_class = Google::Apis::ContentV2::OrderreportsListTransactionsResponse
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
        # @yieldparam result [Google::Apis::ContentV2::MerchantOrderReturn] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::MerchantOrderReturn]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_orderreturn(merchant_id, return_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/orderreturns/{returnId}', options)
          command.response_representation = Google::Apis::ContentV2::MerchantOrderReturn::Representation
          command.response_class = Google::Apis::ContentV2::MerchantOrderReturn
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
        # @yieldparam result [Google::Apis::ContentV2::OrderreturnsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::OrderreturnsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_orderreturns(merchant_id, created_end_date: nil, created_start_date: nil, max_results: nil, order_by: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/orderreturns', options)
          command.response_representation = Google::Apis::ContentV2::OrderreturnsListResponse::Representation
          command.response_class = Google::Apis::ContentV2::OrderreturnsListResponse
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
        # @param [Google::Apis::ContentV2::OrdersAcknowledgeRequest] orders_acknowledge_request_object
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
        # @yieldparam result [Google::Apis::ContentV2::OrdersAcknowledgeResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::OrdersAcknowledgeResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def acknowledge_order(merchant_id, order_id, orders_acknowledge_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/orders/{orderId}/acknowledge', options)
          command.request_representation = Google::Apis::ContentV2::OrdersAcknowledgeRequest::Representation
          command.request_object = orders_acknowledge_request_object
          command.response_representation = Google::Apis::ContentV2::OrdersAcknowledgeResponse::Representation
          command.response_class = Google::Apis::ContentV2::OrdersAcknowledgeResponse
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
        # @yieldparam result [Google::Apis::ContentV2::OrdersAdvanceTestOrderResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::OrdersAdvanceTestOrderResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def advance_test_order(merchant_id, order_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/testorders/{orderId}/advance', options)
          command.response_representation = Google::Apis::ContentV2::OrdersAdvanceTestOrderResponse::Representation
          command.response_class = Google::Apis::ContentV2::OrdersAdvanceTestOrderResponse
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
        # @param [Google::Apis::ContentV2::OrdersCancelRequest] orders_cancel_request_object
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
        # @yieldparam result [Google::Apis::ContentV2::OrdersCancelResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::OrdersCancelResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def cancel_order(merchant_id, order_id, orders_cancel_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/orders/{orderId}/cancel', options)
          command.request_representation = Google::Apis::ContentV2::OrdersCancelRequest::Representation
          command.request_object = orders_cancel_request_object
          command.response_representation = Google::Apis::ContentV2::OrdersCancelResponse::Representation
          command.response_class = Google::Apis::ContentV2::OrdersCancelResponse
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
        # @param [Google::Apis::ContentV2::OrdersCancelLineItemRequest] orders_cancel_line_item_request_object
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
        # @yieldparam result [Google::Apis::ContentV2::OrdersCancelLineItemResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::OrdersCancelLineItemResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def cancel_order_line_item(merchant_id, order_id, orders_cancel_line_item_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/orders/{orderId}/cancelLineItem', options)
          command.request_representation = Google::Apis::ContentV2::OrdersCancelLineItemRequest::Representation
          command.request_object = orders_cancel_line_item_request_object
          command.response_representation = Google::Apis::ContentV2::OrdersCancelLineItemResponse::Representation
          command.response_class = Google::Apis::ContentV2::OrdersCancelLineItemResponse
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
        # @param [Google::Apis::ContentV2::OrdersCancelTestOrderByCustomerRequest] orders_cancel_test_order_by_customer_request_object
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
        # @yieldparam result [Google::Apis::ContentV2::OrdersCancelTestOrderByCustomerResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::OrdersCancelTestOrderByCustomerResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def canceltestorderbycustomer_order(merchant_id, order_id, orders_cancel_test_order_by_customer_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/testorders/{orderId}/cancelByCustomer', options)
          command.request_representation = Google::Apis::ContentV2::OrdersCancelTestOrderByCustomerRequest::Representation
          command.request_object = orders_cancel_test_order_by_customer_request_object
          command.response_representation = Google::Apis::ContentV2::OrdersCancelTestOrderByCustomerResponse::Representation
          command.response_class = Google::Apis::ContentV2::OrdersCancelTestOrderByCustomerResponse
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
        # @param [Google::Apis::ContentV2::OrdersCreateTestOrderRequest] orders_create_test_order_request_object
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
        # @yieldparam result [Google::Apis::ContentV2::OrdersCreateTestOrderResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::OrdersCreateTestOrderResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_test_order(merchant_id, orders_create_test_order_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/testorders', options)
          command.request_representation = Google::Apis::ContentV2::OrdersCreateTestOrderRequest::Representation
          command.request_object = orders_create_test_order_request_object
          command.response_representation = Google::Apis::ContentV2::OrdersCreateTestOrderResponse::Representation
          command.response_class = Google::Apis::ContentV2::OrdersCreateTestOrderResponse
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
        # @param [Google::Apis::ContentV2::OrdersCreateTestReturnRequest] orders_create_test_return_request_object
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
        # @yieldparam result [Google::Apis::ContentV2::OrdersCreateTestReturnResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::OrdersCreateTestReturnResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def createtestreturn_order(merchant_id, order_id, orders_create_test_return_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/orders/{orderId}/testreturn', options)
          command.request_representation = Google::Apis::ContentV2::OrdersCreateTestReturnRequest::Representation
          command.request_object = orders_create_test_return_request_object
          command.response_representation = Google::Apis::ContentV2::OrdersCreateTestReturnResponse::Representation
          command.response_class = Google::Apis::ContentV2::OrdersCreateTestReturnResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['orderId'] = order_id unless order_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves or modifies multiple orders in a single request.
        # @param [Google::Apis::ContentV2::OrdersCustomBatchRequest] orders_custom_batch_request_object
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
        # @yieldparam result [Google::Apis::ContentV2::OrdersCustomBatchResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::OrdersCustomBatchResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def custom_order_batch(orders_custom_batch_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'orders/batch', options)
          command.request_representation = Google::Apis::ContentV2::OrdersCustomBatchRequest::Representation
          command.request_object = orders_custom_batch_request_object
          command.response_representation = Google::Apis::ContentV2::OrdersCustomBatchResponse::Representation
          command.response_class = Google::Apis::ContentV2::OrdersCustomBatchResponse
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
        # @yieldparam result [Google::Apis::ContentV2::Order] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::Order]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_order(merchant_id, order_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/orders/{orderId}', options)
          command.response_representation = Google::Apis::ContentV2::Order::Representation
          command.response_class = Google::Apis::ContentV2::Order
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
        # @yieldparam result [Google::Apis::ContentV2::OrdersGetByMerchantOrderIdResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::OrdersGetByMerchantOrderIdResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_order_by_merchant_order_id(merchant_id, merchant_order_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/ordersbymerchantid/{merchantOrderId}', options)
          command.response_representation = Google::Apis::ContentV2::OrdersGetByMerchantOrderIdResponse::Representation
          command.response_class = Google::Apis::ContentV2::OrdersGetByMerchantOrderIdResponse
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
        # @yieldparam result [Google::Apis::ContentV2::OrdersGetTestOrderTemplateResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::OrdersGetTestOrderTemplateResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_test_order_template(merchant_id, template_name, country: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/testordertemplates/{templateName}', options)
          command.response_representation = Google::Apis::ContentV2::OrdersGetTestOrderTemplateResponse::Representation
          command.response_class = Google::Apis::ContentV2::OrdersGetTestOrderTemplateResponse
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
        # @param [Google::Apis::ContentV2::OrdersInStoreRefundLineItemRequest] orders_in_store_refund_line_item_request_object
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
        # @yieldparam result [Google::Apis::ContentV2::OrdersInStoreRefundLineItemResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::OrdersInStoreRefundLineItemResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def instorerefundlineitem_order(merchant_id, order_id, orders_in_store_refund_line_item_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/orders/{orderId}/inStoreRefundLineItem', options)
          command.request_representation = Google::Apis::ContentV2::OrdersInStoreRefundLineItemRequest::Representation
          command.request_object = orders_in_store_refund_line_item_request_object
          command.response_representation = Google::Apis::ContentV2::OrdersInStoreRefundLineItemResponse::Representation
          command.response_class = Google::Apis::ContentV2::OrdersInStoreRefundLineItemResponse
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
        # @yieldparam result [Google::Apis::ContentV2::OrdersListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::OrdersListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_orders(merchant_id, acknowledged: nil, max_results: nil, order_by: nil, page_token: nil, placed_date_end: nil, placed_date_start: nil, statuses: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/orders', options)
          command.response_representation = Google::Apis::ContentV2::OrdersListResponse::Representation
          command.response_class = Google::Apis::ContentV2::OrdersListResponse
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
        
        # Deprecated, please use returnRefundLineItem instead.
        # @param [Fixnum] merchant_id
        #   The ID of the account that manages the order. This cannot be a multi-client
        #   account.
        # @param [String] order_id
        #   The ID of the order to refund.
        # @param [Google::Apis::ContentV2::OrdersRefundRequest] orders_refund_request_object
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
        # @yieldparam result [Google::Apis::ContentV2::OrdersRefundResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::OrdersRefundResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def refund_order(merchant_id, order_id, orders_refund_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/orders/{orderId}/refund', options)
          command.request_representation = Google::Apis::ContentV2::OrdersRefundRequest::Representation
          command.request_object = orders_refund_request_object
          command.response_representation = Google::Apis::ContentV2::OrdersRefundResponse::Representation
          command.response_class = Google::Apis::ContentV2::OrdersRefundResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['orderId'] = order_id unless order_id.nil?
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
        # @param [Google::Apis::ContentV2::OrdersRejectReturnLineItemRequest] orders_reject_return_line_item_request_object
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
        # @yieldparam result [Google::Apis::ContentV2::OrdersRejectReturnLineItemResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::OrdersRejectReturnLineItemResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def rejectreturnlineitem_order(merchant_id, order_id, orders_reject_return_line_item_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/orders/{orderId}/rejectReturnLineItem', options)
          command.request_representation = Google::Apis::ContentV2::OrdersRejectReturnLineItemRequest::Representation
          command.request_object = orders_reject_return_line_item_request_object
          command.response_representation = Google::Apis::ContentV2::OrdersRejectReturnLineItemResponse::Representation
          command.response_class = Google::Apis::ContentV2::OrdersRejectReturnLineItemResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['orderId'] = order_id unless order_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a line item.
        # @param [Fixnum] merchant_id
        #   The ID of the account that manages the order. This cannot be a multi-client
        #   account.
        # @param [String] order_id
        #   The ID of the order.
        # @param [Google::Apis::ContentV2::OrdersReturnLineItemRequest] orders_return_line_item_request_object
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
        # @yieldparam result [Google::Apis::ContentV2::OrdersReturnLineItemResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::OrdersReturnLineItemResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def return_order_line_item(merchant_id, order_id, orders_return_line_item_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/orders/{orderId}/returnLineItem', options)
          command.request_representation = Google::Apis::ContentV2::OrdersReturnLineItemRequest::Representation
          command.request_object = orders_return_line_item_request_object
          command.response_representation = Google::Apis::ContentV2::OrdersReturnLineItemResponse::Representation
          command.response_class = Google::Apis::ContentV2::OrdersReturnLineItemResponse
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
        # @param [Google::Apis::ContentV2::OrdersReturnRefundLineItemRequest] orders_return_refund_line_item_request_object
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
        # @yieldparam result [Google::Apis::ContentV2::OrdersReturnRefundLineItemResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::OrdersReturnRefundLineItemResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def returnrefundlineitem_order(merchant_id, order_id, orders_return_refund_line_item_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/orders/{orderId}/returnRefundLineItem', options)
          command.request_representation = Google::Apis::ContentV2::OrdersReturnRefundLineItemRequest::Representation
          command.request_object = orders_return_refund_line_item_request_object
          command.response_representation = Google::Apis::ContentV2::OrdersReturnRefundLineItemResponse::Representation
          command.response_class = Google::Apis::ContentV2::OrdersReturnRefundLineItemResponse
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
        # @param [Google::Apis::ContentV2::OrdersSetLineItemMetadataRequest] orders_set_line_item_metadata_request_object
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
        # @yieldparam result [Google::Apis::ContentV2::OrdersSetLineItemMetadataResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::OrdersSetLineItemMetadataResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def setlineitemmetadata_order(merchant_id, order_id, orders_set_line_item_metadata_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/orders/{orderId}/setLineItemMetadata', options)
          command.request_representation = Google::Apis::ContentV2::OrdersSetLineItemMetadataRequest::Representation
          command.request_object = orders_set_line_item_metadata_request_object
          command.response_representation = Google::Apis::ContentV2::OrdersSetLineItemMetadataResponse::Representation
          command.response_class = Google::Apis::ContentV2::OrdersSetLineItemMetadataResponse
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
        # @param [Google::Apis::ContentV2::OrdersShipLineItemsRequest] orders_ship_line_items_request_object
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
        # @yieldparam result [Google::Apis::ContentV2::OrdersShipLineItemsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::OrdersShipLineItemsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def shiplineitems_order(merchant_id, order_id, orders_ship_line_items_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/orders/{orderId}/shipLineItems', options)
          command.request_representation = Google::Apis::ContentV2::OrdersShipLineItemsRequest::Representation
          command.request_object = orders_ship_line_items_request_object
          command.response_representation = Google::Apis::ContentV2::OrdersShipLineItemsResponse::Representation
          command.response_class = Google::Apis::ContentV2::OrdersShipLineItemsResponse
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
        # @param [Google::Apis::ContentV2::OrdersUpdateLineItemShippingDetailsRequest] orders_update_line_item_shipping_details_request_object
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
        # @yieldparam result [Google::Apis::ContentV2::OrdersUpdateLineItemShippingDetailsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::OrdersUpdateLineItemShippingDetailsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def updatelineitemshippingdetails_order(merchant_id, order_id, orders_update_line_item_shipping_details_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/orders/{orderId}/updateLineItemShippingDetails', options)
          command.request_representation = Google::Apis::ContentV2::OrdersUpdateLineItemShippingDetailsRequest::Representation
          command.request_object = orders_update_line_item_shipping_details_request_object
          command.response_representation = Google::Apis::ContentV2::OrdersUpdateLineItemShippingDetailsResponse::Representation
          command.response_class = Google::Apis::ContentV2::OrdersUpdateLineItemShippingDetailsResponse
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
        # @param [Google::Apis::ContentV2::OrdersUpdateMerchantOrderIdRequest] orders_update_merchant_order_id_request_object
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
        # @yieldparam result [Google::Apis::ContentV2::OrdersUpdateMerchantOrderIdResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::OrdersUpdateMerchantOrderIdResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_merchant_order_id(merchant_id, order_id, orders_update_merchant_order_id_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/orders/{orderId}/updateMerchantOrderId', options)
          command.request_representation = Google::Apis::ContentV2::OrdersUpdateMerchantOrderIdRequest::Representation
          command.request_object = orders_update_merchant_order_id_request_object
          command.response_representation = Google::Apis::ContentV2::OrdersUpdateMerchantOrderIdResponse::Representation
          command.response_class = Google::Apis::ContentV2::OrdersUpdateMerchantOrderIdResponse
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
        # @param [Google::Apis::ContentV2::OrdersUpdateShipmentRequest] orders_update_shipment_request_object
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
        # @yieldparam result [Google::Apis::ContentV2::OrdersUpdateShipmentResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::OrdersUpdateShipmentResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_order_shipment(merchant_id, order_id, orders_update_shipment_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/orders/{orderId}/updateShipment', options)
          command.request_representation = Google::Apis::ContentV2::OrdersUpdateShipmentRequest::Representation
          command.request_object = orders_update_shipment_request_object
          command.response_representation = Google::Apis::ContentV2::OrdersUpdateShipmentResponse::Representation
          command.response_class = Google::Apis::ContentV2::OrdersUpdateShipmentResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['orderId'] = order_id unless order_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Batches multiple POS-related calls in a single request.
        # @param [Google::Apis::ContentV2::PosCustomBatchRequest] pos_custom_batch_request_object
        # @param [Boolean] dry_run
        #   Flag to simulate a request like in a live environment. If set to true, dry-run
        #   mode checks the validity of the request and returns errors (if any).
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
        # @yieldparam result [Google::Apis::ContentV2::PosCustomBatchResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::PosCustomBatchResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def custombatch_po(pos_custom_batch_request_object = nil, dry_run: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'pos/batch', options)
          command.request_representation = Google::Apis::ContentV2::PosCustomBatchRequest::Representation
          command.request_object = pos_custom_batch_request_object
          command.response_representation = Google::Apis::ContentV2::PosCustomBatchResponse::Representation
          command.response_class = Google::Apis::ContentV2::PosCustomBatchResponse
          command.query['dryRun'] = dry_run unless dry_run.nil?
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
        # @param [Boolean] dry_run
        #   Flag to simulate a request like in a live environment. If set to true, dry-run
        #   mode checks the validity of the request and returns errors (if any).
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
        def delete_po(merchant_id, target_merchant_id, store_code, dry_run: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, '{merchantId}/pos/{targetMerchantId}/store/{storeCode}', options)
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['targetMerchantId'] = target_merchant_id unless target_merchant_id.nil?
          command.params['storeCode'] = store_code unless store_code.nil?
          command.query['dryRun'] = dry_run unless dry_run.nil?
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
        # @yieldparam result [Google::Apis::ContentV2::PosStore] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::PosStore]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_po(merchant_id, target_merchant_id, store_code, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/pos/{targetMerchantId}/store/{storeCode}', options)
          command.response_representation = Google::Apis::ContentV2::PosStore::Representation
          command.response_class = Google::Apis::ContentV2::PosStore
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
        # @param [Google::Apis::ContentV2::PosStore] pos_store_object
        # @param [Boolean] dry_run
        #   Flag to simulate a request like in a live environment. If set to true, dry-run
        #   mode checks the validity of the request and returns errors (if any).
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
        # @yieldparam result [Google::Apis::ContentV2::PosStore] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::PosStore]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_po(merchant_id, target_merchant_id, pos_store_object = nil, dry_run: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/pos/{targetMerchantId}/store', options)
          command.request_representation = Google::Apis::ContentV2::PosStore::Representation
          command.request_object = pos_store_object
          command.response_representation = Google::Apis::ContentV2::PosStore::Representation
          command.response_class = Google::Apis::ContentV2::PosStore
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['targetMerchantId'] = target_merchant_id unless target_merchant_id.nil?
          command.query['dryRun'] = dry_run unless dry_run.nil?
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
        # @param [Google::Apis::ContentV2::PosInventoryRequest] pos_inventory_request_object
        # @param [Boolean] dry_run
        #   Flag to simulate a request like in a live environment. If set to true, dry-run
        #   mode checks the validity of the request and returns errors (if any).
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
        # @yieldparam result [Google::Apis::ContentV2::PosInventoryResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::PosInventoryResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def inventory_po(merchant_id, target_merchant_id, pos_inventory_request_object = nil, dry_run: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/pos/{targetMerchantId}/inventory', options)
          command.request_representation = Google::Apis::ContentV2::PosInventoryRequest::Representation
          command.request_object = pos_inventory_request_object
          command.response_representation = Google::Apis::ContentV2::PosInventoryResponse::Representation
          command.response_class = Google::Apis::ContentV2::PosInventoryResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['targetMerchantId'] = target_merchant_id unless target_merchant_id.nil?
          command.query['dryRun'] = dry_run unless dry_run.nil?
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
        # @yieldparam result [Google::Apis::ContentV2::PosListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::PosListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_pos(merchant_id, target_merchant_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/pos/{targetMerchantId}/store', options)
          command.response_representation = Google::Apis::ContentV2::PosListResponse::Representation
          command.response_class = Google::Apis::ContentV2::PosListResponse
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
        # @param [Google::Apis::ContentV2::PosSaleRequest] pos_sale_request_object
        # @param [Boolean] dry_run
        #   Flag to simulate a request like in a live environment. If set to true, dry-run
        #   mode checks the validity of the request and returns errors (if any).
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
        # @yieldparam result [Google::Apis::ContentV2::PosSaleResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::PosSaleResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def sale_po(merchant_id, target_merchant_id, pos_sale_request_object = nil, dry_run: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/pos/{targetMerchantId}/sale', options)
          command.request_representation = Google::Apis::ContentV2::PosSaleRequest::Representation
          command.request_object = pos_sale_request_object
          command.response_representation = Google::Apis::ContentV2::PosSaleResponse::Representation
          command.response_class = Google::Apis::ContentV2::PosSaleResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['targetMerchantId'] = target_merchant_id unless target_merchant_id.nil?
          command.query['dryRun'] = dry_run unless dry_run.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves, inserts, and deletes multiple products in a single request.
        # @param [Google::Apis::ContentV2::BatchProductsRequest] batch_products_request_object
        # @param [Boolean] dry_run
        #   Flag to simulate a request like in a live environment. If set to true, dry-run
        #   mode checks the validity of the request and returns errors (if any).
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
        # @yieldparam result [Google::Apis::ContentV2::BatchProductsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::BatchProductsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_product(batch_products_request_object = nil, dry_run: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'products/batch', options)
          command.request_representation = Google::Apis::ContentV2::BatchProductsRequest::Representation
          command.request_object = batch_products_request_object
          command.response_representation = Google::Apis::ContentV2::BatchProductsResponse::Representation
          command.response_class = Google::Apis::ContentV2::BatchProductsResponse
          command.query['dryRun'] = dry_run unless dry_run.nil?
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
        # @param [Boolean] dry_run
        #   Flag to simulate a request like in a live environment. If set to true, dry-run
        #   mode checks the validity of the request and returns errors (if any).
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
        def delete_product(merchant_id, product_id, dry_run: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, '{merchantId}/products/{productId}', options)
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['productId'] = product_id unless product_id.nil?
          command.query['dryRun'] = dry_run unless dry_run.nil?
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
        # @yieldparam result [Google::Apis::ContentV2::Product] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::Product]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_product(merchant_id, product_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/products/{productId}', options)
          command.response_representation = Google::Apis::ContentV2::Product::Representation
          command.response_class = Google::Apis::ContentV2::Product
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
        # @param [Google::Apis::ContentV2::Product] product_object
        # @param [Boolean] dry_run
        #   Flag to simulate a request like in a live environment. If set to true, dry-run
        #   mode checks the validity of the request and returns errors (if any).
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
        # @yieldparam result [Google::Apis::ContentV2::Product] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::Product]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_product(merchant_id, product_object = nil, dry_run: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{merchantId}/products', options)
          command.request_representation = Google::Apis::ContentV2::Product::Representation
          command.request_object = product_object
          command.response_representation = Google::Apis::ContentV2::Product::Representation
          command.response_class = Google::Apis::ContentV2::Product
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.query['dryRun'] = dry_run unless dry_run.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the products in your Merchant Center account.
        # @param [Fixnum] merchant_id
        #   The ID of the account that contains the products. This account cannot be a
        #   multi-client account.
        # @param [Boolean] include_invalid_inserted_items
        #   Flag to include the invalid inserted items in the result of the list request.
        #   By default the invalid items are not shown (the default value is false).
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
        # @yieldparam result [Google::Apis::ContentV2::ListProductsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::ListProductsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_products(merchant_id, include_invalid_inserted_items: nil, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/products', options)
          command.response_representation = Google::Apis::ContentV2::ListProductsResponse::Representation
          command.response_class = Google::Apis::ContentV2::ListProductsResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.query['includeInvalidInsertedItems'] = include_invalid_inserted_items unless include_invalid_inserted_items.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the statuses of multiple products in a single request.
        # @param [Google::Apis::ContentV2::BatchProductStatusesRequest] batch_product_statuses_request_object
        # @param [Boolean] include_attributes
        #   Flag to include full product data in the results of this request. The default
        #   value is false.
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
        # @yieldparam result [Google::Apis::ContentV2::BatchProductStatusesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::BatchProductStatusesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_product_status(batch_product_statuses_request_object = nil, include_attributes: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'productstatuses/batch', options)
          command.request_representation = Google::Apis::ContentV2::BatchProductStatusesRequest::Representation
          command.request_object = batch_product_statuses_request_object
          command.response_representation = Google::Apis::ContentV2::BatchProductStatusesResponse::Representation
          command.response_class = Google::Apis::ContentV2::BatchProductStatusesResponse
          command.query['includeAttributes'] = include_attributes unless include_attributes.nil?
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
        # @param [Boolean] include_attributes
        #   Flag to include full product data in the result of this get request. The
        #   default value is false.
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
        # @yieldparam result [Google::Apis::ContentV2::ProductStatus] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::ProductStatus]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_product_status(merchant_id, product_id, destinations: nil, include_attributes: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/productstatuses/{productId}', options)
          command.response_representation = Google::Apis::ContentV2::ProductStatus::Representation
          command.response_class = Google::Apis::ContentV2::ProductStatus
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['productId'] = product_id unless product_id.nil?
          command.query['destinations'] = destinations unless destinations.nil?
          command.query['includeAttributes'] = include_attributes unless include_attributes.nil?
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
        # @param [Boolean] include_attributes
        #   Flag to include full product data in the results of the list request. The
        #   default value is false.
        # @param [Boolean] include_invalid_inserted_items
        #   Flag to include the invalid inserted items in the result of the list request.
        #   By default the invalid items are not shown (the default value is false).
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
        # @yieldparam result [Google::Apis::ContentV2::ListProductStatusesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::ListProductStatusesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_product_statuses(merchant_id, destinations: nil, include_attributes: nil, include_invalid_inserted_items: nil, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/productstatuses', options)
          command.response_representation = Google::Apis::ContentV2::ListProductStatusesResponse::Representation
          command.response_class = Google::Apis::ContentV2::ListProductStatusesResponse
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.query['destinations'] = destinations unless destinations.nil?
          command.query['includeAttributes'] = include_attributes unless include_attributes.nil?
          command.query['includeInvalidInsertedItems'] = include_invalid_inserted_items unless include_invalid_inserted_items.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves and updates the shipping settings of multiple accounts in a single
        # request.
        # @param [Google::Apis::ContentV2::ShippingsettingsCustomBatchRequest] shippingsettings_custom_batch_request_object
        # @param [Boolean] dry_run
        #   Flag to simulate a request like in a live environment. If set to true, dry-run
        #   mode checks the validity of the request and returns errors (if any).
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
        # @yieldparam result [Google::Apis::ContentV2::ShippingsettingsCustomBatchResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::ShippingsettingsCustomBatchResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def custombatch_shippingsetting(shippingsettings_custom_batch_request_object = nil, dry_run: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'shippingsettings/batch', options)
          command.request_representation = Google::Apis::ContentV2::ShippingsettingsCustomBatchRequest::Representation
          command.request_object = shippingsettings_custom_batch_request_object
          command.response_representation = Google::Apis::ContentV2::ShippingsettingsCustomBatchResponse::Representation
          command.response_class = Google::Apis::ContentV2::ShippingsettingsCustomBatchResponse
          command.query['dryRun'] = dry_run unless dry_run.nil?
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
        # @yieldparam result [Google::Apis::ContentV2::ShippingSettings] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::ShippingSettings]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_shippingsetting(merchant_id, account_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/shippingsettings/{accountId}', options)
          command.response_representation = Google::Apis::ContentV2::ShippingSettings::Representation
          command.response_class = Google::Apis::ContentV2::ShippingSettings
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
        # @yieldparam result [Google::Apis::ContentV2::ShippingsettingsGetSupportedCarriersResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::ShippingsettingsGetSupportedCarriersResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def getsupportedcarriers_shippingsetting(merchant_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/supportedCarriers', options)
          command.response_representation = Google::Apis::ContentV2::ShippingsettingsGetSupportedCarriersResponse::Representation
          command.response_class = Google::Apis::ContentV2::ShippingsettingsGetSupportedCarriersResponse
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
        # @yieldparam result [Google::Apis::ContentV2::ShippingsettingsGetSupportedHolidaysResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::ShippingsettingsGetSupportedHolidaysResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def getsupportedholidays_shippingsetting(merchant_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/supportedHolidays', options)
          command.response_representation = Google::Apis::ContentV2::ShippingsettingsGetSupportedHolidaysResponse::Representation
          command.response_class = Google::Apis::ContentV2::ShippingsettingsGetSupportedHolidaysResponse
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
        # @yieldparam result [Google::Apis::ContentV2::ShippingsettingsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::ShippingsettingsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_shippingsettings(merchant_id, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{merchantId}/shippingsettings', options)
          command.response_representation = Google::Apis::ContentV2::ShippingsettingsListResponse::Representation
          command.response_class = Google::Apis::ContentV2::ShippingsettingsListResponse
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
        # @param [Google::Apis::ContentV2::ShippingSettings] shipping_settings_object
        # @param [Boolean] dry_run
        #   Flag to simulate a request like in a live environment. If set to true, dry-run
        #   mode checks the validity of the request and returns errors (if any).
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
        # @yieldparam result [Google::Apis::ContentV2::ShippingSettings] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContentV2::ShippingSettings]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_shippingsetting(merchant_id, account_id, shipping_settings_object = nil, dry_run: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, '{merchantId}/shippingsettings/{accountId}', options)
          command.request_representation = Google::Apis::ContentV2::ShippingSettings::Representation
          command.request_object = shipping_settings_object
          command.response_representation = Google::Apis::ContentV2::ShippingSettings::Representation
          command.response_class = Google::Apis::ContentV2::ShippingSettings
          command.params['merchantId'] = merchant_id unless merchant_id.nil?
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['dryRun'] = dry_run unless dry_run.nil?
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
