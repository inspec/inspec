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
    module ScriptV1
      # Apps Script API
      #
      # Manages and executes Google Apps Script projects.
      #
      # @example
      #    require 'google/apis/script_v1'
      #
      #    Script = Google::Apis::ScriptV1 # Alias the module
      #    service = Script::ScriptService.new
      #
      # @see https://developers.google.com/apps-script/api/
      class ScriptService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://script.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # List information about processes made by or on behalf of a user,
        # such as process type and current status.
        # @param [Fixnum] page_size
        #   The maximum number of returned processes per page of results. Defaults to
        #   50.
        # @param [String] page_token
        #   The token for continuing a previous list request on the next page. This
        #   should be set to the value of `nextPageToken` from a previous response.
        # @param [String] user_process_filter_deployment_id
        #   Optional field used to limit returned processes to those originating from
        #   projects with a specific deployment ID.
        # @param [String] user_process_filter_end_time
        #   Optional field used to limit returned processes to those that completed
        #   on or before the given timestamp.
        # @param [String] user_process_filter_function_name
        #   Optional field used to limit returned processes to those originating from
        #   a script function with the given function name.
        # @param [String] user_process_filter_project_name
        #   Optional field used to limit returned processes to those originating from
        #   projects with project names containing a specific string.
        # @param [String] user_process_filter_script_id
        #   Optional field used to limit returned processes to those originating from
        #   projects with a specific script ID.
        # @param [String] user_process_filter_start_time
        #   Optional field used to limit returned processes to those that were
        #   started on or after the given timestamp.
        # @param [Array<String>, String] user_process_filter_statuses
        #   Optional field used to limit returned processes to those having one of
        #   the specified process statuses.
        # @param [Array<String>, String] user_process_filter_types
        #   Optional field used to limit returned processes to those having one of
        #   the specified process types.
        # @param [Array<String>, String] user_process_filter_user_access_levels
        #   Optional field used to limit returned processes to those having one of
        #   the specified user access levels.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ScriptV1::ListUserProcessesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ScriptV1::ListUserProcessesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_processes(page_size: nil, page_token: nil, user_process_filter_deployment_id: nil, user_process_filter_end_time: nil, user_process_filter_function_name: nil, user_process_filter_project_name: nil, user_process_filter_script_id: nil, user_process_filter_start_time: nil, user_process_filter_statuses: nil, user_process_filter_types: nil, user_process_filter_user_access_levels: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/processes', options)
          command.response_representation = Google::Apis::ScriptV1::ListUserProcessesResponse::Representation
          command.response_class = Google::Apis::ScriptV1::ListUserProcessesResponse
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['userProcessFilter.deploymentId'] = user_process_filter_deployment_id unless user_process_filter_deployment_id.nil?
          command.query['userProcessFilter.endTime'] = user_process_filter_end_time unless user_process_filter_end_time.nil?
          command.query['userProcessFilter.functionName'] = user_process_filter_function_name unless user_process_filter_function_name.nil?
          command.query['userProcessFilter.projectName'] = user_process_filter_project_name unless user_process_filter_project_name.nil?
          command.query['userProcessFilter.scriptId'] = user_process_filter_script_id unless user_process_filter_script_id.nil?
          command.query['userProcessFilter.startTime'] = user_process_filter_start_time unless user_process_filter_start_time.nil?
          command.query['userProcessFilter.statuses'] = user_process_filter_statuses unless user_process_filter_statuses.nil?
          command.query['userProcessFilter.types'] = user_process_filter_types unless user_process_filter_types.nil?
          command.query['userProcessFilter.userAccessLevels'] = user_process_filter_user_access_levels unless user_process_filter_user_access_levels.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List information about a script's executed processes, such as process type
        # and current status.
        # @param [Fixnum] page_size
        #   The maximum number of returned processes per page of results. Defaults to
        #   50.
        # @param [String] page_token
        #   The token for continuing a previous list request on the next page. This
        #   should be set to the value of `nextPageToken` from a previous response.
        # @param [String] script_id
        #   The script ID of the project whose processes are listed.
        # @param [String] script_process_filter_deployment_id
        #   Optional field used to limit returned processes to those originating from
        #   projects with a specific deployment ID.
        # @param [String] script_process_filter_end_time
        #   Optional field used to limit returned processes to those that completed
        #   on or before the given timestamp.
        # @param [String] script_process_filter_function_name
        #   Optional field used to limit returned processes to those originating from
        #   a script function with the given function name.
        # @param [String] script_process_filter_start_time
        #   Optional field used to limit returned processes to those that were
        #   started on or after the given timestamp.
        # @param [Array<String>, String] script_process_filter_statuses
        #   Optional field used to limit returned processes to those having one of
        #   the specified process statuses.
        # @param [Array<String>, String] script_process_filter_types
        #   Optional field used to limit returned processes to those having one of
        #   the specified process types.
        # @param [Array<String>, String] script_process_filter_user_access_levels
        #   Optional field used to limit returned processes to those having one of
        #   the specified user access levels.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ScriptV1::ListScriptProcessesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ScriptV1::ListScriptProcessesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_process_script_processes(page_size: nil, page_token: nil, script_id: nil, script_process_filter_deployment_id: nil, script_process_filter_end_time: nil, script_process_filter_function_name: nil, script_process_filter_start_time: nil, script_process_filter_statuses: nil, script_process_filter_types: nil, script_process_filter_user_access_levels: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/processes:listScriptProcesses', options)
          command.response_representation = Google::Apis::ScriptV1::ListScriptProcessesResponse::Representation
          command.response_class = Google::Apis::ScriptV1::ListScriptProcessesResponse
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['scriptId'] = script_id unless script_id.nil?
          command.query['scriptProcessFilter.deploymentId'] = script_process_filter_deployment_id unless script_process_filter_deployment_id.nil?
          command.query['scriptProcessFilter.endTime'] = script_process_filter_end_time unless script_process_filter_end_time.nil?
          command.query['scriptProcessFilter.functionName'] = script_process_filter_function_name unless script_process_filter_function_name.nil?
          command.query['scriptProcessFilter.startTime'] = script_process_filter_start_time unless script_process_filter_start_time.nil?
          command.query['scriptProcessFilter.statuses'] = script_process_filter_statuses unless script_process_filter_statuses.nil?
          command.query['scriptProcessFilter.types'] = script_process_filter_types unless script_process_filter_types.nil?
          command.query['scriptProcessFilter.userAccessLevels'] = script_process_filter_user_access_levels unless script_process_filter_user_access_levels.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new, empty script project with no script files and a base
        # manifest file.
        # @param [Google::Apis::ScriptV1::CreateProjectRequest] create_project_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ScriptV1::Project] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ScriptV1::Project]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project(create_project_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/projects', options)
          command.request_representation = Google::Apis::ScriptV1::CreateProjectRequest::Representation
          command.request_object = create_project_request_object
          command.response_representation = Google::Apis::ScriptV1::Project::Representation
          command.response_class = Google::Apis::ScriptV1::Project
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a script project's metadata.
        # @param [String] script_id
        #   The script project's Drive ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ScriptV1::Project] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ScriptV1::Project]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project(script_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/projects/{scriptId}', options)
          command.response_representation = Google::Apis::ScriptV1::Project::Representation
          command.response_class = Google::Apis::ScriptV1::Project
          command.params['scriptId'] = script_id unless script_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the content of the script project, including the code source and
        # metadata for each script file.
        # @param [String] script_id
        #   The script project's Drive ID.
        # @param [Fixnum] version_number
        #   The version number of the project to retrieve. If not provided, the
        #   project's HEAD version is returned.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ScriptV1::Content] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ScriptV1::Content]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_content(script_id, version_number: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/projects/{scriptId}/content', options)
          command.response_representation = Google::Apis::ScriptV1::Content::Representation
          command.response_class = Google::Apis::ScriptV1::Content
          command.params['scriptId'] = script_id unless script_id.nil?
          command.query['versionNumber'] = version_number unless version_number.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get metrics data for scripts, such as number of executions and
        # active users.
        # @param [String] script_id
        #   Required field indicating the script to get metrics for.
        # @param [String] metrics_filter_deployment_id
        #   Optional field indicating a specific deployment to retrieve metrics from.
        # @param [String] metrics_granularity
        #   Required field indicating what granularity of metrics are returned.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ScriptV1::Metrics] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ScriptV1::Metrics]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_metrics(script_id, metrics_filter_deployment_id: nil, metrics_granularity: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/projects/{scriptId}/metrics', options)
          command.response_representation = Google::Apis::ScriptV1::Metrics::Representation
          command.response_class = Google::Apis::ScriptV1::Metrics
          command.params['scriptId'] = script_id unless script_id.nil?
          command.query['metricsFilter.deploymentId'] = metrics_filter_deployment_id unless metrics_filter_deployment_id.nil?
          command.query['metricsGranularity'] = metrics_granularity unless metrics_granularity.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the content of the specified script project.
        # This content is stored as the HEAD version, and is used when the script is
        # executed as a trigger, in the script editor, in add-on preview mode, or as
        # a web app or Apps Script API in development mode. This clears all the
        # existing files in the project.
        # @param [String] script_id
        #   The script project's Drive ID.
        # @param [Google::Apis::ScriptV1::Content] content_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ScriptV1::Content] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ScriptV1::Content]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_project_content(script_id, content_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v1/projects/{scriptId}/content', options)
          command.request_representation = Google::Apis::ScriptV1::Content::Representation
          command.request_object = content_object
          command.response_representation = Google::Apis::ScriptV1::Content::Representation
          command.response_class = Google::Apis::ScriptV1::Content
          command.params['scriptId'] = script_id unless script_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a deployment of an Apps Script project.
        # @param [String] script_id
        #   The script project's Drive ID.
        # @param [Google::Apis::ScriptV1::DeploymentConfig] deployment_config_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ScriptV1::Deployment] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ScriptV1::Deployment]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_deployment(script_id, deployment_config_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/projects/{scriptId}/deployments', options)
          command.request_representation = Google::Apis::ScriptV1::DeploymentConfig::Representation
          command.request_object = deployment_config_object
          command.response_representation = Google::Apis::ScriptV1::Deployment::Representation
          command.response_class = Google::Apis::ScriptV1::Deployment
          command.params['scriptId'] = script_id unless script_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a deployment of an Apps Script project.
        # @param [String] script_id
        #   The script project's Drive ID.
        # @param [String] deployment_id
        #   The deployment ID to be undeployed.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ScriptV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ScriptV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_deployment(script_id, deployment_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/projects/{scriptId}/deployments/{deploymentId}', options)
          command.response_representation = Google::Apis::ScriptV1::Empty::Representation
          command.response_class = Google::Apis::ScriptV1::Empty
          command.params['scriptId'] = script_id unless script_id.nil?
          command.params['deploymentId'] = deployment_id unless deployment_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a deployment of an Apps Script project.
        # @param [String] script_id
        #   The script project's Drive ID.
        # @param [String] deployment_id
        #   The deployment ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ScriptV1::Deployment] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ScriptV1::Deployment]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_deployment(script_id, deployment_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/projects/{scriptId}/deployments/{deploymentId}', options)
          command.response_representation = Google::Apis::ScriptV1::Deployment::Representation
          command.response_class = Google::Apis::ScriptV1::Deployment
          command.params['scriptId'] = script_id unless script_id.nil?
          command.params['deploymentId'] = deployment_id unless deployment_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the deployments of an Apps Script project.
        # @param [String] script_id
        #   The script project's Drive ID.
        # @param [Fixnum] page_size
        #   The maximum number of deployments on each returned page. Defaults to 50.
        # @param [String] page_token
        #   The token for continuing a previous list request on the next page. This
        #   should be set to the value of `nextPageToken` from a previous response.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ScriptV1::ListDeploymentsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ScriptV1::ListDeploymentsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_deployments(script_id, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/projects/{scriptId}/deployments', options)
          command.response_representation = Google::Apis::ScriptV1::ListDeploymentsResponse::Representation
          command.response_class = Google::Apis::ScriptV1::ListDeploymentsResponse
          command.params['scriptId'] = script_id unless script_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a deployment of an Apps Script project.
        # @param [String] script_id
        #   The script project's Drive ID.
        # @param [String] deployment_id
        #   The deployment ID for this deployment.
        # @param [Google::Apis::ScriptV1::UpdateDeploymentRequest] update_deployment_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ScriptV1::Deployment] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ScriptV1::Deployment]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_deployment(script_id, deployment_id, update_deployment_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v1/projects/{scriptId}/deployments/{deploymentId}', options)
          command.request_representation = Google::Apis::ScriptV1::UpdateDeploymentRequest::Representation
          command.request_object = update_deployment_request_object
          command.response_representation = Google::Apis::ScriptV1::Deployment::Representation
          command.response_class = Google::Apis::ScriptV1::Deployment
          command.params['scriptId'] = script_id unless script_id.nil?
          command.params['deploymentId'] = deployment_id unless deployment_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new immutable version using the current code, with a unique
        # version number.
        # @param [String] script_id
        #   The script project's Drive ID.
        # @param [Google::Apis::ScriptV1::Version] version_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ScriptV1::Version] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ScriptV1::Version]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_version(script_id, version_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/projects/{scriptId}/versions', options)
          command.request_representation = Google::Apis::ScriptV1::Version::Representation
          command.request_object = version_object
          command.response_representation = Google::Apis::ScriptV1::Version::Representation
          command.response_class = Google::Apis::ScriptV1::Version
          command.params['scriptId'] = script_id unless script_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a version of a script project.
        # @param [String] script_id
        #   The script project's Drive ID.
        # @param [Fixnum] version_number
        #   The version number.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ScriptV1::Version] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ScriptV1::Version]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_version(script_id, version_number, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/projects/{scriptId}/versions/{versionNumber}', options)
          command.response_representation = Google::Apis::ScriptV1::Version::Representation
          command.response_class = Google::Apis::ScriptV1::Version
          command.params['scriptId'] = script_id unless script_id.nil?
          command.params['versionNumber'] = version_number unless version_number.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List the versions of a script project.
        # @param [String] script_id
        #   The script project's Drive ID.
        # @param [Fixnum] page_size
        #   The maximum number of versions on each returned page. Defaults to 50.
        # @param [String] page_token
        #   The token for continuing a previous list request on the next page. This
        #   should be set to the value of `nextPageToken` from a previous response.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ScriptV1::ListVersionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ScriptV1::ListVersionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_versions(script_id, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/projects/{scriptId}/versions', options)
          command.response_representation = Google::Apis::ScriptV1::ListVersionsResponse::Representation
          command.response_class = Google::Apis::ScriptV1::ListVersionsResponse
          command.params['scriptId'] = script_id unless script_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Runs a function in an Apps Script project. The script project must be
        # deployed for use with the Apps Script API and the calling application must
        # share the same Cloud Platform project.
        # This method requires authorization with an OAuth 2.0 token that includes at
        # least one of the scopes listed in the
        # [Authorization](#authorization-scopes) section; script projects that do not
        # require authorization cannot be executed through this API. To find the
        # correct scopes to include in the authentication token, open the project in
        # the script editor, then select **File > Project properties** and click the
        # **Scopes** tab.
        # The error `403, PERMISSION_DENIED: The caller does not have permission`
        # indicates that the Cloud Platform project used to authorize the request is
        # not the same as the one used by the script.
        # @param [String] script_id
        #   The script ID of the script to be executed. To find the script ID, open
        #   the project in the script editor and select **File > Project properties**.
        # @param [Google::Apis::ScriptV1::ExecutionRequest] execution_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ScriptV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ScriptV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def run_script(script_id, execution_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/scripts/{scriptId}:run', options)
          command.request_representation = Google::Apis::ScriptV1::ExecutionRequest::Representation
          command.request_object = execution_request_object
          command.response_representation = Google::Apis::ScriptV1::Operation::Representation
          command.response_class = Google::Apis::ScriptV1::Operation
          command.params['scriptId'] = script_id unless script_id.nil?
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
