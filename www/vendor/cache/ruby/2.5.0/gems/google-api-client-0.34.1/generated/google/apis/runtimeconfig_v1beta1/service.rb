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
    module RuntimeconfigV1beta1
      # Cloud Runtime Configuration API
      #
      # The Runtime Configurator allows you to dynamically configure and expose
      #  variables through Google Cloud Platform. In addition, you can also set
      #  Watchers and Waiters that will watch for changes to your data and return based
      #  on certain conditions.
      #
      # @example
      #    require 'google/apis/runtimeconfig_v1beta1'
      #
      #    Runtimeconfig = Google::Apis::RuntimeconfigV1beta1 # Alias the module
      #    service = Runtimeconfig::CloudRuntimeConfigService.new
      #
      # @see https://cloud.google.com/deployment-manager/runtime-configurator/
      class CloudRuntimeConfigService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://runtimeconfig.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Creates a new RuntimeConfig resource. The configuration name must be
        # unique within project.
        # @param [String] parent
        #   The [project
        #   ID](https://support.google.com/cloud/answer/6158840?hl=en&ref_topic=6158848)
        #   for this request, in the format `projects/[PROJECT_ID]`.
        # @param [Google::Apis::RuntimeconfigV1beta1::RuntimeConfig] runtime_config_object
        # @param [String] request_id
        #   An optional but recommended unique `request_id`. If the server
        #   receives two `create()` requests  with the same
        #   `request_id`, then the second request will be ignored and the
        #   first resource created and stored in the backend is returned.
        #   Empty `request_id` fields are ignored.
        #   It is responsibility of the client to ensure uniqueness of the
        #   `request_id` strings.
        #   `request_id` strings are limited to 64 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RuntimeconfigV1beta1::RuntimeConfig] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RuntimeconfigV1beta1::RuntimeConfig]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_config(parent, runtime_config_object = nil, request_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+parent}/configs', options)
          command.request_representation = Google::Apis::RuntimeconfigV1beta1::RuntimeConfig::Representation
          command.request_object = runtime_config_object
          command.response_representation = Google::Apis::RuntimeconfigV1beta1::RuntimeConfig::Representation
          command.response_class = Google::Apis::RuntimeconfigV1beta1::RuntimeConfig
          command.params['parent'] = parent unless parent.nil?
          command.query['requestId'] = request_id unless request_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a RuntimeConfig resource.
        # @param [String] name
        #   The RuntimeConfig resource to delete, in the format:
        #   `projects/[PROJECT_ID]/configs/[CONFIG_NAME]`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RuntimeconfigV1beta1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RuntimeconfigV1beta1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_config(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::RuntimeconfigV1beta1::Empty::Representation
          command.response_class = Google::Apis::RuntimeconfigV1beta1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets information about a RuntimeConfig resource.
        # @param [String] name
        #   The name of the RuntimeConfig resource to retrieve, in the format:
        #   `projects/[PROJECT_ID]/configs/[CONFIG_NAME]`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RuntimeconfigV1beta1::RuntimeConfig] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RuntimeconfigV1beta1::RuntimeConfig]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_config(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::RuntimeconfigV1beta1::RuntimeConfig::Representation
          command.response_class = Google::Apis::RuntimeconfigV1beta1::RuntimeConfig
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the access control policy for a resource.
        # Returns an empty policy if the resource exists and does not have a policy
        # set.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Fixnum] options_requested_policy_version
        #   Optional. The policy format version to be returned.
        #   Valid values are 0, 1, and 3. Requests specifying an invalid value will be
        #   rejected.
        #   Requests for policies with any conditional bindings must specify version 3.
        #   Policies without any conditional bindings may specify any valid value or
        #   leave the field unset.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RuntimeconfigV1beta1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RuntimeconfigV1beta1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_config_iam_policy(resource, options_requested_policy_version: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+resource}:getIamPolicy', options)
          command.response_representation = Google::Apis::RuntimeconfigV1beta1::Policy::Representation
          command.response_class = Google::Apis::RuntimeconfigV1beta1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['options.requestedPolicyVersion'] = options_requested_policy_version unless options_requested_policy_version.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all the RuntimeConfig resources within project.
        # @param [String] parent
        #   The [project
        #   ID](https://support.google.com/cloud/answer/6158840?hl=en&ref_topic=6158848)
        #   for this request, in the format `projects/[PROJECT_ID]`.
        # @param [Fixnum] page_size
        #   Specifies the number of results to return per page. If there are fewer
        #   elements than the specified number, returns all elements.
        # @param [String] page_token
        #   Specifies a page token to use. Set `pageToken` to a `nextPageToken`
        #   returned by a previous list request to get the next page of results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RuntimeconfigV1beta1::ListConfigsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RuntimeconfigV1beta1::ListConfigsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_configs(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+parent}/configs', options)
          command.response_representation = Google::Apis::RuntimeconfigV1beta1::ListConfigsResponse::Representation
          command.response_class = Google::Apis::RuntimeconfigV1beta1::ListConfigsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets the access control policy on the specified resource. Replaces any
        # existing policy.
        # Can return Public Errors: NOT_FOUND, INVALID_ARGUMENT and PERMISSION_DENIED
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being specified.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::RuntimeconfigV1beta1::SetIamPolicyRequest] set_iam_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RuntimeconfigV1beta1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RuntimeconfigV1beta1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def set_config_iam_policy(resource, set_iam_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+resource}:setIamPolicy', options)
          command.request_representation = Google::Apis::RuntimeconfigV1beta1::SetIamPolicyRequest::Representation
          command.request_object = set_iam_policy_request_object
          command.response_representation = Google::Apis::RuntimeconfigV1beta1::Policy::Representation
          command.response_class = Google::Apis::RuntimeconfigV1beta1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns permissions that a caller has on the specified resource.
        # If the resource does not exist, this will return an empty set of
        # permissions, not a NOT_FOUND error.
        # Note: This operation is designed to be used for building permission-aware
        # UIs and command-line tools, not for authorization checking. This operation
        # may "fail open" without warning.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy detail is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::RuntimeconfigV1beta1::TestIamPermissionsRequest] test_iam_permissions_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RuntimeconfigV1beta1::TestIamPermissionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RuntimeconfigV1beta1::TestIamPermissionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def test_config_iam_permissions(resource, test_iam_permissions_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+resource}:testIamPermissions', options)
          command.request_representation = Google::Apis::RuntimeconfigV1beta1::TestIamPermissionsRequest::Representation
          command.request_object = test_iam_permissions_request_object
          command.response_representation = Google::Apis::RuntimeconfigV1beta1::TestIamPermissionsResponse::Representation
          command.response_class = Google::Apis::RuntimeconfigV1beta1::TestIamPermissionsResponse
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a RuntimeConfig resource. The configuration must exist beforehand.
        # @param [String] name
        #   The name of the RuntimeConfig resource to update, in the format:
        #   `projects/[PROJECT_ID]/configs/[CONFIG_NAME]`
        # @param [Google::Apis::RuntimeconfigV1beta1::RuntimeConfig] runtime_config_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RuntimeconfigV1beta1::RuntimeConfig] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RuntimeconfigV1beta1::RuntimeConfig]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_project_config(name, runtime_config_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v1beta1/{+name}', options)
          command.request_representation = Google::Apis::RuntimeconfigV1beta1::RuntimeConfig::Representation
          command.request_object = runtime_config_object
          command.response_representation = Google::Apis::RuntimeconfigV1beta1::RuntimeConfig::Representation
          command.response_class = Google::Apis::RuntimeconfigV1beta1::RuntimeConfig
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the latest state of a long-running operation.  Clients can use this
        # method to poll the operation result at intervals as recommended by the API
        # service.
        # @param [String] name
        #   The name of the operation resource.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RuntimeconfigV1beta1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RuntimeconfigV1beta1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_config_operation(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::RuntimeconfigV1beta1::Operation::Representation
          command.response_class = Google::Apis::RuntimeconfigV1beta1::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns permissions that a caller has on the specified resource.
        # If the resource does not exist, this will return an empty set of
        # permissions, not a NOT_FOUND error.
        # Note: This operation is designed to be used for building permission-aware
        # UIs and command-line tools, not for authorization checking. This operation
        # may "fail open" without warning.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy detail is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::RuntimeconfigV1beta1::TestIamPermissionsRequest] test_iam_permissions_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RuntimeconfigV1beta1::TestIamPermissionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RuntimeconfigV1beta1::TestIamPermissionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def test_operation_iam_permissions(resource, test_iam_permissions_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+resource}:testIamPermissions', options)
          command.request_representation = Google::Apis::RuntimeconfigV1beta1::TestIamPermissionsRequest::Representation
          command.request_object = test_iam_permissions_request_object
          command.response_representation = Google::Apis::RuntimeconfigV1beta1::TestIamPermissionsResponse::Representation
          command.response_class = Google::Apis::RuntimeconfigV1beta1::TestIamPermissionsResponse
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a variable within the given configuration. You cannot create
        # a variable with a name that is a prefix of an existing variable name, or a
        # name that has an existing variable name as a prefix.
        # To learn more about creating a variable, read the
        # [Setting and Getting
        # Data](/deployment-manager/runtime-configurator/set-and-get-variables)
        # documentation.
        # @param [String] parent
        #   The path to the RutimeConfig resource that this variable should belong to.
        #   The configuration must exist beforehand; the path must be in the format:
        #   `projects/[PROJECT_ID]/configs/[CONFIG_NAME]`
        # @param [Google::Apis::RuntimeconfigV1beta1::Variable] variable_object
        # @param [String] request_id
        #   An optional but recommended unique `request_id`. If the server
        #   receives two `create()` requests  with the same
        #   `request_id`, then the second request will be ignored and the
        #   first resource created and stored in the backend is returned.
        #   Empty `request_id` fields are ignored.
        #   It is responsibility of the client to ensure uniqueness of the
        #   `request_id` strings.
        #   `request_id` strings are limited to 64 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RuntimeconfigV1beta1::Variable] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RuntimeconfigV1beta1::Variable]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_config_variable(parent, variable_object = nil, request_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+parent}/variables', options)
          command.request_representation = Google::Apis::RuntimeconfigV1beta1::Variable::Representation
          command.request_object = variable_object
          command.response_representation = Google::Apis::RuntimeconfigV1beta1::Variable::Representation
          command.response_class = Google::Apis::RuntimeconfigV1beta1::Variable
          command.params['parent'] = parent unless parent.nil?
          command.query['requestId'] = request_id unless request_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a variable or multiple variables.
        # If you specify a variable name, then that variable is deleted. If you
        # specify a prefix and `recursive` is true, then all variables with that
        # prefix are deleted. You must set a `recursive` to true if you delete
        # variables by prefix.
        # @param [String] name
        #   The name of the variable to delete, in the format:
        #   `projects/[PROJECT_ID]/configs/[CONFIG_NAME]/variables/[VARIABLE_NAME]`
        # @param [Boolean] recursive
        #   Set to `true` to recursively delete multiple variables with the same
        #   prefix.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RuntimeconfigV1beta1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RuntimeconfigV1beta1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_config_variable(name, recursive: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::RuntimeconfigV1beta1::Empty::Representation
          command.response_class = Google::Apis::RuntimeconfigV1beta1::Empty
          command.params['name'] = name unless name.nil?
          command.query['recursive'] = recursive unless recursive.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets information about a single variable.
        # @param [String] name
        #   The name of the variable to return, in the format:
        #   `projects/[PROJECT_ID]/configs/[CONFIG_NAME]/variables/[VARIBLE_NAME]`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RuntimeconfigV1beta1::Variable] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RuntimeconfigV1beta1::Variable]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_config_variable(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::RuntimeconfigV1beta1::Variable::Representation
          command.response_class = Google::Apis::RuntimeconfigV1beta1::Variable
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists variables within given a configuration, matching any provided
        # filters. This only lists variable names, not the values, unless
        # `return_values` is true, in which case only variables that user has IAM
        # permission to GetVariable will be returned.
        # @param [String] parent
        #   The path to the RuntimeConfig resource for which you want to list
        #   variables. The configuration must exist beforehand; the path must be in the
        #   format:
        #   `projects/[PROJECT_ID]/configs/[CONFIG_NAME]`
        # @param [String] filter
        #   Filters variables by matching the specified filter. For example:
        #   `projects/example-project/config/[CONFIG_NAME]/variables/example-variable`.
        # @param [Fixnum] page_size
        #   Specifies the number of results to return per page. If there are fewer
        #   elements than the specified number, returns all elements.
        # @param [String] page_token
        #   Specifies a page token to use. Set `pageToken` to a `nextPageToken`
        #   returned by a previous list request to get the next page of results.
        # @param [Boolean] return_values
        #   The flag indicates whether the user wants to return values of variables.
        #   If true, then only those variables that user has IAM GetVariable permission
        #   will be returned along with their values.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RuntimeconfigV1beta1::ListVariablesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RuntimeconfigV1beta1::ListVariablesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_config_variables(parent, filter: nil, page_size: nil, page_token: nil, return_values: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+parent}/variables', options)
          command.response_representation = Google::Apis::RuntimeconfigV1beta1::ListVariablesResponse::Representation
          command.response_class = Google::Apis::RuntimeconfigV1beta1::ListVariablesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['returnValues'] = return_values unless return_values.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns permissions that a caller has on the specified resource.
        # If the resource does not exist, this will return an empty set of
        # permissions, not a NOT_FOUND error.
        # Note: This operation is designed to be used for building permission-aware
        # UIs and command-line tools, not for authorization checking. This operation
        # may "fail open" without warning.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy detail is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::RuntimeconfigV1beta1::TestIamPermissionsRequest] test_iam_permissions_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RuntimeconfigV1beta1::TestIamPermissionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RuntimeconfigV1beta1::TestIamPermissionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def test_variable_iam_permissions(resource, test_iam_permissions_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+resource}:testIamPermissions', options)
          command.request_representation = Google::Apis::RuntimeconfigV1beta1::TestIamPermissionsRequest::Representation
          command.request_object = test_iam_permissions_request_object
          command.response_representation = Google::Apis::RuntimeconfigV1beta1::TestIamPermissionsResponse::Representation
          command.response_class = Google::Apis::RuntimeconfigV1beta1::TestIamPermissionsResponse
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing variable with a new value.
        # @param [String] name
        #   The name of the variable to update, in the format:
        #   `projects/[PROJECT_ID]/configs/[CONFIG_NAME]/variables/[VARIABLE_NAME]`
        # @param [Google::Apis::RuntimeconfigV1beta1::Variable] variable_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RuntimeconfigV1beta1::Variable] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RuntimeconfigV1beta1::Variable]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_project_config_variable(name, variable_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v1beta1/{+name}', options)
          command.request_representation = Google::Apis::RuntimeconfigV1beta1::Variable::Representation
          command.request_object = variable_object
          command.response_representation = Google::Apis::RuntimeconfigV1beta1::Variable::Representation
          command.response_class = Google::Apis::RuntimeconfigV1beta1::Variable
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Watches a specific variable and waits for a change in the variable's value.
        # When there is a change, this method returns the new value or times out.
        # If a variable is deleted while being watched, the `variableState` state is
        # set to `DELETED` and the method returns the last known variable `value`.
        # If you set the deadline for watching to a larger value than internal
        # timeout (60 seconds), the current variable value is returned and the
        # `variableState` will be `VARIABLE_STATE_UNSPECIFIED`.
        # To learn more about creating a watcher, read the
        # [Watching a Variable for
        # Changes](/deployment-manager/runtime-configurator/watching-a-variable)
        # documentation.
        # @param [String] name
        #   The name of the variable to watch, in the format:
        #   `projects/[PROJECT_ID]/configs/[CONFIG_NAME]`
        # @param [Google::Apis::RuntimeconfigV1beta1::WatchVariableRequest] watch_variable_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RuntimeconfigV1beta1::Variable] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RuntimeconfigV1beta1::Variable]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def watch_variable(name, watch_variable_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+name}:watch', options)
          command.request_representation = Google::Apis::RuntimeconfigV1beta1::WatchVariableRequest::Representation
          command.request_object = watch_variable_request_object
          command.response_representation = Google::Apis::RuntimeconfigV1beta1::Variable::Representation
          command.response_class = Google::Apis::RuntimeconfigV1beta1::Variable
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a Waiter resource. This operation returns a long-running Operation
        # resource which can be polled for completion. However, a waiter with the
        # given name will exist (and can be retrieved) prior to the operation
        # completing. If the operation fails, the failed Waiter resource will
        # still exist and must be deleted prior to subsequent creation attempts.
        # @param [String] parent
        #   The path to the configuration that will own the waiter.
        #   The configuration must exist beforehand; the path must be in the format:
        #   `projects/[PROJECT_ID]/configs/[CONFIG_NAME]`.
        # @param [Google::Apis::RuntimeconfigV1beta1::Waiter] waiter_object
        # @param [String] request_id
        #   An optional but recommended unique `request_id`. If the server
        #   receives two `create()` requests  with the same
        #   `request_id`, then the second request will be ignored and the
        #   first resource created and stored in the backend is returned.
        #   Empty `request_id` fields are ignored.
        #   It is responsibility of the client to ensure uniqueness of the
        #   `request_id` strings.
        #   `request_id` strings are limited to 64 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RuntimeconfigV1beta1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RuntimeconfigV1beta1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_config_waiter(parent, waiter_object = nil, request_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+parent}/waiters', options)
          command.request_representation = Google::Apis::RuntimeconfigV1beta1::Waiter::Representation
          command.request_object = waiter_object
          command.response_representation = Google::Apis::RuntimeconfigV1beta1::Operation::Representation
          command.response_class = Google::Apis::RuntimeconfigV1beta1::Operation
          command.params['parent'] = parent unless parent.nil?
          command.query['requestId'] = request_id unless request_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the waiter with the specified name.
        # @param [String] name
        #   The Waiter resource to delete, in the format:
        #   `projects/[PROJECT_ID]/configs/[CONFIG_NAME]/waiters/[WAITER_NAME]`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RuntimeconfigV1beta1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RuntimeconfigV1beta1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_config_waiter(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::RuntimeconfigV1beta1::Empty::Representation
          command.response_class = Google::Apis::RuntimeconfigV1beta1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets information about a single waiter.
        # @param [String] name
        #   The fully-qualified name of the Waiter resource object to retrieve, in the
        #   format:
        #   `projects/[PROJECT_ID]/configs/[CONFIG_NAME]/waiters/[WAITER_NAME]`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RuntimeconfigV1beta1::Waiter] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RuntimeconfigV1beta1::Waiter]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_config_waiter(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::RuntimeconfigV1beta1::Waiter::Representation
          command.response_class = Google::Apis::RuntimeconfigV1beta1::Waiter
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List waiters within the given configuration.
        # @param [String] parent
        #   The path to the configuration for which you want to get a list of waiters.
        #   The configuration must exist beforehand; the path must be in the format:
        #   `projects/[PROJECT_ID]/configs/[CONFIG_NAME]`
        # @param [Fixnum] page_size
        #   Specifies the number of results to return per page. If there are fewer
        #   elements than the specified number, returns all elements.
        # @param [String] page_token
        #   Specifies a page token to use. Set `pageToken` to a `nextPageToken`
        #   returned by a previous list request to get the next page of results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RuntimeconfigV1beta1::ListWaitersResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RuntimeconfigV1beta1::ListWaitersResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_config_waiters(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+parent}/waiters', options)
          command.response_representation = Google::Apis::RuntimeconfigV1beta1::ListWaitersResponse::Representation
          command.response_class = Google::Apis::RuntimeconfigV1beta1::ListWaitersResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns permissions that a caller has on the specified resource.
        # If the resource does not exist, this will return an empty set of
        # permissions, not a NOT_FOUND error.
        # Note: This operation is designed to be used for building permission-aware
        # UIs and command-line tools, not for authorization checking. This operation
        # may "fail open" without warning.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy detail is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::RuntimeconfigV1beta1::TestIamPermissionsRequest] test_iam_permissions_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RuntimeconfigV1beta1::TestIamPermissionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RuntimeconfigV1beta1::TestIamPermissionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def test_waiter_iam_permissions(resource, test_iam_permissions_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+resource}:testIamPermissions', options)
          command.request_representation = Google::Apis::RuntimeconfigV1beta1::TestIamPermissionsRequest::Representation
          command.request_object = test_iam_permissions_request_object
          command.response_representation = Google::Apis::RuntimeconfigV1beta1::TestIamPermissionsResponse::Representation
          command.response_class = Google::Apis::RuntimeconfigV1beta1::TestIamPermissionsResponse
          command.params['resource'] = resource unless resource.nil?
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
