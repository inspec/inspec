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
    module ToolresultsV1beta3
      # Cloud Tool Results API
      #
      # Reads and publishes results from Firebase Test Lab.
      #
      # @example
      #    require 'google/apis/toolresults_v1beta3'
      #
      #    Toolresults = Google::Apis::ToolresultsV1beta3 # Alias the module
      #    service = Toolresults::ToolResultsService.new
      #
      # @see https://firebase.google.com/docs/test-lab/
      class ToolResultsService < Google::Apis::Core::BaseService
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
          super('https://www.googleapis.com/', 'toolresults/v1beta3/projects/')
          @batch_path = 'batch/toolresults/v1beta3'
        end
        
        # Gets the Tool Results settings for a project.
        # May return any of the following canonical error codes:
        # - PERMISSION_DENIED - if the user is not authorized to read from project
        # @param [String] project_id
        #   A Project id.
        #   Required.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ToolresultsV1beta3::ProjectSettings] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ToolresultsV1beta3::ProjectSettings]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_settings(project_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{projectId}/settings', options)
          command.response_representation = Google::Apis::ToolresultsV1beta3::ProjectSettings::Representation
          command.response_class = Google::Apis::ToolresultsV1beta3::ProjectSettings
          command.params['projectId'] = project_id unless project_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates resources for settings which have not yet been set.
        # Currently, this creates a single resource: a Google Cloud Storage bucket, to
        # be used as the default bucket for this project. The bucket is created in an
        # FTL-own storage project. Except for in rare cases, calling this method in
        # parallel from multiple clients will only create a single bucket. In order to
        # avoid unnecessary storage charges, the bucket is configured to automatically
        # delete objects older than 90 days.
        # The bucket is created with the following permissions: - Owner access for
        # owners of central storage project (FTL-owned) - Writer access for owners/
        # editors of customer project - Reader access for viewers of customer project
        # The default ACL on objects created in the bucket is: - Owner access for owners
        # of central storage project - Reader access for owners/editors/viewers of
        # customer project See Google Cloud Storage documentation for more details.
        # If there is already a default bucket set and the project can access the bucket,
        # this call does nothing. However, if the project doesn't have the permission
        # to access the bucket or the bucket is deleted, a new bucket will be created.
        # May return any canonical error codes, including the following:
        # - PERMISSION_DENIED - if the user is not authorized to write to project - Any
        # error code raised by Google Cloud Storage
        # @param [String] project_id
        #   A Project id.
        #   Required.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ToolresultsV1beta3::ProjectSettings] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ToolresultsV1beta3::ProjectSettings]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def initialize_project_settings(project_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{projectId}:initializeSettings', options)
          command.response_representation = Google::Apis::ToolresultsV1beta3::ProjectSettings::Representation
          command.response_class = Google::Apis::ToolresultsV1beta3::ProjectSettings
          command.params['projectId'] = project_id unless project_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a History.
        # The returned History will have the id set.
        # May return any of the following canonical error codes:
        # - PERMISSION_DENIED - if the user is not authorized to write to project -
        # INVALID_ARGUMENT - if the request is malformed - NOT_FOUND - if the containing
        # project does not exist
        # @param [String] project_id
        #   A Project id.
        #   Required.
        # @param [Google::Apis::ToolresultsV1beta3::History] history_object
        # @param [String] request_id
        #   A unique request ID for server to detect duplicated requests. For example, a
        #   UUID.
        #   Optional, but strongly recommended.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ToolresultsV1beta3::History] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ToolresultsV1beta3::History]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_history(project_id, history_object = nil, request_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{projectId}/histories', options)
          command.request_representation = Google::Apis::ToolresultsV1beta3::History::Representation
          command.request_object = history_object
          command.response_representation = Google::Apis::ToolresultsV1beta3::History::Representation
          command.response_class = Google::Apis::ToolresultsV1beta3::History
          command.params['projectId'] = project_id unless project_id.nil?
          command.query['requestId'] = request_id unless request_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a History.
        # May return any of the following canonical error codes:
        # - PERMISSION_DENIED - if the user is not authorized to read project -
        # INVALID_ARGUMENT - if the request is malformed - NOT_FOUND - if the History
        # does not exist
        # @param [String] project_id
        #   A Project id.
        #   Required.
        # @param [String] history_id
        #   A History id.
        #   Required.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ToolresultsV1beta3::History] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ToolresultsV1beta3::History]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_history(project_id, history_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{projectId}/histories/{historyId}', options)
          command.response_representation = Google::Apis::ToolresultsV1beta3::History::Representation
          command.response_class = Google::Apis::ToolresultsV1beta3::History
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['historyId'] = history_id unless history_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists Histories for a given Project.
        # The histories are sorted by modification time in descending order. The
        # history_id key will be used to order the history with the same modification
        # time.
        # May return any of the following canonical error codes:
        # - PERMISSION_DENIED - if the user is not authorized to read project -
        # INVALID_ARGUMENT - if the request is malformed - NOT_FOUND - if the History
        # does not exist
        # @param [String] project_id
        #   A Project id.
        #   Required.
        # @param [String] filter_by_name
        #   If set, only return histories with the given name.
        #   Optional.
        # @param [Fixnum] page_size
        #   The maximum number of Histories to fetch.
        #   Default value: 20. The server will use this default if the field is not set or
        #   has a value of 0. Any value greater than 100 will be treated as 100.
        #   Optional.
        # @param [String] page_token
        #   A continuation token to resume the query at the next item.
        #   Optional.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ToolresultsV1beta3::ListHistoriesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ToolresultsV1beta3::ListHistoriesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_histories(project_id, filter_by_name: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{projectId}/histories', options)
          command.response_representation = Google::Apis::ToolresultsV1beta3::ListHistoriesResponse::Representation
          command.response_class = Google::Apis::ToolresultsV1beta3::ListHistoriesResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.query['filterByName'] = filter_by_name unless filter_by_name.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates an Execution.
        # The returned Execution will have the id set.
        # May return any of the following canonical error codes:
        # - PERMISSION_DENIED - if the user is not authorized to write to project -
        # INVALID_ARGUMENT - if the request is malformed - NOT_FOUND - if the containing
        # History does not exist
        # @param [String] project_id
        #   A Project id.
        #   Required.
        # @param [String] history_id
        #   A History id.
        #   Required.
        # @param [Google::Apis::ToolresultsV1beta3::Execution] execution_object
        # @param [String] request_id
        #   A unique request ID for server to detect duplicated requests. For example, a
        #   UUID.
        #   Optional, but strongly recommended.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ToolresultsV1beta3::Execution] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ToolresultsV1beta3::Execution]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_history_execution(project_id, history_id, execution_object = nil, request_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{projectId}/histories/{historyId}/executions', options)
          command.request_representation = Google::Apis::ToolresultsV1beta3::Execution::Representation
          command.request_object = execution_object
          command.response_representation = Google::Apis::ToolresultsV1beta3::Execution::Representation
          command.response_class = Google::Apis::ToolresultsV1beta3::Execution
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['historyId'] = history_id unless history_id.nil?
          command.query['requestId'] = request_id unless request_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets an Execution.
        # May return any of the following canonical error codes:
        # - PERMISSION_DENIED - if the user is not authorized to write to project -
        # INVALID_ARGUMENT - if the request is malformed - NOT_FOUND - if the Execution
        # does not exist
        # @param [String] project_id
        #   A Project id.
        #   Required.
        # @param [String] history_id
        #   A History id.
        #   Required.
        # @param [String] execution_id
        #   An Execution id.
        #   Required.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ToolresultsV1beta3::Execution] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ToolresultsV1beta3::Execution]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_history_execution(project_id, history_id, execution_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{projectId}/histories/{historyId}/executions/{executionId}', options)
          command.response_representation = Google::Apis::ToolresultsV1beta3::Execution::Representation
          command.response_class = Google::Apis::ToolresultsV1beta3::Execution
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['historyId'] = history_id unless history_id.nil?
          command.params['executionId'] = execution_id unless execution_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists Executions for a given History.
        # The executions are sorted by creation_time in descending order. The
        # execution_id key will be used to order the executions with the same
        # creation_time.
        # May return any of the following canonical error codes:
        # - PERMISSION_DENIED - if the user is not authorized to read project -
        # INVALID_ARGUMENT - if the request is malformed - NOT_FOUND - if the containing
        # History does not exist
        # @param [String] project_id
        #   A Project id.
        #   Required.
        # @param [String] history_id
        #   A History id.
        #   Required.
        # @param [Fixnum] page_size
        #   The maximum number of Executions to fetch.
        #   Default value: 25. The server will use this default if the field is not set or
        #   has a value of 0.
        #   Optional.
        # @param [String] page_token
        #   A continuation token to resume the query at the next item.
        #   Optional.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ToolresultsV1beta3::ListExecutionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ToolresultsV1beta3::ListExecutionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_history_executions(project_id, history_id, page_size: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{projectId}/histories/{historyId}/executions', options)
          command.response_representation = Google::Apis::ToolresultsV1beta3::ListExecutionsResponse::Representation
          command.response_class = Google::Apis::ToolresultsV1beta3::ListExecutionsResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['historyId'] = history_id unless history_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing Execution with the supplied partial entity.
        # May return any of the following canonical error codes:
        # - PERMISSION_DENIED - if the user is not authorized to write to project -
        # INVALID_ARGUMENT - if the request is malformed - FAILED_PRECONDITION - if the
        # requested state transition is illegal - NOT_FOUND - if the containing History
        # does not exist
        # @param [String] project_id
        #   A Project id. Required.
        # @param [String] history_id
        #   Required.
        # @param [String] execution_id
        #   Required.
        # @param [Google::Apis::ToolresultsV1beta3::Execution] execution_object
        # @param [String] request_id
        #   A unique request ID for server to detect duplicated requests. For example, a
        #   UUID.
        #   Optional, but strongly recommended.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ToolresultsV1beta3::Execution] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ToolresultsV1beta3::Execution]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_history_execution(project_id, history_id, execution_id, execution_object = nil, request_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, '{projectId}/histories/{historyId}/executions/{executionId}', options)
          command.request_representation = Google::Apis::ToolresultsV1beta3::Execution::Representation
          command.request_object = execution_object
          command.response_representation = Google::Apis::ToolresultsV1beta3::Execution::Representation
          command.response_class = Google::Apis::ToolresultsV1beta3::Execution
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['historyId'] = history_id unless history_id.nil?
          command.params['executionId'] = execution_id unless execution_id.nil?
          command.query['requestId'] = request_id unless request_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a single screenshot cluster by its ID
        # @param [String] project_id
        #   A Project id.
        #   Required.
        # @param [String] history_id
        #   A History id.
        #   Required.
        # @param [String] execution_id
        #   An Execution id.
        #   Required.
        # @param [String] cluster_id
        #   A Cluster id
        #   Required.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ToolresultsV1beta3::ScreenshotCluster] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ToolresultsV1beta3::ScreenshotCluster]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_history_execution_cluster(project_id, history_id, execution_id, cluster_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{projectId}/histories/{historyId}/executions/{executionId}/clusters/{clusterId}', options)
          command.response_representation = Google::Apis::ToolresultsV1beta3::ScreenshotCluster::Representation
          command.response_class = Google::Apis::ToolresultsV1beta3::ScreenshotCluster
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['historyId'] = history_id unless history_id.nil?
          command.params['executionId'] = execution_id unless execution_id.nil?
          command.params['clusterId'] = cluster_id unless cluster_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists Screenshot Clusters
        # Returns the list of screenshot clusters corresponding to an execution.
        # Screenshot clusters are created after the execution is finished. Clusters are
        # created from a set of screenshots. Between any two screenshots, a matching
        # score is calculated based off their metadata that determines how similar they
        # are. Screenshots are placed in the cluster that has screens which have the
        # highest matching scores.
        # @param [String] project_id
        #   A Project id.
        #   Required.
        # @param [String] history_id
        #   A History id.
        #   Required.
        # @param [String] execution_id
        #   An Execution id.
        #   Required.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ToolresultsV1beta3::ListScreenshotClustersResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ToolresultsV1beta3::ListScreenshotClustersResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_history_execution_clusters(project_id, history_id, execution_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{projectId}/histories/{historyId}/executions/{executionId}/clusters', options)
          command.response_representation = Google::Apis::ToolresultsV1beta3::ListScreenshotClustersResponse::Representation
          command.response_class = Google::Apis::ToolresultsV1beta3::ListScreenshotClustersResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['historyId'] = history_id unless history_id.nil?
          command.params['executionId'] = execution_id unless execution_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a Step.
        # The returned Step will have the id set.
        # May return any of the following canonical error codes:
        # - PERMISSION_DENIED - if the user is not authorized to write to project -
        # INVALID_ARGUMENT - if the request is malformed - FAILED_PRECONDITION - if the
        # step is too large (more than 10Mib) - NOT_FOUND - if the containing Execution
        # does not exist
        # @param [String] project_id
        #   Required. A Project id.
        # @param [String] history_id
        #   Required. A History id.
        # @param [String] execution_id
        #   Required. An Execution id.
        # @param [Google::Apis::ToolresultsV1beta3::Step] step_object
        # @param [String] request_id
        #   A unique request ID for server to detect duplicated requests. For example, a
        #   UUID.
        #   Optional, but strongly recommended.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ToolresultsV1beta3::Step] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ToolresultsV1beta3::Step]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_history_execution_step(project_id, history_id, execution_id, step_object = nil, request_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{projectId}/histories/{historyId}/executions/{executionId}/steps', options)
          command.request_representation = Google::Apis::ToolresultsV1beta3::Step::Representation
          command.request_object = step_object
          command.response_representation = Google::Apis::ToolresultsV1beta3::Step::Representation
          command.response_class = Google::Apis::ToolresultsV1beta3::Step
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['historyId'] = history_id unless history_id.nil?
          command.params['executionId'] = execution_id unless execution_id.nil?
          command.query['requestId'] = request_id unless request_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a Step.
        # May return any of the following canonical error codes:
        # - PERMISSION_DENIED - if the user is not authorized to read project -
        # INVALID_ARGUMENT - if the request is malformed - NOT_FOUND - if the Step does
        # not exist
        # @param [String] project_id
        #   A Project id.
        #   Required.
        # @param [String] history_id
        #   A History id.
        #   Required.
        # @param [String] execution_id
        #   A Execution id.
        #   Required.
        # @param [String] step_id
        #   A Step id.
        #   Required.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ToolresultsV1beta3::Step] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ToolresultsV1beta3::Step]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_history_execution_step(project_id, history_id, execution_id, step_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{projectId}/histories/{historyId}/executions/{executionId}/steps/{stepId}', options)
          command.response_representation = Google::Apis::ToolresultsV1beta3::Step::Representation
          command.response_class = Google::Apis::ToolresultsV1beta3::Step
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['historyId'] = history_id unless history_id.nil?
          command.params['executionId'] = execution_id unless execution_id.nil?
          command.params['stepId'] = step_id unless step_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a PerfMetricsSummary.
        # May return any of the following error code(s): - NOT_FOUND - The specified
        # PerfMetricsSummary does not exist
        # @param [String] project_id
        #   The cloud project
        # @param [String] history_id
        #   A tool results history ID.
        # @param [String] execution_id
        #   A tool results execution ID.
        # @param [String] step_id
        #   A tool results step ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ToolresultsV1beta3::PerfMetricsSummary] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ToolresultsV1beta3::PerfMetricsSummary]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_history_execution_step_perf_metrics_summary(project_id, history_id, execution_id, step_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{projectId}/histories/{historyId}/executions/{executionId}/steps/{stepId}/perfMetricsSummary', options)
          command.response_representation = Google::Apis::ToolresultsV1beta3::PerfMetricsSummary::Representation
          command.response_class = Google::Apis::ToolresultsV1beta3::PerfMetricsSummary
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['historyId'] = history_id unless history_id.nil?
          command.params['executionId'] = execution_id unless execution_id.nil?
          command.params['stepId'] = step_id unless step_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists Steps for a given Execution.
        # The steps are sorted by creation_time in descending order. The step_id key
        # will be used to order the steps with the same creation_time.
        # May return any of the following canonical error codes:
        # - PERMISSION_DENIED - if the user is not authorized to read project -
        # INVALID_ARGUMENT - if the request is malformed - FAILED_PRECONDITION - if an
        # argument in the request happens to be invalid; e.g. if an attempt is made to
        # list the children of a nonexistent Step - NOT_FOUND - if the containing
        # Execution does not exist
        # @param [String] project_id
        #   A Project id.
        #   Required.
        # @param [String] history_id
        #   A History id.
        #   Required.
        # @param [String] execution_id
        #   A Execution id.
        #   Required.
        # @param [Fixnum] page_size
        #   The maximum number of Steps to fetch.
        #   Default value: 25. The server will use this default if the field is not set or
        #   has a value of 0.
        #   Optional.
        # @param [String] page_token
        #   A continuation token to resume the query at the next item.
        #   Optional.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ToolresultsV1beta3::ListStepsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ToolresultsV1beta3::ListStepsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_history_execution_steps(project_id, history_id, execution_id, page_size: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{projectId}/histories/{historyId}/executions/{executionId}/steps', options)
          command.response_representation = Google::Apis::ToolresultsV1beta3::ListStepsResponse::Representation
          command.response_class = Google::Apis::ToolresultsV1beta3::ListStepsResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['historyId'] = history_id unless history_id.nil?
          command.params['executionId'] = execution_id unless execution_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing Step with the supplied partial entity.
        # May return any of the following canonical error codes:
        # - PERMISSION_DENIED - if the user is not authorized to write project -
        # INVALID_ARGUMENT - if the request is malformed - FAILED_PRECONDITION - if the
        # requested state transition is illegal (e.g try to upload a duplicate xml file),
        # if the updated step is too large (more than 10Mib) - NOT_FOUND - if the
        # containing Execution does not exist
        # @param [String] project_id
        #   A Project id.
        #   Required.
        # @param [String] history_id
        #   A History id.
        #   Required.
        # @param [String] execution_id
        #   A Execution id.
        #   Required.
        # @param [String] step_id
        #   A Step id.
        #   Required.
        # @param [Google::Apis::ToolresultsV1beta3::Step] step_object
        # @param [String] request_id
        #   A unique request ID for server to detect duplicated requests. For example, a
        #   UUID.
        #   Optional, but strongly recommended.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ToolresultsV1beta3::Step] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ToolresultsV1beta3::Step]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_history_execution_step(project_id, history_id, execution_id, step_id, step_object = nil, request_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, '{projectId}/histories/{historyId}/executions/{executionId}/steps/{stepId}', options)
          command.request_representation = Google::Apis::ToolresultsV1beta3::Step::Representation
          command.request_object = step_object
          command.response_representation = Google::Apis::ToolresultsV1beta3::Step::Representation
          command.response_class = Google::Apis::ToolresultsV1beta3::Step
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['historyId'] = history_id unless history_id.nil?
          command.params['executionId'] = execution_id unless execution_id.nil?
          command.params['stepId'] = step_id unless step_id.nil?
          command.query['requestId'] = request_id unless request_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Publish xml files to an existing Step.
        # May return any of the following canonical error codes:
        # - PERMISSION_DENIED - if the user is not authorized to write project -
        # INVALID_ARGUMENT - if the request is malformed - FAILED_PRECONDITION - if the
        # requested state transition is illegal, e.g try to upload a duplicate xml file
        # or a file too large. - NOT_FOUND - if the containing Execution does not exist
        # @param [String] project_id
        #   A Project id.
        #   Required.
        # @param [String] history_id
        #   A History id.
        #   Required.
        # @param [String] execution_id
        #   A Execution id.
        #   Required.
        # @param [String] step_id
        #   A Step id. Note: This step must include a TestExecutionStep.
        #   Required.
        # @param [Google::Apis::ToolresultsV1beta3::PublishXunitXmlFilesRequest] publish_xunit_xml_files_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ToolresultsV1beta3::Step] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ToolresultsV1beta3::Step]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def publish_step_xunit_xml_files(project_id, history_id, execution_id, step_id, publish_xunit_xml_files_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{projectId}/histories/{historyId}/executions/{executionId}/steps/{stepId}:publishXunitXmlFiles', options)
          command.request_representation = Google::Apis::ToolresultsV1beta3::PublishXunitXmlFilesRequest::Representation
          command.request_object = publish_xunit_xml_files_request_object
          command.response_representation = Google::Apis::ToolresultsV1beta3::Step::Representation
          command.response_class = Google::Apis::ToolresultsV1beta3::Step
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['historyId'] = history_id unless history_id.nil?
          command.params['executionId'] = execution_id unless execution_id.nil?
          command.params['stepId'] = step_id unless step_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a PerfMetricsSummary resource. Returns the existing one if it has
        # already been created.
        # May return any of the following error code(s): - NOT_FOUND - The containing
        # Step does not exist
        # @param [String] project_id
        #   The cloud project
        # @param [String] history_id
        #   A tool results history ID.
        # @param [String] execution_id
        #   A tool results execution ID.
        # @param [String] step_id
        #   A tool results step ID.
        # @param [Google::Apis::ToolresultsV1beta3::PerfMetricsSummary] perf_metrics_summary_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ToolresultsV1beta3::PerfMetricsSummary] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ToolresultsV1beta3::PerfMetricsSummary]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_history_execution_step_perf_metrics_summary(project_id, history_id, execution_id, step_id, perf_metrics_summary_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{projectId}/histories/{historyId}/executions/{executionId}/steps/{stepId}/perfMetricsSummary', options)
          command.request_representation = Google::Apis::ToolresultsV1beta3::PerfMetricsSummary::Representation
          command.request_object = perf_metrics_summary_object
          command.response_representation = Google::Apis::ToolresultsV1beta3::PerfMetricsSummary::Representation
          command.response_class = Google::Apis::ToolresultsV1beta3::PerfMetricsSummary
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['historyId'] = history_id unless history_id.nil?
          command.params['executionId'] = execution_id unless execution_id.nil?
          command.params['stepId'] = step_id unless step_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a PerfSampleSeries.
        # May return any of the following error code(s): - ALREADY_EXISTS -
        # PerfMetricSummary already exists for the given Step - NOT_FOUND - The
        # containing Step does not exist
        # @param [String] project_id
        #   The cloud project
        # @param [String] history_id
        #   A tool results history ID.
        # @param [String] execution_id
        #   A tool results execution ID.
        # @param [String] step_id
        #   A tool results step ID.
        # @param [Google::Apis::ToolresultsV1beta3::PerfSampleSeries] perf_sample_series_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ToolresultsV1beta3::PerfSampleSeries] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ToolresultsV1beta3::PerfSampleSeries]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_history_execution_step_perf_sample_series(project_id, history_id, execution_id, step_id, perf_sample_series_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{projectId}/histories/{historyId}/executions/{executionId}/steps/{stepId}/perfSampleSeries', options)
          command.request_representation = Google::Apis::ToolresultsV1beta3::PerfSampleSeries::Representation
          command.request_object = perf_sample_series_object
          command.response_representation = Google::Apis::ToolresultsV1beta3::PerfSampleSeries::Representation
          command.response_class = Google::Apis::ToolresultsV1beta3::PerfSampleSeries
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['historyId'] = history_id unless history_id.nil?
          command.params['executionId'] = execution_id unless execution_id.nil?
          command.params['stepId'] = step_id unless step_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a PerfSampleSeries.
        # May return any of the following error code(s): - NOT_FOUND - The specified
        # PerfSampleSeries does not exist
        # @param [String] project_id
        #   The cloud project
        # @param [String] history_id
        #   A tool results history ID.
        # @param [String] execution_id
        #   A tool results execution ID.
        # @param [String] step_id
        #   A tool results step ID.
        # @param [String] sample_series_id
        #   A sample series id
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ToolresultsV1beta3::PerfSampleSeries] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ToolresultsV1beta3::PerfSampleSeries]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_history_execution_step_perf_sample_series(project_id, history_id, execution_id, step_id, sample_series_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{projectId}/histories/{historyId}/executions/{executionId}/steps/{stepId}/perfSampleSeries/{sampleSeriesId}', options)
          command.response_representation = Google::Apis::ToolresultsV1beta3::PerfSampleSeries::Representation
          command.response_class = Google::Apis::ToolresultsV1beta3::PerfSampleSeries
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['historyId'] = history_id unless history_id.nil?
          command.params['executionId'] = execution_id unless execution_id.nil?
          command.params['stepId'] = step_id unless step_id.nil?
          command.params['sampleSeriesId'] = sample_series_id unless sample_series_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists PerfSampleSeries for a given Step.
        # The request provides an optional filter which specifies one or more
        # PerfMetricsType to include in the result; if none returns all. The resulting
        # PerfSampleSeries are sorted by ids.
        # May return any of the following canonical error codes: - NOT_FOUND - The
        # containing Step does not exist
        # @param [String] project_id
        #   The cloud project
        # @param [String] history_id
        #   A tool results history ID.
        # @param [String] execution_id
        #   A tool results execution ID.
        # @param [String] step_id
        #   A tool results step ID.
        # @param [Array<String>, String] filter
        #   Specify one or more PerfMetricType values such as CPU to filter the result
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ToolresultsV1beta3::ListPerfSampleSeriesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ToolresultsV1beta3::ListPerfSampleSeriesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_history_execution_step_perf_sample_series(project_id, history_id, execution_id, step_id, filter: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{projectId}/histories/{historyId}/executions/{executionId}/steps/{stepId}/perfSampleSeries', options)
          command.response_representation = Google::Apis::ToolresultsV1beta3::ListPerfSampleSeriesResponse::Representation
          command.response_class = Google::Apis::ToolresultsV1beta3::ListPerfSampleSeriesResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['historyId'] = history_id unless history_id.nil?
          command.params['executionId'] = execution_id unless execution_id.nil?
          command.params['stepId'] = step_id unless step_id.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a batch of PerfSamples - a client can submit multiple batches of Perf
        # Samples through repeated calls to this method in order to split up a large
        # request payload - duplicates and existing timestamp entries will be ignored. -
        # the batch operation may partially succeed - the set of elements successfully
        # inserted is returned in the response (omits items which already existed in the
        # database).
        # May return any of the following canonical error codes: - NOT_FOUND - The
        # containing PerfSampleSeries does not exist
        # @param [String] project_id
        #   The cloud project
        # @param [String] history_id
        #   A tool results history ID.
        # @param [String] execution_id
        #   A tool results execution ID.
        # @param [String] step_id
        #   A tool results step ID.
        # @param [String] sample_series_id
        #   A sample series id
        # @param [Google::Apis::ToolresultsV1beta3::BatchCreatePerfSamplesRequest] batch_create_perf_samples_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ToolresultsV1beta3::BatchCreatePerfSamplesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ToolresultsV1beta3::BatchCreatePerfSamplesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_create_perf_samples(project_id, history_id, execution_id, step_id, sample_series_id, batch_create_perf_samples_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{projectId}/histories/{historyId}/executions/{executionId}/steps/{stepId}/perfSampleSeries/{sampleSeriesId}/samples:batchCreate', options)
          command.request_representation = Google::Apis::ToolresultsV1beta3::BatchCreatePerfSamplesRequest::Representation
          command.request_object = batch_create_perf_samples_request_object
          command.response_representation = Google::Apis::ToolresultsV1beta3::BatchCreatePerfSamplesResponse::Representation
          command.response_class = Google::Apis::ToolresultsV1beta3::BatchCreatePerfSamplesResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['historyId'] = history_id unless history_id.nil?
          command.params['executionId'] = execution_id unless execution_id.nil?
          command.params['stepId'] = step_id unless step_id.nil?
          command.params['sampleSeriesId'] = sample_series_id unless sample_series_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the Performance Samples of a given Sample Series - The list results are
        # sorted by timestamps ascending - The default page size is 500 samples; and
        # maximum size allowed 5000 - The response token indicates the last returned
        # PerfSample timestamp - When the results size exceeds the page size, submit a
        # subsequent request including the page token to return the rest of the samples
        # up to the page limit
        # May return any of the following canonical error codes: - OUT_OF_RANGE - The
        # specified request page_token is out of valid range - NOT_FOUND - The
        # containing PerfSampleSeries does not exist
        # @param [String] project_id
        #   The cloud project
        # @param [String] history_id
        #   A tool results history ID.
        # @param [String] execution_id
        #   A tool results execution ID.
        # @param [String] step_id
        #   A tool results step ID.
        # @param [String] sample_series_id
        #   A sample series id
        # @param [Fixnum] page_size
        #   The default page size is 500 samples, and the maximum size is 5000. If the
        #   page_size is greater than 5000, the effective page size will be 5000
        # @param [String] page_token
        #   Optional, the next_page_token returned in the previous response
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ToolresultsV1beta3::ListPerfSamplesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ToolresultsV1beta3::ListPerfSamplesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_history_execution_step_perf_sample_series_samples(project_id, history_id, execution_id, step_id, sample_series_id, page_size: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{projectId}/histories/{historyId}/executions/{executionId}/steps/{stepId}/perfSampleSeries/{sampleSeriesId}/samples', options)
          command.response_representation = Google::Apis::ToolresultsV1beta3::ListPerfSamplesResponse::Representation
          command.response_class = Google::Apis::ToolresultsV1beta3::ListPerfSamplesResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['historyId'] = history_id unless history_id.nil?
          command.params['executionId'] = execution_id unless execution_id.nil?
          command.params['stepId'] = step_id unless step_id.nil?
          command.params['sampleSeriesId'] = sample_series_id unless sample_series_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets details of a Test Case for a Step. Experimental test cases API. Still in
        # active development.
        # May return any of the following canonical error codes:
        # - PERMISSION_DENIED - if the user is not authorized to write to project -
        # INVALID_ARGUMENT - if the request is malformed - NOT_FOUND - if the containing
        # Test Case does not exist
        # @param [String] project_id
        #   A Project id.
        #   Required.
        # @param [String] history_id
        #   A History id.
        #   Required.
        # @param [String] execution_id
        #   A Execution id
        #   Required.
        # @param [String] step_id
        #   A Step id. Note: This step must include a TestExecutionStep.
        #   Required.
        # @param [String] test_case_id
        #   A Test Case id.
        #   Required.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ToolresultsV1beta3::TestCase] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ToolresultsV1beta3::TestCase]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_history_execution_step_test_case(project_id, history_id, execution_id, step_id, test_case_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{projectId}/histories/{historyId}/executions/{executionId}/steps/{stepId}/testCases/{testCaseId}', options)
          command.response_representation = Google::Apis::ToolresultsV1beta3::TestCase::Representation
          command.response_class = Google::Apis::ToolresultsV1beta3::TestCase
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['historyId'] = history_id unless history_id.nil?
          command.params['executionId'] = execution_id unless execution_id.nil?
          command.params['stepId'] = step_id unless step_id.nil?
          command.params['testCaseId'] = test_case_id unless test_case_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists Test Cases attached to a Step. Experimental test cases API. Still in
        # active development.
        # May return any of the following canonical error codes:
        # - PERMISSION_DENIED - if the user is not authorized to write to project -
        # INVALID_ARGUMENT - if the request is malformed - NOT_FOUND - if the containing
        # Step does not exist
        # @param [String] project_id
        #   A Project id.
        #   Required.
        # @param [String] history_id
        #   A History id.
        #   Required.
        # @param [String] execution_id
        #   A Execution id
        #   Required.
        # @param [String] step_id
        #   A Step id. Note: This step must include a TestExecutionStep.
        #   Required.
        # @param [Fixnum] page_size
        #   The maximum number of TestCases to fetch.
        #   Default value: 100. The server will use this default if the field is not set
        #   or has a value of 0.
        #   Optional.
        # @param [String] page_token
        #   A continuation token to resume the query at the next item.
        #   Optional.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ToolresultsV1beta3::ListTestCasesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ToolresultsV1beta3::ListTestCasesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_history_execution_step_test_cases(project_id, history_id, execution_id, step_id, page_size: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{projectId}/histories/{historyId}/executions/{executionId}/steps/{stepId}/testCases', options)
          command.response_representation = Google::Apis::ToolresultsV1beta3::ListTestCasesResponse::Representation
          command.response_class = Google::Apis::ToolresultsV1beta3::ListTestCasesResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['historyId'] = history_id unless history_id.nil?
          command.params['executionId'] = execution_id unless execution_id.nil?
          command.params['stepId'] = step_id unless step_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists thumbnails of images attached to a step.
        # May return any of the following canonical error codes: - PERMISSION_DENIED -
        # if the user is not authorized to read from the project, or from any of the
        # images - INVALID_ARGUMENT - if the request is malformed - NOT_FOUND - if the
        # step does not exist, or if any of the images do not exist
        # @param [String] project_id
        #   A Project id.
        #   Required.
        # @param [String] history_id
        #   A History id.
        #   Required.
        # @param [String] execution_id
        #   An Execution id.
        #   Required.
        # @param [String] step_id
        #   A Step id.
        #   Required.
        # @param [Fixnum] page_size
        #   The maximum number of thumbnails to fetch.
        #   Default value: 50. The server will use this default if the field is not set or
        #   has a value of 0.
        #   Optional.
        # @param [String] page_token
        #   A continuation token to resume the query at the next item.
        #   Optional.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ToolresultsV1beta3::ListStepThumbnailsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ToolresultsV1beta3::ListStepThumbnailsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_history_execution_step_thumbnails(project_id, history_id, execution_id, step_id, page_size: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{projectId}/histories/{historyId}/executions/{executionId}/steps/{stepId}/thumbnails', options)
          command.response_representation = Google::Apis::ToolresultsV1beta3::ListStepThumbnailsResponse::Representation
          command.response_class = Google::Apis::ToolresultsV1beta3::ListStepThumbnailsResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['historyId'] = history_id unless history_id.nil?
          command.params['executionId'] = execution_id unless execution_id.nil?
          command.params['stepId'] = step_id unless step_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
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
