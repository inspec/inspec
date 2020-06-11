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
    module ResellerV1
      # Enterprise Apps Reseller API
      #
      # Creates and manages your customers and their subscriptions.
      #
      # @example
      #    require 'google/apis/reseller_v1'
      #
      #    Reseller = Google::Apis::ResellerV1 # Alias the module
      #    service = Reseller::ResellerService.new
      #
      # @see https://developers.google.com/google-apps/reseller/
      class ResellerService < Google::Apis::Core::BaseService
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
          super('https://www.googleapis.com/', 'apps/reseller/v1/')
          @batch_path = 'batch/reseller/v1'
        end
        
        # Get a customer account.
        # @param [String] customer_id
        #   Either the customer's primary domain name or the customer's unique identifier.
        #   If using the domain name, we do not recommend using a customerId as a key for
        #   persistent data. If the domain name for a customerId is changed, the Google
        #   system automatically updates.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ResellerV1::Customer] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ResellerV1::Customer]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_customer(customer_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'customers/{customerId}', options)
          command.response_representation = Google::Apis::ResellerV1::Customer::Representation
          command.response_class = Google::Apis::ResellerV1::Customer
          command.params['customerId'] = customer_id unless customer_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Order a new customer's account.
        # @param [Google::Apis::ResellerV1::Customer] customer_object
        # @param [String] customer_auth_token
        #   The customerAuthToken query string is required when creating a resold account
        #   that transfers a direct customer's subscription or transfers another reseller
        #   customer's subscription to your reseller management. This is a hexadecimal
        #   authentication token needed to complete the subscription transfer. For more
        #   information, see the administrator help center.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ResellerV1::Customer] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ResellerV1::Customer]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_customer(customer_object = nil, customer_auth_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'customers', options)
          command.request_representation = Google::Apis::ResellerV1::Customer::Representation
          command.request_object = customer_object
          command.response_representation = Google::Apis::ResellerV1::Customer::Representation
          command.response_class = Google::Apis::ResellerV1::Customer
          command.query['customerAuthToken'] = customer_auth_token unless customer_auth_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update a customer account's settings. This method supports patch semantics.
        # @param [String] customer_id
        #   Either the customer's primary domain name or the customer's unique identifier.
        #   If using the domain name, we do not recommend using a customerId as a key for
        #   persistent data. If the domain name for a customerId is changed, the Google
        #   system automatically updates.
        # @param [Google::Apis::ResellerV1::Customer] customer_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ResellerV1::Customer] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ResellerV1::Customer]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_customer(customer_id, customer_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'customers/{customerId}', options)
          command.request_representation = Google::Apis::ResellerV1::Customer::Representation
          command.request_object = customer_object
          command.response_representation = Google::Apis::ResellerV1::Customer::Representation
          command.response_class = Google::Apis::ResellerV1::Customer
          command.params['customerId'] = customer_id unless customer_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update a customer account's settings.
        # @param [String] customer_id
        #   Either the customer's primary domain name or the customer's unique identifier.
        #   If using the domain name, we do not recommend using a customerId as a key for
        #   persistent data. If the domain name for a customerId is changed, the Google
        #   system automatically updates.
        # @param [Google::Apis::ResellerV1::Customer] customer_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ResellerV1::Customer] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ResellerV1::Customer]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_customer(customer_id, customer_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'customers/{customerId}', options)
          command.request_representation = Google::Apis::ResellerV1::Customer::Representation
          command.request_object = customer_object
          command.response_representation = Google::Apis::ResellerV1::Customer::Representation
          command.response_class = Google::Apis::ResellerV1::Customer
          command.params['customerId'] = customer_id unless customer_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns all the details of the watch corresponding to the reseller.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ResellerV1::ResellernotifyGetwatchdetailsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ResellerV1::ResellernotifyGetwatchdetailsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def getwatchdetails_resellernotify(fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'resellernotify/getwatchdetails', options)
          command.response_representation = Google::Apis::ResellerV1::ResellernotifyGetwatchdetailsResponse::Representation
          command.response_class = Google::Apis::ResellerV1::ResellernotifyGetwatchdetailsResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Registers a Reseller for receiving notifications.
        # @param [String] service_account_email_address
        #   The service account which will own the created Cloud-PubSub topic.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ResellerV1::ResellernotifyResource] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ResellerV1::ResellernotifyResource]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def register_resellernotify(service_account_email_address: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'resellernotify/register', options)
          command.response_representation = Google::Apis::ResellerV1::ResellernotifyResource::Representation
          command.response_class = Google::Apis::ResellerV1::ResellernotifyResource
          command.query['serviceAccountEmailAddress'] = service_account_email_address unless service_account_email_address.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Unregisters a Reseller for receiving notifications.
        # @param [String] service_account_email_address
        #   The service account which owns the Cloud-PubSub topic.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ResellerV1::ResellernotifyResource] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ResellerV1::ResellernotifyResource]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def unregister_resellernotify(service_account_email_address: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'resellernotify/unregister', options)
          command.response_representation = Google::Apis::ResellerV1::ResellernotifyResource::Representation
          command.response_class = Google::Apis::ResellerV1::ResellernotifyResource
          command.query['serviceAccountEmailAddress'] = service_account_email_address unless service_account_email_address.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Activates a subscription previously suspended by the reseller
        # @param [String] customer_id
        #   Either the customer's primary domain name or the customer's unique identifier.
        #   If using the domain name, we do not recommend using a customerId as a key for
        #   persistent data. If the domain name for a customerId is changed, the Google
        #   system automatically updates.
        # @param [String] subscription_id
        #   This is a required property. The subscriptionId is the subscription identifier
        #   and is unique for each customer. Since a subscriptionId changes when a
        #   subscription is updated, we recommend to not use this ID as a key for
        #   persistent data. And the subscriptionId can be found using the retrieve all
        #   reseller subscriptions method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ResellerV1::Subscription] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ResellerV1::Subscription]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def activate_subscription(customer_id, subscription_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'customers/{customerId}/subscriptions/{subscriptionId}/activate', options)
          command.response_representation = Google::Apis::ResellerV1::Subscription::Representation
          command.response_class = Google::Apis::ResellerV1::Subscription
          command.params['customerId'] = customer_id unless customer_id.nil?
          command.params['subscriptionId'] = subscription_id unless subscription_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update a subscription plan. Use this method to update a plan for a 30-day
        # trial or a flexible plan subscription to an annual commitment plan with
        # monthly or yearly payments.
        # @param [String] customer_id
        #   Either the customer's primary domain name or the customer's unique identifier.
        #   If using the domain name, we do not recommend using a customerId as a key for
        #   persistent data. If the domain name for a customerId is changed, the Google
        #   system automatically updates.
        # @param [String] subscription_id
        #   This is a required property. The subscriptionId is the subscription identifier
        #   and is unique for each customer. Since a subscriptionId changes when a
        #   subscription is updated, we recommend to not use this ID as a key for
        #   persistent data. And the subscriptionId can be found using the retrieve all
        #   reseller subscriptions method.
        # @param [Google::Apis::ResellerV1::ChangePlanRequest] change_plan_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ResellerV1::Subscription] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ResellerV1::Subscription]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def change_subscription_plan(customer_id, subscription_id, change_plan_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'customers/{customerId}/subscriptions/{subscriptionId}/changePlan', options)
          command.request_representation = Google::Apis::ResellerV1::ChangePlanRequest::Representation
          command.request_object = change_plan_request_object
          command.response_representation = Google::Apis::ResellerV1::Subscription::Representation
          command.response_class = Google::Apis::ResellerV1::Subscription
          command.params['customerId'] = customer_id unless customer_id.nil?
          command.params['subscriptionId'] = subscription_id unless subscription_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update a user license's renewal settings. This is applicable for accounts with
        # annual commitment plans only.
        # @param [String] customer_id
        #   Either the customer's primary domain name or the customer's unique identifier.
        #   If using the domain name, we do not recommend using a customerId as a key for
        #   persistent data. If the domain name for a customerId is changed, the Google
        #   system automatically updates.
        # @param [String] subscription_id
        #   This is a required property. The subscriptionId is the subscription identifier
        #   and is unique for each customer. Since a subscriptionId changes when a
        #   subscription is updated, we recommend to not use this ID as a key for
        #   persistent data. And the subscriptionId can be found using the retrieve all
        #   reseller subscriptions method.
        # @param [Google::Apis::ResellerV1::RenewalSettings] renewal_settings_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ResellerV1::Subscription] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ResellerV1::Subscription]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def change_subscription_renewal_settings(customer_id, subscription_id, renewal_settings_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'customers/{customerId}/subscriptions/{subscriptionId}/changeRenewalSettings', options)
          command.request_representation = Google::Apis::ResellerV1::RenewalSettings::Representation
          command.request_object = renewal_settings_object
          command.response_representation = Google::Apis::ResellerV1::Subscription::Representation
          command.response_class = Google::Apis::ResellerV1::Subscription
          command.params['customerId'] = customer_id unless customer_id.nil?
          command.params['subscriptionId'] = subscription_id unless subscription_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update a subscription's user license settings.
        # @param [String] customer_id
        #   Either the customer's primary domain name or the customer's unique identifier.
        #   If using the domain name, we do not recommend using a customerId as a key for
        #   persistent data. If the domain name for a customerId is changed, the Google
        #   system automatically updates.
        # @param [String] subscription_id
        #   This is a required property. The subscriptionId is the subscription identifier
        #   and is unique for each customer. Since a subscriptionId changes when a
        #   subscription is updated, we recommend to not use this ID as a key for
        #   persistent data. And the subscriptionId can be found using the retrieve all
        #   reseller subscriptions method.
        # @param [Google::Apis::ResellerV1::Seats] seats_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ResellerV1::Subscription] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ResellerV1::Subscription]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def change_subscription_seats(customer_id, subscription_id, seats_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'customers/{customerId}/subscriptions/{subscriptionId}/changeSeats', options)
          command.request_representation = Google::Apis::ResellerV1::Seats::Representation
          command.request_object = seats_object
          command.response_representation = Google::Apis::ResellerV1::Subscription::Representation
          command.response_class = Google::Apis::ResellerV1::Subscription
          command.params['customerId'] = customer_id unless customer_id.nil?
          command.params['subscriptionId'] = subscription_id unless subscription_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Cancel, suspend, or transfer a subscription to direct.
        # @param [String] customer_id
        #   Either the customer's primary domain name or the customer's unique identifier.
        #   If using the domain name, we do not recommend using a customerId as a key for
        #   persistent data. If the domain name for a customerId is changed, the Google
        #   system automatically updates.
        # @param [String] subscription_id
        #   This is a required property. The subscriptionId is the subscription identifier
        #   and is unique for each customer. Since a subscriptionId changes when a
        #   subscription is updated, we recommend to not use this ID as a key for
        #   persistent data. And the subscriptionId can be found using the retrieve all
        #   reseller subscriptions method.
        # @param [String] deletion_type
        #   The deletionType query string enables the cancellation, downgrade, or
        #   suspension of a subscription.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
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
        def delete_subscription(customer_id, subscription_id, deletion_type, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'customers/{customerId}/subscriptions/{subscriptionId}', options)
          command.params['customerId'] = customer_id unless customer_id.nil?
          command.params['subscriptionId'] = subscription_id unless subscription_id.nil?
          command.query['deletionType'] = deletion_type unless deletion_type.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get a specific subscription.
        # @param [String] customer_id
        #   Either the customer's primary domain name or the customer's unique identifier.
        #   If using the domain name, we do not recommend using a customerId as a key for
        #   persistent data. If the domain name for a customerId is changed, the Google
        #   system automatically updates.
        # @param [String] subscription_id
        #   This is a required property. The subscriptionId is the subscription identifier
        #   and is unique for each customer. Since a subscriptionId changes when a
        #   subscription is updated, we recommend to not use this ID as a key for
        #   persistent data. And the subscriptionId can be found using the retrieve all
        #   reseller subscriptions method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ResellerV1::Subscription] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ResellerV1::Subscription]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_subscription(customer_id, subscription_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'customers/{customerId}/subscriptions/{subscriptionId}', options)
          command.response_representation = Google::Apis::ResellerV1::Subscription::Representation
          command.response_class = Google::Apis::ResellerV1::Subscription
          command.params['customerId'] = customer_id unless customer_id.nil?
          command.params['subscriptionId'] = subscription_id unless subscription_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Create or transfer a subscription.
        # @param [String] customer_id
        #   Either the customer's primary domain name or the customer's unique identifier.
        #   If using the domain name, we do not recommend using a customerId as a key for
        #   persistent data. If the domain name for a customerId is changed, the Google
        #   system automatically updates.
        # @param [Google::Apis::ResellerV1::Subscription] subscription_object
        # @param [String] customer_auth_token
        #   The customerAuthToken query string is required when creating a resold account
        #   that transfers a direct customer's subscription or transfers another reseller
        #   customer's subscription to your reseller management. This is a hexadecimal
        #   authentication token needed to complete the subscription transfer. For more
        #   information, see the administrator help center.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ResellerV1::Subscription] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ResellerV1::Subscription]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_subscription(customer_id, subscription_object = nil, customer_auth_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'customers/{customerId}/subscriptions', options)
          command.request_representation = Google::Apis::ResellerV1::Subscription::Representation
          command.request_object = subscription_object
          command.response_representation = Google::Apis::ResellerV1::Subscription::Representation
          command.response_class = Google::Apis::ResellerV1::Subscription
          command.params['customerId'] = customer_id unless customer_id.nil?
          command.query['customerAuthToken'] = customer_auth_token unless customer_auth_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List of subscriptions managed by the reseller. The list can be all
        # subscriptions, all of a customer's subscriptions, or all of a customer's
        # transferable subscriptions.
        # @param [String] customer_auth_token
        #   The customerAuthToken query string is required when creating a resold account
        #   that transfers a direct customer's subscription or transfers another reseller
        #   customer's subscription to your reseller management. This is a hexadecimal
        #   authentication token needed to complete the subscription transfer. For more
        #   information, see the administrator help center.
        # @param [String] customer_id
        #   Either the customer's primary domain name or the customer's unique identifier.
        #   If using the domain name, we do not recommend using a customerId as a key for
        #   persistent data. If the domain name for a customerId is changed, the Google
        #   system automatically updates.
        # @param [String] customer_name_prefix
        #   When retrieving all of your subscriptions and filtering for specific customers,
        #   you can enter a prefix for a customer name. Using an example customer group
        #   that includes exam.com, example20.com and example.com:
        #   - exa -- Returns all customer names that start with 'exa' which could include
        #   exam.com, example20.com, and example.com. A name prefix is similar to using a
        #   regular expression's asterisk, exa*.
        #   - example -- Returns example20.com and example.com.
        # @param [Fixnum] max_results
        #   When retrieving a large list, the maxResults is the maximum number of results
        #   per page. The nextPageToken value takes you to the next page. The default is
        #   20.
        # @param [String] page_token
        #   Token to specify next page in the list
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ResellerV1::Subscriptions] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ResellerV1::Subscriptions]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_subscriptions(customer_auth_token: nil, customer_id: nil, customer_name_prefix: nil, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'subscriptions', options)
          command.response_representation = Google::Apis::ResellerV1::Subscriptions::Representation
          command.response_class = Google::Apis::ResellerV1::Subscriptions
          command.query['customerAuthToken'] = customer_auth_token unless customer_auth_token.nil?
          command.query['customerId'] = customer_id unless customer_id.nil?
          command.query['customerNamePrefix'] = customer_name_prefix unless customer_name_prefix.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Immediately move a 30-day free trial subscription to a paid service
        # subscription.
        # @param [String] customer_id
        #   Either the customer's primary domain name or the customer's unique identifier.
        #   If using the domain name, we do not recommend using a customerId as a key for
        #   persistent data. If the domain name for a customerId is changed, the Google
        #   system automatically updates.
        # @param [String] subscription_id
        #   This is a required property. The subscriptionId is the subscription identifier
        #   and is unique for each customer. Since a subscriptionId changes when a
        #   subscription is updated, we recommend to not use this ID as a key for
        #   persistent data. And the subscriptionId can be found using the retrieve all
        #   reseller subscriptions method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ResellerV1::Subscription] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ResellerV1::Subscription]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def start_subscription_paid_service(customer_id, subscription_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'customers/{customerId}/subscriptions/{subscriptionId}/startPaidService', options)
          command.response_representation = Google::Apis::ResellerV1::Subscription::Representation
          command.response_class = Google::Apis::ResellerV1::Subscription
          command.params['customerId'] = customer_id unless customer_id.nil?
          command.params['subscriptionId'] = subscription_id unless subscription_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Suspends an active subscription.
        # @param [String] customer_id
        #   Either the customer's primary domain name or the customer's unique identifier.
        #   If using the domain name, we do not recommend using a customerId as a key for
        #   persistent data. If the domain name for a customerId is changed, the Google
        #   system automatically updates.
        # @param [String] subscription_id
        #   This is a required property. The subscriptionId is the subscription identifier
        #   and is unique for each customer. Since a subscriptionId changes when a
        #   subscription is updated, we recommend to not use this ID as a key for
        #   persistent data. And the subscriptionId can be found using the retrieve all
        #   reseller subscriptions method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ResellerV1::Subscription] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ResellerV1::Subscription]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def suspend_subscription(customer_id, subscription_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'customers/{customerId}/subscriptions/{subscriptionId}/suspend', options)
          command.response_representation = Google::Apis::ResellerV1::Subscription::Representation
          command.response_class = Google::Apis::ResellerV1::Subscription
          command.params['customerId'] = customer_id unless customer_id.nil?
          command.params['subscriptionId'] = subscription_id unless subscription_id.nil?
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
