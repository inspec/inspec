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
    module AndroiddeviceprovisioningV1
      # Android Device Provisioning Partner API
      #
      # Automates Android zero-touch enrollment for device resellers, customers, and
      #  EMMs.
      #
      # @example
      #    require 'google/apis/androiddeviceprovisioning_v1'
      #
      #    Androiddeviceprovisioning = Google::Apis::AndroiddeviceprovisioningV1 # Alias the module
      #    service = Androiddeviceprovisioning::AndroidProvisioningPartnerService.new
      #
      # @see https://developers.google.com/zero-touch/
      class AndroidProvisioningPartnerService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://androiddeviceprovisioning.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Lists the user's customer accounts.
        # @param [Fixnum] page_size
        #   The maximum number of customers to show in a page of results.
        #   A number between 1 and 100 (inclusive).
        # @param [String] page_token
        #   A token specifying which result page to return.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AndroiddeviceprovisioningV1::CustomerListCustomersResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroiddeviceprovisioningV1::CustomerListCustomersResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_customers(page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/customers', options)
          command.response_representation = Google::Apis::AndroiddeviceprovisioningV1::CustomerListCustomersResponse::Representation
          command.response_class = Google::Apis::AndroiddeviceprovisioningV1::CustomerListCustomersResponse
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new configuration. Once created, a customer can apply the
        # configuration to devices.
        # @param [String] parent
        #   Required. The customer that manages the configuration. An API resource name
        #   in the format `customers/[CUSTOMER_ID]`.
        # @param [Google::Apis::AndroiddeviceprovisioningV1::Configuration] configuration_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AndroiddeviceprovisioningV1::Configuration] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroiddeviceprovisioningV1::Configuration]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_customer_configuration(parent, configuration_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}/configurations', options)
          command.request_representation = Google::Apis::AndroiddeviceprovisioningV1::Configuration::Representation
          command.request_object = configuration_object
          command.response_representation = Google::Apis::AndroiddeviceprovisioningV1::Configuration::Representation
          command.response_class = Google::Apis::AndroiddeviceprovisioningV1::Configuration
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes an unused configuration. The API call fails if the customer has
        # devices with the configuration applied.
        # @param [String] name
        #   Required. The configuration to delete. An API resource name in the format
        #   `customers/[CUSTOMER_ID]/configurations/[CONFIGURATION_ID]`. If the
        #   configuration is applied to any devices, the API call fails.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AndroiddeviceprovisioningV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroiddeviceprovisioningV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_customer_configuration(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/{+name}', options)
          command.response_representation = Google::Apis::AndroiddeviceprovisioningV1::Empty::Representation
          command.response_class = Google::Apis::AndroiddeviceprovisioningV1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the details of a configuration.
        # @param [String] name
        #   Required. The configuration to get. An API resource name in the format
        #   `customers/[CUSTOMER_ID]/configurations/[CONFIGURATION_ID]`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AndroiddeviceprovisioningV1::Configuration] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroiddeviceprovisioningV1::Configuration]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_customer_configuration(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::AndroiddeviceprovisioningV1::Configuration::Representation
          command.response_class = Google::Apis::AndroiddeviceprovisioningV1::Configuration
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists a customer's configurations.
        # @param [String] parent
        #   Required. The customer that manages the listed configurations. An API
        #   resource name in the format `customers/[CUSTOMER_ID]`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AndroiddeviceprovisioningV1::CustomerListConfigurationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroiddeviceprovisioningV1::CustomerListConfigurationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_customer_configurations(parent, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+parent}/configurations', options)
          command.response_representation = Google::Apis::AndroiddeviceprovisioningV1::CustomerListConfigurationsResponse::Representation
          command.response_class = Google::Apis::AndroiddeviceprovisioningV1::CustomerListConfigurationsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a configuration's field values.
        # @param [String] name
        #   Output only. The API resource name in the format
        #   `customers/[CUSTOMER_ID]/configurations/[CONFIGURATION_ID]`. Assigned by
        #   the server.
        # @param [Google::Apis::AndroiddeviceprovisioningV1::Configuration] configuration_object
        # @param [String] update_mask
        #   Required. The field mask applied to the target `Configuration` before
        #   updating the fields. To learn more about using field masks, read
        #   [FieldMask](/protocol-buffers/docs/reference/google.protobuf#fieldmask) in
        #   the Protocol Buffers documentation.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AndroiddeviceprovisioningV1::Configuration] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroiddeviceprovisioningV1::Configuration]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_customer_configuration(name, configuration_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/{+name}', options)
          command.request_representation = Google::Apis::AndroiddeviceprovisioningV1::Configuration::Representation
          command.request_object = configuration_object
          command.response_representation = Google::Apis::AndroiddeviceprovisioningV1::Configuration::Representation
          command.response_class = Google::Apis::AndroiddeviceprovisioningV1::Configuration
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Applies a Configuration to the device to register the device for zero-touch
        # enrollment. After applying a configuration to a device, the device
        # automatically provisions itself on first boot, or next factory reset.
        # @param [String] parent
        #   Required. The customer managing the device. An API resource name in the
        #   format `customers/[CUSTOMER_ID]`.
        # @param [Google::Apis::AndroiddeviceprovisioningV1::CustomerApplyConfigurationRequest] customer_apply_configuration_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AndroiddeviceprovisioningV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroiddeviceprovisioningV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def apply_customer_device_configuration(parent, customer_apply_configuration_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}/devices:applyConfiguration', options)
          command.request_representation = Google::Apis::AndroiddeviceprovisioningV1::CustomerApplyConfigurationRequest::Representation
          command.request_object = customer_apply_configuration_request_object
          command.response_representation = Google::Apis::AndroiddeviceprovisioningV1::Empty::Representation
          command.response_class = Google::Apis::AndroiddeviceprovisioningV1::Empty
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the details of a device.
        # @param [String] name
        #   Required. The device to get. An API resource name in the format
        #   `customers/[CUSTOMER_ID]/devices/[DEVICE_ID]`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AndroiddeviceprovisioningV1::Device] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroiddeviceprovisioningV1::Device]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_customer_device(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::AndroiddeviceprovisioningV1::Device::Representation
          command.response_class = Google::Apis::AndroiddeviceprovisioningV1::Device
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists a customer's devices.
        # @param [String] parent
        #   Required. The customer managing the devices. An API resource name in the
        #   format `customers/[CUSTOMER_ID]`.
        # @param [Fixnum] page_size
        #   The maximum number of devices to show in a page of results.
        #   Must be between 1 and 100 inclusive.
        # @param [String] page_token
        #   A token specifying which result page to return.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AndroiddeviceprovisioningV1::CustomerListDevicesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroiddeviceprovisioningV1::CustomerListDevicesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_customer_devices(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+parent}/devices', options)
          command.response_representation = Google::Apis::AndroiddeviceprovisioningV1::CustomerListDevicesResponse::Representation
          command.response_class = Google::Apis::AndroiddeviceprovisioningV1::CustomerListDevicesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Removes a configuration from device.
        # @param [String] parent
        #   Required. The customer managing the device in the format
        #   `customers/[CUSTOMER_ID]`.
        # @param [Google::Apis::AndroiddeviceprovisioningV1::CustomerRemoveConfigurationRequest] customer_remove_configuration_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AndroiddeviceprovisioningV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroiddeviceprovisioningV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def remove_customer_device_configuration(parent, customer_remove_configuration_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}/devices:removeConfiguration', options)
          command.request_representation = Google::Apis::AndroiddeviceprovisioningV1::CustomerRemoveConfigurationRequest::Representation
          command.request_object = customer_remove_configuration_request_object
          command.response_representation = Google::Apis::AndroiddeviceprovisioningV1::Empty::Representation
          command.response_class = Google::Apis::AndroiddeviceprovisioningV1::Empty
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Unclaims a device from a customer and removes it from zero-touch
        # enrollment.
        # After removing a device, a customer must contact their reseller to register
        # the device into zero-touch enrollment again.
        # @param [String] parent
        #   Required. The customer managing the device. An API resource name in the
        #   format `customers/[CUSTOMER_ID]`.
        # @param [Google::Apis::AndroiddeviceprovisioningV1::CustomerUnclaimDeviceRequest] customer_unclaim_device_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AndroiddeviceprovisioningV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroiddeviceprovisioningV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def unclaim_customer_device(parent, customer_unclaim_device_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}/devices:unclaim', options)
          command.request_representation = Google::Apis::AndroiddeviceprovisioningV1::CustomerUnclaimDeviceRequest::Representation
          command.request_object = customer_unclaim_device_request_object
          command.response_representation = Google::Apis::AndroiddeviceprovisioningV1::Empty::Representation
          command.response_class = Google::Apis::AndroiddeviceprovisioningV1::Empty
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the DPCs (device policy controllers) that support zero-touch
        # enrollment.
        # @param [String] parent
        #   Required. The customer that can use the DPCs in configurations. An API
        #   resource name in the format `customers/[CUSTOMER_ID]`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AndroiddeviceprovisioningV1::CustomerListDpcsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroiddeviceprovisioningV1::CustomerListDpcsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_customer_dpcs(parent, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+parent}/dpcs', options)
          command.response_representation = Google::Apis::AndroiddeviceprovisioningV1::CustomerListDpcsResponse::Representation
          command.response_class = Google::Apis::AndroiddeviceprovisioningV1::CustomerListDpcsResponse
          command.params['parent'] = parent unless parent.nil?
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
        # @yieldparam result [Google::Apis::AndroiddeviceprovisioningV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroiddeviceprovisioningV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_operation(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::AndroiddeviceprovisioningV1::Operation::Representation
          command.response_class = Google::Apis::AndroiddeviceprovisioningV1::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a customer for zero-touch enrollment. After the method returns
        # successfully, admin and owner roles can manage devices and EMM configs
        # by calling API methods or using their zero-touch enrollment portal.
        # The customer receives an email that welcomes them to zero-touch enrollment
        # and explains how to sign into the portal.
        # @param [String] parent
        #   Required. The parent resource ID in the format `partners/[PARTNER_ID]` that
        #   identifies the reseller.
        # @param [Google::Apis::AndroiddeviceprovisioningV1::CreateCustomerRequest] create_customer_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AndroiddeviceprovisioningV1::Company] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroiddeviceprovisioningV1::Company]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_customer(parent, create_customer_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}/customers', options)
          command.request_representation = Google::Apis::AndroiddeviceprovisioningV1::CreateCustomerRequest::Representation
          command.request_object = create_customer_request_object
          command.response_representation = Google::Apis::AndroiddeviceprovisioningV1::Company::Representation
          command.response_class = Google::Apis::AndroiddeviceprovisioningV1::Company
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the customers that are enrolled to the reseller identified by the
        # `partnerId` argument. This list includes customers that the reseller
        # created and customers that enrolled themselves using the portal.
        # @param [Fixnum] partner_id
        #   Required. The ID of the reseller partner.
        # @param [Fixnum] page_size
        #   The maximum number of results to be returned. If not specified or 0, all
        #   the records are returned.
        # @param [String] page_token
        #   A token identifying a page of results returned by the server.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AndroiddeviceprovisioningV1::ListCustomersResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroiddeviceprovisioningV1::ListCustomersResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_partner_customers(partner_id, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/partners/{+partnerId}/customers', options)
          command.response_representation = Google::Apis::AndroiddeviceprovisioningV1::ListCustomersResponse::Representation
          command.response_class = Google::Apis::AndroiddeviceprovisioningV1::ListCustomersResponse
          command.params['partnerId'] = partner_id unless partner_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Claims a device for a customer and adds it to zero-touch enrollment. If the
        # device is already claimed by another customer, the call returns an error.
        # @param [Fixnum] partner_id
        #   Required. The ID of the reseller partner.
        # @param [Google::Apis::AndroiddeviceprovisioningV1::ClaimDeviceRequest] claim_device_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AndroiddeviceprovisioningV1::ClaimDeviceResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroiddeviceprovisioningV1::ClaimDeviceResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def claim_device(partner_id, claim_device_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/partners/{+partnerId}/devices:claim', options)
          command.request_representation = Google::Apis::AndroiddeviceprovisioningV1::ClaimDeviceRequest::Representation
          command.request_object = claim_device_request_object
          command.response_representation = Google::Apis::AndroiddeviceprovisioningV1::ClaimDeviceResponse::Representation
          command.response_class = Google::Apis::AndroiddeviceprovisioningV1::ClaimDeviceResponse
          command.params['partnerId'] = partner_id unless partner_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Claims a batch of devices for a customer asynchronously. Adds the devices
        # to zero-touch enrollment. To learn more, read [Long‑running batch
        # operations](/zero-touch/guides/how-it-works#operations).
        # @param [Fixnum] partner_id
        #   Required. The ID of the reseller partner.
        # @param [Google::Apis::AndroiddeviceprovisioningV1::ClaimDevicesRequest] claim_devices_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AndroiddeviceprovisioningV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroiddeviceprovisioningV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def claim_partner_device_async(partner_id, claim_devices_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/partners/{+partnerId}/devices:claimAsync', options)
          command.request_representation = Google::Apis::AndroiddeviceprovisioningV1::ClaimDevicesRequest::Representation
          command.request_object = claim_devices_request_object
          command.response_representation = Google::Apis::AndroiddeviceprovisioningV1::Operation::Representation
          command.response_class = Google::Apis::AndroiddeviceprovisioningV1::Operation
          command.params['partnerId'] = partner_id unless partner_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Finds devices by hardware identifiers, such as IMEI.
        # @param [Fixnum] partner_id
        #   Required. The ID of the reseller partner.
        # @param [Google::Apis::AndroiddeviceprovisioningV1::FindDevicesByDeviceIdentifierRequest] find_devices_by_device_identifier_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AndroiddeviceprovisioningV1::FindDevicesByDeviceIdentifierResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroiddeviceprovisioningV1::FindDevicesByDeviceIdentifierResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def find_partner_device_by_identifier(partner_id, find_devices_by_device_identifier_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/partners/{+partnerId}/devices:findByIdentifier', options)
          command.request_representation = Google::Apis::AndroiddeviceprovisioningV1::FindDevicesByDeviceIdentifierRequest::Representation
          command.request_object = find_devices_by_device_identifier_request_object
          command.response_representation = Google::Apis::AndroiddeviceprovisioningV1::FindDevicesByDeviceIdentifierResponse::Representation
          command.response_class = Google::Apis::AndroiddeviceprovisioningV1::FindDevicesByDeviceIdentifierResponse
          command.params['partnerId'] = partner_id unless partner_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Finds devices claimed for customers. The results only contain devices
        # registered to the reseller that's identified by the `partnerId` argument.
        # The customer's devices purchased from other resellers don't appear in the
        # results.
        # @param [Fixnum] partner_id
        #   Required. The ID of the reseller partner.
        # @param [Google::Apis::AndroiddeviceprovisioningV1::FindDevicesByOwnerRequest] find_devices_by_owner_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AndroiddeviceprovisioningV1::FindDevicesByOwnerResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroiddeviceprovisioningV1::FindDevicesByOwnerResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def find_partner_device_by_owner(partner_id, find_devices_by_owner_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/partners/{+partnerId}/devices:findByOwner', options)
          command.request_representation = Google::Apis::AndroiddeviceprovisioningV1::FindDevicesByOwnerRequest::Representation
          command.request_object = find_devices_by_owner_request_object
          command.response_representation = Google::Apis::AndroiddeviceprovisioningV1::FindDevicesByOwnerResponse::Representation
          command.response_class = Google::Apis::AndroiddeviceprovisioningV1::FindDevicesByOwnerResponse
          command.params['partnerId'] = partner_id unless partner_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a device.
        # @param [String] name
        #   Required. The device API resource name in the format
        #   `partners/[PARTNER_ID]/devices/[DEVICE_ID]`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AndroiddeviceprovisioningV1::Device] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroiddeviceprovisioningV1::Device]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_partner_device(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::AndroiddeviceprovisioningV1::Device::Representation
          command.response_class = Google::Apis::AndroiddeviceprovisioningV1::Device
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates reseller metadata associated with the device.
        # @param [Fixnum] metadata_owner_id
        #   Required. The owner of the newly set metadata. Set this to the partner ID.
        # @param [Fixnum] device_id
        #   Required. The ID of the device.
        # @param [Google::Apis::AndroiddeviceprovisioningV1::UpdateDeviceMetadataRequest] update_device_metadata_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AndroiddeviceprovisioningV1::DeviceMetadata] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroiddeviceprovisioningV1::DeviceMetadata]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def metadata_partner_device(metadata_owner_id, device_id, update_device_metadata_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/partners/{+metadataOwnerId}/devices/{+deviceId}/metadata', options)
          command.request_representation = Google::Apis::AndroiddeviceprovisioningV1::UpdateDeviceMetadataRequest::Representation
          command.request_object = update_device_metadata_request_object
          command.response_representation = Google::Apis::AndroiddeviceprovisioningV1::DeviceMetadata::Representation
          command.response_class = Google::Apis::AndroiddeviceprovisioningV1::DeviceMetadata
          command.params['metadataOwnerId'] = metadata_owner_id unless metadata_owner_id.nil?
          command.params['deviceId'] = device_id unless device_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Unclaims a device from a customer and removes it from zero-touch
        # enrollment.
        # @param [Fixnum] partner_id
        #   Required. The ID of the reseller partner.
        # @param [Google::Apis::AndroiddeviceprovisioningV1::UnclaimDeviceRequest] unclaim_device_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AndroiddeviceprovisioningV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroiddeviceprovisioningV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def unclaim_device(partner_id, unclaim_device_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/partners/{+partnerId}/devices:unclaim', options)
          command.request_representation = Google::Apis::AndroiddeviceprovisioningV1::UnclaimDeviceRequest::Representation
          command.request_object = unclaim_device_request_object
          command.response_representation = Google::Apis::AndroiddeviceprovisioningV1::Empty::Representation
          command.response_class = Google::Apis::AndroiddeviceprovisioningV1::Empty
          command.params['partnerId'] = partner_id unless partner_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Unclaims a batch of devices for a customer asynchronously. Removes the
        # devices from zero-touch enrollment. To learn more, read [Long‑running batch
        # operations](/zero-touch/guides/how-it-works#operations).
        # @param [Fixnum] partner_id
        #   Required. The reseller partner ID.
        # @param [Google::Apis::AndroiddeviceprovisioningV1::UnclaimDevicesRequest] unclaim_devices_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AndroiddeviceprovisioningV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroiddeviceprovisioningV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def unclaim_partner_device_async(partner_id, unclaim_devices_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/partners/{+partnerId}/devices:unclaimAsync', options)
          command.request_representation = Google::Apis::AndroiddeviceprovisioningV1::UnclaimDevicesRequest::Representation
          command.request_object = unclaim_devices_request_object
          command.response_representation = Google::Apis::AndroiddeviceprovisioningV1::Operation::Representation
          command.response_class = Google::Apis::AndroiddeviceprovisioningV1::Operation
          command.params['partnerId'] = partner_id unless partner_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the reseller metadata attached to a batch of devices. This method
        # updates devices asynchronously and returns an `Operation` that can be used
        # to track progress. Read [Long‑running batch
        # operations](/zero-touch/guides/how-it-works#operations).
        # @param [Fixnum] partner_id
        #   Required. The reseller partner ID.
        # @param [Google::Apis::AndroiddeviceprovisioningV1::UpdateDeviceMetadataInBatchRequest] update_device_metadata_in_batch_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AndroiddeviceprovisioningV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroiddeviceprovisioningV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_partner_device_metadata_async(partner_id, update_device_metadata_in_batch_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/partners/{+partnerId}/devices:updateMetadataAsync', options)
          command.request_representation = Google::Apis::AndroiddeviceprovisioningV1::UpdateDeviceMetadataInBatchRequest::Representation
          command.request_object = update_device_metadata_in_batch_request_object
          command.response_representation = Google::Apis::AndroiddeviceprovisioningV1::Operation::Representation
          command.response_class = Google::Apis::AndroiddeviceprovisioningV1::Operation
          command.params['partnerId'] = partner_id unless partner_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the vendors of the partner.
        # @param [String] parent
        #   Required. The resource name in the format `partners/[PARTNER_ID]`.
        # @param [Fixnum] page_size
        #   The maximum number of results to be returned.
        # @param [String] page_token
        #   A token identifying a page of results returned by the server.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AndroiddeviceprovisioningV1::ListVendorsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroiddeviceprovisioningV1::ListVendorsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_partner_vendors(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+parent}/vendors', options)
          command.response_representation = Google::Apis::AndroiddeviceprovisioningV1::ListVendorsResponse::Representation
          command.response_class = Google::Apis::AndroiddeviceprovisioningV1::ListVendorsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the customers of the vendor.
        # @param [String] parent
        #   Required. The resource name in the format
        #   `partners/[PARTNER_ID]/vendors/[VENDOR_ID]`.
        # @param [Fixnum] page_size
        #   The maximum number of results to be returned.
        # @param [String] page_token
        #   A token identifying a page of results returned by the server.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AndroiddeviceprovisioningV1::ListVendorCustomersResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AndroiddeviceprovisioningV1::ListVendorCustomersResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_partner_vendor_customers(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+parent}/customers', options)
          command.response_representation = Google::Apis::AndroiddeviceprovisioningV1::ListVendorCustomersResponse::Representation
          command.response_class = Google::Apis::AndroiddeviceprovisioningV1::ListVendorCustomersResponse
          command.params['parent'] = parent unless parent.nil?
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
