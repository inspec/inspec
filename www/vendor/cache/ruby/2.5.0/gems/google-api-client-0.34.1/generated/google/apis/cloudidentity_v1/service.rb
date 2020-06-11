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
    module CloudidentityV1
      # Cloud Identity API
      #
      # API for provisioning and managing identity resources.
      #
      # @example
      #    require 'google/apis/cloudidentity_v1'
      #
      #    Cloudidentity = Google::Apis::CloudidentityV1 # Alias the module
      #    service = Cloudidentity::CloudIdentityService.new
      #
      # @see https://cloud.google.com/identity/
      class CloudIdentityService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://cloudidentity.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Creates a Group.
        # @param [Google::Apis::CloudidentityV1::Group] group_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudidentityV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudidentityV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_group(group_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/groups', options)
          command.request_representation = Google::Apis::CloudidentityV1::Group::Representation
          command.request_object = group_object
          command.response_representation = Google::Apis::CloudidentityV1::Operation::Representation
          command.response_class = Google::Apis::CloudidentityV1::Operation
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a Group.
        # @param [String] name
        #   [Resource name](https://cloud.google.com/apis/design/resource_names) of the
        #   Group in the format: `groups/`group_id``, where `group_id` is the unique ID
        #   assigned to the Group.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudidentityV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudidentityV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_group(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/{+name}', options)
          command.response_representation = Google::Apis::CloudidentityV1::Operation::Representation
          command.response_class = Google::Apis::CloudidentityV1::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a Group.
        # @param [String] name
        #   [Resource name](https://cloud.google.com/apis/design/resource_names) of the
        #   Group in the format: `groups/`group_id``, where `group_id` is the unique ID
        #   assigned to the Group.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudidentityV1::Group] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudidentityV1::Group]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_group(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::CloudidentityV1::Group::Representation
          command.response_class = Google::Apis::CloudidentityV1::Group
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List groups within a customer or a domain.
        # @param [Fixnum] page_size
        #   The default page size is 200 (max 1000) for the BASIC view, and 50
        #   (max 500) for the FULL view.
        # @param [String] page_token
        #   The next_page_token value returned from a previous list request, if any.
        # @param [String] parent
        #   `Required`. May be made Optional in the future.
        #   Customer ID to list all groups from.
        # @param [String] view
        #   Group resource view to be returned. Defaults to [View.BASIC]().
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudidentityV1::ListGroupsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudidentityV1::ListGroupsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_groups(page_size: nil, page_token: nil, parent: nil, view: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/groups', options)
          command.response_representation = Google::Apis::CloudidentityV1::ListGroupsResponse::Representation
          command.response_class = Google::Apis::CloudidentityV1::ListGroupsResponse
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['view'] = view unless view.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Looks up [resource
        # name](https://cloud.google.com/apis/design/resource_names) of a Group by
        # its EntityKey.
        # @param [String] group_key_id
        #   The ID of the entity within the given namespace. The ID must be unique
        #   within its namespace.
        # @param [String] group_key_namespace
        #   Namespaces provide isolation for IDs, so an ID only needs to be unique
        #   within its namespace.
        #   Namespaces are currently only created as part of IdentitySource creation
        #   from Admin Console. A namespace `"identitysources/`identity_source_id`"` is
        #   created corresponding to every Identity Source `identity_source_id`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudidentityV1::LookupGroupNameResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudidentityV1::LookupGroupNameResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def lookup_group(group_key_id: nil, group_key_namespace: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/groups:lookup', options)
          command.response_representation = Google::Apis::CloudidentityV1::LookupGroupNameResponse::Representation
          command.response_class = Google::Apis::CloudidentityV1::LookupGroupNameResponse
          command.query['groupKey.id'] = group_key_id unless group_key_id.nil?
          command.query['groupKey.namespace'] = group_key_namespace unless group_key_namespace.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a Group.
        # @param [String] name
        #   Output only. [Resource name](https://cloud.google.com/apis/design/
        #   resource_names) of the
        #   Group in the format: `groups/`group_id``, where group_id is the unique ID
        #   assigned to the Group.
        #   Must be left blank while creating a Group.
        # @param [Google::Apis::CloudidentityV1::Group] group_object
        # @param [String] update_mask
        #   Editable fields: `display_name`, `description`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudidentityV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudidentityV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_group(name, group_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/{+name}', options)
          command.request_representation = Google::Apis::CloudidentityV1::Group::Representation
          command.request_object = group_object
          command.response_representation = Google::Apis::CloudidentityV1::Operation::Representation
          command.response_class = Google::Apis::CloudidentityV1::Operation
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Searches for Groups.
        # @param [Fixnum] page_size
        #   The default page size is 200 (max 1000) for the BASIC view, and 50
        #   (max 500) for the FULL view.
        # @param [String] page_token
        #   The next_page_token value returned from a previous search request, if any.
        # @param [String] query
        #   `Required`. Query string for performing search on groups. Users can search
        #   on parent and label attributes of groups.
        #   EXACT match ('==') is supported on parent, and CONTAINS match ('in') is
        #   supported on labels.
        # @param [String] view
        #   Group resource view to be returned. Defaults to [View.BASIC]().
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudidentityV1::SearchGroupsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudidentityV1::SearchGroupsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def search_groups(page_size: nil, page_token: nil, query: nil, view: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/groups:search', options)
          command.response_representation = Google::Apis::CloudidentityV1::SearchGroupsResponse::Representation
          command.response_class = Google::Apis::CloudidentityV1::SearchGroupsResponse
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['query'] = query unless query.nil?
          command.query['view'] = view unless view.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a Membership.
        # @param [String] parent
        #   [Resource name](https://cloud.google.com/apis/design/resource_names) of the
        #   Group to create Membership within. Format: `groups/`group_id``, where
        #   `group_id` is the unique ID assigned to the Group.
        # @param [Google::Apis::CloudidentityV1::Membership] membership_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudidentityV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudidentityV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_group_membership(parent, membership_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}/memberships', options)
          command.request_representation = Google::Apis::CloudidentityV1::Membership::Representation
          command.request_object = membership_object
          command.response_representation = Google::Apis::CloudidentityV1::Operation::Representation
          command.response_class = Google::Apis::CloudidentityV1::Operation
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a Membership.
        # @param [String] name
        #   [Resource name](https://cloud.google.com/apis/design/resource_names) of the
        #   Membership to be deleted.
        #   Format: `groups/`group_id`/memberships/`member_id``, where `group_id` is
        #   the unique ID assigned to the Group to which Membership belongs to, and
        #   member_id is the unique ID assigned to the member.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudidentityV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudidentityV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_group_membership(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/{+name}', options)
          command.response_representation = Google::Apis::CloudidentityV1::Operation::Representation
          command.response_class = Google::Apis::CloudidentityV1::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a Membership.
        # @param [String] name
        #   [Resource name](https://cloud.google.com/apis/design/resource_names) of the
        #   Membership to be retrieved.
        #   Format: `groups/`group_id`/memberships/`member_id``, where `group_id` is
        #   the unique id assigned to the Group to which Membership belongs to, and
        #   `member_id` is the unique ID assigned to the member.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudidentityV1::Membership] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudidentityV1::Membership]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_group_membership(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::CloudidentityV1::Membership::Representation
          command.response_class = Google::Apis::CloudidentityV1::Membership
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List Memberships within a Group.
        # @param [String] parent
        #   [Resource name](https://cloud.google.com/apis/design/resource_names) of the
        #   Group to list Memberships within.
        #   Format: `groups/`group_id``, where `group_id` is the unique ID assigned to
        #   the Group.
        # @param [Fixnum] page_size
        #   The default page size is 200 (max 1000) for the BASIC view, and 50
        #   (max 500) for the FULL view.
        # @param [String] page_token
        #   The next_page_token value returned from a previous list request, if any.
        # @param [String] view
        #   Membership resource view to be returned. Defaults to View.BASIC.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudidentityV1::ListMembershipsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudidentityV1::ListMembershipsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_group_memberships(parent, page_size: nil, page_token: nil, view: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+parent}/memberships', options)
          command.response_representation = Google::Apis::CloudidentityV1::ListMembershipsResponse::Representation
          command.response_class = Google::Apis::CloudidentityV1::ListMembershipsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['view'] = view unless view.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Looks up [resource
        # name](https://cloud.google.com/apis/design/resource_names) of a Membership
        # within a Group by member's EntityKey.
        # @param [String] parent
        #   [Resource name](https://cloud.google.com/apis/design/resource_names) of the
        #   Group to lookup Membership within.
        #   Format: `groups/`group_id``, where `group_id` is the unique ID assigned to
        #   the Group.
        # @param [String] member_key_id
        #   The ID of the entity within the given namespace. The ID must be unique
        #   within its namespace.
        # @param [String] member_key_namespace
        #   Namespaces provide isolation for IDs, so an ID only needs to be unique
        #   within its namespace.
        #   Namespaces are currently only created as part of IdentitySource creation
        #   from Admin Console. A namespace `"identitysources/`identity_source_id`"` is
        #   created corresponding to every Identity Source `identity_source_id`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudidentityV1::LookupMembershipNameResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudidentityV1::LookupMembershipNameResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def lookup_group_membership(parent, member_key_id: nil, member_key_namespace: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+parent}/memberships:lookup', options)
          command.response_representation = Google::Apis::CloudidentityV1::LookupMembershipNameResponse::Representation
          command.response_class = Google::Apis::CloudidentityV1::LookupMembershipNameResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['memberKey.id'] = member_key_id unless member_key_id.nil?
          command.query['memberKey.namespace'] = member_key_namespace unless member_key_namespace.nil?
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
