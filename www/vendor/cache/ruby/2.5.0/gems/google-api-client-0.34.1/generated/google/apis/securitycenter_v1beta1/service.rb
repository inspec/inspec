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
    module SecuritycenterV1beta1
      # Cloud Security Command Center API
      #
      # Cloud Security Command Center API provides access to temporal views of assets
      #  and findings within an organization.
      #
      # @example
      #    require 'google/apis/securitycenter_v1beta1'
      #
      #    Securitycenter = Google::Apis::SecuritycenterV1beta1 # Alias the module
      #    service = Securitycenter::SecurityCommandCenterService.new
      #
      # @see https://console.cloud.google.com/apis/api/securitycenter.googleapis.com/overview
      class SecurityCommandCenterService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://securitycenter.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Gets the settings for an organization.
        # @param [String] name
        #   Required. Name of the organization to get organization settings for. Its
        #   format is
        #   "organizations/[organization_id]/organizationSettings".
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SecuritycenterV1beta1::OrganizationSettings] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SecuritycenterV1beta1::OrganizationSettings]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_organization_organization_settings(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::SecuritycenterV1beta1::OrganizationSettings::Representation
          command.response_class = Google::Apis::SecuritycenterV1beta1::OrganizationSettings
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an organization's settings.
        # @param [String] name
        #   The relative resource name of the settings. See:
        #   https://cloud.google.com/apis/design/resource_names#relative_resource_name
        #   Example:
        #   "organizations/`organization_id`/organizationSettings".
        # @param [Google::Apis::SecuritycenterV1beta1::OrganizationSettings] organization_settings_object
        # @param [String] update_mask
        #   The FieldMask to use when updating the settings resource.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SecuritycenterV1beta1::OrganizationSettings] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SecuritycenterV1beta1::OrganizationSettings]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_organization_organization_settings(name, organization_settings_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1beta1/{+name}', options)
          command.request_representation = Google::Apis::SecuritycenterV1beta1::OrganizationSettings::Representation
          command.request_object = organization_settings_object
          command.response_representation = Google::Apis::SecuritycenterV1beta1::OrganizationSettings::Representation
          command.response_class = Google::Apis::SecuritycenterV1beta1::OrganizationSettings
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Filters an organization's assets and  groups them by their specified
        # properties.
        # @param [String] parent
        #   Required. Name of the organization to groupBy. Its format is
        #   "organizations/[organization_id]".
        # @param [Google::Apis::SecuritycenterV1beta1::GroupAssetsRequest] group_assets_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SecuritycenterV1beta1::GroupAssetsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SecuritycenterV1beta1::GroupAssetsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def group_assets(parent, group_assets_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+parent}/assets:group', options)
          command.request_representation = Google::Apis::SecuritycenterV1beta1::GroupAssetsRequest::Representation
          command.request_object = group_assets_request_object
          command.response_representation = Google::Apis::SecuritycenterV1beta1::GroupAssetsResponse::Representation
          command.response_class = Google::Apis::SecuritycenterV1beta1::GroupAssetsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists an organization's assets.
        # @param [String] parent
        #   Required. Name of the organization assets should belong to. Its format is
        #   "organizations/[organization_id]".
        # @param [String] compare_duration
        #   When compare_duration is set, the ListAssetResult's "state" attribute is
        #   updated to indicate whether the asset was added, removed, or remained
        #   present during the compare_duration period of time that precedes the
        #   read_time. This is the time between (read_time -
        #   compare_duration) and read_time.
        #   The state value is derived based on the presence of the asset at the two
        #   points in time. Intermediate state changes between the two times don't
        #   affect the result. For example, the results aren't affected if the asset is
        #   removed and re-created again.
        #   Possible "state" values when compare_duration is specified:
        #   * "ADDED": indicates that the asset was not present before
        #   compare_duration, but present at read_time.
        #   * "REMOVED": indicates that the asset was present at the start of
        #   compare_duration, but not present at read_time.
        #   * "ACTIVE": indicates that the asset was present at both the
        #   start and the end of the time period defined by
        #   compare_duration and read_time.
        #   If compare_duration is not specified, then the only possible state is
        #   "UNUSED", which indicates that the asset is present at read_time.
        # @param [String] field_mask
        #   Optional. A field mask to specify the ListAssetsResult fields to be listed in
        #   the
        #   response.
        #   An empty field mask will list all fields.
        # @param [String] filter
        #   Expression that defines the filter to apply across assets.
        #   The expression is a list of zero or more restrictions combined via logical
        #   operators `AND` and `OR`.
        #   Parentheses are not supported, and `OR` has higher precedence than `AND`.
        #   Restrictions have the form `<field> <operator> <value>` and may have a `-`
        #   character in front of them to indicate negation. The fields map to those
        #   defined in the Asset resource. Examples include:
        #   * name
        #   * security_center_properties.resource_name
        #   * resource_properties.a_property
        #   * security_marks.marks.marka
        #   The supported operators are:
        #   * `=` for all value types.
        #   * `>`, `<`, `>=`, `<=` for integer values.
        #   * `:`, meaning substring matching, for strings.
        #   The supported value types are:
        #   * string literals in quotes.
        #   * integer literals without quotes.
        #   * boolean literals `true` and `false` without quotes.
        #   For example, `resource_properties.size = 100` is a valid filter string.
        # @param [String] order_by
        #   Expression that defines what fields and order to use for sorting. The
        #   string value should follow SQL syntax: comma separated list of fields. For
        #   example: "name,resource_properties.a_property". The default sorting order
        #   is ascending. To specify descending order for a field, a suffix " desc"
        #   should be appended to the field name. For example: "name
        #   desc,resource_properties.a_property". Redundant space characters in the
        #   syntax are insignificant. "name desc,resource_properties.a_property" and "
        #   name     desc  ,   resource_properties.a_property  " are equivalent.
        # @param [Fixnum] page_size
        #   The maximum number of results to return in a single response. Default is
        #   10, minimum is 1, maximum is 1000.
        # @param [String] page_token
        #   The value returned by the last `ListAssetsResponse`; indicates
        #   that this is a continuation of a prior `ListAssets` call, and
        #   that the system should return the next page of data.
        # @param [String] read_time
        #   Time used as a reference point when filtering assets. The filter is limited
        #   to assets existing at the supplied time and their values are those at that
        #   specific time. Absence of this field will default to the API's version of
        #   NOW.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SecuritycenterV1beta1::ListAssetsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SecuritycenterV1beta1::ListAssetsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_organization_assets(parent, compare_duration: nil, field_mask: nil, filter: nil, order_by: nil, page_size: nil, page_token: nil, read_time: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+parent}/assets', options)
          command.response_representation = Google::Apis::SecuritycenterV1beta1::ListAssetsResponse::Representation
          command.response_class = Google::Apis::SecuritycenterV1beta1::ListAssetsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['compareDuration'] = compare_duration unless compare_duration.nil?
          command.query['fieldMask'] = field_mask unless field_mask.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['readTime'] = read_time unless read_time.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Runs asset discovery. The discovery is tracked with a long-running
        # operation.
        # This API can only be called with limited frequency for an organization. If
        # it is called too frequently the caller will receive a TOO_MANY_REQUESTS
        # error.
        # @param [String] parent
        #   Required. Name of the organization to run asset discovery for. Its format is
        #   "organizations/[organization_id]".
        # @param [Google::Apis::SecuritycenterV1beta1::RunAssetDiscoveryRequest] run_asset_discovery_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SecuritycenterV1beta1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SecuritycenterV1beta1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def run_organization_asset_discovery(parent, run_asset_discovery_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+parent}/assets:runDiscovery', options)
          command.request_representation = Google::Apis::SecuritycenterV1beta1::RunAssetDiscoveryRequest::Representation
          command.request_object = run_asset_discovery_request_object
          command.response_representation = Google::Apis::SecuritycenterV1beta1::Operation::Representation
          command.response_class = Google::Apis::SecuritycenterV1beta1::Operation
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates security marks.
        # @param [String] name
        #   The relative resource name of the SecurityMarks. See:
        #   https://cloud.google.com/apis/design/resource_names#relative_resource_name
        #   Examples:
        #   "organizations/`organization_id`/assets/`asset_id`/securityMarks"
        #   "organizations/`organization_id`/sources/`source_id`/findings/`finding_id`/
        #   securityMarks".
        # @param [Google::Apis::SecuritycenterV1beta1::SecurityMarks] security_marks_object
        # @param [String] start_time
        #   The time at which the updated SecurityMarks take effect.
        # @param [String] update_mask
        #   The FieldMask to use when updating the security marks resource.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SecuritycenterV1beta1::SecurityMarks] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SecuritycenterV1beta1::SecurityMarks]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_organization_asset_security_marks(name, security_marks_object = nil, start_time: nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1beta1/{+name}', options)
          command.request_representation = Google::Apis::SecuritycenterV1beta1::SecurityMarks::Representation
          command.request_object = security_marks_object
          command.response_representation = Google::Apis::SecuritycenterV1beta1::SecurityMarks::Representation
          command.response_class = Google::Apis::SecuritycenterV1beta1::SecurityMarks
          command.params['name'] = name unless name.nil?
          command.query['startTime'] = start_time unless start_time.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
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
        # @param [Google::Apis::SecuritycenterV1beta1::CancelOperationRequest] cancel_operation_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SecuritycenterV1beta1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SecuritycenterV1beta1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def cancel_operation(name, cancel_operation_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+name}:cancel', options)
          command.request_representation = Google::Apis::SecuritycenterV1beta1::CancelOperationRequest::Representation
          command.request_object = cancel_operation_request_object
          command.response_representation = Google::Apis::SecuritycenterV1beta1::Empty::Representation
          command.response_class = Google::Apis::SecuritycenterV1beta1::Empty
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
        # @yieldparam result [Google::Apis::SecuritycenterV1beta1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SecuritycenterV1beta1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_organization_operation(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::SecuritycenterV1beta1::Empty::Representation
          command.response_class = Google::Apis::SecuritycenterV1beta1::Empty
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
        # @yieldparam result [Google::Apis::SecuritycenterV1beta1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SecuritycenterV1beta1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_organization_operation(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::SecuritycenterV1beta1::Operation::Representation
          command.response_class = Google::Apis::SecuritycenterV1beta1::Operation
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
        # @yieldparam result [Google::Apis::SecuritycenterV1beta1::ListOperationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SecuritycenterV1beta1::ListOperationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_organization_operations(name, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::SecuritycenterV1beta1::ListOperationsResponse::Representation
          command.response_class = Google::Apis::SecuritycenterV1beta1::ListOperationsResponse
          command.params['name'] = name unless name.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a source.
        # @param [String] parent
        #   Required. Resource name of the new source's parent. Its format should be
        #   "organizations/[organization_id]".
        # @param [Google::Apis::SecuritycenterV1beta1::Source] source_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SecuritycenterV1beta1::Source] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SecuritycenterV1beta1::Source]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_organization_source(parent, source_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+parent}/sources', options)
          command.request_representation = Google::Apis::SecuritycenterV1beta1::Source::Representation
          command.request_object = source_object
          command.response_representation = Google::Apis::SecuritycenterV1beta1::Source::Representation
          command.response_class = Google::Apis::SecuritycenterV1beta1::Source
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a source.
        # @param [String] name
        #   Required. Relative resource name of the source. Its format is
        #   "organizations/[organization_id]/source/[source_id]".
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SecuritycenterV1beta1::Source] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SecuritycenterV1beta1::Source]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_organization_source(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::SecuritycenterV1beta1::Source::Representation
          command.response_class = Google::Apis::SecuritycenterV1beta1::Source
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the access control policy on the specified Source.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::SecuritycenterV1beta1::GetIamPolicyRequest] get_iam_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SecuritycenterV1beta1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SecuritycenterV1beta1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_source_iam_policy(resource, get_iam_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+resource}:getIamPolicy', options)
          command.request_representation = Google::Apis::SecuritycenterV1beta1::GetIamPolicyRequest::Representation
          command.request_object = get_iam_policy_request_object
          command.response_representation = Google::Apis::SecuritycenterV1beta1::Policy::Representation
          command.response_class = Google::Apis::SecuritycenterV1beta1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all sources belonging to an organization.
        # @param [String] parent
        #   Required. Resource name of the parent of sources to list. Its format should be
        #   "organizations/[organization_id]".
        # @param [Fixnum] page_size
        #   The maximum number of results to return in a single response. Default is
        #   10, minimum is 1, maximum is 1000.
        # @param [String] page_token
        #   The value returned by the last `ListSourcesResponse`; indicates
        #   that this is a continuation of a prior `ListSources` call, and
        #   that the system should return the next page of data.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SecuritycenterV1beta1::ListSourcesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SecuritycenterV1beta1::ListSourcesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_organization_sources(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+parent}/sources', options)
          command.response_representation = Google::Apis::SecuritycenterV1beta1::ListSourcesResponse::Representation
          command.response_class = Google::Apis::SecuritycenterV1beta1::ListSourcesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a source.
        # @param [String] name
        #   The relative resource name of this source. See:
        #   https://cloud.google.com/apis/design/resource_names#relative_resource_name
        #   Example:
        #   "organizations/`organization_id`/sources/`source_id`"
        # @param [Google::Apis::SecuritycenterV1beta1::Source] source_object
        # @param [String] update_mask
        #   The FieldMask to use when updating the source resource.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SecuritycenterV1beta1::Source] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SecuritycenterV1beta1::Source]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_organization_source(name, source_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1beta1/{+name}', options)
          command.request_representation = Google::Apis::SecuritycenterV1beta1::Source::Representation
          command.request_object = source_object
          command.response_representation = Google::Apis::SecuritycenterV1beta1::Source::Representation
          command.response_class = Google::Apis::SecuritycenterV1beta1::Source
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets the access control policy on the specified Source.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being specified.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::SecuritycenterV1beta1::SetIamPolicyRequest] set_iam_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SecuritycenterV1beta1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SecuritycenterV1beta1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def set_source_iam_policy(resource, set_iam_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+resource}:setIamPolicy', options)
          command.request_representation = Google::Apis::SecuritycenterV1beta1::SetIamPolicyRequest::Representation
          command.request_object = set_iam_policy_request_object
          command.response_representation = Google::Apis::SecuritycenterV1beta1::Policy::Representation
          command.response_class = Google::Apis::SecuritycenterV1beta1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the permissions that a caller has on the specified source.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy detail is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::SecuritycenterV1beta1::TestIamPermissionsRequest] test_iam_permissions_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SecuritycenterV1beta1::TestIamPermissionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SecuritycenterV1beta1::TestIamPermissionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def test_source_iam_permissions(resource, test_iam_permissions_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+resource}:testIamPermissions', options)
          command.request_representation = Google::Apis::SecuritycenterV1beta1::TestIamPermissionsRequest::Representation
          command.request_object = test_iam_permissions_request_object
          command.response_representation = Google::Apis::SecuritycenterV1beta1::TestIamPermissionsResponse::Representation
          command.response_class = Google::Apis::SecuritycenterV1beta1::TestIamPermissionsResponse
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a finding. The corresponding source must exist for finding creation
        # to succeed.
        # @param [String] parent
        #   Required. Resource name of the new finding's parent. Its format should be
        #   "organizations/[organization_id]/sources/[source_id]".
        # @param [Google::Apis::SecuritycenterV1beta1::Finding] finding_object
        # @param [String] finding_id
        #   Required. Unique identifier provided by the client within the parent scope.
        #   It must be alphanumeric and less than or equal to 32 characters and
        #   greater than 0 characters in length.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SecuritycenterV1beta1::Finding] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SecuritycenterV1beta1::Finding]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_organization_source_finding(parent, finding_object = nil, finding_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+parent}/findings', options)
          command.request_representation = Google::Apis::SecuritycenterV1beta1::Finding::Representation
          command.request_object = finding_object
          command.response_representation = Google::Apis::SecuritycenterV1beta1::Finding::Representation
          command.response_class = Google::Apis::SecuritycenterV1beta1::Finding
          command.params['parent'] = parent unless parent.nil?
          command.query['findingId'] = finding_id unless finding_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Filters an organization or source's findings and  groups them by their
        # specified properties.
        # To group across all sources provide a `-` as the source id.
        # Example: /v1beta1/organizations/`organization_id`/sources/-/findings
        # @param [String] parent
        #   Required. Name of the source to groupBy. Its format is
        #   "organizations/[organization_id]/sources/[source_id]". To groupBy across
        #   all sources provide a source_id of `-`. For example:
        #   organizations/`organization_id`/sources/-
        # @param [Google::Apis::SecuritycenterV1beta1::GroupFindingsRequest] group_findings_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SecuritycenterV1beta1::GroupFindingsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SecuritycenterV1beta1::GroupFindingsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def group_findings(parent, group_findings_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+parent}/findings:group', options)
          command.request_representation = Google::Apis::SecuritycenterV1beta1::GroupFindingsRequest::Representation
          command.request_object = group_findings_request_object
          command.response_representation = Google::Apis::SecuritycenterV1beta1::GroupFindingsResponse::Representation
          command.response_class = Google::Apis::SecuritycenterV1beta1::GroupFindingsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists an organization or source's findings.
        # To list across all sources provide a `-` as the source id.
        # Example: /v1beta1/organizations/`organization_id`/sources/-/findings
        # @param [String] parent
        #   Required. Name of the source the findings belong to. Its format is
        #   "organizations/[organization_id]/sources/[source_id]". To list across all
        #   sources provide a source_id of `-`. For example:
        #   organizations/`organization_id`/sources/-
        # @param [String] field_mask
        #   Optional. A field mask to specify the Finding fields to be listed in the
        #   response.
        #   An empty field mask will list all fields.
        # @param [String] filter
        #   Expression that defines the filter to apply across findings.
        #   The expression is a list of one or more restrictions combined via logical
        #   operators `AND` and `OR`.
        #   Parentheses are not supported, and `OR` has higher precedence than `AND`.
        #   Restrictions have the form `<field> <operator> <value>` and may have a `-`
        #   character in front of them to indicate negation. Examples include:
        #   * name
        #   * source_properties.a_property
        #   * security_marks.marks.marka
        #   The supported operators are:
        #   * `=` for all value types.
        #   * `>`, `<`, `>=`, `<=` for integer values.
        #   * `:`, meaning substring matching, for strings.
        #   The supported value types are:
        #   * string literals in quotes.
        #   * integer literals without quotes.
        #   * boolean literals `true` and `false` without quotes.
        #   For example, `source_properties.size = 100` is a valid filter string.
        # @param [String] order_by
        #   Expression that defines what fields and order to use for sorting. The
        #   string value should follow SQL syntax: comma separated list of fields. For
        #   example: "name,resource_properties.a_property". The default sorting order
        #   is ascending. To specify descending order for a field, a suffix " desc"
        #   should be appended to the field name. For example: "name
        #   desc,source_properties.a_property". Redundant space characters in the
        #   syntax are insignificant. "name desc,source_properties.a_property" and "
        #   name     desc  ,   source_properties.a_property  " are equivalent.
        # @param [Fixnum] page_size
        #   The maximum number of results to return in a single response. Default is
        #   10, minimum is 1, maximum is 1000.
        # @param [String] page_token
        #   The value returned by the last `ListFindingsResponse`; indicates
        #   that this is a continuation of a prior `ListFindings` call, and
        #   that the system should return the next page of data.
        # @param [String] read_time
        #   Time used as a reference point when filtering findings. The filter is
        #   limited to findings existing at the supplied time and their values are
        #   those at that specific time. Absence of this field will default to the
        #   API's version of NOW.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SecuritycenterV1beta1::ListFindingsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SecuritycenterV1beta1::ListFindingsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_organization_source_findings(parent, field_mask: nil, filter: nil, order_by: nil, page_size: nil, page_token: nil, read_time: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+parent}/findings', options)
          command.response_representation = Google::Apis::SecuritycenterV1beta1::ListFindingsResponse::Representation
          command.response_class = Google::Apis::SecuritycenterV1beta1::ListFindingsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['fieldMask'] = field_mask unless field_mask.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['readTime'] = read_time unless read_time.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates or updates a finding. The corresponding source must exist for a
        # finding creation to succeed.
        # @param [String] name
        #   The relative resource name of this finding. See:
        #   https://cloud.google.com/apis/design/resource_names#relative_resource_name
        #   Example:
        #   "organizations/`organization_id`/sources/`source_id`/findings/`finding_id`"
        # @param [Google::Apis::SecuritycenterV1beta1::Finding] finding_object
        # @param [String] update_mask
        #   The FieldMask to use when updating the finding resource. This field should
        #   not be specified when creating a finding.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SecuritycenterV1beta1::Finding] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SecuritycenterV1beta1::Finding]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_organization_source_finding(name, finding_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1beta1/{+name}', options)
          command.request_representation = Google::Apis::SecuritycenterV1beta1::Finding::Representation
          command.request_object = finding_object
          command.response_representation = Google::Apis::SecuritycenterV1beta1::Finding::Representation
          command.response_class = Google::Apis::SecuritycenterV1beta1::Finding
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the state of a finding.
        # @param [String] name
        #   Required. The relative resource name of the finding. See:
        #   https://cloud.google.com/apis/design/resource_names#relative_resource_name
        #   Example:
        #   "organizations/`organization_id`/sources/`source_id`/finding/`finding_id`".
        # @param [Google::Apis::SecuritycenterV1beta1::SetFindingStateRequest] set_finding_state_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SecuritycenterV1beta1::Finding] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SecuritycenterV1beta1::Finding]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def set_organization_source_finding_state(name, set_finding_state_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+name}:setState', options)
          command.request_representation = Google::Apis::SecuritycenterV1beta1::SetFindingStateRequest::Representation
          command.request_object = set_finding_state_request_object
          command.response_representation = Google::Apis::SecuritycenterV1beta1::Finding::Representation
          command.response_class = Google::Apis::SecuritycenterV1beta1::Finding
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates security marks.
        # @param [String] name
        #   The relative resource name of the SecurityMarks. See:
        #   https://cloud.google.com/apis/design/resource_names#relative_resource_name
        #   Examples:
        #   "organizations/`organization_id`/assets/`asset_id`/securityMarks"
        #   "organizations/`organization_id`/sources/`source_id`/findings/`finding_id`/
        #   securityMarks".
        # @param [Google::Apis::SecuritycenterV1beta1::SecurityMarks] security_marks_object
        # @param [String] start_time
        #   The time at which the updated SecurityMarks take effect.
        # @param [String] update_mask
        #   The FieldMask to use when updating the security marks resource.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SecuritycenterV1beta1::SecurityMarks] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SecuritycenterV1beta1::SecurityMarks]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_organization_source_finding_security_marks(name, security_marks_object = nil, start_time: nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1beta1/{+name}', options)
          command.request_representation = Google::Apis::SecuritycenterV1beta1::SecurityMarks::Representation
          command.request_object = security_marks_object
          command.response_representation = Google::Apis::SecuritycenterV1beta1::SecurityMarks::Representation
          command.response_class = Google::Apis::SecuritycenterV1beta1::SecurityMarks
          command.params['name'] = name unless name.nil?
          command.query['startTime'] = start_time unless start_time.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
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
