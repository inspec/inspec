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
    module DatastoreV1beta3
      # Cloud Datastore API
      #
      # Accesses the schemaless NoSQL database to provide fully managed, robust,
      #  scalable storage for your application.
      #
      # @example
      #    require 'google/apis/datastore_v1beta3'
      #
      #    Datastore = Google::Apis::DatastoreV1beta3 # Alias the module
      #    service = Datastore::DatastoreService.new
      #
      # @see https://cloud.google.com/datastore/
      class DatastoreService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://datastore.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Allocates IDs for the given keys, which is useful for referencing an entity
        # before it is inserted.
        # @param [String] project_id
        #   The ID of the project against which to make the request.
        # @param [Google::Apis::DatastoreV1beta3::AllocateIdsRequest] allocate_ids_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DatastoreV1beta3::AllocateIdsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DatastoreV1beta3::AllocateIdsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def allocate_project_ids(project_id, allocate_ids_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta3/projects/{projectId}:allocateIds', options)
          command.request_representation = Google::Apis::DatastoreV1beta3::AllocateIdsRequest::Representation
          command.request_object = allocate_ids_request_object
          command.response_representation = Google::Apis::DatastoreV1beta3::AllocateIdsResponse::Representation
          command.response_class = Google::Apis::DatastoreV1beta3::AllocateIdsResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Begins a new transaction.
        # @param [String] project_id
        #   The ID of the project against which to make the request.
        # @param [Google::Apis::DatastoreV1beta3::BeginTransactionRequest] begin_transaction_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DatastoreV1beta3::BeginTransactionResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DatastoreV1beta3::BeginTransactionResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def begin_project_transaction(project_id, begin_transaction_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta3/projects/{projectId}:beginTransaction', options)
          command.request_representation = Google::Apis::DatastoreV1beta3::BeginTransactionRequest::Representation
          command.request_object = begin_transaction_request_object
          command.response_representation = Google::Apis::DatastoreV1beta3::BeginTransactionResponse::Representation
          command.response_class = Google::Apis::DatastoreV1beta3::BeginTransactionResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Commits a transaction, optionally creating, deleting or modifying some
        # entities.
        # @param [String] project_id
        #   The ID of the project against which to make the request.
        # @param [Google::Apis::DatastoreV1beta3::CommitRequest] commit_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DatastoreV1beta3::CommitResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DatastoreV1beta3::CommitResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def commit_project(project_id, commit_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta3/projects/{projectId}:commit', options)
          command.request_representation = Google::Apis::DatastoreV1beta3::CommitRequest::Representation
          command.request_object = commit_request_object
          command.response_representation = Google::Apis::DatastoreV1beta3::CommitResponse::Representation
          command.response_class = Google::Apis::DatastoreV1beta3::CommitResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Looks up entities by key.
        # @param [String] project_id
        #   The ID of the project against which to make the request.
        # @param [Google::Apis::DatastoreV1beta3::LookupRequest] lookup_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DatastoreV1beta3::LookupResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DatastoreV1beta3::LookupResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def lookup_project(project_id, lookup_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta3/projects/{projectId}:lookup', options)
          command.request_representation = Google::Apis::DatastoreV1beta3::LookupRequest::Representation
          command.request_object = lookup_request_object
          command.response_representation = Google::Apis::DatastoreV1beta3::LookupResponse::Representation
          command.response_class = Google::Apis::DatastoreV1beta3::LookupResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Prevents the supplied keys' IDs from being auto-allocated by Cloud
        # Datastore. Used for imports only; other workloads are not supported.
        # @param [String] project_id
        #   The ID of the project against which to make the request.
        # @param [Google::Apis::DatastoreV1beta3::ReserveIdsRequest] reserve_ids_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DatastoreV1beta3::ReserveIdsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DatastoreV1beta3::ReserveIdsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def reserve_project_ids(project_id, reserve_ids_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta3/projects/{projectId}:reserveIds', options)
          command.request_representation = Google::Apis::DatastoreV1beta3::ReserveIdsRequest::Representation
          command.request_object = reserve_ids_request_object
          command.response_representation = Google::Apis::DatastoreV1beta3::ReserveIdsResponse::Representation
          command.response_class = Google::Apis::DatastoreV1beta3::ReserveIdsResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rolls back a transaction.
        # @param [String] project_id
        #   The ID of the project against which to make the request.
        # @param [Google::Apis::DatastoreV1beta3::RollbackRequest] rollback_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DatastoreV1beta3::RollbackResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DatastoreV1beta3::RollbackResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def rollback_project(project_id, rollback_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta3/projects/{projectId}:rollback', options)
          command.request_representation = Google::Apis::DatastoreV1beta3::RollbackRequest::Representation
          command.request_object = rollback_request_object
          command.response_representation = Google::Apis::DatastoreV1beta3::RollbackResponse::Representation
          command.response_class = Google::Apis::DatastoreV1beta3::RollbackResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Queries for entities.
        # @param [String] project_id
        #   The ID of the project against which to make the request.
        # @param [Google::Apis::DatastoreV1beta3::RunQueryRequest] run_query_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DatastoreV1beta3::RunQueryResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DatastoreV1beta3::RunQueryResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def run_project_query(project_id, run_query_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta3/projects/{projectId}:runQuery', options)
          command.request_representation = Google::Apis::DatastoreV1beta3::RunQueryRequest::Representation
          command.request_object = run_query_request_object
          command.response_representation = Google::Apis::DatastoreV1beta3::RunQueryResponse::Representation
          command.response_class = Google::Apis::DatastoreV1beta3::RunQueryResponse
          command.params['projectId'] = project_id unless project_id.nil?
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
