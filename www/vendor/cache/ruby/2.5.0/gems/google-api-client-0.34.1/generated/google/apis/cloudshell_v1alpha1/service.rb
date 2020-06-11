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
    module CloudshellV1alpha1
      # Cloud Shell API
      #
      # Allows users to start, configure, and connect to interactive shell sessions
      #  running in the cloud.
      #
      # @example
      #    require 'google/apis/cloudshell_v1alpha1'
      #
      #    Cloudshell = Google::Apis::CloudshellV1alpha1 # Alias the module
      #    service = Cloudshell::CloudShellService.new
      #
      # @see https://cloud.google.com/shell/docs/
      class CloudShellService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://cloudshell.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Sends OAuth credentials to a running environment on behalf of a user. When
        # this completes, the environment will be authorized to run various Google
        # Cloud command line tools without requiring the user to manually
        # authenticate.
        # @param [String] name
        #   Name of the resource that should receive the credentials, for example
        #   `users/me/environments/default` or
        #   `users/someone@example.com/environments/default`.
        # @param [Google::Apis::CloudshellV1alpha1::AuthorizeEnvironmentRequest] authorize_environment_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudshellV1alpha1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudshellV1alpha1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def authorize_environment(name, authorize_environment_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1alpha1/{+name}:authorize', options)
          command.request_representation = Google::Apis::CloudshellV1alpha1::AuthorizeEnvironmentRequest::Representation
          command.request_object = authorize_environment_request_object
          command.response_representation = Google::Apis::CloudshellV1alpha1::Empty::Representation
          command.response_class = Google::Apis::CloudshellV1alpha1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets an environment. Returns NOT_FOUND if the environment does not exist.
        # @param [String] name
        #   Name of the requested resource, for example `users/me/environments/default`
        #   or `users/someone@example.com/environments/default`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudshellV1alpha1::Environment] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudshellV1alpha1::Environment]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_user_environment(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::CloudshellV1alpha1::Environment::Representation
          command.response_class = Google::Apis::CloudshellV1alpha1::Environment
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing environment.
        # @param [String] name
        #   Name of the resource to be updated, for example
        #   `users/me/environments/default` or
        #   `users/someone@example.com/environments/default`.
        # @param [Google::Apis::CloudshellV1alpha1::Environment] environment_object
        # @param [String] update_mask
        #   Mask specifying which fields in the environment should be updated.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudshellV1alpha1::Environment] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudshellV1alpha1::Environment]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_user_environment(name, environment_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1alpha1/{+name}', options)
          command.request_representation = Google::Apis::CloudshellV1alpha1::Environment::Representation
          command.request_object = environment_object
          command.response_representation = Google::Apis::CloudshellV1alpha1::Environment::Representation
          command.response_class = Google::Apis::CloudshellV1alpha1::Environment
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Starts an existing environment, allowing clients to connect to it. The
        # returned operation will contain an instance of StartEnvironmentMetadata in
        # its metadata field. Users can wait for the environment to start by polling
        # this operation via GetOperation. Once the environment has finished starting
        # and is ready to accept connections, the operation will contain a
        # StartEnvironmentResponse in its response field.
        # @param [String] name
        #   Name of the resource that should be started, for example
        #   `users/me/environments/default` or
        #   `users/someone@example.com/environments/default`.
        # @param [Google::Apis::CloudshellV1alpha1::StartEnvironmentRequest] start_environment_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudshellV1alpha1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudshellV1alpha1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def start_environment(name, start_environment_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1alpha1/{+name}:start', options)
          command.request_representation = Google::Apis::CloudshellV1alpha1::StartEnvironmentRequest::Representation
          command.request_object = start_environment_request_object
          command.response_representation = Google::Apis::CloudshellV1alpha1::Operation::Representation
          command.response_class = Google::Apis::CloudshellV1alpha1::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Adds a public SSH key to an environment, allowing clients with the
        # corresponding private key to connect to that environment via SSH. If a key
        # with the same format and content already exists, this will return the
        # existing key.
        # @param [String] parent
        #   Parent resource name, e.g. `users/me/environments/default`.
        # @param [Google::Apis::CloudshellV1alpha1::CreatePublicKeyRequest] create_public_key_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudshellV1alpha1::PublicKey] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudshellV1alpha1::PublicKey]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_public_key(parent, create_public_key_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1alpha1/{+parent}/publicKeys', options)
          command.request_representation = Google::Apis::CloudshellV1alpha1::CreatePublicKeyRequest::Representation
          command.request_object = create_public_key_request_object
          command.response_representation = Google::Apis::CloudshellV1alpha1::PublicKey::Representation
          command.response_class = Google::Apis::CloudshellV1alpha1::PublicKey
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Removes a public SSH key from an environment. Clients will no longer be
        # able to connect to the environment using the corresponding private key.
        # @param [String] name
        #   Name of the resource to be deleted, e.g.
        #   `users/me/environments/default/publicKeys/my-key`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudshellV1alpha1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudshellV1alpha1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_user_environment_public_key(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::CloudshellV1alpha1::Empty::Representation
          command.response_class = Google::Apis::CloudshellV1alpha1::Empty
          command.params['name'] = name unless name.nil?
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
