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
    module AdexchangebuyerV1_3
      # Ad Exchange Buyer API
      #
      # Accesses your bidding-account information, submits creatives for validation,
      #  finds available direct deals, and retrieves performance reports.
      #
      # @example
      #    require 'google/apis/adexchangebuyer_v1_3'
      #
      #    Adexchangebuyer = Google::Apis::AdexchangebuyerV1_3 # Alias the module
      #    service = Adexchangebuyer::AdExchangeBuyerService.new
      #
      # @see https://developers.google.com/ad-exchange/buyer-rest
      class AdExchangeBuyerService < Google::Apis::Core::BaseService
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
          super('https://www.googleapis.com/', 'adexchangebuyer/v1.3/')
          @batch_path = 'batch/adexchangebuyer/v1.3'
        end
        
        # Gets one account by ID.
        # @param [Fixnum] id
        #   The account id
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_3::Account] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_3::Account]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_account(id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'accounts/{id}', options)
          command.response_representation = Google::Apis::AdexchangebuyerV1_3::Account::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_3::Account
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the authenticated user's list of accounts.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_3::AccountsList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_3::AccountsList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_accounts(fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'accounts', options)
          command.response_representation = Google::Apis::AdexchangebuyerV1_3::AccountsList::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_3::AccountsList
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing account. This method supports patch semantics.
        # @param [Fixnum] id
        #   The account id
        # @param [Google::Apis::AdexchangebuyerV1_3::Account] account_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_3::Account] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_3::Account]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_account(id, account_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'accounts/{id}', options)
          command.request_representation = Google::Apis::AdexchangebuyerV1_3::Account::Representation
          command.request_object = account_object
          command.response_representation = Google::Apis::AdexchangebuyerV1_3::Account::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_3::Account
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing account.
        # @param [Fixnum] id
        #   The account id
        # @param [Google::Apis::AdexchangebuyerV1_3::Account] account_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_3::Account] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_3::Account]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_account(id, account_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'accounts/{id}', options)
          command.request_representation = Google::Apis::AdexchangebuyerV1_3::Account::Representation
          command.request_object = account_object
          command.response_representation = Google::Apis::AdexchangebuyerV1_3::Account::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_3::Account
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the billing information for one account specified by account ID.
        # @param [Fixnum] account_id
        #   The account id.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_3::BillingInfo] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_3::BillingInfo]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_billing_info(account_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'billinginfo/{accountId}', options)
          command.response_representation = Google::Apis::AdexchangebuyerV1_3::BillingInfo::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_3::BillingInfo
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of billing information for all accounts of the authenticated
        # user.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_3::BillingInfoList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_3::BillingInfoList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_billing_infos(fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'billinginfo', options)
          command.response_representation = Google::Apis::AdexchangebuyerV1_3::BillingInfoList::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_3::BillingInfoList
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the budget information for the adgroup specified by the accountId and
        # billingId.
        # @param [Fixnum] account_id
        #   The account id to get the budget information for.
        # @param [Fixnum] billing_id
        #   The billing id to get the budget information for.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_3::Budget] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_3::Budget]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_budget(account_id, billing_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'billinginfo/{accountId}/{billingId}', options)
          command.response_representation = Google::Apis::AdexchangebuyerV1_3::Budget::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_3::Budget
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['billingId'] = billing_id unless billing_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the budget amount for the budget of the adgroup specified by the
        # accountId and billingId, with the budget amount in the request. This method
        # supports patch semantics.
        # @param [Fixnum] account_id
        #   The account id associated with the budget being updated.
        # @param [Fixnum] billing_id
        #   The billing id associated with the budget being updated.
        # @param [Google::Apis::AdexchangebuyerV1_3::Budget] budget_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_3::Budget] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_3::Budget]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_budget(account_id, billing_id, budget_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'billinginfo/{accountId}/{billingId}', options)
          command.request_representation = Google::Apis::AdexchangebuyerV1_3::Budget::Representation
          command.request_object = budget_object
          command.response_representation = Google::Apis::AdexchangebuyerV1_3::Budget::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_3::Budget
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['billingId'] = billing_id unless billing_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the budget amount for the budget of the adgroup specified by the
        # accountId and billingId, with the budget amount in the request.
        # @param [Fixnum] account_id
        #   The account id associated with the budget being updated.
        # @param [Fixnum] billing_id
        #   The billing id associated with the budget being updated.
        # @param [Google::Apis::AdexchangebuyerV1_3::Budget] budget_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_3::Budget] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_3::Budget]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_budget(account_id, billing_id, budget_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'billinginfo/{accountId}/{billingId}', options)
          command.request_representation = Google::Apis::AdexchangebuyerV1_3::Budget::Representation
          command.request_object = budget_object
          command.response_representation = Google::Apis::AdexchangebuyerV1_3::Budget::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_3::Budget
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['billingId'] = billing_id unless billing_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the status for a single creative. A creative will be available 30-40
        # minutes after submission.
        # @param [Fixnum] account_id
        #   The id for the account that will serve this creative.
        # @param [String] buyer_creative_id
        #   The buyer-specific id for this creative.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_3::Creative] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_3::Creative]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_creative(account_id, buyer_creative_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'creatives/{accountId}/{buyerCreativeId}', options)
          command.response_representation = Google::Apis::AdexchangebuyerV1_3::Creative::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_3::Creative
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['buyerCreativeId'] = buyer_creative_id unless buyer_creative_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Submit a new creative.
        # @param [Google::Apis::AdexchangebuyerV1_3::Creative] creative_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_3::Creative] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_3::Creative]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_creative(creative_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'creatives', options)
          command.request_representation = Google::Apis::AdexchangebuyerV1_3::Creative::Representation
          command.request_object = creative_object
          command.response_representation = Google::Apis::AdexchangebuyerV1_3::Creative::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_3::Creative
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of the authenticated user's active creatives. A creative will
        # be available 30-40 minutes after submission.
        # @param [Array<Fixnum>, Fixnum] account_id
        #   When specified, only creatives for the given account ids are returned.
        # @param [Array<String>, String] buyer_creative_id
        #   When specified, only creatives for the given buyer creative ids are returned.
        # @param [Fixnum] max_results
        #   Maximum number of entries returned on one result page. If not set, the default
        #   is 100. Optional.
        # @param [String] page_token
        #   A continuation token, used to page through ad clients. To retrieve the next
        #   page, set this parameter to the value of "nextPageToken" from the previous
        #   response. Optional.
        # @param [String] status_filter
        #   When specified, only creatives having the given status are returned.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_3::CreativesList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_3::CreativesList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_creatives(account_id: nil, buyer_creative_id: nil, max_results: nil, page_token: nil, status_filter: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'creatives', options)
          command.response_representation = Google::Apis::AdexchangebuyerV1_3::CreativesList::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_3::CreativesList
          command.query['accountId'] = account_id unless account_id.nil?
          command.query['buyerCreativeId'] = buyer_creative_id unless buyer_creative_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['statusFilter'] = status_filter unless status_filter.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one direct deal by ID.
        # @param [Fixnum] id
        #   The direct deal id
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_3::DirectDeal] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_3::DirectDeal]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_direct_deal(id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'directdeals/{id}', options)
          command.response_representation = Google::Apis::AdexchangebuyerV1_3::DirectDeal::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_3::DirectDeal
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the authenticated user's list of direct deals.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_3::DirectDealsList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_3::DirectDealsList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_direct_deals(fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'directdeals', options)
          command.response_representation = Google::Apis::AdexchangebuyerV1_3::DirectDealsList::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_3::DirectDealsList
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the authenticated user's list of performance metrics.
        # @param [Fixnum] account_id
        #   The account id to get the reports.
        # @param [String] end_date_time
        #   The end time of the report in ISO 8601 timestamp format using UTC.
        # @param [String] start_date_time
        #   The start time of the report in ISO 8601 timestamp format using UTC.
        # @param [Fixnum] max_results
        #   Maximum number of entries returned on one result page. If not set, the default
        #   is 100. Optional.
        # @param [String] page_token
        #   A continuation token, used to page through performance reports. To retrieve
        #   the next page, set this parameter to the value of "nextPageToken" from the
        #   previous response. Optional.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_3::PerformanceReportList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_3::PerformanceReportList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_performance_reports(account_id, end_date_time, start_date_time, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'performancereport', options)
          command.response_representation = Google::Apis::AdexchangebuyerV1_3::PerformanceReportList::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_3::PerformanceReportList
          command.query['accountId'] = account_id unless account_id.nil?
          command.query['endDateTime'] = end_date_time unless end_date_time.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['startDateTime'] = start_date_time unless start_date_time.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes an existing pretargeting config.
        # @param [Fixnum] account_id
        #   The account id to delete the pretargeting config for.
        # @param [Fixnum] config_id
        #   The specific id of the configuration to delete.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
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
        def delete_pretargeting_config(account_id, config_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'pretargetingconfigs/{accountId}/{configId}', options)
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['configId'] = config_id unless config_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a specific pretargeting configuration
        # @param [Fixnum] account_id
        #   The account id to get the pretargeting config for.
        # @param [Fixnum] config_id
        #   The specific id of the configuration to retrieve.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_3::PretargetingConfig] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_3::PretargetingConfig]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_pretargeting_config(account_id, config_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'pretargetingconfigs/{accountId}/{configId}', options)
          command.response_representation = Google::Apis::AdexchangebuyerV1_3::PretargetingConfig::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_3::PretargetingConfig
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['configId'] = config_id unless config_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a new pretargeting configuration.
        # @param [Fixnum] account_id
        #   The account id to insert the pretargeting config for.
        # @param [Google::Apis::AdexchangebuyerV1_3::PretargetingConfig] pretargeting_config_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_3::PretargetingConfig] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_3::PretargetingConfig]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_pretargeting_config(account_id, pretargeting_config_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'pretargetingconfigs/{accountId}', options)
          command.request_representation = Google::Apis::AdexchangebuyerV1_3::PretargetingConfig::Representation
          command.request_object = pretargeting_config_object
          command.response_representation = Google::Apis::AdexchangebuyerV1_3::PretargetingConfig::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_3::PretargetingConfig
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of the authenticated user's pretargeting configurations.
        # @param [Fixnum] account_id
        #   The account id to get the pretargeting configs for.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_3::PretargetingConfigList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_3::PretargetingConfigList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_pretargeting_configs(account_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'pretargetingconfigs/{accountId}', options)
          command.response_representation = Google::Apis::AdexchangebuyerV1_3::PretargetingConfigList::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_3::PretargetingConfigList
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing pretargeting config. This method supports patch semantics.
        # @param [Fixnum] account_id
        #   The account id to update the pretargeting config for.
        # @param [Fixnum] config_id
        #   The specific id of the configuration to update.
        # @param [Google::Apis::AdexchangebuyerV1_3::PretargetingConfig] pretargeting_config_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_3::PretargetingConfig] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_3::PretargetingConfig]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_pretargeting_config(account_id, config_id, pretargeting_config_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'pretargetingconfigs/{accountId}/{configId}', options)
          command.request_representation = Google::Apis::AdexchangebuyerV1_3::PretargetingConfig::Representation
          command.request_object = pretargeting_config_object
          command.response_representation = Google::Apis::AdexchangebuyerV1_3::PretargetingConfig::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_3::PretargetingConfig
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['configId'] = config_id unless config_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing pretargeting config.
        # @param [Fixnum] account_id
        #   The account id to update the pretargeting config for.
        # @param [Fixnum] config_id
        #   The specific id of the configuration to update.
        # @param [Google::Apis::AdexchangebuyerV1_3::PretargetingConfig] pretargeting_config_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_3::PretargetingConfig] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_3::PretargetingConfig]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_pretargeting_config(account_id, config_id, pretargeting_config_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'pretargetingconfigs/{accountId}/{configId}', options)
          command.request_representation = Google::Apis::AdexchangebuyerV1_3::PretargetingConfig::Representation
          command.request_object = pretargeting_config_object
          command.response_representation = Google::Apis::AdexchangebuyerV1_3::PretargetingConfig::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_3::PretargetingConfig
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['configId'] = config_id unless config_id.nil?
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
