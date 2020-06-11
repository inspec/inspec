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
    module ReplicapoolV1beta1
      # Replica Pool API
      #
      # The Replica Pool API allows users to declaratively provision and manage groups
      #  of Google Compute Engine instances based on a common template.
      #
      # @example
      #    require 'google/apis/replicapool_v1beta1'
      #
      #    Replicapool = Google::Apis::ReplicapoolV1beta1 # Alias the module
      #    service = Replicapool::ReplicapoolService.new
      #
      # @see https://developers.google.com/compute/docs/replica-pool/
      class ReplicapoolService < Google::Apis::Core::BaseService
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
          super('https://www.googleapis.com/', 'replicapool/v1beta1/projects/')
          @batch_path = 'batch/replicapool/v1beta1'
        end
        
        # Deletes a replica pool.
        # @param [String] project_name
        #   The project ID for this replica pool.
        # @param [String] zone
        #   The zone for this replica pool.
        # @param [String] pool_name
        #   The name of the replica pool for this request.
        # @param [Google::Apis::ReplicapoolV1beta1::PoolsDeleteRequest] pools_delete_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
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
        def delete_pool(project_name, zone, pool_name, pools_delete_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{projectName}/zones/{zone}/pools/{poolName}', options)
          command.request_representation = Google::Apis::ReplicapoolV1beta1::PoolsDeleteRequest::Representation
          command.request_object = pools_delete_request_object
          command.params['projectName'] = project_name unless project_name.nil?
          command.params['zone'] = zone unless zone.nil?
          command.params['poolName'] = pool_name unless pool_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets information about a single replica pool.
        # @param [String] project_name
        #   The project ID for this replica pool.
        # @param [String] zone
        #   The zone for this replica pool.
        # @param [String] pool_name
        #   The name of the replica pool for this request.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ReplicapoolV1beta1::Pool] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ReplicapoolV1beta1::Pool]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_pool(project_name, zone, pool_name, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{projectName}/zones/{zone}/pools/{poolName}', options)
          command.response_representation = Google::Apis::ReplicapoolV1beta1::Pool::Representation
          command.response_class = Google::Apis::ReplicapoolV1beta1::Pool
          command.params['projectName'] = project_name unless project_name.nil?
          command.params['zone'] = zone unless zone.nil?
          command.params['poolName'] = pool_name unless pool_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a new replica pool.
        # @param [String] project_name
        #   The project ID for this replica pool.
        # @param [String] zone
        #   The zone for this replica pool.
        # @param [Google::Apis::ReplicapoolV1beta1::Pool] pool_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ReplicapoolV1beta1::Pool] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ReplicapoolV1beta1::Pool]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_pool(project_name, zone, pool_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{projectName}/zones/{zone}/pools', options)
          command.request_representation = Google::Apis::ReplicapoolV1beta1::Pool::Representation
          command.request_object = pool_object
          command.response_representation = Google::Apis::ReplicapoolV1beta1::Pool::Representation
          command.response_class = Google::Apis::ReplicapoolV1beta1::Pool
          command.params['projectName'] = project_name unless project_name.nil?
          command.params['zone'] = zone unless zone.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all replica pools.
        # @param [String] project_name
        #   The project ID for this request.
        # @param [String] zone
        #   The zone for this replica pool.
        # @param [Fixnum] max_results
        #   Maximum count of results to be returned. Acceptable values are 0 to 100,
        #   inclusive. (Default: 50)
        # @param [String] page_token
        #   Set this to the nextPageToken value returned by a previous list request to
        #   obtain the next page of results from the previous list request.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ReplicapoolV1beta1::PoolsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ReplicapoolV1beta1::PoolsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_pools(project_name, zone, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{projectName}/zones/{zone}/pools', options)
          command.response_representation = Google::Apis::ReplicapoolV1beta1::PoolsListResponse::Representation
          command.response_class = Google::Apis::ReplicapoolV1beta1::PoolsListResponse
          command.params['projectName'] = project_name unless project_name.nil?
          command.params['zone'] = zone unless zone.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Resize a pool. This is an asynchronous operation, and multiple overlapping
        # resize requests can be made. Replica Pools will use the information from the
        # last resize request.
        # @param [String] project_name
        #   The project ID for this replica pool.
        # @param [String] zone
        #   The zone for this replica pool.
        # @param [String] pool_name
        #   The name of the replica pool for this request.
        # @param [Fixnum] num_replicas
        #   The desired number of replicas to resize to. If this number is larger than the
        #   existing number of replicas, new replicas will be added. If the number is
        #   smaller, then existing replicas will be deleted.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ReplicapoolV1beta1::Pool] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ReplicapoolV1beta1::Pool]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def resize_pool(project_name, zone, pool_name, num_replicas: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{projectName}/zones/{zone}/pools/{poolName}/resize', options)
          command.response_representation = Google::Apis::ReplicapoolV1beta1::Pool::Representation
          command.response_class = Google::Apis::ReplicapoolV1beta1::Pool
          command.params['projectName'] = project_name unless project_name.nil?
          command.params['zone'] = zone unless zone.nil?
          command.params['poolName'] = pool_name unless pool_name.nil?
          command.query['numReplicas'] = num_replicas unless num_replicas.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update the template used by the pool.
        # @param [String] project_name
        #   The project ID for this replica pool.
        # @param [String] zone
        #   The zone for this replica pool.
        # @param [String] pool_name
        #   The name of the replica pool for this request.
        # @param [Google::Apis::ReplicapoolV1beta1::Template] template_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
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
        def updatetemplate_pool(project_name, zone, pool_name, template_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{projectName}/zones/{zone}/pools/{poolName}/updateTemplate', options)
          command.request_representation = Google::Apis::ReplicapoolV1beta1::Template::Representation
          command.request_object = template_object
          command.params['projectName'] = project_name unless project_name.nil?
          command.params['zone'] = zone unless zone.nil?
          command.params['poolName'] = pool_name unless pool_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a replica from the pool.
        # @param [String] project_name
        #   The project ID for this request.
        # @param [String] zone
        #   The zone where the replica lives.
        # @param [String] pool_name
        #   The replica pool name for this request.
        # @param [String] replica_name
        #   The name of the replica for this request.
        # @param [Google::Apis::ReplicapoolV1beta1::ReplicasDeleteRequest] replicas_delete_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ReplicapoolV1beta1::Replica] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ReplicapoolV1beta1::Replica]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_replica(project_name, zone, pool_name, replica_name, replicas_delete_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{projectName}/zones/{zone}/pools/{poolName}/replicas/{replicaName}', options)
          command.request_representation = Google::Apis::ReplicapoolV1beta1::ReplicasDeleteRequest::Representation
          command.request_object = replicas_delete_request_object
          command.response_representation = Google::Apis::ReplicapoolV1beta1::Replica::Representation
          command.response_class = Google::Apis::ReplicapoolV1beta1::Replica
          command.params['projectName'] = project_name unless project_name.nil?
          command.params['zone'] = zone unless zone.nil?
          command.params['poolName'] = pool_name unless pool_name.nil?
          command.params['replicaName'] = replica_name unless replica_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets information about a specific replica.
        # @param [String] project_name
        #   The project ID for this request.
        # @param [String] zone
        #   The zone where the replica lives.
        # @param [String] pool_name
        #   The replica pool name for this request.
        # @param [String] replica_name
        #   The name of the replica for this request.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ReplicapoolV1beta1::Replica] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ReplicapoolV1beta1::Replica]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_replica(project_name, zone, pool_name, replica_name, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{projectName}/zones/{zone}/pools/{poolName}/replicas/{replicaName}', options)
          command.response_representation = Google::Apis::ReplicapoolV1beta1::Replica::Representation
          command.response_class = Google::Apis::ReplicapoolV1beta1::Replica
          command.params['projectName'] = project_name unless project_name.nil?
          command.params['zone'] = zone unless zone.nil?
          command.params['poolName'] = pool_name unless pool_name.nil?
          command.params['replicaName'] = replica_name unless replica_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all replicas in a pool.
        # @param [String] project_name
        #   The project ID for this request.
        # @param [String] zone
        #   The zone where the replica pool lives.
        # @param [String] pool_name
        #   The replica pool name for this request.
        # @param [Fixnum] max_results
        #   Maximum count of results to be returned. Acceptable values are 0 to 100,
        #   inclusive. (Default: 50)
        # @param [String] page_token
        #   Set this to the nextPageToken value returned by a previous list request to
        #   obtain the next page of results from the previous list request.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ReplicapoolV1beta1::ReplicasListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ReplicapoolV1beta1::ReplicasListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_replicas(project_name, zone, pool_name, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{projectName}/zones/{zone}/pools/{poolName}/replicas', options)
          command.response_representation = Google::Apis::ReplicapoolV1beta1::ReplicasListResponse::Representation
          command.response_class = Google::Apis::ReplicapoolV1beta1::ReplicasListResponse
          command.params['projectName'] = project_name unless project_name.nil?
          command.params['zone'] = zone unless zone.nil?
          command.params['poolName'] = pool_name unless pool_name.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Restarts a replica in a pool.
        # @param [String] project_name
        #   The project ID for this request.
        # @param [String] zone
        #   The zone where the replica lives.
        # @param [String] pool_name
        #   The replica pool name for this request.
        # @param [String] replica_name
        #   The name of the replica for this request.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ReplicapoolV1beta1::Replica] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ReplicapoolV1beta1::Replica]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def restart_replica(project_name, zone, pool_name, replica_name, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{projectName}/zones/{zone}/pools/{poolName}/replicas/{replicaName}/restart', options)
          command.response_representation = Google::Apis::ReplicapoolV1beta1::Replica::Representation
          command.response_class = Google::Apis::ReplicapoolV1beta1::Replica
          command.params['projectName'] = project_name unless project_name.nil?
          command.params['zone'] = zone unless zone.nil?
          command.params['poolName'] = pool_name unless pool_name.nil?
          command.params['replicaName'] = replica_name unless replica_name.nil?
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
