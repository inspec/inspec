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
    module ClouddebuggerV2
      # Stackdriver Debugger API
      #
      # Examines the call stack and variables of a running application without
      #  stopping or slowing it down.
      #
      # @example
      #    require 'google/apis/clouddebugger_v2'
      #
      #    Clouddebugger = Google::Apis::ClouddebuggerV2 # Alias the module
      #    service = Clouddebugger::CloudDebuggerService.new
      #
      # @see https://cloud.google.com/debugger
      class CloudDebuggerService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://clouddebugger.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Registers the debuggee with the controller service.
        # All agents attached to the same application must call this method with
        # exactly the same request content to get back the same stable `debuggee_id`.
        # Agents should call this method again whenever `google.rpc.Code.NOT_FOUND`
        # is returned from any controller method.
        # This protocol allows the controller service to disable debuggees, recover
        # from data loss, or change the `debuggee_id` format. Agents must handle
        # `debuggee_id` value changing upon re-registration.
        # @param [Google::Apis::ClouddebuggerV2::RegisterDebuggeeRequest] register_debuggee_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClouddebuggerV2::RegisterDebuggeeResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClouddebuggerV2::RegisterDebuggeeResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def register_debuggee(register_debuggee_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/controller/debuggees/register', options)
          command.request_representation = Google::Apis::ClouddebuggerV2::RegisterDebuggeeRequest::Representation
          command.request_object = register_debuggee_request_object
          command.response_representation = Google::Apis::ClouddebuggerV2::RegisterDebuggeeResponse::Representation
          command.response_class = Google::Apis::ClouddebuggerV2::RegisterDebuggeeResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the list of all active breakpoints for the debuggee.
        # The breakpoint specification (`location`, `condition`, and `expressions`
        # fields) is semantically immutable, although the field values may
        # change. For example, an agent may update the location line number
        # to reflect the actual line where the breakpoint was set, but this
        # doesn't change the breakpoint semantics.
        # This means that an agent does not need to check if a breakpoint has changed
        # when it encounters the same breakpoint on a successive call.
        # Moreover, an agent should remember the breakpoints that are completed
        # until the controller removes them from the active list to avoid
        # setting those breakpoints again.
        # @param [String] debuggee_id
        #   Required. Identifies the debuggee.
        # @param [Boolean] success_on_timeout
        #   If set to `true` (recommended), returns `google.rpc.Code.OK` status and
        #   sets the `wait_expired` response field to `true` when the server-selected
        #   timeout has expired.
        #   If set to `false` (deprecated), returns `google.rpc.Code.ABORTED` status
        #   when the server-selected timeout has expired.
        # @param [String] wait_token
        #   A token that, if specified, blocks the method call until the list
        #   of active breakpoints has changed, or a server-selected timeout has
        #   expired. The value should be set from the `next_wait_token` field in
        #   the last response. The initial value should be set to `"init"`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClouddebuggerV2::ListActiveBreakpointsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClouddebuggerV2::ListActiveBreakpointsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_controller_debuggee_breakpoints(debuggee_id, success_on_timeout: nil, wait_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/controller/debuggees/{debuggeeId}/breakpoints', options)
          command.response_representation = Google::Apis::ClouddebuggerV2::ListActiveBreakpointsResponse::Representation
          command.response_class = Google::Apis::ClouddebuggerV2::ListActiveBreakpointsResponse
          command.params['debuggeeId'] = debuggee_id unless debuggee_id.nil?
          command.query['successOnTimeout'] = success_on_timeout unless success_on_timeout.nil?
          command.query['waitToken'] = wait_token unless wait_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the breakpoint state or mutable fields.
        # The entire Breakpoint message must be sent back to the controller service.
        # Updates to active breakpoint fields are only allowed if the new value
        # does not change the breakpoint specification. Updates to the `location`,
        # `condition` and `expressions` fields should not alter the breakpoint
        # semantics. These may only make changes such as canonicalizing a value
        # or snapping the location to the correct line of code.
        # @param [String] debuggee_id
        #   Required. Identifies the debuggee being debugged.
        # @param [String] id
        #   Breakpoint identifier, unique in the scope of the debuggee.
        # @param [Google::Apis::ClouddebuggerV2::UpdateActiveBreakpointRequest] update_active_breakpoint_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClouddebuggerV2::UpdateActiveBreakpointResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClouddebuggerV2::UpdateActiveBreakpointResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_active_breakpoint(debuggee_id, id, update_active_breakpoint_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v2/controller/debuggees/{debuggeeId}/breakpoints/{id}', options)
          command.request_representation = Google::Apis::ClouddebuggerV2::UpdateActiveBreakpointRequest::Representation
          command.request_object = update_active_breakpoint_request_object
          command.response_representation = Google::Apis::ClouddebuggerV2::UpdateActiveBreakpointResponse::Representation
          command.response_class = Google::Apis::ClouddebuggerV2::UpdateActiveBreakpointResponse
          command.params['debuggeeId'] = debuggee_id unless debuggee_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all the debuggees that the user has access to.
        # @param [String] client_version
        #   Required. The client version making the call.
        #   Schema: `domain/type/version` (e.g., `google.com/intellij/v1`).
        # @param [Boolean] include_inactive
        #   When set to `true`, the result includes all debuggees. Otherwise, the
        #   result includes only debuggees that are active.
        # @param [String] project
        #   Required. Project number of a Google Cloud project whose debuggees to list.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClouddebuggerV2::ListDebuggeesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClouddebuggerV2::ListDebuggeesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_debugger_debuggees(client_version: nil, include_inactive: nil, project: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/debugger/debuggees', options)
          command.response_representation = Google::Apis::ClouddebuggerV2::ListDebuggeesResponse::Representation
          command.response_class = Google::Apis::ClouddebuggerV2::ListDebuggeesResponse
          command.query['clientVersion'] = client_version unless client_version.nil?
          command.query['includeInactive'] = include_inactive unless include_inactive.nil?
          command.query['project'] = project unless project.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the breakpoint from the debuggee.
        # @param [String] debuggee_id
        #   Required. ID of the debuggee whose breakpoint to delete.
        # @param [String] breakpoint_id
        #   Required. ID of the breakpoint to delete.
        # @param [String] client_version
        #   Required. The client version making the call.
        #   Schema: `domain/type/version` (e.g., `google.com/intellij/v1`).
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClouddebuggerV2::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClouddebuggerV2::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_debugger_debuggee_breakpoint(debuggee_id, breakpoint_id, client_version: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2/debugger/debuggees/{debuggeeId}/breakpoints/{breakpointId}', options)
          command.response_representation = Google::Apis::ClouddebuggerV2::Empty::Representation
          command.response_class = Google::Apis::ClouddebuggerV2::Empty
          command.params['debuggeeId'] = debuggee_id unless debuggee_id.nil?
          command.params['breakpointId'] = breakpoint_id unless breakpoint_id.nil?
          command.query['clientVersion'] = client_version unless client_version.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets breakpoint information.
        # @param [String] debuggee_id
        #   Required. ID of the debuggee whose breakpoint to get.
        # @param [String] breakpoint_id
        #   Required. ID of the breakpoint to get.
        # @param [String] client_version
        #   Required. The client version making the call.
        #   Schema: `domain/type/version` (e.g., `google.com/intellij/v1`).
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClouddebuggerV2::GetBreakpointResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClouddebuggerV2::GetBreakpointResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_debugger_debuggee_breakpoint(debuggee_id, breakpoint_id, client_version: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/debugger/debuggees/{debuggeeId}/breakpoints/{breakpointId}', options)
          command.response_representation = Google::Apis::ClouddebuggerV2::GetBreakpointResponse::Representation
          command.response_class = Google::Apis::ClouddebuggerV2::GetBreakpointResponse
          command.params['debuggeeId'] = debuggee_id unless debuggee_id.nil?
          command.params['breakpointId'] = breakpoint_id unless breakpoint_id.nil?
          command.query['clientVersion'] = client_version unless client_version.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all breakpoints for the debuggee.
        # @param [String] debuggee_id
        #   Required. ID of the debuggee whose breakpoints to list.
        # @param [String] action_value
        #   Only breakpoints with the specified action will pass the filter.
        # @param [String] client_version
        #   Required. The client version making the call.
        #   Schema: `domain/type/version` (e.g., `google.com/intellij/v1`).
        # @param [Boolean] include_all_users
        #   When set to `true`, the response includes the list of breakpoints set by
        #   any user. Otherwise, it includes only breakpoints set by the caller.
        # @param [Boolean] include_inactive
        #   When set to `true`, the response includes active and inactive
        #   breakpoints. Otherwise, it includes only active breakpoints.
        # @param [Boolean] strip_results
        #   This field is deprecated. The following fields are always stripped out of
        #   the result: `stack_frames`, `evaluated_expressions` and `variable_table`.
        # @param [String] wait_token
        #   A wait token that, if specified, blocks the call until the breakpoints
        #   list has changed, or a server selected timeout has expired.  The value
        #   should be set from the last response. The error code
        #   `google.rpc.Code.ABORTED` (RPC) is returned on wait timeout, which
        #   should be called again with the same `wait_token`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClouddebuggerV2::ListBreakpointsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClouddebuggerV2::ListBreakpointsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_debugger_debuggee_breakpoints(debuggee_id, action_value: nil, client_version: nil, include_all_users: nil, include_inactive: nil, strip_results: nil, wait_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/debugger/debuggees/{debuggeeId}/breakpoints', options)
          command.response_representation = Google::Apis::ClouddebuggerV2::ListBreakpointsResponse::Representation
          command.response_class = Google::Apis::ClouddebuggerV2::ListBreakpointsResponse
          command.params['debuggeeId'] = debuggee_id unless debuggee_id.nil?
          command.query['action.value'] = action_value unless action_value.nil?
          command.query['clientVersion'] = client_version unless client_version.nil?
          command.query['includeAllUsers'] = include_all_users unless include_all_users.nil?
          command.query['includeInactive'] = include_inactive unless include_inactive.nil?
          command.query['stripResults'] = strip_results unless strip_results.nil?
          command.query['waitToken'] = wait_token unless wait_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets the breakpoint to the debuggee.
        # @param [String] debuggee_id
        #   Required. ID of the debuggee where the breakpoint is to be set.
        # @param [Google::Apis::ClouddebuggerV2::Breakpoint] breakpoint_object
        # @param [String] client_version
        #   Required. The client version making the call.
        #   Schema: `domain/type/version` (e.g., `google.com/intellij/v1`).
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClouddebuggerV2::SetBreakpointResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClouddebuggerV2::SetBreakpointResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def set_debugger_debuggee_breakpoint(debuggee_id, breakpoint_object = nil, client_version: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/debugger/debuggees/{debuggeeId}/breakpoints/set', options)
          command.request_representation = Google::Apis::ClouddebuggerV2::Breakpoint::Representation
          command.request_object = breakpoint_object
          command.response_representation = Google::Apis::ClouddebuggerV2::SetBreakpointResponse::Representation
          command.response_class = Google::Apis::ClouddebuggerV2::SetBreakpointResponse
          command.params['debuggeeId'] = debuggee_id unless debuggee_id.nil?
          command.query['clientVersion'] = client_version unless client_version.nil?
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
