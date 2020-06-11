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
    module AdexchangebuyerV1_4
      # Ad Exchange Buyer API
      #
      # Accesses your bidding-account information, submits creatives for validation,
      #  finds available direct deals, and retrieves performance reports.
      #
      # @example
      #    require 'google/apis/adexchangebuyer_v1_4'
      #
      #    Adexchangebuyer = Google::Apis::AdexchangebuyerV1_4 # Alias the module
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
          super('https://www.googleapis.com/', 'adexchangebuyer/v1.4/')
          @batch_path = 'batch/adexchangebuyer/v1.4'
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
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_4::Account] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_4::Account]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_account(id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'accounts/{id}', options)
          command.response_representation = Google::Apis::AdexchangebuyerV1_4::Account::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_4::Account
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
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_4::AccountsList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_4::AccountsList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_accounts(fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'accounts', options)
          command.response_representation = Google::Apis::AdexchangebuyerV1_4::AccountsList::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_4::AccountsList
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing account. This method supports patch semantics.
        # @param [Fixnum] id
        #   The account id
        # @param [Google::Apis::AdexchangebuyerV1_4::Account] account_object
        # @param [Boolean] confirm_unsafe_account_change
        #   Confirmation for erasing bidder and cookie matching urls.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_4::Account] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_4::Account]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_account(id, account_object = nil, confirm_unsafe_account_change: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'accounts/{id}', options)
          command.request_representation = Google::Apis::AdexchangebuyerV1_4::Account::Representation
          command.request_object = account_object
          command.response_representation = Google::Apis::AdexchangebuyerV1_4::Account::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_4::Account
          command.params['id'] = id unless id.nil?
          command.query['confirmUnsafeAccountChange'] = confirm_unsafe_account_change unless confirm_unsafe_account_change.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing account.
        # @param [Fixnum] id
        #   The account id
        # @param [Google::Apis::AdexchangebuyerV1_4::Account] account_object
        # @param [Boolean] confirm_unsafe_account_change
        #   Confirmation for erasing bidder and cookie matching urls.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_4::Account] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_4::Account]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_account(id, account_object = nil, confirm_unsafe_account_change: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'accounts/{id}', options)
          command.request_representation = Google::Apis::AdexchangebuyerV1_4::Account::Representation
          command.request_object = account_object
          command.response_representation = Google::Apis::AdexchangebuyerV1_4::Account::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_4::Account
          command.params['id'] = id unless id.nil?
          command.query['confirmUnsafeAccountChange'] = confirm_unsafe_account_change unless confirm_unsafe_account_change.nil?
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
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_4::BillingInfo] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_4::BillingInfo]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_billing_info(account_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'billinginfo/{accountId}', options)
          command.response_representation = Google::Apis::AdexchangebuyerV1_4::BillingInfo::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_4::BillingInfo
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
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_4::BillingInfoList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_4::BillingInfoList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_billing_infos(fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'billinginfo', options)
          command.response_representation = Google::Apis::AdexchangebuyerV1_4::BillingInfoList::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_4::BillingInfoList
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
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_4::Budget] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_4::Budget]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_budget(account_id, billing_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'billinginfo/{accountId}/{billingId}', options)
          command.response_representation = Google::Apis::AdexchangebuyerV1_4::Budget::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_4::Budget
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
        # @param [Google::Apis::AdexchangebuyerV1_4::Budget] budget_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_4::Budget] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_4::Budget]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_budget(account_id, billing_id, budget_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'billinginfo/{accountId}/{billingId}', options)
          command.request_representation = Google::Apis::AdexchangebuyerV1_4::Budget::Representation
          command.request_object = budget_object
          command.response_representation = Google::Apis::AdexchangebuyerV1_4::Budget::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_4::Budget
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
        # @param [Google::Apis::AdexchangebuyerV1_4::Budget] budget_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_4::Budget] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_4::Budget]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_budget(account_id, billing_id, budget_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'billinginfo/{accountId}/{billingId}', options)
          command.request_representation = Google::Apis::AdexchangebuyerV1_4::Budget::Representation
          command.request_object = budget_object
          command.response_representation = Google::Apis::AdexchangebuyerV1_4::Budget::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_4::Budget
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['billingId'] = billing_id unless billing_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Add a deal id association for the creative.
        # @param [Fixnum] account_id
        #   The id for the account that will serve this creative.
        # @param [String] buyer_creative_id
        #   The buyer-specific id for this creative.
        # @param [Fixnum] deal_id
        #   The id of the deal id to associate with this creative.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
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
        def add_creative_deal(account_id, buyer_creative_id, deal_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'creatives/{accountId}/{buyerCreativeId}/addDeal/{dealId}', options)
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['buyerCreativeId'] = buyer_creative_id unless buyer_creative_id.nil?
          command.params['dealId'] = deal_id unless deal_id.nil?
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
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_4::Creative] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_4::Creative]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_creative(account_id, buyer_creative_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'creatives/{accountId}/{buyerCreativeId}', options)
          command.response_representation = Google::Apis::AdexchangebuyerV1_4::Creative::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_4::Creative
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['buyerCreativeId'] = buyer_creative_id unless buyer_creative_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Submit a new creative.
        # @param [Google::Apis::AdexchangebuyerV1_4::Creative] creative_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_4::Creative] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_4::Creative]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_creative(creative_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'creatives', options)
          command.request_representation = Google::Apis::AdexchangebuyerV1_4::Creative::Representation
          command.request_object = creative_object
          command.response_representation = Google::Apis::AdexchangebuyerV1_4::Creative::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_4::Creative
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
        # @param [String] deals_status_filter
        #   When specified, only creatives having the given deals status are returned.
        # @param [Fixnum] max_results
        #   Maximum number of entries returned on one result page. If not set, the default
        #   is 100. Optional.
        # @param [String] open_auction_status_filter
        #   When specified, only creatives having the given open auction status are
        #   returned.
        # @param [String] page_token
        #   A continuation token, used to page through ad clients. To retrieve the next
        #   page, set this parameter to the value of "nextPageToken" from the previous
        #   response. Optional.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_4::CreativesList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_4::CreativesList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_creatives(account_id: nil, buyer_creative_id: nil, deals_status_filter: nil, max_results: nil, open_auction_status_filter: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'creatives', options)
          command.response_representation = Google::Apis::AdexchangebuyerV1_4::CreativesList::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_4::CreativesList
          command.query['accountId'] = account_id unless account_id.nil?
          command.query['buyerCreativeId'] = buyer_creative_id unless buyer_creative_id.nil?
          command.query['dealsStatusFilter'] = deals_status_filter unless deals_status_filter.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['openAuctionStatusFilter'] = open_auction_status_filter unless open_auction_status_filter.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the external deal ids associated with the creative.
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
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_4::CreativeDealIds] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_4::CreativeDealIds]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_creative_deals(account_id, buyer_creative_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'creatives/{accountId}/{buyerCreativeId}/listDeals', options)
          command.response_representation = Google::Apis::AdexchangebuyerV1_4::CreativeDealIds::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_4::CreativeDealIds
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['buyerCreativeId'] = buyer_creative_id unless buyer_creative_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Remove a deal id associated with the creative.
        # @param [Fixnum] account_id
        #   The id for the account that will serve this creative.
        # @param [String] buyer_creative_id
        #   The buyer-specific id for this creative.
        # @param [Fixnum] deal_id
        #   The id of the deal id to disassociate with this creative.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
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
        def remove_creative_deal(account_id, buyer_creative_id, deal_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'creatives/{accountId}/{buyerCreativeId}/removeDeal/{dealId}', options)
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['buyerCreativeId'] = buyer_creative_id unless buyer_creative_id.nil?
          command.params['dealId'] = deal_id unless deal_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Delete the specified deals from the proposal
        # @param [String] proposal_id
        #   The proposalId to delete deals from.
        # @param [Google::Apis::AdexchangebuyerV1_4::DeleteOrderDealsRequest] delete_order_deals_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_4::DeleteOrderDealsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_4::DeleteOrderDealsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_marketplacedeal_order_deals(proposal_id, delete_order_deals_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'proposals/{proposalId}/deals/delete', options)
          command.request_representation = Google::Apis::AdexchangebuyerV1_4::DeleteOrderDealsRequest::Representation
          command.request_object = delete_order_deals_request_object
          command.response_representation = Google::Apis::AdexchangebuyerV1_4::DeleteOrderDealsResponse::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_4::DeleteOrderDealsResponse
          command.params['proposalId'] = proposal_id unless proposal_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Add new deals for the specified proposal
        # @param [String] proposal_id
        #   proposalId for which deals need to be added.
        # @param [Google::Apis::AdexchangebuyerV1_4::AddOrderDealsRequest] add_order_deals_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_4::AddOrderDealsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_4::AddOrderDealsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_marketplacedeal(proposal_id, add_order_deals_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'proposals/{proposalId}/deals/insert', options)
          command.request_representation = Google::Apis::AdexchangebuyerV1_4::AddOrderDealsRequest::Representation
          command.request_object = add_order_deals_request_object
          command.response_representation = Google::Apis::AdexchangebuyerV1_4::AddOrderDealsResponse::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_4::AddOrderDealsResponse
          command.params['proposalId'] = proposal_id unless proposal_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all the deals for a given proposal
        # @param [String] proposal_id
        #   The proposalId to get deals for. To search across all proposals specify
        #   order_id = '-' as part of the URL.
        # @param [String] pql_query
        #   Query string to retrieve specific deals.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_4::GetOrderDealsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_4::GetOrderDealsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_marketplacedeals(proposal_id, pql_query: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'proposals/{proposalId}/deals', options)
          command.response_representation = Google::Apis::AdexchangebuyerV1_4::GetOrderDealsResponse::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_4::GetOrderDealsResponse
          command.params['proposalId'] = proposal_id unless proposal_id.nil?
          command.query['pqlQuery'] = pql_query unless pql_query.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Replaces all the deals in the proposal with the passed in deals
        # @param [String] proposal_id
        #   The proposalId to edit deals on.
        # @param [Google::Apis::AdexchangebuyerV1_4::EditAllOrderDealsRequest] edit_all_order_deals_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_4::EditAllOrderDealsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_4::EditAllOrderDealsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_marketplacedeal(proposal_id, edit_all_order_deals_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'proposals/{proposalId}/deals/update', options)
          command.request_representation = Google::Apis::AdexchangebuyerV1_4::EditAllOrderDealsRequest::Representation
          command.request_object = edit_all_order_deals_request_object
          command.response_representation = Google::Apis::AdexchangebuyerV1_4::EditAllOrderDealsResponse::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_4::EditAllOrderDealsResponse
          command.params['proposalId'] = proposal_id unless proposal_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Add notes to the proposal
        # @param [String] proposal_id
        #   The proposalId to add notes for.
        # @param [Google::Apis::AdexchangebuyerV1_4::AddOrderNotesRequest] add_order_notes_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_4::AddOrderNotesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_4::AddOrderNotesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_marketplacenote(proposal_id, add_order_notes_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'proposals/{proposalId}/notes/insert', options)
          command.request_representation = Google::Apis::AdexchangebuyerV1_4::AddOrderNotesRequest::Representation
          command.request_object = add_order_notes_request_object
          command.response_representation = Google::Apis::AdexchangebuyerV1_4::AddOrderNotesResponse::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_4::AddOrderNotesResponse
          command.params['proposalId'] = proposal_id unless proposal_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get all the notes associated with a proposal
        # @param [String] proposal_id
        #   The proposalId to get notes for. To search across all proposals specify
        #   order_id = '-' as part of the URL.
        # @param [String] pql_query
        #   Query string to retrieve specific notes. To search the text contents of notes,
        #   please use syntax like "WHERE note.note = "foo" or "WHERE note.note LIKE "%bar%
        #   "
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_4::GetOrderNotesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_4::GetOrderNotesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_marketplacenotes(proposal_id, pql_query: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'proposals/{proposalId}/notes', options)
          command.response_representation = Google::Apis::AdexchangebuyerV1_4::GetOrderNotesResponse::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_4::GetOrderNotesResponse
          command.params['proposalId'] = proposal_id unless proposal_id.nil?
          command.query['pqlQuery'] = pql_query unless pql_query.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update a given private auction proposal
        # @param [String] private_auction_id
        #   The private auction id to be updated.
        # @param [Google::Apis::AdexchangebuyerV1_4::UpdatePrivateAuctionProposalRequest] update_private_auction_proposal_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
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
        def update_marketplace_private_auction_proposal(private_auction_id, update_private_auction_proposal_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'privateauction/{privateAuctionId}/updateproposal', options)
          command.request_representation = Google::Apis::AdexchangebuyerV1_4::UpdatePrivateAuctionProposalRequest::Representation
          command.request_object = update_private_auction_proposal_request_object
          command.params['privateAuctionId'] = private_auction_id unless private_auction_id.nil?
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
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_4::PerformanceReportList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_4::PerformanceReportList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_performance_reports(account_id, end_date_time, start_date_time, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'performancereport', options)
          command.response_representation = Google::Apis::AdexchangebuyerV1_4::PerformanceReportList::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_4::PerformanceReportList
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
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_4::PretargetingConfig] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_4::PretargetingConfig]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_pretargeting_config(account_id, config_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'pretargetingconfigs/{accountId}/{configId}', options)
          command.response_representation = Google::Apis::AdexchangebuyerV1_4::PretargetingConfig::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_4::PretargetingConfig
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
        # @param [Google::Apis::AdexchangebuyerV1_4::PretargetingConfig] pretargeting_config_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_4::PretargetingConfig] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_4::PretargetingConfig]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_pretargeting_config(account_id, pretargeting_config_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'pretargetingconfigs/{accountId}', options)
          command.request_representation = Google::Apis::AdexchangebuyerV1_4::PretargetingConfig::Representation
          command.request_object = pretargeting_config_object
          command.response_representation = Google::Apis::AdexchangebuyerV1_4::PretargetingConfig::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_4::PretargetingConfig
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
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_4::PretargetingConfigList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_4::PretargetingConfigList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_pretargeting_configs(account_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'pretargetingconfigs/{accountId}', options)
          command.response_representation = Google::Apis::AdexchangebuyerV1_4::PretargetingConfigList::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_4::PretargetingConfigList
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
        # @param [Google::Apis::AdexchangebuyerV1_4::PretargetingConfig] pretargeting_config_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_4::PretargetingConfig] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_4::PretargetingConfig]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_pretargeting_config(account_id, config_id, pretargeting_config_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'pretargetingconfigs/{accountId}/{configId}', options)
          command.request_representation = Google::Apis::AdexchangebuyerV1_4::PretargetingConfig::Representation
          command.request_object = pretargeting_config_object
          command.response_representation = Google::Apis::AdexchangebuyerV1_4::PretargetingConfig::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_4::PretargetingConfig
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
        # @param [Google::Apis::AdexchangebuyerV1_4::PretargetingConfig] pretargeting_config_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_4::PretargetingConfig] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_4::PretargetingConfig]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_pretargeting_config(account_id, config_id, pretargeting_config_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'pretargetingconfigs/{accountId}/{configId}', options)
          command.request_representation = Google::Apis::AdexchangebuyerV1_4::PretargetingConfig::Representation
          command.request_object = pretargeting_config_object
          command.response_representation = Google::Apis::AdexchangebuyerV1_4::PretargetingConfig::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_4::PretargetingConfig
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['configId'] = config_id unless config_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the requested product by id.
        # @param [String] product_id
        #   The id for the product to get the head revision for.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_4::Product] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_4::Product]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_product(product_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'products/{productId}', options)
          command.response_representation = Google::Apis::AdexchangebuyerV1_4::Product::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_4::Product
          command.params['productId'] = product_id unless product_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the requested product.
        # @param [String] pql_query
        #   The pql query used to query for products.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_4::GetOffersResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_4::GetOffersResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def search_products(pql_query: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'products/search', options)
          command.response_representation = Google::Apis::AdexchangebuyerV1_4::GetOffersResponse::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_4::GetOffersResponse
          command.query['pqlQuery'] = pql_query unless pql_query.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get a proposal given its id
        # @param [String] proposal_id
        #   Id of the proposal to retrieve.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_4::Proposal] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_4::Proposal]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_proposal(proposal_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'proposals/{proposalId}', options)
          command.response_representation = Google::Apis::AdexchangebuyerV1_4::Proposal::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_4::Proposal
          command.params['proposalId'] = proposal_id unless proposal_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Create the given list of proposals
        # @param [Google::Apis::AdexchangebuyerV1_4::CreateOrdersRequest] create_orders_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_4::CreateOrdersResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_4::CreateOrdersResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_proposal(create_orders_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'proposals/insert', options)
          command.request_representation = Google::Apis::AdexchangebuyerV1_4::CreateOrdersRequest::Representation
          command.request_object = create_orders_request_object
          command.response_representation = Google::Apis::AdexchangebuyerV1_4::CreateOrdersResponse::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_4::CreateOrdersResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update the given proposal. This method supports patch semantics.
        # @param [String] proposal_id
        #   The proposal id to update.
        # @param [Fixnum] revision_number
        #   The last known revision number to update. If the head revision in the
        #   marketplace database has since changed, an error will be thrown. The caller
        #   should then fetch the latest proposal at head revision and retry the update at
        #   that revision.
        # @param [String] update_action
        #   The proposed action to take on the proposal. This field is required and it
        #   must be set when updating a proposal.
        # @param [Google::Apis::AdexchangebuyerV1_4::Proposal] proposal_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_4::Proposal] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_4::Proposal]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_proposal(proposal_id, revision_number, update_action, proposal_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'proposals/{proposalId}/{revisionNumber}/{updateAction}', options)
          command.request_representation = Google::Apis::AdexchangebuyerV1_4::Proposal::Representation
          command.request_object = proposal_object
          command.response_representation = Google::Apis::AdexchangebuyerV1_4::Proposal::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_4::Proposal
          command.params['proposalId'] = proposal_id unless proposal_id.nil?
          command.params['revisionNumber'] = revision_number unless revision_number.nil?
          command.params['updateAction'] = update_action unless update_action.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Search for proposals using pql query
        # @param [String] pql_query
        #   Query string to retrieve specific proposals.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_4::GetOrdersResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_4::GetOrdersResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def search_proposals(pql_query: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'proposals/search', options)
          command.response_representation = Google::Apis::AdexchangebuyerV1_4::GetOrdersResponse::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_4::GetOrdersResponse
          command.query['pqlQuery'] = pql_query unless pql_query.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update the given proposal to indicate that setup has been completed.
        # @param [String] proposal_id
        #   The proposal id for which the setup is complete
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
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
        def proposal_setup_complete(proposal_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'proposals/{proposalId}/setupcomplete', options)
          command.params['proposalId'] = proposal_id unless proposal_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update the given proposal
        # @param [String] proposal_id
        #   The proposal id to update.
        # @param [Fixnum] revision_number
        #   The last known revision number to update. If the head revision in the
        #   marketplace database has since changed, an error will be thrown. The caller
        #   should then fetch the latest proposal at head revision and retry the update at
        #   that revision.
        # @param [String] update_action
        #   The proposed action to take on the proposal. This field is required and it
        #   must be set when updating a proposal.
        # @param [Google::Apis::AdexchangebuyerV1_4::Proposal] proposal_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_4::Proposal] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_4::Proposal]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_proposal(proposal_id, revision_number, update_action, proposal_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'proposals/{proposalId}/{revisionNumber}/{updateAction}', options)
          command.request_representation = Google::Apis::AdexchangebuyerV1_4::Proposal::Representation
          command.request_object = proposal_object
          command.response_representation = Google::Apis::AdexchangebuyerV1_4::Proposal::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_4::Proposal
          command.params['proposalId'] = proposal_id unless proposal_id.nil?
          command.params['revisionNumber'] = revision_number unless revision_number.nil?
          command.params['updateAction'] = update_action unless update_action.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the requested publisher profile(s) by publisher accountId.
        # @param [Fixnum] account_id
        #   The accountId of the publisher to get profiles for.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdexchangebuyerV1_4::GetPublisherProfilesByAccountIdResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdexchangebuyerV1_4::GetPublisherProfilesByAccountIdResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_pub_profiles(account_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'publisher/{accountId}/profiles', options)
          command.response_representation = Google::Apis::AdexchangebuyerV1_4::GetPublisherProfilesByAccountIdResponse::Representation
          command.response_class = Google::Apis::AdexchangebuyerV1_4::GetPublisherProfilesByAccountIdResponse
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
