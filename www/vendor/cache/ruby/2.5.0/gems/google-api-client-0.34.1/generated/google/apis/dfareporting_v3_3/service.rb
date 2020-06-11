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
    module DfareportingV3_3
      # DCM/DFA Reporting And Trafficking API
      #
      # Manages your DoubleClick Campaign Manager ad campaigns and reports.
      #
      # @example
      #    require 'google/apis/dfareporting_v3_3'
      #
      #    Dfareporting = Google::Apis::DfareportingV3_3 # Alias the module
      #    service = Dfareporting::DfareportingService.new
      #
      # @see https://developers.google.com/doubleclick-advertisers/
      class DfareportingService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  An opaque string that represents a user for quota purposes. Must not exceed 40
        #  characters.
        attr_accessor :quota_user

        # @return [String]
        #  Deprecated. Please use quotaUser instead.
        attr_accessor :user_ip

        def initialize
          super('https://www.googleapis.com/', 'dfareporting/v3.3/')
          @batch_path = 'batch/dfareporting/v3.3'
        end
        
        # Gets the account's active ad summary by account ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] summary_account_id
        #   Account ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::AccountActiveAdSummary] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::AccountActiveAdSummary]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_account_active_ad_summary(profile_id, summary_account_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/accountActiveAdSummaries/{summaryAccountId}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::AccountActiveAdSummary::Representation
          command.response_class = Google::Apis::DfareportingV3_3::AccountActiveAdSummary
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['summaryAccountId'] = summary_account_id unless summary_account_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one account permission group by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Account permission group ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::AccountPermissionGroup] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::AccountPermissionGroup]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_account_permission_group(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/accountPermissionGroups/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::AccountPermissionGroup::Representation
          command.response_class = Google::Apis::DfareportingV3_3::AccountPermissionGroup
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the list of account permission groups.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::AccountPermissionGroupsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::AccountPermissionGroupsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_account_permission_groups(profile_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/accountPermissionGroups', options)
          command.response_representation = Google::Apis::DfareportingV3_3::AccountPermissionGroupsListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::AccountPermissionGroupsListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one account permission by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Account permission ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::AccountPermission] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::AccountPermission]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_account_permission(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/accountPermissions/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::AccountPermission::Representation
          command.response_class = Google::Apis::DfareportingV3_3::AccountPermission
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the list of account permissions.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::AccountPermissionsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::AccountPermissionsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_account_permissions(profile_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/accountPermissions', options)
          command.response_representation = Google::Apis::DfareportingV3_3::AccountPermissionsListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::AccountPermissionsListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one account user profile by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   User profile ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::AccountUserProfile] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::AccountUserProfile]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_account_user_profile(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/accountUserProfiles/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::AccountUserProfile::Representation
          command.response_class = Google::Apis::DfareportingV3_3::AccountUserProfile
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a new account user profile.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::AccountUserProfile] account_user_profile_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::AccountUserProfile] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::AccountUserProfile]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_account_user_profile(profile_id, account_user_profile_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/accountUserProfiles', options)
          command.request_representation = Google::Apis::DfareportingV3_3::AccountUserProfile::Representation
          command.request_object = account_user_profile_object
          command.response_representation = Google::Apis::DfareportingV3_3::AccountUserProfile::Representation
          command.response_class = Google::Apis::DfareportingV3_3::AccountUserProfile
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of account user profiles, possibly filtered. This method
        # supports paging.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Boolean] active
        #   Select only active user profiles.
        # @param [Array<Fixnum>, Fixnum] ids
        #   Select only user profiles with these IDs.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [String] page_token
        #   Value of the nextPageToken from the previous result page.
        # @param [String] search_string
        #   Allows searching for objects by name, ID or email. Wildcards (*) are allowed.
        #   For example, "user profile*2015" will return objects with names like "user
        #   profile June 2015", "user profile April 2015", or simply "user profile 2015".
        #   Most of the searches also add wildcards implicitly at the start and the end of
        #   the search string. For example, a search string of "user profile" will match
        #   objects with name "my user profile", "user profile 2015", or simply "user
        #   profile".
        # @param [String] sort_field
        #   Field by which to sort the list.
        # @param [String] sort_order
        #   Order of sorted results.
        # @param [Fixnum] subaccount_id
        #   Select only user profiles with the specified subaccount ID.
        # @param [Fixnum] user_role_id
        #   Select only user profiles with the specified user role ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::AccountUserProfilesListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::AccountUserProfilesListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_account_user_profiles(profile_id, active: nil, ids: nil, max_results: nil, page_token: nil, search_string: nil, sort_field: nil, sort_order: nil, subaccount_id: nil, user_role_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/accountUserProfiles', options)
          command.response_representation = Google::Apis::DfareportingV3_3::AccountUserProfilesListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::AccountUserProfilesListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['active'] = active unless active.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['searchString'] = search_string unless search_string.nil?
          command.query['sortField'] = sort_field unless sort_field.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['subaccountId'] = subaccount_id unless subaccount_id.nil?
          command.query['userRoleId'] = user_role_id unless user_role_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing account user profile. This method supports patch semantics.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   User profile ID.
        # @param [Google::Apis::DfareportingV3_3::AccountUserProfile] account_user_profile_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::AccountUserProfile] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::AccountUserProfile]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_account_user_profile(profile_id, id, account_user_profile_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'userprofiles/{profileId}/accountUserProfiles', options)
          command.request_representation = Google::Apis::DfareportingV3_3::AccountUserProfile::Representation
          command.request_object = account_user_profile_object
          command.response_representation = Google::Apis::DfareportingV3_3::AccountUserProfile::Representation
          command.response_class = Google::Apis::DfareportingV3_3::AccountUserProfile
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing account user profile.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::AccountUserProfile] account_user_profile_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::AccountUserProfile] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::AccountUserProfile]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_account_user_profile(profile_id, account_user_profile_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'userprofiles/{profileId}/accountUserProfiles', options)
          command.request_representation = Google::Apis::DfareportingV3_3::AccountUserProfile::Representation
          command.request_object = account_user_profile_object
          command.response_representation = Google::Apis::DfareportingV3_3::AccountUserProfile::Representation
          command.response_class = Google::Apis::DfareportingV3_3::AccountUserProfile
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one account by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Account ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Account] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Account]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_account(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/accounts/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::Account::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Account
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the list of accounts, possibly filtered. This method supports paging.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Boolean] active
        #   Select only active accounts. Don't set this field to select both active and
        #   non-active accounts.
        # @param [Array<Fixnum>, Fixnum] ids
        #   Select only accounts with these IDs.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [String] page_token
        #   Value of the nextPageToken from the previous result page.
        # @param [String] search_string
        #   Allows searching for objects by name or ID. Wildcards (*) are allowed. For
        #   example, "account*2015" will return objects with names like "account June 2015"
        #   , "account April 2015", or simply "account 2015". Most of the searches also
        #   add wildcards implicitly at the start and the end of the search string. For
        #   example, a search string of "account" will match objects with name "my account"
        #   , "account 2015", or simply "account".
        # @param [String] sort_field
        #   Field by which to sort the list.
        # @param [String] sort_order
        #   Order of sorted results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::AccountsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::AccountsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_accounts(profile_id, active: nil, ids: nil, max_results: nil, page_token: nil, search_string: nil, sort_field: nil, sort_order: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/accounts', options)
          command.response_representation = Google::Apis::DfareportingV3_3::AccountsListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::AccountsListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['active'] = active unless active.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['searchString'] = search_string unless search_string.nil?
          command.query['sortField'] = sort_field unless sort_field.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing account. This method supports patch semantics.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Account ID.
        # @param [Google::Apis::DfareportingV3_3::Account] account_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Account] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Account]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_account(profile_id, id, account_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'userprofiles/{profileId}/accounts', options)
          command.request_representation = Google::Apis::DfareportingV3_3::Account::Representation
          command.request_object = account_object
          command.response_representation = Google::Apis::DfareportingV3_3::Account::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Account
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing account.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::Account] account_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Account] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Account]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_account(profile_id, account_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'userprofiles/{profileId}/accounts', options)
          command.request_representation = Google::Apis::DfareportingV3_3::Account::Representation
          command.request_object = account_object
          command.response_representation = Google::Apis::DfareportingV3_3::Account::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Account
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one ad by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Ad ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Ad] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Ad]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_ad(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/ads/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::Ad::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Ad
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a new ad.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::Ad] ad_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Ad] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Ad]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_ad(profile_id, ad_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/ads', options)
          command.request_representation = Google::Apis::DfareportingV3_3::Ad::Representation
          command.request_object = ad_object
          command.response_representation = Google::Apis::DfareportingV3_3::Ad::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Ad
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of ads, possibly filtered. This method supports paging.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Boolean] active
        #   Select only active ads.
        # @param [Fixnum] advertiser_id
        #   Select only ads with this advertiser ID.
        # @param [Boolean] archived
        #   Select only archived ads.
        # @param [Array<Fixnum>, Fixnum] audience_segment_ids
        #   Select only ads with these audience segment IDs.
        # @param [Array<Fixnum>, Fixnum] campaign_ids
        #   Select only ads with these campaign IDs.
        # @param [String] compatibility
        #   Select default ads with the specified compatibility. Applicable when type is
        #   AD_SERVING_DEFAULT_AD. DISPLAY and DISPLAY_INTERSTITIAL refer to rendering
        #   either on desktop or on mobile devices for regular or interstitial ads,
        #   respectively. APP and APP_INTERSTITIAL are for rendering in mobile apps.
        #   IN_STREAM_VIDEO refers to rendering an in-stream video ads developed with the
        #   VAST standard.
        # @param [Array<Fixnum>, Fixnum] creative_ids
        #   Select only ads with these creative IDs assigned.
        # @param [Array<Fixnum>, Fixnum] creative_optimization_configuration_ids
        #   Select only ads with these creative optimization configuration IDs.
        # @param [Boolean] dynamic_click_tracker
        #   Select only dynamic click trackers. Applicable when type is
        #   AD_SERVING_CLICK_TRACKER. If true, select dynamic click trackers. If false,
        #   select static click trackers. Leave unset to select both.
        # @param [Array<Fixnum>, Fixnum] ids
        #   Select only ads with these IDs.
        # @param [Array<Fixnum>, Fixnum] landing_page_ids
        #   Select only ads with these landing page IDs.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [Fixnum] overridden_event_tag_id
        #   Select only ads with this event tag override ID.
        # @param [String] page_token
        #   Value of the nextPageToken from the previous result page.
        # @param [Array<Fixnum>, Fixnum] placement_ids
        #   Select only ads with these placement IDs assigned.
        # @param [Array<Fixnum>, Fixnum] remarketing_list_ids
        #   Select only ads whose list targeting expression use these remarketing list IDs.
        # @param [String] search_string
        #   Allows searching for objects by name or ID. Wildcards (*) are allowed. For
        #   example, "ad*2015" will return objects with names like "ad June 2015", "ad
        #   April 2015", or simply "ad 2015". Most of the searches also add wildcards
        #   implicitly at the start and the end of the search string. For example, a
        #   search string of "ad" will match objects with name "my ad", "ad 2015", or
        #   simply "ad".
        # @param [Array<Fixnum>, Fixnum] size_ids
        #   Select only ads with these size IDs.
        # @param [String] sort_field
        #   Field by which to sort the list.
        # @param [String] sort_order
        #   Order of sorted results.
        # @param [Boolean] ssl_compliant
        #   Select only ads that are SSL-compliant.
        # @param [Boolean] ssl_required
        #   Select only ads that require SSL.
        # @param [Array<String>, String] type
        #   Select only ads with these types.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::AdsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::AdsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_ads(profile_id, active: nil, advertiser_id: nil, archived: nil, audience_segment_ids: nil, campaign_ids: nil, compatibility: nil, creative_ids: nil, creative_optimization_configuration_ids: nil, dynamic_click_tracker: nil, ids: nil, landing_page_ids: nil, max_results: nil, overridden_event_tag_id: nil, page_token: nil, placement_ids: nil, remarketing_list_ids: nil, search_string: nil, size_ids: nil, sort_field: nil, sort_order: nil, ssl_compliant: nil, ssl_required: nil, type: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/ads', options)
          command.response_representation = Google::Apis::DfareportingV3_3::AdsListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::AdsListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['active'] = active unless active.nil?
          command.query['advertiserId'] = advertiser_id unless advertiser_id.nil?
          command.query['archived'] = archived unless archived.nil?
          command.query['audienceSegmentIds'] = audience_segment_ids unless audience_segment_ids.nil?
          command.query['campaignIds'] = campaign_ids unless campaign_ids.nil?
          command.query['compatibility'] = compatibility unless compatibility.nil?
          command.query['creativeIds'] = creative_ids unless creative_ids.nil?
          command.query['creativeOptimizationConfigurationIds'] = creative_optimization_configuration_ids unless creative_optimization_configuration_ids.nil?
          command.query['dynamicClickTracker'] = dynamic_click_tracker unless dynamic_click_tracker.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['landingPageIds'] = landing_page_ids unless landing_page_ids.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['overriddenEventTagId'] = overridden_event_tag_id unless overridden_event_tag_id.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['placementIds'] = placement_ids unless placement_ids.nil?
          command.query['remarketingListIds'] = remarketing_list_ids unless remarketing_list_ids.nil?
          command.query['searchString'] = search_string unless search_string.nil?
          command.query['sizeIds'] = size_ids unless size_ids.nil?
          command.query['sortField'] = sort_field unless sort_field.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['sslCompliant'] = ssl_compliant unless ssl_compliant.nil?
          command.query['sslRequired'] = ssl_required unless ssl_required.nil?
          command.query['type'] = type unless type.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing ad. This method supports patch semantics.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Ad ID.
        # @param [Google::Apis::DfareportingV3_3::Ad] ad_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Ad] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Ad]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_ad(profile_id, id, ad_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'userprofiles/{profileId}/ads', options)
          command.request_representation = Google::Apis::DfareportingV3_3::Ad::Representation
          command.request_object = ad_object
          command.response_representation = Google::Apis::DfareportingV3_3::Ad::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Ad
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing ad.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::Ad] ad_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Ad] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Ad]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_ad(profile_id, ad_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'userprofiles/{profileId}/ads', options)
          command.request_representation = Google::Apis::DfareportingV3_3::Ad::Representation
          command.request_object = ad_object
          command.response_representation = Google::Apis::DfareportingV3_3::Ad::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Ad
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes an existing advertiser group.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Advertiser group ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_advertiser_group(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'userprofiles/{profileId}/advertiserGroups/{id}', options)
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one advertiser group by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Advertiser group ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::AdvertiserGroup] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::AdvertiserGroup]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_advertiser_group(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/advertiserGroups/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::AdvertiserGroup::Representation
          command.response_class = Google::Apis::DfareportingV3_3::AdvertiserGroup
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a new advertiser group.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::AdvertiserGroup] advertiser_group_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::AdvertiserGroup] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::AdvertiserGroup]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_advertiser_group(profile_id, advertiser_group_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/advertiserGroups', options)
          command.request_representation = Google::Apis::DfareportingV3_3::AdvertiserGroup::Representation
          command.request_object = advertiser_group_object
          command.response_representation = Google::Apis::DfareportingV3_3::AdvertiserGroup::Representation
          command.response_class = Google::Apis::DfareportingV3_3::AdvertiserGroup
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of advertiser groups, possibly filtered. This method supports
        # paging.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Array<Fixnum>, Fixnum] ids
        #   Select only advertiser groups with these IDs.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [String] page_token
        #   Value of the nextPageToken from the previous result page.
        # @param [String] search_string
        #   Allows searching for objects by name or ID. Wildcards (*) are allowed. For
        #   example, "advertiser*2015" will return objects with names like "advertiser
        #   group June 2015", "advertiser group April 2015", or simply "advertiser group
        #   2015". Most of the searches also add wildcards implicitly at the start and the
        #   end of the search string. For example, a search string of "advertisergroup"
        #   will match objects with name "my advertisergroup", "advertisergroup 2015", or
        #   simply "advertisergroup".
        # @param [String] sort_field
        #   Field by which to sort the list.
        # @param [String] sort_order
        #   Order of sorted results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::AdvertiserGroupsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::AdvertiserGroupsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_advertiser_groups(profile_id, ids: nil, max_results: nil, page_token: nil, search_string: nil, sort_field: nil, sort_order: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/advertiserGroups', options)
          command.response_representation = Google::Apis::DfareportingV3_3::AdvertiserGroupsListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::AdvertiserGroupsListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['searchString'] = search_string unless search_string.nil?
          command.query['sortField'] = sort_field unless sort_field.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing advertiser group. This method supports patch semantics.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Advertiser group ID.
        # @param [Google::Apis::DfareportingV3_3::AdvertiserGroup] advertiser_group_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::AdvertiserGroup] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::AdvertiserGroup]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_advertiser_group(profile_id, id, advertiser_group_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'userprofiles/{profileId}/advertiserGroups', options)
          command.request_representation = Google::Apis::DfareportingV3_3::AdvertiserGroup::Representation
          command.request_object = advertiser_group_object
          command.response_representation = Google::Apis::DfareportingV3_3::AdvertiserGroup::Representation
          command.response_class = Google::Apis::DfareportingV3_3::AdvertiserGroup
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing advertiser group.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::AdvertiserGroup] advertiser_group_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::AdvertiserGroup] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::AdvertiserGroup]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_advertiser_group(profile_id, advertiser_group_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'userprofiles/{profileId}/advertiserGroups', options)
          command.request_representation = Google::Apis::DfareportingV3_3::AdvertiserGroup::Representation
          command.request_object = advertiser_group_object
          command.response_representation = Google::Apis::DfareportingV3_3::AdvertiserGroup::Representation
          command.response_class = Google::Apis::DfareportingV3_3::AdvertiserGroup
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one landing page by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Landing page ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::LandingPage] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::LandingPage]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_advertiser_landing_page(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/advertiserLandingPages/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::LandingPage::Representation
          command.response_class = Google::Apis::DfareportingV3_3::LandingPage
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a new landing page.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::LandingPage] landing_page_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::LandingPage] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::LandingPage]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_advertiser_landing_page(profile_id, landing_page_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/advertiserLandingPages', options)
          command.request_representation = Google::Apis::DfareportingV3_3::LandingPage::Representation
          command.request_object = landing_page_object
          command.response_representation = Google::Apis::DfareportingV3_3::LandingPage::Representation
          command.response_class = Google::Apis::DfareportingV3_3::LandingPage
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of landing pages.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Array<Fixnum>, Fixnum] advertiser_ids
        #   Select only landing pages that belong to these advertisers.
        # @param [Boolean] archived
        #   Select only archived landing pages. Don't set this field to select both
        #   archived and non-archived landing pages.
        # @param [Array<Fixnum>, Fixnum] campaign_ids
        #   Select only landing pages that are associated with these campaigns.
        # @param [Array<Fixnum>, Fixnum] ids
        #   Select only landing pages with these IDs.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [String] page_token
        #   Value of the nextPageToken from the previous result page.
        # @param [String] search_string
        #   Allows searching for landing pages by name or ID. Wildcards (*) are allowed.
        #   For example, "landingpage*2017" will return landing pages with names like "
        #   landingpage July 2017", "landingpage March 2017", or simply "landingpage 2017".
        #   Most of the searches also add wildcards implicitly at the start and the end
        #   of the search string. For example, a search string of "landingpage" will match
        #   campaigns with name "my landingpage", "landingpage 2015", or simply "
        #   landingpage".
        # @param [String] sort_field
        #   Field by which to sort the list.
        # @param [String] sort_order
        #   Order of sorted results.
        # @param [Fixnum] subaccount_id
        #   Select only landing pages that belong to this subaccount.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::AdvertiserLandingPagesListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::AdvertiserLandingPagesListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_advertiser_landing_pages(profile_id, advertiser_ids: nil, archived: nil, campaign_ids: nil, ids: nil, max_results: nil, page_token: nil, search_string: nil, sort_field: nil, sort_order: nil, subaccount_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/advertiserLandingPages', options)
          command.response_representation = Google::Apis::DfareportingV3_3::AdvertiserLandingPagesListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::AdvertiserLandingPagesListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['advertiserIds'] = advertiser_ids unless advertiser_ids.nil?
          command.query['archived'] = archived unless archived.nil?
          command.query['campaignIds'] = campaign_ids unless campaign_ids.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['searchString'] = search_string unless search_string.nil?
          command.query['sortField'] = sort_field unless sort_field.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['subaccountId'] = subaccount_id unless subaccount_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing landing page. This method supports patch semantics.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Landing page ID.
        # @param [Google::Apis::DfareportingV3_3::LandingPage] landing_page_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::LandingPage] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::LandingPage]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_advertiser_landing_page(profile_id, id, landing_page_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'userprofiles/{profileId}/advertiserLandingPages', options)
          command.request_representation = Google::Apis::DfareportingV3_3::LandingPage::Representation
          command.request_object = landing_page_object
          command.response_representation = Google::Apis::DfareportingV3_3::LandingPage::Representation
          command.response_class = Google::Apis::DfareportingV3_3::LandingPage
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing landing page.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::LandingPage] landing_page_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::LandingPage] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::LandingPage]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_advertiser_landing_page(profile_id, landing_page_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'userprofiles/{profileId}/advertiserLandingPages', options)
          command.request_representation = Google::Apis::DfareportingV3_3::LandingPage::Representation
          command.request_object = landing_page_object
          command.response_representation = Google::Apis::DfareportingV3_3::LandingPage::Representation
          command.response_class = Google::Apis::DfareportingV3_3::LandingPage
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one advertiser by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Advertiser ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Advertiser] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Advertiser]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_advertiser(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/advertisers/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::Advertiser::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Advertiser
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a new advertiser.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::Advertiser] advertiser_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Advertiser] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Advertiser]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_advertiser(profile_id, advertiser_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/advertisers', options)
          command.request_representation = Google::Apis::DfareportingV3_3::Advertiser::Representation
          command.request_object = advertiser_object
          command.response_representation = Google::Apis::DfareportingV3_3::Advertiser::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Advertiser
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of advertisers, possibly filtered. This method supports
        # paging.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Array<Fixnum>, Fixnum] advertiser_group_ids
        #   Select only advertisers with these advertiser group IDs.
        # @param [Array<Fixnum>, Fixnum] floodlight_configuration_ids
        #   Select only advertisers with these floodlight configuration IDs.
        # @param [Array<Fixnum>, Fixnum] ids
        #   Select only advertisers with these IDs.
        # @param [Boolean] include_advertisers_without_groups_only
        #   Select only advertisers which do not belong to any advertiser group.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [Boolean] only_parent
        #   Select only advertisers which use another advertiser's floodlight
        #   configuration.
        # @param [String] page_token
        #   Value of the nextPageToken from the previous result page.
        # @param [String] search_string
        #   Allows searching for objects by name or ID. Wildcards (*) are allowed. For
        #   example, "advertiser*2015" will return objects with names like "advertiser
        #   June 2015", "advertiser April 2015", or simply "advertiser 2015". Most of the
        #   searches also add wildcards implicitly at the start and the end of the search
        #   string. For example, a search string of "advertiser" will match objects with
        #   name "my advertiser", "advertiser 2015", or simply "advertiser".
        # @param [String] sort_field
        #   Field by which to sort the list.
        # @param [String] sort_order
        #   Order of sorted results.
        # @param [String] status
        #   Select only advertisers with the specified status.
        # @param [Fixnum] subaccount_id
        #   Select only advertisers with these subaccount IDs.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::AdvertisersListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::AdvertisersListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_advertisers(profile_id, advertiser_group_ids: nil, floodlight_configuration_ids: nil, ids: nil, include_advertisers_without_groups_only: nil, max_results: nil, only_parent: nil, page_token: nil, search_string: nil, sort_field: nil, sort_order: nil, status: nil, subaccount_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/advertisers', options)
          command.response_representation = Google::Apis::DfareportingV3_3::AdvertisersListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::AdvertisersListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['advertiserGroupIds'] = advertiser_group_ids unless advertiser_group_ids.nil?
          command.query['floodlightConfigurationIds'] = floodlight_configuration_ids unless floodlight_configuration_ids.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['includeAdvertisersWithoutGroupsOnly'] = include_advertisers_without_groups_only unless include_advertisers_without_groups_only.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['onlyParent'] = only_parent unless only_parent.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['searchString'] = search_string unless search_string.nil?
          command.query['sortField'] = sort_field unless sort_field.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['status'] = status unless status.nil?
          command.query['subaccountId'] = subaccount_id unless subaccount_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing advertiser. This method supports patch semantics.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Advertiser ID.
        # @param [Google::Apis::DfareportingV3_3::Advertiser] advertiser_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Advertiser] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Advertiser]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_advertiser(profile_id, id, advertiser_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'userprofiles/{profileId}/advertisers', options)
          command.request_representation = Google::Apis::DfareportingV3_3::Advertiser::Representation
          command.request_object = advertiser_object
          command.response_representation = Google::Apis::DfareportingV3_3::Advertiser::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Advertiser
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing advertiser.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::Advertiser] advertiser_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Advertiser] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Advertiser]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_advertiser(profile_id, advertiser_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'userprofiles/{profileId}/advertisers', options)
          command.request_representation = Google::Apis::DfareportingV3_3::Advertiser::Representation
          command.request_object = advertiser_object
          command.response_representation = Google::Apis::DfareportingV3_3::Advertiser::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Advertiser
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of browsers.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::BrowsersListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::BrowsersListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_browsers(profile_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/browsers', options)
          command.response_representation = Google::Apis::DfareportingV3_3::BrowsersListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::BrowsersListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Associates a creative with the specified campaign. This method creates a
        # default ad with dimensions matching the creative in the campaign if such a
        # default ad does not exist already.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] campaign_id
        #   Campaign ID in this association.
        # @param [Google::Apis::DfareportingV3_3::CampaignCreativeAssociation] campaign_creative_association_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::CampaignCreativeAssociation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::CampaignCreativeAssociation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_campaign_creative_association(profile_id, campaign_id, campaign_creative_association_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/campaigns/{campaignId}/campaignCreativeAssociations', options)
          command.request_representation = Google::Apis::DfareportingV3_3::CampaignCreativeAssociation::Representation
          command.request_object = campaign_creative_association_object
          command.response_representation = Google::Apis::DfareportingV3_3::CampaignCreativeAssociation::Representation
          command.response_class = Google::Apis::DfareportingV3_3::CampaignCreativeAssociation
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['campaignId'] = campaign_id unless campaign_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the list of creative IDs associated with the specified campaign.
        # This method supports paging.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] campaign_id
        #   Campaign ID in this association.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [String] page_token
        #   Value of the nextPageToken from the previous result page.
        # @param [String] sort_order
        #   Order of sorted results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::CampaignCreativeAssociationsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::CampaignCreativeAssociationsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_campaign_creative_associations(profile_id, campaign_id, max_results: nil, page_token: nil, sort_order: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/campaigns/{campaignId}/campaignCreativeAssociations', options)
          command.response_representation = Google::Apis::DfareportingV3_3::CampaignCreativeAssociationsListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::CampaignCreativeAssociationsListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['campaignId'] = campaign_id unless campaign_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one campaign by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Campaign ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Campaign] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Campaign]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_campaign(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/campaigns/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::Campaign::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Campaign
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a new campaign.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::Campaign] campaign_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Campaign] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Campaign]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_campaign(profile_id, campaign_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/campaigns', options)
          command.request_representation = Google::Apis::DfareportingV3_3::Campaign::Representation
          command.request_object = campaign_object
          command.response_representation = Google::Apis::DfareportingV3_3::Campaign::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Campaign
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of campaigns, possibly filtered. This method supports paging.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Array<Fixnum>, Fixnum] advertiser_group_ids
        #   Select only campaigns whose advertisers belong to these advertiser groups.
        # @param [Array<Fixnum>, Fixnum] advertiser_ids
        #   Select only campaigns that belong to these advertisers.
        # @param [Boolean] archived
        #   Select only archived campaigns. Don't set this field to select both archived
        #   and non-archived campaigns.
        # @param [Boolean] at_least_one_optimization_activity
        #   Select only campaigns that have at least one optimization activity.
        # @param [Array<Fixnum>, Fixnum] excluded_ids
        #   Exclude campaigns with these IDs.
        # @param [Array<Fixnum>, Fixnum] ids
        #   Select only campaigns with these IDs.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [Fixnum] overridden_event_tag_id
        #   Select only campaigns that have overridden this event tag ID.
        # @param [String] page_token
        #   Value of the nextPageToken from the previous result page.
        # @param [String] search_string
        #   Allows searching for campaigns by name or ID. Wildcards (*) are allowed. For
        #   example, "campaign*2015" will return campaigns with names like "campaign June
        #   2015", "campaign April 2015", or simply "campaign 2015". Most of the searches
        #   also add wildcards implicitly at the start and the end of the search string.
        #   For example, a search string of "campaign" will match campaigns with name "my
        #   campaign", "campaign 2015", or simply "campaign".
        # @param [String] sort_field
        #   Field by which to sort the list.
        # @param [String] sort_order
        #   Order of sorted results.
        # @param [Fixnum] subaccount_id
        #   Select only campaigns that belong to this subaccount.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::CampaignsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::CampaignsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_campaigns(profile_id, advertiser_group_ids: nil, advertiser_ids: nil, archived: nil, at_least_one_optimization_activity: nil, excluded_ids: nil, ids: nil, max_results: nil, overridden_event_tag_id: nil, page_token: nil, search_string: nil, sort_field: nil, sort_order: nil, subaccount_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/campaigns', options)
          command.response_representation = Google::Apis::DfareportingV3_3::CampaignsListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::CampaignsListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['advertiserGroupIds'] = advertiser_group_ids unless advertiser_group_ids.nil?
          command.query['advertiserIds'] = advertiser_ids unless advertiser_ids.nil?
          command.query['archived'] = archived unless archived.nil?
          command.query['atLeastOneOptimizationActivity'] = at_least_one_optimization_activity unless at_least_one_optimization_activity.nil?
          command.query['excludedIds'] = excluded_ids unless excluded_ids.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['overriddenEventTagId'] = overridden_event_tag_id unless overridden_event_tag_id.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['searchString'] = search_string unless search_string.nil?
          command.query['sortField'] = sort_field unless sort_field.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['subaccountId'] = subaccount_id unless subaccount_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing campaign. This method supports patch semantics.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Campaign ID.
        # @param [Google::Apis::DfareportingV3_3::Campaign] campaign_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Campaign] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Campaign]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_campaign(profile_id, id, campaign_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'userprofiles/{profileId}/campaigns', options)
          command.request_representation = Google::Apis::DfareportingV3_3::Campaign::Representation
          command.request_object = campaign_object
          command.response_representation = Google::Apis::DfareportingV3_3::Campaign::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Campaign
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing campaign.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::Campaign] campaign_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Campaign] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Campaign]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_campaign(profile_id, campaign_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'userprofiles/{profileId}/campaigns', options)
          command.request_representation = Google::Apis::DfareportingV3_3::Campaign::Representation
          command.request_object = campaign_object
          command.response_representation = Google::Apis::DfareportingV3_3::Campaign::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Campaign
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one change log by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Change log ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::ChangeLog] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::ChangeLog]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_change_log(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/changeLogs/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::ChangeLog::Representation
          command.response_class = Google::Apis::DfareportingV3_3::ChangeLog
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of change logs. This method supports paging.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [String] action
        #   Select only change logs with the specified action.
        # @param [Array<Fixnum>, Fixnum] ids
        #   Select only change logs with these IDs.
        # @param [String] max_change_time
        #   Select only change logs whose change time is before the specified
        #   maxChangeTime.The time should be formatted as an RFC3339 date/time string. For
        #   example, for 10:54 PM on July 18th, 2015, in the America/New York time zone,
        #   the format is "2015-07-18T22:54:00-04:00". In other words, the year, month,
        #   day, the letter T, the hour (24-hour clock system), minute, second, and then
        #   the time zone offset.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [String] min_change_time
        #   Select only change logs whose change time is before the specified
        #   minChangeTime.The time should be formatted as an RFC3339 date/time string. For
        #   example, for 10:54 PM on July 18th, 2015, in the America/New York time zone,
        #   the format is "2015-07-18T22:54:00-04:00". In other words, the year, month,
        #   day, the letter T, the hour (24-hour clock system), minute, second, and then
        #   the time zone offset.
        # @param [Array<Fixnum>, Fixnum] object_ids
        #   Select only change logs with these object IDs.
        # @param [String] object_type
        #   Select only change logs with the specified object type.
        # @param [String] page_token
        #   Value of the nextPageToken from the previous result page.
        # @param [String] search_string
        #   Select only change logs whose object ID, user name, old or new values match
        #   the search string.
        # @param [Array<Fixnum>, Fixnum] user_profile_ids
        #   Select only change logs with these user profile IDs.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::ChangeLogsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::ChangeLogsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_change_logs(profile_id, action: nil, ids: nil, max_change_time: nil, max_results: nil, min_change_time: nil, object_ids: nil, object_type: nil, page_token: nil, search_string: nil, user_profile_ids: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/changeLogs', options)
          command.response_representation = Google::Apis::DfareportingV3_3::ChangeLogsListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::ChangeLogsListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['action'] = action unless action.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['maxChangeTime'] = max_change_time unless max_change_time.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['minChangeTime'] = min_change_time unless min_change_time.nil?
          command.query['objectIds'] = object_ids unless object_ids.nil?
          command.query['objectType'] = object_type unless object_type.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['searchString'] = search_string unless search_string.nil?
          command.query['userProfileIds'] = user_profile_ids unless user_profile_ids.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of cities, possibly filtered.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Array<Fixnum>, Fixnum] country_dart_ids
        #   Select only cities from these countries.
        # @param [Array<Fixnum>, Fixnum] dart_ids
        #   Select only cities with these DART IDs.
        # @param [String] name_prefix
        #   Select only cities with names starting with this prefix.
        # @param [Array<Fixnum>, Fixnum] region_dart_ids
        #   Select only cities from these regions.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::CitiesListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::CitiesListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_cities(profile_id, country_dart_ids: nil, dart_ids: nil, name_prefix: nil, region_dart_ids: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/cities', options)
          command.response_representation = Google::Apis::DfareportingV3_3::CitiesListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::CitiesListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['countryDartIds'] = country_dart_ids unless country_dart_ids.nil?
          command.query['dartIds'] = dart_ids unless dart_ids.nil?
          command.query['namePrefix'] = name_prefix unless name_prefix.nil?
          command.query['regionDartIds'] = region_dart_ids unless region_dart_ids.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one connection type by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Connection type ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::ConnectionType] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::ConnectionType]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_connection_type(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/connectionTypes/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::ConnectionType::Representation
          command.response_class = Google::Apis::DfareportingV3_3::ConnectionType
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of connection types.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::ConnectionTypesListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::ConnectionTypesListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_connection_types(profile_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/connectionTypes', options)
          command.response_representation = Google::Apis::DfareportingV3_3::ConnectionTypesListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::ConnectionTypesListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes an existing content category.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Content category ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_content_category(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'userprofiles/{profileId}/contentCategories/{id}', options)
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one content category by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Content category ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::ContentCategory] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::ContentCategory]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_content_category(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/contentCategories/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::ContentCategory::Representation
          command.response_class = Google::Apis::DfareportingV3_3::ContentCategory
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a new content category.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::ContentCategory] content_category_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::ContentCategory] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::ContentCategory]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_content_category(profile_id, content_category_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/contentCategories', options)
          command.request_representation = Google::Apis::DfareportingV3_3::ContentCategory::Representation
          command.request_object = content_category_object
          command.response_representation = Google::Apis::DfareportingV3_3::ContentCategory::Representation
          command.response_class = Google::Apis::DfareportingV3_3::ContentCategory
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of content categories, possibly filtered. This method
        # supports paging.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Array<Fixnum>, Fixnum] ids
        #   Select only content categories with these IDs.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [String] page_token
        #   Value of the nextPageToken from the previous result page.
        # @param [String] search_string
        #   Allows searching for objects by name or ID. Wildcards (*) are allowed. For
        #   example, "contentcategory*2015" will return objects with names like "
        #   contentcategory June 2015", "contentcategory April 2015", or simply "
        #   contentcategory 2015". Most of the searches also add wildcards implicitly at
        #   the start and the end of the search string. For example, a search string of "
        #   contentcategory" will match objects with name "my contentcategory", "
        #   contentcategory 2015", or simply "contentcategory".
        # @param [String] sort_field
        #   Field by which to sort the list.
        # @param [String] sort_order
        #   Order of sorted results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::ContentCategoriesListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::ContentCategoriesListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_content_categories(profile_id, ids: nil, max_results: nil, page_token: nil, search_string: nil, sort_field: nil, sort_order: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/contentCategories', options)
          command.response_representation = Google::Apis::DfareportingV3_3::ContentCategoriesListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::ContentCategoriesListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['searchString'] = search_string unless search_string.nil?
          command.query['sortField'] = sort_field unless sort_field.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing content category. This method supports patch semantics.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Content category ID.
        # @param [Google::Apis::DfareportingV3_3::ContentCategory] content_category_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::ContentCategory] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::ContentCategory]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_content_category(profile_id, id, content_category_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'userprofiles/{profileId}/contentCategories', options)
          command.request_representation = Google::Apis::DfareportingV3_3::ContentCategory::Representation
          command.request_object = content_category_object
          command.response_representation = Google::Apis::DfareportingV3_3::ContentCategory::Representation
          command.response_class = Google::Apis::DfareportingV3_3::ContentCategory
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing content category.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::ContentCategory] content_category_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::ContentCategory] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::ContentCategory]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_content_category(profile_id, content_category_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'userprofiles/{profileId}/contentCategories', options)
          command.request_representation = Google::Apis::DfareportingV3_3::ContentCategory::Representation
          command.request_object = content_category_object
          command.response_representation = Google::Apis::DfareportingV3_3::ContentCategory::Representation
          command.response_class = Google::Apis::DfareportingV3_3::ContentCategory
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts conversions.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::ConversionsBatchInsertRequest] conversions_batch_insert_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::ConversionsBatchInsertResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::ConversionsBatchInsertResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batchinsert_conversion(profile_id, conversions_batch_insert_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/conversions/batchinsert', options)
          command.request_representation = Google::Apis::DfareportingV3_3::ConversionsBatchInsertRequest::Representation
          command.request_object = conversions_batch_insert_request_object
          command.response_representation = Google::Apis::DfareportingV3_3::ConversionsBatchInsertResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::ConversionsBatchInsertResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates existing conversions.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::ConversionsBatchUpdateRequest] conversions_batch_update_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::ConversionsBatchUpdateResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::ConversionsBatchUpdateResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batchupdate_conversion(profile_id, conversions_batch_update_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/conversions/batchupdate', options)
          command.request_representation = Google::Apis::DfareportingV3_3::ConversionsBatchUpdateRequest::Representation
          command.request_object = conversions_batch_update_request_object
          command.response_representation = Google::Apis::DfareportingV3_3::ConversionsBatchUpdateResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::ConversionsBatchUpdateResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one country by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] dart_id
        #   Country DART ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Country] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Country]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_country(profile_id, dart_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/countries/{dartId}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::Country::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Country
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['dartId'] = dart_id unless dart_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of countries.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::CountriesListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::CountriesListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_countries(profile_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/countries', options)
          command.response_representation = Google::Apis::DfareportingV3_3::CountriesListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::CountriesListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a new creative asset.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] advertiser_id
        #   Advertiser ID of this creative. This is a required field.
        # @param [Google::Apis::DfareportingV3_3::CreativeAssetMetadata] creative_asset_metadata_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [IO, String] upload_source
        #   IO stream or filename containing content to upload
        # @param [String] content_type
        #   Content type of the uploaded content.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::CreativeAssetMetadata] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::CreativeAssetMetadata]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_creative_asset(profile_id, advertiser_id, creative_asset_metadata_object = nil, fields: nil, quota_user: nil, user_ip: nil, upload_source: nil, content_type: nil, options: nil, &block)
          if upload_source.nil?
            command = make_simple_command(:post, 'userprofiles/{profileId}/creativeAssets/{advertiserId}/creativeAssets', options)
          else
            command = make_upload_command(:post, 'userprofiles/{profileId}/creativeAssets/{advertiserId}/creativeAssets', options)
            command.upload_source = upload_source
            command.upload_content_type = content_type
          end
          command.request_representation = Google::Apis::DfareportingV3_3::CreativeAssetMetadata::Representation
          command.request_object = creative_asset_metadata_object
          command.response_representation = Google::Apis::DfareportingV3_3::CreativeAssetMetadata::Representation
          command.response_class = Google::Apis::DfareportingV3_3::CreativeAssetMetadata
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['advertiserId'] = advertiser_id unless advertiser_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes an existing creative field value.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] creative_field_id
        #   Creative field ID for this creative field value.
        # @param [Fixnum] id
        #   Creative Field Value ID
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_creative_field_value(profile_id, creative_field_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'userprofiles/{profileId}/creativeFields/{creativeFieldId}/creativeFieldValues/{id}', options)
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['creativeFieldId'] = creative_field_id unless creative_field_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one creative field value by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] creative_field_id
        #   Creative field ID for this creative field value.
        # @param [Fixnum] id
        #   Creative Field Value ID
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::CreativeFieldValue] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::CreativeFieldValue]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_creative_field_value(profile_id, creative_field_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/creativeFields/{creativeFieldId}/creativeFieldValues/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::CreativeFieldValue::Representation
          command.response_class = Google::Apis::DfareportingV3_3::CreativeFieldValue
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['creativeFieldId'] = creative_field_id unless creative_field_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a new creative field value.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] creative_field_id
        #   Creative field ID for this creative field value.
        # @param [Google::Apis::DfareportingV3_3::CreativeFieldValue] creative_field_value_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::CreativeFieldValue] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::CreativeFieldValue]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_creative_field_value(profile_id, creative_field_id, creative_field_value_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/creativeFields/{creativeFieldId}/creativeFieldValues', options)
          command.request_representation = Google::Apis::DfareportingV3_3::CreativeFieldValue::Representation
          command.request_object = creative_field_value_object
          command.response_representation = Google::Apis::DfareportingV3_3::CreativeFieldValue::Representation
          command.response_class = Google::Apis::DfareportingV3_3::CreativeFieldValue
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['creativeFieldId'] = creative_field_id unless creative_field_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of creative field values, possibly filtered. This method
        # supports paging.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] creative_field_id
        #   Creative field ID for this creative field value.
        # @param [Array<Fixnum>, Fixnum] ids
        #   Select only creative field values with these IDs.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [String] page_token
        #   Value of the nextPageToken from the previous result page.
        # @param [String] search_string
        #   Allows searching for creative field values by their values. Wildcards (e.g. *)
        #   are not allowed.
        # @param [String] sort_field
        #   Field by which to sort the list.
        # @param [String] sort_order
        #   Order of sorted results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::CreativeFieldValuesListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::CreativeFieldValuesListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_creative_field_values(profile_id, creative_field_id, ids: nil, max_results: nil, page_token: nil, search_string: nil, sort_field: nil, sort_order: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/creativeFields/{creativeFieldId}/creativeFieldValues', options)
          command.response_representation = Google::Apis::DfareportingV3_3::CreativeFieldValuesListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::CreativeFieldValuesListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['creativeFieldId'] = creative_field_id unless creative_field_id.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['searchString'] = search_string unless search_string.nil?
          command.query['sortField'] = sort_field unless sort_field.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing creative field value. This method supports patch semantics.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] creative_field_id
        #   Creative field ID for this creative field value.
        # @param [Fixnum] id
        #   Creative Field Value ID
        # @param [Google::Apis::DfareportingV3_3::CreativeFieldValue] creative_field_value_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::CreativeFieldValue] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::CreativeFieldValue]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_creative_field_value(profile_id, creative_field_id, id, creative_field_value_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'userprofiles/{profileId}/creativeFields/{creativeFieldId}/creativeFieldValues', options)
          command.request_representation = Google::Apis::DfareportingV3_3::CreativeFieldValue::Representation
          command.request_object = creative_field_value_object
          command.response_representation = Google::Apis::DfareportingV3_3::CreativeFieldValue::Representation
          command.response_class = Google::Apis::DfareportingV3_3::CreativeFieldValue
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['creativeFieldId'] = creative_field_id unless creative_field_id.nil?
          command.query['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing creative field value.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] creative_field_id
        #   Creative field ID for this creative field value.
        # @param [Google::Apis::DfareportingV3_3::CreativeFieldValue] creative_field_value_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::CreativeFieldValue] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::CreativeFieldValue]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_creative_field_value(profile_id, creative_field_id, creative_field_value_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'userprofiles/{profileId}/creativeFields/{creativeFieldId}/creativeFieldValues', options)
          command.request_representation = Google::Apis::DfareportingV3_3::CreativeFieldValue::Representation
          command.request_object = creative_field_value_object
          command.response_representation = Google::Apis::DfareportingV3_3::CreativeFieldValue::Representation
          command.response_class = Google::Apis::DfareportingV3_3::CreativeFieldValue
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['creativeFieldId'] = creative_field_id unless creative_field_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes an existing creative field.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Creative Field ID
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_creative_field(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'userprofiles/{profileId}/creativeFields/{id}', options)
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one creative field by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Creative Field ID
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::CreativeField] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::CreativeField]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_creative_field(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/creativeFields/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::CreativeField::Representation
          command.response_class = Google::Apis::DfareportingV3_3::CreativeField
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a new creative field.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::CreativeField] creative_field_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::CreativeField] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::CreativeField]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_creative_field(profile_id, creative_field_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/creativeFields', options)
          command.request_representation = Google::Apis::DfareportingV3_3::CreativeField::Representation
          command.request_object = creative_field_object
          command.response_representation = Google::Apis::DfareportingV3_3::CreativeField::Representation
          command.response_class = Google::Apis::DfareportingV3_3::CreativeField
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of creative fields, possibly filtered. This method supports
        # paging.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Array<Fixnum>, Fixnum] advertiser_ids
        #   Select only creative fields that belong to these advertisers.
        # @param [Array<Fixnum>, Fixnum] ids
        #   Select only creative fields with these IDs.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [String] page_token
        #   Value of the nextPageToken from the previous result page.
        # @param [String] search_string
        #   Allows searching for creative fields by name or ID. Wildcards (*) are allowed.
        #   For example, "creativefield*2015" will return creative fields with names like "
        #   creativefield June 2015", "creativefield April 2015", or simply "creativefield
        #   2015". Most of the searches also add wild-cards implicitly at the start and
        #   the end of the search string. For example, a search string of "creativefield"
        #   will match creative fields with the name "my creativefield", "creativefield
        #   2015", or simply "creativefield".
        # @param [String] sort_field
        #   Field by which to sort the list.
        # @param [String] sort_order
        #   Order of sorted results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::CreativeFieldsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::CreativeFieldsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_creative_fields(profile_id, advertiser_ids: nil, ids: nil, max_results: nil, page_token: nil, search_string: nil, sort_field: nil, sort_order: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/creativeFields', options)
          command.response_representation = Google::Apis::DfareportingV3_3::CreativeFieldsListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::CreativeFieldsListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['advertiserIds'] = advertiser_ids unless advertiser_ids.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['searchString'] = search_string unless search_string.nil?
          command.query['sortField'] = sort_field unless sort_field.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing creative field. This method supports patch semantics.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Creative Field ID
        # @param [Google::Apis::DfareportingV3_3::CreativeField] creative_field_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::CreativeField] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::CreativeField]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_creative_field(profile_id, id, creative_field_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'userprofiles/{profileId}/creativeFields', options)
          command.request_representation = Google::Apis::DfareportingV3_3::CreativeField::Representation
          command.request_object = creative_field_object
          command.response_representation = Google::Apis::DfareportingV3_3::CreativeField::Representation
          command.response_class = Google::Apis::DfareportingV3_3::CreativeField
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing creative field.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::CreativeField] creative_field_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::CreativeField] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::CreativeField]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_creative_field(profile_id, creative_field_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'userprofiles/{profileId}/creativeFields', options)
          command.request_representation = Google::Apis::DfareportingV3_3::CreativeField::Representation
          command.request_object = creative_field_object
          command.response_representation = Google::Apis::DfareportingV3_3::CreativeField::Representation
          command.response_class = Google::Apis::DfareportingV3_3::CreativeField
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one creative group by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Creative group ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::CreativeGroup] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::CreativeGroup]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_creative_group(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/creativeGroups/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::CreativeGroup::Representation
          command.response_class = Google::Apis::DfareportingV3_3::CreativeGroup
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a new creative group.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::CreativeGroup] creative_group_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::CreativeGroup] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::CreativeGroup]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_creative_group(profile_id, creative_group_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/creativeGroups', options)
          command.request_representation = Google::Apis::DfareportingV3_3::CreativeGroup::Representation
          command.request_object = creative_group_object
          command.response_representation = Google::Apis::DfareportingV3_3::CreativeGroup::Representation
          command.response_class = Google::Apis::DfareportingV3_3::CreativeGroup
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of creative groups, possibly filtered. This method supports
        # paging.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Array<Fixnum>, Fixnum] advertiser_ids
        #   Select only creative groups that belong to these advertisers.
        # @param [Fixnum] group_number
        #   Select only creative groups that belong to this subgroup.
        # @param [Array<Fixnum>, Fixnum] ids
        #   Select only creative groups with these IDs.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [String] page_token
        #   Value of the nextPageToken from the previous result page.
        # @param [String] search_string
        #   Allows searching for creative groups by name or ID. Wildcards (*) are allowed.
        #   For example, "creativegroup*2015" will return creative groups with names like "
        #   creativegroup June 2015", "creativegroup April 2015", or simply "creativegroup
        #   2015". Most of the searches also add wild-cards implicitly at the start and
        #   the end of the search string. For example, a search string of "creativegroup"
        #   will match creative groups with the name "my creativegroup", "creativegroup
        #   2015", or simply "creativegroup".
        # @param [String] sort_field
        #   Field by which to sort the list.
        # @param [String] sort_order
        #   Order of sorted results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::CreativeGroupsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::CreativeGroupsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_creative_groups(profile_id, advertiser_ids: nil, group_number: nil, ids: nil, max_results: nil, page_token: nil, search_string: nil, sort_field: nil, sort_order: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/creativeGroups', options)
          command.response_representation = Google::Apis::DfareportingV3_3::CreativeGroupsListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::CreativeGroupsListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['advertiserIds'] = advertiser_ids unless advertiser_ids.nil?
          command.query['groupNumber'] = group_number unless group_number.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['searchString'] = search_string unless search_string.nil?
          command.query['sortField'] = sort_field unless sort_field.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing creative group. This method supports patch semantics.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Creative group ID.
        # @param [Google::Apis::DfareportingV3_3::CreativeGroup] creative_group_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::CreativeGroup] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::CreativeGroup]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_creative_group(profile_id, id, creative_group_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'userprofiles/{profileId}/creativeGroups', options)
          command.request_representation = Google::Apis::DfareportingV3_3::CreativeGroup::Representation
          command.request_object = creative_group_object
          command.response_representation = Google::Apis::DfareportingV3_3::CreativeGroup::Representation
          command.response_class = Google::Apis::DfareportingV3_3::CreativeGroup
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing creative group.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::CreativeGroup] creative_group_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::CreativeGroup] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::CreativeGroup]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_creative_group(profile_id, creative_group_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'userprofiles/{profileId}/creativeGroups', options)
          command.request_representation = Google::Apis::DfareportingV3_3::CreativeGroup::Representation
          command.request_object = creative_group_object
          command.response_representation = Google::Apis::DfareportingV3_3::CreativeGroup::Representation
          command.response_class = Google::Apis::DfareportingV3_3::CreativeGroup
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one creative by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Creative ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Creative] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Creative]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_creative(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/creatives/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::Creative::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Creative
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a new creative.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::Creative] creative_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Creative] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Creative]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_creative(profile_id, creative_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/creatives', options)
          command.request_representation = Google::Apis::DfareportingV3_3::Creative::Representation
          command.request_object = creative_object
          command.response_representation = Google::Apis::DfareportingV3_3::Creative::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Creative
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of creatives, possibly filtered. This method supports paging.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Boolean] active
        #   Select only active creatives. Leave blank to select active and inactive
        #   creatives.
        # @param [Fixnum] advertiser_id
        #   Select only creatives with this advertiser ID.
        # @param [Boolean] archived
        #   Select only archived creatives. Leave blank to select archived and unarchived
        #   creatives.
        # @param [Fixnum] campaign_id
        #   Select only creatives with this campaign ID.
        # @param [Array<Fixnum>, Fixnum] companion_creative_ids
        #   Select only in-stream video creatives with these companion IDs.
        # @param [Array<Fixnum>, Fixnum] creative_field_ids
        #   Select only creatives with these creative field IDs.
        # @param [Array<Fixnum>, Fixnum] ids
        #   Select only creatives with these IDs.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [String] page_token
        #   Value of the nextPageToken from the previous result page.
        # @param [Array<Fixnum>, Fixnum] rendering_ids
        #   Select only creatives with these rendering IDs.
        # @param [String] search_string
        #   Allows searching for objects by name or ID. Wildcards (*) are allowed. For
        #   example, "creative*2015" will return objects with names like "creative June
        #   2015", "creative April 2015", or simply "creative 2015". Most of the searches
        #   also add wildcards implicitly at the start and the end of the search string.
        #   For example, a search string of "creative" will match objects with name "my
        #   creative", "creative 2015", or simply "creative".
        # @param [Array<Fixnum>, Fixnum] size_ids
        #   Select only creatives with these size IDs.
        # @param [String] sort_field
        #   Field by which to sort the list.
        # @param [String] sort_order
        #   Order of sorted results.
        # @param [Fixnum] studio_creative_id
        #   Select only creatives corresponding to this Studio creative ID.
        # @param [Array<String>, String] types
        #   Select only creatives with these creative types.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::CreativesListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::CreativesListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_creatives(profile_id, active: nil, advertiser_id: nil, archived: nil, campaign_id: nil, companion_creative_ids: nil, creative_field_ids: nil, ids: nil, max_results: nil, page_token: nil, rendering_ids: nil, search_string: nil, size_ids: nil, sort_field: nil, sort_order: nil, studio_creative_id: nil, types: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/creatives', options)
          command.response_representation = Google::Apis::DfareportingV3_3::CreativesListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::CreativesListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['active'] = active unless active.nil?
          command.query['advertiserId'] = advertiser_id unless advertiser_id.nil?
          command.query['archived'] = archived unless archived.nil?
          command.query['campaignId'] = campaign_id unless campaign_id.nil?
          command.query['companionCreativeIds'] = companion_creative_ids unless companion_creative_ids.nil?
          command.query['creativeFieldIds'] = creative_field_ids unless creative_field_ids.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['renderingIds'] = rendering_ids unless rendering_ids.nil?
          command.query['searchString'] = search_string unless search_string.nil?
          command.query['sizeIds'] = size_ids unless size_ids.nil?
          command.query['sortField'] = sort_field unless sort_field.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['studioCreativeId'] = studio_creative_id unless studio_creative_id.nil?
          command.query['types'] = types unless types.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing creative. This method supports patch semantics.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Creative ID.
        # @param [Google::Apis::DfareportingV3_3::Creative] creative_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Creative] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Creative]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_creative(profile_id, id, creative_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'userprofiles/{profileId}/creatives', options)
          command.request_representation = Google::Apis::DfareportingV3_3::Creative::Representation
          command.request_object = creative_object
          command.response_representation = Google::Apis::DfareportingV3_3::Creative::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Creative
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing creative.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::Creative] creative_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Creative] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Creative]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_creative(profile_id, creative_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'userprofiles/{profileId}/creatives', options)
          command.request_representation = Google::Apis::DfareportingV3_3::Creative::Representation
          command.request_object = creative_object
          command.response_representation = Google::Apis::DfareportingV3_3::Creative::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Creative
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves list of report dimension values for a list of filters.
        # @param [Fixnum] profile_id
        #   The DFA user profile ID.
        # @param [Google::Apis::DfareportingV3_3::DimensionValueRequest] dimension_value_request_object
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [String] page_token
        #   The value of the nextToken from the previous result page.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::DimensionValueList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::DimensionValueList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def query_dimension_value(profile_id, dimension_value_request_object = nil, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/dimensionvalues/query', options)
          command.request_representation = Google::Apis::DfareportingV3_3::DimensionValueRequest::Representation
          command.request_object = dimension_value_request_object
          command.response_representation = Google::Apis::DfareportingV3_3::DimensionValueList::Representation
          command.response_class = Google::Apis::DfareportingV3_3::DimensionValueList
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one directory site by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Directory site ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::DirectorySite] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::DirectorySite]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_directory_site(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/directorySites/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::DirectorySite::Representation
          command.response_class = Google::Apis::DfareportingV3_3::DirectorySite
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a new directory site.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::DirectorySite] directory_site_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::DirectorySite] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::DirectorySite]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_directory_site(profile_id, directory_site_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/directorySites', options)
          command.request_representation = Google::Apis::DfareportingV3_3::DirectorySite::Representation
          command.request_object = directory_site_object
          command.response_representation = Google::Apis::DfareportingV3_3::DirectorySite::Representation
          command.response_class = Google::Apis::DfareportingV3_3::DirectorySite
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of directory sites, possibly filtered. This method supports
        # paging.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Boolean] accepts_in_stream_video_placements
        #   This search filter is no longer supported and will have no effect on the
        #   results returned.
        # @param [Boolean] accepts_interstitial_placements
        #   This search filter is no longer supported and will have no effect on the
        #   results returned.
        # @param [Boolean] accepts_publisher_paid_placements
        #   Select only directory sites that accept publisher paid placements. This field
        #   can be left blank.
        # @param [Boolean] active
        #   Select only active directory sites. Leave blank to retrieve both active and
        #   inactive directory sites.
        # @param [String] dfp_network_code
        #   Select only directory sites with this Ad Manager network code.
        # @param [Array<Fixnum>, Fixnum] ids
        #   Select only directory sites with these IDs.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [String] page_token
        #   Value of the nextPageToken from the previous result page.
        # @param [String] search_string
        #   Allows searching for objects by name, ID or URL. Wildcards (*) are allowed.
        #   For example, "directory site*2015" will return objects with names like "
        #   directory site June 2015", "directory site April 2015", or simply "directory
        #   site 2015". Most of the searches also add wildcards implicitly at the start
        #   and the end of the search string. For example, a search string of "directory
        #   site" will match objects with name "my directory site", "directory site 2015"
        #   or simply, "directory site".
        # @param [String] sort_field
        #   Field by which to sort the list.
        # @param [String] sort_order
        #   Order of sorted results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::DirectorySitesListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::DirectorySitesListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_directory_sites(profile_id, accepts_in_stream_video_placements: nil, accepts_interstitial_placements: nil, accepts_publisher_paid_placements: nil, active: nil, dfp_network_code: nil, ids: nil, max_results: nil, page_token: nil, search_string: nil, sort_field: nil, sort_order: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/directorySites', options)
          command.response_representation = Google::Apis::DfareportingV3_3::DirectorySitesListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::DirectorySitesListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['acceptsInStreamVideoPlacements'] = accepts_in_stream_video_placements unless accepts_in_stream_video_placements.nil?
          command.query['acceptsInterstitialPlacements'] = accepts_interstitial_placements unless accepts_interstitial_placements.nil?
          command.query['acceptsPublisherPaidPlacements'] = accepts_publisher_paid_placements unless accepts_publisher_paid_placements.nil?
          command.query['active'] = active unless active.nil?
          command.query['dfpNetworkCode'] = dfp_network_code unless dfp_network_code.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['searchString'] = search_string unless search_string.nil?
          command.query['sortField'] = sort_field unless sort_field.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes an existing dynamic targeting key.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] object_id_
        #   ID of the object of this dynamic targeting key. This is a required field.
        # @param [String] name
        #   Name of this dynamic targeting key. This is a required field. Must be less
        #   than 256 characters long and cannot contain commas. All characters are
        #   converted to lowercase.
        # @param [String] object_type
        #   Type of the object of this dynamic targeting key. This is a required field.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_dynamic_targeting_key(profile_id, object_id_, name, object_type, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'userprofiles/{profileId}/dynamicTargetingKeys/{objectId}', options)
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['objectId'] = object_id_ unless object_id_.nil?
          command.query['name'] = name unless name.nil?
          command.query['objectType'] = object_type unless object_type.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a new dynamic targeting key. Keys must be created at the advertiser
        # level before being assigned to the advertiser's ads, creatives, or placements.
        # There is a maximum of 1000 keys per advertiser, out of which a maximum of 20
        # keys can be assigned per ad, creative, or placement.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::DynamicTargetingKey] dynamic_targeting_key_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::DynamicTargetingKey] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::DynamicTargetingKey]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_dynamic_targeting_key(profile_id, dynamic_targeting_key_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/dynamicTargetingKeys', options)
          command.request_representation = Google::Apis::DfareportingV3_3::DynamicTargetingKey::Representation
          command.request_object = dynamic_targeting_key_object
          command.response_representation = Google::Apis::DfareportingV3_3::DynamicTargetingKey::Representation
          command.response_class = Google::Apis::DfareportingV3_3::DynamicTargetingKey
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of dynamic targeting keys.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] advertiser_id
        #   Select only dynamic targeting keys whose object has this advertiser ID.
        # @param [Array<String>, String] names
        #   Select only dynamic targeting keys exactly matching these names.
        # @param [Fixnum] object_id_
        #   Select only dynamic targeting keys with this object ID.
        # @param [String] object_type
        #   Select only dynamic targeting keys with this object type.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::DynamicTargetingKeysListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::DynamicTargetingKeysListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_dynamic_targeting_keys(profile_id, advertiser_id: nil, names: nil, object_id_: nil, object_type: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/dynamicTargetingKeys', options)
          command.response_representation = Google::Apis::DfareportingV3_3::DynamicTargetingKeysListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::DynamicTargetingKeysListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['advertiserId'] = advertiser_id unless advertiser_id.nil?
          command.query['names'] = names unless names.nil?
          command.query['objectId'] = object_id_ unless object_id_.nil?
          command.query['objectType'] = object_type unless object_type.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes an existing event tag.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Event tag ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_event_tag(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'userprofiles/{profileId}/eventTags/{id}', options)
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one event tag by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Event tag ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::EventTag] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::EventTag]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_event_tag(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/eventTags/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::EventTag::Representation
          command.response_class = Google::Apis::DfareportingV3_3::EventTag
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a new event tag.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::EventTag] event_tag_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::EventTag] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::EventTag]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_event_tag(profile_id, event_tag_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/eventTags', options)
          command.request_representation = Google::Apis::DfareportingV3_3::EventTag::Representation
          command.request_object = event_tag_object
          command.response_representation = Google::Apis::DfareportingV3_3::EventTag::Representation
          command.response_class = Google::Apis::DfareportingV3_3::EventTag
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of event tags, possibly filtered.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] ad_id
        #   Select only event tags that belong to this ad.
        # @param [Fixnum] advertiser_id
        #   Select only event tags that belong to this advertiser.
        # @param [Fixnum] campaign_id
        #   Select only event tags that belong to this campaign.
        # @param [Boolean] definitions_only
        #   Examine only the specified campaign or advertiser's event tags for matching
        #   selector criteria. When set to false, the parent advertiser and parent
        #   campaign of the specified ad or campaign is examined as well. In addition,
        #   when set to false, the status field is examined as well, along with the
        #   enabledByDefault field. This parameter can not be set to true when adId is
        #   specified as ads do not define their own even tags.
        # @param [Boolean] enabled
        #   Select only enabled event tags. What is considered enabled or disabled depends
        #   on the definitionsOnly parameter. When definitionsOnly is set to true, only
        #   the specified advertiser or campaign's event tags' enabledByDefault field is
        #   examined. When definitionsOnly is set to false, the specified ad or specified
        #   campaign's parent advertiser's or parent campaign's event tags'
        #   enabledByDefault and status fields are examined as well.
        # @param [Array<String>, String] event_tag_types
        #   Select only event tags with the specified event tag types. Event tag types can
        #   be used to specify whether to use a third-party pixel, a third-party
        #   JavaScript URL, or a third-party click-through URL for either impression or
        #   click tracking.
        # @param [Array<Fixnum>, Fixnum] ids
        #   Select only event tags with these IDs.
        # @param [String] search_string
        #   Allows searching for objects by name or ID. Wildcards (*) are allowed. For
        #   example, "eventtag*2015" will return objects with names like "eventtag June
        #   2015", "eventtag April 2015", or simply "eventtag 2015". Most of the searches
        #   also add wildcards implicitly at the start and the end of the search string.
        #   For example, a search string of "eventtag" will match objects with name "my
        #   eventtag", "eventtag 2015", or simply "eventtag".
        # @param [String] sort_field
        #   Field by which to sort the list.
        # @param [String] sort_order
        #   Order of sorted results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::EventTagsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::EventTagsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_event_tags(profile_id, ad_id: nil, advertiser_id: nil, campaign_id: nil, definitions_only: nil, enabled: nil, event_tag_types: nil, ids: nil, search_string: nil, sort_field: nil, sort_order: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/eventTags', options)
          command.response_representation = Google::Apis::DfareportingV3_3::EventTagsListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::EventTagsListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['adId'] = ad_id unless ad_id.nil?
          command.query['advertiserId'] = advertiser_id unless advertiser_id.nil?
          command.query['campaignId'] = campaign_id unless campaign_id.nil?
          command.query['definitionsOnly'] = definitions_only unless definitions_only.nil?
          command.query['enabled'] = enabled unless enabled.nil?
          command.query['eventTagTypes'] = event_tag_types unless event_tag_types.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['searchString'] = search_string unless search_string.nil?
          command.query['sortField'] = sort_field unless sort_field.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing event tag. This method supports patch semantics.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Event tag ID.
        # @param [Google::Apis::DfareportingV3_3::EventTag] event_tag_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::EventTag] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::EventTag]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_event_tag(profile_id, id, event_tag_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'userprofiles/{profileId}/eventTags', options)
          command.request_representation = Google::Apis::DfareportingV3_3::EventTag::Representation
          command.request_object = event_tag_object
          command.response_representation = Google::Apis::DfareportingV3_3::EventTag::Representation
          command.response_class = Google::Apis::DfareportingV3_3::EventTag
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing event tag.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::EventTag] event_tag_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::EventTag] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::EventTag]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_event_tag(profile_id, event_tag_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'userprofiles/{profileId}/eventTags', options)
          command.request_representation = Google::Apis::DfareportingV3_3::EventTag::Representation
          command.request_object = event_tag_object
          command.response_representation = Google::Apis::DfareportingV3_3::EventTag::Representation
          command.response_class = Google::Apis::DfareportingV3_3::EventTag
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a report file by its report ID and file ID. This method supports
        # media download.
        # @param [Fixnum] report_id
        #   The ID of the report.
        # @param [Fixnum] file_id
        #   The ID of the report file.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [IO, String] download_dest
        #   IO stream or filename to receive content download
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::File] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::File]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_file(report_id, file_id, fields: nil, quota_user: nil, user_ip: nil, download_dest: nil, options: nil, &block)
          if download_dest.nil?
            command = make_simple_command(:get, 'reports/{reportId}/files/{fileId}', options)
          else
            command = make_download_command(:get, 'reports/{reportId}/files/{fileId}', options)
            command.download_dest = download_dest
          end
          command.response_representation = Google::Apis::DfareportingV3_3::File::Representation
          command.response_class = Google::Apis::DfareportingV3_3::File
          command.params['reportId'] = report_id unless report_id.nil?
          command.params['fileId'] = file_id unless file_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists files for a user profile.
        # @param [Fixnum] profile_id
        #   The DFA profile ID.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [String] page_token
        #   The value of the nextToken from the previous result page.
        # @param [String] scope
        #   The scope that defines which results are returned.
        # @param [String] sort_field
        #   The field by which to sort the list.
        # @param [String] sort_order
        #   Order of sorted results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::FileList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::FileList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_files(profile_id, max_results: nil, page_token: nil, scope: nil, sort_field: nil, sort_order: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/files', options)
          command.response_representation = Google::Apis::DfareportingV3_3::FileList::Representation
          command.response_class = Google::Apis::DfareportingV3_3::FileList
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['scope'] = scope unless scope.nil?
          command.query['sortField'] = sort_field unless sort_field.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes an existing floodlight activity.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Floodlight activity ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_floodlight_activity(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'userprofiles/{profileId}/floodlightActivities/{id}', options)
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Generates a tag for a floodlight activity.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] floodlight_activity_id
        #   Floodlight activity ID for which we want to generate a tag.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::FloodlightActivitiesGenerateTagResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::FloodlightActivitiesGenerateTagResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def generatetag_floodlight_activity(profile_id, floodlight_activity_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/floodlightActivities/generatetag', options)
          command.response_representation = Google::Apis::DfareportingV3_3::FloodlightActivitiesGenerateTagResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::FloodlightActivitiesGenerateTagResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['floodlightActivityId'] = floodlight_activity_id unless floodlight_activity_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one floodlight activity by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Floodlight activity ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::FloodlightActivity] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::FloodlightActivity]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_floodlight_activity(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/floodlightActivities/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::FloodlightActivity::Representation
          command.response_class = Google::Apis::DfareportingV3_3::FloodlightActivity
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a new floodlight activity.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::FloodlightActivity] floodlight_activity_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::FloodlightActivity] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::FloodlightActivity]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_floodlight_activity(profile_id, floodlight_activity_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/floodlightActivities', options)
          command.request_representation = Google::Apis::DfareportingV3_3::FloodlightActivity::Representation
          command.request_object = floodlight_activity_object
          command.response_representation = Google::Apis::DfareportingV3_3::FloodlightActivity::Representation
          command.response_class = Google::Apis::DfareportingV3_3::FloodlightActivity
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of floodlight activities, possibly filtered. This method
        # supports paging.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] advertiser_id
        #   Select only floodlight activities for the specified advertiser ID. Must
        #   specify either ids, advertiserId, or floodlightConfigurationId for a non-empty
        #   result.
        # @param [Array<Fixnum>, Fixnum] floodlight_activity_group_ids
        #   Select only floodlight activities with the specified floodlight activity group
        #   IDs.
        # @param [String] floodlight_activity_group_name
        #   Select only floodlight activities with the specified floodlight activity group
        #   name.
        # @param [String] floodlight_activity_group_tag_string
        #   Select only floodlight activities with the specified floodlight activity group
        #   tag string.
        # @param [String] floodlight_activity_group_type
        #   Select only floodlight activities with the specified floodlight activity group
        #   type.
        # @param [Fixnum] floodlight_configuration_id
        #   Select only floodlight activities for the specified floodlight configuration
        #   ID. Must specify either ids, advertiserId, or floodlightConfigurationId for a
        #   non-empty result.
        # @param [Array<Fixnum>, Fixnum] ids
        #   Select only floodlight activities with the specified IDs. Must specify either
        #   ids, advertiserId, or floodlightConfigurationId for a non-empty result.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [String] page_token
        #   Value of the nextPageToken from the previous result page.
        # @param [String] search_string
        #   Allows searching for objects by name or ID. Wildcards (*) are allowed. For
        #   example, "floodlightactivity*2015" will return objects with names like "
        #   floodlightactivity June 2015", "floodlightactivity April 2015", or simply "
        #   floodlightactivity 2015". Most of the searches also add wildcards implicitly
        #   at the start and the end of the search string. For example, a search string of
        #   "floodlightactivity" will match objects with name "my floodlightactivity
        #   activity", "floodlightactivity 2015", or simply "floodlightactivity".
        # @param [String] sort_field
        #   Field by which to sort the list.
        # @param [String] sort_order
        #   Order of sorted results.
        # @param [String] tag_string
        #   Select only floodlight activities with the specified tag string.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::FloodlightActivitiesListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::FloodlightActivitiesListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_floodlight_activities(profile_id, advertiser_id: nil, floodlight_activity_group_ids: nil, floodlight_activity_group_name: nil, floodlight_activity_group_tag_string: nil, floodlight_activity_group_type: nil, floodlight_configuration_id: nil, ids: nil, max_results: nil, page_token: nil, search_string: nil, sort_field: nil, sort_order: nil, tag_string: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/floodlightActivities', options)
          command.response_representation = Google::Apis::DfareportingV3_3::FloodlightActivitiesListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::FloodlightActivitiesListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['advertiserId'] = advertiser_id unless advertiser_id.nil?
          command.query['floodlightActivityGroupIds'] = floodlight_activity_group_ids unless floodlight_activity_group_ids.nil?
          command.query['floodlightActivityGroupName'] = floodlight_activity_group_name unless floodlight_activity_group_name.nil?
          command.query['floodlightActivityGroupTagString'] = floodlight_activity_group_tag_string unless floodlight_activity_group_tag_string.nil?
          command.query['floodlightActivityGroupType'] = floodlight_activity_group_type unless floodlight_activity_group_type.nil?
          command.query['floodlightConfigurationId'] = floodlight_configuration_id unless floodlight_configuration_id.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['searchString'] = search_string unless search_string.nil?
          command.query['sortField'] = sort_field unless sort_field.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['tagString'] = tag_string unless tag_string.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing floodlight activity. This method supports patch semantics.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Floodlight activity ID.
        # @param [Google::Apis::DfareportingV3_3::FloodlightActivity] floodlight_activity_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::FloodlightActivity] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::FloodlightActivity]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_floodlight_activity(profile_id, id, floodlight_activity_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'userprofiles/{profileId}/floodlightActivities', options)
          command.request_representation = Google::Apis::DfareportingV3_3::FloodlightActivity::Representation
          command.request_object = floodlight_activity_object
          command.response_representation = Google::Apis::DfareportingV3_3::FloodlightActivity::Representation
          command.response_class = Google::Apis::DfareportingV3_3::FloodlightActivity
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing floodlight activity.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::FloodlightActivity] floodlight_activity_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::FloodlightActivity] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::FloodlightActivity]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_floodlight_activity(profile_id, floodlight_activity_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'userprofiles/{profileId}/floodlightActivities', options)
          command.request_representation = Google::Apis::DfareportingV3_3::FloodlightActivity::Representation
          command.request_object = floodlight_activity_object
          command.response_representation = Google::Apis::DfareportingV3_3::FloodlightActivity::Representation
          command.response_class = Google::Apis::DfareportingV3_3::FloodlightActivity
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one floodlight activity group by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Floodlight activity Group ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::FloodlightActivityGroup] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::FloodlightActivityGroup]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_floodlight_activity_group(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/floodlightActivityGroups/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::FloodlightActivityGroup::Representation
          command.response_class = Google::Apis::DfareportingV3_3::FloodlightActivityGroup
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a new floodlight activity group.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::FloodlightActivityGroup] floodlight_activity_group_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::FloodlightActivityGroup] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::FloodlightActivityGroup]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_floodlight_activity_group(profile_id, floodlight_activity_group_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/floodlightActivityGroups', options)
          command.request_representation = Google::Apis::DfareportingV3_3::FloodlightActivityGroup::Representation
          command.request_object = floodlight_activity_group_object
          command.response_representation = Google::Apis::DfareportingV3_3::FloodlightActivityGroup::Representation
          command.response_class = Google::Apis::DfareportingV3_3::FloodlightActivityGroup
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of floodlight activity groups, possibly filtered. This method
        # supports paging.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] advertiser_id
        #   Select only floodlight activity groups with the specified advertiser ID. Must
        #   specify either advertiserId or floodlightConfigurationId for a non-empty
        #   result.
        # @param [Fixnum] floodlight_configuration_id
        #   Select only floodlight activity groups with the specified floodlight
        #   configuration ID. Must specify either advertiserId, or
        #   floodlightConfigurationId for a non-empty result.
        # @param [Array<Fixnum>, Fixnum] ids
        #   Select only floodlight activity groups with the specified IDs. Must specify
        #   either advertiserId or floodlightConfigurationId for a non-empty result.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [String] page_token
        #   Value of the nextPageToken from the previous result page.
        # @param [String] search_string
        #   Allows searching for objects by name or ID. Wildcards (*) are allowed. For
        #   example, "floodlightactivitygroup*2015" will return objects with names like "
        #   floodlightactivitygroup June 2015", "floodlightactivitygroup April 2015", or
        #   simply "floodlightactivitygroup 2015". Most of the searches also add wildcards
        #   implicitly at the start and the end of the search string. For example, a
        #   search string of "floodlightactivitygroup" will match objects with name "my
        #   floodlightactivitygroup activity", "floodlightactivitygroup 2015", or simply "
        #   floodlightactivitygroup".
        # @param [String] sort_field
        #   Field by which to sort the list.
        # @param [String] sort_order
        #   Order of sorted results.
        # @param [String] type
        #   Select only floodlight activity groups with the specified floodlight activity
        #   group type.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::FloodlightActivityGroupsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::FloodlightActivityGroupsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_floodlight_activity_groups(profile_id, advertiser_id: nil, floodlight_configuration_id: nil, ids: nil, max_results: nil, page_token: nil, search_string: nil, sort_field: nil, sort_order: nil, type: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/floodlightActivityGroups', options)
          command.response_representation = Google::Apis::DfareportingV3_3::FloodlightActivityGroupsListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::FloodlightActivityGroupsListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['advertiserId'] = advertiser_id unless advertiser_id.nil?
          command.query['floodlightConfigurationId'] = floodlight_configuration_id unless floodlight_configuration_id.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['searchString'] = search_string unless search_string.nil?
          command.query['sortField'] = sort_field unless sort_field.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['type'] = type unless type.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing floodlight activity group. This method supports patch
        # semantics.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Floodlight activity Group ID.
        # @param [Google::Apis::DfareportingV3_3::FloodlightActivityGroup] floodlight_activity_group_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::FloodlightActivityGroup] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::FloodlightActivityGroup]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_floodlight_activity_group(profile_id, id, floodlight_activity_group_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'userprofiles/{profileId}/floodlightActivityGroups', options)
          command.request_representation = Google::Apis::DfareportingV3_3::FloodlightActivityGroup::Representation
          command.request_object = floodlight_activity_group_object
          command.response_representation = Google::Apis::DfareportingV3_3::FloodlightActivityGroup::Representation
          command.response_class = Google::Apis::DfareportingV3_3::FloodlightActivityGroup
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing floodlight activity group.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::FloodlightActivityGroup] floodlight_activity_group_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::FloodlightActivityGroup] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::FloodlightActivityGroup]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_floodlight_activity_group(profile_id, floodlight_activity_group_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'userprofiles/{profileId}/floodlightActivityGroups', options)
          command.request_representation = Google::Apis::DfareportingV3_3::FloodlightActivityGroup::Representation
          command.request_object = floodlight_activity_group_object
          command.response_representation = Google::Apis::DfareportingV3_3::FloodlightActivityGroup::Representation
          command.response_class = Google::Apis::DfareportingV3_3::FloodlightActivityGroup
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one floodlight configuration by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Floodlight configuration ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::FloodlightConfiguration] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::FloodlightConfiguration]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_floodlight_configuration(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/floodlightConfigurations/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::FloodlightConfiguration::Representation
          command.response_class = Google::Apis::DfareportingV3_3::FloodlightConfiguration
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of floodlight configurations, possibly filtered.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Array<Fixnum>, Fixnum] ids
        #   Set of IDs of floodlight configurations to retrieve. Required field; otherwise
        #   an empty list will be returned.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::FloodlightConfigurationsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::FloodlightConfigurationsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_floodlight_configurations(profile_id, ids: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/floodlightConfigurations', options)
          command.response_representation = Google::Apis::DfareportingV3_3::FloodlightConfigurationsListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::FloodlightConfigurationsListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing floodlight configuration. This method supports patch
        # semantics.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Floodlight configuration ID.
        # @param [Google::Apis::DfareportingV3_3::FloodlightConfiguration] floodlight_configuration_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::FloodlightConfiguration] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::FloodlightConfiguration]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_floodlight_configuration(profile_id, id, floodlight_configuration_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'userprofiles/{profileId}/floodlightConfigurations', options)
          command.request_representation = Google::Apis::DfareportingV3_3::FloodlightConfiguration::Representation
          command.request_object = floodlight_configuration_object
          command.response_representation = Google::Apis::DfareportingV3_3::FloodlightConfiguration::Representation
          command.response_class = Google::Apis::DfareportingV3_3::FloodlightConfiguration
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing floodlight configuration.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::FloodlightConfiguration] floodlight_configuration_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::FloodlightConfiguration] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::FloodlightConfiguration]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_floodlight_configuration(profile_id, floodlight_configuration_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'userprofiles/{profileId}/floodlightConfigurations', options)
          command.request_representation = Google::Apis::DfareportingV3_3::FloodlightConfiguration::Representation
          command.request_object = floodlight_configuration_object
          command.response_representation = Google::Apis::DfareportingV3_3::FloodlightConfiguration::Representation
          command.response_class = Google::Apis::DfareportingV3_3::FloodlightConfiguration
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one inventory item by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] project_id
        #   Project ID for order documents.
        # @param [Fixnum] id
        #   Inventory item ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::InventoryItem] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::InventoryItem]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_inventory_item(profile_id, project_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/projects/{projectId}/inventoryItems/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::InventoryItem::Representation
          command.response_class = Google::Apis::DfareportingV3_3::InventoryItem
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of inventory items, possibly filtered. This method supports
        # paging.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] project_id
        #   Project ID for order documents.
        # @param [Array<Fixnum>, Fixnum] ids
        #   Select only inventory items with these IDs.
        # @param [Boolean] in_plan
        #   Select only inventory items that are in plan.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [Array<Fixnum>, Fixnum] order_id
        #   Select only inventory items that belong to specified orders.
        # @param [String] page_token
        #   Value of the nextPageToken from the previous result page.
        # @param [Array<Fixnum>, Fixnum] site_id
        #   Select only inventory items that are associated with these sites.
        # @param [String] sort_field
        #   Field by which to sort the list.
        # @param [String] sort_order
        #   Order of sorted results.
        # @param [String] type
        #   Select only inventory items with this type.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::InventoryItemsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::InventoryItemsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_inventory_items(profile_id, project_id, ids: nil, in_plan: nil, max_results: nil, order_id: nil, page_token: nil, site_id: nil, sort_field: nil, sort_order: nil, type: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/projects/{projectId}/inventoryItems', options)
          command.response_representation = Google::Apis::DfareportingV3_3::InventoryItemsListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::InventoryItemsListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['projectId'] = project_id unless project_id.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['inPlan'] = in_plan unless in_plan.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['orderId'] = order_id unless order_id.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['siteId'] = site_id unless site_id.nil?
          command.query['sortField'] = sort_field unless sort_field.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['type'] = type unless type.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of languages.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::LanguagesListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::LanguagesListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_languages(profile_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/languages', options)
          command.response_representation = Google::Apis::DfareportingV3_3::LanguagesListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::LanguagesListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of metros.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::MetrosListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::MetrosListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_metros(profile_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/metros', options)
          command.response_representation = Google::Apis::DfareportingV3_3::MetrosListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::MetrosListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one mobile app by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [String] id
        #   Mobile app ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::MobileApp] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::MobileApp]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_mobile_app(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/mobileApps/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::MobileApp::Representation
          command.response_class = Google::Apis::DfareportingV3_3::MobileApp
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves list of available mobile apps.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Array<String>, String] directories
        #   Select only apps from these directories.
        # @param [Array<String>, String] ids
        #   Select only apps with these IDs.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [String] page_token
        #   Value of the nextPageToken from the previous result page.
        # @param [String] search_string
        #   Allows searching for objects by name or ID. Wildcards (*) are allowed. For
        #   example, "app*2015" will return objects with names like "app Jan 2018", "app
        #   Jan 2018", or simply "app 2018". Most of the searches also add wildcards
        #   implicitly at the start and the end of the search string. For example, a
        #   search string of "app" will match objects with name "my app", "app 2018", or
        #   simply "app".
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::MobileAppsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::MobileAppsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_mobile_apps(profile_id, directories: nil, ids: nil, max_results: nil, page_token: nil, search_string: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/mobileApps', options)
          command.response_representation = Google::Apis::DfareportingV3_3::MobileAppsListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::MobileAppsListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['directories'] = directories unless directories.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['searchString'] = search_string unless search_string.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one mobile carrier by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Mobile carrier ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::MobileCarrier] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::MobileCarrier]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_mobile_carrier(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/mobileCarriers/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::MobileCarrier::Representation
          command.response_class = Google::Apis::DfareportingV3_3::MobileCarrier
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of mobile carriers.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::MobileCarriersListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::MobileCarriersListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_mobile_carriers(profile_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/mobileCarriers', options)
          command.response_representation = Google::Apis::DfareportingV3_3::MobileCarriersListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::MobileCarriersListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one operating system version by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Operating system version ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::OperatingSystemVersion] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::OperatingSystemVersion]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_operating_system_version(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/operatingSystemVersions/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::OperatingSystemVersion::Representation
          command.response_class = Google::Apis::DfareportingV3_3::OperatingSystemVersion
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of operating system versions.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::OperatingSystemVersionsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::OperatingSystemVersionsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_operating_system_versions(profile_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/operatingSystemVersions', options)
          command.response_representation = Google::Apis::DfareportingV3_3::OperatingSystemVersionsListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::OperatingSystemVersionsListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one operating system by DART ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] dart_id
        #   Operating system DART ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::OperatingSystem] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::OperatingSystem]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_operating_system(profile_id, dart_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/operatingSystems/{dartId}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::OperatingSystem::Representation
          command.response_class = Google::Apis::DfareportingV3_3::OperatingSystem
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['dartId'] = dart_id unless dart_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of operating systems.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::OperatingSystemsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::OperatingSystemsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_operating_systems(profile_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/operatingSystems', options)
          command.response_representation = Google::Apis::DfareportingV3_3::OperatingSystemsListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::OperatingSystemsListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one order document by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] project_id
        #   Project ID for order documents.
        # @param [Fixnum] id
        #   Order document ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::OrderDocument] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::OrderDocument]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_order_document(profile_id, project_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/projects/{projectId}/orderDocuments/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::OrderDocument::Representation
          command.response_class = Google::Apis::DfareportingV3_3::OrderDocument
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of order documents, possibly filtered. This method supports
        # paging.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] project_id
        #   Project ID for order documents.
        # @param [Boolean] approved
        #   Select only order documents that have been approved by at least one user.
        # @param [Array<Fixnum>, Fixnum] ids
        #   Select only order documents with these IDs.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [Array<Fixnum>, Fixnum] order_id
        #   Select only order documents for specified orders.
        # @param [String] page_token
        #   Value of the nextPageToken from the previous result page.
        # @param [String] search_string
        #   Allows searching for order documents by name or ID. Wildcards (*) are allowed.
        #   For example, "orderdocument*2015" will return order documents with names like "
        #   orderdocument June 2015", "orderdocument April 2015", or simply "orderdocument
        #   2015". Most of the searches also add wildcards implicitly at the start and the
        #   end of the search string. For example, a search string of "orderdocument" will
        #   match order documents with name "my orderdocument", "orderdocument 2015", or
        #   simply "orderdocument".
        # @param [Array<Fixnum>, Fixnum] site_id
        #   Select only order documents that are associated with these sites.
        # @param [String] sort_field
        #   Field by which to sort the list.
        # @param [String] sort_order
        #   Order of sorted results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::OrderDocumentsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::OrderDocumentsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_order_documents(profile_id, project_id, approved: nil, ids: nil, max_results: nil, order_id: nil, page_token: nil, search_string: nil, site_id: nil, sort_field: nil, sort_order: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/projects/{projectId}/orderDocuments', options)
          command.response_representation = Google::Apis::DfareportingV3_3::OrderDocumentsListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::OrderDocumentsListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['projectId'] = project_id unless project_id.nil?
          command.query['approved'] = approved unless approved.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['orderId'] = order_id unless order_id.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['searchString'] = search_string unless search_string.nil?
          command.query['siteId'] = site_id unless site_id.nil?
          command.query['sortField'] = sort_field unless sort_field.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one order by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] project_id
        #   Project ID for orders.
        # @param [Fixnum] id
        #   Order ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Order] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Order]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_order(profile_id, project_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/projects/{projectId}/orders/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::Order::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Order
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of orders, possibly filtered. This method supports paging.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] project_id
        #   Project ID for orders.
        # @param [Array<Fixnum>, Fixnum] ids
        #   Select only orders with these IDs.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [String] page_token
        #   Value of the nextPageToken from the previous result page.
        # @param [String] search_string
        #   Allows searching for orders by name or ID. Wildcards (*) are allowed. For
        #   example, "order*2015" will return orders with names like "order June 2015", "
        #   order April 2015", or simply "order 2015". Most of the searches also add
        #   wildcards implicitly at the start and the end of the search string. For
        #   example, a search string of "order" will match orders with name "my order", "
        #   order 2015", or simply "order".
        # @param [Array<Fixnum>, Fixnum] site_id
        #   Select only orders that are associated with these site IDs.
        # @param [String] sort_field
        #   Field by which to sort the list.
        # @param [String] sort_order
        #   Order of sorted results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::OrdersListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::OrdersListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_orders(profile_id, project_id, ids: nil, max_results: nil, page_token: nil, search_string: nil, site_id: nil, sort_field: nil, sort_order: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/projects/{projectId}/orders', options)
          command.response_representation = Google::Apis::DfareportingV3_3::OrdersListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::OrdersListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['projectId'] = project_id unless project_id.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['searchString'] = search_string unless search_string.nil?
          command.query['siteId'] = site_id unless site_id.nil?
          command.query['sortField'] = sort_field unless sort_field.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one placement group by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Placement group ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::PlacementGroup] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::PlacementGroup]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_placement_group(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/placementGroups/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::PlacementGroup::Representation
          command.response_class = Google::Apis::DfareportingV3_3::PlacementGroup
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a new placement group.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::PlacementGroup] placement_group_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::PlacementGroup] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::PlacementGroup]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_placement_group(profile_id, placement_group_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/placementGroups', options)
          command.request_representation = Google::Apis::DfareportingV3_3::PlacementGroup::Representation
          command.request_object = placement_group_object
          command.response_representation = Google::Apis::DfareportingV3_3::PlacementGroup::Representation
          command.response_class = Google::Apis::DfareportingV3_3::PlacementGroup
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of placement groups, possibly filtered. This method supports
        # paging.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Array<Fixnum>, Fixnum] advertiser_ids
        #   Select only placement groups that belong to these advertisers.
        # @param [Boolean] archived
        #   Select only archived placements. Don't set this field to select both archived
        #   and non-archived placements.
        # @param [Array<Fixnum>, Fixnum] campaign_ids
        #   Select only placement groups that belong to these campaigns.
        # @param [Array<Fixnum>, Fixnum] content_category_ids
        #   Select only placement groups that are associated with these content categories.
        # @param [Array<Fixnum>, Fixnum] directory_site_ids
        #   Select only placement groups that are associated with these directory sites.
        # @param [Array<Fixnum>, Fixnum] ids
        #   Select only placement groups with these IDs.
        # @param [String] max_end_date
        #   Select only placements or placement groups whose end date is on or before the
        #   specified maxEndDate. The date should be formatted as "yyyy-MM-dd".
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [String] max_start_date
        #   Select only placements or placement groups whose start date is on or before
        #   the specified maxStartDate. The date should be formatted as "yyyy-MM-dd".
        # @param [String] min_end_date
        #   Select only placements or placement groups whose end date is on or after the
        #   specified minEndDate. The date should be formatted as "yyyy-MM-dd".
        # @param [String] min_start_date
        #   Select only placements or placement groups whose start date is on or after the
        #   specified minStartDate. The date should be formatted as "yyyy-MM-dd".
        # @param [String] page_token
        #   Value of the nextPageToken from the previous result page.
        # @param [String] placement_group_type
        #   Select only placement groups belonging with this group type. A package is a
        #   simple group of placements that acts as a single pricing point for a group of
        #   tags. A roadblock is a group of placements that not only acts as a single
        #   pricing point but also assumes that all the tags in it will be served at the
        #   same time. A roadblock requires one of its assigned placements to be marked as
        #   primary for reporting.
        # @param [Array<Fixnum>, Fixnum] placement_strategy_ids
        #   Select only placement groups that are associated with these placement
        #   strategies.
        # @param [Array<String>, String] pricing_types
        #   Select only placement groups with these pricing types.
        # @param [String] search_string
        #   Allows searching for placement groups by name or ID. Wildcards (*) are allowed.
        #   For example, "placement*2015" will return placement groups with names like "
        #   placement group June 2015", "placement group May 2015", or simply "placements
        #   2015". Most of the searches also add wildcards implicitly at the start and the
        #   end of the search string. For example, a search string of "placementgroup"
        #   will match placement groups with name "my placementgroup", "placementgroup
        #   2015", or simply "placementgroup".
        # @param [Array<Fixnum>, Fixnum] site_ids
        #   Select only placement groups that are associated with these sites.
        # @param [String] sort_field
        #   Field by which to sort the list.
        # @param [String] sort_order
        #   Order of sorted results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::PlacementGroupsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::PlacementGroupsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_placement_groups(profile_id, advertiser_ids: nil, archived: nil, campaign_ids: nil, content_category_ids: nil, directory_site_ids: nil, ids: nil, max_end_date: nil, max_results: nil, max_start_date: nil, min_end_date: nil, min_start_date: nil, page_token: nil, placement_group_type: nil, placement_strategy_ids: nil, pricing_types: nil, search_string: nil, site_ids: nil, sort_field: nil, sort_order: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/placementGroups', options)
          command.response_representation = Google::Apis::DfareportingV3_3::PlacementGroupsListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::PlacementGroupsListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['advertiserIds'] = advertiser_ids unless advertiser_ids.nil?
          command.query['archived'] = archived unless archived.nil?
          command.query['campaignIds'] = campaign_ids unless campaign_ids.nil?
          command.query['contentCategoryIds'] = content_category_ids unless content_category_ids.nil?
          command.query['directorySiteIds'] = directory_site_ids unless directory_site_ids.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['maxEndDate'] = max_end_date unless max_end_date.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['maxStartDate'] = max_start_date unless max_start_date.nil?
          command.query['minEndDate'] = min_end_date unless min_end_date.nil?
          command.query['minStartDate'] = min_start_date unless min_start_date.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['placementGroupType'] = placement_group_type unless placement_group_type.nil?
          command.query['placementStrategyIds'] = placement_strategy_ids unless placement_strategy_ids.nil?
          command.query['pricingTypes'] = pricing_types unless pricing_types.nil?
          command.query['searchString'] = search_string unless search_string.nil?
          command.query['siteIds'] = site_ids unless site_ids.nil?
          command.query['sortField'] = sort_field unless sort_field.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing placement group. This method supports patch semantics.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Placement group ID.
        # @param [Google::Apis::DfareportingV3_3::PlacementGroup] placement_group_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::PlacementGroup] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::PlacementGroup]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_placement_group(profile_id, id, placement_group_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'userprofiles/{profileId}/placementGroups', options)
          command.request_representation = Google::Apis::DfareportingV3_3::PlacementGroup::Representation
          command.request_object = placement_group_object
          command.response_representation = Google::Apis::DfareportingV3_3::PlacementGroup::Representation
          command.response_class = Google::Apis::DfareportingV3_3::PlacementGroup
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing placement group.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::PlacementGroup] placement_group_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::PlacementGroup] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::PlacementGroup]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_placement_group(profile_id, placement_group_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'userprofiles/{profileId}/placementGroups', options)
          command.request_representation = Google::Apis::DfareportingV3_3::PlacementGroup::Representation
          command.request_object = placement_group_object
          command.response_representation = Google::Apis::DfareportingV3_3::PlacementGroup::Representation
          command.response_class = Google::Apis::DfareportingV3_3::PlacementGroup
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes an existing placement strategy.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Placement strategy ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_placement_strategy(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'userprofiles/{profileId}/placementStrategies/{id}', options)
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one placement strategy by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Placement strategy ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::PlacementStrategy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::PlacementStrategy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_placement_strategy(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/placementStrategies/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::PlacementStrategy::Representation
          command.response_class = Google::Apis::DfareportingV3_3::PlacementStrategy
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a new placement strategy.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::PlacementStrategy] placement_strategy_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::PlacementStrategy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::PlacementStrategy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_placement_strategy(profile_id, placement_strategy_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/placementStrategies', options)
          command.request_representation = Google::Apis::DfareportingV3_3::PlacementStrategy::Representation
          command.request_object = placement_strategy_object
          command.response_representation = Google::Apis::DfareportingV3_3::PlacementStrategy::Representation
          command.response_class = Google::Apis::DfareportingV3_3::PlacementStrategy
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of placement strategies, possibly filtered. This method
        # supports paging.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Array<Fixnum>, Fixnum] ids
        #   Select only placement strategies with these IDs.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [String] page_token
        #   Value of the nextPageToken from the previous result page.
        # @param [String] search_string
        #   Allows searching for objects by name or ID. Wildcards (*) are allowed. For
        #   example, "placementstrategy*2015" will return objects with names like "
        #   placementstrategy June 2015", "placementstrategy April 2015", or simply "
        #   placementstrategy 2015". Most of the searches also add wildcards implicitly at
        #   the start and the end of the search string. For example, a search string of "
        #   placementstrategy" will match objects with name "my placementstrategy", "
        #   placementstrategy 2015", or simply "placementstrategy".
        # @param [String] sort_field
        #   Field by which to sort the list.
        # @param [String] sort_order
        #   Order of sorted results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::PlacementStrategiesListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::PlacementStrategiesListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_placement_strategies(profile_id, ids: nil, max_results: nil, page_token: nil, search_string: nil, sort_field: nil, sort_order: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/placementStrategies', options)
          command.response_representation = Google::Apis::DfareportingV3_3::PlacementStrategiesListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::PlacementStrategiesListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['searchString'] = search_string unless search_string.nil?
          command.query['sortField'] = sort_field unless sort_field.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing placement strategy. This method supports patch semantics.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Placement strategy ID.
        # @param [Google::Apis::DfareportingV3_3::PlacementStrategy] placement_strategy_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::PlacementStrategy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::PlacementStrategy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_placement_strategy(profile_id, id, placement_strategy_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'userprofiles/{profileId}/placementStrategies', options)
          command.request_representation = Google::Apis::DfareportingV3_3::PlacementStrategy::Representation
          command.request_object = placement_strategy_object
          command.response_representation = Google::Apis::DfareportingV3_3::PlacementStrategy::Representation
          command.response_class = Google::Apis::DfareportingV3_3::PlacementStrategy
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing placement strategy.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::PlacementStrategy] placement_strategy_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::PlacementStrategy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::PlacementStrategy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_placement_strategy(profile_id, placement_strategy_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'userprofiles/{profileId}/placementStrategies', options)
          command.request_representation = Google::Apis::DfareportingV3_3::PlacementStrategy::Representation
          command.request_object = placement_strategy_object
          command.response_representation = Google::Apis::DfareportingV3_3::PlacementStrategy::Representation
          command.response_class = Google::Apis::DfareportingV3_3::PlacementStrategy
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Generates tags for a placement.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] campaign_id
        #   Generate placements belonging to this campaign. This is a required field.
        # @param [Array<Fixnum>, Fixnum] placement_ids
        #   Generate tags for these placements.
        # @param [Array<String>, String] tag_formats
        #   Tag formats to generate for these placements.
        #   Note: PLACEMENT_TAG_STANDARD can only be generated for 1x1 placements.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::PlacementsGenerateTagsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::PlacementsGenerateTagsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def generatetags_placement(profile_id, campaign_id: nil, placement_ids: nil, tag_formats: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/placements/generatetags', options)
          command.response_representation = Google::Apis::DfareportingV3_3::PlacementsGenerateTagsResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::PlacementsGenerateTagsResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['campaignId'] = campaign_id unless campaign_id.nil?
          command.query['placementIds'] = placement_ids unless placement_ids.nil?
          command.query['tagFormats'] = tag_formats unless tag_formats.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one placement by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Placement ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Placement] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Placement]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_placement(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/placements/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::Placement::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Placement
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a new placement.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::Placement] placement_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Placement] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Placement]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_placement(profile_id, placement_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/placements', options)
          command.request_representation = Google::Apis::DfareportingV3_3::Placement::Representation
          command.request_object = placement_object
          command.response_representation = Google::Apis::DfareportingV3_3::Placement::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Placement
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of placements, possibly filtered. This method supports paging.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Array<Fixnum>, Fixnum] advertiser_ids
        #   Select only placements that belong to these advertisers.
        # @param [Boolean] archived
        #   Select only archived placements. Don't set this field to select both archived
        #   and non-archived placements.
        # @param [Array<Fixnum>, Fixnum] campaign_ids
        #   Select only placements that belong to these campaigns.
        # @param [Array<String>, String] compatibilities
        #   Select only placements that are associated with these compatibilities. DISPLAY
        #   and DISPLAY_INTERSTITIAL refer to rendering either on desktop or on mobile
        #   devices for regular or interstitial ads respectively. APP and APP_INTERSTITIAL
        #   are for rendering in mobile apps. IN_STREAM_VIDEO refers to rendering in in-
        #   stream video ads developed with the VAST standard.
        # @param [Array<Fixnum>, Fixnum] content_category_ids
        #   Select only placements that are associated with these content categories.
        # @param [Array<Fixnum>, Fixnum] directory_site_ids
        #   Select only placements that are associated with these directory sites.
        # @param [Array<Fixnum>, Fixnum] group_ids
        #   Select only placements that belong to these placement groups.
        # @param [Array<Fixnum>, Fixnum] ids
        #   Select only placements with these IDs.
        # @param [String] max_end_date
        #   Select only placements or placement groups whose end date is on or before the
        #   specified maxEndDate. The date should be formatted as "yyyy-MM-dd".
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [String] max_start_date
        #   Select only placements or placement groups whose start date is on or before
        #   the specified maxStartDate. The date should be formatted as "yyyy-MM-dd".
        # @param [String] min_end_date
        #   Select only placements or placement groups whose end date is on or after the
        #   specified minEndDate. The date should be formatted as "yyyy-MM-dd".
        # @param [String] min_start_date
        #   Select only placements or placement groups whose start date is on or after the
        #   specified minStartDate. The date should be formatted as "yyyy-MM-dd".
        # @param [String] page_token
        #   Value of the nextPageToken from the previous result page.
        # @param [String] payment_source
        #   Select only placements with this payment source.
        # @param [Array<Fixnum>, Fixnum] placement_strategy_ids
        #   Select only placements that are associated with these placement strategies.
        # @param [Array<String>, String] pricing_types
        #   Select only placements with these pricing types.
        # @param [String] search_string
        #   Allows searching for placements by name or ID. Wildcards (*) are allowed. For
        #   example, "placement*2015" will return placements with names like "placement
        #   June 2015", "placement May 2015", or simply "placements 2015". Most of the
        #   searches also add wildcards implicitly at the start and the end of the search
        #   string. For example, a search string of "placement" will match placements with
        #   name "my placement", "placement 2015", or simply "placement".
        # @param [Array<Fixnum>, Fixnum] site_ids
        #   Select only placements that are associated with these sites.
        # @param [Array<Fixnum>, Fixnum] size_ids
        #   Select only placements that are associated with these sizes.
        # @param [String] sort_field
        #   Field by which to sort the list.
        # @param [String] sort_order
        #   Order of sorted results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::PlacementsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::PlacementsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_placements(profile_id, advertiser_ids: nil, archived: nil, campaign_ids: nil, compatibilities: nil, content_category_ids: nil, directory_site_ids: nil, group_ids: nil, ids: nil, max_end_date: nil, max_results: nil, max_start_date: nil, min_end_date: nil, min_start_date: nil, page_token: nil, payment_source: nil, placement_strategy_ids: nil, pricing_types: nil, search_string: nil, site_ids: nil, size_ids: nil, sort_field: nil, sort_order: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/placements', options)
          command.response_representation = Google::Apis::DfareportingV3_3::PlacementsListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::PlacementsListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['advertiserIds'] = advertiser_ids unless advertiser_ids.nil?
          command.query['archived'] = archived unless archived.nil?
          command.query['campaignIds'] = campaign_ids unless campaign_ids.nil?
          command.query['compatibilities'] = compatibilities unless compatibilities.nil?
          command.query['contentCategoryIds'] = content_category_ids unless content_category_ids.nil?
          command.query['directorySiteIds'] = directory_site_ids unless directory_site_ids.nil?
          command.query['groupIds'] = group_ids unless group_ids.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['maxEndDate'] = max_end_date unless max_end_date.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['maxStartDate'] = max_start_date unless max_start_date.nil?
          command.query['minEndDate'] = min_end_date unless min_end_date.nil?
          command.query['minStartDate'] = min_start_date unless min_start_date.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['paymentSource'] = payment_source unless payment_source.nil?
          command.query['placementStrategyIds'] = placement_strategy_ids unless placement_strategy_ids.nil?
          command.query['pricingTypes'] = pricing_types unless pricing_types.nil?
          command.query['searchString'] = search_string unless search_string.nil?
          command.query['siteIds'] = site_ids unless site_ids.nil?
          command.query['sizeIds'] = size_ids unless size_ids.nil?
          command.query['sortField'] = sort_field unless sort_field.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing placement. This method supports patch semantics.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Placement ID.
        # @param [Google::Apis::DfareportingV3_3::Placement] placement_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Placement] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Placement]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_placement(profile_id, id, placement_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'userprofiles/{profileId}/placements', options)
          command.request_representation = Google::Apis::DfareportingV3_3::Placement::Representation
          command.request_object = placement_object
          command.response_representation = Google::Apis::DfareportingV3_3::Placement::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Placement
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing placement.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::Placement] placement_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Placement] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Placement]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_placement(profile_id, placement_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'userprofiles/{profileId}/placements', options)
          command.request_representation = Google::Apis::DfareportingV3_3::Placement::Representation
          command.request_object = placement_object
          command.response_representation = Google::Apis::DfareportingV3_3::Placement::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Placement
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one platform type by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Platform type ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::PlatformType] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::PlatformType]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_platform_type(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/platformTypes/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::PlatformType::Representation
          command.response_class = Google::Apis::DfareportingV3_3::PlatformType
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of platform types.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::PlatformTypesListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::PlatformTypesListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_platform_types(profile_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/platformTypes', options)
          command.response_representation = Google::Apis::DfareportingV3_3::PlatformTypesListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::PlatformTypesListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one postal code by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [String] code
        #   Postal code ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::PostalCode] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::PostalCode]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_postal_code(profile_id, code, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/postalCodes/{code}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::PostalCode::Representation
          command.response_class = Google::Apis::DfareportingV3_3::PostalCode
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['code'] = code unless code.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of postal codes.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::PostalCodesListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::PostalCodesListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_postal_codes(profile_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/postalCodes', options)
          command.response_representation = Google::Apis::DfareportingV3_3::PostalCodesListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::PostalCodesListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one project by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Project ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Project] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Project]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/projects/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::Project::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Project
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of projects, possibly filtered. This method supports paging.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Array<Fixnum>, Fixnum] advertiser_ids
        #   Select only projects with these advertiser IDs.
        # @param [Array<Fixnum>, Fixnum] ids
        #   Select only projects with these IDs.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [String] page_token
        #   Value of the nextPageToken from the previous result page.
        # @param [String] search_string
        #   Allows searching for projects by name or ID. Wildcards (*) are allowed. For
        #   example, "project*2015" will return projects with names like "project June
        #   2015", "project April 2015", or simply "project 2015". Most of the searches
        #   also add wildcards implicitly at the start and the end of the search string.
        #   For example, a search string of "project" will match projects with name "my
        #   project", "project 2015", or simply "project".
        # @param [String] sort_field
        #   Field by which to sort the list.
        # @param [String] sort_order
        #   Order of sorted results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::ProjectsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::ProjectsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_projects(profile_id, advertiser_ids: nil, ids: nil, max_results: nil, page_token: nil, search_string: nil, sort_field: nil, sort_order: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/projects', options)
          command.response_representation = Google::Apis::DfareportingV3_3::ProjectsListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::ProjectsListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['advertiserIds'] = advertiser_ids unless advertiser_ids.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['searchString'] = search_string unless search_string.nil?
          command.query['sortField'] = sort_field unless sort_field.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of regions.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::RegionsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::RegionsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_regions(profile_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/regions', options)
          command.response_representation = Google::Apis::DfareportingV3_3::RegionsListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::RegionsListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one remarketing list share by remarketing list ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] remarketing_list_id
        #   Remarketing list ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::RemarketingListShare] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::RemarketingListShare]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_remarketing_list_share(profile_id, remarketing_list_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/remarketingListShares/{remarketingListId}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::RemarketingListShare::Representation
          command.response_class = Google::Apis::DfareportingV3_3::RemarketingListShare
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['remarketingListId'] = remarketing_list_id unless remarketing_list_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing remarketing list share. This method supports patch
        # semantics.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] remarketing_list_id
        #   Remarketing list ID.
        # @param [Google::Apis::DfareportingV3_3::RemarketingListShare] remarketing_list_share_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::RemarketingListShare] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::RemarketingListShare]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_remarketing_list_share(profile_id, remarketing_list_id, remarketing_list_share_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'userprofiles/{profileId}/remarketingListShares', options)
          command.request_representation = Google::Apis::DfareportingV3_3::RemarketingListShare::Representation
          command.request_object = remarketing_list_share_object
          command.response_representation = Google::Apis::DfareportingV3_3::RemarketingListShare::Representation
          command.response_class = Google::Apis::DfareportingV3_3::RemarketingListShare
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['remarketingListId'] = remarketing_list_id unless remarketing_list_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing remarketing list share.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::RemarketingListShare] remarketing_list_share_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::RemarketingListShare] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::RemarketingListShare]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_remarketing_list_share(profile_id, remarketing_list_share_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'userprofiles/{profileId}/remarketingListShares', options)
          command.request_representation = Google::Apis::DfareportingV3_3::RemarketingListShare::Representation
          command.request_object = remarketing_list_share_object
          command.response_representation = Google::Apis::DfareportingV3_3::RemarketingListShare::Representation
          command.response_class = Google::Apis::DfareportingV3_3::RemarketingListShare
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one remarketing list by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Remarketing list ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::RemarketingList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::RemarketingList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_remarketing_list(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/remarketingLists/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::RemarketingList::Representation
          command.response_class = Google::Apis::DfareportingV3_3::RemarketingList
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a new remarketing list.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::RemarketingList] remarketing_list_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::RemarketingList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::RemarketingList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_remarketing_list(profile_id, remarketing_list_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/remarketingLists', options)
          command.request_representation = Google::Apis::DfareportingV3_3::RemarketingList::Representation
          command.request_object = remarketing_list_object
          command.response_representation = Google::Apis::DfareportingV3_3::RemarketingList::Representation
          command.response_class = Google::Apis::DfareportingV3_3::RemarketingList
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of remarketing lists, possibly filtered. This method supports
        # paging.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] advertiser_id
        #   Select only remarketing lists owned by this advertiser.
        # @param [Boolean] active
        #   Select only active or only inactive remarketing lists.
        # @param [Fixnum] floodlight_activity_id
        #   Select only remarketing lists that have this floodlight activity ID.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [String] name
        #   Allows searching for objects by name or ID. Wildcards (*) are allowed. For
        #   example, "remarketing list*2015" will return objects with names like "
        #   remarketing list June 2015", "remarketing list April 2015", or simply "
        #   remarketing list 2015". Most of the searches also add wildcards implicitly at
        #   the start and the end of the search string. For example, a search string of "
        #   remarketing list" will match objects with name "my remarketing list", "
        #   remarketing list 2015", or simply "remarketing list".
        # @param [String] page_token
        #   Value of the nextPageToken from the previous result page.
        # @param [String] sort_field
        #   Field by which to sort the list.
        # @param [String] sort_order
        #   Order of sorted results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::RemarketingListsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::RemarketingListsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_remarketing_lists(profile_id, advertiser_id, active: nil, floodlight_activity_id: nil, max_results: nil, name: nil, page_token: nil, sort_field: nil, sort_order: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/remarketingLists', options)
          command.response_representation = Google::Apis::DfareportingV3_3::RemarketingListsListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::RemarketingListsListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['active'] = active unless active.nil?
          command.query['advertiserId'] = advertiser_id unless advertiser_id.nil?
          command.query['floodlightActivityId'] = floodlight_activity_id unless floodlight_activity_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['name'] = name unless name.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['sortField'] = sort_field unless sort_field.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing remarketing list. This method supports patch semantics.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Remarketing list ID.
        # @param [Google::Apis::DfareportingV3_3::RemarketingList] remarketing_list_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::RemarketingList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::RemarketingList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_remarketing_list(profile_id, id, remarketing_list_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'userprofiles/{profileId}/remarketingLists', options)
          command.request_representation = Google::Apis::DfareportingV3_3::RemarketingList::Representation
          command.request_object = remarketing_list_object
          command.response_representation = Google::Apis::DfareportingV3_3::RemarketingList::Representation
          command.response_class = Google::Apis::DfareportingV3_3::RemarketingList
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing remarketing list.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::RemarketingList] remarketing_list_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::RemarketingList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::RemarketingList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_remarketing_list(profile_id, remarketing_list_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'userprofiles/{profileId}/remarketingLists', options)
          command.request_representation = Google::Apis::DfareportingV3_3::RemarketingList::Representation
          command.request_object = remarketing_list_object
          command.response_representation = Google::Apis::DfareportingV3_3::RemarketingList::Representation
          command.response_class = Google::Apis::DfareportingV3_3::RemarketingList
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a report by its ID.
        # @param [Fixnum] profile_id
        #   The DFA user profile ID.
        # @param [Fixnum] report_id
        #   The ID of the report.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_report(profile_id, report_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'userprofiles/{profileId}/reports/{reportId}', options)
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['reportId'] = report_id unless report_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a report by its ID.
        # @param [Fixnum] profile_id
        #   The DFA user profile ID.
        # @param [Fixnum] report_id
        #   The ID of the report.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Report] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Report]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_report(profile_id, report_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/reports/{reportId}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::Report::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Report
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['reportId'] = report_id unless report_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a report.
        # @param [Fixnum] profile_id
        #   The DFA user profile ID.
        # @param [Google::Apis::DfareportingV3_3::Report] report_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Report] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Report]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_report(profile_id, report_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/reports', options)
          command.request_representation = Google::Apis::DfareportingV3_3::Report::Representation
          command.request_object = report_object
          command.response_representation = Google::Apis::DfareportingV3_3::Report::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Report
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves list of reports.
        # @param [Fixnum] profile_id
        #   The DFA user profile ID.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [String] page_token
        #   The value of the nextToken from the previous result page.
        # @param [String] scope
        #   The scope that defines which results are returned.
        # @param [String] sort_field
        #   The field by which to sort the list.
        # @param [String] sort_order
        #   Order of sorted results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::ReportList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::ReportList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_reports(profile_id, max_results: nil, page_token: nil, scope: nil, sort_field: nil, sort_order: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/reports', options)
          command.response_representation = Google::Apis::DfareportingV3_3::ReportList::Representation
          command.response_class = Google::Apis::DfareportingV3_3::ReportList
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['scope'] = scope unless scope.nil?
          command.query['sortField'] = sort_field unless sort_field.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a report. This method supports patch semantics.
        # @param [Fixnum] profile_id
        #   The DFA user profile ID.
        # @param [Fixnum] report_id
        #   The ID of the report.
        # @param [Google::Apis::DfareportingV3_3::Report] report_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Report] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Report]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_report(profile_id, report_id, report_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'userprofiles/{profileId}/reports/{reportId}', options)
          command.request_representation = Google::Apis::DfareportingV3_3::Report::Representation
          command.request_object = report_object
          command.response_representation = Google::Apis::DfareportingV3_3::Report::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Report
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['reportId'] = report_id unless report_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Runs a report.
        # @param [Fixnum] profile_id
        #   The DFA profile ID.
        # @param [Fixnum] report_id
        #   The ID of the report.
        # @param [Boolean] synchronous
        #   If set and true, tries to run the report synchronously.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::File] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::File]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def run_report(profile_id, report_id, synchronous: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/reports/{reportId}/run', options)
          command.response_representation = Google::Apis::DfareportingV3_3::File::Representation
          command.response_class = Google::Apis::DfareportingV3_3::File
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['reportId'] = report_id unless report_id.nil?
          command.query['synchronous'] = synchronous unless synchronous.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a report.
        # @param [Fixnum] profile_id
        #   The DFA user profile ID.
        # @param [Fixnum] report_id
        #   The ID of the report.
        # @param [Google::Apis::DfareportingV3_3::Report] report_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Report] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Report]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_report(profile_id, report_id, report_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'userprofiles/{profileId}/reports/{reportId}', options)
          command.request_representation = Google::Apis::DfareportingV3_3::Report::Representation
          command.request_object = report_object
          command.response_representation = Google::Apis::DfareportingV3_3::Report::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Report
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['reportId'] = report_id unless report_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the fields that are compatible to be selected in the respective
        # sections of a report criteria, given the fields already selected in the input
        # report and user permissions.
        # @param [Fixnum] profile_id
        #   The DFA user profile ID.
        # @param [Google::Apis::DfareportingV3_3::Report] report_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::CompatibleFields] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::CompatibleFields]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def query_report_compatible_field(profile_id, report_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/reports/compatiblefields/query', options)
          command.request_representation = Google::Apis::DfareportingV3_3::Report::Representation
          command.request_object = report_object
          command.response_representation = Google::Apis::DfareportingV3_3::CompatibleFields::Representation
          command.response_class = Google::Apis::DfareportingV3_3::CompatibleFields
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a report file. This method supports media download.
        # @param [Fixnum] profile_id
        #   The DFA profile ID.
        # @param [Fixnum] report_id
        #   The ID of the report.
        # @param [Fixnum] file_id
        #   The ID of the report file.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [IO, String] download_dest
        #   IO stream or filename to receive content download
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::File] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::File]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_report_file(profile_id, report_id, file_id, fields: nil, quota_user: nil, user_ip: nil, download_dest: nil, options: nil, &block)
          if download_dest.nil?
            command = make_simple_command(:get, 'userprofiles/{profileId}/reports/{reportId}/files/{fileId}', options)
          else
            command = make_download_command(:get, 'userprofiles/{profileId}/reports/{reportId}/files/{fileId}', options)
            command.download_dest = download_dest
          end
          command.response_representation = Google::Apis::DfareportingV3_3::File::Representation
          command.response_class = Google::Apis::DfareportingV3_3::File
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['reportId'] = report_id unless report_id.nil?
          command.params['fileId'] = file_id unless file_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists files for a report.
        # @param [Fixnum] profile_id
        #   The DFA profile ID.
        # @param [Fixnum] report_id
        #   The ID of the parent report.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [String] page_token
        #   The value of the nextToken from the previous result page.
        # @param [String] sort_field
        #   The field by which to sort the list.
        # @param [String] sort_order
        #   Order of sorted results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::FileList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::FileList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_report_files(profile_id, report_id, max_results: nil, page_token: nil, sort_field: nil, sort_order: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/reports/{reportId}/files', options)
          command.response_representation = Google::Apis::DfareportingV3_3::FileList::Representation
          command.response_class = Google::Apis::DfareportingV3_3::FileList
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['reportId'] = report_id unless report_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['sortField'] = sort_field unless sort_field.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one site by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Site ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Site] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Site]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_site(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/sites/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::Site::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Site
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a new site.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::Site] site_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Site] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Site]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_site(profile_id, site_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/sites', options)
          command.request_representation = Google::Apis::DfareportingV3_3::Site::Representation
          command.request_object = site_object
          command.response_representation = Google::Apis::DfareportingV3_3::Site::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Site
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of sites, possibly filtered. This method supports paging.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Boolean] accepts_in_stream_video_placements
        #   This search filter is no longer supported and will have no effect on the
        #   results returned.
        # @param [Boolean] accepts_interstitial_placements
        #   This search filter is no longer supported and will have no effect on the
        #   results returned.
        # @param [Boolean] accepts_publisher_paid_placements
        #   Select only sites that accept publisher paid placements.
        # @param [Boolean] ad_words_site
        #   Select only AdWords sites.
        # @param [Boolean] approved
        #   Select only approved sites.
        # @param [Array<Fixnum>, Fixnum] campaign_ids
        #   Select only sites with these campaign IDs.
        # @param [Array<Fixnum>, Fixnum] directory_site_ids
        #   Select only sites with these directory site IDs.
        # @param [Array<Fixnum>, Fixnum] ids
        #   Select only sites with these IDs.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [String] page_token
        #   Value of the nextPageToken from the previous result page.
        # @param [String] search_string
        #   Allows searching for objects by name, ID or keyName. Wildcards (*) are allowed.
        #   For example, "site*2015" will return objects with names like "site June 2015",
        #   "site April 2015", or simply "site 2015". Most of the searches also add
        #   wildcards implicitly at the start and the end of the search string. For
        #   example, a search string of "site" will match objects with name "my site", "
        #   site 2015", or simply "site".
        # @param [String] sort_field
        #   Field by which to sort the list.
        # @param [String] sort_order
        #   Order of sorted results.
        # @param [Fixnum] subaccount_id
        #   Select only sites with this subaccount ID.
        # @param [Boolean] unmapped_site
        #   Select only sites that have not been mapped to a directory site.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::SitesListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::SitesListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_sites(profile_id, accepts_in_stream_video_placements: nil, accepts_interstitial_placements: nil, accepts_publisher_paid_placements: nil, ad_words_site: nil, approved: nil, campaign_ids: nil, directory_site_ids: nil, ids: nil, max_results: nil, page_token: nil, search_string: nil, sort_field: nil, sort_order: nil, subaccount_id: nil, unmapped_site: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/sites', options)
          command.response_representation = Google::Apis::DfareportingV3_3::SitesListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::SitesListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['acceptsInStreamVideoPlacements'] = accepts_in_stream_video_placements unless accepts_in_stream_video_placements.nil?
          command.query['acceptsInterstitialPlacements'] = accepts_interstitial_placements unless accepts_interstitial_placements.nil?
          command.query['acceptsPublisherPaidPlacements'] = accepts_publisher_paid_placements unless accepts_publisher_paid_placements.nil?
          command.query['adWordsSite'] = ad_words_site unless ad_words_site.nil?
          command.query['approved'] = approved unless approved.nil?
          command.query['campaignIds'] = campaign_ids unless campaign_ids.nil?
          command.query['directorySiteIds'] = directory_site_ids unless directory_site_ids.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['searchString'] = search_string unless search_string.nil?
          command.query['sortField'] = sort_field unless sort_field.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['subaccountId'] = subaccount_id unless subaccount_id.nil?
          command.query['unmappedSite'] = unmapped_site unless unmapped_site.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing site. This method supports patch semantics.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Site ID.
        # @param [Google::Apis::DfareportingV3_3::Site] site_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Site] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Site]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_site(profile_id, id, site_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'userprofiles/{profileId}/sites', options)
          command.request_representation = Google::Apis::DfareportingV3_3::Site::Representation
          command.request_object = site_object
          command.response_representation = Google::Apis::DfareportingV3_3::Site::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Site
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing site.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::Site] site_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Site] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Site]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_site(profile_id, site_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'userprofiles/{profileId}/sites', options)
          command.request_representation = Google::Apis::DfareportingV3_3::Site::Representation
          command.request_object = site_object
          command.response_representation = Google::Apis::DfareportingV3_3::Site::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Site
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one size by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Size ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Size] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Size]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_size(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/sizes/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::Size::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Size
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a new size.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::Size] size_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Size] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Size]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_size(profile_id, size_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/sizes', options)
          command.request_representation = Google::Apis::DfareportingV3_3::Size::Representation
          command.request_object = size_object
          command.response_representation = Google::Apis::DfareportingV3_3::Size::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Size
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of sizes, possibly filtered. Retrieved sizes are globally
        # unique and may include values not currently in use by your account. Due to
        # this, the list of sizes returned by this method may differ from the list seen
        # in the Trafficking UI.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] height
        #   Select only sizes with this height.
        # @param [Boolean] iab_standard
        #   Select only IAB standard sizes.
        # @param [Array<Fixnum>, Fixnum] ids
        #   Select only sizes with these IDs.
        # @param [Fixnum] width
        #   Select only sizes with this width.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::SizesListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::SizesListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_sizes(profile_id, height: nil, iab_standard: nil, ids: nil, width: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/sizes', options)
          command.response_representation = Google::Apis::DfareportingV3_3::SizesListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::SizesListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['height'] = height unless height.nil?
          command.query['iabStandard'] = iab_standard unless iab_standard.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['width'] = width unless width.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one subaccount by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Subaccount ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Subaccount] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Subaccount]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_subaccount(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/subaccounts/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::Subaccount::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Subaccount
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a new subaccount.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::Subaccount] subaccount_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Subaccount] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Subaccount]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_subaccount(profile_id, subaccount_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/subaccounts', options)
          command.request_representation = Google::Apis::DfareportingV3_3::Subaccount::Representation
          command.request_object = subaccount_object
          command.response_representation = Google::Apis::DfareportingV3_3::Subaccount::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Subaccount
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a list of subaccounts, possibly filtered. This method supports paging.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Array<Fixnum>, Fixnum] ids
        #   Select only subaccounts with these IDs.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [String] page_token
        #   Value of the nextPageToken from the previous result page.
        # @param [String] search_string
        #   Allows searching for objects by name or ID. Wildcards (*) are allowed. For
        #   example, "subaccount*2015" will return objects with names like "subaccount
        #   June 2015", "subaccount April 2015", or simply "subaccount 2015". Most of the
        #   searches also add wildcards implicitly at the start and the end of the search
        #   string. For example, a search string of "subaccount" will match objects with
        #   name "my subaccount", "subaccount 2015", or simply "subaccount".
        # @param [String] sort_field
        #   Field by which to sort the list.
        # @param [String] sort_order
        #   Order of sorted results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::SubaccountsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::SubaccountsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_subaccounts(profile_id, ids: nil, max_results: nil, page_token: nil, search_string: nil, sort_field: nil, sort_order: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/subaccounts', options)
          command.response_representation = Google::Apis::DfareportingV3_3::SubaccountsListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::SubaccountsListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['searchString'] = search_string unless search_string.nil?
          command.query['sortField'] = sort_field unless sort_field.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing subaccount. This method supports patch semantics.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Subaccount ID.
        # @param [Google::Apis::DfareportingV3_3::Subaccount] subaccount_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Subaccount] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Subaccount]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_subaccount(profile_id, id, subaccount_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'userprofiles/{profileId}/subaccounts', options)
          command.request_representation = Google::Apis::DfareportingV3_3::Subaccount::Representation
          command.request_object = subaccount_object
          command.response_representation = Google::Apis::DfareportingV3_3::Subaccount::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Subaccount
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing subaccount.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::Subaccount] subaccount_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::Subaccount] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::Subaccount]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_subaccount(profile_id, subaccount_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'userprofiles/{profileId}/subaccounts', options)
          command.request_representation = Google::Apis::DfareportingV3_3::Subaccount::Representation
          command.request_object = subaccount_object
          command.response_representation = Google::Apis::DfareportingV3_3::Subaccount::Representation
          command.response_class = Google::Apis::DfareportingV3_3::Subaccount
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one remarketing list by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Remarketing list ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::TargetableRemarketingList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::TargetableRemarketingList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_targetable_remarketing_list(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/targetableRemarketingLists/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::TargetableRemarketingList::Representation
          command.response_class = Google::Apis::DfareportingV3_3::TargetableRemarketingList
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of targetable remarketing lists, possibly filtered. This
        # method supports paging.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] advertiser_id
        #   Select only targetable remarketing lists targetable by these advertisers.
        # @param [Boolean] active
        #   Select only active or only inactive targetable remarketing lists.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [String] name
        #   Allows searching for objects by name or ID. Wildcards (*) are allowed. For
        #   example, "remarketing list*2015" will return objects with names like "
        #   remarketing list June 2015", "remarketing list April 2015", or simply "
        #   remarketing list 2015". Most of the searches also add wildcards implicitly at
        #   the start and the end of the search string. For example, a search string of "
        #   remarketing list" will match objects with name "my remarketing list", "
        #   remarketing list 2015", or simply "remarketing list".
        # @param [String] page_token
        #   Value of the nextPageToken from the previous result page.
        # @param [String] sort_field
        #   Field by which to sort the list.
        # @param [String] sort_order
        #   Order of sorted results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::TargetableRemarketingListsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::TargetableRemarketingListsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_targetable_remarketing_lists(profile_id, advertiser_id, active: nil, max_results: nil, name: nil, page_token: nil, sort_field: nil, sort_order: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/targetableRemarketingLists', options)
          command.response_representation = Google::Apis::DfareportingV3_3::TargetableRemarketingListsListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::TargetableRemarketingListsListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['active'] = active unless active.nil?
          command.query['advertiserId'] = advertiser_id unless advertiser_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['name'] = name unless name.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['sortField'] = sort_field unless sort_field.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one targeting template by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Targeting template ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::TargetingTemplate] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::TargetingTemplate]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_targeting_template(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/targetingTemplates/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::TargetingTemplate::Representation
          command.response_class = Google::Apis::DfareportingV3_3::TargetingTemplate
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a new targeting template.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::TargetingTemplate] targeting_template_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::TargetingTemplate] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::TargetingTemplate]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_targeting_template(profile_id, targeting_template_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/targetingTemplates', options)
          command.request_representation = Google::Apis::DfareportingV3_3::TargetingTemplate::Representation
          command.request_object = targeting_template_object
          command.response_representation = Google::Apis::DfareportingV3_3::TargetingTemplate::Representation
          command.response_class = Google::Apis::DfareportingV3_3::TargetingTemplate
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of targeting templates, optionally filtered. This method
        # supports paging.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] advertiser_id
        #   Select only targeting templates with this advertiser ID.
        # @param [Array<Fixnum>, Fixnum] ids
        #   Select only targeting templates with these IDs.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [String] page_token
        #   Value of the nextPageToken from the previous result page.
        # @param [String] search_string
        #   Allows searching for objects by name or ID. Wildcards (*) are allowed. For
        #   example, "template*2015" will return objects with names like "template June
        #   2015", "template April 2015", or simply "template 2015". Most of the searches
        #   also add wildcards implicitly at the start and the end of the search string.
        #   For example, a search string of "template" will match objects with name "my
        #   template", "template 2015", or simply "template".
        # @param [String] sort_field
        #   Field by which to sort the list.
        # @param [String] sort_order
        #   Order of sorted results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::TargetingTemplatesListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::TargetingTemplatesListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_targeting_templates(profile_id, advertiser_id: nil, ids: nil, max_results: nil, page_token: nil, search_string: nil, sort_field: nil, sort_order: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/targetingTemplates', options)
          command.response_representation = Google::Apis::DfareportingV3_3::TargetingTemplatesListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::TargetingTemplatesListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['advertiserId'] = advertiser_id unless advertiser_id.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['searchString'] = search_string unless search_string.nil?
          command.query['sortField'] = sort_field unless sort_field.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing targeting template. This method supports patch semantics.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Targeting template ID.
        # @param [Google::Apis::DfareportingV3_3::TargetingTemplate] targeting_template_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::TargetingTemplate] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::TargetingTemplate]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_targeting_template(profile_id, id, targeting_template_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'userprofiles/{profileId}/targetingTemplates', options)
          command.request_representation = Google::Apis::DfareportingV3_3::TargetingTemplate::Representation
          command.request_object = targeting_template_object
          command.response_representation = Google::Apis::DfareportingV3_3::TargetingTemplate::Representation
          command.response_class = Google::Apis::DfareportingV3_3::TargetingTemplate
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing targeting template.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::TargetingTemplate] targeting_template_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::TargetingTemplate] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::TargetingTemplate]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_targeting_template(profile_id, targeting_template_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'userprofiles/{profileId}/targetingTemplates', options)
          command.request_representation = Google::Apis::DfareportingV3_3::TargetingTemplate::Representation
          command.request_object = targeting_template_object
          command.response_representation = Google::Apis::DfareportingV3_3::TargetingTemplate::Representation
          command.response_class = Google::Apis::DfareportingV3_3::TargetingTemplate
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one user profile by ID.
        # @param [Fixnum] profile_id
        #   The user profile ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::UserProfile] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::UserProfile]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_user_profile(profile_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::UserProfile::Representation
          command.response_class = Google::Apis::DfareportingV3_3::UserProfile
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves list of user profiles for a user.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::UserProfileList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::UserProfileList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_user_profiles(fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles', options)
          command.response_representation = Google::Apis::DfareportingV3_3::UserProfileList::Representation
          command.response_class = Google::Apis::DfareportingV3_3::UserProfileList
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one user role permission group by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   User role permission group ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::UserRolePermissionGroup] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::UserRolePermissionGroup]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_user_role_permission_group(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/userRolePermissionGroups/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::UserRolePermissionGroup::Representation
          command.response_class = Google::Apis::DfareportingV3_3::UserRolePermissionGroup
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a list of all supported user role permission groups.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::UserRolePermissionGroupsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::UserRolePermissionGroupsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_user_role_permission_groups(profile_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/userRolePermissionGroups', options)
          command.response_representation = Google::Apis::DfareportingV3_3::UserRolePermissionGroupsListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::UserRolePermissionGroupsListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one user role permission by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   User role permission ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::UserRolePermission] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::UserRolePermission]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_user_role_permission(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/userRolePermissions/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::UserRolePermission::Representation
          command.response_class = Google::Apis::DfareportingV3_3::UserRolePermission
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a list of user role permissions, possibly filtered.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Array<Fixnum>, Fixnum] ids
        #   Select only user role permissions with these IDs.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::UserRolePermissionsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::UserRolePermissionsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_user_role_permissions(profile_id, ids: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/userRolePermissions', options)
          command.response_representation = Google::Apis::DfareportingV3_3::UserRolePermissionsListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::UserRolePermissionsListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes an existing user role.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   User role ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_user_role(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'userprofiles/{profileId}/userRoles/{id}', options)
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one user role by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   User role ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::UserRole] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::UserRole]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_user_role(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/userRoles/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::UserRole::Representation
          command.response_class = Google::Apis::DfareportingV3_3::UserRole
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a new user role.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::UserRole] user_role_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::UserRole] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::UserRole]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_user_role(profile_id, user_role_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'userprofiles/{profileId}/userRoles', options)
          command.request_representation = Google::Apis::DfareportingV3_3::UserRole::Representation
          command.request_object = user_role_object
          command.response_representation = Google::Apis::DfareportingV3_3::UserRole::Representation
          command.response_class = Google::Apis::DfareportingV3_3::UserRole
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of user roles, possibly filtered. This method supports paging.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Boolean] account_user_role_only
        #   Select only account level user roles not associated with any specific
        #   subaccount.
        # @param [Array<Fixnum>, Fixnum] ids
        #   Select only user roles with the specified IDs.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [String] page_token
        #   Value of the nextPageToken from the previous result page.
        # @param [String] search_string
        #   Allows searching for objects by name or ID. Wildcards (*) are allowed. For
        #   example, "userrole*2015" will return objects with names like "userrole June
        #   2015", "userrole April 2015", or simply "userrole 2015". Most of the searches
        #   also add wildcards implicitly at the start and the end of the search string.
        #   For example, a search string of "userrole" will match objects with name "my
        #   userrole", "userrole 2015", or simply "userrole".
        # @param [String] sort_field
        #   Field by which to sort the list.
        # @param [String] sort_order
        #   Order of sorted results.
        # @param [Fixnum] subaccount_id
        #   Select only user roles that belong to this subaccount.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::UserRolesListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::UserRolesListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_user_roles(profile_id, account_user_role_only: nil, ids: nil, max_results: nil, page_token: nil, search_string: nil, sort_field: nil, sort_order: nil, subaccount_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/userRoles', options)
          command.response_representation = Google::Apis::DfareportingV3_3::UserRolesListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::UserRolesListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['accountUserRoleOnly'] = account_user_role_only unless account_user_role_only.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['searchString'] = search_string unless search_string.nil?
          command.query['sortField'] = sort_field unless sort_field.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['subaccountId'] = subaccount_id unless subaccount_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing user role. This method supports patch semantics.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   User role ID.
        # @param [Google::Apis::DfareportingV3_3::UserRole] user_role_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::UserRole] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::UserRole]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_user_role(profile_id, id, user_role_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'userprofiles/{profileId}/userRoles', options)
          command.request_representation = Google::Apis::DfareportingV3_3::UserRole::Representation
          command.request_object = user_role_object
          command.response_representation = Google::Apis::DfareportingV3_3::UserRole::Representation
          command.response_class = Google::Apis::DfareportingV3_3::UserRole
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing user role.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Google::Apis::DfareportingV3_3::UserRole] user_role_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::UserRole] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::UserRole]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_user_role(profile_id, user_role_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'userprofiles/{profileId}/userRoles', options)
          command.request_representation = Google::Apis::DfareportingV3_3::UserRole::Representation
          command.request_object = user_role_object
          command.response_representation = Google::Apis::DfareportingV3_3::UserRole::Representation
          command.response_class = Google::Apis::DfareportingV3_3::UserRole
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one video format by ID.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [Fixnum] id
        #   Video format ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::VideoFormat] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::VideoFormat]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_video_format(profile_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/videoFormats/{id}', options)
          command.response_representation = Google::Apis::DfareportingV3_3::VideoFormat::Representation
          command.response_class = Google::Apis::DfareportingV3_3::VideoFormat
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists available video formats.
        # @param [Fixnum] profile_id
        #   User profile ID associated with this request.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DfareportingV3_3::VideoFormatsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DfareportingV3_3::VideoFormatsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_video_formats(profile_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'userprofiles/{profileId}/videoFormats', options)
          command.response_representation = Google::Apis::DfareportingV3_3::VideoFormatsListResponse::Representation
          command.response_class = Google::Apis::DfareportingV3_3::VideoFormatsListResponse
          command.params['profileId'] = profile_id unless profile_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end

        protected

        def apply_command_defaults(command)
          command.query['key'] = key unless key.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
        end
      end
    end
  end
end
