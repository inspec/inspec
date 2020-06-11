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
    module AccessapprovalV1beta1
      # Access Approval API
      #
      # An API for controlling access to data by Google personnel.
      #
      # @example
      #    require 'google/apis/accessapproval_v1beta1'
      #
      #    Accessapproval = Google::Apis::AccessapprovalV1beta1 # Alias the module
      #    service = Accessapproval::AccessApprovalService.new
      #
      # @see https://cloud.google.com/access-approval/docs
      class AccessApprovalService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://accessapproval.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Deletes the settings associated with a project, folder, or organization.
        # This will have the effect of disabling Access Approval for the project,
        # folder, or organization, but only if all ancestors also have Access
        # Approval disabled. If Access Approval is enabled at a higher level of the
        # hierarchy, then Access Approval will still be enabled at this level as
        # the settings are inherited.
        # @param [String] name
        #   Name of the AccessApprovalSettings to delete.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AccessapprovalV1beta1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AccessapprovalV1beta1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_folder_access_approval_settings(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::AccessapprovalV1beta1::Empty::Representation
          command.response_class = Google::Apis::AccessapprovalV1beta1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the settings associated with a project, folder, or organization.
        # @param [String] name
        #   Name of the AccessApprovalSettings to retrieve.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AccessapprovalV1beta1::AccessApprovalSettings] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AccessapprovalV1beta1::AccessApprovalSettings]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_folder_access_approval_settings(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::AccessapprovalV1beta1::AccessApprovalSettings::Representation
          command.response_class = Google::Apis::AccessapprovalV1beta1::AccessApprovalSettings
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the settings associated with a project, folder, or organization.
        # Settings to update are determined by the value of field_mask.
        # @param [String] name
        #   The resource name of the settings. Format is one of:
        #   <ol>
        #   <li>"projects/`project_id`/accessApprovalSettings"</li>
        #   <li>"folders/`folder_id`/accessApprovalSettings"</li>
        #   <li>"organizations/`organization_id`/accessApprovalSettings"</li>
        #   <ol>
        # @param [Google::Apis::AccessapprovalV1beta1::AccessApprovalSettings] access_approval_settings_object
        # @param [String] update_mask
        #   For the `FieldMask` definition, see
        #   https://developers.google.com/protocol-buffers/docs/reference/google.protobuf#
        #   fieldmask
        #   If this field is left unset, only the notification_emails field will be
        #   updated.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AccessapprovalV1beta1::AccessApprovalSettings] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AccessapprovalV1beta1::AccessApprovalSettings]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_folder_access_approval_settings(name, access_approval_settings_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1beta1/{+name}', options)
          command.request_representation = Google::Apis::AccessapprovalV1beta1::AccessApprovalSettings::Representation
          command.request_object = access_approval_settings_object
          command.response_representation = Google::Apis::AccessapprovalV1beta1::AccessApprovalSettings::Representation
          command.response_class = Google::Apis::AccessapprovalV1beta1::AccessApprovalSettings
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Approves a request and returns the updated ApprovalRequest.
        # Returns NOT_FOUND if the request does not exist. Returns
        # FAILED_PRECONDITION if the request exists but is not in a pending state.
        # @param [String] name
        #   Name of the approval request to approve.
        # @param [Google::Apis::AccessapprovalV1beta1::ApproveApprovalRequestMessage] approve_approval_request_message_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AccessapprovalV1beta1::ApprovalRequest] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AccessapprovalV1beta1::ApprovalRequest]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def approve_folder_approval_request(name, approve_approval_request_message_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+name}:approve', options)
          command.request_representation = Google::Apis::AccessapprovalV1beta1::ApproveApprovalRequestMessage::Representation
          command.request_object = approve_approval_request_message_object
          command.response_representation = Google::Apis::AccessapprovalV1beta1::ApprovalRequest::Representation
          command.response_class = Google::Apis::AccessapprovalV1beta1::ApprovalRequest
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Dismisses a request. Returns the updated ApprovalRequest.
        # NOTE: This does not deny access to the resource if another request has been
        # made and approved. It is equivalent in effect to ignoring the request
        # altogether.
        # Returns NOT_FOUND if the request does not exist.
        # Returns FAILED_PRECONDITION if the request exists but is not in a pending
        # state.
        # @param [String] name
        #   Name of the ApprovalRequest to dismiss.
        # @param [Google::Apis::AccessapprovalV1beta1::DismissApprovalRequestMessage] dismiss_approval_request_message_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AccessapprovalV1beta1::ApprovalRequest] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AccessapprovalV1beta1::ApprovalRequest]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def dismiss_folder_approval_request(name, dismiss_approval_request_message_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+name}:dismiss', options)
          command.request_representation = Google::Apis::AccessapprovalV1beta1::DismissApprovalRequestMessage::Representation
          command.request_object = dismiss_approval_request_message_object
          command.response_representation = Google::Apis::AccessapprovalV1beta1::ApprovalRequest::Representation
          command.response_class = Google::Apis::AccessapprovalV1beta1::ApprovalRequest
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets an approval request. Returns NOT_FOUND if the request does not exist.
        # @param [String] name
        #   Name of the approval request to retrieve.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AccessapprovalV1beta1::ApprovalRequest] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AccessapprovalV1beta1::ApprovalRequest]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_folder_approval_request(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::AccessapprovalV1beta1::ApprovalRequest::Representation
          command.response_class = Google::Apis::AccessapprovalV1beta1::ApprovalRequest
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists approval requests associated with a project, folder, or organization.
        # Approval requests can be filtered by state (pending, active, dismissed).
        # The order is reverse chronological.
        # @param [String] parent
        #   The parent resource. This may be "projects/`project_id`",
        #   "folders/`folder_id`", or "organizations/`organization_id`".
        # @param [String] filter
        #   A filter on the type of approval requests to retrieve. Must be one of the
        #   following values:
        #   <ol>
        #   <li>[not set]: Requests that are pending or have active approvals.</li>
        #   <li>ALL: All requests.</li>
        #   <li>PENDING: Only pending requests.</li>
        #   <li>ACTIVE: Only active (i.e. currently approved) requests.</li>
        #   <li>DISMISSED: Only dismissed (including expired) requests.</li>
        #   </ol>
        # @param [Fixnum] page_size
        #   Requested page size.
        # @param [String] page_token
        #   A token identifying the page of results to return.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AccessapprovalV1beta1::ListApprovalRequestsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AccessapprovalV1beta1::ListApprovalRequestsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_folder_approval_requests(parent, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+parent}/approvalRequests', options)
          command.response_representation = Google::Apis::AccessapprovalV1beta1::ListApprovalRequestsResponse::Representation
          command.response_class = Google::Apis::AccessapprovalV1beta1::ListApprovalRequestsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the settings associated with a project, folder, or organization.
        # This will have the effect of disabling Access Approval for the project,
        # folder, or organization, but only if all ancestors also have Access
        # Approval disabled. If Access Approval is enabled at a higher level of the
        # hierarchy, then Access Approval will still be enabled at this level as
        # the settings are inherited.
        # @param [String] name
        #   Name of the AccessApprovalSettings to delete.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AccessapprovalV1beta1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AccessapprovalV1beta1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_organization_access_approval_settings(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::AccessapprovalV1beta1::Empty::Representation
          command.response_class = Google::Apis::AccessapprovalV1beta1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the settings associated with a project, folder, or organization.
        # @param [String] name
        #   Name of the AccessApprovalSettings to retrieve.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AccessapprovalV1beta1::AccessApprovalSettings] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AccessapprovalV1beta1::AccessApprovalSettings]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_organization_access_approval_settings(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::AccessapprovalV1beta1::AccessApprovalSettings::Representation
          command.response_class = Google::Apis::AccessapprovalV1beta1::AccessApprovalSettings
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the settings associated with a project, folder, or organization.
        # Settings to update are determined by the value of field_mask.
        # @param [String] name
        #   The resource name of the settings. Format is one of:
        #   <ol>
        #   <li>"projects/`project_id`/accessApprovalSettings"</li>
        #   <li>"folders/`folder_id`/accessApprovalSettings"</li>
        #   <li>"organizations/`organization_id`/accessApprovalSettings"</li>
        #   <ol>
        # @param [Google::Apis::AccessapprovalV1beta1::AccessApprovalSettings] access_approval_settings_object
        # @param [String] update_mask
        #   For the `FieldMask` definition, see
        #   https://developers.google.com/protocol-buffers/docs/reference/google.protobuf#
        #   fieldmask
        #   If this field is left unset, only the notification_emails field will be
        #   updated.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AccessapprovalV1beta1::AccessApprovalSettings] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AccessapprovalV1beta1::AccessApprovalSettings]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_organization_access_approval_settings(name, access_approval_settings_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1beta1/{+name}', options)
          command.request_representation = Google::Apis::AccessapprovalV1beta1::AccessApprovalSettings::Representation
          command.request_object = access_approval_settings_object
          command.response_representation = Google::Apis::AccessapprovalV1beta1::AccessApprovalSettings::Representation
          command.response_class = Google::Apis::AccessapprovalV1beta1::AccessApprovalSettings
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Approves a request and returns the updated ApprovalRequest.
        # Returns NOT_FOUND if the request does not exist. Returns
        # FAILED_PRECONDITION if the request exists but is not in a pending state.
        # @param [String] name
        #   Name of the approval request to approve.
        # @param [Google::Apis::AccessapprovalV1beta1::ApproveApprovalRequestMessage] approve_approval_request_message_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AccessapprovalV1beta1::ApprovalRequest] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AccessapprovalV1beta1::ApprovalRequest]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def approve_organization_approval_request(name, approve_approval_request_message_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+name}:approve', options)
          command.request_representation = Google::Apis::AccessapprovalV1beta1::ApproveApprovalRequestMessage::Representation
          command.request_object = approve_approval_request_message_object
          command.response_representation = Google::Apis::AccessapprovalV1beta1::ApprovalRequest::Representation
          command.response_class = Google::Apis::AccessapprovalV1beta1::ApprovalRequest
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Dismisses a request. Returns the updated ApprovalRequest.
        # NOTE: This does not deny access to the resource if another request has been
        # made and approved. It is equivalent in effect to ignoring the request
        # altogether.
        # Returns NOT_FOUND if the request does not exist.
        # Returns FAILED_PRECONDITION if the request exists but is not in a pending
        # state.
        # @param [String] name
        #   Name of the ApprovalRequest to dismiss.
        # @param [Google::Apis::AccessapprovalV1beta1::DismissApprovalRequestMessage] dismiss_approval_request_message_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AccessapprovalV1beta1::ApprovalRequest] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AccessapprovalV1beta1::ApprovalRequest]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def dismiss_organization_approval_request(name, dismiss_approval_request_message_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+name}:dismiss', options)
          command.request_representation = Google::Apis::AccessapprovalV1beta1::DismissApprovalRequestMessage::Representation
          command.request_object = dismiss_approval_request_message_object
          command.response_representation = Google::Apis::AccessapprovalV1beta1::ApprovalRequest::Representation
          command.response_class = Google::Apis::AccessapprovalV1beta1::ApprovalRequest
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets an approval request. Returns NOT_FOUND if the request does not exist.
        # @param [String] name
        #   Name of the approval request to retrieve.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AccessapprovalV1beta1::ApprovalRequest] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AccessapprovalV1beta1::ApprovalRequest]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_organization_approval_request(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::AccessapprovalV1beta1::ApprovalRequest::Representation
          command.response_class = Google::Apis::AccessapprovalV1beta1::ApprovalRequest
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists approval requests associated with a project, folder, or organization.
        # Approval requests can be filtered by state (pending, active, dismissed).
        # The order is reverse chronological.
        # @param [String] parent
        #   The parent resource. This may be "projects/`project_id`",
        #   "folders/`folder_id`", or "organizations/`organization_id`".
        # @param [String] filter
        #   A filter on the type of approval requests to retrieve. Must be one of the
        #   following values:
        #   <ol>
        #   <li>[not set]: Requests that are pending or have active approvals.</li>
        #   <li>ALL: All requests.</li>
        #   <li>PENDING: Only pending requests.</li>
        #   <li>ACTIVE: Only active (i.e. currently approved) requests.</li>
        #   <li>DISMISSED: Only dismissed (including expired) requests.</li>
        #   </ol>
        # @param [Fixnum] page_size
        #   Requested page size.
        # @param [String] page_token
        #   A token identifying the page of results to return.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AccessapprovalV1beta1::ListApprovalRequestsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AccessapprovalV1beta1::ListApprovalRequestsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_organization_approval_requests(parent, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+parent}/approvalRequests', options)
          command.response_representation = Google::Apis::AccessapprovalV1beta1::ListApprovalRequestsResponse::Representation
          command.response_class = Google::Apis::AccessapprovalV1beta1::ListApprovalRequestsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the settings associated with a project, folder, or organization.
        # This will have the effect of disabling Access Approval for the project,
        # folder, or organization, but only if all ancestors also have Access
        # Approval disabled. If Access Approval is enabled at a higher level of the
        # hierarchy, then Access Approval will still be enabled at this level as
        # the settings are inherited.
        # @param [String] name
        #   Name of the AccessApprovalSettings to delete.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AccessapprovalV1beta1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AccessapprovalV1beta1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_access_approval_settings(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::AccessapprovalV1beta1::Empty::Representation
          command.response_class = Google::Apis::AccessapprovalV1beta1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the settings associated with a project, folder, or organization.
        # @param [String] name
        #   Name of the AccessApprovalSettings to retrieve.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AccessapprovalV1beta1::AccessApprovalSettings] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AccessapprovalV1beta1::AccessApprovalSettings]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_access_approval_settings(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::AccessapprovalV1beta1::AccessApprovalSettings::Representation
          command.response_class = Google::Apis::AccessapprovalV1beta1::AccessApprovalSettings
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the settings associated with a project, folder, or organization.
        # Settings to update are determined by the value of field_mask.
        # @param [String] name
        #   The resource name of the settings. Format is one of:
        #   <ol>
        #   <li>"projects/`project_id`/accessApprovalSettings"</li>
        #   <li>"folders/`folder_id`/accessApprovalSettings"</li>
        #   <li>"organizations/`organization_id`/accessApprovalSettings"</li>
        #   <ol>
        # @param [Google::Apis::AccessapprovalV1beta1::AccessApprovalSettings] access_approval_settings_object
        # @param [String] update_mask
        #   For the `FieldMask` definition, see
        #   https://developers.google.com/protocol-buffers/docs/reference/google.protobuf#
        #   fieldmask
        #   If this field is left unset, only the notification_emails field will be
        #   updated.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AccessapprovalV1beta1::AccessApprovalSettings] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AccessapprovalV1beta1::AccessApprovalSettings]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_project_access_approval_settings(name, access_approval_settings_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1beta1/{+name}', options)
          command.request_representation = Google::Apis::AccessapprovalV1beta1::AccessApprovalSettings::Representation
          command.request_object = access_approval_settings_object
          command.response_representation = Google::Apis::AccessapprovalV1beta1::AccessApprovalSettings::Representation
          command.response_class = Google::Apis::AccessapprovalV1beta1::AccessApprovalSettings
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Approves a request and returns the updated ApprovalRequest.
        # Returns NOT_FOUND if the request does not exist. Returns
        # FAILED_PRECONDITION if the request exists but is not in a pending state.
        # @param [String] name
        #   Name of the approval request to approve.
        # @param [Google::Apis::AccessapprovalV1beta1::ApproveApprovalRequestMessage] approve_approval_request_message_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AccessapprovalV1beta1::ApprovalRequest] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AccessapprovalV1beta1::ApprovalRequest]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def approve_project_approval_request(name, approve_approval_request_message_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+name}:approve', options)
          command.request_representation = Google::Apis::AccessapprovalV1beta1::ApproveApprovalRequestMessage::Representation
          command.request_object = approve_approval_request_message_object
          command.response_representation = Google::Apis::AccessapprovalV1beta1::ApprovalRequest::Representation
          command.response_class = Google::Apis::AccessapprovalV1beta1::ApprovalRequest
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Dismisses a request. Returns the updated ApprovalRequest.
        # NOTE: This does not deny access to the resource if another request has been
        # made and approved. It is equivalent in effect to ignoring the request
        # altogether.
        # Returns NOT_FOUND if the request does not exist.
        # Returns FAILED_PRECONDITION if the request exists but is not in a pending
        # state.
        # @param [String] name
        #   Name of the ApprovalRequest to dismiss.
        # @param [Google::Apis::AccessapprovalV1beta1::DismissApprovalRequestMessage] dismiss_approval_request_message_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AccessapprovalV1beta1::ApprovalRequest] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AccessapprovalV1beta1::ApprovalRequest]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def dismiss_project_approval_request(name, dismiss_approval_request_message_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+name}:dismiss', options)
          command.request_representation = Google::Apis::AccessapprovalV1beta1::DismissApprovalRequestMessage::Representation
          command.request_object = dismiss_approval_request_message_object
          command.response_representation = Google::Apis::AccessapprovalV1beta1::ApprovalRequest::Representation
          command.response_class = Google::Apis::AccessapprovalV1beta1::ApprovalRequest
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets an approval request. Returns NOT_FOUND if the request does not exist.
        # @param [String] name
        #   Name of the approval request to retrieve.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AccessapprovalV1beta1::ApprovalRequest] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AccessapprovalV1beta1::ApprovalRequest]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_approval_request(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::AccessapprovalV1beta1::ApprovalRequest::Representation
          command.response_class = Google::Apis::AccessapprovalV1beta1::ApprovalRequest
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists approval requests associated with a project, folder, or organization.
        # Approval requests can be filtered by state (pending, active, dismissed).
        # The order is reverse chronological.
        # @param [String] parent
        #   The parent resource. This may be "projects/`project_id`",
        #   "folders/`folder_id`", or "organizations/`organization_id`".
        # @param [String] filter
        #   A filter on the type of approval requests to retrieve. Must be one of the
        #   following values:
        #   <ol>
        #   <li>[not set]: Requests that are pending or have active approvals.</li>
        #   <li>ALL: All requests.</li>
        #   <li>PENDING: Only pending requests.</li>
        #   <li>ACTIVE: Only active (i.e. currently approved) requests.</li>
        #   <li>DISMISSED: Only dismissed (including expired) requests.</li>
        #   </ol>
        # @param [Fixnum] page_size
        #   Requested page size.
        # @param [String] page_token
        #   A token identifying the page of results to return.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AccessapprovalV1beta1::ListApprovalRequestsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AccessapprovalV1beta1::ListApprovalRequestsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_approval_requests(parent, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+parent}/approvalRequests', options)
          command.response_representation = Google::Apis::AccessapprovalV1beta1::ListApprovalRequestsResponse::Representation
          command.response_class = Google::Apis::AccessapprovalV1beta1::ListApprovalRequestsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
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
