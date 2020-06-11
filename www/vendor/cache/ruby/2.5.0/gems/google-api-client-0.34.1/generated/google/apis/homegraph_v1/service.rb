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
    module HomegraphV1
      # HomeGraph API
      #
      # 
      #
      # @example
      #    require 'google/apis/homegraph_v1'
      #
      #    Homegraph = Google::Apis::HomegraphV1 # Alias the module
      #    service = Homegraph::HomeGraphServiceService.new
      #
      # @see https://developers.google.com/actions/smarthome/create-app#request-sync
      class HomeGraphServiceService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://homegraph.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Unlinks an agent user from Google. As a result, all data related to this
        # user will be deleted.
        # Here is how the agent user is created in Google:
        # 1.  When a user opens their Google Home App, they can begin linking a 3p
        # partner.
        # 2.  User is guided through the OAuth process.
        # 3.  After entering the 3p credentials, Google gets the 3p OAuth token and
        # uses it to make a Sync call to the 3p partner and gets back all of the
        # user's data, including `agent_user_id` and devices.
        # 4.  Google creates the agent user and stores a mapping from the
        # `agent_user_id` -> Google ID mapping. Google also
        # stores all of the user's devices under that Google ID.
        # The mapping from `agent_user_id` to Google ID is many to many, since one
        # Google user can have multiple 3p accounts, and multiple Google users can
        # map to one `agent_user_id` (e.g., a husband and wife share one Nest account
        # username/password).
        # The third-party user's identity is passed in as `agent_user_id`.
        # The agent is identified by the JWT signed by the partner's service account.
        # Note: Special characters (except "/") in `agent_user_id` must be
        # URL-encoded.
        # @param [String] agent_user_id
        #   Required. Third-party user ID.
        # @param [String] request_id
        #   Request ID used for debugging.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::HomegraphV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::HomegraphV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_agent_user(agent_user_id, request_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/{+agentUserId}', options)
          command.response_representation = Google::Apis::HomegraphV1::Empty::Representation
          command.response_class = Google::Apis::HomegraphV1::Empty
          command.params['agentUserId'] = agent_user_id unless agent_user_id.nil?
          command.query['requestId'] = request_id unless request_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the device states for the devices in QueryRequest.
        # The third-party user's identity is passed in as `agent_user_id`. The agent
        # is identified by the JWT signed by the third-party partner's service
        # account.
        # @param [Google::Apis::HomegraphV1::QueryRequest] query_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::HomegraphV1::QueryResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::HomegraphV1::QueryResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def query_device(query_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/devices:query', options)
          command.request_representation = Google::Apis::HomegraphV1::QueryRequest::Representation
          command.request_object = query_request_object
          command.response_representation = Google::Apis::HomegraphV1::QueryResponse::Representation
          command.response_class = Google::Apis::HomegraphV1::QueryResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Reports device state and optionally sends device notifications. Called by
        # an agent when the device state of a third-party changes or the agent wants
        # to send a notification about the device. See
        # [Implement Report State](/actions/smarthome/report-state) for more
        # information.
        # This method updates a predefined set of states for a device, which all
        # devices have according to their prescribed traits (for example, a light
        # will have the [OnOff](/actions/smarthome/traits/onoff) trait that reports
        # the state `on` as a boolean value).
        # A new state may not be created and an INVALID_ARGUMENT code will be thrown
        # if so. It also optionally takes in a list of Notifications that may be
        # created, which are associated to this state change.
        # The third-party user's identity is passed in as `agent_user_id`.
        # The agent is identified by the JWT signed by the partner's service account.
        # @param [Google::Apis::HomegraphV1::ReportStateAndNotificationRequest] report_state_and_notification_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::HomegraphV1::ReportStateAndNotificationResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::HomegraphV1::ReportStateAndNotificationResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def report_device_state_and_notification(report_state_and_notification_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/devices:reportStateAndNotification', options)
          command.request_representation = Google::Apis::HomegraphV1::ReportStateAndNotificationRequest::Representation
          command.request_object = report_state_and_notification_request_object
          command.response_representation = Google::Apis::HomegraphV1::ReportStateAndNotificationResponse::Representation
          command.response_class = Google::Apis::HomegraphV1::ReportStateAndNotificationResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Requests a `SYNC` call from Google to a 3p partner's home control agent for
        # a user.
        # The third-party user's identity is passed in as `agent_user_id`
        # (see RequestSyncDevicesRequest) and forwarded back to the agent.
        # The agent is identified by the API key or JWT signed by the partner's
        # service account.
        # @param [Google::Apis::HomegraphV1::RequestSyncDevicesRequest] request_sync_devices_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::HomegraphV1::RequestSyncDevicesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::HomegraphV1::RequestSyncDevicesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def request_sync_devices(request_sync_devices_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/devices:requestSync', options)
          command.request_representation = Google::Apis::HomegraphV1::RequestSyncDevicesRequest::Representation
          command.request_object = request_sync_devices_request_object
          command.response_representation = Google::Apis::HomegraphV1::RequestSyncDevicesResponse::Representation
          command.response_class = Google::Apis::HomegraphV1::RequestSyncDevicesResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets all the devices associated with the given third-party user.
        # The third-party user's identity is passed in as `agent_user_id`. The agent
        # is identified by the JWT signed by the third-party partner's service
        # account.
        # @param [Google::Apis::HomegraphV1::SyncRequest] sync_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::HomegraphV1::SyncResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::HomegraphV1::SyncResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def sync_device(sync_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/devices:sync', options)
          command.request_representation = Google::Apis::HomegraphV1::SyncRequest::Representation
          command.request_object = sync_request_object
          command.response_representation = Google::Apis::HomegraphV1::SyncResponse::Representation
          command.response_class = Google::Apis::HomegraphV1::SyncResponse
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
