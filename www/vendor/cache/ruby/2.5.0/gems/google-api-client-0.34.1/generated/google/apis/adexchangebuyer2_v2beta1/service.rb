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
    module Adexchangebuyer2V2beta1
      # Ad Exchange Buyer API II
      #
      # Accesses the latest features for managing Authorized Buyers accounts, Real-
      #  Time Bidding configurations and auction metrics, and Marketplace programmatic
      #  deals.
      #
      # @example
      #    require 'google/apis/adexchangebuyer2_v2beta1'
      #
      #    Adexchangebuyer2 = Google::Apis::Adexchangebuyer2V2beta1 # Alias the module
      #    service = Adexchangebuyer2::AdExchangeBuyerIIService.new
      #
      # @see https://developers.google.com/authorized-buyers/apis/reference/rest/
      class AdExchangeBuyerIIService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://adexchangebuyer.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Creates a new client buyer.
        # @param [Fixnum] account_id
        #   Unique numerical account ID for the buyer of which the client buyer
        #   is a customer; the sponsor buyer to create a client for. (required)
        # @param [Google::Apis::Adexchangebuyer2V2beta1::Client] client_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::Client] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Client]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_account_client(account_id, client_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2beta1/accounts/{accountId}/clients', options)
          command.request_representation = Google::Apis::Adexchangebuyer2V2beta1::Client::Representation
          command.request_object = client_object
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::Client::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::Client
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a client buyer with a given client account ID.
        # @param [Fixnum] account_id
        #   Numerical account ID of the client's sponsor buyer. (required)
        # @param [Fixnum] client_account_id
        #   Numerical account ID of the client buyer to retrieve. (required)
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::Client] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Client]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_account_client(account_id, client_account_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/accounts/{accountId}/clients/{clientAccountId}', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::Client::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::Client
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['clientAccountId'] = client_account_id unless client_account_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all the clients for the current sponsor buyer.
        # @param [Fixnum] account_id
        #   Unique numerical account ID of the sponsor buyer to list the clients for.
        # @param [Fixnum] page_size
        #   Requested page size. The server may return fewer clients than requested.
        #   If unspecified, the server will pick an appropriate default.
        # @param [String] page_token
        #   A token identifying a page of results the server should return.
        #   Typically, this is the value of
        #   ListClientsResponse.nextPageToken
        #   returned from the previous call to the
        #   accounts.clients.list
        #   method.
        # @param [String] partner_client_id
        #   Optional unique identifier (from the standpoint of an Ad Exchange sponsor
        #   buyer partner) of the client to return.
        #   If specified, at most one client will be returned in the response.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ListClientsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ListClientsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_account_clients(account_id, page_size: nil, page_token: nil, partner_client_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/accounts/{accountId}/clients', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ListClientsResponse::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ListClientsResponse
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['partnerClientId'] = partner_client_id unless partner_client_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing client buyer.
        # @param [Fixnum] account_id
        #   Unique numerical account ID for the buyer of which the client buyer
        #   is a customer; the sponsor buyer to update a client for. (required)
        # @param [Fixnum] client_account_id
        #   Unique numerical account ID of the client to update. (required)
        # @param [Google::Apis::Adexchangebuyer2V2beta1::Client] client_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::Client] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Client]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_account_client(account_id, client_account_id, client_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v2beta1/accounts/{accountId}/clients/{clientAccountId}', options)
          command.request_representation = Google::Apis::Adexchangebuyer2V2beta1::Client::Representation
          command.request_object = client_object
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::Client::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::Client
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['clientAccountId'] = client_account_id unless client_account_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates and sends out an email invitation to access
        # an Ad Exchange client buyer account.
        # @param [Fixnum] account_id
        #   Numerical account ID of the client's sponsor buyer. (required)
        # @param [Fixnum] client_account_id
        #   Numerical account ID of the client buyer that the user
        #   should be associated with. (required)
        # @param [Google::Apis::Adexchangebuyer2V2beta1::ClientUserInvitation] client_user_invitation_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ClientUserInvitation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ClientUserInvitation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_account_client_invitation(account_id, client_account_id, client_user_invitation_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2beta1/accounts/{accountId}/clients/{clientAccountId}/invitations', options)
          command.request_representation = Google::Apis::Adexchangebuyer2V2beta1::ClientUserInvitation::Representation
          command.request_object = client_user_invitation_object
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ClientUserInvitation::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ClientUserInvitation
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['clientAccountId'] = client_account_id unless client_account_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves an existing client user invitation.
        # @param [Fixnum] account_id
        #   Numerical account ID of the client's sponsor buyer. (required)
        # @param [Fixnum] client_account_id
        #   Numerical account ID of the client buyer that the user invitation
        #   to be retrieved is associated with. (required)
        # @param [Fixnum] invitation_id
        #   Numerical identifier of the user invitation to retrieve. (required)
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ClientUserInvitation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ClientUserInvitation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_account_client_invitation(account_id, client_account_id, invitation_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/accounts/{accountId}/clients/{clientAccountId}/invitations/{invitationId}', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ClientUserInvitation::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ClientUserInvitation
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['clientAccountId'] = client_account_id unless client_account_id.nil?
          command.params['invitationId'] = invitation_id unless invitation_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all the client users invitations for a client
        # with a given account ID.
        # @param [Fixnum] account_id
        #   Numerical account ID of the client's sponsor buyer. (required)
        # @param [String] client_account_id
        #   Numerical account ID of the client buyer to list invitations for.
        #   (required)
        #   You must either specify a string representation of a
        #   numerical account identifier or the `-` character
        #   to list all the invitations for all the clients
        #   of a given sponsor buyer.
        # @param [Fixnum] page_size
        #   Requested page size. Server may return fewer clients than requested.
        #   If unspecified, server will pick an appropriate default.
        # @param [String] page_token
        #   A token identifying a page of results the server should return.
        #   Typically, this is the value of
        #   ListClientUserInvitationsResponse.nextPageToken
        #   returned from the previous call to the
        #   clients.invitations.list
        #   method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ListClientUserInvitationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ListClientUserInvitationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_account_client_invitations(account_id, client_account_id, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/accounts/{accountId}/clients/{clientAccountId}/invitations', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ListClientUserInvitationsResponse::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ListClientUserInvitationsResponse
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['clientAccountId'] = client_account_id unless client_account_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves an existing client user.
        # @param [Fixnum] account_id
        #   Numerical account ID of the client's sponsor buyer. (required)
        # @param [Fixnum] client_account_id
        #   Numerical account ID of the client buyer
        #   that the user to be retrieved is associated with. (required)
        # @param [Fixnum] user_id
        #   Numerical identifier of the user to retrieve. (required)
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ClientUser] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ClientUser]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_account_client_user(account_id, client_account_id, user_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/accounts/{accountId}/clients/{clientAccountId}/users/{userId}', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ClientUser::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ClientUser
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['clientAccountId'] = client_account_id unless client_account_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all the known client users for a specified
        # sponsor buyer account ID.
        # @param [Fixnum] account_id
        #   Numerical account ID of the sponsor buyer of the client to list users for.
        #   (required)
        # @param [String] client_account_id
        #   The account ID of the client buyer to list users for. (required)
        #   You must specify either a string representation of a
        #   numerical account identifier or the `-` character
        #   to list all the client users for all the clients
        #   of a given sponsor buyer.
        # @param [Fixnum] page_size
        #   Requested page size. The server may return fewer clients than requested.
        #   If unspecified, the server will pick an appropriate default.
        # @param [String] page_token
        #   A token identifying a page of results the server should return.
        #   Typically, this is the value of
        #   ListClientUsersResponse.nextPageToken
        #   returned from the previous call to the
        #   accounts.clients.users.list
        #   method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ListClientUsersResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ListClientUsersResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_account_client_users(account_id, client_account_id, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/accounts/{accountId}/clients/{clientAccountId}/users', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ListClientUsersResponse::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ListClientUsersResponse
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['clientAccountId'] = client_account_id unless client_account_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing client user.
        # Only the user status can be changed on update.
        # @param [Fixnum] account_id
        #   Numerical account ID of the client's sponsor buyer. (required)
        # @param [Fixnum] client_account_id
        #   Numerical account ID of the client buyer that the user to be retrieved
        #   is associated with. (required)
        # @param [Fixnum] user_id
        #   Numerical identifier of the user to retrieve. (required)
        # @param [Google::Apis::Adexchangebuyer2V2beta1::ClientUser] client_user_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ClientUser] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ClientUser]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_account_client_user(account_id, client_account_id, user_id, client_user_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v2beta1/accounts/{accountId}/clients/{clientAccountId}/users/{userId}', options)
          command.request_representation = Google::Apis::Adexchangebuyer2V2beta1::ClientUser::Representation
          command.request_object = client_user_object
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ClientUser::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ClientUser
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['clientAccountId'] = client_account_id unless client_account_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a creative.
        # @param [String] account_id
        #   The account that this creative belongs to.
        #   Can be used to filter the response of the
        #   creatives.list
        #   method.
        # @param [Google::Apis::Adexchangebuyer2V2beta1::Creative] creative_object
        # @param [String] duplicate_id_mode
        #   Indicates if multiple creatives can share an ID or not. Default is
        #   NO_DUPLICATES (one ID per creative).
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::Creative] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Creative]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_account_creative(account_id, creative_object = nil, duplicate_id_mode: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2beta1/accounts/{accountId}/creatives', options)
          command.request_representation = Google::Apis::Adexchangebuyer2V2beta1::Creative::Representation
          command.request_object = creative_object
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::Creative::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::Creative
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['duplicateIdMode'] = duplicate_id_mode unless duplicate_id_mode.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a creative.
        # @param [String] account_id
        #   The account the creative belongs to.
        # @param [String] creative_id
        #   The ID of the creative to retrieve.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::Creative] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Creative]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_account_creative(account_id, creative_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/accounts/{accountId}/creatives/{creativeId}', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::Creative::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::Creative
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['creativeId'] = creative_id unless creative_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists creatives.
        # @param [String] account_id
        #   The account to list the creatives from.
        #   Specify "-" to list all creatives the current user has access to.
        # @param [Fixnum] page_size
        #   Requested page size. The server may return fewer creatives than requested
        #   (due to timeout constraint) even if more are available via another call.
        #   If unspecified, server will pick an appropriate default.
        #   Acceptable values are 1 to 1000, inclusive.
        # @param [String] page_token
        #   A token identifying a page of results the server should return.
        #   Typically, this is the value of
        #   ListCreativesResponse.next_page_token
        #   returned from the previous call to 'ListCreatives' method.
        # @param [String] query
        #   An optional query string to filter creatives. If no filter is specified,
        #   all active creatives will be returned.
        #   <p>Supported queries are:
        #   <ul>
        #   <li>accountId=<i>account_id_string</i>
        #   <li>creativeId=<i>creative_id_string</i>
        #   <li>dealsStatus: `approved, conditionally_approved, disapproved,
        #   not_checked`
        #   <li>openAuctionStatus: `approved, conditionally_approved, disapproved,
        #   not_checked`
        #   <li>attribute: `a numeric attribute from the list of attributes`
        #   <li>disapprovalReason: `a reason from
        #   DisapprovalReason`
        #   </ul>
        #   Example: 'accountId=12345 AND (dealsStatus:disapproved AND
        #   disapprovalReason:unacceptable_content) OR attribute:47'
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ListCreativesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ListCreativesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_account_creatives(account_id, page_size: nil, page_token: nil, query: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/accounts/{accountId}/creatives', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ListCreativesResponse::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ListCreativesResponse
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['query'] = query unless query.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Stops watching a creative. Will stop push notifications being sent to the
        # topics when the creative changes status.
        # @param [String] account_id
        #   The account of the creative to stop notifications for.
        # @param [String] creative_id
        #   The creative ID of the creative to stop notifications for.
        #   Specify "-" to specify stopping account level notifications.
        # @param [Google::Apis::Adexchangebuyer2V2beta1::StopWatchingCreativeRequest] stop_watching_creative_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def stop_watching_creative(account_id, creative_id, stop_watching_creative_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2beta1/accounts/{accountId}/creatives/{creativeId}:stopWatching', options)
          command.request_representation = Google::Apis::Adexchangebuyer2V2beta1::StopWatchingCreativeRequest::Representation
          command.request_object = stop_watching_creative_request_object
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::Empty::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::Empty
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['creativeId'] = creative_id unless creative_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a creative.
        # @param [String] account_id
        #   The account that this creative belongs to.
        #   Can be used to filter the response of the
        #   creatives.list
        #   method.
        # @param [String] creative_id
        #   The buyer-defined creative ID of this creative.
        #   Can be used to filter the response of the
        #   creatives.list
        #   method.
        # @param [Google::Apis::Adexchangebuyer2V2beta1::Creative] creative_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::Creative] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Creative]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_account_creative(account_id, creative_id, creative_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v2beta1/accounts/{accountId}/creatives/{creativeId}', options)
          command.request_representation = Google::Apis::Adexchangebuyer2V2beta1::Creative::Representation
          command.request_object = creative_object
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::Creative::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::Creative
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['creativeId'] = creative_id unless creative_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Watches a creative. Will result in push notifications being sent to the
        # topic when the creative changes status.
        # @param [String] account_id
        #   The account of the creative to watch.
        # @param [String] creative_id
        #   The creative ID to watch for status changes.
        #   Specify "-" to watch all creatives under the above account.
        #   If both creative-level and account-level notifications are
        #   sent, only a single notification will be sent to the
        #   creative-level notification topic.
        # @param [Google::Apis::Adexchangebuyer2V2beta1::WatchCreativeRequest] watch_creative_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def watch_creative(account_id, creative_id, watch_creative_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2beta1/accounts/{accountId}/creatives/{creativeId}:watch', options)
          command.request_representation = Google::Apis::Adexchangebuyer2V2beta1::WatchCreativeRequest::Representation
          command.request_object = watch_creative_request_object
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::Empty::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::Empty
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['creativeId'] = creative_id unless creative_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Associate an existing deal with a creative.
        # @param [String] account_id
        #   The account the creative belongs to.
        # @param [String] creative_id
        #   The ID of the creative associated with the deal.
        # @param [Google::Apis::Adexchangebuyer2V2beta1::AddDealAssociationRequest] add_deal_association_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def add_deal_association(account_id, creative_id, add_deal_association_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2beta1/accounts/{accountId}/creatives/{creativeId}/dealAssociations:add', options)
          command.request_representation = Google::Apis::Adexchangebuyer2V2beta1::AddDealAssociationRequest::Representation
          command.request_object = add_deal_association_request_object
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::Empty::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::Empty
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['creativeId'] = creative_id unless creative_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all creative-deal associations.
        # @param [String] account_id
        #   The account to list the associations from.
        #   Specify "-" to list all creatives the current user has access to.
        # @param [String] creative_id
        #   The creative ID to list the associations from.
        #   Specify "-" to list all creatives under the above account.
        # @param [Fixnum] page_size
        #   Requested page size. Server may return fewer associations than requested.
        #   If unspecified, server will pick an appropriate default.
        # @param [String] page_token
        #   A token identifying a page of results the server should return.
        #   Typically, this is the value of
        #   ListDealAssociationsResponse.next_page_token
        #   returned from the previous call to 'ListDealAssociations' method.
        # @param [String] query
        #   An optional query string to filter deal associations. If no filter is
        #   specified, all associations will be returned.
        #   Supported queries are:
        #   <ul>
        #   <li>accountId=<i>account_id_string</i>
        #   <li>creativeId=<i>creative_id_string</i>
        #   <li>dealsId=<i>deals_id_string</i>
        #   <li>dealsStatus:`approved, conditionally_approved, disapproved,
        #   not_checked`
        #   <li>openAuctionStatus:`approved, conditionally_approved, disapproved,
        #   not_checked`
        #   </ul>
        #   Example: 'dealsId=12345 AND dealsStatus:disapproved'
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ListDealAssociationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ListDealAssociationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_account_creative_deal_associations(account_id, creative_id, page_size: nil, page_token: nil, query: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/accounts/{accountId}/creatives/{creativeId}/dealAssociations', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ListDealAssociationsResponse::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ListDealAssociationsResponse
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['creativeId'] = creative_id unless creative_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['query'] = query unless query.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Remove the association between a deal and a creative.
        # @param [String] account_id
        #   The account the creative belongs to.
        # @param [String] creative_id
        #   The ID of the creative associated with the deal.
        # @param [Google::Apis::Adexchangebuyer2V2beta1::RemoveDealAssociationRequest] remove_deal_association_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def remove_deal_association(account_id, creative_id, remove_deal_association_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2beta1/accounts/{accountId}/creatives/{creativeId}/dealAssociations:remove', options)
          command.request_representation = Google::Apis::Adexchangebuyer2V2beta1::RemoveDealAssociationRequest::Representation
          command.request_object = remove_deal_association_request_object
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::Empty::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::Empty
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['creativeId'] = creative_id unless creative_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List finalized proposals, regardless if a proposal is being renegotiated.
        # A filter expression (PQL query) may be specified to filter the results.
        # The notes will not be returned.
        # @param [String] account_id
        #   Account ID of the buyer.
        # @param [String] filter
        #   An optional PQL filter query used to query for proposals.
        #   Nested repeated fields, such as proposal.deals.targetingCriterion,
        #   cannot be filtered.
        # @param [String] filter_syntax
        #   Syntax the filter is written in. Current implementation defaults to PQL
        #   but in the future it will be LIST_FILTER.
        # @param [Fixnum] page_size
        #   Requested page size. The server may return fewer results than requested.
        #   If unspecified, the server will pick an appropriate default.
        # @param [String] page_token
        #   The page token as returned from ListProposalsResponse.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ListProposalsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ListProposalsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_account_finalized_proposals(account_id, filter: nil, filter_syntax: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/accounts/{accountId}/finalizedProposals', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ListProposalsResponse::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ListProposalsResponse
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['filterSyntax'] = filter_syntax unless filter_syntax.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the requested product by ID.
        # @param [String] account_id
        #   Account ID of the buyer.
        # @param [String] product_id
        #   The ID for the product to get the head revision for.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::Product] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Product]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_account_product(account_id, product_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/accounts/{accountId}/products/{productId}', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::Product::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::Product
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['productId'] = product_id unless product_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all products visible to the buyer (optionally filtered by the
        # specified PQL query).
        # @param [String] account_id
        #   Account ID of the buyer.
        # @param [String] filter
        #   An optional PQL query used to query for products. See
        #   https://developers.google.com/ad-manager/docs/pqlreference
        #   for documentation about PQL and examples.
        #   Nested repeated fields, such as product.targetingCriterion.inclusions,
        #   cannot be filtered.
        # @param [Fixnum] page_size
        #   Requested page size. The server may return fewer results than requested.
        #   If unspecified, the server will pick an appropriate default.
        # @param [String] page_token
        #   The page token as returned from ListProductsResponse.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ListProductsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ListProductsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_account_products(account_id, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/accounts/{accountId}/products', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ListProductsResponse::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ListProductsResponse
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Mark the proposal as accepted at the given revision number. If the number
        # does not match the server's revision number an `ABORTED` error message will
        # be returned. This call updates the proposal_state from `PROPOSED` to
        # `BUYER_ACCEPTED`, or from `SELLER_ACCEPTED` to `FINALIZED`.
        # @param [String] account_id
        #   Account ID of the buyer.
        # @param [String] proposal_id
        #   The ID of the proposal to accept.
        # @param [Google::Apis::Adexchangebuyer2V2beta1::AcceptProposalRequest] accept_proposal_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::Proposal] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Proposal]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def accept_proposal(account_id, proposal_id, accept_proposal_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2beta1/accounts/{accountId}/proposals/{proposalId}:accept', options)
          command.request_representation = Google::Apis::Adexchangebuyer2V2beta1::AcceptProposalRequest::Representation
          command.request_object = accept_proposal_request_object
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::Proposal::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::Proposal
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['proposalId'] = proposal_id unless proposal_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Create a new note and attach it to the proposal. The note is assigned
        # a unique ID by the server.
        # The proposal revision number will not increase when associated with a
        # new note.
        # @param [String] account_id
        #   Account ID of the buyer.
        # @param [String] proposal_id
        #   The ID of the proposal to attach the note to.
        # @param [Google::Apis::Adexchangebuyer2V2beta1::AddNoteRequest] add_note_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::Note] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Note]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def add_proposal_note(account_id, proposal_id, add_note_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2beta1/accounts/{accountId}/proposals/{proposalId}:addNote', options)
          command.request_representation = Google::Apis::Adexchangebuyer2V2beta1::AddNoteRequest::Representation
          command.request_object = add_note_request_object
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::Note::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::Note
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['proposalId'] = proposal_id unless proposal_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Cancel an ongoing negotiation on a proposal. This does not cancel or end
        # serving for the deals if the proposal has been finalized, but only cancels
        # a negotiation unilaterally.
        # @param [String] account_id
        #   Account ID of the buyer.
        # @param [String] proposal_id
        #   The ID of the proposal to cancel negotiation for.
        # @param [Google::Apis::Adexchangebuyer2V2beta1::CancelNegotiationRequest] cancel_negotiation_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::Proposal] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Proposal]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def cancel_proposal_negotiation(account_id, proposal_id, cancel_negotiation_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2beta1/accounts/{accountId}/proposals/{proposalId}:cancelNegotiation', options)
          command.request_representation = Google::Apis::Adexchangebuyer2V2beta1::CancelNegotiationRequest::Representation
          command.request_object = cancel_negotiation_request_object
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::Proposal::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::Proposal
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['proposalId'] = proposal_id unless proposal_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update the given proposal to indicate that setup has been completed.
        # This method is called by the buyer when the line items have been created
        # on their end for a finalized proposal and all the required creatives
        # have been uploaded using the creatives API. This call updates the
        # `is_setup_completed` bit on the proposal and also notifies the seller.
        # The server will advance the revision number of the most recent proposal.
        # @param [String] account_id
        #   Account ID of the buyer.
        # @param [String] proposal_id
        #   The ID of the proposal to mark as setup completed.
        # @param [Google::Apis::Adexchangebuyer2V2beta1::CompleteSetupRequest] complete_setup_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::Proposal] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Proposal]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def complete_proposal_setup(account_id, proposal_id, complete_setup_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2beta1/accounts/{accountId}/proposals/{proposalId}:completeSetup', options)
          command.request_representation = Google::Apis::Adexchangebuyer2V2beta1::CompleteSetupRequest::Representation
          command.request_object = complete_setup_request_object
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::Proposal::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::Proposal
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['proposalId'] = proposal_id unless proposal_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Create the given proposal. Each created proposal and any deals it contains
        # are assigned a unique ID by the server.
        # @param [String] account_id
        #   Account ID of the buyer.
        # @param [Google::Apis::Adexchangebuyer2V2beta1::Proposal] proposal_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::Proposal] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Proposal]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_account_proposal(account_id, proposal_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2beta1/accounts/{accountId}/proposals', options)
          command.request_representation = Google::Apis::Adexchangebuyer2V2beta1::Proposal::Representation
          command.request_object = proposal_object
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::Proposal::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::Proposal
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a proposal given its ID. The proposal is returned at its head
        # revision.
        # @param [String] account_id
        #   Account ID of the buyer.
        # @param [String] proposal_id
        #   The unique ID of the proposal
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::Proposal] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Proposal]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_account_proposal(account_id, proposal_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/accounts/{accountId}/proposals/{proposalId}', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::Proposal::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::Proposal
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['proposalId'] = proposal_id unless proposal_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List proposals. A filter expression (PQL query) may be specified to
        # filter the results. To retrieve all finalized proposals, regardless if a
        # proposal is being renegotiated, see the FinalizedProposals resource.
        # Note that Bidder/ChildSeat relationships differ from the usual behavior.
        # A Bidder account can only see its child seats' proposals by specifying
        # the ChildSeat's accountId in the request path.
        # @param [String] account_id
        #   Account ID of the buyer.
        # @param [String] filter
        #   An optional PQL filter query used to query for proposals.
        #   Nested repeated fields, such as proposal.deals.targetingCriterion,
        #   cannot be filtered.
        # @param [String] filter_syntax
        #   Syntax the filter is written in. Current implementation defaults to PQL
        #   but in the future it will be LIST_FILTER.
        # @param [Fixnum] page_size
        #   Requested page size. The server may return fewer results than requested.
        #   If unspecified, the server will pick an appropriate default.
        # @param [String] page_token
        #   The page token as returned from ListProposalsResponse.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ListProposalsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ListProposalsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_account_proposals(account_id, filter: nil, filter_syntax: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/accounts/{accountId}/proposals', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ListProposalsResponse::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ListProposalsResponse
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['filterSyntax'] = filter_syntax unless filter_syntax.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update the given proposal to pause serving.
        # This method will set the
        # `DealServingMetadata.DealPauseStatus.has_buyer_paused` bit to true for all
        # deals in the proposal.
        # It is a no-op to pause an already-paused proposal.
        # It is an error to call PauseProposal for a proposal that is not
        # finalized or renegotiating.
        # @param [String] account_id
        #   Account ID of the buyer.
        # @param [String] proposal_id
        #   The ID of the proposal to pause.
        # @param [Google::Apis::Adexchangebuyer2V2beta1::PauseProposalRequest] pause_proposal_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::Proposal] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Proposal]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def pause_proposal(account_id, proposal_id, pause_proposal_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2beta1/accounts/{accountId}/proposals/{proposalId}:pause', options)
          command.request_representation = Google::Apis::Adexchangebuyer2V2beta1::PauseProposalRequest::Representation
          command.request_object = pause_proposal_request_object
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::Proposal::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::Proposal
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['proposalId'] = proposal_id unless proposal_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update the given proposal to resume serving.
        # This method will set the
        # `DealServingMetadata.DealPauseStatus.has_buyer_paused` bit to false for all
        # deals in the proposal.
        # Note that if the `has_seller_paused` bit is also set, serving will not
        # resume until the seller also resumes.
        # It is a no-op to resume an already-running proposal.
        # It is an error to call ResumeProposal for a proposal that is not
        # finalized or renegotiating.
        # @param [String] account_id
        #   Account ID of the buyer.
        # @param [String] proposal_id
        #   The ID of the proposal to resume.
        # @param [Google::Apis::Adexchangebuyer2V2beta1::ResumeProposalRequest] resume_proposal_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::Proposal] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Proposal]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def resume_proposal(account_id, proposal_id, resume_proposal_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2beta1/accounts/{accountId}/proposals/{proposalId}:resume', options)
          command.request_representation = Google::Apis::Adexchangebuyer2V2beta1::ResumeProposalRequest::Representation
          command.request_object = resume_proposal_request_object
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::Proposal::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::Proposal
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['proposalId'] = proposal_id unless proposal_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update the given proposal at the client known revision number. If the
        # server revision has advanced since the passed-in
        # `proposal.proposal_revision`, an `ABORTED` error message will be returned.
        # Only the buyer-modifiable fields of the proposal will be updated.
        # Note that the deals in the proposal will be updated to match the passed-in
        # copy.
        # If a passed-in deal does not have a `deal_id`, the server will assign a new
        # unique ID and create the deal.
        # If passed-in deal has a `deal_id`, it will be updated to match the
        # passed-in copy.
        # Any existing deals not present in the passed-in proposal will be deleted.
        # It is an error to pass in a deal with a `deal_id` not present at head.
        # @param [String] account_id
        #   Account ID of the buyer.
        # @param [String] proposal_id
        #   The unique ID of the proposal.
        # @param [Google::Apis::Adexchangebuyer2V2beta1::Proposal] proposal_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::Proposal] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Proposal]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_account_proposal(account_id, proposal_id, proposal_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v2beta1/accounts/{accountId}/proposals/{proposalId}', options)
          command.request_representation = Google::Apis::Adexchangebuyer2V2beta1::Proposal::Representation
          command.request_object = proposal_object
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::Proposal::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::Proposal
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['proposalId'] = proposal_id unless proposal_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the requested publisher profile by id.
        # @param [String] account_id
        #   Account ID of the buyer.
        # @param [String] publisher_profile_id
        #   The id for the publisher profile to get.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::PublisherProfile] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::PublisherProfile]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_account_publisher_profile(account_id, publisher_profile_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/accounts/{accountId}/publisherProfiles/{publisherProfileId}', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::PublisherProfile::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::PublisherProfile
          command.params['accountId'] = account_id unless account_id.nil?
          command.params['publisherProfileId'] = publisher_profile_id unless publisher_profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all publisher profiles visible to the buyer
        # @param [String] account_id
        #   Account ID of the buyer.
        # @param [Fixnum] page_size
        #   Specify the number of results to include per page.
        # @param [String] page_token
        #   The page token as return from ListPublisherProfilesResponse.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ListPublisherProfilesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ListPublisherProfilesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_account_publisher_profiles(account_id, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/accounts/{accountId}/publisherProfiles', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ListPublisherProfilesResponse::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ListPublisherProfilesResponse
          command.params['accountId'] = account_id unless account_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates the specified filter set for the account with the given account ID.
        # @param [String] owner_name
        #   Name of the owner (bidder or account) of the filter set to be created.
        #   For example:
        #   - For a bidder-level filter set for bidder 123: `bidders/123`
        #   - For an account-level filter set for the buyer account representing bidder
        #   123: `bidders/123/accounts/123`
        #   - For an account-level filter set for the child seat buyer account 456
        #   whose bidder is 123: `bidders/123/accounts/456`
        # @param [Google::Apis::Adexchangebuyer2V2beta1::FilterSet] filter_set_object
        # @param [Boolean] is_transient
        #   Whether the filter set is transient, or should be persisted indefinitely.
        #   By default, filter sets are not transient.
        #   If transient, it will be available for at least 1 hour after creation.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::FilterSet] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::FilterSet]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_bidder_account_filter_set(owner_name, filter_set_object = nil, is_transient: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2beta1/{+ownerName}/filterSets', options)
          command.request_representation = Google::Apis::Adexchangebuyer2V2beta1::FilterSet::Representation
          command.request_object = filter_set_object
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::FilterSet::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::FilterSet
          command.params['ownerName'] = owner_name unless owner_name.nil?
          command.query['isTransient'] = is_transient unless is_transient.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the requested filter set from the account with the given account
        # ID.
        # @param [String] name
        #   Full name of the resource to delete.
        #   For example:
        #   - For a bidder-level filter set for bidder 123:
        #   `bidders/123/filterSets/abc`
        #   - For an account-level filter set for the buyer account representing bidder
        #   123: `bidders/123/accounts/123/filterSets/abc`
        #   - For an account-level filter set for the child seat buyer account 456
        #   whose bidder is 123: `bidders/123/accounts/456/filterSets/abc`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_bidder_account_filter_set(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2beta1/{+name}', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::Empty::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the requested filter set for the account with the given account
        # ID.
        # @param [String] name
        #   Full name of the resource being requested.
        #   For example:
        #   - For a bidder-level filter set for bidder 123:
        #   `bidders/123/filterSets/abc`
        #   - For an account-level filter set for the buyer account representing bidder
        #   123: `bidders/123/accounts/123/filterSets/abc`
        #   - For an account-level filter set for the child seat buyer account 456
        #   whose bidder is 123: `bidders/123/accounts/456/filterSets/abc`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::FilterSet] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::FilterSet]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_bidder_account_filter_set(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/{+name}', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::FilterSet::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::FilterSet
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all filter sets for the account with the given account ID.
        # @param [String] owner_name
        #   Name of the owner (bidder or account) of the filter sets to be listed.
        #   For example:
        #   - For a bidder-level filter set for bidder 123: `bidders/123`
        #   - For an account-level filter set for the buyer account representing bidder
        #   123: `bidders/123/accounts/123`
        #   - For an account-level filter set for the child seat buyer account 456
        #   whose bidder is 123: `bidders/123/accounts/456`
        # @param [Fixnum] page_size
        #   Requested page size. The server may return fewer results than requested.
        #   If unspecified, the server will pick an appropriate default.
        # @param [String] page_token
        #   A token identifying a page of results the server should return.
        #   Typically, this is the value of
        #   ListFilterSetsResponse.nextPageToken
        #   returned from the previous call to the
        #   accounts.filterSets.list
        #   method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ListFilterSetsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ListFilterSetsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_bidder_account_filter_sets(owner_name, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/{+ownerName}/filterSets', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ListFilterSetsResponse::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ListFilterSetsResponse
          command.params['ownerName'] = owner_name unless owner_name.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all metrics that are measured in terms of number of bids.
        # @param [String] filter_set_name
        #   Name of the filter set that should be applied to the requested metrics.
        #   For example:
        #   - For a bidder-level filter set for bidder 123:
        #   `bidders/123/filterSets/abc`
        #   - For an account-level filter set for the buyer account representing bidder
        #   123: `bidders/123/accounts/123/filterSets/abc`
        #   - For an account-level filter set for the child seat buyer account 456
        #   whose bidder is 123: `bidders/123/accounts/456/filterSets/abc`
        # @param [Fixnum] page_size
        #   Requested page size. The server may return fewer results than requested.
        #   If unspecified, the server will pick an appropriate default.
        # @param [String] page_token
        #   A token identifying a page of results the server should return.
        #   Typically, this is the value of
        #   ListBidMetricsResponse.nextPageToken
        #   returned from the previous call to the bidMetrics.list
        #   method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ListBidMetricsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ListBidMetricsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_bidder_account_filter_set_bid_metrics(filter_set_name, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/{+filterSetName}/bidMetrics', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ListBidMetricsResponse::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ListBidMetricsResponse
          command.params['filterSetName'] = filter_set_name unless filter_set_name.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all errors that occurred in bid responses, with the number of bid
        # responses affected for each reason.
        # @param [String] filter_set_name
        #   Name of the filter set that should be applied to the requested metrics.
        #   For example:
        #   - For a bidder-level filter set for bidder 123:
        #   `bidders/123/filterSets/abc`
        #   - For an account-level filter set for the buyer account representing bidder
        #   123: `bidders/123/accounts/123/filterSets/abc`
        #   - For an account-level filter set for the child seat buyer account 456
        #   whose bidder is 123: `bidders/123/accounts/456/filterSets/abc`
        # @param [Fixnum] page_size
        #   Requested page size. The server may return fewer results than requested.
        #   If unspecified, the server will pick an appropriate default.
        # @param [String] page_token
        #   A token identifying a page of results the server should return.
        #   Typically, this is the value of
        #   ListBidResponseErrorsResponse.nextPageToken
        #   returned from the previous call to the bidResponseErrors.list
        #   method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ListBidResponseErrorsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ListBidResponseErrorsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_bidder_account_filter_set_bid_response_errors(filter_set_name, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/{+filterSetName}/bidResponseErrors', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ListBidResponseErrorsResponse::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ListBidResponseErrorsResponse
          command.params['filterSetName'] = filter_set_name unless filter_set_name.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all reasons for which bid responses were considered to have no
        # applicable bids, with the number of bid responses affected for each reason.
        # @param [String] filter_set_name
        #   Name of the filter set that should be applied to the requested metrics.
        #   For example:
        #   - For a bidder-level filter set for bidder 123:
        #   `bidders/123/filterSets/abc`
        #   - For an account-level filter set for the buyer account representing bidder
        #   123: `bidders/123/accounts/123/filterSets/abc`
        #   - For an account-level filter set for the child seat buyer account 456
        #   whose bidder is 123: `bidders/123/accounts/456/filterSets/abc`
        # @param [Fixnum] page_size
        #   Requested page size. The server may return fewer results than requested.
        #   If unspecified, the server will pick an appropriate default.
        # @param [String] page_token
        #   A token identifying a page of results the server should return.
        #   Typically, this is the value of
        #   ListBidResponsesWithoutBidsResponse.nextPageToken
        #   returned from the previous call to the bidResponsesWithoutBids.list
        #   method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ListBidResponsesWithoutBidsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ListBidResponsesWithoutBidsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_bidder_account_filter_set_bid_responses_without_bids(filter_set_name, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/{+filterSetName}/bidResponsesWithoutBids', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ListBidResponsesWithoutBidsResponse::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ListBidResponsesWithoutBidsResponse
          command.params['filterSetName'] = filter_set_name unless filter_set_name.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all reasons that caused a bid request not to be sent for an
        # impression, with the number of bid requests not sent for each reason.
        # @param [String] filter_set_name
        #   Name of the filter set that should be applied to the requested metrics.
        #   For example:
        #   - For a bidder-level filter set for bidder 123:
        #   `bidders/123/filterSets/abc`
        #   - For an account-level filter set for the buyer account representing bidder
        #   123: `bidders/123/accounts/123/filterSets/abc`
        #   - For an account-level filter set for the child seat buyer account 456
        #   whose bidder is 123: `bidders/123/accounts/456/filterSets/abc`
        # @param [Fixnum] page_size
        #   Requested page size. The server may return fewer results than requested.
        #   If unspecified, the server will pick an appropriate default.
        # @param [String] page_token
        #   A token identifying a page of results the server should return.
        #   Typically, this is the value of
        #   ListFilteredBidRequestsResponse.nextPageToken
        #   returned from the previous call to the filteredBidRequests.list
        #   method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ListFilteredBidRequestsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ListFilteredBidRequestsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_bidder_account_filter_set_filtered_bid_requests(filter_set_name, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/{+filterSetName}/filteredBidRequests', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ListFilteredBidRequestsResponse::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ListFilteredBidRequestsResponse
          command.params['filterSetName'] = filter_set_name unless filter_set_name.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all reasons for which bids were filtered, with the number of bids
        # filtered for each reason.
        # @param [String] filter_set_name
        #   Name of the filter set that should be applied to the requested metrics.
        #   For example:
        #   - For a bidder-level filter set for bidder 123:
        #   `bidders/123/filterSets/abc`
        #   - For an account-level filter set for the buyer account representing bidder
        #   123: `bidders/123/accounts/123/filterSets/abc`
        #   - For an account-level filter set for the child seat buyer account 456
        #   whose bidder is 123: `bidders/123/accounts/456/filterSets/abc`
        # @param [Fixnum] page_size
        #   Requested page size. The server may return fewer results than requested.
        #   If unspecified, the server will pick an appropriate default.
        # @param [String] page_token
        #   A token identifying a page of results the server should return.
        #   Typically, this is the value of
        #   ListFilteredBidsResponse.nextPageToken
        #   returned from the previous call to the filteredBids.list
        #   method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ListFilteredBidsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ListFilteredBidsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_bidder_account_filter_set_filtered_bids(filter_set_name, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/{+filterSetName}/filteredBids', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ListFilteredBidsResponse::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ListFilteredBidsResponse
          command.params['filterSetName'] = filter_set_name unless filter_set_name.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all creatives associated with a specific reason for which bids were
        # filtered, with the number of bids filtered for each creative.
        # @param [String] filter_set_name
        #   Name of the filter set that should be applied to the requested metrics.
        #   For example:
        #   - For a bidder-level filter set for bidder 123:
        #   `bidders/123/filterSets/abc`
        #   - For an account-level filter set for the buyer account representing bidder
        #   123: `bidders/123/accounts/123/filterSets/abc`
        #   - For an account-level filter set for the child seat buyer account 456
        #   whose bidder is 123: `bidders/123/accounts/456/filterSets/abc`
        # @param [Fixnum] creative_status_id
        #   The ID of the creative status for which to retrieve a breakdown by
        #   creative.
        #   See
        #   [creative-status-codes](https://developers.google.com/authorized-buyers/rtb/
        #   downloads/creative-status-codes).
        # @param [Fixnum] page_size
        #   Requested page size. The server may return fewer results than requested.
        #   If unspecified, the server will pick an appropriate default.
        # @param [String] page_token
        #   A token identifying a page of results the server should return.
        #   Typically, this is the value of
        #   ListCreativeStatusBreakdownByCreativeResponse.nextPageToken
        #   returned from the previous call to the filteredBids.creatives.list
        #   method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ListCreativeStatusBreakdownByCreativeResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ListCreativeStatusBreakdownByCreativeResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_bidder_account_filter_set_filtered_bid_creatives(filter_set_name, creative_status_id, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/{+filterSetName}/filteredBids/{creativeStatusId}/creatives', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ListCreativeStatusBreakdownByCreativeResponse::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ListCreativeStatusBreakdownByCreativeResponse
          command.params['filterSetName'] = filter_set_name unless filter_set_name.nil?
          command.params['creativeStatusId'] = creative_status_id unless creative_status_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all details associated with a specific reason for which bids were
        # filtered, with the number of bids filtered for each detail.
        # @param [String] filter_set_name
        #   Name of the filter set that should be applied to the requested metrics.
        #   For example:
        #   - For a bidder-level filter set for bidder 123:
        #   `bidders/123/filterSets/abc`
        #   - For an account-level filter set for the buyer account representing bidder
        #   123: `bidders/123/accounts/123/filterSets/abc`
        #   - For an account-level filter set for the child seat buyer account 456
        #   whose bidder is 123: `bidders/123/accounts/456/filterSets/abc`
        # @param [Fixnum] creative_status_id
        #   The ID of the creative status for which to retrieve a breakdown by detail.
        #   See
        #   [creative-status-codes](https://developers.google.com/authorized-buyers/rtb/
        #   downloads/creative-status-codes).
        #   Details are only available for statuses 10, 14, 15, 17, 18, 19, 86, and 87.
        # @param [Fixnum] page_size
        #   Requested page size. The server may return fewer results than requested.
        #   If unspecified, the server will pick an appropriate default.
        # @param [String] page_token
        #   A token identifying a page of results the server should return.
        #   Typically, this is the value of
        #   ListCreativeStatusBreakdownByDetailResponse.nextPageToken
        #   returned from the previous call to the filteredBids.details.list
        #   method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ListCreativeStatusBreakdownByDetailResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ListCreativeStatusBreakdownByDetailResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_bidder_account_filter_set_filtered_bid_details(filter_set_name, creative_status_id, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/{+filterSetName}/filteredBids/{creativeStatusId}/details', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ListCreativeStatusBreakdownByDetailResponse::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ListCreativeStatusBreakdownByDetailResponse
          command.params['filterSetName'] = filter_set_name unless filter_set_name.nil?
          command.params['creativeStatusId'] = creative_status_id unless creative_status_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all metrics that are measured in terms of number of impressions.
        # @param [String] filter_set_name
        #   Name of the filter set that should be applied to the requested metrics.
        #   For example:
        #   - For a bidder-level filter set for bidder 123:
        #   `bidders/123/filterSets/abc`
        #   - For an account-level filter set for the buyer account representing bidder
        #   123: `bidders/123/accounts/123/filterSets/abc`
        #   - For an account-level filter set for the child seat buyer account 456
        #   whose bidder is 123: `bidders/123/accounts/456/filterSets/abc`
        # @param [Fixnum] page_size
        #   Requested page size. The server may return fewer results than requested.
        #   If unspecified, the server will pick an appropriate default.
        # @param [String] page_token
        #   A token identifying a page of results the server should return.
        #   Typically, this is the value of
        #   ListImpressionMetricsResponse.nextPageToken
        #   returned from the previous call to the impressionMetrics.list
        #   method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ListImpressionMetricsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ListImpressionMetricsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_bidder_account_filter_set_impression_metrics(filter_set_name, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/{+filterSetName}/impressionMetrics', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ListImpressionMetricsResponse::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ListImpressionMetricsResponse
          command.params['filterSetName'] = filter_set_name unless filter_set_name.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all reasons for which bids lost in the auction, with the number of
        # bids that lost for each reason.
        # @param [String] filter_set_name
        #   Name of the filter set that should be applied to the requested metrics.
        #   For example:
        #   - For a bidder-level filter set for bidder 123:
        #   `bidders/123/filterSets/abc`
        #   - For an account-level filter set for the buyer account representing bidder
        #   123: `bidders/123/accounts/123/filterSets/abc`
        #   - For an account-level filter set for the child seat buyer account 456
        #   whose bidder is 123: `bidders/123/accounts/456/filterSets/abc`
        # @param [Fixnum] page_size
        #   Requested page size. The server may return fewer results than requested.
        #   If unspecified, the server will pick an appropriate default.
        # @param [String] page_token
        #   A token identifying a page of results the server should return.
        #   Typically, this is the value of
        #   ListLosingBidsResponse.nextPageToken
        #   returned from the previous call to the losingBids.list
        #   method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ListLosingBidsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ListLosingBidsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_bidder_account_filter_set_losing_bids(filter_set_name, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/{+filterSetName}/losingBids', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ListLosingBidsResponse::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ListLosingBidsResponse
          command.params['filterSetName'] = filter_set_name unless filter_set_name.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all reasons for which winning bids were not billable, with the number
        # of bids not billed for each reason.
        # @param [String] filter_set_name
        #   Name of the filter set that should be applied to the requested metrics.
        #   For example:
        #   - For a bidder-level filter set for bidder 123:
        #   `bidders/123/filterSets/abc`
        #   - For an account-level filter set for the buyer account representing bidder
        #   123: `bidders/123/accounts/123/filterSets/abc`
        #   - For an account-level filter set for the child seat buyer account 456
        #   whose bidder is 123: `bidders/123/accounts/456/filterSets/abc`
        # @param [Fixnum] page_size
        #   Requested page size. The server may return fewer results than requested.
        #   If unspecified, the server will pick an appropriate default.
        # @param [String] page_token
        #   A token identifying a page of results the server should return.
        #   Typically, this is the value of
        #   ListNonBillableWinningBidsResponse.nextPageToken
        #   returned from the previous call to the nonBillableWinningBids.list
        #   method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ListNonBillableWinningBidsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ListNonBillableWinningBidsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_bidder_account_filter_set_non_billable_winning_bids(filter_set_name, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/{+filterSetName}/nonBillableWinningBids', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ListNonBillableWinningBidsResponse::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ListNonBillableWinningBidsResponse
          command.params['filterSetName'] = filter_set_name unless filter_set_name.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates the specified filter set for the account with the given account ID.
        # @param [String] owner_name
        #   Name of the owner (bidder or account) of the filter set to be created.
        #   For example:
        #   - For a bidder-level filter set for bidder 123: `bidders/123`
        #   - For an account-level filter set for the buyer account representing bidder
        #   123: `bidders/123/accounts/123`
        #   - For an account-level filter set for the child seat buyer account 456
        #   whose bidder is 123: `bidders/123/accounts/456`
        # @param [Google::Apis::Adexchangebuyer2V2beta1::FilterSet] filter_set_object
        # @param [Boolean] is_transient
        #   Whether the filter set is transient, or should be persisted indefinitely.
        #   By default, filter sets are not transient.
        #   If transient, it will be available for at least 1 hour after creation.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::FilterSet] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::FilterSet]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_bidder_filter_set(owner_name, filter_set_object = nil, is_transient: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2beta1/{+ownerName}/filterSets', options)
          command.request_representation = Google::Apis::Adexchangebuyer2V2beta1::FilterSet::Representation
          command.request_object = filter_set_object
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::FilterSet::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::FilterSet
          command.params['ownerName'] = owner_name unless owner_name.nil?
          command.query['isTransient'] = is_transient unless is_transient.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the requested filter set from the account with the given account
        # ID.
        # @param [String] name
        #   Full name of the resource to delete.
        #   For example:
        #   - For a bidder-level filter set for bidder 123:
        #   `bidders/123/filterSets/abc`
        #   - For an account-level filter set for the buyer account representing bidder
        #   123: `bidders/123/accounts/123/filterSets/abc`
        #   - For an account-level filter set for the child seat buyer account 456
        #   whose bidder is 123: `bidders/123/accounts/456/filterSets/abc`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_bidder_filter_set(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2beta1/{+name}', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::Empty::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the requested filter set for the account with the given account
        # ID.
        # @param [String] name
        #   Full name of the resource being requested.
        #   For example:
        #   - For a bidder-level filter set for bidder 123:
        #   `bidders/123/filterSets/abc`
        #   - For an account-level filter set for the buyer account representing bidder
        #   123: `bidders/123/accounts/123/filterSets/abc`
        #   - For an account-level filter set for the child seat buyer account 456
        #   whose bidder is 123: `bidders/123/accounts/456/filterSets/abc`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::FilterSet] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::FilterSet]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_bidder_filter_set(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/{+name}', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::FilterSet::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::FilterSet
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all filter sets for the account with the given account ID.
        # @param [String] owner_name
        #   Name of the owner (bidder or account) of the filter sets to be listed.
        #   For example:
        #   - For a bidder-level filter set for bidder 123: `bidders/123`
        #   - For an account-level filter set for the buyer account representing bidder
        #   123: `bidders/123/accounts/123`
        #   - For an account-level filter set for the child seat buyer account 456
        #   whose bidder is 123: `bidders/123/accounts/456`
        # @param [Fixnum] page_size
        #   Requested page size. The server may return fewer results than requested.
        #   If unspecified, the server will pick an appropriate default.
        # @param [String] page_token
        #   A token identifying a page of results the server should return.
        #   Typically, this is the value of
        #   ListFilterSetsResponse.nextPageToken
        #   returned from the previous call to the
        #   accounts.filterSets.list
        #   method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ListFilterSetsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ListFilterSetsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_bidder_filter_sets(owner_name, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/{+ownerName}/filterSets', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ListFilterSetsResponse::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ListFilterSetsResponse
          command.params['ownerName'] = owner_name unless owner_name.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all metrics that are measured in terms of number of bids.
        # @param [String] filter_set_name
        #   Name of the filter set that should be applied to the requested metrics.
        #   For example:
        #   - For a bidder-level filter set for bidder 123:
        #   `bidders/123/filterSets/abc`
        #   - For an account-level filter set for the buyer account representing bidder
        #   123: `bidders/123/accounts/123/filterSets/abc`
        #   - For an account-level filter set for the child seat buyer account 456
        #   whose bidder is 123: `bidders/123/accounts/456/filterSets/abc`
        # @param [Fixnum] page_size
        #   Requested page size. The server may return fewer results than requested.
        #   If unspecified, the server will pick an appropriate default.
        # @param [String] page_token
        #   A token identifying a page of results the server should return.
        #   Typically, this is the value of
        #   ListBidMetricsResponse.nextPageToken
        #   returned from the previous call to the bidMetrics.list
        #   method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ListBidMetricsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ListBidMetricsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_bidder_filter_set_bid_metrics(filter_set_name, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/{+filterSetName}/bidMetrics', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ListBidMetricsResponse::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ListBidMetricsResponse
          command.params['filterSetName'] = filter_set_name unless filter_set_name.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all errors that occurred in bid responses, with the number of bid
        # responses affected for each reason.
        # @param [String] filter_set_name
        #   Name of the filter set that should be applied to the requested metrics.
        #   For example:
        #   - For a bidder-level filter set for bidder 123:
        #   `bidders/123/filterSets/abc`
        #   - For an account-level filter set for the buyer account representing bidder
        #   123: `bidders/123/accounts/123/filterSets/abc`
        #   - For an account-level filter set for the child seat buyer account 456
        #   whose bidder is 123: `bidders/123/accounts/456/filterSets/abc`
        # @param [Fixnum] page_size
        #   Requested page size. The server may return fewer results than requested.
        #   If unspecified, the server will pick an appropriate default.
        # @param [String] page_token
        #   A token identifying a page of results the server should return.
        #   Typically, this is the value of
        #   ListBidResponseErrorsResponse.nextPageToken
        #   returned from the previous call to the bidResponseErrors.list
        #   method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ListBidResponseErrorsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ListBidResponseErrorsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_bidder_filter_set_bid_response_errors(filter_set_name, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/{+filterSetName}/bidResponseErrors', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ListBidResponseErrorsResponse::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ListBidResponseErrorsResponse
          command.params['filterSetName'] = filter_set_name unless filter_set_name.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all reasons for which bid responses were considered to have no
        # applicable bids, with the number of bid responses affected for each reason.
        # @param [String] filter_set_name
        #   Name of the filter set that should be applied to the requested metrics.
        #   For example:
        #   - For a bidder-level filter set for bidder 123:
        #   `bidders/123/filterSets/abc`
        #   - For an account-level filter set for the buyer account representing bidder
        #   123: `bidders/123/accounts/123/filterSets/abc`
        #   - For an account-level filter set for the child seat buyer account 456
        #   whose bidder is 123: `bidders/123/accounts/456/filterSets/abc`
        # @param [Fixnum] page_size
        #   Requested page size. The server may return fewer results than requested.
        #   If unspecified, the server will pick an appropriate default.
        # @param [String] page_token
        #   A token identifying a page of results the server should return.
        #   Typically, this is the value of
        #   ListBidResponsesWithoutBidsResponse.nextPageToken
        #   returned from the previous call to the bidResponsesWithoutBids.list
        #   method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ListBidResponsesWithoutBidsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ListBidResponsesWithoutBidsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_bidder_filter_set_bid_responses_without_bids(filter_set_name, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/{+filterSetName}/bidResponsesWithoutBids', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ListBidResponsesWithoutBidsResponse::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ListBidResponsesWithoutBidsResponse
          command.params['filterSetName'] = filter_set_name unless filter_set_name.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all reasons that caused a bid request not to be sent for an
        # impression, with the number of bid requests not sent for each reason.
        # @param [String] filter_set_name
        #   Name of the filter set that should be applied to the requested metrics.
        #   For example:
        #   - For a bidder-level filter set for bidder 123:
        #   `bidders/123/filterSets/abc`
        #   - For an account-level filter set for the buyer account representing bidder
        #   123: `bidders/123/accounts/123/filterSets/abc`
        #   - For an account-level filter set for the child seat buyer account 456
        #   whose bidder is 123: `bidders/123/accounts/456/filterSets/abc`
        # @param [Fixnum] page_size
        #   Requested page size. The server may return fewer results than requested.
        #   If unspecified, the server will pick an appropriate default.
        # @param [String] page_token
        #   A token identifying a page of results the server should return.
        #   Typically, this is the value of
        #   ListFilteredBidRequestsResponse.nextPageToken
        #   returned from the previous call to the filteredBidRequests.list
        #   method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ListFilteredBidRequestsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ListFilteredBidRequestsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_bidder_filter_set_filtered_bid_requests(filter_set_name, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/{+filterSetName}/filteredBidRequests', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ListFilteredBidRequestsResponse::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ListFilteredBidRequestsResponse
          command.params['filterSetName'] = filter_set_name unless filter_set_name.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all reasons for which bids were filtered, with the number of bids
        # filtered for each reason.
        # @param [String] filter_set_name
        #   Name of the filter set that should be applied to the requested metrics.
        #   For example:
        #   - For a bidder-level filter set for bidder 123:
        #   `bidders/123/filterSets/abc`
        #   - For an account-level filter set for the buyer account representing bidder
        #   123: `bidders/123/accounts/123/filterSets/abc`
        #   - For an account-level filter set for the child seat buyer account 456
        #   whose bidder is 123: `bidders/123/accounts/456/filterSets/abc`
        # @param [Fixnum] page_size
        #   Requested page size. The server may return fewer results than requested.
        #   If unspecified, the server will pick an appropriate default.
        # @param [String] page_token
        #   A token identifying a page of results the server should return.
        #   Typically, this is the value of
        #   ListFilteredBidsResponse.nextPageToken
        #   returned from the previous call to the filteredBids.list
        #   method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ListFilteredBidsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ListFilteredBidsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_bidder_filter_set_filtered_bids(filter_set_name, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/{+filterSetName}/filteredBids', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ListFilteredBidsResponse::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ListFilteredBidsResponse
          command.params['filterSetName'] = filter_set_name unless filter_set_name.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all creatives associated with a specific reason for which bids were
        # filtered, with the number of bids filtered for each creative.
        # @param [String] filter_set_name
        #   Name of the filter set that should be applied to the requested metrics.
        #   For example:
        #   - For a bidder-level filter set for bidder 123:
        #   `bidders/123/filterSets/abc`
        #   - For an account-level filter set for the buyer account representing bidder
        #   123: `bidders/123/accounts/123/filterSets/abc`
        #   - For an account-level filter set for the child seat buyer account 456
        #   whose bidder is 123: `bidders/123/accounts/456/filterSets/abc`
        # @param [Fixnum] creative_status_id
        #   The ID of the creative status for which to retrieve a breakdown by
        #   creative.
        #   See
        #   [creative-status-codes](https://developers.google.com/authorized-buyers/rtb/
        #   downloads/creative-status-codes).
        # @param [Fixnum] page_size
        #   Requested page size. The server may return fewer results than requested.
        #   If unspecified, the server will pick an appropriate default.
        # @param [String] page_token
        #   A token identifying a page of results the server should return.
        #   Typically, this is the value of
        #   ListCreativeStatusBreakdownByCreativeResponse.nextPageToken
        #   returned from the previous call to the filteredBids.creatives.list
        #   method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ListCreativeStatusBreakdownByCreativeResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ListCreativeStatusBreakdownByCreativeResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_bidder_filter_set_filtered_bid_creatives(filter_set_name, creative_status_id, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/{+filterSetName}/filteredBids/{creativeStatusId}/creatives', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ListCreativeStatusBreakdownByCreativeResponse::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ListCreativeStatusBreakdownByCreativeResponse
          command.params['filterSetName'] = filter_set_name unless filter_set_name.nil?
          command.params['creativeStatusId'] = creative_status_id unless creative_status_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all details associated with a specific reason for which bids were
        # filtered, with the number of bids filtered for each detail.
        # @param [String] filter_set_name
        #   Name of the filter set that should be applied to the requested metrics.
        #   For example:
        #   - For a bidder-level filter set for bidder 123:
        #   `bidders/123/filterSets/abc`
        #   - For an account-level filter set for the buyer account representing bidder
        #   123: `bidders/123/accounts/123/filterSets/abc`
        #   - For an account-level filter set for the child seat buyer account 456
        #   whose bidder is 123: `bidders/123/accounts/456/filterSets/abc`
        # @param [Fixnum] creative_status_id
        #   The ID of the creative status for which to retrieve a breakdown by detail.
        #   See
        #   [creative-status-codes](https://developers.google.com/authorized-buyers/rtb/
        #   downloads/creative-status-codes).
        #   Details are only available for statuses 10, 14, 15, 17, 18, 19, 86, and 87.
        # @param [Fixnum] page_size
        #   Requested page size. The server may return fewer results than requested.
        #   If unspecified, the server will pick an appropriate default.
        # @param [String] page_token
        #   A token identifying a page of results the server should return.
        #   Typically, this is the value of
        #   ListCreativeStatusBreakdownByDetailResponse.nextPageToken
        #   returned from the previous call to the filteredBids.details.list
        #   method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ListCreativeStatusBreakdownByDetailResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ListCreativeStatusBreakdownByDetailResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_bidder_filter_set_filtered_bid_details(filter_set_name, creative_status_id, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/{+filterSetName}/filteredBids/{creativeStatusId}/details', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ListCreativeStatusBreakdownByDetailResponse::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ListCreativeStatusBreakdownByDetailResponse
          command.params['filterSetName'] = filter_set_name unless filter_set_name.nil?
          command.params['creativeStatusId'] = creative_status_id unless creative_status_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all metrics that are measured in terms of number of impressions.
        # @param [String] filter_set_name
        #   Name of the filter set that should be applied to the requested metrics.
        #   For example:
        #   - For a bidder-level filter set for bidder 123:
        #   `bidders/123/filterSets/abc`
        #   - For an account-level filter set for the buyer account representing bidder
        #   123: `bidders/123/accounts/123/filterSets/abc`
        #   - For an account-level filter set for the child seat buyer account 456
        #   whose bidder is 123: `bidders/123/accounts/456/filterSets/abc`
        # @param [Fixnum] page_size
        #   Requested page size. The server may return fewer results than requested.
        #   If unspecified, the server will pick an appropriate default.
        # @param [String] page_token
        #   A token identifying a page of results the server should return.
        #   Typically, this is the value of
        #   ListImpressionMetricsResponse.nextPageToken
        #   returned from the previous call to the impressionMetrics.list
        #   method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ListImpressionMetricsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ListImpressionMetricsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_bidder_filter_set_impression_metrics(filter_set_name, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/{+filterSetName}/impressionMetrics', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ListImpressionMetricsResponse::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ListImpressionMetricsResponse
          command.params['filterSetName'] = filter_set_name unless filter_set_name.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all reasons for which bids lost in the auction, with the number of
        # bids that lost for each reason.
        # @param [String] filter_set_name
        #   Name of the filter set that should be applied to the requested metrics.
        #   For example:
        #   - For a bidder-level filter set for bidder 123:
        #   `bidders/123/filterSets/abc`
        #   - For an account-level filter set for the buyer account representing bidder
        #   123: `bidders/123/accounts/123/filterSets/abc`
        #   - For an account-level filter set for the child seat buyer account 456
        #   whose bidder is 123: `bidders/123/accounts/456/filterSets/abc`
        # @param [Fixnum] page_size
        #   Requested page size. The server may return fewer results than requested.
        #   If unspecified, the server will pick an appropriate default.
        # @param [String] page_token
        #   A token identifying a page of results the server should return.
        #   Typically, this is the value of
        #   ListLosingBidsResponse.nextPageToken
        #   returned from the previous call to the losingBids.list
        #   method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ListLosingBidsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ListLosingBidsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_bidder_filter_set_losing_bids(filter_set_name, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/{+filterSetName}/losingBids', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ListLosingBidsResponse::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ListLosingBidsResponse
          command.params['filterSetName'] = filter_set_name unless filter_set_name.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all reasons for which winning bids were not billable, with the number
        # of bids not billed for each reason.
        # @param [String] filter_set_name
        #   Name of the filter set that should be applied to the requested metrics.
        #   For example:
        #   - For a bidder-level filter set for bidder 123:
        #   `bidders/123/filterSets/abc`
        #   - For an account-level filter set for the buyer account representing bidder
        #   123: `bidders/123/accounts/123/filterSets/abc`
        #   - For an account-level filter set for the child seat buyer account 456
        #   whose bidder is 123: `bidders/123/accounts/456/filterSets/abc`
        # @param [Fixnum] page_size
        #   Requested page size. The server may return fewer results than requested.
        #   If unspecified, the server will pick an appropriate default.
        # @param [String] page_token
        #   A token identifying a page of results the server should return.
        #   Typically, this is the value of
        #   ListNonBillableWinningBidsResponse.nextPageToken
        #   returned from the previous call to the nonBillableWinningBids.list
        #   method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::Adexchangebuyer2V2beta1::ListNonBillableWinningBidsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::Adexchangebuyer2V2beta1::ListNonBillableWinningBidsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_bidder_filter_set_non_billable_winning_bids(filter_set_name, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta1/{+filterSetName}/nonBillableWinningBids', options)
          command.response_representation = Google::Apis::Adexchangebuyer2V2beta1::ListNonBillableWinningBidsResponse::Representation
          command.response_class = Google::Apis::Adexchangebuyer2V2beta1::ListNonBillableWinningBidsResponse
          command.params['filterSetName'] = filter_set_name unless filter_set_name.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
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
