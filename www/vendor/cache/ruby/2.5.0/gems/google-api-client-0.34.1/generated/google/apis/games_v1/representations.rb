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
    module GamesV1
      
      class AchievementDefinition
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListAchievementDefinitionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AchievementIncrementResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AchievementRevealResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AchievementSetStepsAtLeastResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AchievementUnlockResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AchievementUpdateMultipleRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AchievementUpdateMultipleResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateAchievementRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateAchievementResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AggregateStats
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AnonymousPlayer
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Application
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ApplicationCategory
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ApplicationVerifyResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Category
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListCategoryResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EventBatchRecordFailure
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EventChild
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EventDefinition
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListEventDefinitionResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EventPeriodRange
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EventPeriodUpdate
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EventRecordFailure
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EventRecordRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateEventRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateEventResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GamesAchievementIncrement
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GamesAchievementSetStepsAtLeast
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ImageAsset
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Instance
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceAndroidDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceIosDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceWebDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Leaderboard
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LeaderboardEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListLeaderboardResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LeaderboardScoreRank
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LeaderboardScores
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MetagameConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NetworkDiagnostics
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ParticipantResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PeerChannelDiagnostics
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PeerSessionDiagnostics
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Played
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
      
      class PlayerAchievement
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListPlayerAchievementResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PlayerEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListPlayerEventResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PlayerExperienceInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PlayerLeaderboardScore
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListPlayerLeaderboardScoreResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PlayerLevel
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListPlayerResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PlayerScore
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListPlayerScoreResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PlayerScoreResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PlayerScoreSubmissionList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProfileSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PushToken
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PushTokenId
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Ios
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CheckRevisionResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Room
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RoomAutoMatchStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RoomAutoMatchingCriteria
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RoomClientAddress
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateRoomRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JoinRoomRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RoomLeaveDiagnostics
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LeaveRoomRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RoomList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RoomModification
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RoomP2PStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RoomP2PStatuses
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RoomParticipant
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RoomStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ScoreSubmission
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Snapshot
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SnapshotImage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListSnapshotResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TurnBasedAutoMatchingCriteria
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TurnBasedMatch
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateTurnBasedMatchRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TurnBasedMatchData
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TurnBasedMatchDataRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TurnBasedMatchList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TurnBasedMatchModification
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TurnBasedMatchParticipant
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TurnBasedMatchRematch
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TurnBasedMatchResults
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TurnBasedMatchSync
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TurnBasedMatchTurn
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AchievementDefinition
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :achievement_type, as: 'achievementType'
          property :description, as: 'description'
          property :experience_points, :numeric_string => true, as: 'experiencePoints'
          property :formatted_total_steps, as: 'formattedTotalSteps'
          property :id, as: 'id'
          property :initial_state, as: 'initialState'
          property :is_revealed_icon_url_default, as: 'isRevealedIconUrlDefault'
          property :is_unlocked_icon_url_default, as: 'isUnlockedIconUrlDefault'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :revealed_icon_url, as: 'revealedIconUrl'
          property :total_steps, as: 'totalSteps'
          property :unlocked_icon_url, as: 'unlockedIconUrl'
        end
      end
      
      class ListAchievementDefinitionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::GamesV1::AchievementDefinition, decorator: Google::Apis::GamesV1::AchievementDefinition::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class AchievementIncrementResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :current_steps, as: 'currentSteps'
          property :kind, as: 'kind'
          property :newly_unlocked, as: 'newlyUnlocked'
        end
      end
      
      class AchievementRevealResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :current_state, as: 'currentState'
          property :kind, as: 'kind'
        end
      end
      
      class AchievementSetStepsAtLeastResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :current_steps, as: 'currentSteps'
          property :kind, as: 'kind'
          property :newly_unlocked, as: 'newlyUnlocked'
        end
      end
      
      class AchievementUnlockResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :newly_unlocked, as: 'newlyUnlocked'
        end
      end
      
      class AchievementUpdateMultipleRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :updates, as: 'updates', class: Google::Apis::GamesV1::UpdateAchievementRequest, decorator: Google::Apis::GamesV1::UpdateAchievementRequest::Representation
      
        end
      end
      
      class AchievementUpdateMultipleResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :updated_achievements, as: 'updatedAchievements', class: Google::Apis::GamesV1::UpdateAchievementResponse, decorator: Google::Apis::GamesV1::UpdateAchievementResponse::Representation
      
        end
      end
      
      class UpdateAchievementRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :achievement_id, as: 'achievementId'
          property :increment_payload, as: 'incrementPayload', class: Google::Apis::GamesV1::GamesAchievementIncrement, decorator: Google::Apis::GamesV1::GamesAchievementIncrement::Representation
      
          property :kind, as: 'kind'
          property :set_steps_at_least_payload, as: 'setStepsAtLeastPayload', class: Google::Apis::GamesV1::GamesAchievementSetStepsAtLeast, decorator: Google::Apis::GamesV1::GamesAchievementSetStepsAtLeast::Representation
      
          property :update_type, as: 'updateType'
        end
      end
      
      class UpdateAchievementResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :achievement_id, as: 'achievementId'
          property :current_state, as: 'currentState'
          property :current_steps, as: 'currentSteps'
          property :kind, as: 'kind'
          property :newly_unlocked, as: 'newlyUnlocked'
          property :update_occurred, as: 'updateOccurred'
        end
      end
      
      class AggregateStats
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :count, :numeric_string => true, as: 'count'
          property :kind, as: 'kind'
          property :max, :numeric_string => true, as: 'max'
          property :min, :numeric_string => true, as: 'min'
          property :sum, :numeric_string => true, as: 'sum'
        end
      end
      
      class AnonymousPlayer
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :avatar_image_url, as: 'avatarImageUrl'
          property :display_name, as: 'displayName'
          property :kind, as: 'kind'
        end
      end
      
      class Application
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :achievement_count, as: 'achievement_count'
          collection :assets, as: 'assets', class: Google::Apis::GamesV1::ImageAsset, decorator: Google::Apis::GamesV1::ImageAsset::Representation
      
          property :author, as: 'author'
          property :category, as: 'category', class: Google::Apis::GamesV1::ApplicationCategory, decorator: Google::Apis::GamesV1::ApplicationCategory::Representation
      
          property :description, as: 'description'
          collection :enabled_features, as: 'enabledFeatures'
          property :id, as: 'id'
          collection :instances, as: 'instances', class: Google::Apis::GamesV1::Instance, decorator: Google::Apis::GamesV1::Instance::Representation
      
          property :kind, as: 'kind'
          property :last_updated_timestamp, :numeric_string => true, as: 'lastUpdatedTimestamp'
          property :leaderboard_count, as: 'leaderboard_count'
          property :name, as: 'name'
          property :theme_color, as: 'themeColor'
        end
      end
      
      class ApplicationCategory
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :primary, as: 'primary'
          property :secondary, as: 'secondary'
        end
      end
      
      class ApplicationVerifyResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :alternate_player_id, as: 'alternate_player_id'
          property :kind, as: 'kind'
          property :player_id, as: 'player_id'
        end
      end
      
      class Category
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :category, as: 'category'
          property :experience_points, :numeric_string => true, as: 'experiencePoints'
          property :kind, as: 'kind'
        end
      end
      
      class ListCategoryResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::GamesV1::Category, decorator: Google::Apis::GamesV1::Category::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class EventBatchRecordFailure
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :failure_cause, as: 'failureCause'
          property :kind, as: 'kind'
          property :range, as: 'range', class: Google::Apis::GamesV1::EventPeriodRange, decorator: Google::Apis::GamesV1::EventPeriodRange::Representation
      
        end
      end
      
      class EventChild
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :child_id, as: 'childId'
          property :kind, as: 'kind'
        end
      end
      
      class EventDefinition
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :child_events, as: 'childEvents', class: Google::Apis::GamesV1::EventChild, decorator: Google::Apis::GamesV1::EventChild::Representation
      
          property :description, as: 'description'
          property :display_name, as: 'displayName'
          property :id, as: 'id'
          property :image_url, as: 'imageUrl'
          property :is_default_image_url, as: 'isDefaultImageUrl'
          property :kind, as: 'kind'
          property :visibility, as: 'visibility'
        end
      end
      
      class ListEventDefinitionResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::GamesV1::EventDefinition, decorator: Google::Apis::GamesV1::EventDefinition::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class EventPeriodRange
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :period_end_millis, :numeric_string => true, as: 'periodEndMillis'
          property :period_start_millis, :numeric_string => true, as: 'periodStartMillis'
        end
      end
      
      class EventPeriodUpdate
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :time_period, as: 'timePeriod', class: Google::Apis::GamesV1::EventPeriodRange, decorator: Google::Apis::GamesV1::EventPeriodRange::Representation
      
          collection :updates, as: 'updates', class: Google::Apis::GamesV1::UpdateEventRequest, decorator: Google::Apis::GamesV1::UpdateEventRequest::Representation
      
        end
      end
      
      class EventRecordFailure
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :event_id, as: 'eventId'
          property :failure_cause, as: 'failureCause'
          property :kind, as: 'kind'
        end
      end
      
      class EventRecordRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :current_time_millis, :numeric_string => true, as: 'currentTimeMillis'
          property :kind, as: 'kind'
          property :request_id, :numeric_string => true, as: 'requestId'
          collection :time_periods, as: 'timePeriods', class: Google::Apis::GamesV1::EventPeriodUpdate, decorator: Google::Apis::GamesV1::EventPeriodUpdate::Representation
      
        end
      end
      
      class UpdateEventRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :definition_id, as: 'definitionId'
          property :kind, as: 'kind'
          property :update_count, :numeric_string => true, as: 'updateCount'
        end
      end
      
      class UpdateEventResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :batch_failures, as: 'batchFailures', class: Google::Apis::GamesV1::EventBatchRecordFailure, decorator: Google::Apis::GamesV1::EventBatchRecordFailure::Representation
      
          collection :event_failures, as: 'eventFailures', class: Google::Apis::GamesV1::EventRecordFailure, decorator: Google::Apis::GamesV1::EventRecordFailure::Representation
      
          property :kind, as: 'kind'
          collection :player_events, as: 'playerEvents', class: Google::Apis::GamesV1::PlayerEvent, decorator: Google::Apis::GamesV1::PlayerEvent::Representation
      
        end
      end
      
      class GamesAchievementIncrement
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :request_id, :numeric_string => true, as: 'requestId'
          property :steps, as: 'steps'
        end
      end
      
      class GamesAchievementSetStepsAtLeast
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :steps, as: 'steps'
        end
      end
      
      class ImageAsset
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :height, as: 'height'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :url, as: 'url'
          property :width, as: 'width'
        end
      end
      
      class Instance
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :acquisition_uri, as: 'acquisitionUri'
          property :android_instance, as: 'androidInstance', class: Google::Apis::GamesV1::InstanceAndroidDetails, decorator: Google::Apis::GamesV1::InstanceAndroidDetails::Representation
      
          property :ios_instance, as: 'iosInstance', class: Google::Apis::GamesV1::InstanceIosDetails, decorator: Google::Apis::GamesV1::InstanceIosDetails::Representation
      
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :platform_type, as: 'platformType'
          property :realtime_play, as: 'realtimePlay'
          property :turn_based_play, as: 'turnBasedPlay'
          property :web_instance, as: 'webInstance', class: Google::Apis::GamesV1::InstanceWebDetails, decorator: Google::Apis::GamesV1::InstanceWebDetails::Representation
      
        end
      end
      
      class InstanceAndroidDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :enable_piracy_check, as: 'enablePiracyCheck'
          property :kind, as: 'kind'
          property :package_name, as: 'packageName'
          property :preferred, as: 'preferred'
        end
      end
      
      class InstanceIosDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bundle_identifier, as: 'bundleIdentifier'
          property :itunes_app_id, as: 'itunesAppId'
          property :kind, as: 'kind'
          property :preferred_for_ipad, as: 'preferredForIpad'
          property :preferred_for_iphone, as: 'preferredForIphone'
          property :support_ipad, as: 'supportIpad'
          property :support_iphone, as: 'supportIphone'
        end
      end
      
      class InstanceWebDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :launch_url, as: 'launchUrl'
          property :preferred, as: 'preferred'
        end
      end
      
      class Leaderboard
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :icon_url, as: 'iconUrl'
          property :id, as: 'id'
          property :is_icon_url_default, as: 'isIconUrlDefault'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :order, as: 'order'
        end
      end
      
      class LeaderboardEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :formatted_score, as: 'formattedScore'
          property :formatted_score_rank, as: 'formattedScoreRank'
          property :kind, as: 'kind'
          property :player, as: 'player', class: Google::Apis::GamesV1::Player, decorator: Google::Apis::GamesV1::Player::Representation
      
          property :score_rank, :numeric_string => true, as: 'scoreRank'
          property :score_tag, as: 'scoreTag'
          property :score_value, :numeric_string => true, as: 'scoreValue'
          property :time_span, as: 'timeSpan'
          property :write_timestamp_millis, :numeric_string => true, as: 'writeTimestampMillis'
        end
      end
      
      class ListLeaderboardResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::GamesV1::Leaderboard, decorator: Google::Apis::GamesV1::Leaderboard::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class LeaderboardScoreRank
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :formatted_num_scores, as: 'formattedNumScores'
          property :formatted_rank, as: 'formattedRank'
          property :kind, as: 'kind'
          property :num_scores, :numeric_string => true, as: 'numScores'
          property :rank, :numeric_string => true, as: 'rank'
        end
      end
      
      class LeaderboardScores
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::GamesV1::LeaderboardEntry, decorator: Google::Apis::GamesV1::LeaderboardEntry::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :num_scores, :numeric_string => true, as: 'numScores'
          property :player_score, as: 'playerScore', class: Google::Apis::GamesV1::LeaderboardEntry, decorator: Google::Apis::GamesV1::LeaderboardEntry::Representation
      
          property :prev_page_token, as: 'prevPageToken'
        end
      end
      
      class MetagameConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :current_version, as: 'currentVersion'
          property :kind, as: 'kind'
          collection :player_levels, as: 'playerLevels', class: Google::Apis::GamesV1::PlayerLevel, decorator: Google::Apis::GamesV1::PlayerLevel::Representation
      
        end
      end
      
      class NetworkDiagnostics
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :android_network_subtype, as: 'androidNetworkSubtype'
          property :android_network_type, as: 'androidNetworkType'
          property :ios_network_type, as: 'iosNetworkType'
          property :kind, as: 'kind'
          property :network_operator_code, as: 'networkOperatorCode'
          property :network_operator_name, as: 'networkOperatorName'
          property :registration_latency_millis, as: 'registrationLatencyMillis'
        end
      end
      
      class ParticipantResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :participant_id, as: 'participantId'
          property :placing, as: 'placing'
          property :result, as: 'result'
        end
      end
      
      class PeerChannelDiagnostics
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bytes_received, as: 'bytesReceived', class: Google::Apis::GamesV1::AggregateStats, decorator: Google::Apis::GamesV1::AggregateStats::Representation
      
          property :bytes_sent, as: 'bytesSent', class: Google::Apis::GamesV1::AggregateStats, decorator: Google::Apis::GamesV1::AggregateStats::Representation
      
          property :kind, as: 'kind'
          property :num_messages_lost, as: 'numMessagesLost'
          property :num_messages_received, as: 'numMessagesReceived'
          property :num_messages_sent, as: 'numMessagesSent'
          property :num_send_failures, as: 'numSendFailures'
          property :roundtrip_latency_millis, as: 'roundtripLatencyMillis', class: Google::Apis::GamesV1::AggregateStats, decorator: Google::Apis::GamesV1::AggregateStats::Representation
      
        end
      end
      
      class PeerSessionDiagnostics
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :connected_timestamp_millis, :numeric_string => true, as: 'connectedTimestampMillis'
          property :kind, as: 'kind'
          property :participant_id, as: 'participantId'
          property :reliable_channel, as: 'reliableChannel', class: Google::Apis::GamesV1::PeerChannelDiagnostics, decorator: Google::Apis::GamesV1::PeerChannelDiagnostics::Representation
      
          property :unreliable_channel, as: 'unreliableChannel', class: Google::Apis::GamesV1::PeerChannelDiagnostics, decorator: Google::Apis::GamesV1::PeerChannelDiagnostics::Representation
      
        end
      end
      
      class Played
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :auto_matched, as: 'autoMatched'
          property :kind, as: 'kind'
          property :time_millis, :numeric_string => true, as: 'timeMillis'
        end
      end
      
      class Player
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :avatar_image_url, as: 'avatarImageUrl'
          property :banner_url_landscape, as: 'bannerUrlLandscape'
          property :banner_url_portrait, as: 'bannerUrlPortrait'
          property :display_name, as: 'displayName'
          property :experience_info, as: 'experienceInfo', class: Google::Apis::GamesV1::PlayerExperienceInfo, decorator: Google::Apis::GamesV1::PlayerExperienceInfo::Representation
      
          property :kind, as: 'kind'
          property :last_played_with, as: 'lastPlayedWith', class: Google::Apis::GamesV1::Played, decorator: Google::Apis::GamesV1::Played::Representation
      
          property :name, as: 'name', class: Google::Apis::GamesV1::Player::Name, decorator: Google::Apis::GamesV1::Player::Name::Representation
      
          property :original_player_id, as: 'originalPlayerId'
          property :player_id, as: 'playerId'
          property :player_stattus, as: 'playerStattus'
          property :profile_settings, as: 'profileSettings', class: Google::Apis::GamesV1::ProfileSettings, decorator: Google::Apis::GamesV1::ProfileSettings::Representation
      
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
      
      class PlayerAchievement
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :achievement_state, as: 'achievementState'
          property :current_steps, as: 'currentSteps'
          property :experience_points, :numeric_string => true, as: 'experiencePoints'
          property :formatted_current_steps_string, as: 'formattedCurrentStepsString'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :last_updated_timestamp, :numeric_string => true, as: 'lastUpdatedTimestamp'
        end
      end
      
      class ListPlayerAchievementResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::GamesV1::PlayerAchievement, decorator: Google::Apis::GamesV1::PlayerAchievement::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class PlayerEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :definition_id, as: 'definitionId'
          property :formatted_num_events, as: 'formattedNumEvents'
          property :kind, as: 'kind'
          property :num_events, :numeric_string => true, as: 'numEvents'
          property :player_id, as: 'playerId'
        end
      end
      
      class ListPlayerEventResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::GamesV1::PlayerEvent, decorator: Google::Apis::GamesV1::PlayerEvent::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class PlayerExperienceInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :current_experience_points, :numeric_string => true, as: 'currentExperiencePoints'
          property :current_level, as: 'currentLevel', class: Google::Apis::GamesV1::PlayerLevel, decorator: Google::Apis::GamesV1::PlayerLevel::Representation
      
          property :kind, as: 'kind'
          property :last_level_up_timestamp_millis, :numeric_string => true, as: 'lastLevelUpTimestampMillis'
          property :next_level, as: 'nextLevel', class: Google::Apis::GamesV1::PlayerLevel, decorator: Google::Apis::GamesV1::PlayerLevel::Representation
      
        end
      end
      
      class PlayerLeaderboardScore
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :leaderboard_id, as: 'leaderboard_id'
          property :public_rank, as: 'publicRank', class: Google::Apis::GamesV1::LeaderboardScoreRank, decorator: Google::Apis::GamesV1::LeaderboardScoreRank::Representation
      
          property :score_string, as: 'scoreString'
          property :score_tag, as: 'scoreTag'
          property :score_value, :numeric_string => true, as: 'scoreValue'
          property :social_rank, as: 'socialRank', class: Google::Apis::GamesV1::LeaderboardScoreRank, decorator: Google::Apis::GamesV1::LeaderboardScoreRank::Representation
      
          property :time_span, as: 'timeSpan'
          property :write_timestamp, :numeric_string => true, as: 'writeTimestamp'
        end
      end
      
      class ListPlayerLeaderboardScoreResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::GamesV1::PlayerLeaderboardScore, decorator: Google::Apis::GamesV1::PlayerLeaderboardScore::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :player, as: 'player', class: Google::Apis::GamesV1::Player, decorator: Google::Apis::GamesV1::Player::Representation
      
        end
      end
      
      class PlayerLevel
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :level, as: 'level'
          property :max_experience_points, :numeric_string => true, as: 'maxExperiencePoints'
          property :min_experience_points, :numeric_string => true, as: 'minExperiencePoints'
        end
      end
      
      class ListPlayerResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::GamesV1::Player, decorator: Google::Apis::GamesV1::Player::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class PlayerScore
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :formatted_score, as: 'formattedScore'
          property :kind, as: 'kind'
          property :score, :numeric_string => true, as: 'score'
          property :score_tag, as: 'scoreTag'
          property :time_span, as: 'timeSpan'
        end
      end
      
      class ListPlayerScoreResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :submitted_scores, as: 'submittedScores', class: Google::Apis::GamesV1::PlayerScoreResponse, decorator: Google::Apis::GamesV1::PlayerScoreResponse::Representation
      
        end
      end
      
      class PlayerScoreResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :beaten_score_time_spans, as: 'beatenScoreTimeSpans'
          property :formatted_score, as: 'formattedScore'
          property :kind, as: 'kind'
          property :leaderboard_id, as: 'leaderboardId'
          property :score_tag, as: 'scoreTag'
          collection :unbeaten_scores, as: 'unbeatenScores', class: Google::Apis::GamesV1::PlayerScore, decorator: Google::Apis::GamesV1::PlayerScore::Representation
      
        end
      end
      
      class PlayerScoreSubmissionList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :scores, as: 'scores', class: Google::Apis::GamesV1::ScoreSubmission, decorator: Google::Apis::GamesV1::ScoreSubmission::Representation
      
        end
      end
      
      class ProfileSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :profile_visible, as: 'profileVisible'
        end
      end
      
      class PushToken
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :client_revision, as: 'clientRevision'
          property :id, as: 'id', class: Google::Apis::GamesV1::PushTokenId, decorator: Google::Apis::GamesV1::PushTokenId::Representation
      
          property :kind, as: 'kind'
          property :language, as: 'language'
        end
      end
      
      class PushTokenId
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ios, as: 'ios', class: Google::Apis::GamesV1::PushTokenId::Ios, decorator: Google::Apis::GamesV1::PushTokenId::Ios::Representation
      
          property :kind, as: 'kind'
        end
        
        class Ios
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :apns_device_token, :base64 => true, as: 'apns_device_token'
            property :apns_environment, as: 'apns_environment'
          end
        end
      end
      
      class CheckRevisionResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          property :kind, as: 'kind'
          property :revision_status, as: 'revisionStatus'
        end
      end
      
      class Room
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :application_id, as: 'applicationId'
          property :auto_matching_criteria, as: 'autoMatchingCriteria', class: Google::Apis::GamesV1::RoomAutoMatchingCriteria, decorator: Google::Apis::GamesV1::RoomAutoMatchingCriteria::Representation
      
          property :auto_matching_status, as: 'autoMatchingStatus', class: Google::Apis::GamesV1::RoomAutoMatchStatus, decorator: Google::Apis::GamesV1::RoomAutoMatchStatus::Representation
      
          property :creation_details, as: 'creationDetails', class: Google::Apis::GamesV1::RoomModification, decorator: Google::Apis::GamesV1::RoomModification::Representation
      
          property :description, as: 'description'
          property :inviter_id, as: 'inviterId'
          property :kind, as: 'kind'
          property :last_update_details, as: 'lastUpdateDetails', class: Google::Apis::GamesV1::RoomModification, decorator: Google::Apis::GamesV1::RoomModification::Representation
      
          collection :participants, as: 'participants', class: Google::Apis::GamesV1::RoomParticipant, decorator: Google::Apis::GamesV1::RoomParticipant::Representation
      
          property :room_id, as: 'roomId'
          property :room_status_version, as: 'roomStatusVersion'
          property :status, as: 'status'
          property :variant, as: 'variant'
        end
      end
      
      class RoomAutoMatchStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :wait_estimate_seconds, as: 'waitEstimateSeconds'
        end
      end
      
      class RoomAutoMatchingCriteria
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :exclusive_bitmask, :numeric_string => true, as: 'exclusiveBitmask'
          property :kind, as: 'kind'
          property :max_auto_matching_players, as: 'maxAutoMatchingPlayers'
          property :min_auto_matching_players, as: 'minAutoMatchingPlayers'
        end
      end
      
      class RoomClientAddress
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :xmpp_address, as: 'xmppAddress'
        end
      end
      
      class CreateRoomRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :auto_matching_criteria, as: 'autoMatchingCriteria', class: Google::Apis::GamesV1::RoomAutoMatchingCriteria, decorator: Google::Apis::GamesV1::RoomAutoMatchingCriteria::Representation
      
          collection :capabilities, as: 'capabilities'
          property :client_address, as: 'clientAddress', class: Google::Apis::GamesV1::RoomClientAddress, decorator: Google::Apis::GamesV1::RoomClientAddress::Representation
      
          collection :invited_player_ids, as: 'invitedPlayerIds'
          property :kind, as: 'kind'
          property :network_diagnostics, as: 'networkDiagnostics', class: Google::Apis::GamesV1::NetworkDiagnostics, decorator: Google::Apis::GamesV1::NetworkDiagnostics::Representation
      
          property :request_id, :numeric_string => true, as: 'requestId'
          property :variant, as: 'variant'
        end
      end
      
      class JoinRoomRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :capabilities, as: 'capabilities'
          property :client_address, as: 'clientAddress', class: Google::Apis::GamesV1::RoomClientAddress, decorator: Google::Apis::GamesV1::RoomClientAddress::Representation
      
          property :kind, as: 'kind'
          property :network_diagnostics, as: 'networkDiagnostics', class: Google::Apis::GamesV1::NetworkDiagnostics, decorator: Google::Apis::GamesV1::NetworkDiagnostics::Representation
      
        end
      end
      
      class RoomLeaveDiagnostics
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :android_network_subtype, as: 'androidNetworkSubtype'
          property :android_network_type, as: 'androidNetworkType'
          property :ios_network_type, as: 'iosNetworkType'
          property :kind, as: 'kind'
          property :network_operator_code, as: 'networkOperatorCode'
          property :network_operator_name, as: 'networkOperatorName'
          collection :peer_session, as: 'peerSession', class: Google::Apis::GamesV1::PeerSessionDiagnostics, decorator: Google::Apis::GamesV1::PeerSessionDiagnostics::Representation
      
          property :sockets_used, as: 'socketsUsed'
        end
      end
      
      class LeaveRoomRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :leave_diagnostics, as: 'leaveDiagnostics', class: Google::Apis::GamesV1::RoomLeaveDiagnostics, decorator: Google::Apis::GamesV1::RoomLeaveDiagnostics::Representation
      
          property :reason, as: 'reason'
        end
      end
      
      class RoomList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::GamesV1::Room, decorator: Google::Apis::GamesV1::Room::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class RoomModification
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :modified_timestamp_millis, :numeric_string => true, as: 'modifiedTimestampMillis'
          property :participant_id, as: 'participantId'
        end
      end
      
      class RoomP2PStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :connection_setup_latency_millis, as: 'connectionSetupLatencyMillis'
          property :error, as: 'error'
          property :error_reason, as: 'error_reason'
          property :kind, as: 'kind'
          property :participant_id, as: 'participantId'
          property :status, as: 'status'
          property :unreliable_roundtrip_latency_millis, as: 'unreliableRoundtripLatencyMillis'
        end
      end
      
      class RoomP2PStatuses
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :updates, as: 'updates', class: Google::Apis::GamesV1::RoomP2PStatus, decorator: Google::Apis::GamesV1::RoomP2PStatus::Representation
      
        end
      end
      
      class RoomParticipant
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :auto_matched, as: 'autoMatched'
          property :auto_matched_player, as: 'autoMatchedPlayer', class: Google::Apis::GamesV1::AnonymousPlayer, decorator: Google::Apis::GamesV1::AnonymousPlayer::Representation
      
          collection :capabilities, as: 'capabilities'
          property :client_address, as: 'clientAddress', class: Google::Apis::GamesV1::RoomClientAddress, decorator: Google::Apis::GamesV1::RoomClientAddress::Representation
      
          property :connected, as: 'connected'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :leave_reason, as: 'leaveReason'
          property :player, as: 'player', class: Google::Apis::GamesV1::Player, decorator: Google::Apis::GamesV1::Player::Representation
      
          property :status, as: 'status'
        end
      end
      
      class RoomStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :auto_matching_status, as: 'autoMatchingStatus', class: Google::Apis::GamesV1::RoomAutoMatchStatus, decorator: Google::Apis::GamesV1::RoomAutoMatchStatus::Representation
      
          property :kind, as: 'kind'
          collection :participants, as: 'participants', class: Google::Apis::GamesV1::RoomParticipant, decorator: Google::Apis::GamesV1::RoomParticipant::Representation
      
          property :room_id, as: 'roomId'
          property :status, as: 'status'
          property :status_version, as: 'statusVersion'
        end
      end
      
      class ScoreSubmission
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :leaderboard_id, as: 'leaderboardId'
          property :score, :numeric_string => true, as: 'score'
          property :score_tag, as: 'scoreTag'
          property :signature, as: 'signature'
        end
      end
      
      class Snapshot
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cover_image, as: 'coverImage', class: Google::Apis::GamesV1::SnapshotImage, decorator: Google::Apis::GamesV1::SnapshotImage::Representation
      
          property :description, as: 'description'
          property :drive_id, as: 'driveId'
          property :duration_millis, :numeric_string => true, as: 'durationMillis'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :last_modified_millis, :numeric_string => true, as: 'lastModifiedMillis'
          property :progress_value, :numeric_string => true, as: 'progressValue'
          property :title, as: 'title'
          property :type, as: 'type'
          property :unique_name, as: 'uniqueName'
        end
      end
      
      class SnapshotImage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :height, as: 'height'
          property :kind, as: 'kind'
          property :mime_type, as: 'mime_type'
          property :url, as: 'url'
          property :width, as: 'width'
        end
      end
      
      class ListSnapshotResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::GamesV1::Snapshot, decorator: Google::Apis::GamesV1::Snapshot::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class TurnBasedAutoMatchingCriteria
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :exclusive_bitmask, :numeric_string => true, as: 'exclusiveBitmask'
          property :kind, as: 'kind'
          property :max_auto_matching_players, as: 'maxAutoMatchingPlayers'
          property :min_auto_matching_players, as: 'minAutoMatchingPlayers'
        end
      end
      
      class TurnBasedMatch
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :application_id, as: 'applicationId'
          property :auto_matching_criteria, as: 'autoMatchingCriteria', class: Google::Apis::GamesV1::TurnBasedAutoMatchingCriteria, decorator: Google::Apis::GamesV1::TurnBasedAutoMatchingCriteria::Representation
      
          property :creation_details, as: 'creationDetails', class: Google::Apis::GamesV1::TurnBasedMatchModification, decorator: Google::Apis::GamesV1::TurnBasedMatchModification::Representation
      
          property :data, as: 'data', class: Google::Apis::GamesV1::TurnBasedMatchData, decorator: Google::Apis::GamesV1::TurnBasedMatchData::Representation
      
          property :description, as: 'description'
          property :inviter_id, as: 'inviterId'
          property :kind, as: 'kind'
          property :last_update_details, as: 'lastUpdateDetails', class: Google::Apis::GamesV1::TurnBasedMatchModification, decorator: Google::Apis::GamesV1::TurnBasedMatchModification::Representation
      
          property :match_id, as: 'matchId'
          property :match_number, as: 'matchNumber'
          property :match_version, as: 'matchVersion'
          collection :participants, as: 'participants', class: Google::Apis::GamesV1::TurnBasedMatchParticipant, decorator: Google::Apis::GamesV1::TurnBasedMatchParticipant::Representation
      
          property :pending_participant_id, as: 'pendingParticipantId'
          property :previous_match_data, as: 'previousMatchData', class: Google::Apis::GamesV1::TurnBasedMatchData, decorator: Google::Apis::GamesV1::TurnBasedMatchData::Representation
      
          property :rematch_id, as: 'rematchId'
          collection :results, as: 'results', class: Google::Apis::GamesV1::ParticipantResult, decorator: Google::Apis::GamesV1::ParticipantResult::Representation
      
          property :status, as: 'status'
          property :user_match_status, as: 'userMatchStatus'
          property :variant, as: 'variant'
          property :with_participant_id, as: 'withParticipantId'
        end
      end
      
      class CreateTurnBasedMatchRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :auto_matching_criteria, as: 'autoMatchingCriteria', class: Google::Apis::GamesV1::TurnBasedAutoMatchingCriteria, decorator: Google::Apis::GamesV1::TurnBasedAutoMatchingCriteria::Representation
      
          collection :invited_player_ids, as: 'invitedPlayerIds'
          property :kind, as: 'kind'
          property :request_id, :numeric_string => true, as: 'requestId'
          property :variant, as: 'variant'
        end
      end
      
      class TurnBasedMatchData
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :data, :base64 => true, as: 'data'
          property :data_available, as: 'dataAvailable'
          property :kind, as: 'kind'
        end
      end
      
      class TurnBasedMatchDataRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :data, :base64 => true, as: 'data'
          property :kind, as: 'kind'
        end
      end
      
      class TurnBasedMatchList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::GamesV1::TurnBasedMatch, decorator: Google::Apis::GamesV1::TurnBasedMatch::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class TurnBasedMatchModification
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :modified_timestamp_millis, :numeric_string => true, as: 'modifiedTimestampMillis'
          property :participant_id, as: 'participantId'
        end
      end
      
      class TurnBasedMatchParticipant
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :auto_matched, as: 'autoMatched'
          property :auto_matched_player, as: 'autoMatchedPlayer', class: Google::Apis::GamesV1::AnonymousPlayer, decorator: Google::Apis::GamesV1::AnonymousPlayer::Representation
      
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :player, as: 'player', class: Google::Apis::GamesV1::Player, decorator: Google::Apis::GamesV1::Player::Representation
      
          property :status, as: 'status'
        end
      end
      
      class TurnBasedMatchRematch
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :previous_match, as: 'previousMatch', class: Google::Apis::GamesV1::TurnBasedMatch, decorator: Google::Apis::GamesV1::TurnBasedMatch::Representation
      
          property :rematch, as: 'rematch', class: Google::Apis::GamesV1::TurnBasedMatch, decorator: Google::Apis::GamesV1::TurnBasedMatch::Representation
      
        end
      end
      
      class TurnBasedMatchResults
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :data, as: 'data', class: Google::Apis::GamesV1::TurnBasedMatchDataRequest, decorator: Google::Apis::GamesV1::TurnBasedMatchDataRequest::Representation
      
          property :kind, as: 'kind'
          property :match_version, as: 'matchVersion'
          collection :results, as: 'results', class: Google::Apis::GamesV1::ParticipantResult, decorator: Google::Apis::GamesV1::ParticipantResult::Representation
      
        end
      end
      
      class TurnBasedMatchSync
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::GamesV1::TurnBasedMatch, decorator: Google::Apis::GamesV1::TurnBasedMatch::Representation
      
          property :kind, as: 'kind'
          property :more_available, as: 'moreAvailable'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class TurnBasedMatchTurn
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :data, as: 'data', class: Google::Apis::GamesV1::TurnBasedMatchDataRequest, decorator: Google::Apis::GamesV1::TurnBasedMatchDataRequest::Representation
      
          property :kind, as: 'kind'
          property :match_version, as: 'matchVersion'
          property :pending_participant_id, as: 'pendingParticipantId'
          collection :results, as: 'results', class: Google::Apis::GamesV1::ParticipantResult, decorator: Google::Apis::GamesV1::ParticipantResult::Representation
      
        end
      end
    end
  end
end
