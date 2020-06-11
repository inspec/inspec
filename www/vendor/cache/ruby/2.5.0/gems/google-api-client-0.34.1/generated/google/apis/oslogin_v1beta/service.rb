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
    module OsloginV1beta
      # Cloud OS Login API
      #
      # You can use OS Login to manage access to your VM instances using IAM roles.
      #  For more information, read [OS Login](/compute/docs/oslogin/).
      #
      # @example
      #    require 'google/apis/oslogin_v1beta'
      #
      #    Oslogin = Google::Apis::OsloginV1beta # Alias the module
      #    service = Oslogin::CloudOSLoginService.new
      #
      # @see https://cloud.google.com/compute/docs/oslogin/
      class CloudOSLoginService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://oslogin.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Retrieves the profile information used for logging in to a virtual machine
        # on Google Compute Engine.
        # @param [String] name
        #   Required. The unique ID for the user in format `users/`user``.
        # @param [String] project_id
        #   The project ID of the Google Cloud Platform project.
        # @param [String] system_id
        #   A system ID for filtering the results of the request.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::OsloginV1beta::LoginProfile] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::OsloginV1beta::LoginProfile]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_user_login_profile(name, project_id: nil, system_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta/{+name}/loginProfile', options)
          command.response_representation = Google::Apis::OsloginV1beta::LoginProfile::Representation
          command.response_class = Google::Apis::OsloginV1beta::LoginProfile
          command.params['name'] = name unless name.nil?
          command.query['projectId'] = project_id unless project_id.nil?
          command.query['systemId'] = system_id unless system_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Adds an SSH public key and returns the profile information. Default POSIX
        # account information is set when no username and UID exist as part of the
        # login profile.
        # @param [String] parent
        #   The unique ID for the user in format `users/`user``.
        # @param [Google::Apis::OsloginV1beta::SshPublicKey] ssh_public_key_object
        # @param [String] project_id
        #   The project ID of the Google Cloud Platform project.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::OsloginV1beta::ImportSshPublicKeyResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::OsloginV1beta::ImportSshPublicKeyResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def import_user_ssh_public_key(parent, ssh_public_key_object = nil, project_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta/{+parent}:importSshPublicKey', options)
          command.request_representation = Google::Apis::OsloginV1beta::SshPublicKey::Representation
          command.request_object = ssh_public_key_object
          command.response_representation = Google::Apis::OsloginV1beta::ImportSshPublicKeyResponse::Representation
          command.response_class = Google::Apis::OsloginV1beta::ImportSshPublicKeyResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['projectId'] = project_id unless project_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a POSIX account.
        # @param [String] name
        #   Required. A reference to the POSIX account to update. POSIX accounts are
        #   identified
        #   by the project ID they are associated with. A reference to the POSIX
        #   account is in format `users/`user`/projects/`project``.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::OsloginV1beta::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::OsloginV1beta::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_user_project(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1beta/{+name}', options)
          command.response_representation = Google::Apis::OsloginV1beta::Empty::Representation
          command.response_class = Google::Apis::OsloginV1beta::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes an SSH public key.
        # @param [String] name
        #   Required. The fingerprint of the public key to update. Public keys are
        #   identified by
        #   their SHA-256 fingerprint. The fingerprint of the public key is in format
        #   `users/`user`/sshPublicKeys/`fingerprint``.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::OsloginV1beta::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::OsloginV1beta::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_user_ssh_public_key(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1beta/{+name}', options)
          command.response_representation = Google::Apis::OsloginV1beta::Empty::Representation
          command.response_class = Google::Apis::OsloginV1beta::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves an SSH public key.
        # @param [String] name
        #   Required. The fingerprint of the public key to retrieve. Public keys are
        #   identified
        #   by their SHA-256 fingerprint. The fingerprint of the public key is in
        #   format `users/`user`/sshPublicKeys/`fingerprint``.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::OsloginV1beta::SshPublicKey] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::OsloginV1beta::SshPublicKey]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_user_ssh_public_key(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta/{+name}', options)
          command.response_representation = Google::Apis::OsloginV1beta::SshPublicKey::Representation
          command.response_class = Google::Apis::OsloginV1beta::SshPublicKey
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an SSH public key and returns the profile information. This method
        # supports patch semantics.
        # @param [String] name
        #   Required. The fingerprint of the public key to update. Public keys are
        #   identified by
        #   their SHA-256 fingerprint. The fingerprint of the public key is in format
        #   `users/`user`/sshPublicKeys/`fingerprint``.
        # @param [Google::Apis::OsloginV1beta::SshPublicKey] ssh_public_key_object
        # @param [String] update_mask
        #   Mask to control which fields get updated. Updates all if not present.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::OsloginV1beta::SshPublicKey] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::OsloginV1beta::SshPublicKey]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_user_ssh_public_key(name, ssh_public_key_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1beta/{+name}', options)
          command.request_representation = Google::Apis::OsloginV1beta::SshPublicKey::Representation
          command.request_object = ssh_public_key_object
          command.response_representation = Google::Apis::OsloginV1beta::SshPublicKey::Representation
          command.response_class = Google::Apis::OsloginV1beta::SshPublicKey
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
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
