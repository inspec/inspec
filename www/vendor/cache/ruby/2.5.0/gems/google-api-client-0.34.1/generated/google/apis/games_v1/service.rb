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
    module GamesV1
      # Google Play Game Services API
      #
      # The API for Google Play Game Services.
      #
      # @example
      #    require 'google/apis/games_v1'
      #
      #    Games = Google::Apis::GamesV1 # Alias the module
      #    service = Games::GamesService.new
      #
      # @see https://developers.google.com/games/services/
      class GamesService < Google::Apis::Core::BaseService
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
          super('https://www.googleapis.com/', 'games/v1/')
          @batch_path = 'batch/games/v1'
        end
        
        # Lists all the achievement definitions for your application.
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
        # @param [Fixnum] max_results
        #   The maximum number of achievement resources to return in the response, used
        #   for paging. For any response, the actual number of achievement resources
        #   returned may be less than the specified maxResults.
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
        # @yieldparam result [Google::Apis::GamesV1::ListAchievementDefinitionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::ListAchievementDefinitionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_achievement_definitions(language: nil, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'achievements', options)
          command.response_representation = Google::Apis::GamesV1::ListAchievementDefinitionsResponse::Representation
          command.response_class = Google::Apis::GamesV1::ListAchievementDefinitionsResponse
          command.query['language'] = language unless language.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Increments the steps of the achievement with the given ID for the currently
        # authenticated player.
        # @param [String] achievement_id
        #   The ID of the achievement used by this method.
        # @param [Fixnum] steps_to_increment
        #   The number of steps to increment.
        # @param [Fixnum] request_id
        #   A randomly generated numeric ID for each request specified by the caller. This
        #   number is used at the server to ensure that the request is handled correctly
        #   across retries.
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
        # @yieldparam result [Google::Apis::GamesV1::AchievementIncrementResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::AchievementIncrementResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def increment_achievement(achievement_id, steps_to_increment, request_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'achievements/{achievementId}/increment', options)
          command.response_representation = Google::Apis::GamesV1::AchievementIncrementResponse::Representation
          command.response_class = Google::Apis::GamesV1::AchievementIncrementResponse
          command.params['achievementId'] = achievement_id unless achievement_id.nil?
          command.query['requestId'] = request_id unless request_id.nil?
          command.query['stepsToIncrement'] = steps_to_increment unless steps_to_increment.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the progress for all your application's achievements for the currently
        # authenticated player.
        # @param [String] player_id
        #   A player ID. A value of me may be used in place of the authenticated player's
        #   ID.
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
        # @param [Fixnum] max_results
        #   The maximum number of achievement resources to return in the response, used
        #   for paging. For any response, the actual number of achievement resources
        #   returned may be less than the specified maxResults.
        # @param [String] page_token
        #   The token returned by the previous request.
        # @param [String] state
        #   Tells the server to return only achievements with the specified state. If this
        #   parameter isn't specified, all achievements are returned.
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
        # @yieldparam result [Google::Apis::GamesV1::ListPlayerAchievementResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::ListPlayerAchievementResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_achievements(player_id, language: nil, max_results: nil, page_token: nil, state: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'players/{playerId}/achievements', options)
          command.response_representation = Google::Apis::GamesV1::ListPlayerAchievementResponse::Representation
          command.response_class = Google::Apis::GamesV1::ListPlayerAchievementResponse
          command.params['playerId'] = player_id unless player_id.nil?
          command.query['language'] = language unless language.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['state'] = state unless state.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets the state of the achievement with the given ID to REVEALED for the
        # currently authenticated player.
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
        # @yieldparam result [Google::Apis::GamesV1::AchievementRevealResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::AchievementRevealResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def reveal_achievement(achievement_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'achievements/{achievementId}/reveal', options)
          command.response_representation = Google::Apis::GamesV1::AchievementRevealResponse::Representation
          command.response_class = Google::Apis::GamesV1::AchievementRevealResponse
          command.params['achievementId'] = achievement_id unless achievement_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets the steps for the currently authenticated player towards unlocking an
        # achievement. If the steps parameter is less than the current number of steps
        # that the player already gained for the achievement, the achievement is not
        # modified.
        # @param [String] achievement_id
        #   The ID of the achievement used by this method.
        # @param [Fixnum] steps
        #   The minimum value to set the steps to.
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
        # @yieldparam result [Google::Apis::GamesV1::AchievementSetStepsAtLeastResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::AchievementSetStepsAtLeastResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def set_achievement_steps_at_least(achievement_id, steps, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'achievements/{achievementId}/setStepsAtLeast', options)
          command.response_representation = Google::Apis::GamesV1::AchievementSetStepsAtLeastResponse::Representation
          command.response_class = Google::Apis::GamesV1::AchievementSetStepsAtLeastResponse
          command.params['achievementId'] = achievement_id unless achievement_id.nil?
          command.query['steps'] = steps unless steps.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Unlocks this achievement for the currently authenticated player.
        # @param [String] achievement_id
        #   The ID of the achievement used by this method.
        # @param [String] builtin_game_id
        #   Override used only by built-in games in Play Games application.
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
        # @yieldparam result [Google::Apis::GamesV1::AchievementUnlockResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::AchievementUnlockResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def unlock_achievement(achievement_id, builtin_game_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'achievements/{achievementId}/unlock', options)
          command.response_representation = Google::Apis::GamesV1::AchievementUnlockResponse::Representation
          command.response_class = Google::Apis::GamesV1::AchievementUnlockResponse
          command.params['achievementId'] = achievement_id unless achievement_id.nil?
          command.query['builtinGameId'] = builtin_game_id unless builtin_game_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates multiple achievements for the currently authenticated player.
        # @param [Google::Apis::GamesV1::AchievementUpdateMultipleRequest] achievement_update_multiple_request_object
        # @param [String] builtin_game_id
        #   Override used only by built-in games in Play Games application.
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
        # @yieldparam result [Google::Apis::GamesV1::AchievementUpdateMultipleResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::AchievementUpdateMultipleResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_multiple_achievements(achievement_update_multiple_request_object = nil, builtin_game_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'achievements/updateMultiple', options)
          command.request_representation = Google::Apis::GamesV1::AchievementUpdateMultipleRequest::Representation
          command.request_object = achievement_update_multiple_request_object
          command.response_representation = Google::Apis::GamesV1::AchievementUpdateMultipleResponse::Representation
          command.response_class = Google::Apis::GamesV1::AchievementUpdateMultipleResponse
          command.query['builtinGameId'] = builtin_game_id unless builtin_game_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the metadata of the application with the given ID. If the requested
        # application is not available for the specified platformType, the returned
        # response will not include any instance data.
        # @param [String] application_id
        #   The application ID from the Google Play developer console.
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
        # @param [String] platform_type
        #   Restrict application details returned to the specific platform.
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
        # @yieldparam result [Google::Apis::GamesV1::Application] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::Application]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_application(application_id, language: nil, platform_type: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'applications/{applicationId}', options)
          command.response_representation = Google::Apis::GamesV1::Application::Representation
          command.response_class = Google::Apis::GamesV1::Application
          command.params['applicationId'] = application_id unless application_id.nil?
          command.query['language'] = language unless language.nil?
          command.query['platformType'] = platform_type unless platform_type.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Indicate that the the currently authenticated user is playing your application.
        # @param [String] builtin_game_id
        #   Override used only by built-in games in Play Games application.
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
        def played_application(builtin_game_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'applications/played', options)
          command.query['builtinGameId'] = builtin_game_id unless builtin_game_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Verifies the auth token provided with this request is for the application with
        # the specified ID, and returns the ID of the player it was granted for.
        # @param [String] application_id
        #   The application ID from the Google Play developer console.
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
        # @yieldparam result [Google::Apis::GamesV1::ApplicationVerifyResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::ApplicationVerifyResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def verify_application(application_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'applications/{applicationId}/verify', options)
          command.response_representation = Google::Apis::GamesV1::ApplicationVerifyResponse::Representation
          command.response_class = Google::Apis::GamesV1::ApplicationVerifyResponse
          command.params['applicationId'] = application_id unless application_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list showing the current progress on events in this application for
        # the currently authenticated user.
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
        # @param [Fixnum] max_results
        #   The maximum number of events to return in the response, used for paging. For
        #   any response, the actual number of events to return may be less than the
        #   specified maxResults.
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
        # @yieldparam result [Google::Apis::GamesV1::ListPlayerEventResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::ListPlayerEventResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_event_by_player(language: nil, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'events', options)
          command.response_representation = Google::Apis::GamesV1::ListPlayerEventResponse::Representation
          command.response_class = Google::Apis::GamesV1::ListPlayerEventResponse
          command.query['language'] = language unless language.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of the event definitions in this application.
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
        # @param [Fixnum] max_results
        #   The maximum number of event definitions to return in the response, used for
        #   paging. For any response, the actual number of event definitions to return may
        #   be less than the specified maxResults.
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
        # @yieldparam result [Google::Apis::GamesV1::ListEventDefinitionResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::ListEventDefinitionResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_event_definitions(language: nil, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'eventDefinitions', options)
          command.response_representation = Google::Apis::GamesV1::ListEventDefinitionResponse::Representation
          command.response_class = Google::Apis::GamesV1::ListEventDefinitionResponse
          command.query['language'] = language unless language.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Records a batch of changes to the number of times events have occurred for the
        # currently authenticated user of this application.
        # @param [Google::Apis::GamesV1::EventRecordRequest] event_record_request_object
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
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
        # @yieldparam result [Google::Apis::GamesV1::UpdateEventResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::UpdateEventResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def record_event(event_record_request_object = nil, language: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'events', options)
          command.request_representation = Google::Apis::GamesV1::EventRecordRequest::Representation
          command.request_object = event_record_request_object
          command.response_representation = Google::Apis::GamesV1::UpdateEventResponse::Representation
          command.response_class = Google::Apis::GamesV1::UpdateEventResponse
          command.query['language'] = language unless language.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the metadata of the leaderboard with the given ID.
        # @param [String] leaderboard_id
        #   The ID of the leaderboard.
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
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
        # @yieldparam result [Google::Apis::GamesV1::Leaderboard] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::Leaderboard]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_leaderboard(leaderboard_id, language: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'leaderboards/{leaderboardId}', options)
          command.response_representation = Google::Apis::GamesV1::Leaderboard::Representation
          command.response_class = Google::Apis::GamesV1::Leaderboard
          command.params['leaderboardId'] = leaderboard_id unless leaderboard_id.nil?
          command.query['language'] = language unless language.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all the leaderboard metadata for your application.
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
        # @param [Fixnum] max_results
        #   The maximum number of leaderboards to return in the response. For any response,
        #   the actual number of leaderboards returned may be less than the specified
        #   maxResults.
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
        # @yieldparam result [Google::Apis::GamesV1::ListLeaderboardResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::ListLeaderboardResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_leaderboards(language: nil, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'leaderboards', options)
          command.response_representation = Google::Apis::GamesV1::ListLeaderboardResponse::Representation
          command.response_class = Google::Apis::GamesV1::ListLeaderboardResponse
          command.query['language'] = language unless language.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Return the metagame configuration data for the calling application.
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
        # @yieldparam result [Google::Apis::GamesV1::MetagameConfig] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::MetagameConfig]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_metagame_config(fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'metagameConfig', options)
          command.response_representation = Google::Apis::GamesV1::MetagameConfig::Representation
          command.response_class = Google::Apis::GamesV1::MetagameConfig
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List play data aggregated per category for the player corresponding to
        # playerId.
        # @param [String] player_id
        #   A player ID. A value of me may be used in place of the authenticated player's
        #   ID.
        # @param [String] collection
        #   The collection of categories for which data will be returned.
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
        # @param [Fixnum] max_results
        #   The maximum number of category resources to return in the response, used for
        #   paging. For any response, the actual number of category resources returned may
        #   be less than the specified maxResults.
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
        # @yieldparam result [Google::Apis::GamesV1::ListCategoryResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::ListCategoryResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_metagame_categories_by_player(player_id, collection, language: nil, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'players/{playerId}/categories/{collection}', options)
          command.response_representation = Google::Apis::GamesV1::ListCategoryResponse::Representation
          command.response_class = Google::Apis::GamesV1::ListCategoryResponse
          command.params['playerId'] = player_id unless player_id.nil?
          command.params['collection'] = collection unless collection.nil?
          command.query['language'] = language unless language.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the Player resource with the given ID. To retrieve the player for
        # the currently authenticated user, set playerId to me.
        # @param [String] player_id
        #   A player ID. A value of me may be used in place of the authenticated player's
        #   ID.
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
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
        # @yieldparam result [Google::Apis::GamesV1::Player] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::Player]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_player(player_id, language: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'players/{playerId}', options)
          command.response_representation = Google::Apis::GamesV1::Player::Representation
          command.response_class = Google::Apis::GamesV1::Player
          command.params['playerId'] = player_id unless player_id.nil?
          command.query['language'] = language unless language.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get the collection of players for the currently authenticated user.
        # @param [String] collection
        #   Collection of players being retrieved
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
        # @param [Fixnum] max_results
        #   The maximum number of player resources to return in the response, used for
        #   paging. For any response, the actual number of player resources returned may
        #   be less than the specified maxResults.
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
        # @yieldparam result [Google::Apis::GamesV1::ListPlayerResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::ListPlayerResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_players(collection, language: nil, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'players/me/players/{collection}', options)
          command.response_representation = Google::Apis::GamesV1::ListPlayerResponse::Representation
          command.response_class = Google::Apis::GamesV1::ListPlayerResponse
          command.params['collection'] = collection unless collection.nil?
          command.query['language'] = language unless language.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Removes a push token for the current user and application. Removing a non-
        # existent push token will report success.
        # @param [Google::Apis::GamesV1::PushTokenId] push_token_id_object
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
        def remove_pushtoken(push_token_id_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'pushtokens/remove', options)
          command.request_representation = Google::Apis::GamesV1::PushTokenId::Representation
          command.request_object = push_token_id_object
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Registers a push token for the current user and application.
        # @param [Google::Apis::GamesV1::PushToken] push_token_object
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
        def update_pushtoken(push_token_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'pushtokens', options)
          command.request_representation = Google::Apis::GamesV1::PushToken::Representation
          command.request_object = push_token_object
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Checks whether the games client is out of date.
        # @param [String] client_revision
        #   The revision of the client SDK used by your application. Format:
        #   [PLATFORM_TYPE]:[VERSION_NUMBER]. Possible values of PLATFORM_TYPE are:
        #   
        #   - "ANDROID" - Client is running the Android SDK.
        #   - "IOS" - Client is running the iOS SDK.
        #   - "WEB_APP" - Client is running as a Web App.
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
        # @yieldparam result [Google::Apis::GamesV1::CheckRevisionResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::CheckRevisionResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def check_revision(client_revision, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'revisions/check', options)
          command.response_representation = Google::Apis::GamesV1::CheckRevisionResponse::Representation
          command.response_class = Google::Apis::GamesV1::CheckRevisionResponse
          command.query['clientRevision'] = client_revision unless client_revision.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Create a room. For internal use by the Games SDK only. Calling this method
        # directly is unsupported.
        # @param [Google::Apis::GamesV1::CreateRoomRequest] create_room_request_object
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
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
        # @yieldparam result [Google::Apis::GamesV1::Room] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::Room]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_room(create_room_request_object = nil, language: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'rooms/create', options)
          command.request_representation = Google::Apis::GamesV1::CreateRoomRequest::Representation
          command.request_object = create_room_request_object
          command.response_representation = Google::Apis::GamesV1::Room::Representation
          command.response_class = Google::Apis::GamesV1::Room
          command.query['language'] = language unless language.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Decline an invitation to join a room. For internal use by the Games SDK only.
        # Calling this method directly is unsupported.
        # @param [String] room_id
        #   The ID of the room.
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
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
        # @yieldparam result [Google::Apis::GamesV1::Room] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::Room]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def decline_room(room_id, language: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'rooms/{roomId}/decline', options)
          command.response_representation = Google::Apis::GamesV1::Room::Representation
          command.response_class = Google::Apis::GamesV1::Room
          command.params['roomId'] = room_id unless room_id.nil?
          command.query['language'] = language unless language.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Dismiss an invitation to join a room. For internal use by the Games SDK only.
        # Calling this method directly is unsupported.
        # @param [String] room_id
        #   The ID of the room.
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
        def dismiss_room(room_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'rooms/{roomId}/dismiss', options)
          command.params['roomId'] = room_id unless room_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get the data for a room.
        # @param [String] room_id
        #   The ID of the room.
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
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
        # @yieldparam result [Google::Apis::GamesV1::Room] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::Room]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_room(room_id, language: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'rooms/{roomId}', options)
          command.response_representation = Google::Apis::GamesV1::Room::Representation
          command.response_class = Google::Apis::GamesV1::Room
          command.params['roomId'] = room_id unless room_id.nil?
          command.query['language'] = language unless language.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Join a room. For internal use by the Games SDK only. Calling this method
        # directly is unsupported.
        # @param [String] room_id
        #   The ID of the room.
        # @param [Google::Apis::GamesV1::JoinRoomRequest] join_room_request_object
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
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
        # @yieldparam result [Google::Apis::GamesV1::Room] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::Room]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def join_room(room_id, join_room_request_object = nil, language: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'rooms/{roomId}/join', options)
          command.request_representation = Google::Apis::GamesV1::JoinRoomRequest::Representation
          command.request_object = join_room_request_object
          command.response_representation = Google::Apis::GamesV1::Room::Representation
          command.response_class = Google::Apis::GamesV1::Room
          command.params['roomId'] = room_id unless room_id.nil?
          command.query['language'] = language unless language.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Leave a room. For internal use by the Games SDK only. Calling this method
        # directly is unsupported.
        # @param [String] room_id
        #   The ID of the room.
        # @param [Google::Apis::GamesV1::LeaveRoomRequest] leave_room_request_object
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
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
        # @yieldparam result [Google::Apis::GamesV1::Room] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::Room]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def leave_room(room_id, leave_room_request_object = nil, language: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'rooms/{roomId}/leave', options)
          command.request_representation = Google::Apis::GamesV1::LeaveRoomRequest::Representation
          command.request_object = leave_room_request_object
          command.response_representation = Google::Apis::GamesV1::Room::Representation
          command.response_class = Google::Apis::GamesV1::Room
          command.params['roomId'] = room_id unless room_id.nil?
          command.query['language'] = language unless language.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns invitations to join rooms.
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
        # @param [Fixnum] max_results
        #   The maximum number of rooms to return in the response, used for paging. For
        #   any response, the actual number of rooms to return may be less than the
        #   specified maxResults.
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
        # @yieldparam result [Google::Apis::GamesV1::RoomList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::RoomList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_rooms(language: nil, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'rooms', options)
          command.response_representation = Google::Apis::GamesV1::RoomList::Representation
          command.response_class = Google::Apis::GamesV1::RoomList
          command.query['language'] = language unless language.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates sent by a client reporting the status of peers in a room. For internal
        # use by the Games SDK only. Calling this method directly is unsupported.
        # @param [String] room_id
        #   The ID of the room.
        # @param [Google::Apis::GamesV1::RoomP2PStatuses] room_p2_p_statuses_object
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
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
        # @yieldparam result [Google::Apis::GamesV1::RoomStatus] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::RoomStatus]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def report_room_status(room_id, room_p2_p_statuses_object = nil, language: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'rooms/{roomId}/reportstatus', options)
          command.request_representation = Google::Apis::GamesV1::RoomP2PStatuses::Representation
          command.request_object = room_p2_p_statuses_object
          command.response_representation = Google::Apis::GamesV1::RoomStatus::Representation
          command.response_class = Google::Apis::GamesV1::RoomStatus
          command.params['roomId'] = room_id unless room_id.nil?
          command.query['language'] = language unless language.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get high scores, and optionally ranks, in leaderboards for the currently
        # authenticated player. For a specific time span, leaderboardId can be set to
        # ALL to retrieve data for all leaderboards in a given time span.
        # NOTE: You cannot ask for 'ALL' leaderboards and 'ALL' timeSpans in the same
        # request; only one parameter may be set to 'ALL'.
        # @param [String] player_id
        #   A player ID. A value of me may be used in place of the authenticated player's
        #   ID.
        # @param [String] leaderboard_id
        #   The ID of the leaderboard. Can be set to 'ALL' to retrieve data for all
        #   leaderboards for this application.
        # @param [String] time_span
        #   The time span for the scores and ranks you're requesting.
        # @param [String] include_rank_type
        #   The types of ranks to return. If the parameter is omitted, no ranks will be
        #   returned.
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
        # @param [Fixnum] max_results
        #   The maximum number of leaderboard scores to return in the response. For any
        #   response, the actual number of leaderboard scores returned may be less than
        #   the specified maxResults.
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
        # @yieldparam result [Google::Apis::GamesV1::ListPlayerLeaderboardScoreResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::ListPlayerLeaderboardScoreResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_score(player_id, leaderboard_id, time_span, include_rank_type: nil, language: nil, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'players/{playerId}/leaderboards/{leaderboardId}/scores/{timeSpan}', options)
          command.response_representation = Google::Apis::GamesV1::ListPlayerLeaderboardScoreResponse::Representation
          command.response_class = Google::Apis::GamesV1::ListPlayerLeaderboardScoreResponse
          command.params['playerId'] = player_id unless player_id.nil?
          command.params['leaderboardId'] = leaderboard_id unless leaderboard_id.nil?
          command.params['timeSpan'] = time_span unless time_span.nil?
          command.query['includeRankType'] = include_rank_type unless include_rank_type.nil?
          command.query['language'] = language unless language.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the scores in a leaderboard, starting from the top.
        # @param [String] leaderboard_id
        #   The ID of the leaderboard.
        # @param [String] collection
        #   The collection of scores you're requesting.
        # @param [String] time_span
        #   The time span for the scores and ranks you're requesting.
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
        # @param [Fixnum] max_results
        #   The maximum number of leaderboard scores to return in the response. For any
        #   response, the actual number of leaderboard scores returned may be less than
        #   the specified maxResults.
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
        # @yieldparam result [Google::Apis::GamesV1::LeaderboardScores] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::LeaderboardScores]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_scores(leaderboard_id, collection, time_span, language: nil, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'leaderboards/{leaderboardId}/scores/{collection}', options)
          command.response_representation = Google::Apis::GamesV1::LeaderboardScores::Representation
          command.response_class = Google::Apis::GamesV1::LeaderboardScores
          command.params['leaderboardId'] = leaderboard_id unless leaderboard_id.nil?
          command.params['collection'] = collection unless collection.nil?
          command.query['language'] = language unless language.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['timeSpan'] = time_span unless time_span.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the scores in a leaderboard around (and including) a player's score.
        # @param [String] leaderboard_id
        #   The ID of the leaderboard.
        # @param [String] collection
        #   The collection of scores you're requesting.
        # @param [String] time_span
        #   The time span for the scores and ranks you're requesting.
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
        # @param [Fixnum] max_results
        #   The maximum number of leaderboard scores to return in the response. For any
        #   response, the actual number of leaderboard scores returned may be less than
        #   the specified maxResults.
        # @param [String] page_token
        #   The token returned by the previous request.
        # @param [Fixnum] results_above
        #   The preferred number of scores to return above the player's score. More scores
        #   may be returned if the player is at the bottom of the leaderboard; fewer may
        #   be returned if the player is at the top. Must be less than or equal to
        #   maxResults.
        # @param [Boolean] return_top_if_absent
        #   True if the top scores should be returned when the player is not in the
        #   leaderboard. Defaults to true.
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
        # @yieldparam result [Google::Apis::GamesV1::LeaderboardScores] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::LeaderboardScores]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_score_window(leaderboard_id, collection, time_span, language: nil, max_results: nil, page_token: nil, results_above: nil, return_top_if_absent: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'leaderboards/{leaderboardId}/window/{collection}', options)
          command.response_representation = Google::Apis::GamesV1::LeaderboardScores::Representation
          command.response_class = Google::Apis::GamesV1::LeaderboardScores
          command.params['leaderboardId'] = leaderboard_id unless leaderboard_id.nil?
          command.params['collection'] = collection unless collection.nil?
          command.query['language'] = language unless language.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['resultsAbove'] = results_above unless results_above.nil?
          command.query['returnTopIfAbsent'] = return_top_if_absent unless return_top_if_absent.nil?
          command.query['timeSpan'] = time_span unless time_span.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Submits a score to the specified leaderboard.
        # @param [String] leaderboard_id
        #   The ID of the leaderboard.
        # @param [Fixnum] score
        #   The score you're submitting. The submitted score is ignored if it is worse
        #   than a previously submitted score, where worse depends on the leaderboard sort
        #   order. The meaning of the score value depends on the leaderboard format type.
        #   For fixed-point, the score represents the raw value. For time, the score
        #   represents elapsed time in milliseconds. For currency, the score represents a
        #   value in micro units.
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
        # @param [String] score_tag
        #   Additional information about the score you're submitting. Values must contain
        #   no more than 64 URI-safe characters as defined by section 2.3 of RFC 3986.
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
        # @yieldparam result [Google::Apis::GamesV1::PlayerScoreResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::PlayerScoreResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def submit_score(leaderboard_id, score, language: nil, score_tag: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'leaderboards/{leaderboardId}/scores', options)
          command.response_representation = Google::Apis::GamesV1::PlayerScoreResponse::Representation
          command.response_class = Google::Apis::GamesV1::PlayerScoreResponse
          command.params['leaderboardId'] = leaderboard_id unless leaderboard_id.nil?
          command.query['language'] = language unless language.nil?
          command.query['score'] = score unless score.nil?
          command.query['scoreTag'] = score_tag unless score_tag.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Submits multiple scores to leaderboards.
        # @param [Google::Apis::GamesV1::PlayerScoreSubmissionList] player_score_submission_list_object
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
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
        # @yieldparam result [Google::Apis::GamesV1::ListPlayerScoreResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::ListPlayerScoreResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def submit_score_multiple(player_score_submission_list_object = nil, language: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'leaderboards/scores', options)
          command.request_representation = Google::Apis::GamesV1::PlayerScoreSubmissionList::Representation
          command.request_object = player_score_submission_list_object
          command.response_representation = Google::Apis::GamesV1::ListPlayerScoreResponse::Representation
          command.response_class = Google::Apis::GamesV1::ListPlayerScoreResponse
          command.query['language'] = language unless language.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the metadata for a given snapshot ID.
        # @param [String] snapshot_id
        #   The ID of the snapshot.
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
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
        # @yieldparam result [Google::Apis::GamesV1::Snapshot] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::Snapshot]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_snapshot(snapshot_id, language: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'snapshots/{snapshotId}', options)
          command.response_representation = Google::Apis::GamesV1::Snapshot::Representation
          command.response_class = Google::Apis::GamesV1::Snapshot
          command.params['snapshotId'] = snapshot_id unless snapshot_id.nil?
          command.query['language'] = language unless language.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of snapshots created by your application for the player
        # corresponding to the player ID.
        # @param [String] player_id
        #   A player ID. A value of me may be used in place of the authenticated player's
        #   ID.
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
        # @param [Fixnum] max_results
        #   The maximum number of snapshot resources to return in the response, used for
        #   paging. For any response, the actual number of snapshot resources returned may
        #   be less than the specified maxResults.
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
        # @yieldparam result [Google::Apis::GamesV1::ListSnapshotResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::ListSnapshotResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_snapshots(player_id, language: nil, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'players/{playerId}/snapshots', options)
          command.response_representation = Google::Apis::GamesV1::ListSnapshotResponse::Representation
          command.response_class = Google::Apis::GamesV1::ListSnapshotResponse
          command.params['playerId'] = player_id unless player_id.nil?
          command.query['language'] = language unless language.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Cancel a turn-based match.
        # @param [String] match_id
        #   The ID of the match.
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
        def cancel_turn_based_match(match_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'turnbasedmatches/{matchId}/cancel', options)
          command.params['matchId'] = match_id unless match_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Create a turn-based match.
        # @param [Google::Apis::GamesV1::CreateTurnBasedMatchRequest] create_turn_based_match_request_object
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
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
        # @yieldparam result [Google::Apis::GamesV1::TurnBasedMatch] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::TurnBasedMatch]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_turn_based_match(create_turn_based_match_request_object = nil, language: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'turnbasedmatches/create', options)
          command.request_representation = Google::Apis::GamesV1::CreateTurnBasedMatchRequest::Representation
          command.request_object = create_turn_based_match_request_object
          command.response_representation = Google::Apis::GamesV1::TurnBasedMatch::Representation
          command.response_class = Google::Apis::GamesV1::TurnBasedMatch
          command.query['language'] = language unless language.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Decline an invitation to play a turn-based match.
        # @param [String] match_id
        #   The ID of the match.
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
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
        # @yieldparam result [Google::Apis::GamesV1::TurnBasedMatch] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::TurnBasedMatch]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def decline_turn_based_match(match_id, language: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'turnbasedmatches/{matchId}/decline', options)
          command.response_representation = Google::Apis::GamesV1::TurnBasedMatch::Representation
          command.response_class = Google::Apis::GamesV1::TurnBasedMatch
          command.params['matchId'] = match_id unless match_id.nil?
          command.query['language'] = language unless language.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Dismiss a turn-based match from the match list. The match will no longer show
        # up in the list and will not generate notifications.
        # @param [String] match_id
        #   The ID of the match.
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
        def dismiss_turn_based_match(match_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'turnbasedmatches/{matchId}/dismiss', options)
          command.params['matchId'] = match_id unless match_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Finish a turn-based match. Each player should make this call once, after all
        # results are in. Only the player whose turn it is may make the first call to
        # Finish, and can pass in the final match state.
        # @param [String] match_id
        #   The ID of the match.
        # @param [Google::Apis::GamesV1::TurnBasedMatchResults] turn_based_match_results_object
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
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
        # @yieldparam result [Google::Apis::GamesV1::TurnBasedMatch] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::TurnBasedMatch]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def finish_turn_based_match(match_id, turn_based_match_results_object = nil, language: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'turnbasedmatches/{matchId}/finish', options)
          command.request_representation = Google::Apis::GamesV1::TurnBasedMatchResults::Representation
          command.request_object = turn_based_match_results_object
          command.response_representation = Google::Apis::GamesV1::TurnBasedMatch::Representation
          command.response_class = Google::Apis::GamesV1::TurnBasedMatch
          command.params['matchId'] = match_id unless match_id.nil?
          command.query['language'] = language unless language.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get the data for a turn-based match.
        # @param [String] match_id
        #   The ID of the match.
        # @param [Boolean] include_match_data
        #   Get match data along with metadata.
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
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
        # @yieldparam result [Google::Apis::GamesV1::TurnBasedMatch] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::TurnBasedMatch]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_turn_based_match(match_id, include_match_data: nil, language: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'turnbasedmatches/{matchId}', options)
          command.response_representation = Google::Apis::GamesV1::TurnBasedMatch::Representation
          command.response_class = Google::Apis::GamesV1::TurnBasedMatch
          command.params['matchId'] = match_id unless match_id.nil?
          command.query['includeMatchData'] = include_match_data unless include_match_data.nil?
          command.query['language'] = language unless language.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Join a turn-based match.
        # @param [String] match_id
        #   The ID of the match.
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
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
        # @yieldparam result [Google::Apis::GamesV1::TurnBasedMatch] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::TurnBasedMatch]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def join_turn_based_match(match_id, language: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'turnbasedmatches/{matchId}/join', options)
          command.response_representation = Google::Apis::GamesV1::TurnBasedMatch::Representation
          command.response_class = Google::Apis::GamesV1::TurnBasedMatch
          command.params['matchId'] = match_id unless match_id.nil?
          command.query['language'] = language unless language.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Leave a turn-based match when it is not the current player's turn, without
        # canceling the match.
        # @param [String] match_id
        #   The ID of the match.
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
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
        # @yieldparam result [Google::Apis::GamesV1::TurnBasedMatch] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::TurnBasedMatch]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def leave_turn_based_match(match_id, language: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'turnbasedmatches/{matchId}/leave', options)
          command.response_representation = Google::Apis::GamesV1::TurnBasedMatch::Representation
          command.response_class = Google::Apis::GamesV1::TurnBasedMatch
          command.params['matchId'] = match_id unless match_id.nil?
          command.query['language'] = language unless language.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Leave a turn-based match during the current player's turn, without canceling
        # the match.
        # @param [String] match_id
        #   The ID of the match.
        # @param [Fixnum] match_version
        #   The version of the match being updated.
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
        # @param [String] pending_participant_id
        #   The ID of another participant who should take their turn next. If not set, the
        #   match will wait for other player(s) to join via automatching; this is only
        #   valid if automatch criteria is set on the match with remaining slots for
        #   automatched players.
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
        # @yieldparam result [Google::Apis::GamesV1::TurnBasedMatch] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::TurnBasedMatch]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def leave_turn(match_id, match_version, language: nil, pending_participant_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'turnbasedmatches/{matchId}/leaveTurn', options)
          command.response_representation = Google::Apis::GamesV1::TurnBasedMatch::Representation
          command.response_class = Google::Apis::GamesV1::TurnBasedMatch
          command.params['matchId'] = match_id unless match_id.nil?
          command.query['language'] = language unless language.nil?
          command.query['matchVersion'] = match_version unless match_version.nil?
          command.query['pendingParticipantId'] = pending_participant_id unless pending_participant_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns turn-based matches the player is or was involved in.
        # @param [Boolean] include_match_data
        #   True if match data should be returned in the response. Note that not all data
        #   will necessarily be returned if include_match_data is true; the server may
        #   decide to only return data for some of the matches to limit download size for
        #   the client. The remainder of the data for these matches will be retrievable on
        #   request.
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
        # @param [Fixnum] max_completed_matches
        #   The maximum number of completed or canceled matches to return in the response.
        #   If not set, all matches returned could be completed or canceled.
        # @param [Fixnum] max_results
        #   The maximum number of matches to return in the response, used for paging. For
        #   any response, the actual number of matches to return may be less than the
        #   specified maxResults.
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
        # @yieldparam result [Google::Apis::GamesV1::TurnBasedMatchList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::TurnBasedMatchList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_turn_based_matches(include_match_data: nil, language: nil, max_completed_matches: nil, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'turnbasedmatches', options)
          command.response_representation = Google::Apis::GamesV1::TurnBasedMatchList::Representation
          command.response_class = Google::Apis::GamesV1::TurnBasedMatchList
          command.query['includeMatchData'] = include_match_data unless include_match_data.nil?
          command.query['language'] = language unless language.nil?
          command.query['maxCompletedMatches'] = max_completed_matches unless max_completed_matches.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Create a rematch of a match that was previously completed, with the same
        # participants. This can be called by only one player on a match still in their
        # list; the player must have called Finish first. Returns the newly created
        # match; it will be the caller's turn.
        # @param [String] match_id
        #   The ID of the match.
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
        # @param [Fixnum] request_id
        #   A randomly generated numeric ID for each request specified by the caller. This
        #   number is used at the server to ensure that the request is handled correctly
        #   across retries.
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
        # @yieldparam result [Google::Apis::GamesV1::TurnBasedMatchRematch] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::TurnBasedMatchRematch]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def rematch_turn_based_match(match_id, language: nil, request_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'turnbasedmatches/{matchId}/rematch', options)
          command.response_representation = Google::Apis::GamesV1::TurnBasedMatchRematch::Representation
          command.response_class = Google::Apis::GamesV1::TurnBasedMatchRematch
          command.params['matchId'] = match_id unless match_id.nil?
          command.query['language'] = language unless language.nil?
          command.query['requestId'] = request_id unless request_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns turn-based matches the player is or was involved in that changed since
        # the last sync call, with the least recent changes coming first. Matches that
        # should be removed from the local cache will have a status of MATCH_DELETED.
        # @param [Boolean] include_match_data
        #   True if match data should be returned in the response. Note that not all data
        #   will necessarily be returned if include_match_data is true; the server may
        #   decide to only return data for some of the matches to limit download size for
        #   the client. The remainder of the data for these matches will be retrievable on
        #   request.
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
        # @param [Fixnum] max_completed_matches
        #   The maximum number of completed or canceled matches to return in the response.
        #   If not set, all matches returned could be completed or canceled.
        # @param [Fixnum] max_results
        #   The maximum number of matches to return in the response, used for paging. For
        #   any response, the actual number of matches to return may be less than the
        #   specified maxResults.
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
        # @yieldparam result [Google::Apis::GamesV1::TurnBasedMatchSync] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::TurnBasedMatchSync]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def sync_turn_based_match(include_match_data: nil, language: nil, max_completed_matches: nil, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'turnbasedmatches/sync', options)
          command.response_representation = Google::Apis::GamesV1::TurnBasedMatchSync::Representation
          command.response_class = Google::Apis::GamesV1::TurnBasedMatchSync
          command.query['includeMatchData'] = include_match_data unless include_match_data.nil?
          command.query['language'] = language unless language.nil?
          command.query['maxCompletedMatches'] = max_completed_matches unless max_completed_matches.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Commit the results of a player turn.
        # @param [String] match_id
        #   The ID of the match.
        # @param [Google::Apis::GamesV1::TurnBasedMatchTurn] turn_based_match_turn_object
        # @param [String] language
        #   The preferred language to use for strings returned by this method.
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
        # @yieldparam result [Google::Apis::GamesV1::TurnBasedMatch] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GamesV1::TurnBasedMatch]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def take_turn(match_id, turn_based_match_turn_object = nil, language: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'turnbasedmatches/{matchId}/turn', options)
          command.request_representation = Google::Apis::GamesV1::TurnBasedMatchTurn::Representation
          command.request_object = turn_based_match_turn_object
          command.response_representation = Google::Apis::GamesV1::TurnBasedMatch::Representation
          command.response_class = Google::Apis::GamesV1::TurnBasedMatch
          command.params['matchId'] = match_id unless match_id.nil?
          command.query['language'] = language unless language.nil?
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
