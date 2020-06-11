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
    module ServicemanagementV1
      # Service Management API
      #
      # Google Service Management allows service producers to publish their services
      #  on Google Cloud Platform so that they can be discovered and used by service
      #  consumers.
      #
      # @example
      #    require 'google/apis/servicemanagement_v1'
      #
      #    Servicemanagement = Google::Apis::ServicemanagementV1 # Alias the module
      #    service = Servicemanagement::ServiceManagementService.new
      #
      # @see https://cloud.google.com/service-management/
      class ServiceManagementService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://servicemanagement.googleapis.com/', '')
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
        # @yieldparam result [Google::Apis::ServicemanagementV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServicemanagementV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_operation(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::ServicemanagementV1::Operation::Representation
          command.response_class = Google::Apis::ServicemanagementV1::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists service operations that match the specified filter in the request.
        # @param [String] filter
        #   A string for filtering Operations.
        #   The following filter fields are supported&#58;
        #   * serviceName&#58; Required. Only `=` operator is allowed.
        #   * startTime&#58; The time this job was started, in ISO 8601 format.
        #   Allowed operators are `>=`,  `>`, `<=`, and `<`.
        #   * status&#58; Can be `done`, `in_progress`, or `failed`. Allowed
        #   operators are `=`, and `!=`.
        #   Filter expression supports conjunction (AND) and disjunction (OR)
        #   logical operators. However, the serviceName restriction must be at the
        #   top-level and can only be combined with other restrictions via the AND
        #   logical operator.
        #   Examples&#58;
        #   * `serviceName=`some-service`.googleapis.com`
        #   * `serviceName=`some-service`.googleapis.com AND startTime>="2017-02-01"`
        #   * `serviceName=`some-service`.googleapis.com AND status=done`
        #   * `serviceName=`some-service`.googleapis.com AND (status=done OR startTime>="
        #   2017-02-01")`
        # @param [String] name
        #   Not used.
        # @param [Fixnum] page_size
        #   The maximum number of operations to return. If unspecified, defaults to
        #   50. The maximum value is 100.
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
        # @yieldparam result [Google::Apis::ServicemanagementV1::ListOperationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServicemanagementV1::ListOperationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_operations(filter: nil, name: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/operations', options)
          command.response_representation = Google::Apis::ServicemanagementV1::ListOperationsResponse::Representation
          command.response_class = Google::Apis::ServicemanagementV1::ListOperationsResponse
          command.query['filter'] = filter unless filter.nil?
          command.query['name'] = name unless name.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new managed service.
        # Please note one producer project can own no more than 20 services.
        # Operation<response: ManagedService>
        # @param [Google::Apis::ServicemanagementV1::ManagedService] managed_service_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServicemanagementV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServicemanagementV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_service(managed_service_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/services', options)
          command.request_representation = Google::Apis::ServicemanagementV1::ManagedService::Representation
          command.request_object = managed_service_object
          command.response_representation = Google::Apis::ServicemanagementV1::Operation::Representation
          command.response_class = Google::Apis::ServicemanagementV1::Operation
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a managed service. This method will change the service to the
        # `Soft-Delete` state for 30 days. Within this period, service producers may
        # call UndeleteService to restore the service.
        # After 30 days, the service will be permanently deleted.
        # Operation<response: google.protobuf.Empty>
        # @param [String] service_name
        #   Required. The name of the service.  See the [overview](/service-management/
        #   overview)
        #   for naming requirements.  For example: `example.googleapis.com`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServicemanagementV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServicemanagementV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_service(service_name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/services/{serviceName}', options)
          command.response_representation = Google::Apis::ServicemanagementV1::Operation::Representation
          command.response_class = Google::Apis::ServicemanagementV1::Operation
          command.params['serviceName'] = service_name unless service_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Disables a service for a project, so it can no longer be
        # be used for the project. It prevents accidental usage that may cause
        # unexpected billing charges or security leaks.
        # Operation<response: DisableServiceResponse>
        # @param [String] service_name
        #   Required. Name of the service to disable. Specifying an unknown service name
        #   will cause the request to fail.
        # @param [Google::Apis::ServicemanagementV1::DisableServiceRequest] disable_service_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServicemanagementV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServicemanagementV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def disable_service(service_name, disable_service_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/services/{serviceName}:disable', options)
          command.request_representation = Google::Apis::ServicemanagementV1::DisableServiceRequest::Representation
          command.request_object = disable_service_request_object
          command.response_representation = Google::Apis::ServicemanagementV1::Operation::Representation
          command.response_class = Google::Apis::ServicemanagementV1::Operation
          command.params['serviceName'] = service_name unless service_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Enables a service for a project, so it can be used
        # for the project. See
        # [Cloud Auth Guide](https://cloud.google.com/docs/authentication) for
        # more information.
        # Operation<response: EnableServiceResponse>
        # @param [String] service_name
        #   Required. Name of the service to enable. Specifying an unknown service name
        #   will
        #   cause the request to fail.
        # @param [Google::Apis::ServicemanagementV1::EnableServiceRequest] enable_service_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServicemanagementV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServicemanagementV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def enable_service(service_name, enable_service_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/services/{serviceName}:enable', options)
          command.request_representation = Google::Apis::ServicemanagementV1::EnableServiceRequest::Representation
          command.request_object = enable_service_request_object
          command.response_representation = Google::Apis::ServicemanagementV1::Operation::Representation
          command.response_class = Google::Apis::ServicemanagementV1::Operation
          command.params['serviceName'] = service_name unless service_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Generates and returns a report (errors, warnings and changes from
        # existing configurations) associated with
        # GenerateConfigReportRequest.new_value
        # If GenerateConfigReportRequest.old_value is specified,
        # GenerateConfigReportRequest will contain a single ChangeReport based on the
        # comparison between GenerateConfigReportRequest.new_value and
        # GenerateConfigReportRequest.old_value.
        # If GenerateConfigReportRequest.old_value is not specified, this method
        # will compare GenerateConfigReportRequest.new_value with the last pushed
        # service configuration.
        # @param [Google::Apis::ServicemanagementV1::GenerateConfigReportRequest] generate_config_report_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServicemanagementV1::GenerateConfigReportResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServicemanagementV1::GenerateConfigReportResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def generate_service_config_report(generate_config_report_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/services:generateConfigReport', options)
          command.request_representation = Google::Apis::ServicemanagementV1::GenerateConfigReportRequest::Representation
          command.request_object = generate_config_report_request_object
          command.response_representation = Google::Apis::ServicemanagementV1::GenerateConfigReportResponse::Representation
          command.response_class = Google::Apis::ServicemanagementV1::GenerateConfigReportResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a managed service. Authentication is required unless the service is
        # public.
        # @param [String] service_name
        #   Required. The name of the service.  See the `ServiceManager` overview for
        #   naming
        #   requirements.  For example: `example.googleapis.com`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServicemanagementV1::ManagedService] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServicemanagementV1::ManagedService]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_service(service_name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/services/{serviceName}', options)
          command.response_representation = Google::Apis::ServicemanagementV1::ManagedService::Representation
          command.response_class = Google::Apis::ServicemanagementV1::ManagedService
          command.params['serviceName'] = service_name unless service_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a service configuration (version) for a managed service.
        # @param [String] service_name
        #   Required. The name of the service.  See the [overview](/service-management/
        #   overview)
        #   for naming requirements.  For example: `example.googleapis.com`.
        # @param [String] config_id
        #   Required. The id of the service configuration resource.
        #   This field must be specified for the server to return all fields, including
        #   `SourceInfo`.
        # @param [String] view
        #   Specifies which parts of the Service Config should be returned in the
        #   response.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServicemanagementV1::Service] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServicemanagementV1::Service]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_service_configuration(service_name, config_id: nil, view: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/services/{serviceName}/config', options)
          command.response_representation = Google::Apis::ServicemanagementV1::Service::Representation
          command.response_class = Google::Apis::ServicemanagementV1::Service
          command.params['serviceName'] = service_name unless service_name.nil?
          command.query['configId'] = config_id unless config_id.nil?
          command.query['view'] = view unless view.nil?
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
        # @param [Google::Apis::ServicemanagementV1::GetIamPolicyRequest] get_iam_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServicemanagementV1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServicemanagementV1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_service_iam_policy(resource, get_iam_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+resource}:getIamPolicy', options)
          command.request_representation = Google::Apis::ServicemanagementV1::GetIamPolicyRequest::Representation
          command.request_object = get_iam_policy_request_object
          command.response_representation = Google::Apis::ServicemanagementV1::Policy::Representation
          command.response_class = Google::Apis::ServicemanagementV1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists managed services.
        # Returns all public services. For authenticated users, also returns all
        # services the calling user has "servicemanagement.services.get" permission
        # for.
        # **BETA:** If the caller specifies the `consumer_id`, it returns only the
        # services enabled on the consumer. The `consumer_id` must have the format
        # of "project:`PROJECT-ID`".
        # @param [String] consumer_id
        #   Include services consumed by the specified consumer.
        #   The Google Service Management implementation accepts the following
        #   forms:
        #   - project:<project_id>
        # @param [Fixnum] page_size
        #   The max number of items to include in the response list. Page size is 50
        #   if not specified. Maximum value is 100.
        # @param [String] page_token
        #   Token identifying which result to start with; returned by a previous list
        #   call.
        # @param [String] producer_project_id
        #   Include services produced by the specified project.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServicemanagementV1::ListServicesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServicemanagementV1::ListServicesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_services(consumer_id: nil, page_size: nil, page_token: nil, producer_project_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/services', options)
          command.response_representation = Google::Apis::ServicemanagementV1::ListServicesResponse::Representation
          command.response_class = Google::Apis::ServicemanagementV1::ListServicesResponse
          command.query['consumerId'] = consumer_id unless consumer_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['producerProjectId'] = producer_project_id unless producer_project_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets the access control policy on the specified resource. Replaces any
        # existing policy.
        # Can return Public Errors: NOT_FOUND, INVALID_ARGUMENT and PERMISSION_DENIED
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being specified.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::ServicemanagementV1::SetIamPolicyRequest] set_iam_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServicemanagementV1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServicemanagementV1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def set_service_iam_policy(resource, set_iam_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+resource}:setIamPolicy', options)
          command.request_representation = Google::Apis::ServicemanagementV1::SetIamPolicyRequest::Representation
          command.request_object = set_iam_policy_request_object
          command.response_representation = Google::Apis::ServicemanagementV1::Policy::Representation
          command.response_class = Google::Apis::ServicemanagementV1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns permissions that a caller has on the specified resource.
        # If the resource does not exist, this will return an empty set of
        # permissions, not a NOT_FOUND error.
        # Note: This operation is designed to be used for building permission-aware
        # UIs and command-line tools, not for authorization checking. This operation
        # may "fail open" without warning.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy detail is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::ServicemanagementV1::TestIamPermissionsRequest] test_iam_permissions_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServicemanagementV1::TestIamPermissionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServicemanagementV1::TestIamPermissionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def test_service_iam_permissions(resource, test_iam_permissions_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+resource}:testIamPermissions', options)
          command.request_representation = Google::Apis::ServicemanagementV1::TestIamPermissionsRequest::Representation
          command.request_object = test_iam_permissions_request_object
          command.response_representation = Google::Apis::ServicemanagementV1::TestIamPermissionsResponse::Representation
          command.response_class = Google::Apis::ServicemanagementV1::TestIamPermissionsResponse
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Revives a previously deleted managed service. The method restores the
        # service using the configuration at the time the service was deleted.
        # The target service must exist and must have been deleted within the
        # last 30 days.
        # Operation<response: UndeleteServiceResponse>
        # @param [String] service_name
        #   Required. The name of the service. See the [overview](/service-management/
        #   overview)
        #   for naming requirements. For example: `example.googleapis.com`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServicemanagementV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServicemanagementV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def undelete_service(service_name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/services/{serviceName}:undelete', options)
          command.response_representation = Google::Apis::ServicemanagementV1::Operation::Representation
          command.response_class = Google::Apis::ServicemanagementV1::Operation
          command.params['serviceName'] = service_name unless service_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new service configuration (version) for a managed service.
        # This method only stores the service configuration. To roll out the service
        # configuration to backend systems please call
        # CreateServiceRollout.
        # Only the 100 most recent service configurations and ones referenced by
        # existing rollouts are kept for each service. The rest will be deleted
        # eventually.
        # @param [String] service_name
        #   Required. The name of the service.  See the [overview](/service-management/
        #   overview)
        #   for naming requirements.  For example: `example.googleapis.com`.
        # @param [Google::Apis::ServicemanagementV1::Service] service_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServicemanagementV1::Service] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServicemanagementV1::Service]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_service_config(service_name, service_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/services/{serviceName}/configs', options)
          command.request_representation = Google::Apis::ServicemanagementV1::Service::Representation
          command.request_object = service_object
          command.response_representation = Google::Apis::ServicemanagementV1::Service::Representation
          command.response_class = Google::Apis::ServicemanagementV1::Service
          command.params['serviceName'] = service_name unless service_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a service configuration (version) for a managed service.
        # @param [String] service_name
        #   Required. The name of the service.  See the [overview](/service-management/
        #   overview)
        #   for naming requirements.  For example: `example.googleapis.com`.
        # @param [String] config_id
        #   Required. The id of the service configuration resource.
        #   This field must be specified for the server to return all fields, including
        #   `SourceInfo`.
        # @param [String] view
        #   Specifies which parts of the Service Config should be returned in the
        #   response.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServicemanagementV1::Service] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServicemanagementV1::Service]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_service_config(service_name, config_id, view: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/services/{serviceName}/configs/{configId}', options)
          command.response_representation = Google::Apis::ServicemanagementV1::Service::Representation
          command.response_class = Google::Apis::ServicemanagementV1::Service
          command.params['serviceName'] = service_name unless service_name.nil?
          command.params['configId'] = config_id unless config_id.nil?
          command.query['view'] = view unless view.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the history of the service configuration for a managed service,
        # from the newest to the oldest.
        # @param [String] service_name
        #   Required. The name of the service.  See the [overview](/service-management/
        #   overview)
        #   for naming requirements.  For example: `example.googleapis.com`.
        # @param [Fixnum] page_size
        #   The max number of items to include in the response list. Page size is 50
        #   if not specified. Maximum value is 100.
        # @param [String] page_token
        #   The token of the page to retrieve.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServicemanagementV1::ListServiceConfigsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServicemanagementV1::ListServiceConfigsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_service_configs(service_name, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/services/{serviceName}/configs', options)
          command.response_representation = Google::Apis::ServicemanagementV1::ListServiceConfigsResponse::Representation
          command.response_class = Google::Apis::ServicemanagementV1::ListServiceConfigsResponse
          command.params['serviceName'] = service_name unless service_name.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new service configuration (version) for a managed service based
        # on
        # user-supplied configuration source files (for example: OpenAPI
        # Specification). This method stores the source configurations as well as the
        # generated service configuration. To rollout the service configuration to
        # other services,
        # please call CreateServiceRollout.
        # Only the 100 most recent configuration sources and ones referenced by
        # existing service configurtions are kept for each service. The rest will be
        # deleted eventually.
        # Operation<response: SubmitConfigSourceResponse>
        # @param [String] service_name
        #   Required. The name of the service.  See the [overview](/service-management/
        #   overview)
        #   for naming requirements.  For example: `example.googleapis.com`.
        # @param [Google::Apis::ServicemanagementV1::SubmitConfigSourceRequest] submit_config_source_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServicemanagementV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServicemanagementV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def submit_config_source(service_name, submit_config_source_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/services/{serviceName}/configs:submit', options)
          command.request_representation = Google::Apis::ServicemanagementV1::SubmitConfigSourceRequest::Representation
          command.request_object = submit_config_source_request_object
          command.response_representation = Google::Apis::ServicemanagementV1::Operation::Representation
          command.response_class = Google::Apis::ServicemanagementV1::Operation
          command.params['serviceName'] = service_name unless service_name.nil?
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
        # @param [Google::Apis::ServicemanagementV1::GetIamPolicyRequest] get_iam_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServicemanagementV1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServicemanagementV1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_consumer_iam_policy(resource, get_iam_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+resource}:getIamPolicy', options)
          command.request_representation = Google::Apis::ServicemanagementV1::GetIamPolicyRequest::Representation
          command.request_object = get_iam_policy_request_object
          command.response_representation = Google::Apis::ServicemanagementV1::Policy::Representation
          command.response_class = Google::Apis::ServicemanagementV1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets the access control policy on the specified resource. Replaces any
        # existing policy.
        # Can return Public Errors: NOT_FOUND, INVALID_ARGUMENT and PERMISSION_DENIED
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being specified.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::ServicemanagementV1::SetIamPolicyRequest] set_iam_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServicemanagementV1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServicemanagementV1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def set_consumer_iam_policy(resource, set_iam_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+resource}:setIamPolicy', options)
          command.request_representation = Google::Apis::ServicemanagementV1::SetIamPolicyRequest::Representation
          command.request_object = set_iam_policy_request_object
          command.response_representation = Google::Apis::ServicemanagementV1::Policy::Representation
          command.response_class = Google::Apis::ServicemanagementV1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns permissions that a caller has on the specified resource.
        # If the resource does not exist, this will return an empty set of
        # permissions, not a NOT_FOUND error.
        # Note: This operation is designed to be used for building permission-aware
        # UIs and command-line tools, not for authorization checking. This operation
        # may "fail open" without warning.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy detail is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::ServicemanagementV1::TestIamPermissionsRequest] test_iam_permissions_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServicemanagementV1::TestIamPermissionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServicemanagementV1::TestIamPermissionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def test_consumer_iam_permissions(resource, test_iam_permissions_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+resource}:testIamPermissions', options)
          command.request_representation = Google::Apis::ServicemanagementV1::TestIamPermissionsRequest::Representation
          command.request_object = test_iam_permissions_request_object
          command.response_representation = Google::Apis::ServicemanagementV1::TestIamPermissionsResponse::Representation
          command.response_class = Google::Apis::ServicemanagementV1::TestIamPermissionsResponse
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new service configuration rollout. Based on rollout, the
        # Google Service Management will roll out the service configurations to
        # different backend services. For example, the logging configuration will be
        # pushed to Google Cloud Logging.
        # Please note that any previous pending and running Rollouts and associated
        # Operations will be automatically cancelled so that the latest Rollout will
        # not be blocked by previous Rollouts.
        # Only the 100 most recent (in any state) and the last 10 successful (if not
        # already part of the set of 100 most recent) rollouts are kept for each
        # service. The rest will be deleted eventually.
        # Operation<response: Rollout>
        # @param [String] service_name
        #   Required. The name of the service.  See the [overview](/service-management/
        #   overview)
        #   for naming requirements.  For example: `example.googleapis.com`.
        # @param [Google::Apis::ServicemanagementV1::Rollout] rollout_object
        # @param [String] base_rollout_id
        #   Unimplemented. Do not use this feature until this comment is removed.
        #   The rollout id that rollout to be created based on.
        #   Rollout should be constructed based on current successful rollout, this
        #   field indicates the current successful rollout id that new rollout based on
        #   to construct, if current successful rollout changed when server receives
        #   the request, request will be rejected for safety.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServicemanagementV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServicemanagementV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_service_rollout(service_name, rollout_object = nil, base_rollout_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/services/{serviceName}/rollouts', options)
          command.request_representation = Google::Apis::ServicemanagementV1::Rollout::Representation
          command.request_object = rollout_object
          command.response_representation = Google::Apis::ServicemanagementV1::Operation::Representation
          command.response_class = Google::Apis::ServicemanagementV1::Operation
          command.params['serviceName'] = service_name unless service_name.nil?
          command.query['baseRolloutId'] = base_rollout_id unless base_rollout_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a service configuration rollout.
        # @param [String] service_name
        #   Required. The name of the service.  See the [overview](/service-management/
        #   overview)
        #   for naming requirements.  For example: `example.googleapis.com`.
        # @param [String] rollout_id
        #   Required. The id of the rollout resource.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServicemanagementV1::Rollout] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServicemanagementV1::Rollout]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_service_rollout(service_name, rollout_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/services/{serviceName}/rollouts/{rolloutId}', options)
          command.response_representation = Google::Apis::ServicemanagementV1::Rollout::Representation
          command.response_class = Google::Apis::ServicemanagementV1::Rollout
          command.params['serviceName'] = service_name unless service_name.nil?
          command.params['rolloutId'] = rollout_id unless rollout_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the history of the service configuration rollouts for a managed
        # service, from the newest to the oldest.
        # @param [String] service_name
        #   Required. The name of the service.  See the [overview](/service-management/
        #   overview)
        #   for naming requirements.  For example: `example.googleapis.com`.
        # @param [String] filter
        #   Required. Use `filter` to return subset of rollouts.
        #   The following filters are supported:
        #   -- To limit the results to only those in
        #   [status](google.api.servicemanagement.v1.RolloutStatus) 'SUCCESS',
        #   use filter='status=SUCCESS'
        #   -- To limit the results to those in
        #   [status](google.api.servicemanagement.v1.RolloutStatus) 'CANCELLED'
        #   or 'FAILED', use filter='status=CANCELLED OR status=FAILED'
        # @param [Fixnum] page_size
        #   The max number of items to include in the response list. Page size is 50
        #   if not specified. Maximum value is 100.
        # @param [String] page_token
        #   The token of the page to retrieve.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServicemanagementV1::ListServiceRolloutsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServicemanagementV1::ListServiceRolloutsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_service_rollouts(service_name, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/services/{serviceName}/rollouts', options)
          command.response_representation = Google::Apis::ServicemanagementV1::ListServiceRolloutsResponse::Representation
          command.response_class = Google::Apis::ServicemanagementV1::ListServiceRolloutsResponse
          command.params['serviceName'] = service_name unless service_name.nil?
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
