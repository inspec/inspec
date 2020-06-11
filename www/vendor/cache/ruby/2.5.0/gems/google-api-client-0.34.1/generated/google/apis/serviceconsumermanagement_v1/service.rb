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
    module ServiceconsumermanagementV1
      # Service Consumer Management API
      #
      # Manages the service consumers of a Service Infrastructure service.
      #
      # @example
      #    require 'google/apis/serviceconsumermanagement_v1'
      #
      #    Serviceconsumermanagement = Google::Apis::ServiceconsumermanagementV1 # Alias the module
      #    service = Serviceconsumermanagement::ServiceConsumerManagementService.new
      #
      # @see https://cloud.google.com/service-consumer-management/docs/overview
      class ServiceConsumerManagementService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://serviceconsumermanagement.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Starts asynchronous cancellation on a long-running operation.  The server
        # makes a best effort to cancel the operation, but success is not
        # guaranteed.  If the server doesn't support this method, it returns
        # `google.rpc.Code.UNIMPLEMENTED`.  Clients can use
        # Operations.GetOperation or
        # other methods to check whether the cancellation succeeded or whether the
        # operation completed despite cancellation. On successful cancellation,
        # the operation is not deleted; instead, it becomes an operation with
        # an Operation.error value with a google.rpc.Status.code of 1,
        # corresponding to `Code.CANCELLED`.
        # @param [String] name
        #   The name of the operation resource to be cancelled.
        # @param [Google::Apis::ServiceconsumermanagementV1::CancelOperationRequest] cancel_operation_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServiceconsumermanagementV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServiceconsumermanagementV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def cancel_operation(name, cancel_operation_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+name}:cancel', options)
          command.request_representation = Google::Apis::ServiceconsumermanagementV1::CancelOperationRequest::Representation
          command.request_object = cancel_operation_request_object
          command.response_representation = Google::Apis::ServiceconsumermanagementV1::Empty::Representation
          command.response_class = Google::Apis::ServiceconsumermanagementV1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a long-running operation. This method indicates that the client is
        # no longer interested in the operation result. It does not cancel the
        # operation. If the server doesn't support this method, it returns
        # `google.rpc.Code.UNIMPLEMENTED`.
        # @param [String] name
        #   The name of the operation resource to be deleted.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServiceconsumermanagementV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServiceconsumermanagementV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_operation(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/{+name}', options)
          command.response_representation = Google::Apis::ServiceconsumermanagementV1::Empty::Representation
          command.response_class = Google::Apis::ServiceconsumermanagementV1::Empty
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
        # @yieldparam result [Google::Apis::ServiceconsumermanagementV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServiceconsumermanagementV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_operation(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::ServiceconsumermanagementV1::Operation::Representation
          command.response_class = Google::Apis::ServiceconsumermanagementV1::Operation
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
        # @param [String] name
        #   The name of the operation's parent resource.
        # @param [String] filter
        #   The standard list filter.
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
        # @yieldparam result [Google::Apis::ServiceconsumermanagementV1::ListOperationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServiceconsumermanagementV1::ListOperationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_operations(name, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::ServiceconsumermanagementV1::ListOperationsResponse::Representation
          command.response_class = Google::Apis::ServiceconsumermanagementV1::ListOperationsResponse
          command.params['name'] = name unless name.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Search tenancy units for a managed service.
        # @param [String] parent
        #   Service for which search is performed.
        #   services/`service`
        #   `service` the name of a service, for example 'service.googleapis.com'.
        # @param [Fixnum] page_size
        #   The maximum number of results returned by this request. Currently, the
        #   default maximum is set to 1000. If `page_size` isn't provided or the size
        #   provided is a number larger than 1000, it's automatically set to 1000.
        #   Optional.
        # @param [String] page_token
        #   The continuation token, which is used to page through large result sets.
        #   To get the next page of results, set this parameter to the value of
        #   `nextPageToken` from the previous response.
        #   Optional.
        # @param [String] query
        #   Set a query ``expression`` for querying tenancy units. Your ``expression``
        #   must be in the format: `field_name=literal_string`. The `field_name` is the
        #   name of the field you want to compare. Supported fields are
        #   `tenant_resources.tag` and `tenant_resources.resource`.
        #   For example, to search tenancy units that contain at least one tenant
        #   resource with a given tag 'xyz', use the query `tenant_resources.tag=xyz`.
        #   To search tenancy units that contain at least one tenant resource with
        #   a given resource name 'projects/123456', use the query
        #   `tenant_resources.resource=projects/123456`.
        #   Multiple expressions can be joined with `AND`s. Tenancy units must match
        #   all expressions to be included in the result set. For example,
        #   `tenant_resources.tag=xyz AND tenant_resources.resource=projects/123456`
        #   Optional.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServiceconsumermanagementV1::SearchTenancyUnitsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServiceconsumermanagementV1::SearchTenancyUnitsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def search_services(parent, page_size: nil, page_token: nil, query: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+parent}:search', options)
          command.response_representation = Google::Apis::ServiceconsumermanagementV1::SearchTenancyUnitsResponse::Representation
          command.response_class = Google::Apis::ServiceconsumermanagementV1::SearchTenancyUnitsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['query'] = query unless query.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Add a new tenant project to the tenancy unit.
        # There can be a maximum of 512 tenant projects in a tenancy unit.
        # If there are previously failed `AddTenantProject` calls, you might need to
        # call `RemoveTenantProject` first to resolve them before you can make
        # another call to `AddTenantProject` with the same tag.
        # Operation<response: Empty>.
        # @param [String] parent
        #   Name of the tenancy unit.
        #   Such as 'services/service.googleapis.com/projects/12345/tenancyUnits/abcd'.
        # @param [Google::Apis::ServiceconsumermanagementV1::AddTenantProjectRequest] add_tenant_project_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServiceconsumermanagementV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServiceconsumermanagementV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def add_service_tenancy_unit_project(parent, add_tenant_project_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}:addProject', options)
          command.request_representation = Google::Apis::ServiceconsumermanagementV1::AddTenantProjectRequest::Representation
          command.request_object = add_tenant_project_request_object
          command.response_representation = Google::Apis::ServiceconsumermanagementV1::Operation::Representation
          command.response_class = Google::Apis::ServiceconsumermanagementV1::Operation
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Apply a configuration to an existing tenant project.
        # This project must exist in an active state and have the original owner
        # account. The caller must have permission to add a project to the given
        # tenancy unit. The configuration is applied, but any existing settings on
        # the project aren't modified.
        # Specified policy bindings are applied. Existing bindings aren't modified.
        # Specified services are activated. No service is deactivated.
        # If specified, new billing configuration is applied.
        # Omit a billing configuration to keep the existing one.
        # A service account in the project is created if previously non existed.
        # Specified labels will be appended to tenant project, note that the value of
        # existing label key will be updated if the same label key is requested.
        # The specified folder is ignored, as moving a tenant project to a different
        # folder isn't supported.
        # The operation fails if any of the steps fail, but no rollback of already
        # applied configuration changes is attempted.
        # Operation<response: Empty>.
        # @param [String] name
        #   Name of the tenancy unit.
        #   Such as 'services/service.googleapis.com/projects/12345/tenancyUnits/abcd'.
        # @param [Google::Apis::ServiceconsumermanagementV1::ApplyTenantProjectConfigRequest] apply_tenant_project_config_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServiceconsumermanagementV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServiceconsumermanagementV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def apply_service_tenancy_unit_project_config(name, apply_tenant_project_config_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+name}:applyProjectConfig', options)
          command.request_representation = Google::Apis::ServiceconsumermanagementV1::ApplyTenantProjectConfigRequest::Representation
          command.request_object = apply_tenant_project_config_request_object
          command.response_representation = Google::Apis::ServiceconsumermanagementV1::Operation::Representation
          command.response_class = Google::Apis::ServiceconsumermanagementV1::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Attach an existing project to the tenancy unit as a new tenant
        # resource. The project could either be the tenant project reserved by
        # calling `AddTenantProject` under a tenancy unit of a service producer's
        # project of a managed service, or from a separate project.
        # The caller is checked against a set of permissions as if calling
        # `AddTenantProject` on the same service consumer.
        # To trigger the attachment, the targeted tenant project must be in a
        # folder. Make sure the ServiceConsumerManagement service account is
        # the owner of that project. These two requirements are already met
        # if the project is reserved by calling `AddTenantProject`.
        # Operation<response: Empty>.
        # @param [String] name
        #   Name of the tenancy unit that the project will be attached to.
        #   Such as 'services/service.googleapis.com/projects/12345/tenancyUnits/abcd'.
        # @param [Google::Apis::ServiceconsumermanagementV1::AttachTenantProjectRequest] attach_tenant_project_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServiceconsumermanagementV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServiceconsumermanagementV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def attach_service_tenancy_unit_project(name, attach_tenant_project_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+name}:attachProject', options)
          command.request_representation = Google::Apis::ServiceconsumermanagementV1::AttachTenantProjectRequest::Representation
          command.request_object = attach_tenant_project_request_object
          command.response_representation = Google::Apis::ServiceconsumermanagementV1::Operation::Representation
          command.response_class = Google::Apis::ServiceconsumermanagementV1::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a tenancy unit with no tenant resources.
        # If tenancy unit already exists, it will be returned,
        # however, in this case, returned TenancyUnit does not have tenant_resources
        # field set and ListTenancyUnit has to be used to get a complete
        # TenancyUnit with all fields populated.
        # @param [String] parent
        #   services/`service`/`collection id`/`resource id`
        #   `collection id` is the cloud resource collection type representing the
        #   service consumer, for example 'projects', or 'organizations'.
        #   `resource id` is the consumer numeric id, such as project number: '123456'.
        #   `service` the name of a managed service, such as 'service.googleapis.com'.
        #   Enables service binding using the new tenancy unit.
        # @param [Google::Apis::ServiceconsumermanagementV1::CreateTenancyUnitRequest] create_tenancy_unit_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServiceconsumermanagementV1::TenancyUnit] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServiceconsumermanagementV1::TenancyUnit]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_tenancy_unit(parent, create_tenancy_unit_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}/tenancyUnits', options)
          command.request_representation = Google::Apis::ServiceconsumermanagementV1::CreateTenancyUnitRequest::Representation
          command.request_object = create_tenancy_unit_request_object
          command.response_representation = Google::Apis::ServiceconsumermanagementV1::TenancyUnit::Representation
          command.response_class = Google::Apis::ServiceconsumermanagementV1::TenancyUnit
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Delete a tenancy unit. Before you delete the tenancy unit, there should be
        # no tenant resources in it that aren't in a DELETED state.
        # Operation<response: Empty>.
        # @param [String] name
        #   Name of the tenancy unit to be deleted.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServiceconsumermanagementV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServiceconsumermanagementV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_service_tenancy_unit(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/{+name}', options)
          command.response_representation = Google::Apis::ServiceconsumermanagementV1::Operation::Representation
          command.response_class = Google::Apis::ServiceconsumermanagementV1::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the specified project resource identified by a tenant resource tag.
        # The mothod removes a project lien with a 'TenantManager' origin if that was
        # added. It will then attempt to delete the project. If that operation fails,
        # this method also fails.
        # After the project has been deleted, the tenant resource state is set to
        # DELETED.  To permanently remove resource metadata, call the
        # `RemoveTenantProject` method.
        # New resources with the same tag can't be added if there are existing
        # resources in a DELETED state.
        # Operation<response: Empty>.
        # @param [String] name
        #   Name of the tenancy unit.
        #   Such as 'services/service.googleapis.com/projects/12345/tenancyUnits/abcd'.
        # @param [Google::Apis::ServiceconsumermanagementV1::DeleteTenantProjectRequest] delete_tenant_project_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServiceconsumermanagementV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServiceconsumermanagementV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_service_tenancy_unit_project(name, delete_tenant_project_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+name}:deleteProject', options)
          command.request_representation = Google::Apis::ServiceconsumermanagementV1::DeleteTenantProjectRequest::Representation
          command.request_object = delete_tenant_project_request_object
          command.response_representation = Google::Apis::ServiceconsumermanagementV1::Operation::Representation
          command.response_class = Google::Apis::ServiceconsumermanagementV1::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Find the tenancy unit for a managed service and service consumer.
        # This method shouldn't be used in a service producer's runtime path, for
        # example to find the tenant project number when creating VMs. Service
        # producers must persist the tenant project's information after the project
        # is created.
        # @param [String] parent
        #   Managed service and service consumer. Required.
        #   services/`service`/`collection id`/`resource id`
        #   `collection id` is the cloud resource collection type representing the
        #   service consumer, for example 'projects', or 'organizations'.
        #   `resource id` is the consumer numeric id, such as project number: '123456'.
        #   `service` the name of a service, such as 'service.googleapis.com'.
        # @param [String] filter
        #   Filter expression over tenancy resources field. Optional.
        # @param [Fixnum] page_size
        #   The maximum number of results returned by this request.
        # @param [String] page_token
        #   The continuation token, which is used to page through large result sets.
        #   To get the next page of results, set this parameter to the value of
        #   `nextPageToken` from the previous response.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServiceconsumermanagementV1::ListTenancyUnitsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServiceconsumermanagementV1::ListTenancyUnitsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_service_tenancy_units(parent, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+parent}/tenancyUnits', options)
          command.response_representation = Google::Apis::ServiceconsumermanagementV1::ListTenancyUnitsResponse::Representation
          command.response_class = Google::Apis::ServiceconsumermanagementV1::ListTenancyUnitsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Removes the specified project resource identified by a tenant resource tag.
        # The method removes the project lien with 'TenantManager' origin if that
        # was added. It then attempts to delete the project. If that operation
        # fails, this method also fails.
        # Calls to remove already removed or non-existent tenant project succeed.
        # After the project has been deleted, or if was already in a DELETED state,
        # resource metadata is permanently removed from the tenancy unit.
        # Operation<response: Empty>.
        # @param [String] name
        #   Name of the tenancy unit.
        #   Such as 'services/service.googleapis.com/projects/12345/tenancyUnits/abcd'.
        # @param [Google::Apis::ServiceconsumermanagementV1::RemoveTenantProjectRequest] remove_tenant_project_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServiceconsumermanagementV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServiceconsumermanagementV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def remove_service_tenancy_unit_project(name, remove_tenant_project_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+name}:removeProject', options)
          command.request_representation = Google::Apis::ServiceconsumermanagementV1::RemoveTenantProjectRequest::Representation
          command.request_object = remove_tenant_project_request_object
          command.response_representation = Google::Apis::ServiceconsumermanagementV1::Operation::Representation
          command.response_class = Google::Apis::ServiceconsumermanagementV1::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Attempts to undelete a previously deleted tenant project. The project must
        # be in a DELETED state.
        # There are no guarantees that an undeleted project will be in
        # a fully restored and functional state. Call the `ApplyTenantProjectConfig`
        # method to update its configuration and then validate all managed service
        # resources.
        # Operation<response: Empty>.
        # @param [String] name
        #   Name of the tenancy unit.
        #   Such as 'services/service.googleapis.com/projects/12345/tenancyUnits/abcd'.
        # @param [Google::Apis::ServiceconsumermanagementV1::UndeleteTenantProjectRequest] undelete_tenant_project_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServiceconsumermanagementV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServiceconsumermanagementV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def undelete_service_tenancy_unit_project(name, undelete_tenant_project_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+name}:undeleteProject', options)
          command.request_representation = Google::Apis::ServiceconsumermanagementV1::UndeleteTenantProjectRequest::Representation
          command.request_object = undelete_tenant_project_request_object
          command.response_representation = Google::Apis::ServiceconsumermanagementV1::Operation::Representation
          command.response_class = Google::Apis::ServiceconsumermanagementV1::Operation
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
