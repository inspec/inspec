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
      
      class AchievementResetAllResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AchievementResetMultipleForAllRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AchievementResetResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EventsResetMultipleForAllRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GamesPlayedResource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GamesPlayerExperienceInfoResource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GamesPlayerLevelResource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HiddenPlayer
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HiddenPlayerList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Player
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Name
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PlayerScoreResetAllResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PlayerScoreResetResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProfileSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ScoresResetMultipleForAllRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AchievementResetAllResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :results, as: 'results', class: Google::Apis::GamesManagementV1management::AchievementResetResponse, decorator: Google::Apis::GamesManagementV1management::AchievementResetResponse::Representation
      
        end
      end
      
      class AchievementResetMultipleForAllRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :achievement_ids, as: 'achievement_ids'
          property :kind, as: 'kind'
        end
      end
      
      class AchievementResetResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :current_state, as: 'currentState'
          property :definition_id, as: 'definitionId'
          property :kind, as: 'kind'
          property :update_occurred, as: 'updateOccurred'
        end
      end
      
      class EventsResetMultipleForAllRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :event_ids, as: 'event_ids'
          property :kind, as: 'kind'
        end
      end
      
      class GamesPlayedResource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :auto_matched, as: 'autoMatched'
          property :time_millis, :numeric_string => true, as: 'timeMillis'
        end
      end
      
      class GamesPlayerExperienceInfoResource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :current_experience_points, :numeric_string => true, as: 'currentExperiencePoints'
          property :current_level, as: 'currentLevel', class: Google::Apis::GamesManagementV1management::GamesPlayerLevelResource, decorator: Google::Apis::GamesManagementV1management::GamesPlayerLevelResource::Representation
      
          property :last_level_up_timestamp_millis, :numeric_string => true, as: 'lastLevelUpTimestampMillis'
          property :next_level, as: 'nextLevel', class: Google::Apis::GamesManagementV1management::GamesPlayerLevelResource, decorator: Google::Apis::GamesManagementV1management::GamesPlayerLevelResource::Representation
      
        end
      end
      
      class GamesPlayerLevelResource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :level, as: 'level'
          property :max_experience_points, :numeric_string => true, as: 'maxExperiencePoints'
          property :min_experience_points, :numeric_string => true, as: 'minExperiencePoints'
        end
      end
      
      class HiddenPlayer
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :hidden_time_millis, :numeric_string => true, as: 'hiddenTimeMillis'
          property :kind, as: 'kind'
          property :player, as: 'player', class: Google::Apis::GamesManagementV1management::Player, decorator: Google::Apis::GamesManagementV1management::Player::Representation
      
        end
      end
      
      class HiddenPlayerList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::GamesManagementV1management::HiddenPlayer, decorator: Google::Apis::GamesManagementV1management::HiddenPlayer::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class Player
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :avatar_image_url, as: 'avatarImageUrl'
          property :banner_url_landscape, as: 'bannerUrlLandscape'
          property :banner_url_portrait, as: 'bannerUrlPortrait'
          property :display_name, as: 'displayName'
          property :experience_info, as: 'experienceInfo', class: Google::Apis::GamesManagementV1management::GamesPlayerExperienceInfoResource, decorator: Google::Apis::GamesManagementV1management::GamesPlayerExperienceInfoResource::Representation
      
          property :kind, as: 'kind'
          property :last_played_with, as: 'lastPlayedWith', class: Google::Apis::GamesManagementV1management::GamesPlayedResource, decorator: Google::Apis::GamesManagementV1management::GamesPlayedResource::Representation
      
          property :name, as: 'name', class: Google::Apis::GamesManagementV1management::Player::Name, decorator: Google::Apis::GamesManagementV1management::Player::Name::Representation
      
          property :original_player_id, as: 'originalPlayerId'
          property :player_id, as: 'playerId'
          property :player_stattus, as: 'playerStattus'
          property :profile_settings, as: 'profileSettings', class: Google::Apis::GamesManagementV1management::ProfileSettings, decorator: Google::Apis::GamesManagementV1management::ProfileSettings::Representation
      
          property :title, as: 'title'
        end
        
        class Name
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :family_name, as: 'familyName'
            property :given_name, as: 'givenName'
          end
        end
      end
      
      class PlayerScoreResetAllResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :results, as: 'results', class: Google::Apis::GamesManagementV1management::PlayerScoreResetResponse, decorator: Google::Apis::GamesManagementV1management::PlayerScoreResetResponse::Representation
      
        end
      end
      
      class PlayerScoreResetResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :definition_id, as: 'definitionId'
          property :kind, as: 'kind'
          collection :reset_score_time_spans, as: 'resetScoreTimeSpans'
        end
      end
      
      class ProfileSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :profile_visible, as: 'profileVisible'
        end
      end
      
      class ScoresResetMultipleForAllRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :leaderboard_ids, as: 'leaderboard_ids'
        end
      end
    end
  end
end
