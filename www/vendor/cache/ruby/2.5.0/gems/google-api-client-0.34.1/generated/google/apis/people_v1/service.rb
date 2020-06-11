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
    module PeopleV1
      # People API
      #
      # Provides access to information about profiles and contacts.
      #
      # @example
      #    require 'google/apis/people_v1'
      #
      #    People = Google::Apis::PeopleV1 # Alias the module
      #    service = People::PeopleServiceService.new
      #
      # @see https://developers.google.com/people/
      class PeopleServiceService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://people.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Get a list of contact groups owned by the authenticated user by specifying
        # a list of contact group resource names.
        # @param [Fixnum] max_members
        #   Optional. Specifies the maximum number of members to return for each group.
        #   Defaults
        #   to 0 if not set, which will return zero members.
        # @param [Array<String>, String] resource_names
        #   Required. The resource names of the contact groups to get.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PeopleV1::BatchGetContactGroupsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PeopleV1::BatchGetContactGroupsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_contact_group_get(max_members: nil, resource_names: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/contactGroups:batchGet', options)
          command.response_representation = Google::Apis::PeopleV1::BatchGetContactGroupsResponse::Representation
          command.response_class = Google::Apis::PeopleV1::BatchGetContactGroupsResponse
          command.query['maxMembers'] = max_members unless max_members.nil?
          command.query['resourceNames'] = resource_names unless resource_names.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Create a new contact group owned by the authenticated user.
        # @param [Google::Apis::PeopleV1::CreateContactGroupRequest] create_contact_group_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PeopleV1::ContactGroup] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PeopleV1::ContactGroup]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_contact_group(create_contact_group_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/contactGroups', options)
          command.request_representation = Google::Apis::PeopleV1::CreateContactGroupRequest::Representation
          command.request_object = create_contact_group_request_object
          command.response_representation = Google::Apis::PeopleV1::ContactGroup::Representation
          command.response_class = Google::Apis::PeopleV1::ContactGroup
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Delete an existing contact group owned by the authenticated user by
        # specifying a contact group resource name.
        # @param [String] resource_name
        #   Required. The resource name of the contact group to delete.
        # @param [Boolean] delete_contacts
        #   Optional. Set to true to also delete the contacts in the specified group.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PeopleV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PeopleV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_contact_group(resource_name, delete_contacts: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/{+resourceName}', options)
          command.response_representation = Google::Apis::PeopleV1::Empty::Representation
          command.response_class = Google::Apis::PeopleV1::Empty
          command.params['resourceName'] = resource_name unless resource_name.nil?
          command.query['deleteContacts'] = delete_contacts unless delete_contacts.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get a specific contact group owned by the authenticated user by specifying
        # a contact group resource name.
        # @param [String] resource_name
        #   Required. The resource name of the contact group to get.
        # @param [Fixnum] max_members
        #   Optional. Specifies the maximum number of members to return. Defaults to 0 if
        #   not
        #   set, which will return zero members.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PeopleV1::ContactGroup] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PeopleV1::ContactGroup]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_contact_group(resource_name, max_members: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+resourceName}', options)
          command.response_representation = Google::Apis::PeopleV1::ContactGroup::Representation
          command.response_class = Google::Apis::PeopleV1::ContactGroup
          command.params['resourceName'] = resource_name unless resource_name.nil?
          command.query['maxMembers'] = max_members unless max_members.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all contact groups owned by the authenticated user. Members of the
        # contact groups are not populated.
        # @param [Fixnum] page_size
        #   Optional. The maximum number of resources to return. Valid values are between
        #   1 and
        #   1000, inclusive. Defaults to 30 if not set or set to 0.
        # @param [String] page_token
        #   The next_page_token value returned from a previous call to
        #   [ListContactGroups](/people/api/rest/v1/contactgroups/list).
        #   Requests the next page of resources.
        # @param [String] sync_token
        #   A sync token, returned by a previous call to `contactgroups.list`.
        #   Only resources changed since the sync token was created will be returned.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PeopleV1::ListContactGroupsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PeopleV1::ListContactGroupsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_contact_groups(page_size: nil, page_token: nil, sync_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/contactGroups', options)
          command.response_representation = Google::Apis::PeopleV1::ListContactGroupsResponse::Representation
          command.response_class = Google::Apis::PeopleV1::ListContactGroupsResponse
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['syncToken'] = sync_token unless sync_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update the name of an existing contact group owned by the authenticated
        # user.
        # @param [String] resource_name
        #   The resource name for the contact group, assigned by the server. An ASCII
        #   string, in the form of `contactGroups/`<var>contact_group_id</var>.
        # @param [Google::Apis::PeopleV1::UpdateContactGroupRequest] update_contact_group_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PeopleV1::ContactGroup] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PeopleV1::ContactGroup]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_contact_group(resource_name, update_contact_group_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v1/{+resourceName}', options)
          command.request_representation = Google::Apis::PeopleV1::UpdateContactGroupRequest::Representation
          command.request_object = update_contact_group_request_object
          command.response_representation = Google::Apis::PeopleV1::ContactGroup::Representation
          command.response_class = Google::Apis::PeopleV1::ContactGroup
          command.params['resourceName'] = resource_name unless resource_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Modify the members of a contact group owned by the authenticated user.
        # <br>
        # The only system contact groups that can have members added are
        # `contactGroups/myContacts` and `contactGroups/starred`. Other system
        # contact groups are deprecated and can only have contacts removed.
        # @param [String] resource_name
        #   Required. The resource name of the contact group to modify.
        # @param [Google::Apis::PeopleV1::ModifyContactGroupMembersRequest] modify_contact_group_members_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PeopleV1::ModifyContactGroupMembersResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PeopleV1::ModifyContactGroupMembersResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def modify_contact_group_members(resource_name, modify_contact_group_members_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+resourceName}/members:modify', options)
          command.request_representation = Google::Apis::PeopleV1::ModifyContactGroupMembersRequest::Representation
          command.request_object = modify_contact_group_members_request_object
          command.response_representation = Google::Apis::PeopleV1::ModifyContactGroupMembersResponse::Representation
          command.response_class = Google::Apis::PeopleV1::ModifyContactGroupMembersResponse
          command.params['resourceName'] = resource_name unless resource_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Create a new contact and return the person resource for that contact.
        # @param [Google::Apis::PeopleV1::Person] person_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PeopleV1::Person] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PeopleV1::Person]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_person_contact(person_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/people:createContact', options)
          command.request_representation = Google::Apis::PeopleV1::Person::Representation
          command.request_object = person_object
          command.response_representation = Google::Apis::PeopleV1::Person::Representation
          command.response_class = Google::Apis::PeopleV1::Person
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Delete a contact person. Any non-contact data will not be deleted.
        # @param [String] resource_name
        #   Required. The resource name of the contact to delete.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PeopleV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PeopleV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_person_contact(resource_name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/{+resourceName}:deleteContact', options)
          command.response_representation = Google::Apis::PeopleV1::Empty::Representation
          command.response_class = Google::Apis::PeopleV1::Empty
          command.params['resourceName'] = resource_name unless resource_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Delete a contact's photo.
        # @param [String] resource_name
        #   Required. The resource name of the contact whose photo will be deleted.
        # @param [String] person_fields
        #   Optional. A field mask to restrict which fields on the person are returned.
        #   Multiple
        #   fields can be specified by separating them with commas. Defaults to empty
        #   if not set, which will skip the post mutate get. Valid values are:
        #   * addresses
        #   * ageRanges
        #   * biographies
        #   * birthdays
        #   * braggingRights
        #   * coverPhotos
        #   * emailAddresses
        #   * events
        #   * genders
        #   * imClients
        #   * interests
        #   * locales
        #   * memberships
        #   * metadata
        #   * names
        #   * nicknames
        #   * occupations
        #   * organizations
        #   * phoneNumbers
        #   * photos
        #   * relations
        #   * relationshipInterests
        #   * relationshipStatuses
        #   * residences
        #   * sipAddresses
        #   * skills
        #   * taglines
        #   * urls
        #   * userDefined
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PeopleV1::DeleteContactPhotoResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PeopleV1::DeleteContactPhotoResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_person_contact_photo(resource_name, person_fields: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/{+resourceName}:deleteContactPhoto', options)
          command.response_representation = Google::Apis::PeopleV1::DeleteContactPhotoResponse::Representation
          command.response_class = Google::Apis::PeopleV1::DeleteContactPhotoResponse
          command.params['resourceName'] = resource_name unless resource_name.nil?
          command.query['personFields'] = person_fields unless person_fields.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Provides information about a person by specifying a resource name. Use
        # `people/me` to indicate the authenticated user.
        # <br>
        # The request throws a 400 error if 'personFields' is not specified.
        # @param [String] resource_name
        #   Required. The resource name of the person to provide information about.
        #   - To get information about the authenticated user, specify `people/me`.
        #   - To get information about a google account, specify
        #   `people/`<var>account_id</var>.
        #   - To get information about a contact, specify the resource name that
        #   identifies the contact as returned by
        #   [`people.connections.list`](/people/api/rest/v1/people.connections/list).
        # @param [String] person_fields
        #   Required. A field mask to restrict which fields on the person are returned.
        #   Multiple
        #   fields can be specified by separating them with commas. Valid values are:
        #   * addresses
        #   * ageRanges
        #   * biographies
        #   * birthdays
        #   * braggingRights
        #   * coverPhotos
        #   * emailAddresses
        #   * events
        #   * genders
        #   * imClients
        #   * interests
        #   * locales
        #   * memberships
        #   * metadata
        #   * names
        #   * nicknames
        #   * occupations
        #   * organizations
        #   * phoneNumbers
        #   * photos
        #   * relations
        #   * relationshipInterests
        #   * relationshipStatuses
        #   * residences
        #   * sipAddresses
        #   * skills
        #   * taglines
        #   * urls
        #   * userDefined
        # @param [String] request_mask_include_field
        #   Required. Comma-separated list of person fields to be included in the response.
        #   Each
        #   path should start with `person.`: for example, `person.names` or
        #   `person.photos`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PeopleV1::Person] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PeopleV1::Person]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_person(resource_name, person_fields: nil, request_mask_include_field: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+resourceName}', options)
          command.response_representation = Google::Apis::PeopleV1::Person::Representation
          command.response_class = Google::Apis::PeopleV1::Person
          command.params['resourceName'] = resource_name unless resource_name.nil?
          command.query['personFields'] = person_fields unless person_fields.nil?
          command.query['requestMask.includeField'] = request_mask_include_field unless request_mask_include_field.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Provides information about a list of specific people by specifying a list
        # of requested resource names. Use `people/me` to indicate the authenticated
        # user.
        # <br>
        # The request throws a 400 error if 'personFields' is not specified.
        # @param [String] person_fields
        #   Required. A field mask to restrict which fields on each person are returned.
        #   Multiple
        #   fields can be specified by separating them with commas. Valid values are:
        #   * addresses
        #   * ageRanges
        #   * biographies
        #   * birthdays
        #   * braggingRights
        #   * coverPhotos
        #   * emailAddresses
        #   * events
        #   * genders
        #   * imClients
        #   * interests
        #   * locales
        #   * memberships
        #   * metadata
        #   * names
        #   * nicknames
        #   * occupations
        #   * organizations
        #   * phoneNumbers
        #   * photos
        #   * relations
        #   * relationshipInterests
        #   * relationshipStatuses
        #   * residences
        #   * sipAddresses
        #   * skills
        #   * taglines
        #   * urls
        #   * userDefined
        # @param [String] request_mask_include_field
        #   Required. Comma-separated list of person fields to be included in the response.
        #   Each
        #   path should start with `person.`: for example, `person.names` or
        #   `person.photos`.
        # @param [Array<String>, String] resource_names
        #   Required. The resource names of the people to provide information about.
        #   - To get information about the authenticated user, specify `people/me`.
        #   - To get information about a google account, specify
        #   `people/`<var>account_id</var>.
        #   - To get information about a contact, specify the resource name that
        #   identifies the contact as returned by
        #   [`people.connections.list`](/people/api/rest/v1/people.connections/list).
        #   You can include up to 50 resource names in one request.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PeopleV1::GetPeopleResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PeopleV1::GetPeopleResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_people(person_fields: nil, request_mask_include_field: nil, resource_names: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/people:batchGet', options)
          command.response_representation = Google::Apis::PeopleV1::GetPeopleResponse::Representation
          command.response_class = Google::Apis::PeopleV1::GetPeopleResponse
          command.query['personFields'] = person_fields unless person_fields.nil?
          command.query['requestMask.includeField'] = request_mask_include_field unless request_mask_include_field.nil?
          command.query['resourceNames'] = resource_names unless resource_names.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update contact data for an existing contact person. Any non-contact data
        # will not be modified.
        # The request throws a 400 error if `updatePersonFields` is not specified.
        # <br>
        # The request throws a 400 error if `person.metadata.sources` is not
        # specified for the contact to be updated.
        # <br>
        # The request throws a 400 error with an error with reason
        # `"failedPrecondition"` if `person.metadata.sources.etag` is different than
        # the contact's etag, which indicates the contact has changed since its data
        # was read. Clients should get the latest person and re-apply their updates
        # to the latest person.
        # @param [String] resource_name
        #   The resource name for the person, assigned by the server. An ASCII string
        #   with a max length of 27 characters, in the form of
        #   `people/`<var>person_id</var>.
        # @param [Google::Apis::PeopleV1::Person] person_object
        # @param [String] update_person_fields
        #   Required. A field mask to restrict which fields on the person are updated.
        #   Multiple
        #   fields can be specified by separating them with commas.
        #   All updated fields will be replaced. Valid values are:
        #   * addresses
        #   * biographies
        #   * birthdays
        #   * emailAddresses
        #   * events
        #   * genders
        #   * imClients
        #   * interests
        #   * locales
        #   * memberships
        #   * names
        #   * nicknames
        #   * occupations
        #   * organizations
        #   * phoneNumbers
        #   * relations
        #   * residences
        #   * sipAddresses
        #   * urls
        #   * userDefined
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PeopleV1::Person] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PeopleV1::Person]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_person_contact(resource_name, person_object = nil, update_person_fields: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/{+resourceName}:updateContact', options)
          command.request_representation = Google::Apis::PeopleV1::Person::Representation
          command.request_object = person_object
          command.response_representation = Google::Apis::PeopleV1::Person::Representation
          command.response_class = Google::Apis::PeopleV1::Person
          command.params['resourceName'] = resource_name unless resource_name.nil?
          command.query['updatePersonFields'] = update_person_fields unless update_person_fields.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update a contact's photo.
        # @param [String] resource_name
        #   Required. Person resource name
        # @param [Google::Apis::PeopleV1::UpdateContactPhotoRequest] update_contact_photo_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PeopleV1::UpdateContactPhotoResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PeopleV1::UpdateContactPhotoResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_person_contact_photo(resource_name, update_contact_photo_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/{+resourceName}:updateContactPhoto', options)
          command.request_representation = Google::Apis::PeopleV1::UpdateContactPhotoRequest::Representation
          command.request_object = update_contact_photo_request_object
          command.response_representation = Google::Apis::PeopleV1::UpdateContactPhotoResponse::Representation
          command.response_class = Google::Apis::PeopleV1::UpdateContactPhotoResponse
          command.params['resourceName'] = resource_name unless resource_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Provides a list of the authenticated user's contacts merged with any
        # connected profiles.
        # <br>
        # The request throws a 400 error if 'personFields' is not specified.
        # @param [String] resource_name
        #   Required. The resource name to return connections for. Only `people/me` is
        #   valid.
        # @param [Fixnum] page_size
        #   Optional. The number of connections to include in the response. Valid values
        #   are
        #   between 1 and 2000, inclusive. Defaults to 100 if not set or set to 0.
        # @param [String] page_token
        #   The token of the page to be returned.
        # @param [String] person_fields
        #   Required. A field mask to restrict which fields on each person are returned.
        #   Multiple
        #   fields can be specified by separating them with commas. Valid values are:
        #   * addresses
        #   * ageRanges
        #   * biographies
        #   * birthdays
        #   * braggingRights
        #   * coverPhotos
        #   * emailAddresses
        #   * events
        #   * genders
        #   * imClients
        #   * interests
        #   * locales
        #   * memberships
        #   * metadata
        #   * names
        #   * nicknames
        #   * occupations
        #   * organizations
        #   * phoneNumbers
        #   * photos
        #   * relations
        #   * relationshipInterests
        #   * relationshipStatuses
        #   * residences
        #   * sipAddresses
        #   * skills
        #   * taglines
        #   * urls
        #   * userDefined
        # @param [String] request_mask_include_field
        #   Required. Comma-separated list of person fields to be included in the response.
        #   Each
        #   path should start with `person.`: for example, `person.names` or
        #   `person.photos`.
        # @param [Boolean] request_sync_token
        #   Whether the response should include a sync token, which can be used to get
        #   all changes since the last request. For subsequent sync requests use the
        #   `sync_token` param instead. Initial sync requests that specify
        #   `request_sync_token` have an additional rate limit.
        # @param [String] sort_order
        #   The order in which the connections should be sorted. Defaults to
        #   `LAST_MODIFIED_ASCENDING`.
        # @param [String] sync_token
        #   A sync token returned by a previous call to `people.connections.list`.
        #   Only resources changed since the sync token was created will be returned.
        #   Sync requests that specify `sync_token` have an additional rate limit.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PeopleV1::ListConnectionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PeopleV1::ListConnectionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_person_connections(resource_name, page_size: nil, page_token: nil, person_fields: nil, request_mask_include_field: nil, request_sync_token: nil, sort_order: nil, sync_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+resourceName}/connections', options)
          command.response_representation = Google::Apis::PeopleV1::ListConnectionsResponse::Representation
          command.response_class = Google::Apis::PeopleV1::ListConnectionsResponse
          command.params['resourceName'] = resource_name unless resource_name.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['personFields'] = person_fields unless person_fields.nil?
          command.query['requestMask.includeField'] = request_mask_include_field unless request_mask_include_field.nil?
          command.query['requestSyncToken'] = request_sync_token unless request_sync_token.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['syncToken'] = sync_token unless sync_token.nil?
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
