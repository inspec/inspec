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
    module CalendarV3
      # Calendar API
      #
      # Manipulates events and other calendar data.
      #
      # @example
      #    require 'google/apis/calendar_v3'
      #
      #    Calendar = Google::Apis::CalendarV3 # Alias the module
      #    service = Calendar::CalendarService.new
      #
      # @see https://developers.google.com/google-apps/calendar/firstapp
      class CalendarService < Google::Apis::Core::BaseService
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
          super('https://www.googleapis.com/', 'calendar/v3/')
          @batch_path = 'batch/calendar/v3'
        end
        
        # Deletes an access control rule.
        # @param [String] calendar_id
        #   Calendar identifier. To retrieve calendar IDs call the calendarList.list
        #   method. If you want to access the primary calendar of the currently logged in
        #   user, use the "primary" keyword.
        # @param [String] rule_id
        #   ACL rule identifier.
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
        def delete_acl(calendar_id, rule_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'calendars/{calendarId}/acl/{ruleId}', options)
          command.params['calendarId'] = calendar_id unless calendar_id.nil?
          command.params['ruleId'] = rule_id unless rule_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns an access control rule.
        # @param [String] calendar_id
        #   Calendar identifier. To retrieve calendar IDs call the calendarList.list
        #   method. If you want to access the primary calendar of the currently logged in
        #   user, use the "primary" keyword.
        # @param [String] rule_id
        #   ACL rule identifier.
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
        # @yieldparam result [Google::Apis::CalendarV3::AclRule] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CalendarV3::AclRule]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_acl(calendar_id, rule_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'calendars/{calendarId}/acl/{ruleId}', options)
          command.response_representation = Google::Apis::CalendarV3::AclRule::Representation
          command.response_class = Google::Apis::CalendarV3::AclRule
          command.params['calendarId'] = calendar_id unless calendar_id.nil?
          command.params['ruleId'] = rule_id unless rule_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates an access control rule.
        # @param [String] calendar_id
        #   Calendar identifier. To retrieve calendar IDs call the calendarList.list
        #   method. If you want to access the primary calendar of the currently logged in
        #   user, use the "primary" keyword.
        # @param [Google::Apis::CalendarV3::AclRule] acl_rule_object
        # @param [Boolean] send_notifications
        #   Whether to send notifications about the calendar sharing change. Optional. The
        #   default is True.
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
        # @yieldparam result [Google::Apis::CalendarV3::AclRule] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CalendarV3::AclRule]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_acl(calendar_id, acl_rule_object = nil, send_notifications: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'calendars/{calendarId}/acl', options)
          command.request_representation = Google::Apis::CalendarV3::AclRule::Representation
          command.request_object = acl_rule_object
          command.response_representation = Google::Apis::CalendarV3::AclRule::Representation
          command.response_class = Google::Apis::CalendarV3::AclRule
          command.params['calendarId'] = calendar_id unless calendar_id.nil?
          command.query['sendNotifications'] = send_notifications unless send_notifications.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the rules in the access control list for the calendar.
        # @param [String] calendar_id
        #   Calendar identifier. To retrieve calendar IDs call the calendarList.list
        #   method. If you want to access the primary calendar of the currently logged in
        #   user, use the "primary" keyword.
        # @param [Fixnum] max_results
        #   Maximum number of entries returned on one result page. By default the value is
        #   100 entries. The page size can never be larger than 250 entries. Optional.
        # @param [String] page_token
        #   Token specifying which result page to return. Optional.
        # @param [Boolean] show_deleted
        #   Whether to include deleted ACLs in the result. Deleted ACLs are represented by
        #   role equal to "none". Deleted ACLs will always be included if syncToken is
        #   provided. Optional. The default is False.
        # @param [String] sync_token
        #   Token obtained from the nextSyncToken field returned on the last page of
        #   results from the previous list request. It makes the result of this list
        #   request contain only entries that have changed since then. All entries deleted
        #   since the previous list request will always be in the result set and it is not
        #   allowed to set showDeleted to False.
        #   If the syncToken expires, the server will respond with a 410 GONE response
        #   code and the client should clear its storage and perform a full
        #   synchronization without any syncToken.
        #   Learn more about incremental synchronization.
        #   Optional. The default is to return all entries.
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
        # @yieldparam result [Google::Apis::CalendarV3::Acl] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CalendarV3::Acl]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_acls(calendar_id, max_results: nil, page_token: nil, show_deleted: nil, sync_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'calendars/{calendarId}/acl', options)
          command.response_representation = Google::Apis::CalendarV3::Acl::Representation
          command.response_class = Google::Apis::CalendarV3::Acl
          command.params['calendarId'] = calendar_id unless calendar_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['showDeleted'] = show_deleted unless show_deleted.nil?
          command.query['syncToken'] = sync_token unless sync_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an access control rule. This method supports patch semantics.
        # @param [String] calendar_id
        #   Calendar identifier. To retrieve calendar IDs call the calendarList.list
        #   method. If you want to access the primary calendar of the currently logged in
        #   user, use the "primary" keyword.
        # @param [String] rule_id
        #   ACL rule identifier.
        # @param [Google::Apis::CalendarV3::AclRule] acl_rule_object
        # @param [Boolean] send_notifications
        #   Whether to send notifications about the calendar sharing change. Note that
        #   there are no notifications on access removal. Optional. The default is True.
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
        # @yieldparam result [Google::Apis::CalendarV3::AclRule] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CalendarV3::AclRule]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_acl(calendar_id, rule_id, acl_rule_object = nil, send_notifications: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'calendars/{calendarId}/acl/{ruleId}', options)
          command.request_representation = Google::Apis::CalendarV3::AclRule::Representation
          command.request_object = acl_rule_object
          command.response_representation = Google::Apis::CalendarV3::AclRule::Representation
          command.response_class = Google::Apis::CalendarV3::AclRule
          command.params['calendarId'] = calendar_id unless calendar_id.nil?
          command.params['ruleId'] = rule_id unless rule_id.nil?
          command.query['sendNotifications'] = send_notifications unless send_notifications.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an access control rule.
        # @param [String] calendar_id
        #   Calendar identifier. To retrieve calendar IDs call the calendarList.list
        #   method. If you want to access the primary calendar of the currently logged in
        #   user, use the "primary" keyword.
        # @param [String] rule_id
        #   ACL rule identifier.
        # @param [Google::Apis::CalendarV3::AclRule] acl_rule_object
        # @param [Boolean] send_notifications
        #   Whether to send notifications about the calendar sharing change. Note that
        #   there are no notifications on access removal. Optional. The default is True.
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
        # @yieldparam result [Google::Apis::CalendarV3::AclRule] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CalendarV3::AclRule]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_acl(calendar_id, rule_id, acl_rule_object = nil, send_notifications: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'calendars/{calendarId}/acl/{ruleId}', options)
          command.request_representation = Google::Apis::CalendarV3::AclRule::Representation
          command.request_object = acl_rule_object
          command.response_representation = Google::Apis::CalendarV3::AclRule::Representation
          command.response_class = Google::Apis::CalendarV3::AclRule
          command.params['calendarId'] = calendar_id unless calendar_id.nil?
          command.params['ruleId'] = rule_id unless rule_id.nil?
          command.query['sendNotifications'] = send_notifications unless send_notifications.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Watch for changes to ACL resources.
        # @param [String] calendar_id
        #   Calendar identifier. To retrieve calendar IDs call the calendarList.list
        #   method. If you want to access the primary calendar of the currently logged in
        #   user, use the "primary" keyword.
        # @param [Google::Apis::CalendarV3::Channel] channel_object
        # @param [Fixnum] max_results
        #   Maximum number of entries returned on one result page. By default the value is
        #   100 entries. The page size can never be larger than 250 entries. Optional.
        # @param [String] page_token
        #   Token specifying which result page to return. Optional.
        # @param [Boolean] show_deleted
        #   Whether to include deleted ACLs in the result. Deleted ACLs are represented by
        #   role equal to "none". Deleted ACLs will always be included if syncToken is
        #   provided. Optional. The default is False.
        # @param [String] sync_token
        #   Token obtained from the nextSyncToken field returned on the last page of
        #   results from the previous list request. It makes the result of this list
        #   request contain only entries that have changed since then. All entries deleted
        #   since the previous list request will always be in the result set and it is not
        #   allowed to set showDeleted to False.
        #   If the syncToken expires, the server will respond with a 410 GONE response
        #   code and the client should clear its storage and perform a full
        #   synchronization without any syncToken.
        #   Learn more about incremental synchronization.
        #   Optional. The default is to return all entries.
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
        # @yieldparam result [Google::Apis::CalendarV3::Channel] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CalendarV3::Channel]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def watch_acl(calendar_id, channel_object = nil, max_results: nil, page_token: nil, show_deleted: nil, sync_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'calendars/{calendarId}/acl/watch', options)
          command.request_representation = Google::Apis::CalendarV3::Channel::Representation
          command.request_object = channel_object
          command.response_representation = Google::Apis::CalendarV3::Channel::Representation
          command.response_class = Google::Apis::CalendarV3::Channel
          command.params['calendarId'] = calendar_id unless calendar_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['showDeleted'] = show_deleted unless show_deleted.nil?
          command.query['syncToken'] = sync_token unless sync_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Removes a calendar from the user's calendar list.
        # @param [String] calendar_id
        #   Calendar identifier. To retrieve calendar IDs call the calendarList.list
        #   method. If you want to access the primary calendar of the currently logged in
        #   user, use the "primary" keyword.
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
        def delete_calendar_list(calendar_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'users/me/calendarList/{calendarId}', options)
          command.params['calendarId'] = calendar_id unless calendar_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a calendar from the user's calendar list.
        # @param [String] calendar_id
        #   Calendar identifier. To retrieve calendar IDs call the calendarList.list
        #   method. If you want to access the primary calendar of the currently logged in
        #   user, use the "primary" keyword.
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
        # @yieldparam result [Google::Apis::CalendarV3::CalendarListEntry] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CalendarV3::CalendarListEntry]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_calendar_list(calendar_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'users/me/calendarList/{calendarId}', options)
          command.response_representation = Google::Apis::CalendarV3::CalendarListEntry::Representation
          command.response_class = Google::Apis::CalendarV3::CalendarListEntry
          command.params['calendarId'] = calendar_id unless calendar_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts an existing calendar into the user's calendar list.
        # @param [Google::Apis::CalendarV3::CalendarListEntry] calendar_list_entry_object
        # @param [Boolean] color_rgb_format
        #   Whether to use the foregroundColor and backgroundColor fields to write the
        #   calendar colors (RGB). If this feature is used, the index-based colorId field
        #   will be set to the best matching option automatically. Optional. The default
        #   is False.
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
        # @yieldparam result [Google::Apis::CalendarV3::CalendarListEntry] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CalendarV3::CalendarListEntry]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_calendar_list(calendar_list_entry_object = nil, color_rgb_format: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'users/me/calendarList', options)
          command.request_representation = Google::Apis::CalendarV3::CalendarListEntry::Representation
          command.request_object = calendar_list_entry_object
          command.response_representation = Google::Apis::CalendarV3::CalendarListEntry::Representation
          command.response_class = Google::Apis::CalendarV3::CalendarListEntry
          command.query['colorRgbFormat'] = color_rgb_format unless color_rgb_format.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the calendars on the user's calendar list.
        # @param [Fixnum] max_results
        #   Maximum number of entries returned on one result page. By default the value is
        #   100 entries. The page size can never be larger than 250 entries. Optional.
        # @param [String] min_access_role
        #   The minimum access role for the user in the returned entries. Optional. The
        #   default is no restriction.
        # @param [String] page_token
        #   Token specifying which result page to return. Optional.
        # @param [Boolean] show_deleted
        #   Whether to include deleted calendar list entries in the result. Optional. The
        #   default is False.
        # @param [Boolean] show_hidden
        #   Whether to show hidden entries. Optional. The default is False.
        # @param [String] sync_token
        #   Token obtained from the nextSyncToken field returned on the last page of
        #   results from the previous list request. It makes the result of this list
        #   request contain only entries that have changed since then. If only read-only
        #   fields such as calendar properties or ACLs have changed, the entry won't be
        #   returned. All entries deleted and hidden since the previous list request will
        #   always be in the result set and it is not allowed to set showDeleted neither
        #   showHidden to False.
        #   To ensure client state consistency minAccessRole query parameter cannot be
        #   specified together with nextSyncToken.
        #   If the syncToken expires, the server will respond with a 410 GONE response
        #   code and the client should clear its storage and perform a full
        #   synchronization without any syncToken.
        #   Learn more about incremental synchronization.
        #   Optional. The default is to return all entries.
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
        # @yieldparam result [Google::Apis::CalendarV3::CalendarList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CalendarV3::CalendarList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_calendar_lists(max_results: nil, min_access_role: nil, page_token: nil, show_deleted: nil, show_hidden: nil, sync_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'users/me/calendarList', options)
          command.response_representation = Google::Apis::CalendarV3::CalendarList::Representation
          command.response_class = Google::Apis::CalendarV3::CalendarList
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['minAccessRole'] = min_access_role unless min_access_role.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['showDeleted'] = show_deleted unless show_deleted.nil?
          command.query['showHidden'] = show_hidden unless show_hidden.nil?
          command.query['syncToken'] = sync_token unless sync_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing calendar on the user's calendar list. This method supports
        # patch semantics.
        # @param [String] calendar_id
        #   Calendar identifier. To retrieve calendar IDs call the calendarList.list
        #   method. If you want to access the primary calendar of the currently logged in
        #   user, use the "primary" keyword.
        # @param [Google::Apis::CalendarV3::CalendarListEntry] calendar_list_entry_object
        # @param [Boolean] color_rgb_format
        #   Whether to use the foregroundColor and backgroundColor fields to write the
        #   calendar colors (RGB). If this feature is used, the index-based colorId field
        #   will be set to the best matching option automatically. Optional. The default
        #   is False.
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
        # @yieldparam result [Google::Apis::CalendarV3::CalendarListEntry] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CalendarV3::CalendarListEntry]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_calendar_list(calendar_id, calendar_list_entry_object = nil, color_rgb_format: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'users/me/calendarList/{calendarId}', options)
          command.request_representation = Google::Apis::CalendarV3::CalendarListEntry::Representation
          command.request_object = calendar_list_entry_object
          command.response_representation = Google::Apis::CalendarV3::CalendarListEntry::Representation
          command.response_class = Google::Apis::CalendarV3::CalendarListEntry
          command.params['calendarId'] = calendar_id unless calendar_id.nil?
          command.query['colorRgbFormat'] = color_rgb_format unless color_rgb_format.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing calendar on the user's calendar list.
        # @param [String] calendar_id
        #   Calendar identifier. To retrieve calendar IDs call the calendarList.list
        #   method. If you want to access the primary calendar of the currently logged in
        #   user, use the "primary" keyword.
        # @param [Google::Apis::CalendarV3::CalendarListEntry] calendar_list_entry_object
        # @param [Boolean] color_rgb_format
        #   Whether to use the foregroundColor and backgroundColor fields to write the
        #   calendar colors (RGB). If this feature is used, the index-based colorId field
        #   will be set to the best matching option automatically. Optional. The default
        #   is False.
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
        # @yieldparam result [Google::Apis::CalendarV3::CalendarListEntry] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CalendarV3::CalendarListEntry]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_calendar_list(calendar_id, calendar_list_entry_object = nil, color_rgb_format: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'users/me/calendarList/{calendarId}', options)
          command.request_representation = Google::Apis::CalendarV3::CalendarListEntry::Representation
          command.request_object = calendar_list_entry_object
          command.response_representation = Google::Apis::CalendarV3::CalendarListEntry::Representation
          command.response_class = Google::Apis::CalendarV3::CalendarListEntry
          command.params['calendarId'] = calendar_id unless calendar_id.nil?
          command.query['colorRgbFormat'] = color_rgb_format unless color_rgb_format.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Watch for changes to CalendarList resources.
        # @param [Google::Apis::CalendarV3::Channel] channel_object
        # @param [Fixnum] max_results
        #   Maximum number of entries returned on one result page. By default the value is
        #   100 entries. The page size can never be larger than 250 entries. Optional.
        # @param [String] min_access_role
        #   The minimum access role for the user in the returned entries. Optional. The
        #   default is no restriction.
        # @param [String] page_token
        #   Token specifying which result page to return. Optional.
        # @param [Boolean] show_deleted
        #   Whether to include deleted calendar list entries in the result. Optional. The
        #   default is False.
        # @param [Boolean] show_hidden
        #   Whether to show hidden entries. Optional. The default is False.
        # @param [String] sync_token
        #   Token obtained from the nextSyncToken field returned on the last page of
        #   results from the previous list request. It makes the result of this list
        #   request contain only entries that have changed since then. If only read-only
        #   fields such as calendar properties or ACLs have changed, the entry won't be
        #   returned. All entries deleted and hidden since the previous list request will
        #   always be in the result set and it is not allowed to set showDeleted neither
        #   showHidden to False.
        #   To ensure client state consistency minAccessRole query parameter cannot be
        #   specified together with nextSyncToken.
        #   If the syncToken expires, the server will respond with a 410 GONE response
        #   code and the client should clear its storage and perform a full
        #   synchronization without any syncToken.
        #   Learn more about incremental synchronization.
        #   Optional. The default is to return all entries.
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
        # @yieldparam result [Google::Apis::CalendarV3::Channel] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CalendarV3::Channel]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def watch_calendar_list(channel_object = nil, max_results: nil, min_access_role: nil, page_token: nil, show_deleted: nil, show_hidden: nil, sync_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'users/me/calendarList/watch', options)
          command.request_representation = Google::Apis::CalendarV3::Channel::Representation
          command.request_object = channel_object
          command.response_representation = Google::Apis::CalendarV3::Channel::Representation
          command.response_class = Google::Apis::CalendarV3::Channel
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['minAccessRole'] = min_access_role unless min_access_role.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['showDeleted'] = show_deleted unless show_deleted.nil?
          command.query['showHidden'] = show_hidden unless show_hidden.nil?
          command.query['syncToken'] = sync_token unless sync_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Clears a primary calendar. This operation deletes all events associated with
        # the primary calendar of an account.
        # @param [String] calendar_id
        #   Calendar identifier. To retrieve calendar IDs call the calendarList.list
        #   method. If you want to access the primary calendar of the currently logged in
        #   user, use the "primary" keyword.
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
        def clear_calendar(calendar_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'calendars/{calendarId}/clear', options)
          command.params['calendarId'] = calendar_id unless calendar_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a secondary calendar. Use calendars.clear for clearing all events on
        # primary calendars.
        # @param [String] calendar_id
        #   Calendar identifier. To retrieve calendar IDs call the calendarList.list
        #   method. If you want to access the primary calendar of the currently logged in
        #   user, use the "primary" keyword.
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
        def delete_calendar(calendar_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'calendars/{calendarId}', options)
          command.params['calendarId'] = calendar_id unless calendar_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns metadata for a calendar.
        # @param [String] calendar_id
        #   Calendar identifier. To retrieve calendar IDs call the calendarList.list
        #   method. If you want to access the primary calendar of the currently logged in
        #   user, use the "primary" keyword.
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
        # @yieldparam result [Google::Apis::CalendarV3::Calendar] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CalendarV3::Calendar]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_calendar(calendar_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'calendars/{calendarId}', options)
          command.response_representation = Google::Apis::CalendarV3::Calendar::Representation
          command.response_class = Google::Apis::CalendarV3::Calendar
          command.params['calendarId'] = calendar_id unless calendar_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a secondary calendar.
        # @param [Google::Apis::CalendarV3::Calendar] calendar_object
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
        # @yieldparam result [Google::Apis::CalendarV3::Calendar] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CalendarV3::Calendar]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_calendar(calendar_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'calendars', options)
          command.request_representation = Google::Apis::CalendarV3::Calendar::Representation
          command.request_object = calendar_object
          command.response_representation = Google::Apis::CalendarV3::Calendar::Representation
          command.response_class = Google::Apis::CalendarV3::Calendar
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates metadata for a calendar. This method supports patch semantics.
        # @param [String] calendar_id
        #   Calendar identifier. To retrieve calendar IDs call the calendarList.list
        #   method. If you want to access the primary calendar of the currently logged in
        #   user, use the "primary" keyword.
        # @param [Google::Apis::CalendarV3::Calendar] calendar_object
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
        # @yieldparam result [Google::Apis::CalendarV3::Calendar] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CalendarV3::Calendar]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_calendar(calendar_id, calendar_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'calendars/{calendarId}', options)
          command.request_representation = Google::Apis::CalendarV3::Calendar::Representation
          command.request_object = calendar_object
          command.response_representation = Google::Apis::CalendarV3::Calendar::Representation
          command.response_class = Google::Apis::CalendarV3::Calendar
          command.params['calendarId'] = calendar_id unless calendar_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates metadata for a calendar.
        # @param [String] calendar_id
        #   Calendar identifier. To retrieve calendar IDs call the calendarList.list
        #   method. If you want to access the primary calendar of the currently logged in
        #   user, use the "primary" keyword.
        # @param [Google::Apis::CalendarV3::Calendar] calendar_object
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
        # @yieldparam result [Google::Apis::CalendarV3::Calendar] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CalendarV3::Calendar]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_calendar(calendar_id, calendar_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'calendars/{calendarId}', options)
          command.request_representation = Google::Apis::CalendarV3::Calendar::Representation
          command.request_object = calendar_object
          command.response_representation = Google::Apis::CalendarV3::Calendar::Representation
          command.response_class = Google::Apis::CalendarV3::Calendar
          command.params['calendarId'] = calendar_id unless calendar_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Stop watching resources through this channel
        # @param [Google::Apis::CalendarV3::Channel] channel_object
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
        def stop_channel(channel_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'channels/stop', options)
          command.request_representation = Google::Apis::CalendarV3::Channel::Representation
          command.request_object = channel_object
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the color definitions for calendars and events.
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
        # @yieldparam result [Google::Apis::CalendarV3::Colors] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CalendarV3::Colors]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_color(fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'colors', options)
          command.response_representation = Google::Apis::CalendarV3::Colors::Representation
          command.response_class = Google::Apis::CalendarV3::Colors
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes an event.
        # @param [String] calendar_id
        #   Calendar identifier. To retrieve calendar IDs call the calendarList.list
        #   method. If you want to access the primary calendar of the currently logged in
        #   user, use the "primary" keyword.
        # @param [String] event_id
        #   Event identifier.
        # @param [Boolean] send_notifications
        #   Deprecated. Please use sendUpdates instead.
        #   Whether to send notifications about the deletion of the event. Note that some
        #   emails might still be sent even if you set the value to false. The default is
        #   false.
        # @param [String] send_updates
        #   Guests who should receive notifications about the deletion of the event.
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
        def delete_event(calendar_id, event_id, send_notifications: nil, send_updates: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'calendars/{calendarId}/events/{eventId}', options)
          command.params['calendarId'] = calendar_id unless calendar_id.nil?
          command.params['eventId'] = event_id unless event_id.nil?
          command.query['sendNotifications'] = send_notifications unless send_notifications.nil?
          command.query['sendUpdates'] = send_updates unless send_updates.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns an event.
        # @param [String] calendar_id
        #   Calendar identifier. To retrieve calendar IDs call the calendarList.list
        #   method. If you want to access the primary calendar of the currently logged in
        #   user, use the "primary" keyword.
        # @param [String] event_id
        #   Event identifier.
        # @param [Boolean] always_include_email
        #   Whether to always include a value in the email field for the organizer,
        #   creator and attendees, even if no real email is available (i.e. a generated,
        #   non-working value will be provided). The use of this option is discouraged and
        #   should only be used by clients which cannot handle the absence of an email
        #   address value in the mentioned places. Optional. The default is False.
        # @param [Fixnum] max_attendees
        #   The maximum number of attendees to include in the response. If there are more
        #   than the specified number of attendees, only the participant is returned.
        #   Optional.
        # @param [String] time_zone
        #   Time zone used in the response. Optional. The default is the time zone of the
        #   calendar.
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
        # @yieldparam result [Google::Apis::CalendarV3::Event] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CalendarV3::Event]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_event(calendar_id, event_id, always_include_email: nil, max_attendees: nil, time_zone: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'calendars/{calendarId}/events/{eventId}', options)
          command.response_representation = Google::Apis::CalendarV3::Event::Representation
          command.response_class = Google::Apis::CalendarV3::Event
          command.params['calendarId'] = calendar_id unless calendar_id.nil?
          command.params['eventId'] = event_id unless event_id.nil?
          command.query['alwaysIncludeEmail'] = always_include_email unless always_include_email.nil?
          command.query['maxAttendees'] = max_attendees unless max_attendees.nil?
          command.query['timeZone'] = time_zone unless time_zone.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Imports an event. This operation is used to add a private copy of an existing
        # event to a calendar.
        # @param [String] calendar_id
        #   Calendar identifier. To retrieve calendar IDs call the calendarList.list
        #   method. If you want to access the primary calendar of the currently logged in
        #   user, use the "primary" keyword.
        # @param [Google::Apis::CalendarV3::Event] event_object
        # @param [Fixnum] conference_data_version
        #   Version number of conference data supported by the API client. Version 0
        #   assumes no conference data support and ignores conference data in the event's
        #   body. Version 1 enables support for copying of ConferenceData as well as for
        #   creating new conferences using the createRequest field of conferenceData. The
        #   default is 0.
        # @param [Boolean] supports_attachments
        #   Whether API client performing operation supports event attachments. Optional.
        #   The default is False.
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
        # @yieldparam result [Google::Apis::CalendarV3::Event] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CalendarV3::Event]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def import_event(calendar_id, event_object = nil, conference_data_version: nil, supports_attachments: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'calendars/{calendarId}/events/import', options)
          command.request_representation = Google::Apis::CalendarV3::Event::Representation
          command.request_object = event_object
          command.response_representation = Google::Apis::CalendarV3::Event::Representation
          command.response_class = Google::Apis::CalendarV3::Event
          command.params['calendarId'] = calendar_id unless calendar_id.nil?
          command.query['conferenceDataVersion'] = conference_data_version unless conference_data_version.nil?
          command.query['supportsAttachments'] = supports_attachments unless supports_attachments.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates an event.
        # @param [String] calendar_id
        #   Calendar identifier. To retrieve calendar IDs call the calendarList.list
        #   method. If you want to access the primary calendar of the currently logged in
        #   user, use the "primary" keyword.
        # @param [Google::Apis::CalendarV3::Event] event_object
        # @param [Fixnum] conference_data_version
        #   Version number of conference data supported by the API client. Version 0
        #   assumes no conference data support and ignores conference data in the event's
        #   body. Version 1 enables support for copying of ConferenceData as well as for
        #   creating new conferences using the createRequest field of conferenceData. The
        #   default is 0.
        # @param [Fixnum] max_attendees
        #   The maximum number of attendees to include in the response. If there are more
        #   than the specified number of attendees, only the participant is returned.
        #   Optional.
        # @param [Boolean] send_notifications
        #   Deprecated. Please use sendUpdates instead.
        #   Whether to send notifications about the creation of the new event. Note that
        #   some emails might still be sent even if you set the value to false. The
        #   default is false.
        # @param [String] send_updates
        #   Whether to send notifications about the creation of the new event. Note that
        #   some emails might still be sent. The default is false.
        # @param [Boolean] supports_attachments
        #   Whether API client performing operation supports event attachments. Optional.
        #   The default is False.
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
        # @yieldparam result [Google::Apis::CalendarV3::Event] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CalendarV3::Event]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_event(calendar_id, event_object = nil, conference_data_version: nil, max_attendees: nil, send_notifications: nil, send_updates: nil, supports_attachments: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'calendars/{calendarId}/events', options)
          command.request_representation = Google::Apis::CalendarV3::Event::Representation
          command.request_object = event_object
          command.response_representation = Google::Apis::CalendarV3::Event::Representation
          command.response_class = Google::Apis::CalendarV3::Event
          command.params['calendarId'] = calendar_id unless calendar_id.nil?
          command.query['conferenceDataVersion'] = conference_data_version unless conference_data_version.nil?
          command.query['maxAttendees'] = max_attendees unless max_attendees.nil?
          command.query['sendNotifications'] = send_notifications unless send_notifications.nil?
          command.query['sendUpdates'] = send_updates unless send_updates.nil?
          command.query['supportsAttachments'] = supports_attachments unless supports_attachments.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns instances of the specified recurring event.
        # @param [String] calendar_id
        #   Calendar identifier. To retrieve calendar IDs call the calendarList.list
        #   method. If you want to access the primary calendar of the currently logged in
        #   user, use the "primary" keyword.
        # @param [String] event_id
        #   Recurring event identifier.
        # @param [Boolean] always_include_email
        #   Whether to always include a value in the email field for the organizer,
        #   creator and attendees, even if no real email is available (i.e. a generated,
        #   non-working value will be provided). The use of this option is discouraged and
        #   should only be used by clients which cannot handle the absence of an email
        #   address value in the mentioned places. Optional. The default is False.
        # @param [Fixnum] max_attendees
        #   The maximum number of attendees to include in the response. If there are more
        #   than the specified number of attendees, only the participant is returned.
        #   Optional.
        # @param [Fixnum] max_results
        #   Maximum number of events returned on one result page. By default the value is
        #   250 events. The page size can never be larger than 2500 events. Optional.
        # @param [String] original_start
        #   The original start time of the instance in the result. Optional.
        # @param [String] page_token
        #   Token specifying which result page to return. Optional.
        # @param [Boolean] show_deleted
        #   Whether to include deleted events (with status equals "cancelled") in the
        #   result. Cancelled instances of recurring events will still be included if
        #   singleEvents is False. Optional. The default is False.
        # @param [DateTime] time_max
        #   Upper bound (exclusive) for an event's start time to filter by. Optional. The
        #   default is not to filter by start time. Must be an RFC3339 timestamp with
        #   mandatory time zone offset.
        # @param [DateTime] time_min
        #   Lower bound (inclusive) for an event's end time to filter by. Optional. The
        #   default is not to filter by end time. Must be an RFC3339 timestamp with
        #   mandatory time zone offset.
        # @param [String] time_zone
        #   Time zone used in the response. Optional. The default is the time zone of the
        #   calendar.
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
        # @yieldparam result [Google::Apis::CalendarV3::Events] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CalendarV3::Events]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_event_instances(calendar_id, event_id, always_include_email: nil, max_attendees: nil, max_results: nil, original_start: nil, page_token: nil, show_deleted: nil, time_max: nil, time_min: nil, time_zone: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'calendars/{calendarId}/events/{eventId}/instances', options)
          command.response_representation = Google::Apis::CalendarV3::Events::Representation
          command.response_class = Google::Apis::CalendarV3::Events
          command.params['calendarId'] = calendar_id unless calendar_id.nil?
          command.params['eventId'] = event_id unless event_id.nil?
          command.query['alwaysIncludeEmail'] = always_include_email unless always_include_email.nil?
          command.query['maxAttendees'] = max_attendees unless max_attendees.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['originalStart'] = original_start unless original_start.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['showDeleted'] = show_deleted unless show_deleted.nil?
          command.query['timeMax'] = time_max unless time_max.nil?
          command.query['timeMin'] = time_min unless time_min.nil?
          command.query['timeZone'] = time_zone unless time_zone.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns events on the specified calendar.
        # @param [String] calendar_id
        #   Calendar identifier. To retrieve calendar IDs call the calendarList.list
        #   method. If you want to access the primary calendar of the currently logged in
        #   user, use the "primary" keyword.
        # @param [Boolean] always_include_email
        #   Whether to always include a value in the email field for the organizer,
        #   creator and attendees, even if no real email is available (i.e. a generated,
        #   non-working value will be provided). The use of this option is discouraged and
        #   should only be used by clients which cannot handle the absence of an email
        #   address value in the mentioned places. Optional. The default is False.
        # @param [String] i_cal_uid
        #   Specifies event ID in the iCalendar format to be included in the response.
        #   Optional.
        # @param [Fixnum] max_attendees
        #   The maximum number of attendees to include in the response. If there are more
        #   than the specified number of attendees, only the participant is returned.
        #   Optional.
        # @param [Fixnum] max_results
        #   Maximum number of events returned on one result page. The number of events in
        #   the resulting page may be less than this value, or none at all, even if there
        #   are more events matching the query. Incomplete pages can be detected by a non-
        #   empty nextPageToken field in the response. By default the value is 250 events.
        #   The page size can never be larger than 2500 events. Optional.
        # @param [String] order_by
        #   The order of the events returned in the result. Optional. The default is an
        #   unspecified, stable order.
        # @param [String] page_token
        #   Token specifying which result page to return. Optional.
        # @param [Array<String>, String] private_extended_property
        #   Extended properties constraint specified as propertyName=value. Matches only
        #   private properties. This parameter might be repeated multiple times to return
        #   events that match all given constraints.
        # @param [String] q
        #   Free text search terms to find events that match these terms in any field,
        #   except for extended properties. Optional.
        # @param [Array<String>, String] shared_extended_property
        #   Extended properties constraint specified as propertyName=value. Matches only
        #   shared properties. This parameter might be repeated multiple times to return
        #   events that match all given constraints.
        # @param [Boolean] show_deleted
        #   Whether to include deleted events (with status equals "cancelled") in the
        #   result. Cancelled instances of recurring events (but not the underlying
        #   recurring event) will still be included if showDeleted and singleEvents are
        #   both False. If showDeleted and singleEvents are both True, only single
        #   instances of deleted events (but not the underlying recurring events) are
        #   returned. Optional. The default is False.
        # @param [Boolean] show_hidden_invitations
        #   Whether to include hidden invitations in the result. Optional. The default is
        #   False.
        # @param [Boolean] single_events
        #   Whether to expand recurring events into instances and only return single one-
        #   off events and instances of recurring events, but not the underlying recurring
        #   events themselves. Optional. The default is False.
        # @param [String] sync_token
        #   Token obtained from the nextSyncToken field returned on the last page of
        #   results from the previous list request. It makes the result of this list
        #   request contain only entries that have changed since then. All events deleted
        #   since the previous list request will always be in the result set and it is not
        #   allowed to set showDeleted to False.
        #   There are several query parameters that cannot be specified together with
        #   nextSyncToken to ensure consistency of the client state.
        #   These are:
        #   - iCalUID
        #   - orderBy
        #   - privateExtendedProperty
        #   - q
        #   - sharedExtendedProperty
        #   - timeMin
        #   - timeMax
        #   - updatedMin If the syncToken expires, the server will respond with a 410 GONE
        #   response code and the client should clear its storage and perform a full
        #   synchronization without any syncToken.
        #   Learn more about incremental synchronization.
        #   Optional. The default is to return all entries.
        # @param [DateTime] time_max
        #   Upper bound (exclusive) for an event's start time to filter by. Optional. The
        #   default is not to filter by start time. Must be an RFC3339 timestamp with
        #   mandatory time zone offset, for example, 2011-06-03T10:00:00-07:00, 2011-06-
        #   03T10:00:00Z. Milliseconds may be provided but are ignored. If timeMin is set,
        #   timeMax must be greater than timeMin.
        # @param [DateTime] time_min
        #   Lower bound (exclusive) for an event's end time to filter by. Optional. The
        #   default is not to filter by end time. Must be an RFC3339 timestamp with
        #   mandatory time zone offset, for example, 2011-06-03T10:00:00-07:00, 2011-06-
        #   03T10:00:00Z. Milliseconds may be provided but are ignored. If timeMax is set,
        #   timeMin must be smaller than timeMax.
        # @param [String] time_zone
        #   Time zone used in the response. Optional. The default is the time zone of the
        #   calendar.
        # @param [DateTime] updated_min
        #   Lower bound for an event's last modification time (as a RFC3339 timestamp) to
        #   filter by. When specified, entries deleted since this time will always be
        #   included regardless of showDeleted. Optional. The default is not to filter by
        #   last modification time.
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
        # @yieldparam result [Google::Apis::CalendarV3::Events] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CalendarV3::Events]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_events(calendar_id, always_include_email: nil, i_cal_uid: nil, max_attendees: nil, max_results: nil, order_by: nil, page_token: nil, private_extended_property: nil, q: nil, shared_extended_property: nil, show_deleted: nil, show_hidden_invitations: nil, single_events: nil, sync_token: nil, time_max: nil, time_min: nil, time_zone: nil, updated_min: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'calendars/{calendarId}/events', options)
          command.response_representation = Google::Apis::CalendarV3::Events::Representation
          command.response_class = Google::Apis::CalendarV3::Events
          command.params['calendarId'] = calendar_id unless calendar_id.nil?
          command.query['alwaysIncludeEmail'] = always_include_email unless always_include_email.nil?
          command.query['iCalUID'] = i_cal_uid unless i_cal_uid.nil?
          command.query['maxAttendees'] = max_attendees unless max_attendees.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['privateExtendedProperty'] = private_extended_property unless private_extended_property.nil?
          command.query['q'] = q unless q.nil?
          command.query['sharedExtendedProperty'] = shared_extended_property unless shared_extended_property.nil?
          command.query['showDeleted'] = show_deleted unless show_deleted.nil?
          command.query['showHiddenInvitations'] = show_hidden_invitations unless show_hidden_invitations.nil?
          command.query['singleEvents'] = single_events unless single_events.nil?
          command.query['syncToken'] = sync_token unless sync_token.nil?
          command.query['timeMax'] = time_max unless time_max.nil?
          command.query['timeMin'] = time_min unless time_min.nil?
          command.query['timeZone'] = time_zone unless time_zone.nil?
          command.query['updatedMin'] = updated_min unless updated_min.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Moves an event to another calendar, i.e. changes an event's organizer.
        # @param [String] calendar_id
        #   Calendar identifier of the source calendar where the event currently is on.
        # @param [String] event_id
        #   Event identifier.
        # @param [String] destination
        #   Calendar identifier of the target calendar where the event is to be moved to.
        # @param [Boolean] send_notifications
        #   Deprecated. Please use sendUpdates instead.
        #   Whether to send notifications about the change of the event's organizer. Note
        #   that some emails might still be sent even if you set the value to false. The
        #   default is false.
        # @param [String] send_updates
        #   Guests who should receive notifications about the change of the event's
        #   organizer.
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
        # @yieldparam result [Google::Apis::CalendarV3::Event] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CalendarV3::Event]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def move_event(calendar_id, event_id, destination, send_notifications: nil, send_updates: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'calendars/{calendarId}/events/{eventId}/move', options)
          command.response_representation = Google::Apis::CalendarV3::Event::Representation
          command.response_class = Google::Apis::CalendarV3::Event
          command.params['calendarId'] = calendar_id unless calendar_id.nil?
          command.params['eventId'] = event_id unless event_id.nil?
          command.query['destination'] = destination unless destination.nil?
          command.query['sendNotifications'] = send_notifications unless send_notifications.nil?
          command.query['sendUpdates'] = send_updates unless send_updates.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an event. This method supports patch semantics.
        # @param [String] calendar_id
        #   Calendar identifier. To retrieve calendar IDs call the calendarList.list
        #   method. If you want to access the primary calendar of the currently logged in
        #   user, use the "primary" keyword.
        # @param [String] event_id
        #   Event identifier.
        # @param [Google::Apis::CalendarV3::Event] event_object
        # @param [Boolean] always_include_email
        #   Whether to always include a value in the email field for the organizer,
        #   creator and attendees, even if no real email is available (i.e. a generated,
        #   non-working value will be provided). The use of this option is discouraged and
        #   should only be used by clients which cannot handle the absence of an email
        #   address value in the mentioned places. Optional. The default is False.
        # @param [Fixnum] conference_data_version
        #   Version number of conference data supported by the API client. Version 0
        #   assumes no conference data support and ignores conference data in the event's
        #   body. Version 1 enables support for copying of ConferenceData as well as for
        #   creating new conferences using the createRequest field of conferenceData. The
        #   default is 0.
        # @param [Fixnum] max_attendees
        #   The maximum number of attendees to include in the response. If there are more
        #   than the specified number of attendees, only the participant is returned.
        #   Optional.
        # @param [Boolean] send_notifications
        #   Deprecated. Please use sendUpdates instead.
        #   Whether to send notifications about the event update (for example, description
        #   changes, etc.). Note that some emails might still be sent even if you set the
        #   value to false. The default is false.
        # @param [String] send_updates
        #   Guests who should receive notifications about the event update (for example,
        #   title changes, etc.).
        # @param [Boolean] supports_attachments
        #   Whether API client performing operation supports event attachments. Optional.
        #   The default is False.
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
        # @yieldparam result [Google::Apis::CalendarV3::Event] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CalendarV3::Event]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_event(calendar_id, event_id, event_object = nil, always_include_email: nil, conference_data_version: nil, max_attendees: nil, send_notifications: nil, send_updates: nil, supports_attachments: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'calendars/{calendarId}/events/{eventId}', options)
          command.request_representation = Google::Apis::CalendarV3::Event::Representation
          command.request_object = event_object
          command.response_representation = Google::Apis::CalendarV3::Event::Representation
          command.response_class = Google::Apis::CalendarV3::Event
          command.params['calendarId'] = calendar_id unless calendar_id.nil?
          command.params['eventId'] = event_id unless event_id.nil?
          command.query['alwaysIncludeEmail'] = always_include_email unless always_include_email.nil?
          command.query['conferenceDataVersion'] = conference_data_version unless conference_data_version.nil?
          command.query['maxAttendees'] = max_attendees unless max_attendees.nil?
          command.query['sendNotifications'] = send_notifications unless send_notifications.nil?
          command.query['sendUpdates'] = send_updates unless send_updates.nil?
          command.query['supportsAttachments'] = supports_attachments unless supports_attachments.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates an event based on a simple text string.
        # @param [String] calendar_id
        #   Calendar identifier. To retrieve calendar IDs call the calendarList.list
        #   method. If you want to access the primary calendar of the currently logged in
        #   user, use the "primary" keyword.
        # @param [String] text
        #   The text describing the event to be created.
        # @param [Boolean] send_notifications
        #   Deprecated. Please use sendUpdates instead.
        #   Whether to send notifications about the creation of the event. Note that some
        #   emails might still be sent even if you set the value to false. The default is
        #   false.
        # @param [String] send_updates
        #   Guests who should receive notifications about the creation of the new event.
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
        # @yieldparam result [Google::Apis::CalendarV3::Event] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CalendarV3::Event]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def quick_add_event(calendar_id, text, send_notifications: nil, send_updates: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'calendars/{calendarId}/events/quickAdd', options)
          command.response_representation = Google::Apis::CalendarV3::Event::Representation
          command.response_class = Google::Apis::CalendarV3::Event
          command.params['calendarId'] = calendar_id unless calendar_id.nil?
          command.query['sendNotifications'] = send_notifications unless send_notifications.nil?
          command.query['sendUpdates'] = send_updates unless send_updates.nil?
          command.query['text'] = text unless text.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an event.
        # @param [String] calendar_id
        #   Calendar identifier. To retrieve calendar IDs call the calendarList.list
        #   method. If you want to access the primary calendar of the currently logged in
        #   user, use the "primary" keyword.
        # @param [String] event_id
        #   Event identifier.
        # @param [Google::Apis::CalendarV3::Event] event_object
        # @param [Boolean] always_include_email
        #   Whether to always include a value in the email field for the organizer,
        #   creator and attendees, even if no real email is available (i.e. a generated,
        #   non-working value will be provided). The use of this option is discouraged and
        #   should only be used by clients which cannot handle the absence of an email
        #   address value in the mentioned places. Optional. The default is False.
        # @param [Fixnum] conference_data_version
        #   Version number of conference data supported by the API client. Version 0
        #   assumes no conference data support and ignores conference data in the event's
        #   body. Version 1 enables support for copying of ConferenceData as well as for
        #   creating new conferences using the createRequest field of conferenceData. The
        #   default is 0.
        # @param [Fixnum] max_attendees
        #   The maximum number of attendees to include in the response. If there are more
        #   than the specified number of attendees, only the participant is returned.
        #   Optional.
        # @param [Boolean] send_notifications
        #   Deprecated. Please use sendUpdates instead.
        #   Whether to send notifications about the event update (for example, description
        #   changes, etc.). Note that some emails might still be sent even if you set the
        #   value to false. The default is false.
        # @param [String] send_updates
        #   Guests who should receive notifications about the event update (for example,
        #   title changes, etc.).
        # @param [Boolean] supports_attachments
        #   Whether API client performing operation supports event attachments. Optional.
        #   The default is False.
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
        # @yieldparam result [Google::Apis::CalendarV3::Event] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CalendarV3::Event]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_event(calendar_id, event_id, event_object = nil, always_include_email: nil, conference_data_version: nil, max_attendees: nil, send_notifications: nil, send_updates: nil, supports_attachments: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'calendars/{calendarId}/events/{eventId}', options)
          command.request_representation = Google::Apis::CalendarV3::Event::Representation
          command.request_object = event_object
          command.response_representation = Google::Apis::CalendarV3::Event::Representation
          command.response_class = Google::Apis::CalendarV3::Event
          command.params['calendarId'] = calendar_id unless calendar_id.nil?
          command.params['eventId'] = event_id unless event_id.nil?
          command.query['alwaysIncludeEmail'] = always_include_email unless always_include_email.nil?
          command.query['conferenceDataVersion'] = conference_data_version unless conference_data_version.nil?
          command.query['maxAttendees'] = max_attendees unless max_attendees.nil?
          command.query['sendNotifications'] = send_notifications unless send_notifications.nil?
          command.query['sendUpdates'] = send_updates unless send_updates.nil?
          command.query['supportsAttachments'] = supports_attachments unless supports_attachments.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Watch for changes to Events resources.
        # @param [String] calendar_id
        #   Calendar identifier. To retrieve calendar IDs call the calendarList.list
        #   method. If you want to access the primary calendar of the currently logged in
        #   user, use the "primary" keyword.
        # @param [Google::Apis::CalendarV3::Channel] channel_object
        # @param [Boolean] always_include_email
        #   Whether to always include a value in the email field for the organizer,
        #   creator and attendees, even if no real email is available (i.e. a generated,
        #   non-working value will be provided). The use of this option is discouraged and
        #   should only be used by clients which cannot handle the absence of an email
        #   address value in the mentioned places. Optional. The default is False.
        # @param [String] i_cal_uid
        #   Specifies event ID in the iCalendar format to be included in the response.
        #   Optional.
        # @param [Fixnum] max_attendees
        #   The maximum number of attendees to include in the response. If there are more
        #   than the specified number of attendees, only the participant is returned.
        #   Optional.
        # @param [Fixnum] max_results
        #   Maximum number of events returned on one result page. The number of events in
        #   the resulting page may be less than this value, or none at all, even if there
        #   are more events matching the query. Incomplete pages can be detected by a non-
        #   empty nextPageToken field in the response. By default the value is 250 events.
        #   The page size can never be larger than 2500 events. Optional.
        # @param [String] order_by
        #   The order of the events returned in the result. Optional. The default is an
        #   unspecified, stable order.
        # @param [String] page_token
        #   Token specifying which result page to return. Optional.
        # @param [Array<String>, String] private_extended_property
        #   Extended properties constraint specified as propertyName=value. Matches only
        #   private properties. This parameter might be repeated multiple times to return
        #   events that match all given constraints.
        # @param [String] q
        #   Free text search terms to find events that match these terms in any field,
        #   except for extended properties. Optional.
        # @param [Array<String>, String] shared_extended_property
        #   Extended properties constraint specified as propertyName=value. Matches only
        #   shared properties. This parameter might be repeated multiple times to return
        #   events that match all given constraints.
        # @param [Boolean] show_deleted
        #   Whether to include deleted events (with status equals "cancelled") in the
        #   result. Cancelled instances of recurring events (but not the underlying
        #   recurring event) will still be included if showDeleted and singleEvents are
        #   both False. If showDeleted and singleEvents are both True, only single
        #   instances of deleted events (but not the underlying recurring events) are
        #   returned. Optional. The default is False.
        # @param [Boolean] show_hidden_invitations
        #   Whether to include hidden invitations in the result. Optional. The default is
        #   False.
        # @param [Boolean] single_events
        #   Whether to expand recurring events into instances and only return single one-
        #   off events and instances of recurring events, but not the underlying recurring
        #   events themselves. Optional. The default is False.
        # @param [String] sync_token
        #   Token obtained from the nextSyncToken field returned on the last page of
        #   results from the previous list request. It makes the result of this list
        #   request contain only entries that have changed since then. All events deleted
        #   since the previous list request will always be in the result set and it is not
        #   allowed to set showDeleted to False.
        #   There are several query parameters that cannot be specified together with
        #   nextSyncToken to ensure consistency of the client state.
        #   These are:
        #   - iCalUID
        #   - orderBy
        #   - privateExtendedProperty
        #   - q
        #   - sharedExtendedProperty
        #   - timeMin
        #   - timeMax
        #   - updatedMin If the syncToken expires, the server will respond with a 410 GONE
        #   response code and the client should clear its storage and perform a full
        #   synchronization without any syncToken.
        #   Learn more about incremental synchronization.
        #   Optional. The default is to return all entries.
        # @param [DateTime] time_max
        #   Upper bound (exclusive) for an event's start time to filter by. Optional. The
        #   default is not to filter by start time. Must be an RFC3339 timestamp with
        #   mandatory time zone offset, for example, 2011-06-03T10:00:00-07:00, 2011-06-
        #   03T10:00:00Z. Milliseconds may be provided but are ignored. If timeMin is set,
        #   timeMax must be greater than timeMin.
        # @param [DateTime] time_min
        #   Lower bound (exclusive) for an event's end time to filter by. Optional. The
        #   default is not to filter by end time. Must be an RFC3339 timestamp with
        #   mandatory time zone offset, for example, 2011-06-03T10:00:00-07:00, 2011-06-
        #   03T10:00:00Z. Milliseconds may be provided but are ignored. If timeMax is set,
        #   timeMin must be smaller than timeMax.
        # @param [String] time_zone
        #   Time zone used in the response. Optional. The default is the time zone of the
        #   calendar.
        # @param [DateTime] updated_min
        #   Lower bound for an event's last modification time (as a RFC3339 timestamp) to
        #   filter by. When specified, entries deleted since this time will always be
        #   included regardless of showDeleted. Optional. The default is not to filter by
        #   last modification time.
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
        # @yieldparam result [Google::Apis::CalendarV3::Channel] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CalendarV3::Channel]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def watch_event(calendar_id, channel_object = nil, always_include_email: nil, i_cal_uid: nil, max_attendees: nil, max_results: nil, order_by: nil, page_token: nil, private_extended_property: nil, q: nil, shared_extended_property: nil, show_deleted: nil, show_hidden_invitations: nil, single_events: nil, sync_token: nil, time_max: nil, time_min: nil, time_zone: nil, updated_min: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'calendars/{calendarId}/events/watch', options)
          command.request_representation = Google::Apis::CalendarV3::Channel::Representation
          command.request_object = channel_object
          command.response_representation = Google::Apis::CalendarV3::Channel::Representation
          command.response_class = Google::Apis::CalendarV3::Channel
          command.params['calendarId'] = calendar_id unless calendar_id.nil?
          command.query['alwaysIncludeEmail'] = always_include_email unless always_include_email.nil?
          command.query['iCalUID'] = i_cal_uid unless i_cal_uid.nil?
          command.query['maxAttendees'] = max_attendees unless max_attendees.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['privateExtendedProperty'] = private_extended_property unless private_extended_property.nil?
          command.query['q'] = q unless q.nil?
          command.query['sharedExtendedProperty'] = shared_extended_property unless shared_extended_property.nil?
          command.query['showDeleted'] = show_deleted unless show_deleted.nil?
          command.query['showHiddenInvitations'] = show_hidden_invitations unless show_hidden_invitations.nil?
          command.query['singleEvents'] = single_events unless single_events.nil?
          command.query['syncToken'] = sync_token unless sync_token.nil?
          command.query['timeMax'] = time_max unless time_max.nil?
          command.query['timeMin'] = time_min unless time_min.nil?
          command.query['timeZone'] = time_zone unless time_zone.nil?
          command.query['updatedMin'] = updated_min unless updated_min.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns free/busy information for a set of calendars.
        # @param [Google::Apis::CalendarV3::FreeBusyRequest] free_busy_request_object
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
        # @yieldparam result [Google::Apis::CalendarV3::FreeBusyResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CalendarV3::FreeBusyResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def query_freebusy(free_busy_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'freeBusy', options)
          command.request_representation = Google::Apis::CalendarV3::FreeBusyRequest::Representation
          command.request_object = free_busy_request_object
          command.response_representation = Google::Apis::CalendarV3::FreeBusyResponse::Representation
          command.response_class = Google::Apis::CalendarV3::FreeBusyResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a single user setting.
        # @param [String] setting
        #   The id of the user setting.
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
        # @yieldparam result [Google::Apis::CalendarV3::Setting] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CalendarV3::Setting]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_setting(setting, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'users/me/settings/{setting}', options)
          command.response_representation = Google::Apis::CalendarV3::Setting::Representation
          command.response_class = Google::Apis::CalendarV3::Setting
          command.params['setting'] = setting unless setting.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns all user settings for the authenticated user.
        # @param [Fixnum] max_results
        #   Maximum number of entries returned on one result page. By default the value is
        #   100 entries. The page size can never be larger than 250 entries. Optional.
        # @param [String] page_token
        #   Token specifying which result page to return. Optional.
        # @param [String] sync_token
        #   Token obtained from the nextSyncToken field returned on the last page of
        #   results from the previous list request. It makes the result of this list
        #   request contain only entries that have changed since then.
        #   If the syncToken expires, the server will respond with a 410 GONE response
        #   code and the client should clear its storage and perform a full
        #   synchronization without any syncToken.
        #   Learn more about incremental synchronization.
        #   Optional. The default is to return all entries.
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
        # @yieldparam result [Google::Apis::CalendarV3::Settings] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CalendarV3::Settings]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_settings(max_results: nil, page_token: nil, sync_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'users/me/settings', options)
          command.response_representation = Google::Apis::CalendarV3::Settings::Representation
          command.response_class = Google::Apis::CalendarV3::Settings
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['syncToken'] = sync_token unless sync_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Watch for changes to Settings resources.
        # @param [Google::Apis::CalendarV3::Channel] channel_object
        # @param [Fixnum] max_results
        #   Maximum number of entries returned on one result page. By default the value is
        #   100 entries. The page size can never be larger than 250 entries. Optional.
        # @param [String] page_token
        #   Token specifying which result page to return. Optional.
        # @param [String] sync_token
        #   Token obtained from the nextSyncToken field returned on the last page of
        #   results from the previous list request. It makes the result of this list
        #   request contain only entries that have changed since then.
        #   If the syncToken expires, the server will respond with a 410 GONE response
        #   code and the client should clear its storage and perform a full
        #   synchronization without any syncToken.
        #   Learn more about incremental synchronization.
        #   Optional. The default is to return all entries.
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
        # @yieldparam result [Google::Apis::CalendarV3::Channel] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CalendarV3::Channel]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def watch_setting(channel_object = nil, max_results: nil, page_token: nil, sync_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'users/me/settings/watch', options)
          command.request_representation = Google::Apis::CalendarV3::Channel::Representation
          command.request_object = channel_object
          command.response_representation = Google::Apis::CalendarV3::Channel::Representation
          command.response_class = Google::Apis::CalendarV3::Channel
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['syncToken'] = sync_token unless sync_token.nil?
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
