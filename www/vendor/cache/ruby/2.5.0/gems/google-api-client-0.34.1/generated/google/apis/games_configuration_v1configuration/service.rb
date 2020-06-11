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
    module GamesConfigurationV1configuration
      # Google Play Game Services Publishing API
      #
      # The Publishing API for Google Play Game Services.
      #
      # @example
      #    require 'google/apis/games_configuration_v1configuration'
      #
      #    GamesConfiguration = Google::Apis::GamesConfigurationV1configuration # Alias the module
      #    service = GamesConfiguration::GamesConfigurationService.new
      #
      # @see https://developers.google.com/games/services
      class GamesConfigurationService < Google::Apis::Core::BaseService
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
          super('https://www.googleapis.com/', 'games/v1configuration/')
          @batch_path = 'batch/gamesConfiguration/v1configuration'
        end
        
        # Delete the achievement configuration with the given ID.
        # @param [String] achievement_id
        #   The ID of the achievement used by this method.
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
        def delete_achievement_configuration(achievement_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'achievements/{achievementId}', options)
          command.params['achievementId'] = achievement_id unless achievement_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the metadata of the achievement configuration with the given ID.
        # @param [String] achievement_id
        #   The ID of the achievement used by this method.
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
        # @yieldparam result [Google::Apis::GamesConfigurationV1configuration::AchievementConfiguration] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesConfigurationV1configuration::AchievementConfiguration]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_achievement_configuration(achievement_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'achievements/{achievementId}', options)
          command.response_representation = Google::Apis::GamesConfigurationV1configuration::AchievementConfiguration::Representation
          command.response_class = Google::Apis::GamesConfigurationV1configuration::AchievementConfiguration
          command.params['achievementId'] = achievement_id unless achievement_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Insert a new achievement configuration in this application.
        # @param [String] application_id
        #   The application ID from the Google Play developer console.
        # @param [Google::Apis::GamesConfigurationV1configuration::AchievementConfiguration] achievement_configuration_object
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
        # @yieldparam result [Google::Apis::GamesConfigurationV1configuration::AchievementConfiguration] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesConfigurationV1configuration::AchievementConfiguration]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_achievement_configuration(application_id, achievement_configuration_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'applications/{applicationId}/achievements', options)
          command.request_representation = Google::Apis::GamesConfigurationV1configuration::AchievementConfiguration::Representation
          command.request_object = achievement_configuration_object
          command.response_representation = Google::Apis::GamesConfigurationV1configuration::AchievementConfiguration::Representation
          command.response_class = Google::Apis::GamesConfigurationV1configuration::AchievementConfiguration
          command.params['applicationId'] = application_id unless application_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of the achievement configurations in this application.
        # @param [String] application_id
        #   The application ID from the Google Play developer console.
        # @param [Fixnum] max_results
        #   The maximum number of resource configurations to return in the response, used
        #   for paging. For any response, the actual number of resources returned may be
        #   less than the specified maxResults.
        # @param [String] page_token
        #   The token returned by the previous request.
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
        # @yieldparam result [Google::Apis::GamesConfigurationV1configuration::ListAchievementConfigurationResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesConfigurationV1configuration::ListAchievementConfigurationResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_achievement_configurations(application_id, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'applications/{applicationId}/achievements', options)
          command.response_representation = Google::Apis::GamesConfigurationV1configuration::ListAchievementConfigurationResponse::Representation
          command.response_class = Google::Apis::GamesConfigurationV1configuration::ListAchievementConfigurationResponse
          command.params['applicationId'] = application_id unless application_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update the metadata of the achievement configuration with the given ID. This
        # method supports patch semantics.
        # @param [String] achievement_id
        #   The ID of the achievement used by this method.
        # @param [Google::Apis::GamesConfigurationV1configuration::AchievementConfiguration] achievement_configuration_object
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
        # @yieldparam result [Google::Apis::GamesConfigurationV1configuration::AchievementConfiguration] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesConfigurationV1configuration::AchievementConfiguration]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_achievement_configuration(achievement_id, achievement_configuration_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'achievements/{achievementId}', options)
          command.request_representation = Google::Apis::GamesConfigurationV1configuration::AchievementConfiguration::Representation
          command.request_object = achievement_configuration_object
          command.response_representation = Google::Apis::GamesConfigurationV1configuration::AchievementConfiguration::Representation
          command.response_class = Google::Apis::GamesConfigurationV1configuration::AchievementConfiguration
          command.params['achievementId'] = achievement_id unless achievement_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update the metadata of the achievement configuration with the given ID.
        # @param [String] achievement_id
        #   The ID of the achievement used by this method.
        # @param [Google::Apis::GamesConfigurationV1configuration::AchievementConfiguration] achievement_configuration_object
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
        # @yieldparam result [Google::Apis::GamesConfigurationV1configuration::AchievementConfiguration] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesConfigurationV1configuration::AchievementConfiguration]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_achievement_configuration(achievement_id, achievement_configuration_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'achievements/{achievementId}', options)
          command.request_representation = Google::Apis::GamesConfigurationV1configuration::AchievementConfiguration::Representation
          command.request_object = achievement_configuration_object
          command.response_representation = Google::Apis::GamesConfigurationV1configuration::AchievementConfiguration::Representation
          command.response_class = Google::Apis::GamesConfigurationV1configuration::AchievementConfiguration
          command.params['achievementId'] = achievement_id unless achievement_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Uploads an image for a resource with the given ID and image type.
        # @param [String] resource_id
        #   The ID of the resource used by this method.
        # @param [String] image_type
        #   Selects which image in a resource for this method.
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
        # @yieldparam result [Google::Apis::GamesConfigurationV1configuration::ImageConfiguration] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesConfigurationV1configuration::ImageConfiguration]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def upload_image_configuration(resource_id, image_type, fields: nil, quota_user: nil, user_ip: nil, upload_source: nil, content_type: nil, options: nil, &block)
          if upload_source.nil?
            command = make_simple_command(:post, 'images/{resourceId}/imageType/{imageType}', options)
          else
            command = make_upload_command(:post, 'images/{resourceId}/imageType/{imageType}', options)
            command.upload_source = upload_source
            command.upload_content_type = content_type
          end
          command.response_representation = Google::Apis::GamesConfigurationV1configuration::ImageConfiguration::Representation
          command.response_class = Google::Apis::GamesConfigurationV1configuration::ImageConfiguration
          command.params['resourceId'] = resource_id unless resource_id.nil?
          command.params['imageType'] = image_type unless image_type.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Delete the leaderboard configuration with the given ID.
        # @param [String] leaderboard_id
        #   The ID of the leaderboard.
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
        def delete_leaderboard_configuration(leaderboard_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'leaderboards/{leaderboardId}', options)
          command.params['leaderboardId'] = leaderboard_id unless leaderboard_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the metadata of the leaderboard configuration with the given ID.
        # @param [String] leaderboard_id
        #   The ID of the leaderboard.
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
        # @yieldparam result [Google::Apis::GamesConfigurationV1configuration::LeaderboardConfiguration] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesConfigurationV1configuration::LeaderboardConfiguration]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_leaderboard_configuration(leaderboard_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'leaderboards/{leaderboardId}', options)
          command.response_representation = Google::Apis::GamesConfigurationV1configuration::LeaderboardConfiguration::Representation
          command.response_class = Google::Apis::GamesConfigurationV1configuration::LeaderboardConfiguration
          command.params['leaderboardId'] = leaderboard_id unless leaderboard_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Insert a new leaderboard configuration in this application.
        # @param [String] application_id
        #   The application ID from the Google Play developer console.
        # @param [Google::Apis::GamesConfigurationV1configuration::LeaderboardConfiguration] leaderboard_configuration_object
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
        # @yieldparam result [Google::Apis::GamesConfigurationV1configuration::LeaderboardConfiguration] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesConfigurationV1configuration::LeaderboardConfiguration]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_leaderboard_configuration(application_id, leaderboard_configuration_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'applications/{applicationId}/leaderboards', options)
          command.request_representation = Google::Apis::GamesConfigurationV1configuration::LeaderboardConfiguration::Representation
          command.request_object = leaderboard_configuration_object
          command.response_representation = Google::Apis::GamesConfigurationV1configuration::LeaderboardConfiguration::Representation
          command.response_class = Google::Apis::GamesConfigurationV1configuration::LeaderboardConfiguration
          command.params['applicationId'] = application_id unless application_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of the leaderboard configurations in this application.
        # @param [String] application_id
        #   The application ID from the Google Play developer console.
        # @param [Fixnum] max_results
        #   The maximum number of resource configurations to return in the response, used
        #   for paging. For any response, the actual number of resources returned may be
        #   less than the specified maxResults.
        # @param [String] page_token
        #   The token returned by the previous request.
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
        # @yieldparam result [Google::Apis::GamesConfigurationV1configuration::ListLeaderboardConfigurationResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesConfigurationV1configuration::ListLeaderboardConfigurationResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_leaderboard_configurations(application_id, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'applications/{applicationId}/leaderboards', options)
          command.response_representation = Google::Apis::GamesConfigurationV1configuration::ListLeaderboardConfigurationResponse::Representation
          command.response_class = Google::Apis::GamesConfigurationV1configuration::ListLeaderboardConfigurationResponse
          command.params['applicationId'] = application_id unless application_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update the metadata of the leaderboard configuration with the given ID. This
        # method supports patch semantics.
        # @param [String] leaderboard_id
        #   The ID of the leaderboard.
        # @param [Google::Apis::GamesConfigurationV1configuration::LeaderboardConfiguration] leaderboard_configuration_object
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
        # @yieldparam result [Google::Apis::GamesConfigurationV1configuration::LeaderboardConfiguration] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesConfigurationV1configuration::LeaderboardConfiguration]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_leaderboard_configuration(leaderboard_id, leaderboard_configuration_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'leaderboards/{leaderboardId}', options)
          command.request_representation = Google::Apis::GamesConfigurationV1configuration::LeaderboardConfiguration::Representation
          command.request_object = leaderboard_configuration_object
          command.response_representation = Google::Apis::GamesConfigurationV1configuration::LeaderboardConfiguration::Representation
          command.response_class = Google::Apis::GamesConfigurationV1configuration::LeaderboardConfiguration
          command.params['leaderboardId'] = leaderboard_id unless leaderboard_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update the metadata of the leaderboard configuration with the given ID.
        # @param [String] leaderboard_id
        #   The ID of the leaderboard.
        # @param [Google::Apis::GamesConfigurationV1configuration::LeaderboardConfiguration] leaderboard_configuration_object
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
        # @yieldparam result [Google::Apis::GamesConfigurationV1configuration::LeaderboardConfiguration] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesConfigurationV1configuration::LeaderboardConfiguration]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_leaderboard_configuration(leaderboard_id, leaderboard_configuration_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'leaderboards/{leaderboardId}', options)
          command.request_representation = Google::Apis::GamesConfigurationV1configuration::LeaderboardConfiguration::Representation
          command.request_object = leaderboard_configuration_object
          command.response_representation = Google::Apis::GamesConfigurationV1configuration::LeaderboardConfiguration::Representation
          command.response_class = Google::Apis::GamesConfigurationV1configuration::LeaderboardConfiguration
          command.params['leaderboardId'] = leaderboard_id unless leaderboard_id.nil?
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
