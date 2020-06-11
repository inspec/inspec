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
    module CloudiotV1
      # Cloud IoT API
      #
      # Registers and manages IoT (Internet of Things) devices that connect to the
      #  Google Cloud Platform.
      #
      # @example
      #    require 'google/apis/cloudiot_v1'
      #
      #    Cloudiot = Google::Apis::CloudiotV1 # Alias the module
      #    service = Cloudiot::CloudIotService.new
      #
      # @see https://cloud.google.com/iot
      class CloudIotService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://cloudiot.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Associates the device with the gateway.
        # @param [String] parent
        #   Required. The name of the registry. For example,
        #   `projects/example-project/locations/us-central1/registries/my-registry`.
        # @param [Google::Apis::CloudiotV1::BindDeviceToGatewayRequest] bind_device_to_gateway_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudiotV1::BindDeviceToGatewayResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudiotV1::BindDeviceToGatewayResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def bind_registry_device_to_gateway(parent, bind_device_to_gateway_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}:bindDeviceToGateway', options)
          command.request_representation = Google::Apis::CloudiotV1::BindDeviceToGatewayRequest::Representation
          command.request_object = bind_device_to_gateway_request_object
          command.response_representation = Google::Apis::CloudiotV1::BindDeviceToGatewayResponse::Representation
          command.response_class = Google::Apis::CloudiotV1::BindDeviceToGatewayResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a device registry that contains devices.
        # @param [String] parent
        #   Required. The project and cloud region where this device registry must be
        #   created.
        #   For example, `projects/example-project/locations/us-central1`.
        # @param [Google::Apis::CloudiotV1::DeviceRegistry] device_registry_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudiotV1::DeviceRegistry] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudiotV1::DeviceRegistry]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_location_registry(parent, device_registry_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}/registries', options)
          command.request_representation = Google::Apis::CloudiotV1::DeviceRegistry::Representation
          command.request_object = device_registry_object
          command.response_representation = Google::Apis::CloudiotV1::DeviceRegistry::Representation
          command.response_class = Google::Apis::CloudiotV1::DeviceRegistry
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a device registry configuration.
        # @param [String] name
        #   Required. The name of the device registry. For example,
        #   `projects/example-project/locations/us-central1/registries/my-registry`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudiotV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudiotV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_location_registry(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/{+name}', options)
          command.response_representation = Google::Apis::CloudiotV1::Empty::Representation
          command.response_class = Google::Apis::CloudiotV1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a device registry configuration.
        # @param [String] name
        #   Required. The name of the device registry. For example,
        #   `projects/example-project/locations/us-central1/registries/my-registry`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudiotV1::DeviceRegistry] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudiotV1::DeviceRegistry]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_registry(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::CloudiotV1::DeviceRegistry::Representation
          command.response_class = Google::Apis::CloudiotV1::DeviceRegistry
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
        # @param [Google::Apis::CloudiotV1::GetIamPolicyRequest] get_iam_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudiotV1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudiotV1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_registry_iam_policy(resource, get_iam_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+resource}:getIamPolicy', options)
          command.request_representation = Google::Apis::CloudiotV1::GetIamPolicyRequest::Representation
          command.request_object = get_iam_policy_request_object
          command.response_representation = Google::Apis::CloudiotV1::Policy::Representation
          command.response_class = Google::Apis::CloudiotV1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists device registries.
        # @param [String] parent
        #   Required. The project and cloud region path. For example,
        #   `projects/example-project/locations/us-central1`.
        # @param [Fixnum] page_size
        #   The maximum number of registries to return in the response. If this value
        #   is zero, the service will select a default size. A call may return fewer
        #   objects than requested. A non-empty `next_page_token` in the response
        #   indicates that more data is available.
        # @param [String] page_token
        #   The value returned by the last `ListDeviceRegistriesResponse`; indicates
        #   that this is a continuation of a prior `ListDeviceRegistries` call and
        #   the system should return the next page of data.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudiotV1::ListDeviceRegistriesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudiotV1::ListDeviceRegistriesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_registries(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+parent}/registries', options)
          command.response_representation = Google::Apis::CloudiotV1::ListDeviceRegistriesResponse::Representation
          command.response_class = Google::Apis::CloudiotV1::ListDeviceRegistriesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a device registry configuration.
        # @param [String] name
        #   The resource path name. For example,
        #   `projects/example-project/locations/us-central1/registries/my-registry`.
        # @param [Google::Apis::CloudiotV1::DeviceRegistry] device_registry_object
        # @param [String] update_mask
        #   Required. Only updates the `device_registry` fields indicated by this mask.
        #   The field mask must not be empty, and it must not contain fields that
        #   are immutable or only set by the server.
        #   Mutable top-level fields: `event_notification_config`, `http_config`,
        #   `mqtt_config`, and `state_notification_config`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudiotV1::DeviceRegistry] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudiotV1::DeviceRegistry]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_location_registry(name, device_registry_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/{+name}', options)
          command.request_representation = Google::Apis::CloudiotV1::DeviceRegistry::Representation
          command.request_object = device_registry_object
          command.response_representation = Google::Apis::CloudiotV1::DeviceRegistry::Representation
          command.response_class = Google::Apis::CloudiotV1::DeviceRegistry
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets the access control policy on the specified resource. Replaces any
        # existing policy.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being specified.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::CloudiotV1::SetIamPolicyRequest] set_iam_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudiotV1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudiotV1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def set_registry_iam_policy(resource, set_iam_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+resource}:setIamPolicy', options)
          command.request_representation = Google::Apis::CloudiotV1::SetIamPolicyRequest::Representation
          command.request_object = set_iam_policy_request_object
          command.response_representation = Google::Apis::CloudiotV1::Policy::Representation
          command.response_class = Google::Apis::CloudiotV1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns permissions that a caller has on the specified resource.
        # If the resource does not exist, this will return an empty set of
        # permissions, not a NOT_FOUND error.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy detail is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::CloudiotV1::TestIamPermissionsRequest] test_iam_permissions_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudiotV1::TestIamPermissionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudiotV1::TestIamPermissionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def test_registry_iam_permissions(resource, test_iam_permissions_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+resource}:testIamPermissions', options)
          command.request_representation = Google::Apis::CloudiotV1::TestIamPermissionsRequest::Representation
          command.request_object = test_iam_permissions_request_object
          command.response_representation = Google::Apis::CloudiotV1::TestIamPermissionsResponse::Representation
          command.response_class = Google::Apis::CloudiotV1::TestIamPermissionsResponse
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the association between the device and the gateway.
        # @param [String] parent
        #   Required. The name of the registry. For example,
        #   `projects/example-project/locations/us-central1/registries/my-registry`.
        # @param [Google::Apis::CloudiotV1::UnbindDeviceFromGatewayRequest] unbind_device_from_gateway_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudiotV1::UnbindDeviceFromGatewayResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudiotV1::UnbindDeviceFromGatewayResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def unbind_registry_device_from_gateway(parent, unbind_device_from_gateway_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}:unbindDeviceFromGateway', options)
          command.request_representation = Google::Apis::CloudiotV1::UnbindDeviceFromGatewayRequest::Representation
          command.request_object = unbind_device_from_gateway_request_object
          command.response_representation = Google::Apis::CloudiotV1::UnbindDeviceFromGatewayResponse::Representation
          command.response_class = Google::Apis::CloudiotV1::UnbindDeviceFromGatewayResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a device in a device registry.
        # @param [String] parent
        #   Required. The name of the device registry where this device should be created.
        #   For example,
        #   `projects/example-project/locations/us-central1/registries/my-registry`.
        # @param [Google::Apis::CloudiotV1::Device] device_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudiotV1::Device] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudiotV1::Device]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_location_registry_device(parent, device_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}/devices', options)
          command.request_representation = Google::Apis::CloudiotV1::Device::Representation
          command.request_object = device_object
          command.response_representation = Google::Apis::CloudiotV1::Device::Representation
          command.response_class = Google::Apis::CloudiotV1::Device
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a device.
        # @param [String] name
        #   Required. The name of the device. For example,
        #   `projects/p0/locations/us-central1/registries/registry0/devices/device0` or
        #   `projects/p0/locations/us-central1/registries/registry0/devices/`num_id``.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudiotV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudiotV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_location_registry_device(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/{+name}', options)
          command.response_representation = Google::Apis::CloudiotV1::Empty::Representation
          command.response_class = Google::Apis::CloudiotV1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets details about a device.
        # @param [String] name
        #   Required. The name of the device. For example,
        #   `projects/p0/locations/us-central1/registries/registry0/devices/device0` or
        #   `projects/p0/locations/us-central1/registries/registry0/devices/`num_id``.
        # @param [String] field_mask
        #   The fields of the `Device` resource to be returned in the response. If the
        #   field mask is unset or empty, all fields are returned.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudiotV1::Device] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudiotV1::Device]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_registry_device(name, field_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::CloudiotV1::Device::Representation
          command.response_class = Google::Apis::CloudiotV1::Device
          command.params['name'] = name unless name.nil?
          command.query['fieldMask'] = field_mask unless field_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List devices in a device registry.
        # @param [String] parent
        #   Required. The device registry path. Required. For example,
        #   `projects/my-project/locations/us-central1/registries/my-registry`.
        # @param [Array<String>, String] device_ids
        #   A list of device string IDs. For example, `['device0', 'device12']`.
        #   If empty, this field is ignored. Maximum IDs: 10,000
        # @param [Array<Fixnum>, Fixnum] device_num_ids
        #   A list of device numeric IDs. If empty, this field is ignored. Maximum
        #   IDs: 10,000.
        # @param [String] field_mask
        #   The fields of the `Device` resource to be returned in the response. The
        #   fields `id` and `num_id` are always returned, along with any
        #   other fields specified.
        # @param [String] gateway_list_options_associations_device_id
        #   If set, returns only the gateways with which the specified device is
        #   associated. The device ID can be numeric (`num_id`) or the user-defined
        #   string (`id`). For example, if `456` is specified, returns only the
        #   gateways to which the device with `num_id` 456 is bound.
        # @param [String] gateway_list_options_associations_gateway_id
        #   If set, only devices associated with the specified gateway are returned.
        #   The gateway ID can be numeric (`num_id`) or the user-defined string
        #   (`id`). For example, if `123` is specified, only devices bound to the
        #   gateway with `num_id` 123 are returned.
        # @param [String] gateway_list_options_gateway_type
        #   If `GATEWAY` is specified, only gateways are returned. If `NON_GATEWAY`
        #   is specified, only non-gateway devices are returned. If
        #   `GATEWAY_TYPE_UNSPECIFIED` is specified, all devices are returned.
        # @param [Fixnum] page_size
        #   The maximum number of devices to return in the response. If this value
        #   is zero, the service will select a default size. A call may return fewer
        #   objects than requested. A non-empty `next_page_token` in the response
        #   indicates that more data is available.
        # @param [String] page_token
        #   The value returned by the last `ListDevicesResponse`; indicates
        #   that this is a continuation of a prior `ListDevices` call and
        #   the system should return the next page of data.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudiotV1::ListDevicesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudiotV1::ListDevicesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_registry_devices(parent, device_ids: nil, device_num_ids: nil, field_mask: nil, gateway_list_options_associations_device_id: nil, gateway_list_options_associations_gateway_id: nil, gateway_list_options_gateway_type: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+parent}/devices', options)
          command.response_representation = Google::Apis::CloudiotV1::ListDevicesResponse::Representation
          command.response_class = Google::Apis::CloudiotV1::ListDevicesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['deviceIds'] = device_ids unless device_ids.nil?
          command.query['deviceNumIds'] = device_num_ids unless device_num_ids.nil?
          command.query['fieldMask'] = field_mask unless field_mask.nil?
          command.query['gatewayListOptions.associationsDeviceId'] = gateway_list_options_associations_device_id unless gateway_list_options_associations_device_id.nil?
          command.query['gatewayListOptions.associationsGatewayId'] = gateway_list_options_associations_gateway_id unless gateway_list_options_associations_gateway_id.nil?
          command.query['gatewayListOptions.gatewayType'] = gateway_list_options_gateway_type unless gateway_list_options_gateway_type.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Modifies the configuration for the device, which is eventually sent from
        # the Cloud IoT Core servers. Returns the modified configuration version and
        # its metadata.
        # @param [String] name
        #   Required. The name of the device. For example,
        #   `projects/p0/locations/us-central1/registries/registry0/devices/device0` or
        #   `projects/p0/locations/us-central1/registries/registry0/devices/`num_id``.
        # @param [Google::Apis::CloudiotV1::ModifyCloudToDeviceConfigRequest] modify_cloud_to_device_config_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudiotV1::DeviceConfig] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudiotV1::DeviceConfig]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def modify_cloud_to_device_config(name, modify_cloud_to_device_config_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+name}:modifyCloudToDeviceConfig', options)
          command.request_representation = Google::Apis::CloudiotV1::ModifyCloudToDeviceConfigRequest::Representation
          command.request_object = modify_cloud_to_device_config_request_object
          command.response_representation = Google::Apis::CloudiotV1::DeviceConfig::Representation
          command.response_class = Google::Apis::CloudiotV1::DeviceConfig
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a device.
        # @param [String] name
        #   The resource path name. For example,
        #   `projects/p1/locations/us-central1/registries/registry0/devices/dev0` or
        #   `projects/p1/locations/us-central1/registries/registry0/devices/`num_id``.
        #   When `name` is populated as a response from the service, it always ends
        #   in the device numeric ID.
        # @param [Google::Apis::CloudiotV1::Device] device_object
        # @param [String] update_mask
        #   Required. Only updates the `device` fields indicated by this mask.
        #   The field mask must not be empty, and it must not contain fields that
        #   are immutable or only set by the server.
        #   Mutable top-level fields: `credentials`, `blocked`, and `metadata`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudiotV1::Device] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudiotV1::Device]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_location_registry_device(name, device_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/{+name}', options)
          command.request_representation = Google::Apis::CloudiotV1::Device::Representation
          command.request_object = device_object
          command.response_representation = Google::Apis::CloudiotV1::Device::Representation
          command.response_class = Google::Apis::CloudiotV1::Device
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sends a command to the specified device. In order for a device to be able
        # to receive commands, it must:
        # 1) be connected to Cloud IoT Core using the MQTT protocol, and
        # 2) be subscribed to the group of MQTT topics specified by
        # /devices/`device-id`/commands/#. This subscription will receive commands
        # at the top-level topic /devices/`device-id`/commands as well as commands
        # for subfolders, like /devices/`device-id`/commands/subfolder.
        # Note that subscribing to specific subfolders is not supported.
        # If the command could not be delivered to the device, this method will
        # return an error; in particular, if the device is not subscribed, this
        # method will return FAILED_PRECONDITION. Otherwise, this method will
        # return OK. If the subscription is QoS 1, at least once delivery will be
        # guaranteed; for QoS 0, no acknowledgment will be expected from the device.
        # @param [String] name
        #   Required. The name of the device. For example,
        #   `projects/p0/locations/us-central1/registries/registry0/devices/device0` or
        #   `projects/p0/locations/us-central1/registries/registry0/devices/`num_id``.
        # @param [Google::Apis::CloudiotV1::SendCommandToDeviceRequest] send_command_to_device_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudiotV1::SendCommandToDeviceResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudiotV1::SendCommandToDeviceResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def send_project_location_registry_device_command_to_device(name, send_command_to_device_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+name}:sendCommandToDevice', options)
          command.request_representation = Google::Apis::CloudiotV1::SendCommandToDeviceRequest::Representation
          command.request_object = send_command_to_device_request_object
          command.response_representation = Google::Apis::CloudiotV1::SendCommandToDeviceResponse::Representation
          command.response_class = Google::Apis::CloudiotV1::SendCommandToDeviceResponse
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the last few versions of the device configuration in descending
        # order (i.e.: newest first).
        # @param [String] name
        #   Required. The name of the device. For example,
        #   `projects/p0/locations/us-central1/registries/registry0/devices/device0` or
        #   `projects/p0/locations/us-central1/registries/registry0/devices/`num_id``.
        # @param [Fixnum] num_versions
        #   The number of versions to list. Versions are listed in decreasing order of
        #   the version number. The maximum number of versions retained is 10. If this
        #   value is zero, it will return all the versions available.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudiotV1::ListDeviceConfigVersionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudiotV1::ListDeviceConfigVersionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_registry_device_config_versions(name, num_versions: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}/configVersions', options)
          command.response_representation = Google::Apis::CloudiotV1::ListDeviceConfigVersionsResponse::Representation
          command.response_class = Google::Apis::CloudiotV1::ListDeviceConfigVersionsResponse
          command.params['name'] = name unless name.nil?
          command.query['numVersions'] = num_versions unless num_versions.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the last few versions of the device state in descending order (i.e.:
        # newest first).
        # @param [String] name
        #   Required. The name of the device. For example,
        #   `projects/p0/locations/us-central1/registries/registry0/devices/device0` or
        #   `projects/p0/locations/us-central1/registries/registry0/devices/`num_id``.
        # @param [Fixnum] num_states
        #   The number of states to list. States are listed in descending order of
        #   update time. The maximum number of states retained is 10. If this
        #   value is zero, it will return all the states available.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudiotV1::ListDeviceStatesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudiotV1::ListDeviceStatesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_registry_device_states(name, num_states: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}/states', options)
          command.response_representation = Google::Apis::CloudiotV1::ListDeviceStatesResponse::Representation
          command.response_class = Google::Apis::CloudiotV1::ListDeviceStatesResponse
          command.params['name'] = name unless name.nil?
          command.query['numStates'] = num_states unless num_states.nil?
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
        # @param [Google::Apis::CloudiotV1::GetIamPolicyRequest] get_iam_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudiotV1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudiotV1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_group_iam_policy(resource, get_iam_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+resource}:getIamPolicy', options)
          command.request_representation = Google::Apis::CloudiotV1::GetIamPolicyRequest::Representation
          command.request_object = get_iam_policy_request_object
          command.response_representation = Google::Apis::CloudiotV1::Policy::Representation
          command.response_class = Google::Apis::CloudiotV1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets the access control policy on the specified resource. Replaces any
        # existing policy.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being specified.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::CloudiotV1::SetIamPolicyRequest] set_iam_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudiotV1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudiotV1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def set_group_iam_policy(resource, set_iam_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+resource}:setIamPolicy', options)
          command.request_representation = Google::Apis::CloudiotV1::SetIamPolicyRequest::Representation
          command.request_object = set_iam_policy_request_object
          command.response_representation = Google::Apis::CloudiotV1::Policy::Representation
          command.response_class = Google::Apis::CloudiotV1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns permissions that a caller has on the specified resource.
        # If the resource does not exist, this will return an empty set of
        # permissions, not a NOT_FOUND error.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy detail is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::CloudiotV1::TestIamPermissionsRequest] test_iam_permissions_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudiotV1::TestIamPermissionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudiotV1::TestIamPermissionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def test_group_iam_permissions(resource, test_iam_permissions_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+resource}:testIamPermissions', options)
          command.request_representation = Google::Apis::CloudiotV1::TestIamPermissionsRequest::Representation
          command.request_object = test_iam_permissions_request_object
          command.response_representation = Google::Apis::CloudiotV1::TestIamPermissionsResponse::Representation
          command.response_class = Google::Apis::CloudiotV1::TestIamPermissionsResponse
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List devices in a device registry.
        # @param [String] parent
        #   Required. The device registry path. Required. For example,
        #   `projects/my-project/locations/us-central1/registries/my-registry`.
        # @param [Array<String>, String] device_ids
        #   A list of device string IDs. For example, `['device0', 'device12']`.
        #   If empty, this field is ignored. Maximum IDs: 10,000
        # @param [Array<Fixnum>, Fixnum] device_num_ids
        #   A list of device numeric IDs. If empty, this field is ignored. Maximum
        #   IDs: 10,000.
        # @param [String] field_mask
        #   The fields of the `Device` resource to be returned in the response. The
        #   fields `id` and `num_id` are always returned, along with any
        #   other fields specified.
        # @param [String] gateway_list_options_associations_device_id
        #   If set, returns only the gateways with which the specified device is
        #   associated. The device ID can be numeric (`num_id`) or the user-defined
        #   string (`id`). For example, if `456` is specified, returns only the
        #   gateways to which the device with `num_id` 456 is bound.
        # @param [String] gateway_list_options_associations_gateway_id
        #   If set, only devices associated with the specified gateway are returned.
        #   The gateway ID can be numeric (`num_id`) or the user-defined string
        #   (`id`). For example, if `123` is specified, only devices bound to the
        #   gateway with `num_id` 123 are returned.
        # @param [String] gateway_list_options_gateway_type
        #   If `GATEWAY` is specified, only gateways are returned. If `NON_GATEWAY`
        #   is specified, only non-gateway devices are returned. If
        #   `GATEWAY_TYPE_UNSPECIFIED` is specified, all devices are returned.
        # @param [Fixnum] page_size
        #   The maximum number of devices to return in the response. If this value
        #   is zero, the service will select a default size. A call may return fewer
        #   objects than requested. A non-empty `next_page_token` in the response
        #   indicates that more data is available.
        # @param [String] page_token
        #   The value returned by the last `ListDevicesResponse`; indicates
        #   that this is a continuation of a prior `ListDevices` call and
        #   the system should return the next page of data.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudiotV1::ListDevicesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudiotV1::ListDevicesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_registry_group_devices(parent, device_ids: nil, device_num_ids: nil, field_mask: nil, gateway_list_options_associations_device_id: nil, gateway_list_options_associations_gateway_id: nil, gateway_list_options_gateway_type: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+parent}/devices', options)
          command.response_representation = Google::Apis::CloudiotV1::ListDevicesResponse::Representation
          command.response_class = Google::Apis::CloudiotV1::ListDevicesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['deviceIds'] = device_ids unless device_ids.nil?
          command.query['deviceNumIds'] = device_num_ids unless device_num_ids.nil?
          command.query['fieldMask'] = field_mask unless field_mask.nil?
          command.query['gatewayListOptions.associationsDeviceId'] = gateway_list_options_associations_device_id unless gateway_list_options_associations_device_id.nil?
          command.query['gatewayListOptions.associationsGatewayId'] = gateway_list_options_associations_gateway_id unless gateway_list_options_associations_gateway_id.nil?
          command.query['gatewayListOptions.gatewayType'] = gateway_list_options_gateway_type unless gateway_list_options_gateway_type.nil?
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
