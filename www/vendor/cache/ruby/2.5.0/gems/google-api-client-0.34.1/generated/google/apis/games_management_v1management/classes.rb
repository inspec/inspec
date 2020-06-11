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

require 'date'
require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module GamesManagementV1management
      
      # This is a JSON template for achievement reset all response.
      class AchievementResetAllResponse
        include Google::Apis::Core::Hashable
      
        # Uniquely identifies the type of this resource. Value is always the fixed
        # string gamesManagement#achievementResetAllResponse.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The achievement reset results.
        # Corresponds to the JSON property `results`
        # @return [Array<Google::Apis::GamesManagementV1management::AchievementResetResponse>]
        attr_accessor :results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @results = args[:results] if args.key?(:results)
        end
      end
      
      # This is a JSON template for multiple achievements reset all request.
      class AchievementResetMultipleForAllRequest
        include Google::Apis::Core::Hashable
      
        # The IDs of achievements to reset.
        # Corresponds to the JSON property `achievement_ids`
        # @return [Array<String>]
        attr_accessor :achievement_ids
      
        # Uniquely identifies the type of this resource. Value is always the fixed
        # string gamesManagement#achievementResetMultipleForAllRequest.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @achievement_ids = args[:achievement_ids] if args.key?(:achievement_ids)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # This is a JSON template for an achievement reset response.
      class AchievementResetResponse
        include Google::Apis::Core::Hashable
      
        # The current state of the achievement. This is the same as the initial state of
        # the achievement.
        # Possible values are:
        # - "HIDDEN"- Achievement is hidden.
        # - "REVEALED" - Achievement is revealed.
        # - "UNLOCKED" - Achievement is unlocked.
        # Corresponds to the JSON property `currentState`
        # @return [String]
        attr_accessor :current_state
      
        # The ID of an achievement for which player state has been updated.
        # Corresponds to the JSON property `definitionId`
        # @return [String]
        attr_accessor :definition_id
      
        # Uniquely identifies the type of this resource. Value is always the fixed
        # string gamesManagement#achievementResetResponse.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Flag to indicate if the requested update actually occurred.
        # Corresponds to the JSON property `updateOccurred`
        # @return [Boolean]
        attr_accessor :update_occurred
        alias_method :update_occurred?, :update_occurred
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @current_state = args[:current_state] if args.key?(:current_state)
          @definition_id = args[:definition_id] if args.key?(:definition_id)
          @kind = args[:kind] if args.key?(:kind)
          @update_occurred = args[:update_occurred] if args.key?(:update_occurred)
        end
      end
      
      # This is a JSON template for multiple events reset all request.
      class EventsResetMultipleForAllRequest
        include Google::Apis::Core::Hashable
      
        # The IDs of events to reset.
        # Corresponds to the JSON property `event_ids`
        # @return [Array<String>]
        attr_accessor :event_ids
      
        # Uniquely identifies the type of this resource. Value is always the fixed
        # string gamesManagement#eventsResetMultipleForAllRequest.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @event_ids = args[:event_ids] if args.key?(:event_ids)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # This is a JSON template for metadata about a player playing a game with the
      # currently authenticated user.
      class GamesPlayedResource
        include Google::Apis::Core::Hashable
      
        # True if the player was auto-matched with the currently authenticated user.
        # Corresponds to the JSON property `autoMatched`
        # @return [Boolean]
        attr_accessor :auto_matched
        alias_method :auto_matched?, :auto_matched
      
        # The last time the player played the game in milliseconds since the epoch in
        # UTC.
        # Corresponds to the JSON property `timeMillis`
        # @return [Fixnum]
        attr_accessor :time_millis
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @auto_matched = args[:auto_matched] if args.key?(:auto_matched)
          @time_millis = args[:time_millis] if args.key?(:time_millis)
        end
      end
      
      # This is a JSON template for 1P/3P metadata about the player's experience.
      class GamesPlayerExperienceInfoResource
        include Google::Apis::Core::Hashable
      
        # The current number of experience points for the player.
        # Corresponds to the JSON property `currentExperiencePoints`
        # @return [Fixnum]
        attr_accessor :current_experience_points
      
        # This is a JSON template for 1P/3P metadata about a user's level.
        # Corresponds to the JSON property `currentLevel`
        # @return [Google::Apis::GamesManagementV1management::GamesPlayerLevelResource]
        attr_accessor :current_level
      
        # The timestamp when the player was leveled up, in millis since Unix epoch UTC.
        # Corresponds to the JSON property `lastLevelUpTimestampMillis`
        # @return [Fixnum]
        attr_accessor :last_level_up_timestamp_millis
      
        # This is a JSON template for 1P/3P metadata about a user's level.
        # Corresponds to the JSON property `nextLevel`
        # @return [Google::Apis::GamesManagementV1management::GamesPlayerLevelResource]
        attr_accessor :next_level
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @current_experience_points = args[:current_experience_points] if args.key?(:current_experience_points)
          @current_level = args[:current_level] if args.key?(:current_level)
          @last_level_up_timestamp_millis = args[:last_level_up_timestamp_millis] if args.key?(:last_level_up_timestamp_millis)
          @next_level = args[:next_level] if args.key?(:next_level)
        end
      end
      
      # This is a JSON template for 1P/3P metadata about a user's level.
      class GamesPlayerLevelResource
        include Google::Apis::Core::Hashable
      
        # The level for the user.
        # Corresponds to the JSON property `level`
        # @return [Fixnum]
        attr_accessor :level
      
        # The maximum experience points for this level.
        # Corresponds to the JSON property `maxExperiencePoints`
        # @return [Fixnum]
        attr_accessor :max_experience_points
      
        # The minimum experience points for this level.
        # Corresponds to the JSON property `minExperiencePoints`
        # @return [Fixnum]
        attr_accessor :min_experience_points
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @level = args[:level] if args.key?(:level)
          @max_experience_points = args[:max_experience_points] if args.key?(:max_experience_points)
          @min_experience_points = args[:min_experience_points] if args.key?(:min_experience_points)
        end
      end
      
      # This is a JSON template for the HiddenPlayer resource.
      class HiddenPlayer
        include Google::Apis::Core::Hashable
      
        # The time this player was hidden.
        # Corresponds to the JSON property `hiddenTimeMillis`
        # @return [Fixnum]
        attr_accessor :hidden_time_millis
      
        # Uniquely identifies the type of this resource. Value is always the fixed
        # string gamesManagement#hiddenPlayer.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # This is a JSON template for a Player resource.
        # Corresponds to the JSON property `player`
        # @return [Google::Apis::GamesManagementV1management::Player]
        attr_accessor :player
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @hidden_time_millis = args[:hidden_time_millis] if args.key?(:hidden_time_millis)
          @kind = args[:kind] if args.key?(:kind)
          @player = args[:player] if args.key?(:player)
        end
      end
      
      # This is a JSON template for a list of hidden players.
      class HiddenPlayerList
        include Google::Apis::Core::Hashable
      
        # The players.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::GamesManagementV1management::HiddenPlayer>]
        attr_accessor :items
      
        # Uniquely identifies the type of this resource. Value is always the fixed
        # string gamesManagement#hiddenPlayerList.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The pagination token for the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # This is a JSON template for a Player resource.
      class Player
        include Google::Apis::Core::Hashable
      
        # The base URL for the image that represents the player.
        # Corresponds to the JSON property `avatarImageUrl`
        # @return [String]
        attr_accessor :avatar_image_url
      
        # The url to the landscape mode player banner image.
        # Corresponds to the JSON property `bannerUrlLandscape`
        # @return [String]
        attr_accessor :banner_url_landscape
      
        # The url to the portrait mode player banner image.
        # Corresponds to the JSON property `bannerUrlPortrait`
        # @return [String]
        attr_accessor :banner_url_portrait
      
        # The name to display for the player.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # This is a JSON template for 1P/3P metadata about the player's experience.
        # Corresponds to the JSON property `experienceInfo`
        # @return [Google::Apis::GamesManagementV1management::GamesPlayerExperienceInfoResource]
        attr_accessor :experience_info
      
        # Uniquely identifies the type of this resource. Value is always the fixed
        # string gamesManagement#player.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # This is a JSON template for metadata about a player playing a game with the
        # currently authenticated user.
        # Corresponds to the JSON property `lastPlayedWith`
        # @return [Google::Apis::GamesManagementV1management::GamesPlayedResource]
        attr_accessor :last_played_with
      
        # An object representation of the individual components of the player's name.
        # For some players, these fields may not be present.
        # Corresponds to the JSON property `name`
        # @return [Google::Apis::GamesManagementV1management::Player::Name]
        attr_accessor :name
      
        # The player ID that was used for this player the first time they signed into
        # the game in question. This is only populated for calls to player.get for the
        # requesting player, only if the player ID has subsequently changed, and only to
        # clients that support remapping player IDs.
        # Corresponds to the JSON property `originalPlayerId`
        # @return [String]
        attr_accessor :original_player_id
      
        # The ID of the player.
        # Corresponds to the JSON property `playerId`
        # @return [String]
        attr_accessor :player_id
      
        # 
        # Corresponds to the JSON property `playerStattus`
        # @return [String]
        attr_accessor :player_stattus
      
        # This is a JSON template for profile settings
        # Corresponds to the JSON property `profileSettings`
        # @return [Google::Apis::GamesManagementV1management::ProfileSettings]
        attr_accessor :profile_settings
      
        # The player's title rewarded for their game activities.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @avatar_image_url = args[:avatar_image_url] if args.key?(:avatar_image_url)
          @banner_url_landscape = args[:banner_url_landscape] if args.key?(:banner_url_landscape)
          @banner_url_portrait = args[:banner_url_portrait] if args.key?(:banner_url_portrait)
          @display_name = args[:display_name] if args.key?(:display_name)
          @experience_info = args[:experience_info] if args.key?(:experience_info)
          @kind = args[:kind] if args.key?(:kind)
          @last_played_with = args[:last_played_with] if args.key?(:last_played_with)
          @name = args[:name] if args.key?(:name)
          @original_player_id = args[:original_player_id] if args.key?(:original_player_id)
          @player_id = args[:player_id] if args.key?(:player_id)
          @player_stattus = args[:player_stattus] if args.key?(:player_stattus)
          @profile_settings = args[:profile_settings] if args.key?(:profile_settings)
          @title = args[:title] if args.key?(:title)
        end
        
        # An object representation of the individual components of the player's name.
        # For some players, these fields may not be present.
        class Name
          include Google::Apis::Core::Hashable
        
          # The family name of this player. In some places, this is known as the last name.
          # Corresponds to the JSON property `familyName`
          # @return [String]
          attr_accessor :family_name
        
          # The given name of this player. In some places, this is known as the first name.
          # Corresponds to the JSON property `givenName`
          # @return [String]
          attr_accessor :given_name
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @family_name = args[:family_name] if args.key?(:family_name)
            @given_name = args[:given_name] if args.key?(:given_name)
          end
        end
      end
      
      # This is a JSON template for a list of leaderboard reset resources.
      class PlayerScoreResetAllResponse
        include Google::Apis::Core::Hashable
      
        # Uniquely identifies the type of this resource. Value is always the fixed
        # string gamesManagement#playerScoreResetResponse.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The leaderboard reset results.
        # Corresponds to the JSON property `results`
        # @return [Array<Google::Apis::GamesManagementV1management::PlayerScoreResetResponse>]
        attr_accessor :results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @results = args[:results] if args.key?(:results)
        end
      end
      
      # This is a JSON template for a list of reset leaderboard entry resources.
      class PlayerScoreResetResponse
        include Google::Apis::Core::Hashable
      
        # The ID of an leaderboard for which player state has been updated.
        # Corresponds to the JSON property `definitionId`
        # @return [String]
        attr_accessor :definition_id
      
        # Uniquely identifies the type of this resource. Value is always the fixed
        # string gamesManagement#playerScoreResetResponse.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The time spans of the updated score.
        # Possible values are:
        # - "ALL_TIME" - The score is an all-time score.
        # - "WEEKLY" - The score is a weekly score.
        # - "DAILY" - The score is a daily score.
        # Corresponds to the JSON property `resetScoreTimeSpans`
        # @return [Array<String>]
        attr_accessor :reset_score_time_spans
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @definition_id = args[:definition_id] if args.key?(:definition_id)
          @kind = args[:kind] if args.key?(:kind)
          @reset_score_time_spans = args[:reset_score_time_spans] if args.key?(:reset_score_time_spans)
        end
      end
      
      # This is a JSON template for profile settings
      class ProfileSettings
        include Google::Apis::Core::Hashable
      
        # Uniquely identifies the type of this resource. Value is always the fixed
        # string gamesManagement#profileSettings.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # 
        # Corresponds to the JSON property `profileVisible`
        # @return [Boolean]
        attr_accessor :profile_visible
        alias_method :profile_visible?, :profile_visible
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @profile_visible = args[:profile_visible] if args.key?(:profile_visible)
        end
      end
      
      # This is a JSON template for multiple scores reset all request.
      class ScoresResetMultipleForAllRequest
        include Google::Apis::Core::Hashable
      
        # Uniquely identifies the type of this resource. Value is always the fixed
        # string gamesManagement#scoresResetMultipleForAllRequest.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The IDs of leaderboards to reset.
        # Corresponds to the JSON property `leaderboard_ids`
        # @return [Array<String>]
        attr_accessor :leaderboard_ids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @leaderboard_ids = args[:leaderboard_ids] if args.key?(:leaderboard_ids)
        end
      end
    end
  end
end
