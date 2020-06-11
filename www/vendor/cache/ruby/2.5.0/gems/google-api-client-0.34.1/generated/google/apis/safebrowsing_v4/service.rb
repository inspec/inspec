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
    module SafebrowsingV4
      # Safe Browsing API
      #
      # Enables client applications to check web resources (most commonly URLs)
      #  against Google-generated lists of unsafe web resources. The Safe Browsing APIs
      #  are for non-commercial use only. If you need to use APIs to detect malicious
      #  URLs for commercial purposes – meaning “for sale or revenue-generating
      #  purposes” – please refer to the Web Risk API.
      #
      # @example
      #    require 'google/apis/safebrowsing_v4'
      #
      #    Safebrowsing = Google::Apis::SafebrowsingV4 # Alias the module
      #    service = Safebrowsing::SafebrowsingService.new
      #
      # @see https://developers.google.com/safe-browsing/
      class SafebrowsingService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://safebrowsing.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # 
        # @param [String] encoded_request
        #   A serialized FindFullHashesRequest proto.
        # @param [String] client_id
        #   A client ID that (hopefully) uniquely identifies the client implementation
        #   of the Safe Browsing API.
        # @param [String] client_version
        #   The version of the client implementation.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SafebrowsingV4::FindFullHashesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SafebrowsingV4::FindFullHashesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_encoded_full_hash(encoded_request, client_id: nil, client_version: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v4/encodedFullHashes/{encodedRequest}', options)
          command.response_representation = Google::Apis::SafebrowsingV4::FindFullHashesResponse::Representation
          command.response_class = Google::Apis::SafebrowsingV4::FindFullHashesResponse
          command.params['encodedRequest'] = encoded_request unless encoded_request.nil?
          command.query['clientId'] = client_id unless client_id.nil?
          command.query['clientVersion'] = client_version unless client_version.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # 
        # @param [String] encoded_request
        #   A serialized FetchThreatListUpdatesRequest proto.
        # @param [String] client_id
        #   A client ID that uniquely identifies the client implementation of the Safe
        #   Browsing API.
        # @param [String] client_version
        #   The version of the client implementation.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SafebrowsingV4::FetchThreatListUpdatesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SafebrowsingV4::FetchThreatListUpdatesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_encoded_update(encoded_request, client_id: nil, client_version: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v4/encodedUpdates/{encodedRequest}', options)
          command.response_representation = Google::Apis::SafebrowsingV4::FetchThreatListUpdatesResponse::Representation
          command.response_class = Google::Apis::SafebrowsingV4::FetchThreatListUpdatesResponse
          command.params['encodedRequest'] = encoded_request unless encoded_request.nil?
          command.query['clientId'] = client_id unless client_id.nil?
          command.query['clientVersion'] = client_version unless client_version.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Finds the full hashes that match the requested hash prefixes.
        # @param [Google::Apis::SafebrowsingV4::FindFullHashesRequest] find_full_hashes_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SafebrowsingV4::FindFullHashesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SafebrowsingV4::FindFullHashesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def find_full_hashes(find_full_hashes_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v4/fullHashes:find', options)
          command.request_representation = Google::Apis::SafebrowsingV4::FindFullHashesRequest::Representation
          command.request_object = find_full_hashes_request_object
          command.response_representation = Google::Apis::SafebrowsingV4::FindFullHashesResponse::Representation
          command.response_class = Google::Apis::SafebrowsingV4::FindFullHashesResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Reports a Safe Browsing threat list hit to Google. Only projects with
        # TRUSTED_REPORTER visibility can use this method.
        # @param [Google::Apis::SafebrowsingV4::ThreatHit] threat_hit_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SafebrowsingV4::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SafebrowsingV4::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_threat_hit(threat_hit_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v4/threatHits', options)
          command.request_representation = Google::Apis::SafebrowsingV4::ThreatHit::Representation
          command.request_object = threat_hit_object
          command.response_representation = Google::Apis::SafebrowsingV4::Empty::Representation
          command.response_class = Google::Apis::SafebrowsingV4::Empty
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Fetches the most recent threat list updates. A client can request updates
        # for multiple lists at once.
        # @param [Google::Apis::SafebrowsingV4::FetchThreatListUpdatesRequest] fetch_threat_list_updates_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SafebrowsingV4::FetchThreatListUpdatesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SafebrowsingV4::FetchThreatListUpdatesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def fetch_threat_list_updates(fetch_threat_list_updates_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v4/threatListUpdates:fetch', options)
          command.request_representation = Google::Apis::SafebrowsingV4::FetchThreatListUpdatesRequest::Representation
          command.request_object = fetch_threat_list_updates_request_object
          command.response_representation = Google::Apis::SafebrowsingV4::FetchThreatListUpdatesResponse::Representation
          command.response_class = Google::Apis::SafebrowsingV4::FetchThreatListUpdatesResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the Safe Browsing threat lists available for download.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SafebrowsingV4::ListThreatListsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SafebrowsingV4::ListThreatListsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_threat_lists(fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v4/threatLists', options)
          command.response_representation = Google::Apis::SafebrowsingV4::ListThreatListsResponse::Representation
          command.response_class = Google::Apis::SafebrowsingV4::ListThreatListsResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Finds the threat entries that match the Safe Browsing lists.
        # @param [Google::Apis::SafebrowsingV4::FindThreatMatchesRequest] find_threat_matches_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SafebrowsingV4::FindThreatMatchesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SafebrowsingV4::FindThreatMatchesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def find_threat_matches(find_threat_matches_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v4/threatMatches:find', options)
          command.request_representation = Google::Apis::SafebrowsingV4::FindThreatMatchesRequest::Representation
          command.request_object = find_threat_matches_request_object
          command.response_representation = Google::Apis::SafebrowsingV4::FindThreatMatchesResponse::Representation
          command.response_class = Google::Apis::SafebrowsingV4::FindThreatMatchesResponse
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
