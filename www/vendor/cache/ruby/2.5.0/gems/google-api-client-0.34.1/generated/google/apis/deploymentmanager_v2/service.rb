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
    module DeploymentmanagerV2
      # Google Cloud Deployment Manager API
      #
      # Declares, configures, and deploys complex solutions on Google Cloud Platform.
      #
      # @example
      #    require 'google/apis/deploymentmanager_v2'
      #
      #    Deploymentmanager = Google::Apis::DeploymentmanagerV2 # Alias the module
      #    service = Deploymentmanager::DeploymentManagerService.new
      #
      # @see https://cloud.google.com/deployment-manager/
      class DeploymentManagerService < Google::Apis::Core::BaseService
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
          super('https://www.googleapis.com/', 'deploymentmanager/v2/projects/')
          @batch_path = 'batch/deploymentmanager/v2'
        end
        
        # Cancels and removes the preview currently associated with the deployment.
        # @param [String] project
        #   The project ID for this request.
        # @param [String] deployment
        #   The name of the deployment for this request.
        # @param [Google::Apis::DeploymentmanagerV2::DeploymentsCancelPreviewRequest] deployments_cancel_preview_request_object
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
        # @yieldparam result [Google::Apis::DeploymentmanagerV2::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DeploymentmanagerV2::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def cancel_deployment_preview(project, deployment, deployments_cancel_preview_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{project}/global/deployments/{deployment}/cancelPreview', options)
          command.request_representation = Google::Apis::DeploymentmanagerV2::DeploymentsCancelPreviewRequest::Representation
          command.request_object = deployments_cancel_preview_request_object
          command.response_representation = Google::Apis::DeploymentmanagerV2::Operation::Representation
          command.response_class = Google::Apis::DeploymentmanagerV2::Operation
          command.params['project'] = project unless project.nil?
          command.params['deployment'] = deployment unless deployment.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a deployment and all of the resources in the deployment.
        # @param [String] project
        #   The project ID for this request.
        # @param [String] deployment
        #   The name of the deployment for this request.
        # @param [String] delete_policy
        #   Sets the policy to use for deleting resources.
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
        # @yieldparam result [Google::Apis::DeploymentmanagerV2::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DeploymentmanagerV2::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_deployment(project, deployment, delete_policy: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, '{project}/global/deployments/{deployment}', options)
          command.response_representation = Google::Apis::DeploymentmanagerV2::Operation::Representation
          command.response_class = Google::Apis::DeploymentmanagerV2::Operation
          command.params['project'] = project unless project.nil?
          command.params['deployment'] = deployment unless deployment.nil?
          command.query['deletePolicy'] = delete_policy unless delete_policy.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets information about a specific deployment.
        # @param [String] project
        #   The project ID for this request.
        # @param [String] deployment
        #   The name of the deployment for this request.
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
        # @yieldparam result [Google::Apis::DeploymentmanagerV2::Deployment] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DeploymentmanagerV2::Deployment]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_deployment(project, deployment, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{project}/global/deployments/{deployment}', options)
          command.response_representation = Google::Apis::DeploymentmanagerV2::Deployment::Representation
          command.response_class = Google::Apis::DeploymentmanagerV2::Deployment
          command.params['project'] = project unless project.nil?
          command.params['deployment'] = deployment unless deployment.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the access control policy for a resource. May be empty if no such policy
        # or resource exists.
        # @param [String] project
        #   Project ID for this request.
        # @param [String] resource
        #   Name or id of the resource for this request.
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
        # @yieldparam result [Google::Apis::DeploymentmanagerV2::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DeploymentmanagerV2::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_deployment_iam_policy(project, resource, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{project}/global/deployments/{resource}/getIamPolicy', options)
          command.response_representation = Google::Apis::DeploymentmanagerV2::Policy::Representation
          command.response_class = Google::Apis::DeploymentmanagerV2::Policy
          command.params['project'] = project unless project.nil?
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a deployment and all of the resources described by the deployment
        # manifest.
        # @param [String] project
        #   The project ID for this request.
        # @param [Google::Apis::DeploymentmanagerV2::Deployment] deployment_object
        # @param [String] create_policy
        #   Sets the policy to use for creating new resources.
        # @param [Boolean] preview
        #   If set to true, creates a deployment and creates "shell" resources but does
        #   not actually instantiate these resources. This allows you to preview what your
        #   deployment looks like. After previewing a deployment, you can deploy your
        #   resources by making a request with the update() method or you can use the
        #   cancelPreview() method to cancel the preview altogether. Note that the
        #   deployment will still exist after you cancel the preview and you must
        #   separately delete this deployment if you want to remove it.
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
        # @yieldparam result [Google::Apis::DeploymentmanagerV2::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DeploymentmanagerV2::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_deployment(project, deployment_object = nil, create_policy: nil, preview: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{project}/global/deployments', options)
          command.request_representation = Google::Apis::DeploymentmanagerV2::Deployment::Representation
          command.request_object = deployment_object
          command.response_representation = Google::Apis::DeploymentmanagerV2::Operation::Representation
          command.response_class = Google::Apis::DeploymentmanagerV2::Operation
          command.params['project'] = project unless project.nil?
          command.query['createPolicy'] = create_policy unless create_policy.nil?
          command.query['preview'] = preview unless preview.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all deployments for a given project.
        # @param [String] project
        #   The project ID for this request.
        # @param [String] filter
        #   A filter expression that filters resources listed in the response. The
        #   expression must specify the field name, a comparison operator, and the value
        #   that you want to use for filtering. The value must be a string, a number, or a
        #   boolean. The comparison operator must be either =, !=, >, or <.
        #   For example, if you are filtering Compute Engine instances, you can exclude
        #   instances named example-instance by specifying name != example-instance.
        #   You can also filter nested fields. For example, you could specify scheduling.
        #   automaticRestart = false to include instances only if they are not scheduled
        #   for automatic restarts. You can use filtering on nested fields to filter based
        #   on resource labels.
        #   To filter on multiple expressions, provide each separate expression within
        #   parentheses. For example, (scheduling.automaticRestart = true) (cpuPlatform = "
        #   Intel Skylake"). By default, each expression is an AND expression. However,
        #   you can include AND and OR expressions explicitly. For example, (cpuPlatform =
        #   "Intel Skylake") OR (cpuPlatform = "Intel Broadwell") AND (scheduling.
        #   automaticRestart = true).
        # @param [Fixnum] max_results
        #   The maximum number of results per page that should be returned. If the number
        #   of available results is larger than maxResults, Compute Engine returns a
        #   nextPageToken that can be used to get the next page of results in subsequent
        #   list requests. Acceptable values are 0 to 500, inclusive. (Default: 500)
        # @param [String] order_by
        #   Sorts list results by a certain order. By default, results are returned in
        #   alphanumerical order based on the resource name.
        #   You can also sort results in descending order based on the creation timestamp
        #   using orderBy="creationTimestamp desc". This sorts results based on the
        #   creationTimestamp field in reverse chronological order (newest result first).
        #   Use this to sort resources like operations so that the newest operation is
        #   returned first.
        #   Currently, only sorting by name or creationTimestamp desc is supported.
        # @param [String] page_token
        #   Specifies a page token to use. Set pageToken to the nextPageToken returned by
        #   a previous list request to get the next page of results.
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
        # @yieldparam result [Google::Apis::DeploymentmanagerV2::ListDeploymentsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DeploymentmanagerV2::ListDeploymentsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_deployments(project, filter: nil, max_results: nil, order_by: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{project}/global/deployments', options)
          command.response_representation = Google::Apis::DeploymentmanagerV2::ListDeploymentsResponse::Representation
          command.response_class = Google::Apis::DeploymentmanagerV2::ListDeploymentsResponse
          command.params['project'] = project unless project.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a deployment and all of the resources described by the deployment
        # manifest. This method supports patch semantics.
        # @param [String] project
        #   The project ID for this request.
        # @param [String] deployment
        #   The name of the deployment for this request.
        # @param [Google::Apis::DeploymentmanagerV2::Deployment] deployment_object
        # @param [String] create_policy
        #   Sets the policy to use for creating new resources.
        # @param [String] delete_policy
        #   Sets the policy to use for deleting resources.
        # @param [Boolean] preview
        #   If set to true, updates the deployment and creates and updates the "shell"
        #   resources but does not actually alter or instantiate these resources. This
        #   allows you to preview what your deployment will look like. You can use this
        #   intent to preview how an update would affect your deployment. You must provide
        #   a target.config with a configuration if this is set to true. After previewing
        #   a deployment, you can deploy your resources by making a request with the
        #   update() or you can cancelPreview() to remove the preview altogether. Note
        #   that the deployment will still exist after you cancel the preview and you must
        #   separately delete this deployment if you want to remove it.
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
        # @yieldparam result [Google::Apis::DeploymentmanagerV2::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DeploymentmanagerV2::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_deployment(project, deployment, deployment_object = nil, create_policy: nil, delete_policy: nil, preview: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, '{project}/global/deployments/{deployment}', options)
          command.request_representation = Google::Apis::DeploymentmanagerV2::Deployment::Representation
          command.request_object = deployment_object
          command.response_representation = Google::Apis::DeploymentmanagerV2::Operation::Representation
          command.response_class = Google::Apis::DeploymentmanagerV2::Operation
          command.params['project'] = project unless project.nil?
          command.params['deployment'] = deployment unless deployment.nil?
          command.query['createPolicy'] = create_policy unless create_policy.nil?
          command.query['deletePolicy'] = delete_policy unless delete_policy.nil?
          command.query['preview'] = preview unless preview.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets the access control policy on the specified resource. Replaces any
        # existing policy.
        # @param [String] project
        #   Project ID for this request.
        # @param [String] resource
        #   Name or id of the resource for this request.
        # @param [Google::Apis::DeploymentmanagerV2::GlobalSetPolicyRequest] global_set_policy_request_object
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
        # @yieldparam result [Google::Apis::DeploymentmanagerV2::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DeploymentmanagerV2::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def set_deployment_iam_policy(project, resource, global_set_policy_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{project}/global/deployments/{resource}/setIamPolicy', options)
          command.request_representation = Google::Apis::DeploymentmanagerV2::GlobalSetPolicyRequest::Representation
          command.request_object = global_set_policy_request_object
          command.response_representation = Google::Apis::DeploymentmanagerV2::Policy::Representation
          command.response_class = Google::Apis::DeploymentmanagerV2::Policy
          command.params['project'] = project unless project.nil?
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Stops an ongoing operation. This does not roll back any work that has already
        # been completed, but prevents any new work from being started.
        # @param [String] project
        #   The project ID for this request.
        # @param [String] deployment
        #   The name of the deployment for this request.
        # @param [Google::Apis::DeploymentmanagerV2::DeploymentsStopRequest] deployments_stop_request_object
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
        # @yieldparam result [Google::Apis::DeploymentmanagerV2::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DeploymentmanagerV2::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def stop_deployment(project, deployment, deployments_stop_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{project}/global/deployments/{deployment}/stop', options)
          command.request_representation = Google::Apis::DeploymentmanagerV2::DeploymentsStopRequest::Representation
          command.request_object = deployments_stop_request_object
          command.response_representation = Google::Apis::DeploymentmanagerV2::Operation::Representation
          command.response_class = Google::Apis::DeploymentmanagerV2::Operation
          command.params['project'] = project unless project.nil?
          command.params['deployment'] = deployment unless deployment.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns permissions that a caller has on the specified resource.
        # @param [String] project
        #   Project ID for this request.
        # @param [String] resource
        #   Name or id of the resource for this request.
        # @param [Google::Apis::DeploymentmanagerV2::TestPermissionsRequest] test_permissions_request_object
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
        # @yieldparam result [Google::Apis::DeploymentmanagerV2::TestPermissionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DeploymentmanagerV2::TestPermissionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def test_deployment_iam_permissions(project, resource, test_permissions_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{project}/global/deployments/{resource}/testIamPermissions', options)
          command.request_representation = Google::Apis::DeploymentmanagerV2::TestPermissionsRequest::Representation
          command.request_object = test_permissions_request_object
          command.response_representation = Google::Apis::DeploymentmanagerV2::TestPermissionsResponse::Representation
          command.response_class = Google::Apis::DeploymentmanagerV2::TestPermissionsResponse
          command.params['project'] = project unless project.nil?
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a deployment and all of the resources described by the deployment
        # manifest.
        # @param [String] project
        #   The project ID for this request.
        # @param [String] deployment
        #   The name of the deployment for this request.
        # @param [Google::Apis::DeploymentmanagerV2::Deployment] deployment_object
        # @param [String] create_policy
        #   Sets the policy to use for creating new resources.
        # @param [String] delete_policy
        #   Sets the policy to use for deleting resources.
        # @param [Boolean] preview
        #   If set to true, updates the deployment and creates and updates the "shell"
        #   resources but does not actually alter or instantiate these resources. This
        #   allows you to preview what your deployment will look like. You can use this
        #   intent to preview how an update would affect your deployment. You must provide
        #   a target.config with a configuration if this is set to true. After previewing
        #   a deployment, you can deploy your resources by making a request with the
        #   update() or you can cancelPreview() to remove the preview altogether. Note
        #   that the deployment will still exist after you cancel the preview and you must
        #   separately delete this deployment if you want to remove it.
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
        # @yieldparam result [Google::Apis::DeploymentmanagerV2::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DeploymentmanagerV2::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_deployment(project, deployment, deployment_object = nil, create_policy: nil, delete_policy: nil, preview: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, '{project}/global/deployments/{deployment}', options)
          command.request_representation = Google::Apis::DeploymentmanagerV2::Deployment::Representation
          command.request_object = deployment_object
          command.response_representation = Google::Apis::DeploymentmanagerV2::Operation::Representation
          command.response_class = Google::Apis::DeploymentmanagerV2::Operation
          command.params['project'] = project unless project.nil?
          command.params['deployment'] = deployment unless deployment.nil?
          command.query['createPolicy'] = create_policy unless create_policy.nil?
          command.query['deletePolicy'] = delete_policy unless delete_policy.nil?
          command.query['preview'] = preview unless preview.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets information about a specific manifest.
        # @param [String] project
        #   The project ID for this request.
        # @param [String] deployment
        #   The name of the deployment for this request.
        # @param [String] manifest
        #   The name of the manifest for this request.
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
        # @yieldparam result [Google::Apis::DeploymentmanagerV2::Manifest] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DeploymentmanagerV2::Manifest]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_manifest(project, deployment, manifest, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{project}/global/deployments/{deployment}/manifests/{manifest}', options)
          command.response_representation = Google::Apis::DeploymentmanagerV2::Manifest::Representation
          command.response_class = Google::Apis::DeploymentmanagerV2::Manifest
          command.params['project'] = project unless project.nil?
          command.params['deployment'] = deployment unless deployment.nil?
          command.params['manifest'] = manifest unless manifest.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all manifests for a given deployment.
        # @param [String] project
        #   The project ID for this request.
        # @param [String] deployment
        #   The name of the deployment for this request.
        # @param [String] filter
        #   A filter expression that filters resources listed in the response. The
        #   expression must specify the field name, a comparison operator, and the value
        #   that you want to use for filtering. The value must be a string, a number, or a
        #   boolean. The comparison operator must be either =, !=, >, or <.
        #   For example, if you are filtering Compute Engine instances, you can exclude
        #   instances named example-instance by specifying name != example-instance.
        #   You can also filter nested fields. For example, you could specify scheduling.
        #   automaticRestart = false to include instances only if they are not scheduled
        #   for automatic restarts. You can use filtering on nested fields to filter based
        #   on resource labels.
        #   To filter on multiple expressions, provide each separate expression within
        #   parentheses. For example, (scheduling.automaticRestart = true) (cpuPlatform = "
        #   Intel Skylake"). By default, each expression is an AND expression. However,
        #   you can include AND and OR expressions explicitly. For example, (cpuPlatform =
        #   "Intel Skylake") OR (cpuPlatform = "Intel Broadwell") AND (scheduling.
        #   automaticRestart = true).
        # @param [Fixnum] max_results
        #   The maximum number of results per page that should be returned. If the number
        #   of available results is larger than maxResults, Compute Engine returns a
        #   nextPageToken that can be used to get the next page of results in subsequent
        #   list requests. Acceptable values are 0 to 500, inclusive. (Default: 500)
        # @param [String] order_by
        #   Sorts list results by a certain order. By default, results are returned in
        #   alphanumerical order based on the resource name.
        #   You can also sort results in descending order based on the creation timestamp
        #   using orderBy="creationTimestamp desc". This sorts results based on the
        #   creationTimestamp field in reverse chronological order (newest result first).
        #   Use this to sort resources like operations so that the newest operation is
        #   returned first.
        #   Currently, only sorting by name or creationTimestamp desc is supported.
        # @param [String] page_token
        #   Specifies a page token to use. Set pageToken to the nextPageToken returned by
        #   a previous list request to get the next page of results.
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
        # @yieldparam result [Google::Apis::DeploymentmanagerV2::ListManifestsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DeploymentmanagerV2::ListManifestsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_manifests(project, deployment, filter: nil, max_results: nil, order_by: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{project}/global/deployments/{deployment}/manifests', options)
          command.response_representation = Google::Apis::DeploymentmanagerV2::ListManifestsResponse::Representation
          command.response_class = Google::Apis::DeploymentmanagerV2::ListManifestsResponse
          command.params['project'] = project unless project.nil?
          command.params['deployment'] = deployment unless deployment.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets information about a specific operation.
        # @param [String] project
        #   The project ID for this request.
        # @param [String] operation
        #   The name of the operation for this request.
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
        # @yieldparam result [Google::Apis::DeploymentmanagerV2::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DeploymentmanagerV2::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_operation(project, operation, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{project}/global/operations/{operation}', options)
          command.response_representation = Google::Apis::DeploymentmanagerV2::Operation::Representation
          command.response_class = Google::Apis::DeploymentmanagerV2::Operation
          command.params['project'] = project unless project.nil?
          command.params['operation'] = operation unless operation.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all operations for a project.
        # @param [String] project
        #   The project ID for this request.
        # @param [String] filter
        #   A filter expression that filters resources listed in the response. The
        #   expression must specify the field name, a comparison operator, and the value
        #   that you want to use for filtering. The value must be a string, a number, or a
        #   boolean. The comparison operator must be either =, !=, >, or <.
        #   For example, if you are filtering Compute Engine instances, you can exclude
        #   instances named example-instance by specifying name != example-instance.
        #   You can also filter nested fields. For example, you could specify scheduling.
        #   automaticRestart = false to include instances only if they are not scheduled
        #   for automatic restarts. You can use filtering on nested fields to filter based
        #   on resource labels.
        #   To filter on multiple expressions, provide each separate expression within
        #   parentheses. For example, (scheduling.automaticRestart = true) (cpuPlatform = "
        #   Intel Skylake"). By default, each expression is an AND expression. However,
        #   you can include AND and OR expressions explicitly. For example, (cpuPlatform =
        #   "Intel Skylake") OR (cpuPlatform = "Intel Broadwell") AND (scheduling.
        #   automaticRestart = true).
        # @param [Fixnum] max_results
        #   The maximum number of results per page that should be returned. If the number
        #   of available results is larger than maxResults, Compute Engine returns a
        #   nextPageToken that can be used to get the next page of results in subsequent
        #   list requests. Acceptable values are 0 to 500, inclusive. (Default: 500)
        # @param [String] order_by
        #   Sorts list results by a certain order. By default, results are returned in
        #   alphanumerical order based on the resource name.
        #   You can also sort results in descending order based on the creation timestamp
        #   using orderBy="creationTimestamp desc". This sorts results based on the
        #   creationTimestamp field in reverse chronological order (newest result first).
        #   Use this to sort resources like operations so that the newest operation is
        #   returned first.
        #   Currently, only sorting by name or creationTimestamp desc is supported.
        # @param [String] page_token
        #   Specifies a page token to use. Set pageToken to the nextPageToken returned by
        #   a previous list request to get the next page of results.
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
        # @yieldparam result [Google::Apis::DeploymentmanagerV2::ListOperationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DeploymentmanagerV2::ListOperationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_operations(project, filter: nil, max_results: nil, order_by: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{project}/global/operations', options)
          command.response_representation = Google::Apis::DeploymentmanagerV2::ListOperationsResponse::Representation
          command.response_class = Google::Apis::DeploymentmanagerV2::ListOperationsResponse
          command.params['project'] = project unless project.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets information about a single resource.
        # @param [String] project
        #   The project ID for this request.
        # @param [String] deployment
        #   The name of the deployment for this request.
        # @param [String] resource
        #   The name of the resource for this request.
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
        # @yieldparam result [Google::Apis::DeploymentmanagerV2::Resource] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DeploymentmanagerV2::Resource]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_resource(project, deployment, resource, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{project}/global/deployments/{deployment}/resources/{resource}', options)
          command.response_representation = Google::Apis::DeploymentmanagerV2::Resource::Representation
          command.response_class = Google::Apis::DeploymentmanagerV2::Resource
          command.params['project'] = project unless project.nil?
          command.params['deployment'] = deployment unless deployment.nil?
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all resources in a given deployment.
        # @param [String] project
        #   The project ID for this request.
        # @param [String] deployment
        #   The name of the deployment for this request.
        # @param [String] filter
        #   A filter expression that filters resources listed in the response. The
        #   expression must specify the field name, a comparison operator, and the value
        #   that you want to use for filtering. The value must be a string, a number, or a
        #   boolean. The comparison operator must be either =, !=, >, or <.
        #   For example, if you are filtering Compute Engine instances, you can exclude
        #   instances named example-instance by specifying name != example-instance.
        #   You can also filter nested fields. For example, you could specify scheduling.
        #   automaticRestart = false to include instances only if they are not scheduled
        #   for automatic restarts. You can use filtering on nested fields to filter based
        #   on resource labels.
        #   To filter on multiple expressions, provide each separate expression within
        #   parentheses. For example, (scheduling.automaticRestart = true) (cpuPlatform = "
        #   Intel Skylake"). By default, each expression is an AND expression. However,
        #   you can include AND and OR expressions explicitly. For example, (cpuPlatform =
        #   "Intel Skylake") OR (cpuPlatform = "Intel Broadwell") AND (scheduling.
        #   automaticRestart = true).
        # @param [Fixnum] max_results
        #   The maximum number of results per page that should be returned. If the number
        #   of available results is larger than maxResults, Compute Engine returns a
        #   nextPageToken that can be used to get the next page of results in subsequent
        #   list requests. Acceptable values are 0 to 500, inclusive. (Default: 500)
        # @param [String] order_by
        #   Sorts list results by a certain order. By default, results are returned in
        #   alphanumerical order based on the resource name.
        #   You can also sort results in descending order based on the creation timestamp
        #   using orderBy="creationTimestamp desc". This sorts results based on the
        #   creationTimestamp field in reverse chronological order (newest result first).
        #   Use this to sort resources like operations so that the newest operation is
        #   returned first.
        #   Currently, only sorting by name or creationTimestamp desc is supported.
        # @param [String] page_token
        #   Specifies a page token to use. Set pageToken to the nextPageToken returned by
        #   a previous list request to get the next page of results.
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
        # @yieldparam result [Google::Apis::DeploymentmanagerV2::ListResourcesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DeploymentmanagerV2::ListResourcesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_resources(project, deployment, filter: nil, max_results: nil, order_by: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{project}/global/deployments/{deployment}/resources', options)
          command.response_representation = Google::Apis::DeploymentmanagerV2::ListResourcesResponse::Representation
          command.response_class = Google::Apis::DeploymentmanagerV2::ListResourcesResponse
          command.params['project'] = project unless project.nil?
          command.params['deployment'] = deployment unless deployment.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all resource types for Deployment Manager.
        # @param [String] project
        #   The project ID for this request.
        # @param [String] filter
        #   A filter expression that filters resources listed in the response. The
        #   expression must specify the field name, a comparison operator, and the value
        #   that you want to use for filtering. The value must be a string, a number, or a
        #   boolean. The comparison operator must be either =, !=, >, or <.
        #   For example, if you are filtering Compute Engine instances, you can exclude
        #   instances named example-instance by specifying name != example-instance.
        #   You can also filter nested fields. For example, you could specify scheduling.
        #   automaticRestart = false to include instances only if they are not scheduled
        #   for automatic restarts. You can use filtering on nested fields to filter based
        #   on resource labels.
        #   To filter on multiple expressions, provide each separate expression within
        #   parentheses. For example, (scheduling.automaticRestart = true) (cpuPlatform = "
        #   Intel Skylake"). By default, each expression is an AND expression. However,
        #   you can include AND and OR expressions explicitly. For example, (cpuPlatform =
        #   "Intel Skylake") OR (cpuPlatform = "Intel Broadwell") AND (scheduling.
        #   automaticRestart = true).
        # @param [Fixnum] max_results
        #   The maximum number of results per page that should be returned. If the number
        #   of available results is larger than maxResults, Compute Engine returns a
        #   nextPageToken that can be used to get the next page of results in subsequent
        #   list requests. Acceptable values are 0 to 500, inclusive. (Default: 500)
        # @param [String] order_by
        #   Sorts list results by a certain order. By default, results are returned in
        #   alphanumerical order based on the resource name.
        #   You can also sort results in descending order based on the creation timestamp
        #   using orderBy="creationTimestamp desc". This sorts results based on the
        #   creationTimestamp field in reverse chronological order (newest result first).
        #   Use this to sort resources like operations so that the newest operation is
        #   returned first.
        #   Currently, only sorting by name or creationTimestamp desc is supported.
        # @param [String] page_token
        #   Specifies a page token to use. Set pageToken to the nextPageToken returned by
        #   a previous list request to get the next page of results.
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
        # @yieldparam result [Google::Apis::DeploymentmanagerV2::ListTypesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DeploymentmanagerV2::ListTypesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_types(project, filter: nil, max_results: nil, order_by: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{project}/global/types', options)
          command.response_representation = Google::Apis::DeploymentmanagerV2::ListTypesResponse::Representation
          command.response_class = Google::Apis::DeploymentmanagerV2::ListTypesResponse
          command.params['project'] = project unless project.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
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
