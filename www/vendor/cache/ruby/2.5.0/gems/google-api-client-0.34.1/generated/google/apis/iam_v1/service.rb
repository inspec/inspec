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
    module IamV1
      # Identity and Access Management (IAM) API
      #
      # Manages identity and access control for Google Cloud Platform resources,
      #  including the creation of service accounts, which you can use to authenticate
      #  to Google and make API calls.
      #
      # @example
      #    require 'google/apis/iam_v1'
      #
      #    Iam = Google::Apis::IamV1 # Alias the module
      #    service = Iam::IamService.new
      #
      # @see https://cloud.google.com/iam/
      class IamService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://iam.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Lints a Cloud IAM policy object or its sub fields. Currently supports
        # google.iam.v1.Policy, google.iam.v1.Binding and
        # google.iam.v1.Binding.condition.
        # Each lint operation consists of multiple lint validation units.
        # Validation units have the following properties:
        # - Each unit inspects the input object in regard to a particular
        # linting aspect and issues a google.iam.admin.v1.LintResult
        # disclosing the result.
        # - Domain of discourse of each unit can be either
        # google.iam.v1.Policy, google.iam.v1.Binding, or
        # google.iam.v1.Binding.condition depending on the purpose of the
        # validation.
        # - A unit may require additional data (like the list of all possible
        # enumerable values of a particular attribute used in the policy instance)
        # which shall be provided by the caller. Refer to the comments of
        # google.iam.admin.v1.LintPolicyRequest.context for more details.
        # The set of applicable validation units is determined by the Cloud IAM
        # server and is not configurable.
        # Regardless of any lint issues or their severities, successful calls to
        # `lintPolicy` return an HTTP 200 OK status code.
        # @param [Google::Apis::IamV1::LintPolicyRequest] lint_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::LintPolicyResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::LintPolicyResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def lint_iam_policy_policy(lint_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/iamPolicies:lintPolicy', options)
          command.request_representation = Google::Apis::IamV1::LintPolicyRequest::Representation
          command.request_object = lint_policy_request_object
          command.response_representation = Google::Apis::IamV1::LintPolicyResponse::Representation
          command.response_class = Google::Apis::IamV1::LintPolicyResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of services that support service level audit logging
        # configuration for the given resource.
        # @param [Google::Apis::IamV1::QueryAuditableServicesRequest] query_auditable_services_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::QueryAuditableServicesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::QueryAuditableServicesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def query_iam_policy_auditable_services(query_auditable_services_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/iamPolicies:queryAuditableServices', options)
          command.request_representation = Google::Apis::IamV1::QueryAuditableServicesRequest::Representation
          command.request_object = query_auditable_services_request_object
          command.response_representation = Google::Apis::IamV1::QueryAuditableServicesResponse::Representation
          command.response_class = Google::Apis::IamV1::QueryAuditableServicesResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new Role.
        # @param [String] parent
        #   The `parent` parameter's value depends on the target resource for the
        #   request, namely
        #   [`projects`](/iam/reference/rest/v1/projects.roles) or
        #   [`organizations`](/iam/reference/rest/v1/organizations.roles). Each
        #   resource type's `parent` value format is described below:
        #   * [`projects.roles.create()`](/iam/reference/rest/v1/projects.roles/create):
        #   `projects/`PROJECT_ID``. This method creates project-level
        #   [custom roles](/iam/docs/understanding-custom-roles).
        #   Example request URL:
        #   `https://iam.googleapis.com/v1/projects/`PROJECT_ID`/roles`
        #   * [`organizations.roles.create()`](/iam/reference/rest/v1/organizations.roles/
        #   create):
        #   `organizations/`ORGANIZATION_ID``. This method creates organization-level
        #   [custom roles](/iam/docs/understanding-custom-roles). Example request
        #   URL:
        #   `https://iam.googleapis.com/v1/organizations/`ORGANIZATION_ID`/roles`
        #   Note: Wildcard (*) values are invalid; you must specify a complete project
        #   ID or organization ID.
        # @param [Google::Apis::IamV1::CreateRoleRequest] create_role_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::Role] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::Role]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_organization_role(parent, create_role_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}/roles', options)
          command.request_representation = Google::Apis::IamV1::CreateRoleRequest::Representation
          command.request_object = create_role_request_object
          command.response_representation = Google::Apis::IamV1::Role::Representation
          command.response_class = Google::Apis::IamV1::Role
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Soft deletes a role. The role is suspended and cannot be used to create new
        # IAM Policy Bindings.
        # The Role will not be included in `ListRoles()` unless `show_deleted` is set
        # in the `ListRolesRequest`. The Role contains the deleted boolean set.
        # Existing Bindings remains, but are inactive. The Role can be undeleted
        # within 7 days. After 7 days the Role is deleted and all Bindings associated
        # with the role are removed.
        # @param [String] name
        #   The `name` parameter's value depends on the target resource for the
        #   request, namely
        #   [`projects`](/iam/reference/rest/v1/projects.roles) or
        #   [`organizations`](/iam/reference/rest/v1/organizations.roles). Each
        #   resource type's `name` value format is described below:
        #   * [`projects.roles.delete()`](/iam/reference/rest/v1/projects.roles/delete):
        #   `projects/`PROJECT_ID`/roles/`CUSTOM_ROLE_ID``. This method deletes only
        #   [custom roles](/iam/docs/understanding-custom-roles) that have been
        #   created at the project level. Example request URL:
        #   `https://iam.googleapis.com/v1/projects/`PROJECT_ID`/roles/`CUSTOM_ROLE_ID``
        #   * [`organizations.roles.delete()`](/iam/reference/rest/v1/organizations.roles/
        #   delete):
        #   `organizations/`ORGANIZATION_ID`/roles/`CUSTOM_ROLE_ID``. This method
        #   deletes only [custom roles](/iam/docs/understanding-custom-roles) that
        #   have been created at the organization level. Example request URL:
        #   `https://iam.googleapis.com/v1/organizations/`ORGANIZATION_ID`/roles/`
        #   CUSTOM_ROLE_ID``
        #   Note: Wildcard (*) values are invalid; you must specify a complete project
        #   ID or organization ID.
        # @param [String] etag
        #   Used to perform a consistent read-modify-write.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::Role] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::Role]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_organization_role(name, etag: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/{+name}', options)
          command.response_representation = Google::Apis::IamV1::Role::Representation
          command.response_class = Google::Apis::IamV1::Role
          command.params['name'] = name unless name.nil?
          command.query['etag'] = etag unless etag.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a Role definition.
        # @param [String] name
        #   The `name` parameter's value depends on the target resource for the
        #   request, namely
        #   [`roles`](/iam/reference/rest/v1/roles),
        #   [`projects`](/iam/reference/rest/v1/projects.roles), or
        #   [`organizations`](/iam/reference/rest/v1/organizations.roles). Each
        #   resource type's `name` value format is described below:
        #   * [`roles.get()`](/iam/reference/rest/v1/roles/get): `roles/`ROLE_NAME``.
        #   This method returns results from all
        #   [predefined roles](/iam/docs/understanding-roles#predefined_roles) in
        #   Cloud IAM. Example request URL:
        #   `https://iam.googleapis.com/v1/roles/`ROLE_NAME``
        #   * [`projects.roles.get()`](/iam/reference/rest/v1/projects.roles/get):
        #   `projects/`PROJECT_ID`/roles/`CUSTOM_ROLE_ID``. This method returns only
        #   [custom roles](/iam/docs/understanding-custom-roles) that have been
        #   created at the project level. Example request URL:
        #   `https://iam.googleapis.com/v1/projects/`PROJECT_ID`/roles/`CUSTOM_ROLE_ID``
        #   * [`organizations.roles.get()`](/iam/reference/rest/v1/organizations.roles/get)
        #   :
        #   `organizations/`ORGANIZATION_ID`/roles/`CUSTOM_ROLE_ID``. This method
        #   returns only [custom roles](/iam/docs/understanding-custom-roles) that
        #   have been created at the organization level. Example request URL:
        #   `https://iam.googleapis.com/v1/organizations/`ORGANIZATION_ID`/roles/`
        #   CUSTOM_ROLE_ID``
        #   Note: Wildcard (*) values are invalid; you must specify a complete project
        #   ID or organization ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::Role] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::Role]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_organization_role(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::IamV1::Role::Representation
          command.response_class = Google::Apis::IamV1::Role
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the Roles defined on a resource.
        # @param [String] parent
        #   The `parent` parameter's value depends on the target resource for the
        #   request, namely
        #   [`roles`](/iam/reference/rest/v1/roles),
        #   [`projects`](/iam/reference/rest/v1/projects.roles), or
        #   [`organizations`](/iam/reference/rest/v1/organizations.roles). Each
        #   resource type's `parent` value format is described below:
        #   * [`roles.list()`](/iam/reference/rest/v1/roles/list): An empty string.
        #   This method doesn't require a resource; it simply returns all
        #   [predefined roles](/iam/docs/understanding-roles#predefined_roles) in
        #   Cloud IAM. Example request URL:
        #   `https://iam.googleapis.com/v1/roles`
        #   * [`projects.roles.list()`](/iam/reference/rest/v1/projects.roles/list):
        #   `projects/`PROJECT_ID``. This method lists all project-level
        #   [custom roles](/iam/docs/understanding-custom-roles).
        #   Example request URL:
        #   `https://iam.googleapis.com/v1/projects/`PROJECT_ID`/roles`
        #   * [`organizations.roles.list()`](/iam/reference/rest/v1/organizations.roles/
        #   list):
        #   `organizations/`ORGANIZATION_ID``. This method lists all
        #   organization-level [custom roles](/iam/docs/understanding-custom-roles).
        #   Example request URL:
        #   `https://iam.googleapis.com/v1/organizations/`ORGANIZATION_ID`/roles`
        #   Note: Wildcard (*) values are invalid; you must specify a complete project
        #   ID or organization ID.
        # @param [Fixnum] page_size
        #   Optional limit on the number of roles to include in the response.
        # @param [String] page_token
        #   Optional pagination token returned in an earlier ListRolesResponse.
        # @param [Boolean] show_deleted
        #   Include Roles that have been deleted.
        # @param [String] view
        #   Optional view for the returned Role objects. When `FULL` is specified,
        #   the `includedPermissions` field is returned, which includes a list of all
        #   permissions in the role. The default value is `BASIC`, which does not
        #   return the `includedPermissions` field.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::ListRolesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::ListRolesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_organization_roles(parent, page_size: nil, page_token: nil, show_deleted: nil, view: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+parent}/roles', options)
          command.response_representation = Google::Apis::IamV1::ListRolesResponse::Representation
          command.response_class = Google::Apis::IamV1::ListRolesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['showDeleted'] = show_deleted unless show_deleted.nil?
          command.query['view'] = view unless view.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a Role definition.
        # @param [String] name
        #   The `name` parameter's value depends on the target resource for the
        #   request, namely
        #   [`projects`](/iam/reference/rest/v1/projects.roles) or
        #   [`organizations`](/iam/reference/rest/v1/organizations.roles). Each
        #   resource type's `name` value format is described below:
        #   * [`projects.roles.patch()`](/iam/reference/rest/v1/projects.roles/patch):
        #   `projects/`PROJECT_ID`/roles/`CUSTOM_ROLE_ID``. This method updates only
        #   [custom roles](/iam/docs/understanding-custom-roles) that have been
        #   created at the project level. Example request URL:
        #   `https://iam.googleapis.com/v1/projects/`PROJECT_ID`/roles/`CUSTOM_ROLE_ID``
        #   * [`organizations.roles.patch()`](/iam/reference/rest/v1/organizations.roles/
        #   patch):
        #   `organizations/`ORGANIZATION_ID`/roles/`CUSTOM_ROLE_ID``. This method
        #   updates only [custom roles](/iam/docs/understanding-custom-roles) that
        #   have been created at the organization level. Example request URL:
        #   `https://iam.googleapis.com/v1/organizations/`ORGANIZATION_ID`/roles/`
        #   CUSTOM_ROLE_ID``
        #   Note: Wildcard (*) values are invalid; you must specify a complete project
        #   ID or organization ID.
        # @param [Google::Apis::IamV1::Role] role_object
        # @param [String] update_mask
        #   A mask describing which fields in the Role have changed.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::Role] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::Role]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_organization_role(name, role_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/{+name}', options)
          command.request_representation = Google::Apis::IamV1::Role::Representation
          command.request_object = role_object
          command.response_representation = Google::Apis::IamV1::Role::Representation
          command.response_class = Google::Apis::IamV1::Role
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Undelete a Role, bringing it back in its previous state.
        # @param [String] name
        #   The `name` parameter's value depends on the target resource for the
        #   request, namely
        #   [`projects`](/iam/reference/rest/v1/projects.roles) or
        #   [`organizations`](/iam/reference/rest/v1/organizations.roles). Each
        #   resource type's `name` value format is described below:
        #   * [`projects.roles.undelete()`](/iam/reference/rest/v1/projects.roles/undelete)
        #   :
        #   `projects/`PROJECT_ID`/roles/`CUSTOM_ROLE_ID``. This method undeletes
        #   only [custom roles](/iam/docs/understanding-custom-roles) that have been
        #   created at the project level. Example request URL:
        #   `https://iam.googleapis.com/v1/projects/`PROJECT_ID`/roles/`CUSTOM_ROLE_ID``
        #   * [`organizations.roles.undelete()`](/iam/reference/rest/v1/organizations.
        #   roles/undelete):
        #   `organizations/`ORGANIZATION_ID`/roles/`CUSTOM_ROLE_ID``. This method
        #   undeletes only [custom roles](/iam/docs/understanding-custom-roles) that
        #   have been created at the organization level. Example request URL:
        #   `https://iam.googleapis.com/v1/organizations/`ORGANIZATION_ID`/roles/`
        #   CUSTOM_ROLE_ID``
        #   Note: Wildcard (*) values are invalid; you must specify a complete project
        #   ID or organization ID.
        # @param [Google::Apis::IamV1::UndeleteRoleRequest] undelete_role_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::Role] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::Role]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def undelete_organization_role(name, undelete_role_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+name}:undelete', options)
          command.request_representation = Google::Apis::IamV1::UndeleteRoleRequest::Representation
          command.request_object = undelete_role_request_object
          command.response_representation = Google::Apis::IamV1::Role::Representation
          command.response_class = Google::Apis::IamV1::Role
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the permissions testable on a resource.
        # A permission is testable if it can be tested for an identity on a resource.
        # @param [Google::Apis::IamV1::QueryTestablePermissionsRequest] query_testable_permissions_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::QueryTestablePermissionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::QueryTestablePermissionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def query_testable_permissions(query_testable_permissions_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/permissions:queryTestablePermissions', options)
          command.request_representation = Google::Apis::IamV1::QueryTestablePermissionsRequest::Representation
          command.request_object = query_testable_permissions_request_object
          command.response_representation = Google::Apis::IamV1::QueryTestablePermissionsResponse::Representation
          command.response_class = Google::Apis::IamV1::QueryTestablePermissionsResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new Role.
        # @param [String] parent
        #   The `parent` parameter's value depends on the target resource for the
        #   request, namely
        #   [`projects`](/iam/reference/rest/v1/projects.roles) or
        #   [`organizations`](/iam/reference/rest/v1/organizations.roles). Each
        #   resource type's `parent` value format is described below:
        #   * [`projects.roles.create()`](/iam/reference/rest/v1/projects.roles/create):
        #   `projects/`PROJECT_ID``. This method creates project-level
        #   [custom roles](/iam/docs/understanding-custom-roles).
        #   Example request URL:
        #   `https://iam.googleapis.com/v1/projects/`PROJECT_ID`/roles`
        #   * [`organizations.roles.create()`](/iam/reference/rest/v1/organizations.roles/
        #   create):
        #   `organizations/`ORGANIZATION_ID``. This method creates organization-level
        #   [custom roles](/iam/docs/understanding-custom-roles). Example request
        #   URL:
        #   `https://iam.googleapis.com/v1/organizations/`ORGANIZATION_ID`/roles`
        #   Note: Wildcard (*) values are invalid; you must specify a complete project
        #   ID or organization ID.
        # @param [Google::Apis::IamV1::CreateRoleRequest] create_role_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::Role] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::Role]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_role(parent, create_role_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}/roles', options)
          command.request_representation = Google::Apis::IamV1::CreateRoleRequest::Representation
          command.request_object = create_role_request_object
          command.response_representation = Google::Apis::IamV1::Role::Representation
          command.response_class = Google::Apis::IamV1::Role
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Soft deletes a role. The role is suspended and cannot be used to create new
        # IAM Policy Bindings.
        # The Role will not be included in `ListRoles()` unless `show_deleted` is set
        # in the `ListRolesRequest`. The Role contains the deleted boolean set.
        # Existing Bindings remains, but are inactive. The Role can be undeleted
        # within 7 days. After 7 days the Role is deleted and all Bindings associated
        # with the role are removed.
        # @param [String] name
        #   The `name` parameter's value depends on the target resource for the
        #   request, namely
        #   [`projects`](/iam/reference/rest/v1/projects.roles) or
        #   [`organizations`](/iam/reference/rest/v1/organizations.roles). Each
        #   resource type's `name` value format is described below:
        #   * [`projects.roles.delete()`](/iam/reference/rest/v1/projects.roles/delete):
        #   `projects/`PROJECT_ID`/roles/`CUSTOM_ROLE_ID``. This method deletes only
        #   [custom roles](/iam/docs/understanding-custom-roles) that have been
        #   created at the project level. Example request URL:
        #   `https://iam.googleapis.com/v1/projects/`PROJECT_ID`/roles/`CUSTOM_ROLE_ID``
        #   * [`organizations.roles.delete()`](/iam/reference/rest/v1/organizations.roles/
        #   delete):
        #   `organizations/`ORGANIZATION_ID`/roles/`CUSTOM_ROLE_ID``. This method
        #   deletes only [custom roles](/iam/docs/understanding-custom-roles) that
        #   have been created at the organization level. Example request URL:
        #   `https://iam.googleapis.com/v1/organizations/`ORGANIZATION_ID`/roles/`
        #   CUSTOM_ROLE_ID``
        #   Note: Wildcard (*) values are invalid; you must specify a complete project
        #   ID or organization ID.
        # @param [String] etag
        #   Used to perform a consistent read-modify-write.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::Role] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::Role]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_role(name, etag: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/{+name}', options)
          command.response_representation = Google::Apis::IamV1::Role::Representation
          command.response_class = Google::Apis::IamV1::Role
          command.params['name'] = name unless name.nil?
          command.query['etag'] = etag unless etag.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a Role definition.
        # @param [String] name
        #   The `name` parameter's value depends on the target resource for the
        #   request, namely
        #   [`roles`](/iam/reference/rest/v1/roles),
        #   [`projects`](/iam/reference/rest/v1/projects.roles), or
        #   [`organizations`](/iam/reference/rest/v1/organizations.roles). Each
        #   resource type's `name` value format is described below:
        #   * [`roles.get()`](/iam/reference/rest/v1/roles/get): `roles/`ROLE_NAME``.
        #   This method returns results from all
        #   [predefined roles](/iam/docs/understanding-roles#predefined_roles) in
        #   Cloud IAM. Example request URL:
        #   `https://iam.googleapis.com/v1/roles/`ROLE_NAME``
        #   * [`projects.roles.get()`](/iam/reference/rest/v1/projects.roles/get):
        #   `projects/`PROJECT_ID`/roles/`CUSTOM_ROLE_ID``. This method returns only
        #   [custom roles](/iam/docs/understanding-custom-roles) that have been
        #   created at the project level. Example request URL:
        #   `https://iam.googleapis.com/v1/projects/`PROJECT_ID`/roles/`CUSTOM_ROLE_ID``
        #   * [`organizations.roles.get()`](/iam/reference/rest/v1/organizations.roles/get)
        #   :
        #   `organizations/`ORGANIZATION_ID`/roles/`CUSTOM_ROLE_ID``. This method
        #   returns only [custom roles](/iam/docs/understanding-custom-roles) that
        #   have been created at the organization level. Example request URL:
        #   `https://iam.googleapis.com/v1/organizations/`ORGANIZATION_ID`/roles/`
        #   CUSTOM_ROLE_ID``
        #   Note: Wildcard (*) values are invalid; you must specify a complete project
        #   ID or organization ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::Role] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::Role]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_role(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::IamV1::Role::Representation
          command.response_class = Google::Apis::IamV1::Role
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the Roles defined on a resource.
        # @param [String] parent
        #   The `parent` parameter's value depends on the target resource for the
        #   request, namely
        #   [`roles`](/iam/reference/rest/v1/roles),
        #   [`projects`](/iam/reference/rest/v1/projects.roles), or
        #   [`organizations`](/iam/reference/rest/v1/organizations.roles). Each
        #   resource type's `parent` value format is described below:
        #   * [`roles.list()`](/iam/reference/rest/v1/roles/list): An empty string.
        #   This method doesn't require a resource; it simply returns all
        #   [predefined roles](/iam/docs/understanding-roles#predefined_roles) in
        #   Cloud IAM. Example request URL:
        #   `https://iam.googleapis.com/v1/roles`
        #   * [`projects.roles.list()`](/iam/reference/rest/v1/projects.roles/list):
        #   `projects/`PROJECT_ID``. This method lists all project-level
        #   [custom roles](/iam/docs/understanding-custom-roles).
        #   Example request URL:
        #   `https://iam.googleapis.com/v1/projects/`PROJECT_ID`/roles`
        #   * [`organizations.roles.list()`](/iam/reference/rest/v1/organizations.roles/
        #   list):
        #   `organizations/`ORGANIZATION_ID``. This method lists all
        #   organization-level [custom roles](/iam/docs/understanding-custom-roles).
        #   Example request URL:
        #   `https://iam.googleapis.com/v1/organizations/`ORGANIZATION_ID`/roles`
        #   Note: Wildcard (*) values are invalid; you must specify a complete project
        #   ID or organization ID.
        # @param [Fixnum] page_size
        #   Optional limit on the number of roles to include in the response.
        # @param [String] page_token
        #   Optional pagination token returned in an earlier ListRolesResponse.
        # @param [Boolean] show_deleted
        #   Include Roles that have been deleted.
        # @param [String] view
        #   Optional view for the returned Role objects. When `FULL` is specified,
        #   the `includedPermissions` field is returned, which includes a list of all
        #   permissions in the role. The default value is `BASIC`, which does not
        #   return the `includedPermissions` field.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::ListRolesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::ListRolesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_roles(parent, page_size: nil, page_token: nil, show_deleted: nil, view: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+parent}/roles', options)
          command.response_representation = Google::Apis::IamV1::ListRolesResponse::Representation
          command.response_class = Google::Apis::IamV1::ListRolesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['showDeleted'] = show_deleted unless show_deleted.nil?
          command.query['view'] = view unless view.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a Role definition.
        # @param [String] name
        #   The `name` parameter's value depends on the target resource for the
        #   request, namely
        #   [`projects`](/iam/reference/rest/v1/projects.roles) or
        #   [`organizations`](/iam/reference/rest/v1/organizations.roles). Each
        #   resource type's `name` value format is described below:
        #   * [`projects.roles.patch()`](/iam/reference/rest/v1/projects.roles/patch):
        #   `projects/`PROJECT_ID`/roles/`CUSTOM_ROLE_ID``. This method updates only
        #   [custom roles](/iam/docs/understanding-custom-roles) that have been
        #   created at the project level. Example request URL:
        #   `https://iam.googleapis.com/v1/projects/`PROJECT_ID`/roles/`CUSTOM_ROLE_ID``
        #   * [`organizations.roles.patch()`](/iam/reference/rest/v1/organizations.roles/
        #   patch):
        #   `organizations/`ORGANIZATION_ID`/roles/`CUSTOM_ROLE_ID``. This method
        #   updates only [custom roles](/iam/docs/understanding-custom-roles) that
        #   have been created at the organization level. Example request URL:
        #   `https://iam.googleapis.com/v1/organizations/`ORGANIZATION_ID`/roles/`
        #   CUSTOM_ROLE_ID``
        #   Note: Wildcard (*) values are invalid; you must specify a complete project
        #   ID or organization ID.
        # @param [Google::Apis::IamV1::Role] role_object
        # @param [String] update_mask
        #   A mask describing which fields in the Role have changed.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::Role] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::Role]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_role(name, role_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/{+name}', options)
          command.request_representation = Google::Apis::IamV1::Role::Representation
          command.request_object = role_object
          command.response_representation = Google::Apis::IamV1::Role::Representation
          command.response_class = Google::Apis::IamV1::Role
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Undelete a Role, bringing it back in its previous state.
        # @param [String] name
        #   The `name` parameter's value depends on the target resource for the
        #   request, namely
        #   [`projects`](/iam/reference/rest/v1/projects.roles) or
        #   [`organizations`](/iam/reference/rest/v1/organizations.roles). Each
        #   resource type's `name` value format is described below:
        #   * [`projects.roles.undelete()`](/iam/reference/rest/v1/projects.roles/undelete)
        #   :
        #   `projects/`PROJECT_ID`/roles/`CUSTOM_ROLE_ID``. This method undeletes
        #   only [custom roles](/iam/docs/understanding-custom-roles) that have been
        #   created at the project level. Example request URL:
        #   `https://iam.googleapis.com/v1/projects/`PROJECT_ID`/roles/`CUSTOM_ROLE_ID``
        #   * [`organizations.roles.undelete()`](/iam/reference/rest/v1/organizations.
        #   roles/undelete):
        #   `organizations/`ORGANIZATION_ID`/roles/`CUSTOM_ROLE_ID``. This method
        #   undeletes only [custom roles](/iam/docs/understanding-custom-roles) that
        #   have been created at the organization level. Example request URL:
        #   `https://iam.googleapis.com/v1/organizations/`ORGANIZATION_ID`/roles/`
        #   CUSTOM_ROLE_ID``
        #   Note: Wildcard (*) values are invalid; you must specify a complete project
        #   ID or organization ID.
        # @param [Google::Apis::IamV1::UndeleteRoleRequest] undelete_role_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::Role] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::Role]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def undelete_project_role(name, undelete_role_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+name}:undelete', options)
          command.request_representation = Google::Apis::IamV1::UndeleteRoleRequest::Representation
          command.request_object = undelete_role_request_object
          command.response_representation = Google::Apis::IamV1::Role::Representation
          command.response_class = Google::Apis::IamV1::Role
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a ServiceAccount
        # and returns it.
        # @param [String] name
        #   Required. The resource name of the project associated with the service
        #   accounts, such as `projects/my-project-123`.
        # @param [Google::Apis::IamV1::CreateServiceAccountRequest] create_service_account_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::ServiceAccount] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::ServiceAccount]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_service_account(name, create_service_account_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+name}/serviceAccounts', options)
          command.request_representation = Google::Apis::IamV1::CreateServiceAccountRequest::Representation
          command.request_object = create_service_account_request_object
          command.response_representation = Google::Apis::IamV1::ServiceAccount::Representation
          command.response_class = Google::Apis::IamV1::ServiceAccount
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a ServiceAccount.
        # @param [String] name
        #   The resource name of the service account in the following format:
        #   `projects/`PROJECT_ID`/serviceAccounts/`ACCOUNT``.
        #   Using `-` as a wildcard for the `PROJECT_ID` will infer the project from
        #   the account. The `ACCOUNT` value can be the `email` address or the
        #   `unique_id` of the service account.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_service_account(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/{+name}', options)
          command.response_representation = Google::Apis::IamV1::Empty::Representation
          command.response_class = Google::Apis::IamV1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # DisableServiceAccount is currently in the alpha launch stage.
        # Disables a ServiceAccount,
        # which immediately prevents the service account from authenticating and
        # gaining access to APIs.
        # Disabled service accounts can be safely restored by using
        # EnableServiceAccount at any point. Deleted service accounts cannot be
        # restored using this method.
        # Disabling a service account that is bound to VMs, Apps, Functions, or
        # other jobs will cause those jobs to lose access to resources if they are
        # using the disabled service account.
        # To improve reliability of your services and avoid unexpected outages, it
        # is recommended to first disable a service account rather than delete it.
        # After disabling the service account, wait at least 24 hours to verify there
        # are no unintended consequences, and then delete the service account.
        # @param [String] name
        #   The resource name of the service account in the following format:
        #   `projects/`PROJECT_ID`/serviceAccounts/`ACCOUNT``.
        #   Using `-` as a wildcard for the `PROJECT_ID` will infer the project from
        #   the account. The `ACCOUNT` value can be the `email` address or the
        #   `unique_id` of the service account.
        # @param [Google::Apis::IamV1::DisableServiceAccountRequest] disable_service_account_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def disable_service_account(name, disable_service_account_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+name}:disable', options)
          command.request_representation = Google::Apis::IamV1::DisableServiceAccountRequest::Representation
          command.request_object = disable_service_account_request_object
          command.response_representation = Google::Apis::IamV1::Empty::Representation
          command.response_class = Google::Apis::IamV1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # EnableServiceAccount is currently in the alpha launch stage.
        # Restores a disabled ServiceAccount
        # that has been manually disabled by using DisableServiceAccount. Service
        # accounts that have been disabled by other means or for other reasons,
        # such as abuse, cannot be restored using this method.
        # EnableServiceAccount will have no effect on a service account that is
        # not disabled.  Enabling an already enabled service account will have no
        # effect.
        # @param [String] name
        #   The resource name of the service account in the following format:
        #   `projects/`PROJECT_ID`/serviceAccounts/`ACCOUNT``.
        #   Using `-` as a wildcard for the `PROJECT_ID` will infer the project from
        #   the account. The `ACCOUNT` value can be the `email` address or the
        #   `unique_id` of the service account.
        # @param [Google::Apis::IamV1::EnableServiceAccountRequest] enable_service_account_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def enable_service_account(name, enable_service_account_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+name}:enable', options)
          command.request_representation = Google::Apis::IamV1::EnableServiceAccountRequest::Representation
          command.request_object = enable_service_account_request_object
          command.response_representation = Google::Apis::IamV1::Empty::Representation
          command.response_class = Google::Apis::IamV1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a ServiceAccount.
        # @param [String] name
        #   The resource name of the service account in the following format:
        #   `projects/`PROJECT_ID`/serviceAccounts/`ACCOUNT``.
        #   Using `-` as a wildcard for the `PROJECT_ID` will infer the project from
        #   the account. The `ACCOUNT` value can be the `email` address or the
        #   `unique_id` of the service account.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::ServiceAccount] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::ServiceAccount]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_service_account(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::IamV1::ServiceAccount::Representation
          command.response_class = Google::Apis::IamV1::ServiceAccount
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the Cloud IAM access control policy for a
        # ServiceAccount.
        # Note: Service accounts are both
        # [resources and
        # identities](/iam/docs/service-accounts#service_account_permissions). This
        # method treats the service account as a resource. It returns the Cloud IAM
        # policy that reflects what members have access to the service account.
        # This method does not return what resources the service account has access
        # to. To see if a service account has access to a resource, call the
        # `getIamPolicy` method on the target resource. For example, to view grants
        # for a project, call the
        # [projects.getIamPolicy](/resource-manager/reference/rest/v1/projects/
        # getIamPolicy)
        # method.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Fixnum] options_requested_policy_version
        #   Optional. The policy format version to be returned.
        #   Valid values are 0, 1, and 3. Requests specifying an invalid value will be
        #   rejected.
        #   Requests for policies with any conditional bindings must specify version 3.
        #   Policies without any conditional bindings may specify any valid value or
        #   leave the field unset.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_service_account_iam_policy(resource, options_requested_policy_version: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+resource}:getIamPolicy', options)
          command.response_representation = Google::Apis::IamV1::Policy::Representation
          command.response_class = Google::Apis::IamV1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['options.requestedPolicyVersion'] = options_requested_policy_version unless options_requested_policy_version.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists ServiceAccounts for a project.
        # @param [String] name
        #   Required. The resource name of the project associated with the service
        #   accounts, such as `projects/my-project-123`.
        # @param [Fixnum] page_size
        #   Optional limit on the number of service accounts to include in the
        #   response. Further accounts can subsequently be obtained by including the
        #   ListServiceAccountsResponse.next_page_token
        #   in a subsequent request.
        # @param [String] page_token
        #   Optional pagination token returned in an earlier
        #   ListServiceAccountsResponse.next_page_token.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::ListServiceAccountsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::ListServiceAccountsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_service_accounts(name, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}/serviceAccounts', options)
          command.response_representation = Google::Apis::IamV1::ListServiceAccountsResponse::Representation
          command.response_class = Google::Apis::IamV1::ListServiceAccountsResponse
          command.params['name'] = name unless name.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Patches a ServiceAccount.
        # Currently, only the following fields are updatable:
        # `display_name` and `description`.
        # Only fields specified in the request are guaranteed to be returned in
        # the response. Other fields in the response may be empty.
        # Note: The field mask is required.
        # @param [String] name
        #   The resource name of the service account in the following format:
        #   `projects/`PROJECT_ID`/serviceAccounts/`ACCOUNT``.
        #   Requests using `-` as a wildcard for the `PROJECT_ID` will infer the
        #   project from the `account` and the `ACCOUNT` value can be the `email`
        #   address or the `unique_id` of the service account.
        #   In responses the resource name will always be in the format
        #   `projects/`PROJECT_ID`/serviceAccounts/`ACCOUNT``.
        # @param [Google::Apis::IamV1::PatchServiceAccountRequest] patch_service_account_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::ServiceAccount] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::ServiceAccount]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_service_account(name, patch_service_account_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/{+name}', options)
          command.request_representation = Google::Apis::IamV1::PatchServiceAccountRequest::Representation
          command.request_object = patch_service_account_request_object
          command.response_representation = Google::Apis::IamV1::ServiceAccount::Representation
          command.response_class = Google::Apis::IamV1::ServiceAccount
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets the Cloud IAM access control policy for a
        # ServiceAccount.
        # Note: Service accounts are both
        # [resources and
        # identities](/iam/docs/service-accounts#service_account_permissions). This
        # method treats the service account as a resource. Use it to grant members
        # access to the service account, such as when they need to impersonate it.
        # This method does not grant the service account access to other resources,
        # such as projects. To grant a service account access to resources, include
        # the service account in the Cloud IAM policy for the desired resource, then
        # call the appropriate `setIamPolicy` method on the target resource. For
        # example, to grant a service account access to a project, call the
        # [projects.setIamPolicy](/resource-manager/reference/rest/v1/projects/
        # setIamPolicy)
        # method.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being specified.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::IamV1::SetIamPolicyRequest] set_iam_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def set_service_account_iam_policy(resource, set_iam_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+resource}:setIamPolicy', options)
          command.request_representation = Google::Apis::IamV1::SetIamPolicyRequest::Representation
          command.request_object = set_iam_policy_request_object
          command.response_representation = Google::Apis::IamV1::Policy::Representation
          command.response_class = Google::Apis::IamV1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # **Note**: This method is in the process of being deprecated. Call the
        # [`signBlob()`](/iam/credentials/reference/rest/v1/projects.serviceAccounts/
        # signBlob)
        # method of the Cloud IAM Service Account Credentials API instead.
        # Signs a blob using a service account's system-managed private key.
        # @param [String] name
        #   The resource name of the service account in the following format:
        #   `projects/`PROJECT_ID`/serviceAccounts/`ACCOUNT``.
        #   Using `-` as a wildcard for the `PROJECT_ID` will infer the project from
        #   the account. The `ACCOUNT` value can be the `email` address or the
        #   `unique_id` of the service account.
        # @param [Google::Apis::IamV1::SignBlobRequest] sign_blob_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::SignBlobResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::SignBlobResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def sign_service_account_blob(name, sign_blob_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+name}:signBlob', options)
          command.request_representation = Google::Apis::IamV1::SignBlobRequest::Representation
          command.request_object = sign_blob_request_object
          command.response_representation = Google::Apis::IamV1::SignBlobResponse::Representation
          command.response_class = Google::Apis::IamV1::SignBlobResponse
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # **Note**: This method is in the process of being deprecated. Call the
        # [`signJwt()`](/iam/credentials/reference/rest/v1/projects.serviceAccounts/
        # signJwt)
        # method of the Cloud IAM Service Account Credentials API instead.
        # Signs a JWT using a service account's system-managed private key.
        # If no expiry time (`exp`) is provided in the `SignJwtRequest`, IAM sets an
        # an expiry time of one hour by default. If you request an expiry time of
        # more than one hour, the request will fail.
        # @param [String] name
        #   The resource name of the service account in the following format:
        #   `projects/`PROJECT_ID`/serviceAccounts/`ACCOUNT``.
        #   Using `-` as a wildcard for the `PROJECT_ID` will infer the project from
        #   the account. The `ACCOUNT` value can be the `email` address or the
        #   `unique_id` of the service account.
        # @param [Google::Apis::IamV1::SignJwtRequest] sign_jwt_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::SignJwtResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::SignJwtResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def sign_service_account_jwt(name, sign_jwt_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+name}:signJwt', options)
          command.request_representation = Google::Apis::IamV1::SignJwtRequest::Representation
          command.request_object = sign_jwt_request_object
          command.response_representation = Google::Apis::IamV1::SignJwtResponse::Representation
          command.response_class = Google::Apis::IamV1::SignJwtResponse
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Tests the specified permissions against the IAM access control policy
        # for a ServiceAccount.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy detail is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::IamV1::TestIamPermissionsRequest] test_iam_permissions_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::TestIamPermissionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::TestIamPermissionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def test_service_account_iam_permissions(resource, test_iam_permissions_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+resource}:testIamPermissions', options)
          command.request_representation = Google::Apis::IamV1::TestIamPermissionsRequest::Representation
          command.request_object = test_iam_permissions_request_object
          command.response_representation = Google::Apis::IamV1::TestIamPermissionsResponse::Representation
          command.response_class = Google::Apis::IamV1::TestIamPermissionsResponse
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Restores a deleted ServiceAccount.
        # This is to be used as an action of last resort.  A service account may
        # not always be restorable.
        # @param [String] name
        #   The resource name of the service account in the following format:
        #   `projects/`PROJECT_ID`/serviceAccounts/`ACCOUNT_UNIQUE_ID``.
        #   Using `-` as a wildcard for the `PROJECT_ID` will infer the project from
        #   the account.
        # @param [Google::Apis::IamV1::UndeleteServiceAccountRequest] undelete_service_account_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::UndeleteServiceAccountResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::UndeleteServiceAccountResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def undelete_service_account(name, undelete_service_account_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+name}:undelete', options)
          command.request_representation = Google::Apis::IamV1::UndeleteServiceAccountRequest::Representation
          command.request_object = undelete_service_account_request_object
          command.response_representation = Google::Apis::IamV1::UndeleteServiceAccountResponse::Representation
          command.response_class = Google::Apis::IamV1::UndeleteServiceAccountResponse
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Note: This method is in the process of being deprecated. Use
        # PatchServiceAccount instead.
        # Updates a ServiceAccount.
        # Currently, only the following fields are updatable:
        # `display_name` and `description`.
        # @param [String] name
        #   The resource name of the service account in the following format:
        #   `projects/`PROJECT_ID`/serviceAccounts/`ACCOUNT``.
        #   Requests using `-` as a wildcard for the `PROJECT_ID` will infer the
        #   project from the `account` and the `ACCOUNT` value can be the `email`
        #   address or the `unique_id` of the service account.
        #   In responses the resource name will always be in the format
        #   `projects/`PROJECT_ID`/serviceAccounts/`ACCOUNT``.
        # @param [Google::Apis::IamV1::ServiceAccount] service_account_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::ServiceAccount] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::ServiceAccount]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_project_service_account(name, service_account_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v1/{+name}', options)
          command.request_representation = Google::Apis::IamV1::ServiceAccount::Representation
          command.request_object = service_account_object
          command.response_representation = Google::Apis::IamV1::ServiceAccount::Representation
          command.response_class = Google::Apis::IamV1::ServiceAccount
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a ServiceAccountKey
        # and returns it.
        # @param [String] name
        #   The resource name of the service account in the following format:
        #   `projects/`PROJECT_ID`/serviceAccounts/`ACCOUNT``.
        #   Using `-` as a wildcard for the `PROJECT_ID` will infer the project from
        #   the account. The `ACCOUNT` value can be the `email` address or the
        #   `unique_id` of the service account.
        # @param [Google::Apis::IamV1::CreateServiceAccountKeyRequest] create_service_account_key_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::ServiceAccountKey] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::ServiceAccountKey]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_service_account_key(name, create_service_account_key_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+name}/keys', options)
          command.request_representation = Google::Apis::IamV1::CreateServiceAccountKeyRequest::Representation
          command.request_object = create_service_account_key_request_object
          command.response_representation = Google::Apis::IamV1::ServiceAccountKey::Representation
          command.response_class = Google::Apis::IamV1::ServiceAccountKey
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a ServiceAccountKey.
        # @param [String] name
        #   The resource name of the service account key in the following format:
        #   `projects/`PROJECT_ID`/serviceAccounts/`ACCOUNT`/keys/`key``.
        #   Using `-` as a wildcard for the `PROJECT_ID` will infer the project from
        #   the account. The `ACCOUNT` value can be the `email` address or the
        #   `unique_id` of the service account.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_service_account_key(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/{+name}', options)
          command.response_representation = Google::Apis::IamV1::Empty::Representation
          command.response_class = Google::Apis::IamV1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the ServiceAccountKey
        # by key id.
        # @param [String] name
        #   The resource name of the service account key in the following format:
        #   `projects/`PROJECT_ID`/serviceAccounts/`ACCOUNT`/keys/`key``.
        #   Using `-` as a wildcard for the `PROJECT_ID` will infer the project from
        #   the account. The `ACCOUNT` value can be the `email` address or the
        #   `unique_id` of the service account.
        # @param [String] public_key_type
        #   The output format of the public key requested.
        #   X509_PEM is the default output format.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::ServiceAccountKey] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::ServiceAccountKey]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_service_account_key(name, public_key_type: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::IamV1::ServiceAccountKey::Representation
          command.response_class = Google::Apis::IamV1::ServiceAccountKey
          command.params['name'] = name unless name.nil?
          command.query['publicKeyType'] = public_key_type unless public_key_type.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists ServiceAccountKeys.
        # @param [String] name
        #   The resource name of the service account in the following format:
        #   `projects/`PROJECT_ID`/serviceAccounts/`ACCOUNT``.
        #   Using `-` as a wildcard for the `PROJECT_ID`, will infer the project from
        #   the account. The `ACCOUNT` value can be the `email` address or the
        #   `unique_id` of the service account.
        # @param [Array<String>, String] key_types
        #   Filters the types of keys the user wants to include in the list
        #   response. Duplicate key types are not allowed. If no key type
        #   is provided, all keys are returned.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::ListServiceAccountKeysResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::ListServiceAccountKeysResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_service_account_keys(name, key_types: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}/keys', options)
          command.response_representation = Google::Apis::IamV1::ListServiceAccountKeysResponse::Representation
          command.response_class = Google::Apis::IamV1::ListServiceAccountKeysResponse
          command.params['name'] = name unless name.nil?
          command.query['keyTypes'] = key_types unless key_types.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Upload public key for a given service account.
        # This rpc will create a
        # ServiceAccountKey that has the
        # provided public key and returns it.
        # @param [String] name
        #   The resource name of the service account in the following format:
        #   `projects/`PROJECT_ID`/serviceAccounts/`ACCOUNT``.
        #   Using `-` as a wildcard for the `PROJECT_ID` will infer the project from
        #   the account. The `ACCOUNT` value can be the `email` address or the
        #   `unique_id` of the service account.
        # @param [Google::Apis::IamV1::UploadServiceAccountKeyRequest] upload_service_account_key_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::ServiceAccountKey] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::ServiceAccountKey]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def upload_service_account_key(name, upload_service_account_key_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+name}/keys:upload', options)
          command.request_representation = Google::Apis::IamV1::UploadServiceAccountKeyRequest::Representation
          command.request_object = upload_service_account_key_request_object
          command.response_representation = Google::Apis::IamV1::ServiceAccountKey::Representation
          command.response_class = Google::Apis::IamV1::ServiceAccountKey
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a Role definition.
        # @param [String] name
        #   The `name` parameter's value depends on the target resource for the
        #   request, namely
        #   [`roles`](/iam/reference/rest/v1/roles),
        #   [`projects`](/iam/reference/rest/v1/projects.roles), or
        #   [`organizations`](/iam/reference/rest/v1/organizations.roles). Each
        #   resource type's `name` value format is described below:
        #   * [`roles.get()`](/iam/reference/rest/v1/roles/get): `roles/`ROLE_NAME``.
        #   This method returns results from all
        #   [predefined roles](/iam/docs/understanding-roles#predefined_roles) in
        #   Cloud IAM. Example request URL:
        #   `https://iam.googleapis.com/v1/roles/`ROLE_NAME``
        #   * [`projects.roles.get()`](/iam/reference/rest/v1/projects.roles/get):
        #   `projects/`PROJECT_ID`/roles/`CUSTOM_ROLE_ID``. This method returns only
        #   [custom roles](/iam/docs/understanding-custom-roles) that have been
        #   created at the project level. Example request URL:
        #   `https://iam.googleapis.com/v1/projects/`PROJECT_ID`/roles/`CUSTOM_ROLE_ID``
        #   * [`organizations.roles.get()`](/iam/reference/rest/v1/organizations.roles/get)
        #   :
        #   `organizations/`ORGANIZATION_ID`/roles/`CUSTOM_ROLE_ID``. This method
        #   returns only [custom roles](/iam/docs/understanding-custom-roles) that
        #   have been created at the organization level. Example request URL:
        #   `https://iam.googleapis.com/v1/organizations/`ORGANIZATION_ID`/roles/`
        #   CUSTOM_ROLE_ID``
        #   Note: Wildcard (*) values are invalid; you must specify a complete project
        #   ID or organization ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::Role] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::Role]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_role(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::IamV1::Role::Representation
          command.response_class = Google::Apis::IamV1::Role
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the Roles defined on a resource.
        # @param [Fixnum] page_size
        #   Optional limit on the number of roles to include in the response.
        # @param [String] page_token
        #   Optional pagination token returned in an earlier ListRolesResponse.
        # @param [String] parent
        #   The `parent` parameter's value depends on the target resource for the
        #   request, namely
        #   [`roles`](/iam/reference/rest/v1/roles),
        #   [`projects`](/iam/reference/rest/v1/projects.roles), or
        #   [`organizations`](/iam/reference/rest/v1/organizations.roles). Each
        #   resource type's `parent` value format is described below:
        #   * [`roles.list()`](/iam/reference/rest/v1/roles/list): An empty string.
        #   This method doesn't require a resource; it simply returns all
        #   [predefined roles](/iam/docs/understanding-roles#predefined_roles) in
        #   Cloud IAM. Example request URL:
        #   `https://iam.googleapis.com/v1/roles`
        #   * [`projects.roles.list()`](/iam/reference/rest/v1/projects.roles/list):
        #   `projects/`PROJECT_ID``. This method lists all project-level
        #   [custom roles](/iam/docs/understanding-custom-roles).
        #   Example request URL:
        #   `https://iam.googleapis.com/v1/projects/`PROJECT_ID`/roles`
        #   * [`organizations.roles.list()`](/iam/reference/rest/v1/organizations.roles/
        #   list):
        #   `organizations/`ORGANIZATION_ID``. This method lists all
        #   organization-level [custom roles](/iam/docs/understanding-custom-roles).
        #   Example request URL:
        #   `https://iam.googleapis.com/v1/organizations/`ORGANIZATION_ID`/roles`
        #   Note: Wildcard (*) values are invalid; you must specify a complete project
        #   ID or organization ID.
        # @param [Boolean] show_deleted
        #   Include Roles that have been deleted.
        # @param [String] view
        #   Optional view for the returned Role objects. When `FULL` is specified,
        #   the `includedPermissions` field is returned, which includes a list of all
        #   permissions in the role. The default value is `BASIC`, which does not
        #   return the `includedPermissions` field.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::ListRolesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::ListRolesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_roles(page_size: nil, page_token: nil, parent: nil, show_deleted: nil, view: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/roles', options)
          command.response_representation = Google::Apis::IamV1::ListRolesResponse::Representation
          command.response_class = Google::Apis::IamV1::ListRolesResponse
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['showDeleted'] = show_deleted unless show_deleted.nil?
          command.query['view'] = view unless view.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Queries roles that can be granted on a particular resource.
        # A role is grantable if it can be used as the role in a binding for a policy
        # for that resource.
        # @param [Google::Apis::IamV1::QueryGrantableRolesRequest] query_grantable_roles_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::IamV1::QueryGrantableRolesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::IamV1::QueryGrantableRolesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def query_grantable_roles(query_grantable_roles_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/roles:queryGrantableRoles', options)
          command.request_representation = Google::Apis::IamV1::QueryGrantableRolesRequest::Representation
          command.request_object = query_grantable_roles_request_object
          command.response_representation = Google::Apis::IamV1::QueryGrantableRolesResponse::Representation
          command.response_class = Google::Apis::IamV1::QueryGrantableRolesResponse
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
