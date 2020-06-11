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
    module ServiceusageV1beta1
      # Service Usage API
      #
      # Enables services that service consumers want to use on Google Cloud Platform,
      #  lists the available or enabled services, or disables services that service
      #  consumers no longer use.
      #
      # @example
      #    require 'google/apis/serviceusage_v1beta1'
      #
      #    Serviceusage = Google::Apis::ServiceusageV1beta1 # Alias the module
      #    service = Serviceusage::ServiceUsageService.new
      #
      # @see https://cloud.google.com/service-usage/
      class ServiceUsageService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://serviceusage.googleapis.com/', '')
          @batch_path = 'batch'
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
        # @yieldparam result [Google::Apis::ServiceusageV1beta1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServiceusageV1beta1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_operation(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::ServiceusageV1beta1::Operation::Representation
          command.response_class = Google::Apis::ServiceusageV1beta1::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists operations that match the specified filter in the request. If the
        # server doesn't support this method, it returns `UNIMPLEMENTED`.
        # NOTE: the `name` binding allows API services to override the binding
        # to use different resource name schemes, such as `users/*/operations`. To
        # override the binding, API services can add a binding such as
        # `"/v1/`name=users/*`/operations"` to their service configuration.
        # For backwards compatibility, the default name includes the operations
        # collection id, however overriding users must ensure the name binding
        # is the parent resource, without the operations collection id.
        # @param [String] filter
        #   The standard list filter.
        # @param [String] name
        #   The name of the operation's parent resource.
        # @param [Fixnum] page_size
        #   The standard list page size.
        # @param [String] page_token
        #   The standard list page token.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServiceusageV1beta1::ListOperationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServiceusageV1beta1::ListOperationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_operations(filter: nil, name: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/operations', options)
          command.response_representation = Google::Apis::ServiceusageV1beta1::ListOperationsResponse::Representation
          command.response_class = Google::Apis::ServiceusageV1beta1::ListOperationsResponse
          command.query['filter'] = filter unless filter.nil?
          command.query['name'] = name unless name.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Enable multiple services on a project. The operation is atomic: if enabling
        # any service fails, then the entire batch fails, and no state changes occur.
        # Operation<response: google.protobuf.Empty>
        # @param [String] parent
        #   Parent to enable services on.
        #   An example name would be:
        #   `projects/123`
        #   where `123` is the project number (not project ID).
        #   The `BatchEnableServices` method currently only supports projects.
        # @param [Google::Apis::ServiceusageV1beta1::BatchEnableServicesRequest] batch_enable_services_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServiceusageV1beta1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServiceusageV1beta1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_enable_services(parent, batch_enable_services_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+parent}/services:batchEnable', options)
          command.request_representation = Google::Apis::ServiceusageV1beta1::BatchEnableServicesRequest::Representation
          command.request_object = batch_enable_services_request_object
          command.response_representation = Google::Apis::ServiceusageV1beta1::Operation::Representation
          command.response_class = Google::Apis::ServiceusageV1beta1::Operation
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Disable a service so that it can no longer be used with a project.
        # This prevents unintended usage that may cause unexpected billing
        # charges or security leaks.
        # It is not valid to call the disable method on a service that is not
        # currently enabled. Callers will receive a `FAILED_PRECONDITION` status if
        # the target service is not currently enabled.
        # Operation<response: google.protobuf.Empty>
        # @param [String] name
        #   Name of the consumer and service to disable the service on.
        #   The enable and disable methods currently only support projects.
        #   An example name would be:
        #   `projects/123/services/serviceusage.googleapis.com`
        #   where `123` is the project number (not project ID).
        # @param [Google::Apis::ServiceusageV1beta1::DisableServiceRequest] disable_service_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServiceusageV1beta1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServiceusageV1beta1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def disable_service(name, disable_service_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+name}:disable', options)
          command.request_representation = Google::Apis::ServiceusageV1beta1::DisableServiceRequest::Representation
          command.request_object = disable_service_request_object
          command.response_representation = Google::Apis::ServiceusageV1beta1::Operation::Representation
          command.response_class = Google::Apis::ServiceusageV1beta1::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Enable a service so that it can be used with a project.
        # Operation<response: google.protobuf.Empty>
        # @param [String] name
        #   Name of the consumer and service to enable the service on.
        #   The `EnableService` and `DisableService` methods currently only support
        #   projects.
        #   Enabling a service requires that the service is public or is shared with
        #   the user enabling the service.
        #   An example name would be:
        #   `projects/123/services/serviceusage.googleapis.com`
        #   where `123` is the project number (not project ID).
        # @param [Google::Apis::ServiceusageV1beta1::EnableServiceRequest] enable_service_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServiceusageV1beta1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServiceusageV1beta1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def enable_service(name, enable_service_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+name}:enable', options)
          command.request_representation = Google::Apis::ServiceusageV1beta1::EnableServiceRequest::Representation
          command.request_object = enable_service_request_object
          command.response_representation = Google::Apis::ServiceusageV1beta1::Operation::Representation
          command.response_class = Google::Apis::ServiceusageV1beta1::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the service configuration and enabled state for a given service.
        # @param [String] name
        #   Name of the consumer and service to get the `ConsumerState` for.
        #   An example name would be:
        #   `projects/123/services/serviceusage.googleapis.com`
        #   where `123` is the project number (not project ID).
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServiceusageV1beta1::Service] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServiceusageV1beta1::Service]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_service(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::ServiceusageV1beta1::Service::Representation
          command.response_class = Google::Apis::ServiceusageV1beta1::Service
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all services available to the specified project, and the current
        # state of those services with respect to the project. The list includes
        # all public services, all services for which the calling user has the
        # `servicemanagement.services.bind` permission, and all services that have
        # already been enabled on the project. The list can be filtered to
        # only include services in a specific state, for example to only include
        # services enabled on the project.
        # @param [String] parent
        #   Parent to search for services on.
        #   An example name would be:
        #   `projects/123`
        #   where `123` is the project number (not project ID).
        # @param [String] filter
        #   Only list services that conform to the given filter.
        #   The allowed filter strings are `state:ENABLED` and `state:DISABLED`.
        # @param [Fixnum] page_size
        #   Requested size of the next page of data.
        #   Requested page size cannot exceed 200.
        #   If not set, the default page size is 50.
        # @param [String] page_token
        #   Token identifying which result to start with, which is returned by a
        #   previous list call.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServiceusageV1beta1::ListServicesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServiceusageV1beta1::ListServicesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_services(parent, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+parent}/services', options)
          command.response_representation = Google::Apis::ServiceusageV1beta1::ListServicesResponse::Representation
          command.response_class = Google::Apis::ServiceusageV1beta1::ListServicesResponse
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
