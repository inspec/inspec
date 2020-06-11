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
    module CloudresourcemanagerV2
      # Cloud Resource Manager API
      #
      # Creates, reads, and updates metadata for Google Cloud Platform resource
      #  containers.
      #
      # @example
      #    require 'google/apis/cloudresourcemanager_v2'
      #
      #    Cloudresourcemanager = Google::Apis::CloudresourcemanagerV2 # Alias the module
      #    service = Cloudresourcemanager::CloudResourceManagerService.new
      #
      # @see https://cloud.google.com/resource-manager
      class CloudResourceManagerService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://cloudresourcemanager.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Creates a Folder in the resource hierarchy.
        # Returns an Operation which can be used to track the progress of the
        # folder creation workflow.
        # Upon success the Operation.response field will be populated with the
        # created Folder.
        # In order to succeed, the addition of this new Folder must not violate
        # the Folder naming, height or fanout constraints.
        # + The Folder's display_name must be distinct from all other Folder's that
        # share its parent.
        # + The addition of the Folder must not cause the active Folder hierarchy
        # to exceed a height of 4. Note, the full active + deleted Folder hierarchy
        # is allowed to reach a height of 8; this provides additional headroom when
        # moving folders that contain deleted folders.
        # + The addition of the Folder must not cause the total number of Folders
        # under its parent to exceed 100.
        # If the operation fails due to a folder constraint violation, some errors
        # may be returned by the CreateFolder request, with status code
        # FAILED_PRECONDITION and an error description. Other folder constraint
        # violations will be communicated in the Operation, with the specific
        # PreconditionFailure returned via the details list in the Operation.error
        # field.
        # The caller must have `resourcemanager.folders.create` permission on the
        # identified parent.
        # @param [Google::Apis::CloudresourcemanagerV2::Folder] folder_object
        # @param [String] parent
        #   Required. The resource name of the new Folder's parent.
        #   Must be of the form `folders/`folder_id`` or `organizations/`org_id``.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudresourcemanagerV2::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudresourcemanagerV2::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_folder(folder_object = nil, parent: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/folders', options)
          command.request_representation = Google::Apis::CloudresourcemanagerV2::Folder::Representation
          command.request_object = folder_object
          command.response_representation = Google::Apis::CloudresourcemanagerV2::Operation::Representation
          command.response_class = Google::Apis::CloudresourcemanagerV2::Operation
          command.query['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Requests deletion of a Folder. The Folder is moved into the
        # DELETE_REQUESTED state
        # immediately, and is deleted approximately 30 days later. This method may
        # only be called on an empty Folder in the
        # ACTIVE state, where a Folder is empty if
        # it doesn't contain any Folders or Projects in the
        # ACTIVE state.
        # The caller must have `resourcemanager.folders.delete` permission on the
        # identified folder.
        # @param [String] name
        #   Required. the resource name of the Folder to be deleted.
        #   Must be of the form `folders/`folder_id``.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudresourcemanagerV2::Folder] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudresourcemanagerV2::Folder]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_folder(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2/{+name}', options)
          command.response_representation = Google::Apis::CloudresourcemanagerV2::Folder::Representation
          command.response_class = Google::Apis::CloudresourcemanagerV2::Folder
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a Folder identified by the supplied resource name.
        # Valid Folder resource names have the format `folders/`folder_id``
        # (for example, `folders/1234`).
        # The caller must have `resourcemanager.folders.get` permission on the
        # identified folder.
        # @param [String] name
        #   Required. The resource name of the Folder to retrieve.
        #   Must be of the form `folders/`folder_id``.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudresourcemanagerV2::Folder] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudresourcemanagerV2::Folder]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_folder(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+name}', options)
          command.response_representation = Google::Apis::CloudresourcemanagerV2::Folder::Representation
          command.response_class = Google::Apis::CloudresourcemanagerV2::Folder
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the access control policy for a Folder. The returned policy may be
        # empty if no such policy or resource exists. The `resource` field should
        # be the Folder's resource name, e.g. "folders/1234".
        # The caller must have `resourcemanager.folders.getIamPolicy` permission
        # on the identified folder.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::CloudresourcemanagerV2::GetIamPolicyRequest] get_iam_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudresourcemanagerV2::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudresourcemanagerV2::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_folder_iam_policy(resource, get_iam_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+resource}:getIamPolicy', options)
          command.request_representation = Google::Apis::CloudresourcemanagerV2::GetIamPolicyRequest::Representation
          command.request_object = get_iam_policy_request_object
          command.response_representation = Google::Apis::CloudresourcemanagerV2::Policy::Representation
          command.response_class = Google::Apis::CloudresourcemanagerV2::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the Folders that are direct descendants of supplied parent resource.
        # List provides a strongly consistent view of the Folders underneath
        # the specified parent resource.
        # List returns Folders sorted based upon the (ascending) lexical ordering
        # of their display_name.
        # The caller must have `resourcemanager.folders.list` permission on the
        # identified parent.
        # @param [Fixnum] page_size
        #   Optional. The maximum number of Folders to return in the response.
        # @param [String] page_token
        #   Optional. A pagination token returned from a previous call to `ListFolders`
        #   that indicates where this listing should continue from.
        # @param [String] parent
        #   Required. The resource name of the Organization or Folder whose Folders are
        #   being listed.
        #   Must be of the form `folders/`folder_id`` or `organizations/`org_id``.
        #   Access to this method is controlled by checking the
        #   `resourcemanager.folders.list` permission on the `parent`.
        # @param [Boolean] show_deleted
        #   Optional. Controls whether Folders in the
        #   DELETE_REQUESTED
        #   state should be returned. Defaults to false.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudresourcemanagerV2::ListFoldersResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudresourcemanagerV2::ListFoldersResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_folders(page_size: nil, page_token: nil, parent: nil, show_deleted: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/folders', options)
          command.response_representation = Google::Apis::CloudresourcemanagerV2::ListFoldersResponse::Representation
          command.response_class = Google::Apis::CloudresourcemanagerV2::ListFoldersResponse
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['showDeleted'] = show_deleted unless show_deleted.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Moves a Folder under a new resource parent.
        # Returns an Operation which can be used to track the progress of the
        # folder move workflow.
        # Upon success the Operation.response field will be populated with the
        # moved Folder.
        # Upon failure, a FolderOperationError categorizing the failure cause will
        # be returned - if the failure occurs synchronously then the
        # FolderOperationError will be returned via the Status.details field
        # and if it occurs asynchronously then the FolderOperation will be returned
        # via the Operation.error field.
        # In addition, the Operation.metadata field will be populated with a
        # FolderOperation message as an aid to stateless clients.
        # Folder moves will be rejected if they violate either the naming, height
        # or fanout constraints described in the
        # CreateFolder documentation.
        # The caller must have `resourcemanager.folders.move` permission on the
        # folder's current and proposed new parent.
        # @param [String] name
        #   Required. The resource name of the Folder to move.
        #   Must be of the form folders/`folder_id`
        # @param [Google::Apis::CloudresourcemanagerV2::MoveFolderRequest] move_folder_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudresourcemanagerV2::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudresourcemanagerV2::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def move_folder(name, move_folder_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+name}:move', options)
          command.request_representation = Google::Apis::CloudresourcemanagerV2::MoveFolderRequest::Representation
          command.request_object = move_folder_request_object
          command.response_representation = Google::Apis::CloudresourcemanagerV2::Operation::Representation
          command.response_class = Google::Apis::CloudresourcemanagerV2::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a Folder, changing its display_name.
        # Changes to the folder display_name will be rejected if they violate either
        # the display_name formatting rules or naming constraints described in
        # the CreateFolder documentation.
        # The Folder's display name must start and end with a letter or digit,
        # may contain letters, digits, spaces, hyphens and underscores and can be
        # no longer than 30 characters. This is captured by the regular expression:
        # [\p`L`\p`N`]([\p`L`\p`N`_- ]`0,28`[\p`L`\p`N`])?.
        # The caller must have `resourcemanager.folders.update` permission on the
        # identified folder.
        # If the update fails due to the unique name constraint then a
        # PreconditionFailure explaining this violation will be returned
        # in the Status.details field.
        # @param [String] name
        #   Output only. The resource name of the Folder.
        #   Its format is `folders/`folder_id``, for example: "folders/1234".
        # @param [Google::Apis::CloudresourcemanagerV2::Folder] folder_object
        # @param [String] update_mask
        #   Required. Fields to be updated.
        #   Only the `display_name` can be updated.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudresourcemanagerV2::Folder] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudresourcemanagerV2::Folder]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_folder(name, folder_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v2/{+name}', options)
          command.request_representation = Google::Apis::CloudresourcemanagerV2::Folder::Representation
          command.request_object = folder_object
          command.response_representation = Google::Apis::CloudresourcemanagerV2::Folder::Representation
          command.response_class = Google::Apis::CloudresourcemanagerV2::Folder
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Search for folders that match specific filter criteria.
        # Search provides an eventually consistent view of the folders a user has
        # access to which meet the specified filter criteria.
        # This will only return folders on which the caller has the
        # permission `resourcemanager.folders.get`.
        # @param [Google::Apis::CloudresourcemanagerV2::SearchFoldersRequest] search_folders_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudresourcemanagerV2::SearchFoldersResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudresourcemanagerV2::SearchFoldersResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def search_folders(search_folders_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/folders:search', options)
          command.request_representation = Google::Apis::CloudresourcemanagerV2::SearchFoldersRequest::Representation
          command.request_object = search_folders_request_object
          command.response_representation = Google::Apis::CloudresourcemanagerV2::SearchFoldersResponse::Representation
          command.response_class = Google::Apis::CloudresourcemanagerV2::SearchFoldersResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets the access control policy on a Folder, replacing any existing policy.
        # The `resource` field should be the Folder's resource name, e.g.
        # "folders/1234".
        # The caller must have `resourcemanager.folders.setIamPolicy` permission
        # on the identified folder.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being specified.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::CloudresourcemanagerV2::SetIamPolicyRequest] set_iam_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudresourcemanagerV2::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudresourcemanagerV2::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def set_folder_iam_policy(resource, set_iam_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+resource}:setIamPolicy', options)
          command.request_representation = Google::Apis::CloudresourcemanagerV2::SetIamPolicyRequest::Representation
          command.request_object = set_iam_policy_request_object
          command.response_representation = Google::Apis::CloudresourcemanagerV2::Policy::Representation
          command.response_class = Google::Apis::CloudresourcemanagerV2::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns permissions that a caller has on the specified Folder.
        # The `resource` field should be the Folder's resource name,
        # e.g. "folders/1234".
        # There are no permissions required for making this API call.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy detail is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::CloudresourcemanagerV2::TestIamPermissionsRequest] test_iam_permissions_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudresourcemanagerV2::TestIamPermissionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudresourcemanagerV2::TestIamPermissionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def test_folder_iam_permissions(resource, test_iam_permissions_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+resource}:testIamPermissions', options)
          command.request_representation = Google::Apis::CloudresourcemanagerV2::TestIamPermissionsRequest::Representation
          command.request_object = test_iam_permissions_request_object
          command.response_representation = Google::Apis::CloudresourcemanagerV2::TestIamPermissionsResponse::Representation
          command.response_class = Google::Apis::CloudresourcemanagerV2::TestIamPermissionsResponse
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Cancels the deletion request for a Folder. This method may only be
        # called on a Folder in the
        # DELETE_REQUESTED state.
        # In order to succeed, the Folder's parent must be in the
        # ACTIVE state.
        # In addition, reintroducing the folder into the tree must not violate
        # folder naming, height and fanout constraints described in the
        # CreateFolder documentation.
        # The caller must have `resourcemanager.folders.undelete` permission on the
        # identified folder.
        # @param [String] name
        #   Required. The resource name of the Folder to undelete.
        #   Must be of the form `folders/`folder_id``.
        # @param [Google::Apis::CloudresourcemanagerV2::UndeleteFolderRequest] undelete_folder_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudresourcemanagerV2::Folder] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudresourcemanagerV2::Folder]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def undelete_folder(name, undelete_folder_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+name}:undelete', options)
          command.request_representation = Google::Apis::CloudresourcemanagerV2::UndeleteFolderRequest::Representation
          command.request_object = undelete_folder_request_object
          command.response_representation = Google::Apis::CloudresourcemanagerV2::Folder::Representation
          command.response_class = Google::Apis::CloudresourcemanagerV2::Folder
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
        # @yieldparam result [Google::Apis::CloudresourcemanagerV2::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudresourcemanagerV2::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_operation(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::CloudresourcemanagerV2::Operation::Representation
          command.response_class = Google::Apis::CloudresourcemanagerV2::Operation
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
