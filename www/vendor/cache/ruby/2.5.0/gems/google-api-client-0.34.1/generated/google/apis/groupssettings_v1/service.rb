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
    module GroupssettingsV1
      # Groups Settings API
      #
      # Manages permission levels and related settings of a group.
      #
      # @example
      #    require 'google/apis/groupssettings_v1'
      #
      #    Groupssettings = Google::Apis::GroupssettingsV1 # Alias the module
      #    service = Groupssettings::GroupssettingsService.new
      #
      # @see https://developers.google.com/google-apps/groups-settings/get_started
      class GroupssettingsService < Google::Apis::Core::BaseService
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
          super('https://www.googleapis.com/', 'groups/v1/groups/')
          @batch_path = 'batch/groupssettings/v1'
        end
        
        # Gets one resource by id.
        # @param [String] group_unique_id
        #   The group's email address.
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
        # @yieldparam result [Google::Apis::GroupssettingsV1::Groups] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GroupssettingsV1::Groups]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_group(group_unique_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{groupUniqueId}', options)
          command.query['alt'] = 'json'
          command.response_representation = Google::Apis::GroupssettingsV1::Groups::Representation
          command.response_class = Google::Apis::GroupssettingsV1::Groups
          command.params['groupUniqueId'] = group_unique_id unless group_unique_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing resource. This method supports patch semantics.
        # @param [String] group_unique_id
        #   The group's email address.
        # @param [Google::Apis::GroupssettingsV1::Groups] groups_object
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
        # @yieldparam result [Google::Apis::GroupssettingsV1::Groups] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GroupssettingsV1::Groups]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_group(group_unique_id, groups_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, '{groupUniqueId}', options)
          command.request_representation = Google::Apis::GroupssettingsV1::Groups::Representation
          command.request_object = groups_object
          command.query['alt'] = 'json'
          command.response_representation = Google::Apis::GroupssettingsV1::Groups::Representation
          command.response_class = Google::Apis::GroupssettingsV1::Groups
          command.params['groupUniqueId'] = group_unique_id unless group_unique_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing resource.
        # @param [String] group_unique_id
        #   The group's email address.
        # @param [Google::Apis::GroupssettingsV1::Groups] groups_object
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
        # @yieldparam result [Google::Apis::GroupssettingsV1::Groups] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GroupssettingsV1::Groups]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_group(group_unique_id, groups_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, '{groupUniqueId}', options)
          command.request_representation = Google::Apis::GroupssettingsV1::Groups::Representation
          command.request_object = groups_object
          command.query['alt'] = 'json'
          command.response_representation = Google::Apis::GroupssettingsV1::Groups::Representation
          command.response_class = Google::Apis::GroupssettingsV1::Groups
          command.params['groupUniqueId'] = group_unique_id unless group_unique_id.nil?
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
