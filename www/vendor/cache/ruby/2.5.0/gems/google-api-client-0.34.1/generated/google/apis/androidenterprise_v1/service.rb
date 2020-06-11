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
    module AndroidenterpriseV1
      # Google Play EMM API
      #
      # Manages the deployment of apps to Android for Work users.
      #
      # @example
      #    require 'google/apis/androidenterprise_v1'
      #
      #    Androidenterprise = Google::Apis::AndroidenterpriseV1 # Alias the module
      #    service = Androidenterprise::AndroidEnterpriseService.new
      #
      # @see https://developers.google.com/android/work/play/emm-api
      class AndroidEnterpriseService < Google::Apis::Core::BaseService
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
          super('https://www.googleapis.com/', 'androidenterprise/v1/')
          @batch_path = 'batch/androidenterprise/v1'
        end
        
        # Uploads a report containing any changes in app states on the device since the
        # last report was generated. You can call this method up to 3 times every 24
        # hours for a given device.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
        # @param [String] device_id
        #   The ID of the device.
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def force_device_report_upload(enterprise_id, user_id, device_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'enterprises/{enterpriseId}/users/{userId}/devices/{deviceId}/forceReportUpload', options)
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.params['deviceId'] = device_id unless device_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the details of a device.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
        # @param [String] device_id
        #   The ID of the device.
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::Device] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::Device]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_device(enterprise_id, user_id, device_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'enterprises/{enterpriseId}/users/{userId}/devices/{deviceId}', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::Device::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::Device
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.params['deviceId'] = device_id unless device_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves whether a device's access to Google services is enabled or disabled.
        # The device state takes effect only if enforcing EMM policies on Android
        # devices is enabled in the Google Admin Console. Otherwise, the device state is
        # ignored and all devices are allowed access to Google services. This is only
        # supported for Google-managed users.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
        # @param [String] device_id
        #   The ID of the device.
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::DeviceState] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::DeviceState]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_device_state(enterprise_id, user_id, device_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'enterprises/{enterpriseId}/users/{userId}/devices/{deviceId}/state', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::DeviceState::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::DeviceState
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.params['deviceId'] = device_id unless device_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the IDs of all of a user's devices.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::ListDevicesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::ListDevicesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_devices(enterprise_id, user_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'enterprises/{enterpriseId}/users/{userId}/devices', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::ListDevicesResponse::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::ListDevicesResponse
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the device policy. This method supports patch semantics.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
        # @param [String] device_id
        #   The ID of the device.
        # @param [Google::Apis::AndroidenterpriseV1::Device] device_object
        # @param [String] update_mask
        #   Mask that identifies which fields to update. If not set, all modifiable fields
        #   will be modified.
        #   When set in a query parameter, this field should be specified as updateMask=<
        #   field1>,<field2>,...
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::Device] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::Device]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_device(enterprise_id, user_id, device_id, device_object = nil, update_mask: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'enterprises/{enterpriseId}/users/{userId}/devices/{deviceId}', options)
          command.request_representation = Google::Apis::AndroidenterpriseV1::Device::Representation
          command.request_object = device_object
          command.response_representation = Google::Apis::AndroidenterpriseV1::Device::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::Device
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.params['deviceId'] = device_id unless device_id.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets whether a device's access to Google services is enabled or disabled. The
        # device state takes effect only if enforcing EMM policies on Android devices is
        # enabled in the Google Admin Console. Otherwise, the device state is ignored
        # and all devices are allowed access to Google services. This is only supported
        # for Google-managed users.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
        # @param [String] device_id
        #   The ID of the device.
        # @param [Google::Apis::AndroidenterpriseV1::DeviceState] device_state_object
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::DeviceState] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::DeviceState]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def set_device_state(enterprise_id, user_id, device_id, device_state_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'enterprises/{enterpriseId}/users/{userId}/devices/{deviceId}/state', options)
          command.request_representation = Google::Apis::AndroidenterpriseV1::DeviceState::Representation
          command.request_object = device_state_object
          command.response_representation = Google::Apis::AndroidenterpriseV1::DeviceState::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::DeviceState
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.params['deviceId'] = device_id unless device_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the device policy
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
        # @param [String] device_id
        #   The ID of the device.
        # @param [Google::Apis::AndroidenterpriseV1::Device] device_object
        # @param [String] update_mask
        #   Mask that identifies which fields to update. If not set, all modifiable fields
        #   will be modified.
        #   When set in a query parameter, this field should be specified as updateMask=<
        #   field1>,<field2>,...
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::Device] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::Device]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_device(enterprise_id, user_id, device_id, device_object = nil, update_mask: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'enterprises/{enterpriseId}/users/{userId}/devices/{deviceId}', options)
          command.request_representation = Google::Apis::AndroidenterpriseV1::Device::Representation
          command.request_object = device_object
          command.response_representation = Google::Apis::AndroidenterpriseV1::Device::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::Device
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.params['deviceId'] = device_id unless device_id.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Acknowledges notifications that were received from Enterprises.
        # PullNotificationSet to prevent subsequent calls from returning the same
        # notifications.
        # @param [String] notification_set_id
        #   The notification set ID as returned by Enterprises.PullNotificationSet. This
        #   must be provided.
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def acknowledge_enterprise_notification_set(notification_set_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'enterprises/acknowledgeNotificationSet', options)
          command.query['notificationSetId'] = notification_set_id unless notification_set_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Completes the signup flow, by specifying the Completion token and Enterprise
        # token. This request must not be called multiple times for a given Enterprise
        # Token.
        # @param [String] completion_token
        #   The Completion token initially returned by GenerateSignupUrl.
        # @param [String] enterprise_token
        #   The Enterprise token appended to the Callback URL.
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::Enterprise] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::Enterprise]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def complete_enterprise_signup(completion_token: nil, enterprise_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'enterprises/completeSignup', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::Enterprise::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::Enterprise
          command.query['completionToken'] = completion_token unless completion_token.nil?
          command.query['enterpriseToken'] = enterprise_token unless enterprise_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a unique token to access an embeddable UI. To generate a web UI, pass
        # the generated token into the managed Google Play javascript API. Each token
        # may only be used to start one UI session. See the javascript API documentation
        # for further information.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [Google::Apis::AndroidenterpriseV1::AdministratorWebTokenSpec] administrator_web_token_spec_object
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::AdministratorWebToken] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::AdministratorWebToken]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_enterprise_web_token(enterprise_id, administrator_web_token_spec_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'enterprises/{enterpriseId}/createWebToken', options)
          command.request_representation = Google::Apis::AndroidenterpriseV1::AdministratorWebTokenSpec::Representation
          command.request_object = administrator_web_token_spec_object
          command.response_representation = Google::Apis::AndroidenterpriseV1::AdministratorWebToken::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::AdministratorWebToken
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Enrolls an enterprise with the calling EMM.
        # @param [String] token
        #   The token provided by the enterprise to register the EMM.
        # @param [Google::Apis::AndroidenterpriseV1::Enterprise] enterprise_object
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::Enterprise] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::Enterprise]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def enroll_enterprise(token, enterprise_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'enterprises/enroll', options)
          command.request_representation = Google::Apis::AndroidenterpriseV1::Enterprise::Representation
          command.request_object = enterprise_object
          command.response_representation = Google::Apis::AndroidenterpriseV1::Enterprise::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::Enterprise
          command.query['token'] = token unless token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Generates a sign-up URL.
        # @param [String] callback_url
        #   The callback URL to which the Admin will be redirected after successfully
        #   creating an enterprise. Before redirecting there the system will add a single
        #   query parameter to this URL named "enterpriseToken" which will contain an
        #   opaque token to be used for the CompleteSignup request.
        #   Beware that this means that the URL will be parsed, the parameter added and
        #   then a new URL formatted, i.e. there may be some minor formatting changes and,
        #   more importantly, the URL must be well-formed so that it can be parsed.
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::SignupInfo] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::SignupInfo]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def generate_enterprise_signup_url(callback_url: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'enterprises/signupUrl', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::SignupInfo::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::SignupInfo
          command.query['callbackUrl'] = callback_url unless callback_url.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the name and domain of an enterprise.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::Enterprise] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::Enterprise]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_enterprise(enterprise_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'enterprises/{enterpriseId}', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::Enterprise::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::Enterprise
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a service account and credentials. The service account can be bound to
        # the enterprise by calling setAccount. The service account is unique to this
        # enterprise and EMM, and will be deleted if the enterprise is unbound. The
        # credentials contain private key data and are not stored server-side.
        # This method can only be called after calling Enterprises.Enroll or Enterprises.
        # CompleteSignup, and before Enterprises.SetAccount; at other times it will
        # return an error.
        # Subsequent calls after the first will generate a new, unique set of
        # credentials, and invalidate the previously generated credentials.
        # Once the service account is bound to the enterprise, it can be managed using
        # the serviceAccountKeys resource.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] key_type
        #   The type of credential to return with the service account. Required.
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::ServiceAccount] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::ServiceAccount]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_enterprise_service_account(enterprise_id, key_type: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'enterprises/{enterpriseId}/serviceAccount', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::ServiceAccount::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::ServiceAccount
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.query['keyType'] = key_type unless key_type.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the store layout for the enterprise. If the store layout has not been
        # set, returns "basic" as the store layout type and no homepage.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::StoreLayout] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::StoreLayout]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_enterprise_store_layout(enterprise_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'enterprises/{enterpriseId}/storeLayout', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::StoreLayout::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::StoreLayout
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Looks up an enterprise by domain name. This is only supported for enterprises
        # created via the Google-initiated creation flow. Lookup of the id is not needed
        # for enterprises created via the EMM-initiated flow since the EMM learns the
        # enterprise ID in the callback specified in the Enterprises.generateSignupUrl
        # call.
        # @param [String] domain
        #   The exact primary domain name of the enterprise to look up.
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::ListEnterprisesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::ListEnterprisesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_enterprises(domain, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'enterprises', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::ListEnterprisesResponse::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::ListEnterprisesResponse
          command.query['domain'] = domain unless domain.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Pulls and returns a notification set for the enterprises associated with the
        # service account authenticated for the request. The notification set may be
        # empty if no notification are pending.
        # A notification set returned needs to be acknowledged within 20 seconds by
        # calling Enterprises.AcknowledgeNotificationSet, unless the notification set is
        # empty.
        # Notifications that are not acknowledged within the 20 seconds will eventually
        # be included again in the response to another PullNotificationSet request, and
        # those that are never acknowledged will ultimately be deleted according to the
        # Google Cloud Platform Pub/Sub system policy.
        # Multiple requests might be performed concurrently to retrieve notifications,
        # in which case the pending notifications (if any) will be split among each
        # caller, if any are pending.
        # If no notifications are present, an empty notification list is returned.
        # Subsequent requests may return more notifications once they become available.
        # @param [String] request_mode
        #   The request mode for pulling notifications.
        #   Specifying waitForNotifications will cause the request to block and wait until
        #   one or more notifications are present, or return an empty notification list if
        #   no notifications are present after some time.
        #   Speciying returnImmediately will cause the request to immediately return the
        #   pending notifications, or an empty list if no notifications are present.
        #   If omitted, defaults to waitForNotifications.
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::NotificationSet] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::NotificationSet]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def pull_enterprise_notification_set(request_mode: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'enterprises/pullNotificationSet', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::NotificationSet::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::NotificationSet
          command.query['requestMode'] = request_mode unless request_mode.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sends a test notification to validate the EMM integration with the Google
        # Cloud Pub/Sub service for this enterprise.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::SendTestPushNotificationResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::SendTestPushNotificationResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def send_enterprise_test_push_notification(enterprise_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'enterprises/{enterpriseId}/sendTestPushNotification', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::SendTestPushNotificationResponse::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::SendTestPushNotificationResponse
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets the account that will be used to authenticate to the API as the
        # enterprise.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [Google::Apis::AndroidenterpriseV1::EnterpriseAccount] enterprise_account_object
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::EnterpriseAccount] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::EnterpriseAccount]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def set_enterprise_account(enterprise_id, enterprise_account_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'enterprises/{enterpriseId}/account', options)
          command.request_representation = Google::Apis::AndroidenterpriseV1::EnterpriseAccount::Representation
          command.request_object = enterprise_account_object
          command.response_representation = Google::Apis::AndroidenterpriseV1::EnterpriseAccount::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::EnterpriseAccount
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets the store layout for the enterprise. By default, storeLayoutType is set
        # to "basic" and the basic store layout is enabled. The basic layout only
        # contains apps approved by the admin, and that have been added to the available
        # product set for a user (using the  setAvailableProductSet call). Apps on the
        # page are sorted in order of their product ID value. If you create a custom
        # store layout (by setting storeLayoutType = "custom" and setting a homepage),
        # the basic store layout is disabled.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [Google::Apis::AndroidenterpriseV1::StoreLayout] store_layout_object
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::StoreLayout] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::StoreLayout]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def set_enterprise_store_layout(enterprise_id, store_layout_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'enterprises/{enterpriseId}/storeLayout', options)
          command.request_representation = Google::Apis::AndroidenterpriseV1::StoreLayout::Representation
          command.request_object = store_layout_object
          command.response_representation = Google::Apis::AndroidenterpriseV1::StoreLayout::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::StoreLayout
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Unenrolls an enterprise from the calling EMM.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def unenroll_enterprise(enterprise_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'enterprises/{enterpriseId}/unenroll', options)
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Removes an entitlement to an app for a user.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
        # @param [String] entitlement_id
        #   The ID of the entitlement (a product ID), e.g. "app:com.google.android.gm".
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_entitlement(enterprise_id, user_id, entitlement_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'enterprises/{enterpriseId}/users/{userId}/entitlements/{entitlementId}', options)
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.params['entitlementId'] = entitlement_id unless entitlement_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves details of an entitlement.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
        # @param [String] entitlement_id
        #   The ID of the entitlement (a product ID), e.g. "app:com.google.android.gm".
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::Entitlement] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::Entitlement]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_entitlement(enterprise_id, user_id, entitlement_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'enterprises/{enterpriseId}/users/{userId}/entitlements/{entitlementId}', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::Entitlement::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::Entitlement
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.params['entitlementId'] = entitlement_id unless entitlement_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all entitlements for the specified user. Only the ID is set.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::ListEntitlementsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::ListEntitlementsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_entitlements(enterprise_id, user_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'enterprises/{enterpriseId}/users/{userId}/entitlements', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::ListEntitlementsResponse::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::ListEntitlementsResponse
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Adds or updates an entitlement to an app for a user. This method supports
        # patch semantics.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
        # @param [String] entitlement_id
        #   The ID of the entitlement (a product ID), e.g. "app:com.google.android.gm".
        # @param [Google::Apis::AndroidenterpriseV1::Entitlement] entitlement_object
        # @param [Boolean] install
        #   Set to true to also install the product on all the user's devices where
        #   possible. Failure to install on one or more devices will not prevent this
        #   operation from returning successfully, as long as the entitlement was
        #   successfully assigned to the user.
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::Entitlement] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::Entitlement]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_entitlement(enterprise_id, user_id, entitlement_id, entitlement_object = nil, install: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'enterprises/{enterpriseId}/users/{userId}/entitlements/{entitlementId}', options)
          command.request_representation = Google::Apis::AndroidenterpriseV1::Entitlement::Representation
          command.request_object = entitlement_object
          command.response_representation = Google::Apis::AndroidenterpriseV1::Entitlement::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::Entitlement
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.params['entitlementId'] = entitlement_id unless entitlement_id.nil?
          command.query['install'] = install unless install.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Adds or updates an entitlement to an app for a user.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
        # @param [String] entitlement_id
        #   The ID of the entitlement (a product ID), e.g. "app:com.google.android.gm".
        # @param [Google::Apis::AndroidenterpriseV1::Entitlement] entitlement_object
        # @param [Boolean] install
        #   Set to true to also install the product on all the user's devices where
        #   possible. Failure to install on one or more devices will not prevent this
        #   operation from returning successfully, as long as the entitlement was
        #   successfully assigned to the user.
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::Entitlement] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::Entitlement]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_entitlement(enterprise_id, user_id, entitlement_id, entitlement_object = nil, install: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'enterprises/{enterpriseId}/users/{userId}/entitlements/{entitlementId}', options)
          command.request_representation = Google::Apis::AndroidenterpriseV1::Entitlement::Representation
          command.request_object = entitlement_object
          command.response_representation = Google::Apis::AndroidenterpriseV1::Entitlement::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::Entitlement
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.params['entitlementId'] = entitlement_id unless entitlement_id.nil?
          command.query['install'] = install unless install.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves details of an enterprise's group license for a product.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] group_license_id
        #   The ID of the product the group license is for, e.g. "app:com.google.android.
        #   gm".
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::GroupLicense] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::GroupLicense]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_group_license(enterprise_id, group_license_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'enterprises/{enterpriseId}/groupLicenses/{groupLicenseId}', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::GroupLicense::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::GroupLicense
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['groupLicenseId'] = group_license_id unless group_license_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves IDs of all products for which the enterprise has a group license.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::ListGroupLicensesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::ListGroupLicensesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_group_licenses(enterprise_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'enterprises/{enterpriseId}/groupLicenses', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::ListGroupLicensesResponse::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::ListGroupLicensesResponse
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the IDs of the users who have been granted entitlements under the
        # license.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] group_license_id
        #   The ID of the product the group license is for, e.g. "app:com.google.android.
        #   gm".
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::ListGroupLicenseUsersResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::ListGroupLicenseUsersResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_group_license_users(enterprise_id, group_license_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'enterprises/{enterpriseId}/groupLicenses/{groupLicenseId}/users', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::ListGroupLicenseUsersResponse::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::ListGroupLicenseUsersResponse
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['groupLicenseId'] = group_license_id unless group_license_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Requests to remove an app from a device. A call to get or list will still show
        # the app as installed on the device until it is actually removed.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
        # @param [String] device_id
        #   The Android ID of the device.
        # @param [String] install_id
        #   The ID of the product represented by the install, e.g. "app:com.google.android.
        #   gm".
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_install(enterprise_id, user_id, device_id, install_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'enterprises/{enterpriseId}/users/{userId}/devices/{deviceId}/installs/{installId}', options)
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.params['deviceId'] = device_id unless device_id.nil?
          command.params['installId'] = install_id unless install_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves details of an installation of an app on a device.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
        # @param [String] device_id
        #   The Android ID of the device.
        # @param [String] install_id
        #   The ID of the product represented by the install, e.g. "app:com.google.android.
        #   gm".
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::Install] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::Install]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_install(enterprise_id, user_id, device_id, install_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'enterprises/{enterpriseId}/users/{userId}/devices/{deviceId}/installs/{installId}', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::Install::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::Install
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.params['deviceId'] = device_id unless device_id.nil?
          command.params['installId'] = install_id unless install_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the details of all apps installed on the specified device.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
        # @param [String] device_id
        #   The Android ID of the device.
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::ListInstallsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::ListInstallsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_installs(enterprise_id, user_id, device_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'enterprises/{enterpriseId}/users/{userId}/devices/{deviceId}/installs', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::ListInstallsResponse::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::ListInstallsResponse
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.params['deviceId'] = device_id unless device_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Requests to install the latest version of an app to a device. If the app is
        # already installed, then it is updated to the latest version if necessary. This
        # method supports patch semantics.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
        # @param [String] device_id
        #   The Android ID of the device.
        # @param [String] install_id
        #   The ID of the product represented by the install, e.g. "app:com.google.android.
        #   gm".
        # @param [Google::Apis::AndroidenterpriseV1::Install] install_object
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::Install] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::Install]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_install(enterprise_id, user_id, device_id, install_id, install_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'enterprises/{enterpriseId}/users/{userId}/devices/{deviceId}/installs/{installId}', options)
          command.request_representation = Google::Apis::AndroidenterpriseV1::Install::Representation
          command.request_object = install_object
          command.response_representation = Google::Apis::AndroidenterpriseV1::Install::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::Install
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.params['deviceId'] = device_id unless device_id.nil?
          command.params['installId'] = install_id unless install_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Requests to install the latest version of an app to a device. If the app is
        # already installed, then it is updated to the latest version if necessary.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
        # @param [String] device_id
        #   The Android ID of the device.
        # @param [String] install_id
        #   The ID of the product represented by the install, e.g. "app:com.google.android.
        #   gm".
        # @param [Google::Apis::AndroidenterpriseV1::Install] install_object
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::Install] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::Install]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_install(enterprise_id, user_id, device_id, install_id, install_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'enterprises/{enterpriseId}/users/{userId}/devices/{deviceId}/installs/{installId}', options)
          command.request_representation = Google::Apis::AndroidenterpriseV1::Install::Representation
          command.request_object = install_object
          command.response_representation = Google::Apis::AndroidenterpriseV1::Install::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::Install
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.params['deviceId'] = device_id unless device_id.nil?
          command.params['installId'] = install_id unless install_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Removes a per-device managed configuration for an app for the specified device.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
        # @param [String] device_id
        #   The Android ID of the device.
        # @param [String] managed_configuration_for_device_id
        #   The ID of the managed configuration (a product ID), e.g. "app:com.google.
        #   android.gm".
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_managedconfigurationsfordevice(enterprise_id, user_id, device_id, managed_configuration_for_device_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'enterprises/{enterpriseId}/users/{userId}/devices/{deviceId}/managedConfigurationsForDevice/{managedConfigurationForDeviceId}', options)
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.params['deviceId'] = device_id unless device_id.nil?
          command.params['managedConfigurationForDeviceId'] = managed_configuration_for_device_id unless managed_configuration_for_device_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves details of a per-device managed configuration.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
        # @param [String] device_id
        #   The Android ID of the device.
        # @param [String] managed_configuration_for_device_id
        #   The ID of the managed configuration (a product ID), e.g. "app:com.google.
        #   android.gm".
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::ManagedConfiguration] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::ManagedConfiguration]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_managedconfigurationsfordevice(enterprise_id, user_id, device_id, managed_configuration_for_device_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'enterprises/{enterpriseId}/users/{userId}/devices/{deviceId}/managedConfigurationsForDevice/{managedConfigurationForDeviceId}', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::ManagedConfiguration::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::ManagedConfiguration
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.params['deviceId'] = device_id unless device_id.nil?
          command.params['managedConfigurationForDeviceId'] = managed_configuration_for_device_id unless managed_configuration_for_device_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all the per-device managed configurations for the specified device. Only
        # the ID is set.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
        # @param [String] device_id
        #   The Android ID of the device.
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::ManagedConfigurationsForDeviceListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::ManagedConfigurationsForDeviceListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_managedconfigurationsfordevices(enterprise_id, user_id, device_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'enterprises/{enterpriseId}/users/{userId}/devices/{deviceId}/managedConfigurationsForDevice', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::ManagedConfigurationsForDeviceListResponse::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::ManagedConfigurationsForDeviceListResponse
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.params['deviceId'] = device_id unless device_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Adds or updates a per-device managed configuration for an app for the
        # specified device. This method supports patch semantics.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
        # @param [String] device_id
        #   The Android ID of the device.
        # @param [String] managed_configuration_for_device_id
        #   The ID of the managed configuration (a product ID), e.g. "app:com.google.
        #   android.gm".
        # @param [Google::Apis::AndroidenterpriseV1::ManagedConfiguration] managed_configuration_object
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::ManagedConfiguration] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::ManagedConfiguration]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_managedconfigurationsfordevice(enterprise_id, user_id, device_id, managed_configuration_for_device_id, managed_configuration_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'enterprises/{enterpriseId}/users/{userId}/devices/{deviceId}/managedConfigurationsForDevice/{managedConfigurationForDeviceId}', options)
          command.request_representation = Google::Apis::AndroidenterpriseV1::ManagedConfiguration::Representation
          command.request_object = managed_configuration_object
          command.response_representation = Google::Apis::AndroidenterpriseV1::ManagedConfiguration::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::ManagedConfiguration
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.params['deviceId'] = device_id unless device_id.nil?
          command.params['managedConfigurationForDeviceId'] = managed_configuration_for_device_id unless managed_configuration_for_device_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Adds or updates a per-device managed configuration for an app for the
        # specified device.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
        # @param [String] device_id
        #   The Android ID of the device.
        # @param [String] managed_configuration_for_device_id
        #   The ID of the managed configuration (a product ID), e.g. "app:com.google.
        #   android.gm".
        # @param [Google::Apis::AndroidenterpriseV1::ManagedConfiguration] managed_configuration_object
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::ManagedConfiguration] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::ManagedConfiguration]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_managedconfigurationsfordevice(enterprise_id, user_id, device_id, managed_configuration_for_device_id, managed_configuration_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'enterprises/{enterpriseId}/users/{userId}/devices/{deviceId}/managedConfigurationsForDevice/{managedConfigurationForDeviceId}', options)
          command.request_representation = Google::Apis::AndroidenterpriseV1::ManagedConfiguration::Representation
          command.request_object = managed_configuration_object
          command.response_representation = Google::Apis::AndroidenterpriseV1::ManagedConfiguration::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::ManagedConfiguration
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.params['deviceId'] = device_id unless device_id.nil?
          command.params['managedConfigurationForDeviceId'] = managed_configuration_for_device_id unless managed_configuration_for_device_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Removes a per-user managed configuration for an app for the specified user.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
        # @param [String] managed_configuration_for_user_id
        #   The ID of the managed configuration (a product ID), e.g. "app:com.google.
        #   android.gm".
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_managedconfigurationsforuser(enterprise_id, user_id, managed_configuration_for_user_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'enterprises/{enterpriseId}/users/{userId}/managedConfigurationsForUser/{managedConfigurationForUserId}', options)
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.params['managedConfigurationForUserId'] = managed_configuration_for_user_id unless managed_configuration_for_user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves details of a per-user managed configuration for an app for the
        # specified user.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
        # @param [String] managed_configuration_for_user_id
        #   The ID of the managed configuration (a product ID), e.g. "app:com.google.
        #   android.gm".
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::ManagedConfiguration] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::ManagedConfiguration]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_managedconfigurationsforuser(enterprise_id, user_id, managed_configuration_for_user_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'enterprises/{enterpriseId}/users/{userId}/managedConfigurationsForUser/{managedConfigurationForUserId}', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::ManagedConfiguration::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::ManagedConfiguration
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.params['managedConfigurationForUserId'] = managed_configuration_for_user_id unless managed_configuration_for_user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all the per-user managed configurations for the specified user. Only the
        # ID is set.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::ManagedConfigurationsForUserListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::ManagedConfigurationsForUserListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_managedconfigurationsforusers(enterprise_id, user_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'enterprises/{enterpriseId}/users/{userId}/managedConfigurationsForUser', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::ManagedConfigurationsForUserListResponse::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::ManagedConfigurationsForUserListResponse
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Adds or updates the managed configuration settings for an app for the
        # specified user. If you support the Managed configurations iframe, you can
        # apply managed configurations to a user by specifying an mcmId and its
        # associated configuration variables (if any) in the request. Alternatively, all
        # EMMs can apply managed configurations by passing a list of managed properties.
        # This method supports patch semantics.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
        # @param [String] managed_configuration_for_user_id
        #   The ID of the managed configuration (a product ID), e.g. "app:com.google.
        #   android.gm".
        # @param [Google::Apis::AndroidenterpriseV1::ManagedConfiguration] managed_configuration_object
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::ManagedConfiguration] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::ManagedConfiguration]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_managedconfigurationsforuser(enterprise_id, user_id, managed_configuration_for_user_id, managed_configuration_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'enterprises/{enterpriseId}/users/{userId}/managedConfigurationsForUser/{managedConfigurationForUserId}', options)
          command.request_representation = Google::Apis::AndroidenterpriseV1::ManagedConfiguration::Representation
          command.request_object = managed_configuration_object
          command.response_representation = Google::Apis::AndroidenterpriseV1::ManagedConfiguration::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::ManagedConfiguration
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.params['managedConfigurationForUserId'] = managed_configuration_for_user_id unless managed_configuration_for_user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Adds or updates the managed configuration settings for an app for the
        # specified user. If you support the Managed configurations iframe, you can
        # apply managed configurations to a user by specifying an mcmId and its
        # associated configuration variables (if any) in the request. Alternatively, all
        # EMMs can apply managed configurations by passing a list of managed properties.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
        # @param [String] managed_configuration_for_user_id
        #   The ID of the managed configuration (a product ID), e.g. "app:com.google.
        #   android.gm".
        # @param [Google::Apis::AndroidenterpriseV1::ManagedConfiguration] managed_configuration_object
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::ManagedConfiguration] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::ManagedConfiguration]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_managedconfigurationsforuser(enterprise_id, user_id, managed_configuration_for_user_id, managed_configuration_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'enterprises/{enterpriseId}/users/{userId}/managedConfigurationsForUser/{managedConfigurationForUserId}', options)
          command.request_representation = Google::Apis::AndroidenterpriseV1::ManagedConfiguration::Representation
          command.request_object = managed_configuration_object
          command.response_representation = Google::Apis::AndroidenterpriseV1::ManagedConfiguration::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::ManagedConfiguration
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.params['managedConfigurationForUserId'] = managed_configuration_for_user_id unless managed_configuration_for_user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all the managed configurations settings for the specified app.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] product_id
        #   The ID of the product for which the managed configurations settings applies to.
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::ManagedConfigurationsSettingsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::ManagedConfigurationsSettingsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_managedconfigurationssettings(enterprise_id, product_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'enterprises/{enterpriseId}/products/{productId}/managedConfigurationsSettings', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::ManagedConfigurationsSettingsListResponse::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::ManagedConfigurationsSettingsListResponse
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['productId'] = product_id unless product_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves details of an Android app permission for display to an enterprise
        # admin.
        # @param [String] permission_id
        #   The ID of the permission.
        # @param [String] language
        #   The BCP47 tag for the user's preferred language (e.g. "en-US", "de")
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::Permission] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::Permission]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_permission(permission_id, language: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'permissions/{permissionId}', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::Permission::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::Permission
          command.params['permissionId'] = permission_id unless permission_id.nil?
          command.query['language'] = language unless language.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Approves the specified product and the relevant app permissions, if any. The
        # maximum number of products that you can approve per enterprise customer is 1,
        # 000.
        # To learn how to use managed Google Play to design and create a store layout to
        # display approved products to your users, see Store Layout Design.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] product_id
        #   The ID of the product.
        # @param [Google::Apis::AndroidenterpriseV1::ApproveProductRequest] approve_product_request_object
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def approve_product(enterprise_id, product_id, approve_product_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'enterprises/{enterpriseId}/products/{productId}/approve', options)
          command.request_representation = Google::Apis::AndroidenterpriseV1::ApproveProductRequest::Representation
          command.request_object = approve_product_request_object
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['productId'] = product_id unless product_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Generates a URL that can be rendered in an iframe to display the permissions (
        # if any) of a product. An enterprise admin must view these permissions and
        # accept them on behalf of their organization in order to approve that product.
        # Admins should accept the displayed permissions by interacting with a separate
        # UI element in the EMM console, which in turn should trigger the use of this
        # URL as the approvalUrlInfo.approvalUrl property in a Products.approve call to
        # approve the product. This URL can only be used to display permissions for up
        # to 1 day.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] product_id
        #   The ID of the product.
        # @param [String] language_code
        #   The BCP 47 language code used for permission names and descriptions in the
        #   returned iframe, for instance "en-US".
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::GenerateProductApprovalUrlResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::GenerateProductApprovalUrlResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def generate_product_approval_url(enterprise_id, product_id, language_code: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'enterprises/{enterpriseId}/products/{productId}/generateApprovalUrl', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::GenerateProductApprovalUrlResponse::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::GenerateProductApprovalUrlResponse
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['productId'] = product_id unless product_id.nil?
          command.query['languageCode'] = language_code unless language_code.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves details of a product for display to an enterprise admin.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] product_id
        #   The ID of the product, e.g. "app:com.google.android.gm".
        # @param [String] language
        #   The BCP47 tag for the user's preferred language (e.g. "en-US", "de").
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::Product] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::Product]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_product(enterprise_id, product_id, language: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'enterprises/{enterpriseId}/products/{productId}', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::Product::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::Product
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['productId'] = product_id unless product_id.nil?
          command.query['language'] = language unless language.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the schema that defines the configurable properties for this product.
        # All products have a schema, but this schema may be empty if no managed
        # configurations have been defined. This schema can be used to populate a UI
        # that allows an admin to configure the product. To apply a managed
        # configuration based on the schema obtained using this API, see Managed
        # Configurations through Play.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] product_id
        #   The ID of the product.
        # @param [String] language
        #   The BCP47 tag for the user's preferred language (e.g. "en-US", "de").
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::AppRestrictionsSchema] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::AppRestrictionsSchema]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_product_app_restrictions_schema(enterprise_id, product_id, language: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'enterprises/{enterpriseId}/products/{productId}/appRestrictionsSchema', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::AppRestrictionsSchema::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::AppRestrictionsSchema
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['productId'] = product_id unless product_id.nil?
          command.query['language'] = language unless language.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the Android app permissions required by this app.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] product_id
        #   The ID of the product.
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::ProductPermissions] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::ProductPermissions]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_product_permissions(enterprise_id, product_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'enterprises/{enterpriseId}/products/{productId}/permissions', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::ProductPermissions::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::ProductPermissions
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['productId'] = product_id unless product_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Finds approved products that match a query, or all approved products if there
        # is no query.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [Boolean] approved
        #   Specifies whether to search among all products (false) or among only products
        #   that have been approved (true). Only "true" is supported, and should be
        #   specified.
        # @param [String] language
        #   The BCP47 tag for the user's preferred language (e.g. "en-US", "de"). Results
        #   are returned in the language best matching the preferred language.
        # @param [Fixnum] max_results
        #   Specifies the maximum number of products that can be returned per request. If
        #   not specified, uses a default value of 100, which is also the maximum
        #   retrievable within a single response.
        # @param [String] query
        #   The search query as typed in the Google Play store search box. If omitted, all
        #   approved apps will be returned (using the pagination parameters), including
        #   apps that are not available in the store (e.g. unpublished apps).
        # @param [String] token
        #   A pagination token is contained in a request's response when there are more
        #   products. The token can be used in a subsequent request to obtain more
        #   products, and so forth. This parameter cannot be used in the initial request.
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::ProductsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::ProductsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_products(enterprise_id, approved: nil, language: nil, max_results: nil, query: nil, token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'enterprises/{enterpriseId}/products', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::ProductsListResponse::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::ProductsListResponse
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.query['approved'] = approved unless approved.nil?
          command.query['language'] = language unless language.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['query'] = query unless query.nil?
          command.query['token'] = token unless token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Unapproves the specified product (and the relevant app permissions, if any)
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] product_id
        #   The ID of the product.
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def unapprove_product(enterprise_id, product_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'enterprises/{enterpriseId}/products/{productId}/unapprove', options)
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['productId'] = product_id unless product_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Removes and invalidates the specified credentials for the service account
        # associated with this enterprise. The calling service account must have been
        # retrieved by calling Enterprises.GetServiceAccount and must have been set as
        # the enterprise service account by calling Enterprises.SetAccount.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] key_id
        #   The ID of the key.
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_serviceaccountkey(enterprise_id, key_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'enterprises/{enterpriseId}/serviceAccountKeys/{keyId}', options)
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['keyId'] = key_id unless key_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Generates new credentials for the service account associated with this
        # enterprise. The calling service account must have been retrieved by calling
        # Enterprises.GetServiceAccount and must have been set as the enterprise service
        # account by calling Enterprises.SetAccount.
        # Only the type of the key should be populated in the resource to be inserted.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [Google::Apis::AndroidenterpriseV1::ServiceAccountKey] service_account_key_object
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::ServiceAccountKey] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::ServiceAccountKey]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_serviceaccountkey(enterprise_id, service_account_key_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'enterprises/{enterpriseId}/serviceAccountKeys', options)
          command.request_representation = Google::Apis::AndroidenterpriseV1::ServiceAccountKey::Representation
          command.request_object = service_account_key_object
          command.response_representation = Google::Apis::AndroidenterpriseV1::ServiceAccountKey::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::ServiceAccountKey
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all active credentials for the service account associated with this
        # enterprise. Only the ID and key type are returned. The calling service account
        # must have been retrieved by calling Enterprises.GetServiceAccount and must
        # have been set as the enterprise service account by calling Enterprises.
        # SetAccount.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::ServiceAccountKeysListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::ServiceAccountKeysListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_serviceaccountkeys(enterprise_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'enterprises/{enterpriseId}/serviceAccountKeys', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::ServiceAccountKeysListResponse::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::ServiceAccountKeysListResponse
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a cluster.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] page_id
        #   The ID of the page.
        # @param [String] cluster_id
        #   The ID of the cluster.
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_storelayoutcluster(enterprise_id, page_id, cluster_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'enterprises/{enterpriseId}/storeLayout/pages/{pageId}/clusters/{clusterId}', options)
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['pageId'] = page_id unless page_id.nil?
          command.params['clusterId'] = cluster_id unless cluster_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves details of a cluster.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] page_id
        #   The ID of the page.
        # @param [String] cluster_id
        #   The ID of the cluster.
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::StoreCluster] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::StoreCluster]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_storelayoutcluster(enterprise_id, page_id, cluster_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'enterprises/{enterpriseId}/storeLayout/pages/{pageId}/clusters/{clusterId}', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::StoreCluster::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::StoreCluster
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['pageId'] = page_id unless page_id.nil?
          command.params['clusterId'] = cluster_id unless cluster_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a new cluster in a page.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] page_id
        #   The ID of the page.
        # @param [Google::Apis::AndroidenterpriseV1::StoreCluster] store_cluster_object
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::StoreCluster] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::StoreCluster]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_storelayoutcluster(enterprise_id, page_id, store_cluster_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'enterprises/{enterpriseId}/storeLayout/pages/{pageId}/clusters', options)
          command.request_representation = Google::Apis::AndroidenterpriseV1::StoreCluster::Representation
          command.request_object = store_cluster_object
          command.response_representation = Google::Apis::AndroidenterpriseV1::StoreCluster::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::StoreCluster
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['pageId'] = page_id unless page_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the details of all clusters on the specified page.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] page_id
        #   The ID of the page.
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::StoreLayoutClustersListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::StoreLayoutClustersListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_storelayoutclusters(enterprise_id, page_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'enterprises/{enterpriseId}/storeLayout/pages/{pageId}/clusters', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::StoreLayoutClustersListResponse::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::StoreLayoutClustersListResponse
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['pageId'] = page_id unless page_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a cluster. This method supports patch semantics.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] page_id
        #   The ID of the page.
        # @param [String] cluster_id
        #   The ID of the cluster.
        # @param [Google::Apis::AndroidenterpriseV1::StoreCluster] store_cluster_object
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::StoreCluster] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::StoreCluster]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_storelayoutcluster(enterprise_id, page_id, cluster_id, store_cluster_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'enterprises/{enterpriseId}/storeLayout/pages/{pageId}/clusters/{clusterId}', options)
          command.request_representation = Google::Apis::AndroidenterpriseV1::StoreCluster::Representation
          command.request_object = store_cluster_object
          command.response_representation = Google::Apis::AndroidenterpriseV1::StoreCluster::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::StoreCluster
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['pageId'] = page_id unless page_id.nil?
          command.params['clusterId'] = cluster_id unless cluster_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a cluster.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] page_id
        #   The ID of the page.
        # @param [String] cluster_id
        #   The ID of the cluster.
        # @param [Google::Apis::AndroidenterpriseV1::StoreCluster] store_cluster_object
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::StoreCluster] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::StoreCluster]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_storelayoutcluster(enterprise_id, page_id, cluster_id, store_cluster_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'enterprises/{enterpriseId}/storeLayout/pages/{pageId}/clusters/{clusterId}', options)
          command.request_representation = Google::Apis::AndroidenterpriseV1::StoreCluster::Representation
          command.request_object = store_cluster_object
          command.response_representation = Google::Apis::AndroidenterpriseV1::StoreCluster::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::StoreCluster
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['pageId'] = page_id unless page_id.nil?
          command.params['clusterId'] = cluster_id unless cluster_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a store page.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] page_id
        #   The ID of the page.
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_storelayoutpage(enterprise_id, page_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'enterprises/{enterpriseId}/storeLayout/pages/{pageId}', options)
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['pageId'] = page_id unless page_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves details of a store page.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] page_id
        #   The ID of the page.
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::StorePage] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::StorePage]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_storelayoutpage(enterprise_id, page_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'enterprises/{enterpriseId}/storeLayout/pages/{pageId}', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::StorePage::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::StorePage
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['pageId'] = page_id unless page_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a new store page.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [Google::Apis::AndroidenterpriseV1::StorePage] store_page_object
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::StorePage] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::StorePage]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_storelayoutpage(enterprise_id, store_page_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'enterprises/{enterpriseId}/storeLayout/pages', options)
          command.request_representation = Google::Apis::AndroidenterpriseV1::StorePage::Representation
          command.request_object = store_page_object
          command.response_representation = Google::Apis::AndroidenterpriseV1::StorePage::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::StorePage
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the details of all pages in the store.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::StoreLayoutPagesListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::StoreLayoutPagesListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_storelayoutpages(enterprise_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'enterprises/{enterpriseId}/storeLayout/pages', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::StoreLayoutPagesListResponse::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::StoreLayoutPagesListResponse
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the content of a store page. This method supports patch semantics.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] page_id
        #   The ID of the page.
        # @param [Google::Apis::AndroidenterpriseV1::StorePage] store_page_object
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::StorePage] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::StorePage]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_storelayoutpage(enterprise_id, page_id, store_page_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'enterprises/{enterpriseId}/storeLayout/pages/{pageId}', options)
          command.request_representation = Google::Apis::AndroidenterpriseV1::StorePage::Representation
          command.request_object = store_page_object
          command.response_representation = Google::Apis::AndroidenterpriseV1::StorePage::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::StorePage
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['pageId'] = page_id unless page_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the content of a store page.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] page_id
        #   The ID of the page.
        # @param [Google::Apis::AndroidenterpriseV1::StorePage] store_page_object
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::StorePage] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::StorePage]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_storelayoutpage(enterprise_id, page_id, store_page_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'enterprises/{enterpriseId}/storeLayout/pages/{pageId}', options)
          command.request_representation = Google::Apis::AndroidenterpriseV1::StorePage::Representation
          command.request_object = store_page_object
          command.response_representation = Google::Apis::AndroidenterpriseV1::StorePage::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::StorePage
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['pageId'] = page_id unless page_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deleted an EMM-managed user.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_user(enterprise_id, user_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'enterprises/{enterpriseId}/users/{userId}', options)
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Generates an authentication token which the device policy client can use to
        # provision the given EMM-managed user account on a device. The generated token
        # is single-use and expires after a few minutes.
        # You can provision a maximum of 10 devices per user.
        # This call only works with EMM-managed accounts.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::AuthenticationToken] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::AuthenticationToken]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def generate_user_authentication_token(enterprise_id, user_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'enterprises/{enterpriseId}/users/{userId}/authenticationToken', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::AuthenticationToken::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::AuthenticationToken
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Generates a token (activation code) to allow this user to configure their
        # managed account in the Android Setup Wizard. Revokes any previously generated
        # token.
        # This call only works with Google managed accounts.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::UserToken] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::UserToken]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def generate_user_token(enterprise_id, user_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'enterprises/{enterpriseId}/users/{userId}/token', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::UserToken::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::UserToken
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a user's details.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::User] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::User]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_user(enterprise_id, user_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'enterprises/{enterpriseId}/users/{userId}', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::User::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::User
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the set of products a user is entitled to access.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::ProductSet] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::ProductSet]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_user_available_product_set(enterprise_id, user_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'enterprises/{enterpriseId}/users/{userId}/availableProductSet', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::ProductSet::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::ProductSet
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new EMM-managed user.
        # The Users resource passed in the body of the request should include an
        # accountIdentifier and an accountType.
        # If a corresponding user already exists with the same account identifier, the
        # user will be updated with the resource. In this case only the displayName
        # field can be changed.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [Google::Apis::AndroidenterpriseV1::User] user_object
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::User] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::User]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_user(enterprise_id, user_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'enterprises/{enterpriseId}/users', options)
          command.request_representation = Google::Apis::AndroidenterpriseV1::User::Representation
          command.request_object = user_object
          command.response_representation = Google::Apis::AndroidenterpriseV1::User::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::User
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Looks up a user by primary email address. This is only supported for Google-
        # managed users. Lookup of the id is not needed for EMM-managed users because
        # the id is already returned in the result of the Users.insert call.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] email
        #   The exact primary email address of the user to look up.
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::ListUsersResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::ListUsersResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_users(enterprise_id, email, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'enterprises/{enterpriseId}/users', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::ListUsersResponse::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::ListUsersResponse
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.query['email'] = email unless email.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the details of an EMM-managed user.
        # Can be used with EMM-managed users only (not Google managed users). Pass the
        # new details in the Users resource in the request body. Only the displayName
        # field can be changed. Other fields must either be unset or have the currently
        # active value. This method supports patch semantics.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
        # @param [Google::Apis::AndroidenterpriseV1::User] user_object
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::User] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::User]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_user(enterprise_id, user_id, user_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'enterprises/{enterpriseId}/users/{userId}', options)
          command.request_representation = Google::Apis::AndroidenterpriseV1::User::Representation
          command.request_object = user_object
          command.response_representation = Google::Apis::AndroidenterpriseV1::User::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::User
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Revokes access to all devices currently provisioned to the user. The user will
        # no longer be able to use the managed Play store on any of their managed
        # devices.
        # This call only works with EMM-managed accounts.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def revoke_user_device_access(enterprise_id, user_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'enterprises/{enterpriseId}/users/{userId}/deviceAccess', options)
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Revokes a previously generated token (activation code) for the user.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def revoke_user_token(enterprise_id, user_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'enterprises/{enterpriseId}/users/{userId}/token', options)
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Modifies the set of products that a user is entitled to access (referred to as
        # whitelisted products). Only products that are approved or products that were
        # previously approved (products with revoked approval) can be whitelisted.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
        # @param [Google::Apis::AndroidenterpriseV1::ProductSet] product_set_object
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::ProductSet] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::ProductSet]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def set_user_available_product_set(enterprise_id, user_id, product_set_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'enterprises/{enterpriseId}/users/{userId}/availableProductSet', options)
          command.request_representation = Google::Apis::AndroidenterpriseV1::ProductSet::Representation
          command.request_object = product_set_object
          command.response_representation = Google::Apis::AndroidenterpriseV1::ProductSet::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::ProductSet
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the details of an EMM-managed user.
        # Can be used with EMM-managed users only (not Google managed users). Pass the
        # new details in the Users resource in the request body. Only the displayName
        # field can be changed. Other fields must either be unset or have the currently
        # active value.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] user_id
        #   The ID of the user.
        # @param [Google::Apis::AndroidenterpriseV1::User] user_object
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::User] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::User]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_user(enterprise_id, user_id, user_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'enterprises/{enterpriseId}/users/{userId}', options)
          command.request_representation = Google::Apis::AndroidenterpriseV1::User::Representation
          command.request_object = user_object
          command.response_representation = Google::Apis::AndroidenterpriseV1::User::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::User
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes an existing web app.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] web_app_id
        #   The ID of the web app.
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_webapp(enterprise_id, web_app_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'enterprises/{enterpriseId}/webApps/{webAppId}', options)
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['webAppId'] = web_app_id unless web_app_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets an existing web app.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] web_app_id
        #   The ID of the web app.
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::WebApp] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::WebApp]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_webapp(enterprise_id, web_app_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'enterprises/{enterpriseId}/webApps/{webAppId}', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::WebApp::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::WebApp
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['webAppId'] = web_app_id unless web_app_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new web app for the enterprise.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [Google::Apis::AndroidenterpriseV1::WebApp] web_app_object
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::WebApp] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::WebApp]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_webapp(enterprise_id, web_app_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'enterprises/{enterpriseId}/webApps', options)
          command.request_representation = Google::Apis::AndroidenterpriseV1::WebApp::Representation
          command.request_object = web_app_object
          command.response_representation = Google::Apis::AndroidenterpriseV1::WebApp::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::WebApp
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the details of all web apps for a given enterprise.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::WebAppsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::WebAppsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_webapps(enterprise_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'enterprises/{enterpriseId}/webApps', options)
          command.response_representation = Google::Apis::AndroidenterpriseV1::WebAppsListResponse::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::WebAppsListResponse
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing web app. This method supports patch semantics.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] web_app_id
        #   The ID of the web app.
        # @param [Google::Apis::AndroidenterpriseV1::WebApp] web_app_object
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::WebApp] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::WebApp]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_webapp(enterprise_id, web_app_id, web_app_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'enterprises/{enterpriseId}/webApps/{webAppId}', options)
          command.request_representation = Google::Apis::AndroidenterpriseV1::WebApp::Representation
          command.request_object = web_app_object
          command.response_representation = Google::Apis::AndroidenterpriseV1::WebApp::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::WebApp
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['webAppId'] = web_app_id unless web_app_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing web app.
        # @param [String] enterprise_id
        #   The ID of the enterprise.
        # @param [String] web_app_id
        #   The ID of the web app.
        # @param [Google::Apis::AndroidenterpriseV1::WebApp] web_app_object
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
        # @yieldparam result [Google::Apis::AndroidenterpriseV1::WebApp] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroidenterpriseV1::WebApp]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_webapp(enterprise_id, web_app_id, web_app_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'enterprises/{enterpriseId}/webApps/{webAppId}', options)
          command.request_representation = Google::Apis::AndroidenterpriseV1::WebApp::Representation
          command.request_object = web_app_object
          command.response_representation = Google::Apis::AndroidenterpriseV1::WebApp::Representation
          command.response_class = Google::Apis::AndroidenterpriseV1::WebApp
          command.params['enterpriseId'] = enterprise_id unless enterprise_id.nil?
          command.params['webAppId'] = web_app_id unless web_app_id.nil?
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
