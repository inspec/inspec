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
    module KgsearchV1
      # Knowledge Graph Search API
      #
      # Searches the Google Knowledge Graph for entities.
      #
      # @example
      #    require 'google/apis/kgsearch_v1'
      #
      #    Kgsearch = Google::Apis::KgsearchV1 # Alias the module
      #    service = Kgsearch::KgsearchService.new
      #
      # @see https://developers.google.com/knowledge-graph/
      class KgsearchService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://kgsearch.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Searches Knowledge Graph for entities that match the constraints.
        # A list of matched entities will be returned in response, which will be in
        # JSON-LD format and compatible with http://schema.org
        # @param [Array<String>, String] ids
        #   The list of entity id to be used for search instead of query string.
        #   To specify multiple ids in the HTTP request, repeat the parameter in the
        #   URL as in ...?ids=A&ids=B
        # @param [Boolean] indent
        #   Enables indenting of json results.
        # @param [Array<String>, String] languages
        #   The list of language codes (defined in ISO 693) to run the query with,
        #   e.g. 'en'.
        # @param [Fixnum] limit
        #   Limits the number of entities to be returned.
        # @param [Boolean] prefix
        #   Enables prefix match against names and aliases of entities
        # @param [String] query
        #   The literal query string for search.
        # @param [Array<String>, String] types
        #   Restricts returned entities with these types, e.g. Person
        #   (as defined in http://schema.org/Person). If multiple types are specified,
        #   returned entities will contain one or more of these types.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::KgsearchV1::SearchResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::KgsearchV1::SearchResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def search_entities(ids: nil, indent: nil, languages: nil, limit: nil, prefix: nil, query: nil, types: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/entities:search', options)
          command.response_representation = Google::Apis::KgsearchV1::SearchResponse::Representation
          command.response_class = Google::Apis::KgsearchV1::SearchResponse
          command.query['ids'] = ids unless ids.nil?
          command.query['indent'] = indent unless indent.nil?
          command.query['languages'] = languages unless languages.nil?
          command.query['limit'] = limit unless limit.nil?
          command.query['prefix'] = prefix unless prefix.nil?
          command.query['query'] = query unless query.nil?
          command.query['types'] = types unless types.nil?
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
