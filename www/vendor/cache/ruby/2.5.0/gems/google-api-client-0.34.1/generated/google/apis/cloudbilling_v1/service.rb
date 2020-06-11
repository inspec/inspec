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
    module CloudbillingV1
      # Cloud Billing API
      #
      # Allows developers to manage billing for their Google Cloud Platform projects
      #  programmatically.
      #
      # @example
      #    require 'google/apis/cloudbilling_v1'
      #
      #    Cloudbilling = Google::Apis::CloudbillingV1 # Alias the module
      #    service = Cloudbilling::CloudbillingService.new
      #
      # @see https://cloud.google.com/billing/
      class CloudbillingService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://cloudbilling.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Creates a billing account.
        # This method can only be used to create
        # [billing subaccounts](https://cloud.google.com/billing/docs/concepts)
        # by GCP resellers.
        # When creating a subaccount, the current authenticated user must have the
        # `billing.accounts.update` IAM permission on the master account, which is
        # typically given to billing account
        # [administrators](https://cloud.google.com/billing/docs/how-to/billing-access).
        # This method will return an error if the master account has not been
        # provisioned as a reseller account.
        # @param [Google::Apis::CloudbillingV1::BillingAccount] billing_account_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudbillingV1::BillingAccount] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudbillingV1::BillingAccount]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_billing_account(billing_account_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/billingAccounts', options)
          command.request_representation = Google::Apis::CloudbillingV1::BillingAccount::Representation
          command.request_object = billing_account_object
          command.response_representation = Google::Apis::CloudbillingV1::BillingAccount::Representation
          command.response_class = Google::Apis::CloudbillingV1::BillingAccount
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets information about a billing account. The current authenticated user
        # must be a [viewer of the billing
        # account](https://cloud.google.com/billing/docs/how-to/billing-access).
        # @param [String] name
        #   The resource name of the billing account to retrieve. For example,
        #   `billingAccounts/012345-567890-ABCDEF`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudbillingV1::BillingAccount] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudbillingV1::BillingAccount]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_billing_account(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::CloudbillingV1::BillingAccount::Representation
          command.response_class = Google::Apis::CloudbillingV1::BillingAccount
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the access control policy for a billing account.
        # The caller must have the `billing.accounts.getIamPolicy` permission on the
        # account, which is often given to billing account
        # [viewers](https://cloud.google.com/billing/docs/how-to/billing-access).
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
        # @yieldparam result [Google::Apis::CloudbillingV1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudbillingV1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_billing_account_iam_policy(resource, options_requested_policy_version: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+resource}:getIamPolicy', options)
          command.response_representation = Google::Apis::CloudbillingV1::Policy::Representation
          command.response_class = Google::Apis::CloudbillingV1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['options.requestedPolicyVersion'] = options_requested_policy_version unless options_requested_policy_version.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the billing accounts that the current authenticated user has
        # permission to
        # [view](https://cloud.google.com/billing/docs/how-to/billing-access).
        # @param [String] filter
        #   Options for how to filter the returned billing accounts.
        #   Currently this only supports filtering for
        #   [subaccounts](https://cloud.google.com/billing/docs/concepts) under a
        #   single provided reseller billing account.
        #   (e.g. "master_billing_account=billingAccounts/012345-678901-ABCDEF").
        #   Boolean algebra and other fields are not currently supported.
        # @param [Fixnum] page_size
        #   Requested page size. The maximum page size is 100; this is also the
        #   default.
        # @param [String] page_token
        #   A token identifying a page of results to return. This should be a
        #   `next_page_token` value returned from a previous `ListBillingAccounts`
        #   call. If unspecified, the first page of results is returned.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudbillingV1::ListBillingAccountsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudbillingV1::ListBillingAccountsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_billing_accounts(filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/billingAccounts', options)
          command.response_representation = Google::Apis::CloudbillingV1::ListBillingAccountsResponse::Representation
          command.response_class = Google::Apis::CloudbillingV1::ListBillingAccountsResponse
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a billing account's fields.
        # Currently the only field that can be edited is `display_name`.
        # The current authenticated user must have the `billing.accounts.update`
        # IAM permission, which is typically given to the
        # [administrator](https://cloud.google.com/billing/docs/how-to/billing-access)
        # of the billing account.
        # @param [String] name
        #   The name of the billing account resource to be updated.
        # @param [Google::Apis::CloudbillingV1::BillingAccount] billing_account_object
        # @param [String] update_mask
        #   The update mask applied to the resource.
        #   Only "display_name" is currently supported.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudbillingV1::BillingAccount] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudbillingV1::BillingAccount]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_billing_account(name, billing_account_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/{+name}', options)
          command.request_representation = Google::Apis::CloudbillingV1::BillingAccount::Representation
          command.request_object = billing_account_object
          command.response_representation = Google::Apis::CloudbillingV1::BillingAccount::Representation
          command.response_class = Google::Apis::CloudbillingV1::BillingAccount
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets the access control policy for a billing account. Replaces any existing
        # policy.
        # The caller must have the `billing.accounts.setIamPolicy` permission on the
        # account, which is often given to billing account
        # [administrators](https://cloud.google.com/billing/docs/how-to/billing-access).
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being specified.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::CloudbillingV1::SetIamPolicyRequest] set_iam_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudbillingV1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudbillingV1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def set_billing_account_iam_policy(resource, set_iam_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+resource}:setIamPolicy', options)
          command.request_representation = Google::Apis::CloudbillingV1::SetIamPolicyRequest::Representation
          command.request_object = set_iam_policy_request_object
          command.response_representation = Google::Apis::CloudbillingV1::Policy::Representation
          command.response_class = Google::Apis::CloudbillingV1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Tests the access control policy for a billing account. This method takes
        # the resource and a set of permissions as input and returns the subset of
        # the input permissions that the caller is allowed for that resource.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy detail is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::CloudbillingV1::TestIamPermissionsRequest] test_iam_permissions_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudbillingV1::TestIamPermissionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudbillingV1::TestIamPermissionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def test_billing_account_iam_permissions(resource, test_iam_permissions_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+resource}:testIamPermissions', options)
          command.request_representation = Google::Apis::CloudbillingV1::TestIamPermissionsRequest::Representation
          command.request_object = test_iam_permissions_request_object
          command.response_representation = Google::Apis::CloudbillingV1::TestIamPermissionsResponse::Representation
          command.response_class = Google::Apis::CloudbillingV1::TestIamPermissionsResponse
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the projects associated with a billing account. The current
        # authenticated user must have the `billing.resourceAssociations.list` IAM
        # permission, which is often given to billing account
        # [viewers](https://cloud.google.com/billing/docs/how-to/billing-access).
        # @param [String] name
        #   The resource name of the billing account associated with the projects that
        #   you want to list. For example, `billingAccounts/012345-567890-ABCDEF`.
        # @param [Fixnum] page_size
        #   Requested page size. The maximum page size is 100; this is also the
        #   default.
        # @param [String] page_token
        #   A token identifying a page of results to be returned. This should be a
        #   `next_page_token` value returned from a previous `ListProjectBillingInfo`
        #   call. If unspecified, the first page of results is returned.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudbillingV1::ListProjectBillingInfoResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudbillingV1::ListProjectBillingInfoResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_billing_account_projects(name, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}/projects', options)
          command.response_representation = Google::Apis::CloudbillingV1::ListProjectBillingInfoResponse::Representation
          command.response_class = Google::Apis::CloudbillingV1::ListProjectBillingInfoResponse
          command.params['name'] = name unless name.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the billing information for a project. The current authenticated user
        # must have [permission to view the
        # project](https://cloud.google.com/docs/permissions-overview#h.bgs0oxofvnoo
        # ).
        # @param [String] name
        #   The resource name of the project for which billing information is
        #   retrieved. For example, `projects/tokyo-rain-123`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudbillingV1::ProjectBillingInfo] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudbillingV1::ProjectBillingInfo]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_billing_info(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}/billingInfo', options)
          command.response_representation = Google::Apis::CloudbillingV1::ProjectBillingInfo::Representation
          command.response_class = Google::Apis::CloudbillingV1::ProjectBillingInfo
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets or updates the billing account associated with a project. You specify
        # the new billing account by setting the `billing_account_name` in the
        # `ProjectBillingInfo` resource to the resource name of a billing account.
        # Associating a project with an open billing account enables billing on the
        # project and allows charges for resource usage. If the project already had a
        # billing account, this method changes the billing account used for resource
        # usage charges.
        # *Note:* Incurred charges that have not yet been reported in the transaction
        # history of the GCP Console might be billed to the new billing
        # account, even if the charge occurred before the new billing account was
        # assigned to the project.
        # The current authenticated user must have ownership privileges for both the
        # [project](https://cloud.google.com/docs/permissions-overview#h.bgs0oxofvnoo
        # ) and the [billing
        # account](https://cloud.google.com/billing/docs/how-to/billing-access).
        # You can disable billing on the project by setting the
        # `billing_account_name` field to empty. This action disassociates the
        # current billing account from the project. Any billable activity of your
        # in-use services will stop, and your application could stop functioning as
        # expected. Any unbilled charges to date will be billed to the previously
        # associated account. The current authenticated user must be either an owner
        # of the project or an owner of the billing account for the project.
        # Note that associating a project with a *closed* billing account will have
        # much the same effect as disabling billing on the project: any paid
        # resources used by the project will be shut down. Thus, unless you wish to
        # disable billing, you should always call this method with the name of an
        # *open* billing account.
        # @param [String] name
        #   The resource name of the project associated with the billing information
        #   that you want to update. For example, `projects/tokyo-rain-123`.
        # @param [Google::Apis::CloudbillingV1::ProjectBillingInfo] project_billing_info_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudbillingV1::ProjectBillingInfo] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudbillingV1::ProjectBillingInfo]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_project_billing_info(name, project_billing_info_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v1/{+name}/billingInfo', options)
          command.request_representation = Google::Apis::CloudbillingV1::ProjectBillingInfo::Representation
          command.request_object = project_billing_info_object
          command.response_representation = Google::Apis::CloudbillingV1::ProjectBillingInfo::Representation
          command.response_class = Google::Apis::CloudbillingV1::ProjectBillingInfo
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all public cloud services.
        # @param [Fixnum] page_size
        #   Requested page size. Defaults to 5000.
        # @param [String] page_token
        #   A token identifying a page of results to return. This should be a
        #   `next_page_token` value returned from a previous `ListServices`
        #   call. If unspecified, the first page of results is returned.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudbillingV1::ListServicesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudbillingV1::ListServicesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_services(page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/services', options)
          command.response_representation = Google::Apis::CloudbillingV1::ListServicesResponse::Representation
          command.response_class = Google::Apis::CloudbillingV1::ListServicesResponse
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all publicly available SKUs for a given cloud service.
        # @param [String] parent
        #   The name of the service.
        #   Example: "services/DA34-426B-A397"
        # @param [String] currency_code
        #   The ISO 4217 currency code for the pricing info in the response proto.
        #   Will use the conversion rate as of start_time.
        #   Optional. If not specified USD will be used.
        # @param [String] end_time
        #   Optional exclusive end time of the time range for which the pricing
        #   versions will be returned. Timestamps in the future are not allowed.
        #   The time range has to be within a single calendar month in
        #   America/Los_Angeles timezone. Time range as a whole is optional. If not
        #   specified, the latest pricing will be returned (up to 12 hours old at
        #   most).
        # @param [Fixnum] page_size
        #   Requested page size. Defaults to 5000.
        # @param [String] page_token
        #   A token identifying a page of results to return. This should be a
        #   `next_page_token` value returned from a previous `ListSkus`
        #   call. If unspecified, the first page of results is returned.
        # @param [String] start_time
        #   Optional inclusive start time of the time range for which the pricing
        #   versions will be returned. Timestamps in the future are not allowed.
        #   The time range has to be within a single calendar month in
        #   America/Los_Angeles timezone. Time range as a whole is optional. If not
        #   specified, the latest pricing will be returned (up to 12 hours old at
        #   most).
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudbillingV1::ListSkusResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudbillingV1::ListSkusResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_service_skus(parent, currency_code: nil, end_time: nil, page_size: nil, page_token: nil, start_time: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+parent}/skus', options)
          command.response_representation = Google::Apis::CloudbillingV1::ListSkusResponse::Representation
          command.response_class = Google::Apis::CloudbillingV1::ListSkusResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['currencyCode'] = currency_code unless currency_code.nil?
          command.query['endTime'] = end_time unless end_time.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['startTime'] = start_time unless start_time.nil?
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
