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
    module YoutubeV3
      
      class AccessPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Activity
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ActivityContentDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ActivityContentDetailsBulletin
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ActivityContentDetailsChannelItem
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ActivityContentDetailsComment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ActivityContentDetailsFavorite
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ActivityContentDetailsLike
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ActivityContentDetailsPlaylistItem
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ActivityContentDetailsPromotedItem
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ActivityContentDetailsRecommendation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ActivityContentDetailsSocial
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ActivityContentDetailsSubscription
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ActivityContentDetailsUpload
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListActivitiesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ActivitySnippet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Caption
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListCaptionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CaptionSnippet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CdnSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Channel
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ChannelAuditDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ChannelBannerResource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ChannelBrandingSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ChannelContentDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class RelatedPlaylists
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ChannelContentOwnerDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ChannelConversionPing
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ChannelConversionPings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListChannelsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ChannelLocalization
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ChannelProfileDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ChannelSection
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ChannelSectionContentDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListChannelSectionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ChannelSectionLocalization
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ChannelSectionSnippet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ChannelSectionTargeting
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ChannelSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ChannelSnippet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ChannelStatistics
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ChannelStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ChannelTopicDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Comment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListCommentsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CommentSnippet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CommentThread
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListCommentThreadsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CommentThreadReplies
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CommentThreadSnippet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ContentRating
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GeoPoint
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GuideCategory
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListGuideCategoriesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GuideCategorySnippet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class I18nLanguage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListI18nLanguagesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class I18nLanguageSnippet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class I18nRegion
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListI18nRegionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class I18nRegionSnippet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ImageSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class IngestionInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InvideoBranding
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InvideoPosition
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InvideoPromotion
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InvideoTiming
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LanguageTag
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LevelDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiveBroadcast
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiveBroadcastContentDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListLiveBroadcastsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiveBroadcastSnippet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiveBroadcastStatistics
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiveBroadcastStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiveChatBan
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiveChatBanSnippet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiveChatFanFundingEventDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiveChatMessage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiveChatMessageAuthorDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiveChatMessageDeletedDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiveChatMessageListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiveChatMessageRetractedDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiveChatMessageSnippet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiveChatModerator
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiveChatModeratorListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiveChatModeratorSnippet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiveChatPollClosedDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiveChatPollEditedDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiveChatPollItem
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiveChatPollOpenedDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiveChatPollVotedDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiveChatSuperChatDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiveChatSuperStickerDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiveChatTextMessageDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiveChatUserBannedMessageDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiveStream
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiveStreamConfigurationIssue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiveStreamContentDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiveStreamHealthStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListLiveStreamsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiveStreamSnippet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiveStreamStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LocalizedProperty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LocalizedString
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Member
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MemberListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MemberSnippet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MembershipsDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MembershipsLevel
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MembershipsLevelListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MembershipsLevelSnippet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MonitorStreamInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Nonprofit
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NonprofitId
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PageInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Playlist
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PlaylistContentDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PlaylistItem
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PlaylistItemContentDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListPlaylistItemsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PlaylistItemSnippet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PlaylistItemStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListPlaylistResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PlaylistLocalization
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PlaylistPlayer
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PlaylistSnippet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PlaylistStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PromotedItem
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PromotedItemId
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PropertyValue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourceId
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SearchListsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SearchResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SearchResultSnippet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Sponsor
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SponsorListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SponsorSnippet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Subscription
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SubscriptionContentDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListSubscriptionResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SubscriptionSnippet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SubscriptionSubscriberSnippet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SuperChatEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SuperChatEventListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SuperChatEventSnippet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SuperStickerMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Thumbnail
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ThumbnailDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SetThumbnailResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TokenPagination
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Video
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VideoAbuseReport
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VideoAbuseReportReason
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListVideoAbuseReportReasonResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VideoAbuseReportReasonSnippet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VideoAbuseReportSecondaryReason
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VideoAgeGating
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VideoCategory
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListVideoCategoryResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VideoCategorySnippet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VideoContentDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VideoContentDetailsRegionRestriction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VideoFileDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VideoFileDetailsAudioStream
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VideoFileDetailsVideoStream
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetVideoRatingResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListVideosResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VideoLiveStreamingDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VideoLocalization
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VideoMonetizationDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VideoPlayer
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VideoProcessingDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VideoProcessingDetailsProcessingProgress
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VideoProjectDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VideoRating
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VideoRecordingDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VideoSnippet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VideoStatistics
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VideoStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VideoSuggestions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VideoSuggestionsTagSuggestion
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VideoTopicDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WatchSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccessPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :allowed, as: 'allowed'
          collection :exception, as: 'exception'
        end
      end
      
      class Activity
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content_details, as: 'contentDetails', class: Google::Apis::YoutubeV3::ActivityContentDetails, decorator: Google::Apis::YoutubeV3::ActivityContentDetails::Representation
      
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :snippet, as: 'snippet', class: Google::Apis::YoutubeV3::ActivitySnippet, decorator: Google::Apis::YoutubeV3::ActivitySnippet::Representation
      
        end
      end
      
      class ActivityContentDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bulletin, as: 'bulletin', class: Google::Apis::YoutubeV3::ActivityContentDetailsBulletin, decorator: Google::Apis::YoutubeV3::ActivityContentDetailsBulletin::Representation
      
          property :channel_item, as: 'channelItem', class: Google::Apis::YoutubeV3::ActivityContentDetailsChannelItem, decorator: Google::Apis::YoutubeV3::ActivityContentDetailsChannelItem::Representation
      
          property :comment, as: 'comment', class: Google::Apis::YoutubeV3::ActivityContentDetailsComment, decorator: Google::Apis::YoutubeV3::ActivityContentDetailsComment::Representation
      
          property :favorite, as: 'favorite', class: Google::Apis::YoutubeV3::ActivityContentDetailsFavorite, decorator: Google::Apis::YoutubeV3::ActivityContentDetailsFavorite::Representation
      
          property :like, as: 'like', class: Google::Apis::YoutubeV3::ActivityContentDetailsLike, decorator: Google::Apis::YoutubeV3::ActivityContentDetailsLike::Representation
      
          property :playlist_item, as: 'playlistItem', class: Google::Apis::YoutubeV3::ActivityContentDetailsPlaylistItem, decorator: Google::Apis::YoutubeV3::ActivityContentDetailsPlaylistItem::Representation
      
          property :promoted_item, as: 'promotedItem', class: Google::Apis::YoutubeV3::ActivityContentDetailsPromotedItem, decorator: Google::Apis::YoutubeV3::ActivityContentDetailsPromotedItem::Representation
      
          property :recommendation, as: 'recommendation', class: Google::Apis::YoutubeV3::ActivityContentDetailsRecommendation, decorator: Google::Apis::YoutubeV3::ActivityContentDetailsRecommendation::Representation
      
          property :social, as: 'social', class: Google::Apis::YoutubeV3::ActivityContentDetailsSocial, decorator: Google::Apis::YoutubeV3::ActivityContentDetailsSocial::Representation
      
          property :subscription, as: 'subscription', class: Google::Apis::YoutubeV3::ActivityContentDetailsSubscription, decorator: Google::Apis::YoutubeV3::ActivityContentDetailsSubscription::Representation
      
          property :upload, as: 'upload', class: Google::Apis::YoutubeV3::ActivityContentDetailsUpload, decorator: Google::Apis::YoutubeV3::ActivityContentDetailsUpload::Representation
      
        end
      end
      
      class ActivityContentDetailsBulletin
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :resource_id, as: 'resourceId', class: Google::Apis::YoutubeV3::ResourceId, decorator: Google::Apis::YoutubeV3::ResourceId::Representation
      
        end
      end
      
      class ActivityContentDetailsChannelItem
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :resource_id, as: 'resourceId', class: Google::Apis::YoutubeV3::ResourceId, decorator: Google::Apis::YoutubeV3::ResourceId::Representation
      
        end
      end
      
      class ActivityContentDetailsComment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :resource_id, as: 'resourceId', class: Google::Apis::YoutubeV3::ResourceId, decorator: Google::Apis::YoutubeV3::ResourceId::Representation
      
        end
      end
      
      class ActivityContentDetailsFavorite
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :resource_id, as: 'resourceId', class: Google::Apis::YoutubeV3::ResourceId, decorator: Google::Apis::YoutubeV3::ResourceId::Representation
      
        end
      end
      
      class ActivityContentDetailsLike
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :resource_id, as: 'resourceId', class: Google::Apis::YoutubeV3::ResourceId, decorator: Google::Apis::YoutubeV3::ResourceId::Representation
      
        end
      end
      
      class ActivityContentDetailsPlaylistItem
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :playlist_id, as: 'playlistId'
          property :playlist_item_id, as: 'playlistItemId'
          property :resource_id, as: 'resourceId', class: Google::Apis::YoutubeV3::ResourceId, decorator: Google::Apis::YoutubeV3::ResourceId::Representation
      
        end
      end
      
      class ActivityContentDetailsPromotedItem
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ad_tag, as: 'adTag'
          property :click_tracking_url, as: 'clickTrackingUrl'
          property :creative_view_url, as: 'creativeViewUrl'
          property :cta_type, as: 'ctaType'
          property :custom_cta_button_text, as: 'customCtaButtonText'
          property :description_text, as: 'descriptionText'
          property :destination_url, as: 'destinationUrl'
          collection :forecasting_url, as: 'forecastingUrl'
          collection :impression_url, as: 'impressionUrl'
          property :video_id, as: 'videoId'
        end
      end
      
      class ActivityContentDetailsRecommendation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :reason, as: 'reason'
          property :resource_id, as: 'resourceId', class: Google::Apis::YoutubeV3::ResourceId, decorator: Google::Apis::YoutubeV3::ResourceId::Representation
      
          property :seed_resource_id, as: 'seedResourceId', class: Google::Apis::YoutubeV3::ResourceId, decorator: Google::Apis::YoutubeV3::ResourceId::Representation
      
        end
      end
      
      class ActivityContentDetailsSocial
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :author, as: 'author'
          property :image_url, as: 'imageUrl'
          property :reference_url, as: 'referenceUrl'
          property :resource_id, as: 'resourceId', class: Google::Apis::YoutubeV3::ResourceId, decorator: Google::Apis::YoutubeV3::ResourceId::Representation
      
          property :type, as: 'type'
        end
      end
      
      class ActivityContentDetailsSubscription
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :resource_id, as: 'resourceId', class: Google::Apis::YoutubeV3::ResourceId, decorator: Google::Apis::YoutubeV3::ResourceId::Representation
      
        end
      end
      
      class ActivityContentDetailsUpload
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :video_id, as: 'videoId'
        end
      end
      
      class ListActivitiesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :event_id, as: 'eventId'
          collection :items, as: 'items', class: Google::Apis::YoutubeV3::Activity, decorator: Google::Apis::YoutubeV3::Activity::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :page_info, as: 'pageInfo', class: Google::Apis::YoutubeV3::PageInfo, decorator: Google::Apis::YoutubeV3::PageInfo::Representation
      
          property :prev_page_token, as: 'prevPageToken'
          property :token_pagination, as: 'tokenPagination', class: Google::Apis::YoutubeV3::TokenPagination, decorator: Google::Apis::YoutubeV3::TokenPagination::Representation
      
          property :visitor_id, as: 'visitorId'
        end
      end
      
      class ActivitySnippet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :channel_id, as: 'channelId'
          property :channel_title, as: 'channelTitle'
          property :description, as: 'description'
          property :group_id, as: 'groupId'
          property :published_at, as: 'publishedAt', type: DateTime
      
          property :thumbnails, as: 'thumbnails', class: Google::Apis::YoutubeV3::ThumbnailDetails, decorator: Google::Apis::YoutubeV3::ThumbnailDetails::Representation
      
          property :title, as: 'title'
          property :type, as: 'type'
        end
      end
      
      class Caption
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :snippet, as: 'snippet', class: Google::Apis::YoutubeV3::CaptionSnippet, decorator: Google::Apis::YoutubeV3::CaptionSnippet::Representation
      
        end
      end
      
      class ListCaptionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :event_id, as: 'eventId'
          collection :items, as: 'items', class: Google::Apis::YoutubeV3::Caption, decorator: Google::Apis::YoutubeV3::Caption::Representation
      
          property :kind, as: 'kind'
          property :visitor_id, as: 'visitorId'
        end
      end
      
      class CaptionSnippet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :audio_track_type, as: 'audioTrackType'
          property :failure_reason, as: 'failureReason'
          property :is_auto_synced, as: 'isAutoSynced'
          property :is_cc, as: 'isCC'
          property :is_draft, as: 'isDraft'
          property :is_easy_reader, as: 'isEasyReader'
          property :is_large, as: 'isLarge'
          property :language, as: 'language'
          property :last_updated, as: 'lastUpdated', type: DateTime
      
          property :name, as: 'name'
          property :status, as: 'status'
          property :track_kind, as: 'trackKind'
          property :video_id, as: 'videoId'
        end
      end
      
      class CdnSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :format, as: 'format'
          property :frame_rate, as: 'frameRate'
          property :ingestion_info, as: 'ingestionInfo', class: Google::Apis::YoutubeV3::IngestionInfo, decorator: Google::Apis::YoutubeV3::IngestionInfo::Representation
      
          property :ingestion_type, as: 'ingestionType'
          property :resolution, as: 'resolution'
        end
      end
      
      class Channel
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :audit_details, as: 'auditDetails', class: Google::Apis::YoutubeV3::ChannelAuditDetails, decorator: Google::Apis::YoutubeV3::ChannelAuditDetails::Representation
      
          property :branding_settings, as: 'brandingSettings', class: Google::Apis::YoutubeV3::ChannelBrandingSettings, decorator: Google::Apis::YoutubeV3::ChannelBrandingSettings::Representation
      
          property :content_details, as: 'contentDetails', class: Google::Apis::YoutubeV3::ChannelContentDetails, decorator: Google::Apis::YoutubeV3::ChannelContentDetails::Representation
      
          property :content_owner_details, as: 'contentOwnerDetails', class: Google::Apis::YoutubeV3::ChannelContentOwnerDetails, decorator: Google::Apis::YoutubeV3::ChannelContentOwnerDetails::Representation
      
          property :conversion_pings, as: 'conversionPings', class: Google::Apis::YoutubeV3::ChannelConversionPings, decorator: Google::Apis::YoutubeV3::ChannelConversionPings::Representation
      
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :invideo_promotion, as: 'invideoPromotion', class: Google::Apis::YoutubeV3::InvideoPromotion, decorator: Google::Apis::YoutubeV3::InvideoPromotion::Representation
      
          property :kind, as: 'kind'
          hash :localizations, as: 'localizations', class: Google::Apis::YoutubeV3::ChannelLocalization, decorator: Google::Apis::YoutubeV3::ChannelLocalization::Representation
      
          property :snippet, as: 'snippet', class: Google::Apis::YoutubeV3::ChannelSnippet, decorator: Google::Apis::YoutubeV3::ChannelSnippet::Representation
      
          property :statistics, as: 'statistics', class: Google::Apis::YoutubeV3::ChannelStatistics, decorator: Google::Apis::YoutubeV3::ChannelStatistics::Representation
      
          property :status, as: 'status', class: Google::Apis::YoutubeV3::ChannelStatus, decorator: Google::Apis::YoutubeV3::ChannelStatus::Representation
      
          property :topic_details, as: 'topicDetails', class: Google::Apis::YoutubeV3::ChannelTopicDetails, decorator: Google::Apis::YoutubeV3::ChannelTopicDetails::Representation
      
        end
      end
      
      class ChannelAuditDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :community_guidelines_good_standing, as: 'communityGuidelinesGoodStanding'
          property :content_id_claims_good_standing, as: 'contentIdClaimsGoodStanding'
          property :copyright_strikes_good_standing, as: 'copyrightStrikesGoodStanding'
        end
      end
      
      class ChannelBannerResource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :kind, as: 'kind'
          property :url, as: 'url'
        end
      end
      
      class ChannelBrandingSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :channel, as: 'channel', class: Google::Apis::YoutubeV3::ChannelSettings, decorator: Google::Apis::YoutubeV3::ChannelSettings::Representation
      
          collection :hints, as: 'hints', class: Google::Apis::YoutubeV3::PropertyValue, decorator: Google::Apis::YoutubeV3::PropertyValue::Representation
      
          property :image, as: 'image', class: Google::Apis::YoutubeV3::ImageSettings, decorator: Google::Apis::YoutubeV3::ImageSettings::Representation
      
          property :watch, as: 'watch', class: Google::Apis::YoutubeV3::WatchSettings, decorator: Google::Apis::YoutubeV3::WatchSettings::Representation
      
        end
      end
      
      class ChannelContentDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :related_playlists, as: 'relatedPlaylists', class: Google::Apis::YoutubeV3::ChannelContentDetails::RelatedPlaylists, decorator: Google::Apis::YoutubeV3::ChannelContentDetails::RelatedPlaylists::Representation
      
        end
        
        class RelatedPlaylists
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :favorites, as: 'favorites'
            property :likes, as: 'likes'
            property :uploads, as: 'uploads'
            property :watch_history, as: 'watchHistory'
            property :watch_later, as: 'watchLater'
          end
        end
      end
      
      class ChannelContentOwnerDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content_owner, as: 'contentOwner'
          property :time_linked, as: 'timeLinked', type: DateTime
      
        end
      end
      
      class ChannelConversionPing
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :context, as: 'context'
          property :conversion_url, as: 'conversionUrl'
        end
      end
      
      class ChannelConversionPings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :pings, as: 'pings', class: Google::Apis::YoutubeV3::ChannelConversionPing, decorator: Google::Apis::YoutubeV3::ChannelConversionPing::Representation
      
        end
      end
      
      class ListChannelsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :event_id, as: 'eventId'
          collection :items, as: 'items', class: Google::Apis::YoutubeV3::Channel, decorator: Google::Apis::YoutubeV3::Channel::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :page_info, as: 'pageInfo', class: Google::Apis::YoutubeV3::PageInfo, decorator: Google::Apis::YoutubeV3::PageInfo::Representation
      
          property :prev_page_token, as: 'prevPageToken'
          property :token_pagination, as: 'tokenPagination', class: Google::Apis::YoutubeV3::TokenPagination, decorator: Google::Apis::YoutubeV3::TokenPagination::Representation
      
          property :visitor_id, as: 'visitorId'
        end
      end
      
      class ChannelLocalization
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :title, as: 'title'
        end
      end
      
      class ChannelProfileDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :channel_id, as: 'channelId'
          property :channel_url, as: 'channelUrl'
          property :display_name, as: 'displayName'
          property :profile_image_url, as: 'profileImageUrl'
        end
      end
      
      class ChannelSection
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content_details, as: 'contentDetails', class: Google::Apis::YoutubeV3::ChannelSectionContentDetails, decorator: Google::Apis::YoutubeV3::ChannelSectionContentDetails::Representation
      
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :kind, as: 'kind'
          hash :localizations, as: 'localizations', class: Google::Apis::YoutubeV3::ChannelSectionLocalization, decorator: Google::Apis::YoutubeV3::ChannelSectionLocalization::Representation
      
          property :snippet, as: 'snippet', class: Google::Apis::YoutubeV3::ChannelSectionSnippet, decorator: Google::Apis::YoutubeV3::ChannelSectionSnippet::Representation
      
          property :targeting, as: 'targeting', class: Google::Apis::YoutubeV3::ChannelSectionTargeting, decorator: Google::Apis::YoutubeV3::ChannelSectionTargeting::Representation
      
        end
      end
      
      class ChannelSectionContentDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :channels, as: 'channels'
          collection :playlists, as: 'playlists'
        end
      end
      
      class ListChannelSectionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :event_id, as: 'eventId'
          collection :items, as: 'items', class: Google::Apis::YoutubeV3::ChannelSection, decorator: Google::Apis::YoutubeV3::ChannelSection::Representation
      
          property :kind, as: 'kind'
          property :visitor_id, as: 'visitorId'
        end
      end
      
      class ChannelSectionLocalization
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :title, as: 'title'
        end
      end
      
      class ChannelSectionSnippet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :channel_id, as: 'channelId'
          property :default_language, as: 'defaultLanguage'
          property :localized, as: 'localized', class: Google::Apis::YoutubeV3::ChannelSectionLocalization, decorator: Google::Apis::YoutubeV3::ChannelSectionLocalization::Representation
      
          property :position, as: 'position'
          property :style, as: 'style'
          property :title, as: 'title'
          property :type, as: 'type'
        end
      end
      
      class ChannelSectionTargeting
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :countries, as: 'countries'
          collection :languages, as: 'languages'
          collection :regions, as: 'regions'
        end
      end
      
      class ChannelSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :country, as: 'country'
          property :default_language, as: 'defaultLanguage'
          property :default_tab, as: 'defaultTab'
          property :description, as: 'description'
          property :featured_channels_title, as: 'featuredChannelsTitle'
          collection :featured_channels_urls, as: 'featuredChannelsUrls'
          property :keywords, as: 'keywords'
          property :moderate_comments, as: 'moderateComments'
          property :profile_color, as: 'profileColor'
          property :show_browse_view, as: 'showBrowseView'
          property :show_related_channels, as: 'showRelatedChannels'
          property :title, as: 'title'
          property :tracking_analytics_account_id, as: 'trackingAnalyticsAccountId'
          property :unsubscribed_trailer, as: 'unsubscribedTrailer'
        end
      end
      
      class ChannelSnippet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :country, as: 'country'
          property :custom_url, as: 'customUrl'
          property :default_language, as: 'defaultLanguage'
          property :description, as: 'description'
          property :localized, as: 'localized', class: Google::Apis::YoutubeV3::ChannelLocalization, decorator: Google::Apis::YoutubeV3::ChannelLocalization::Representation
      
          property :published_at, as: 'publishedAt', type: DateTime
      
          property :thumbnails, as: 'thumbnails', class: Google::Apis::YoutubeV3::ThumbnailDetails, decorator: Google::Apis::YoutubeV3::ThumbnailDetails::Representation
      
          property :title, as: 'title'
        end
      end
      
      class ChannelStatistics
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :comment_count, :numeric_string => true, as: 'commentCount'
          property :hidden_subscriber_count, as: 'hiddenSubscriberCount'
          property :subscriber_count, :numeric_string => true, as: 'subscriberCount'
          property :video_count, :numeric_string => true, as: 'videoCount'
          property :view_count, :numeric_string => true, as: 'viewCount'
        end
      end
      
      class ChannelStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :is_linked, as: 'isLinked'
          property :long_uploads_status, as: 'longUploadsStatus'
          property :privacy_status, as: 'privacyStatus'
        end
      end
      
      class ChannelTopicDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :topic_categories, as: 'topicCategories'
          collection :topic_ids, as: 'topicIds'
        end
      end
      
      class Comment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :snippet, as: 'snippet', class: Google::Apis::YoutubeV3::CommentSnippet, decorator: Google::Apis::YoutubeV3::CommentSnippet::Representation
      
        end
      end
      
      class ListCommentsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :event_id, as: 'eventId'
          collection :items, as: 'items', class: Google::Apis::YoutubeV3::Comment, decorator: Google::Apis::YoutubeV3::Comment::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :page_info, as: 'pageInfo', class: Google::Apis::YoutubeV3::PageInfo, decorator: Google::Apis::YoutubeV3::PageInfo::Representation
      
          property :token_pagination, as: 'tokenPagination', class: Google::Apis::YoutubeV3::TokenPagination, decorator: Google::Apis::YoutubeV3::TokenPagination::Representation
      
          property :visitor_id, as: 'visitorId'
        end
      end
      
      class CommentSnippet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :author_channel_id, as: 'authorChannelId'
          property :author_channel_url, as: 'authorChannelUrl'
          property :author_display_name, as: 'authorDisplayName'
          property :author_profile_image_url, as: 'authorProfileImageUrl'
          property :can_rate, as: 'canRate'
          property :channel_id, as: 'channelId'
          property :like_count, as: 'likeCount'
          property :moderation_status, as: 'moderationStatus'
          property :parent_id, as: 'parentId'
          property :published_at, as: 'publishedAt', type: DateTime
      
          property :text_display, as: 'textDisplay'
          property :text_original, as: 'textOriginal'
          property :updated_at, as: 'updatedAt', type: DateTime
      
          property :video_id, as: 'videoId'
          property :viewer_rating, as: 'viewerRating'
        end
      end
      
      class CommentThread
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :replies, as: 'replies', class: Google::Apis::YoutubeV3::CommentThreadReplies, decorator: Google::Apis::YoutubeV3::CommentThreadReplies::Representation
      
          property :snippet, as: 'snippet', class: Google::Apis::YoutubeV3::CommentThreadSnippet, decorator: Google::Apis::YoutubeV3::CommentThreadSnippet::Representation
      
        end
      end
      
      class ListCommentThreadsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :event_id, as: 'eventId'
          collection :items, as: 'items', class: Google::Apis::YoutubeV3::CommentThread, decorator: Google::Apis::YoutubeV3::CommentThread::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :page_info, as: 'pageInfo', class: Google::Apis::YoutubeV3::PageInfo, decorator: Google::Apis::YoutubeV3::PageInfo::Representation
      
          property :token_pagination, as: 'tokenPagination', class: Google::Apis::YoutubeV3::TokenPagination, decorator: Google::Apis::YoutubeV3::TokenPagination::Representation
      
          property :visitor_id, as: 'visitorId'
        end
      end
      
      class CommentThreadReplies
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :comments, as: 'comments', class: Google::Apis::YoutubeV3::Comment, decorator: Google::Apis::YoutubeV3::Comment::Representation
      
        end
      end
      
      class CommentThreadSnippet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :can_reply, as: 'canReply'
          property :channel_id, as: 'channelId'
          property :is_public, as: 'isPublic'
          property :top_level_comment, as: 'topLevelComment', class: Google::Apis::YoutubeV3::Comment, decorator: Google::Apis::YoutubeV3::Comment::Representation
      
          property :total_reply_count, as: 'totalReplyCount'
          property :video_id, as: 'videoId'
        end
      end
      
      class ContentRating
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :acb_rating, as: 'acbRating'
          property :agcom_rating, as: 'agcomRating'
          property :anatel_rating, as: 'anatelRating'
          property :bbfc_rating, as: 'bbfcRating'
          property :bfvc_rating, as: 'bfvcRating'
          property :bmukk_rating, as: 'bmukkRating'
          property :catv_rating, as: 'catvRating'
          property :catvfr_rating, as: 'catvfrRating'
          property :cbfc_rating, as: 'cbfcRating'
          property :ccc_rating, as: 'cccRating'
          property :cce_rating, as: 'cceRating'
          property :chfilm_rating, as: 'chfilmRating'
          property :chvrs_rating, as: 'chvrsRating'
          property :cicf_rating, as: 'cicfRating'
          property :cna_rating, as: 'cnaRating'
          property :cnc_rating, as: 'cncRating'
          property :csa_rating, as: 'csaRating'
          property :cscf_rating, as: 'cscfRating'
          property :czfilm_rating, as: 'czfilmRating'
          property :djctq_rating, as: 'djctqRating'
          collection :djctq_rating_reasons, as: 'djctqRatingReasons'
          property :ecbmct_rating, as: 'ecbmctRating'
          property :eefilm_rating, as: 'eefilmRating'
          property :egfilm_rating, as: 'egfilmRating'
          property :eirin_rating, as: 'eirinRating'
          property :fcbm_rating, as: 'fcbmRating'
          property :fco_rating, as: 'fcoRating'
          property :fmoc_rating, as: 'fmocRating'
          property :fpb_rating, as: 'fpbRating'
          collection :fpb_rating_reasons, as: 'fpbRatingReasons'
          property :fsk_rating, as: 'fskRating'
          property :grfilm_rating, as: 'grfilmRating'
          property :icaa_rating, as: 'icaaRating'
          property :ifco_rating, as: 'ifcoRating'
          property :ilfilm_rating, as: 'ilfilmRating'
          property :incaa_rating, as: 'incaaRating'
          property :kfcb_rating, as: 'kfcbRating'
          property :kijkwijzer_rating, as: 'kijkwijzerRating'
          property :kmrb_rating, as: 'kmrbRating'
          property :lsf_rating, as: 'lsfRating'
          property :mccaa_rating, as: 'mccaaRating'
          property :mccyp_rating, as: 'mccypRating'
          property :mcst_rating, as: 'mcstRating'
          property :mda_rating, as: 'mdaRating'
          property :medietilsynet_rating, as: 'medietilsynetRating'
          property :meku_rating, as: 'mekuRating'
          property :mena_mpaa_rating, as: 'menaMpaaRating'
          property :mibac_rating, as: 'mibacRating'
          property :moc_rating, as: 'mocRating'
          property :moctw_rating, as: 'moctwRating'
          property :mpaa_rating, as: 'mpaaRating'
          property :mpaat_rating, as: 'mpaatRating'
          property :mtrcb_rating, as: 'mtrcbRating'
          property :nbc_rating, as: 'nbcRating'
          property :nbcpl_rating, as: 'nbcplRating'
          property :nfrc_rating, as: 'nfrcRating'
          property :nfvcb_rating, as: 'nfvcbRating'
          property :nkclv_rating, as: 'nkclvRating'
          property :nmc_rating, as: 'nmcRating'
          property :oflc_rating, as: 'oflcRating'
          property :pefilm_rating, as: 'pefilmRating'
          property :rcnof_rating, as: 'rcnofRating'
          property :resorteviolencia_rating, as: 'resorteviolenciaRating'
          property :rtc_rating, as: 'rtcRating'
          property :rte_rating, as: 'rteRating'
          property :russia_rating, as: 'russiaRating'
          property :skfilm_rating, as: 'skfilmRating'
          property :smais_rating, as: 'smaisRating'
          property :smsa_rating, as: 'smsaRating'
          property :tvpg_rating, as: 'tvpgRating'
          property :yt_rating, as: 'ytRating'
        end
      end
      
      class GeoPoint
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :altitude, as: 'altitude'
          property :latitude, as: 'latitude'
          property :longitude, as: 'longitude'
        end
      end
      
      class GuideCategory
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :snippet, as: 'snippet', class: Google::Apis::YoutubeV3::GuideCategorySnippet, decorator: Google::Apis::YoutubeV3::GuideCategorySnippet::Representation
      
        end
      end
      
      class ListGuideCategoriesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :event_id, as: 'eventId'
          collection :items, as: 'items', class: Google::Apis::YoutubeV3::GuideCategory, decorator: Google::Apis::YoutubeV3::GuideCategory::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :page_info, as: 'pageInfo', class: Google::Apis::YoutubeV3::PageInfo, decorator: Google::Apis::YoutubeV3::PageInfo::Representation
      
          property :prev_page_token, as: 'prevPageToken'
          property :token_pagination, as: 'tokenPagination', class: Google::Apis::YoutubeV3::TokenPagination, decorator: Google::Apis::YoutubeV3::TokenPagination::Representation
      
          property :visitor_id, as: 'visitorId'
        end
      end
      
      class GuideCategorySnippet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :channel_id, as: 'channelId'
          property :title, as: 'title'
        end
      end
      
      class I18nLanguage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :snippet, as: 'snippet', class: Google::Apis::YoutubeV3::I18nLanguageSnippet, decorator: Google::Apis::YoutubeV3::I18nLanguageSnippet::Representation
      
        end
      end
      
      class ListI18nLanguagesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :event_id, as: 'eventId'
          collection :items, as: 'items', class: Google::Apis::YoutubeV3::I18nLanguage, decorator: Google::Apis::YoutubeV3::I18nLanguage::Representation
      
          property :kind, as: 'kind'
          property :visitor_id, as: 'visitorId'
        end
      end
      
      class I18nLanguageSnippet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :hl, as: 'hl'
          property :name, as: 'name'
        end
      end
      
      class I18nRegion
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :snippet, as: 'snippet', class: Google::Apis::YoutubeV3::I18nRegionSnippet, decorator: Google::Apis::YoutubeV3::I18nRegionSnippet::Representation
      
        end
      end
      
      class ListI18nRegionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :event_id, as: 'eventId'
          collection :items, as: 'items', class: Google::Apis::YoutubeV3::I18nRegion, decorator: Google::Apis::YoutubeV3::I18nRegion::Representation
      
          property :kind, as: 'kind'
          property :visitor_id, as: 'visitorId'
        end
      end
      
      class I18nRegionSnippet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :gl, as: 'gl'
          property :name, as: 'name'
        end
      end
      
      class ImageSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :background_image_url, as: 'backgroundImageUrl', class: Google::Apis::YoutubeV3::LocalizedProperty, decorator: Google::Apis::YoutubeV3::LocalizedProperty::Representation
      
          property :banner_external_url, as: 'bannerExternalUrl'
          property :banner_image_url, as: 'bannerImageUrl'
          property :banner_mobile_extra_hd_image_url, as: 'bannerMobileExtraHdImageUrl'
          property :banner_mobile_hd_image_url, as: 'bannerMobileHdImageUrl'
          property :banner_mobile_image_url, as: 'bannerMobileImageUrl'
          property :banner_mobile_low_image_url, as: 'bannerMobileLowImageUrl'
          property :banner_mobile_medium_hd_image_url, as: 'bannerMobileMediumHdImageUrl'
          property :banner_tablet_extra_hd_image_url, as: 'bannerTabletExtraHdImageUrl'
          property :banner_tablet_hd_image_url, as: 'bannerTabletHdImageUrl'
          property :banner_tablet_image_url, as: 'bannerTabletImageUrl'
          property :banner_tablet_low_image_url, as: 'bannerTabletLowImageUrl'
          property :banner_tv_high_image_url, as: 'bannerTvHighImageUrl'
          property :banner_tv_image_url, as: 'bannerTvImageUrl'
          property :banner_tv_low_image_url, as: 'bannerTvLowImageUrl'
          property :banner_tv_medium_image_url, as: 'bannerTvMediumImageUrl'
          property :large_branded_banner_image_imap_script, as: 'largeBrandedBannerImageImapScript', class: Google::Apis::YoutubeV3::LocalizedProperty, decorator: Google::Apis::YoutubeV3::LocalizedProperty::Representation
      
          property :large_branded_banner_image_url, as: 'largeBrandedBannerImageUrl', class: Google::Apis::YoutubeV3::LocalizedProperty, decorator: Google::Apis::YoutubeV3::LocalizedProperty::Representation
      
          property :small_branded_banner_image_imap_script, as: 'smallBrandedBannerImageImapScript', class: Google::Apis::YoutubeV3::LocalizedProperty, decorator: Google::Apis::YoutubeV3::LocalizedProperty::Representation
      
          property :small_branded_banner_image_url, as: 'smallBrandedBannerImageUrl', class: Google::Apis::YoutubeV3::LocalizedProperty, decorator: Google::Apis::YoutubeV3::LocalizedProperty::Representation
      
          property :tracking_image_url, as: 'trackingImageUrl'
          property :watch_icon_image_url, as: 'watchIconImageUrl'
        end
      end
      
      class IngestionInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :backup_ingestion_address, as: 'backupIngestionAddress'
          property :ingestion_address, as: 'ingestionAddress'
          property :stream_name, as: 'streamName'
        end
      end
      
      class InvideoBranding
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :image_bytes, :base64 => true, as: 'imageBytes'
          property :image_url, as: 'imageUrl'
          property :position, as: 'position', class: Google::Apis::YoutubeV3::InvideoPosition, decorator: Google::Apis::YoutubeV3::InvideoPosition::Representation
      
          property :target_channel_id, as: 'targetChannelId'
          property :timing, as: 'timing', class: Google::Apis::YoutubeV3::InvideoTiming, decorator: Google::Apis::YoutubeV3::InvideoTiming::Representation
      
        end
      end
      
      class InvideoPosition
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :corner_position, as: 'cornerPosition'
          property :type, as: 'type'
        end
      end
      
      class InvideoPromotion
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :default_timing, as: 'defaultTiming', class: Google::Apis::YoutubeV3::InvideoTiming, decorator: Google::Apis::YoutubeV3::InvideoTiming::Representation
      
          collection :items, as: 'items', class: Google::Apis::YoutubeV3::PromotedItem, decorator: Google::Apis::YoutubeV3::PromotedItem::Representation
      
          property :position, as: 'position', class: Google::Apis::YoutubeV3::InvideoPosition, decorator: Google::Apis::YoutubeV3::InvideoPosition::Representation
      
          property :use_smart_timing, as: 'useSmartTiming'
        end
      end
      
      class InvideoTiming
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :duration_ms, :numeric_string => true, as: 'durationMs'
          property :offset_ms, :numeric_string => true, as: 'offsetMs'
          property :type, as: 'type'
        end
      end
      
      class LanguageTag
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :value, as: 'value'
        end
      end
      
      class LevelDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_name, as: 'displayName'
        end
      end
      
      class LiveBroadcast
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content_details, as: 'contentDetails', class: Google::Apis::YoutubeV3::LiveBroadcastContentDetails, decorator: Google::Apis::YoutubeV3::LiveBroadcastContentDetails::Representation
      
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :snippet, as: 'snippet', class: Google::Apis::YoutubeV3::LiveBroadcastSnippet, decorator: Google::Apis::YoutubeV3::LiveBroadcastSnippet::Representation
      
          property :statistics, as: 'statistics', class: Google::Apis::YoutubeV3::LiveBroadcastStatistics, decorator: Google::Apis::YoutubeV3::LiveBroadcastStatistics::Representation
      
          property :status, as: 'status', class: Google::Apis::YoutubeV3::LiveBroadcastStatus, decorator: Google::Apis::YoutubeV3::LiveBroadcastStatus::Representation
      
        end
      end
      
      class LiveBroadcastContentDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bound_stream_id, as: 'boundStreamId'
          property :bound_stream_last_update_time_ms, as: 'boundStreamLastUpdateTimeMs', type: DateTime
      
          property :closed_captions_type, as: 'closedCaptionsType'
          property :enable_auto_start, as: 'enableAutoStart'
          property :enable_closed_captions, as: 'enableClosedCaptions'
          property :enable_content_encryption, as: 'enableContentEncryption'
          property :enable_dvr, as: 'enableDvr'
          property :enable_embed, as: 'enableEmbed'
          property :enable_low_latency, as: 'enableLowLatency'
          property :latency_preference, as: 'latencyPreference'
          property :mesh, :base64 => true, as: 'mesh'
          property :monitor_stream, as: 'monitorStream', class: Google::Apis::YoutubeV3::MonitorStreamInfo, decorator: Google::Apis::YoutubeV3::MonitorStreamInfo::Representation
      
          property :projection, as: 'projection'
          property :record_from_start, as: 'recordFromStart'
          property :start_with_slate, as: 'startWithSlate'
          property :stereo_layout, as: 'stereoLayout'
        end
      end
      
      class ListLiveBroadcastsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :event_id, as: 'eventId'
          collection :items, as: 'items', class: Google::Apis::YoutubeV3::LiveBroadcast, decorator: Google::Apis::YoutubeV3::LiveBroadcast::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :page_info, as: 'pageInfo', class: Google::Apis::YoutubeV3::PageInfo, decorator: Google::Apis::YoutubeV3::PageInfo::Representation
      
          property :prev_page_token, as: 'prevPageToken'
          property :token_pagination, as: 'tokenPagination', class: Google::Apis::YoutubeV3::TokenPagination, decorator: Google::Apis::YoutubeV3::TokenPagination::Representation
      
          property :visitor_id, as: 'visitorId'
        end
      end
      
      class LiveBroadcastSnippet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :actual_end_time, as: 'actualEndTime', type: DateTime
      
          property :actual_start_time, as: 'actualStartTime', type: DateTime
      
          property :broadcast_type, as: 'broadcastType'
          property :channel_id, as: 'channelId'
          property :description, as: 'description'
          property :is_default_broadcast, as: 'isDefaultBroadcast'
          property :live_chat_id, as: 'liveChatId'
          property :published_at, as: 'publishedAt', type: DateTime
      
          property :scheduled_end_time, as: 'scheduledEndTime', type: DateTime
      
          property :scheduled_start_time, as: 'scheduledStartTime', type: DateTime
      
          property :thumbnails, as: 'thumbnails', class: Google::Apis::YoutubeV3::ThumbnailDetails, decorator: Google::Apis::YoutubeV3::ThumbnailDetails::Representation
      
          property :title, as: 'title'
        end
      end
      
      class LiveBroadcastStatistics
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :concurrent_viewers, :numeric_string => true, as: 'concurrentViewers'
          property :total_chat_count, :numeric_string => true, as: 'totalChatCount'
        end
      end
      
      class LiveBroadcastStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :life_cycle_status, as: 'lifeCycleStatus'
          property :live_broadcast_priority, as: 'liveBroadcastPriority'
          property :privacy_status, as: 'privacyStatus'
          property :recording_status, as: 'recordingStatus'
        end
      end
      
      class LiveChatBan
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :snippet, as: 'snippet', class: Google::Apis::YoutubeV3::LiveChatBanSnippet, decorator: Google::Apis::YoutubeV3::LiveChatBanSnippet::Representation
      
        end
      end
      
      class LiveChatBanSnippet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ban_duration_seconds, :numeric_string => true, as: 'banDurationSeconds'
          property :banned_user_details, as: 'bannedUserDetails', class: Google::Apis::YoutubeV3::ChannelProfileDetails, decorator: Google::Apis::YoutubeV3::ChannelProfileDetails::Representation
      
          property :live_chat_id, as: 'liveChatId'
          property :type, as: 'type'
        end
      end
      
      class LiveChatFanFundingEventDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :amount_display_string, as: 'amountDisplayString'
          property :amount_micros, :numeric_string => true, as: 'amountMicros'
          property :currency, as: 'currency'
          property :user_comment, as: 'userComment'
        end
      end
      
      class LiveChatMessage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :author_details, as: 'authorDetails', class: Google::Apis::YoutubeV3::LiveChatMessageAuthorDetails, decorator: Google::Apis::YoutubeV3::LiveChatMessageAuthorDetails::Representation
      
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :snippet, as: 'snippet', class: Google::Apis::YoutubeV3::LiveChatMessageSnippet, decorator: Google::Apis::YoutubeV3::LiveChatMessageSnippet::Representation
      
        end
      end
      
      class LiveChatMessageAuthorDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :channel_id, as: 'channelId'
          property :channel_url, as: 'channelUrl'
          property :display_name, as: 'displayName'
          property :is_chat_moderator, as: 'isChatModerator'
          property :is_chat_owner, as: 'isChatOwner'
          property :is_chat_sponsor, as: 'isChatSponsor'
          property :is_verified, as: 'isVerified'
          property :profile_image_url, as: 'profileImageUrl'
        end
      end
      
      class LiveChatMessageDeletedDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :deleted_message_id, as: 'deletedMessageId'
        end
      end
      
      class LiveChatMessageListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :event_id, as: 'eventId'
          collection :items, as: 'items', class: Google::Apis::YoutubeV3::LiveChatMessage, decorator: Google::Apis::YoutubeV3::LiveChatMessage::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :offline_at, as: 'offlineAt', type: DateTime
      
          property :page_info, as: 'pageInfo', class: Google::Apis::YoutubeV3::PageInfo, decorator: Google::Apis::YoutubeV3::PageInfo::Representation
      
          property :polling_interval_millis, as: 'pollingIntervalMillis'
          property :token_pagination, as: 'tokenPagination', class: Google::Apis::YoutubeV3::TokenPagination, decorator: Google::Apis::YoutubeV3::TokenPagination::Representation
      
          property :visitor_id, as: 'visitorId'
        end
      end
      
      class LiveChatMessageRetractedDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :retracted_message_id, as: 'retractedMessageId'
        end
      end
      
      class LiveChatMessageSnippet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :author_channel_id, as: 'authorChannelId'
          property :display_message, as: 'displayMessage'
          property :fan_funding_event_details, as: 'fanFundingEventDetails', class: Google::Apis::YoutubeV3::LiveChatFanFundingEventDetails, decorator: Google::Apis::YoutubeV3::LiveChatFanFundingEventDetails::Representation
      
          property :has_display_content, as: 'hasDisplayContent'
          property :live_chat_id, as: 'liveChatId'
          property :message_deleted_details, as: 'messageDeletedDetails', class: Google::Apis::YoutubeV3::LiveChatMessageDeletedDetails, decorator: Google::Apis::YoutubeV3::LiveChatMessageDeletedDetails::Representation
      
          property :message_retracted_details, as: 'messageRetractedDetails', class: Google::Apis::YoutubeV3::LiveChatMessageRetractedDetails, decorator: Google::Apis::YoutubeV3::LiveChatMessageRetractedDetails::Representation
      
          property :poll_closed_details, as: 'pollClosedDetails', class: Google::Apis::YoutubeV3::LiveChatPollClosedDetails, decorator: Google::Apis::YoutubeV3::LiveChatPollClosedDetails::Representation
      
          property :poll_edited_details, as: 'pollEditedDetails', class: Google::Apis::YoutubeV3::LiveChatPollEditedDetails, decorator: Google::Apis::YoutubeV3::LiveChatPollEditedDetails::Representation
      
          property :poll_opened_details, as: 'pollOpenedDetails', class: Google::Apis::YoutubeV3::LiveChatPollOpenedDetails, decorator: Google::Apis::YoutubeV3::LiveChatPollOpenedDetails::Representation
      
          property :poll_voted_details, as: 'pollVotedDetails', class: Google::Apis::YoutubeV3::LiveChatPollVotedDetails, decorator: Google::Apis::YoutubeV3::LiveChatPollVotedDetails::Representation
      
          property :published_at, as: 'publishedAt', type: DateTime
      
          property :super_chat_details, as: 'superChatDetails', class: Google::Apis::YoutubeV3::LiveChatSuperChatDetails, decorator: Google::Apis::YoutubeV3::LiveChatSuperChatDetails::Representation
      
          property :super_sticker_details, as: 'superStickerDetails', class: Google::Apis::YoutubeV3::LiveChatSuperStickerDetails, decorator: Google::Apis::YoutubeV3::LiveChatSuperStickerDetails::Representation
      
          property :text_message_details, as: 'textMessageDetails', class: Google::Apis::YoutubeV3::LiveChatTextMessageDetails, decorator: Google::Apis::YoutubeV3::LiveChatTextMessageDetails::Representation
      
          property :type, as: 'type'
          property :user_banned_details, as: 'userBannedDetails', class: Google::Apis::YoutubeV3::LiveChatUserBannedMessageDetails, decorator: Google::Apis::YoutubeV3::LiveChatUserBannedMessageDetails::Representation
      
        end
      end
      
      class LiveChatModerator
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :snippet, as: 'snippet', class: Google::Apis::YoutubeV3::LiveChatModeratorSnippet, decorator: Google::Apis::YoutubeV3::LiveChatModeratorSnippet::Representation
      
        end
      end
      
      class LiveChatModeratorListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :event_id, as: 'eventId'
          collection :items, as: 'items', class: Google::Apis::YoutubeV3::LiveChatModerator, decorator: Google::Apis::YoutubeV3::LiveChatModerator::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :page_info, as: 'pageInfo', class: Google::Apis::YoutubeV3::PageInfo, decorator: Google::Apis::YoutubeV3::PageInfo::Representation
      
          property :prev_page_token, as: 'prevPageToken'
          property :token_pagination, as: 'tokenPagination', class: Google::Apis::YoutubeV3::TokenPagination, decorator: Google::Apis::YoutubeV3::TokenPagination::Representation
      
          property :visitor_id, as: 'visitorId'
        end
      end
      
      class LiveChatModeratorSnippet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :live_chat_id, as: 'liveChatId'
          property :moderator_details, as: 'moderatorDetails', class: Google::Apis::YoutubeV3::ChannelProfileDetails, decorator: Google::Apis::YoutubeV3::ChannelProfileDetails::Representation
      
        end
      end
      
      class LiveChatPollClosedDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :poll_id, as: 'pollId'
        end
      end
      
      class LiveChatPollEditedDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::YoutubeV3::LiveChatPollItem, decorator: Google::Apis::YoutubeV3::LiveChatPollItem::Representation
      
          property :prompt, as: 'prompt'
        end
      end
      
      class LiveChatPollItem
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :item_id, as: 'itemId'
        end
      end
      
      class LiveChatPollOpenedDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::YoutubeV3::LiveChatPollItem, decorator: Google::Apis::YoutubeV3::LiveChatPollItem::Representation
      
          property :prompt, as: 'prompt'
        end
      end
      
      class LiveChatPollVotedDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :item_id, as: 'itemId'
          property :poll_id, as: 'pollId'
        end
      end
      
      class LiveChatSuperChatDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :amount_display_string, as: 'amountDisplayString'
          property :amount_micros, :numeric_string => true, as: 'amountMicros'
          property :currency, as: 'currency'
          property :tier, as: 'tier'
          property :user_comment, as: 'userComment'
        end
      end
      
      class LiveChatSuperStickerDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :amount_display_string, as: 'amountDisplayString'
          property :amount_micros, :numeric_string => true, as: 'amountMicros'
          property :currency, as: 'currency'
          property :super_sticker_metadata, as: 'superStickerMetadata', class: Google::Apis::YoutubeV3::SuperStickerMetadata, decorator: Google::Apis::YoutubeV3::SuperStickerMetadata::Representation
      
          property :tier, as: 'tier'
        end
      end
      
      class LiveChatTextMessageDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :message_text, as: 'messageText'
        end
      end
      
      class LiveChatUserBannedMessageDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ban_duration_seconds, :numeric_string => true, as: 'banDurationSeconds'
          property :ban_type, as: 'banType'
          property :banned_user_details, as: 'bannedUserDetails', class: Google::Apis::YoutubeV3::ChannelProfileDetails, decorator: Google::Apis::YoutubeV3::ChannelProfileDetails::Representation
      
        end
      end
      
      class LiveStream
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cdn, as: 'cdn', class: Google::Apis::YoutubeV3::CdnSettings, decorator: Google::Apis::YoutubeV3::CdnSettings::Representation
      
          property :content_details, as: 'contentDetails', class: Google::Apis::YoutubeV3::LiveStreamContentDetails, decorator: Google::Apis::YoutubeV3::LiveStreamContentDetails::Representation
      
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :snippet, as: 'snippet', class: Google::Apis::YoutubeV3::LiveStreamSnippet, decorator: Google::Apis::YoutubeV3::LiveStreamSnippet::Representation
      
          property :status, as: 'status', class: Google::Apis::YoutubeV3::LiveStreamStatus, decorator: Google::Apis::YoutubeV3::LiveStreamStatus::Representation
      
        end
      end
      
      class LiveStreamConfigurationIssue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :reason, as: 'reason'
          property :severity, as: 'severity'
          property :type, as: 'type'
        end
      end
      
      class LiveStreamContentDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :closed_captions_ingestion_url, as: 'closedCaptionsIngestionUrl'
          property :is_reusable, as: 'isReusable'
        end
      end
      
      class LiveStreamHealthStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :configuration_issues, as: 'configurationIssues', class: Google::Apis::YoutubeV3::LiveStreamConfigurationIssue, decorator: Google::Apis::YoutubeV3::LiveStreamConfigurationIssue::Representation
      
          property :last_update_time_seconds, :numeric_string => true, as: 'lastUpdateTimeSeconds'
          property :status, as: 'status'
        end
      end
      
      class ListLiveStreamsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :event_id, as: 'eventId'
          collection :items, as: 'items', class: Google::Apis::YoutubeV3::LiveStream, decorator: Google::Apis::YoutubeV3::LiveStream::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :page_info, as: 'pageInfo', class: Google::Apis::YoutubeV3::PageInfo, decorator: Google::Apis::YoutubeV3::PageInfo::Representation
      
          property :prev_page_token, as: 'prevPageToken'
          property :token_pagination, as: 'tokenPagination', class: Google::Apis::YoutubeV3::TokenPagination, decorator: Google::Apis::YoutubeV3::TokenPagination::Representation
      
          property :visitor_id, as: 'visitorId'
        end
      end
      
      class LiveStreamSnippet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :channel_id, as: 'channelId'
          property :description, as: 'description'
          property :is_default_stream, as: 'isDefaultStream'
          property :published_at, as: 'publishedAt', type: DateTime
      
          property :title, as: 'title'
        end
      end
      
      class LiveStreamStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :health_status, as: 'healthStatus', class: Google::Apis::YoutubeV3::LiveStreamHealthStatus, decorator: Google::Apis::YoutubeV3::LiveStreamHealthStatus::Representation
      
          property :stream_status, as: 'streamStatus'
        end
      end
      
      class LocalizedProperty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :default, as: 'default'
          property :default_language, as: 'defaultLanguage', class: Google::Apis::YoutubeV3::LanguageTag, decorator: Google::Apis::YoutubeV3::LanguageTag::Representation
      
          collection :localized, as: 'localized', class: Google::Apis::YoutubeV3::LocalizedString, decorator: Google::Apis::YoutubeV3::LocalizedString::Representation
      
        end
      end
      
      class LocalizedString
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :language, as: 'language'
          property :value, as: 'value'
        end
      end
      
      class Member
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :snippet, as: 'snippet', class: Google::Apis::YoutubeV3::MemberSnippet, decorator: Google::Apis::YoutubeV3::MemberSnippet::Representation
      
        end
      end
      
      class MemberListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :event_id, as: 'eventId'
          collection :items, as: 'items', class: Google::Apis::YoutubeV3::Member, decorator: Google::Apis::YoutubeV3::Member::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :page_info, as: 'pageInfo', class: Google::Apis::YoutubeV3::PageInfo, decorator: Google::Apis::YoutubeV3::PageInfo::Representation
      
          property :token_pagination, as: 'tokenPagination', class: Google::Apis::YoutubeV3::TokenPagination, decorator: Google::Apis::YoutubeV3::TokenPagination::Representation
      
          property :visitor_id, as: 'visitorId'
        end
      end
      
      class MemberSnippet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creator_channel_id, as: 'creatorChannelId'
          property :member_details, as: 'memberDetails', class: Google::Apis::YoutubeV3::ChannelProfileDetails, decorator: Google::Apis::YoutubeV3::ChannelProfileDetails::Representation
      
          property :memberships_details, as: 'membershipsDetails', class: Google::Apis::YoutubeV3::MembershipsDetails, decorator: Google::Apis::YoutubeV3::MembershipsDetails::Representation
      
        end
      end
      
      class MembershipsDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :accessible_levels, as: 'accessibleLevels'
          property :member_since, as: 'memberSince'
          property :member_since_current_level, as: 'memberSinceCurrentLevel'
          property :member_total_duration, as: 'memberTotalDuration'
          property :member_total_duration_current_level, as: 'memberTotalDurationCurrentLevel'
          property :purchased_level, as: 'purchasedLevel'
        end
      end
      
      class MembershipsLevel
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :snippet, as: 'snippet', class: Google::Apis::YoutubeV3::MembershipsLevelSnippet, decorator: Google::Apis::YoutubeV3::MembershipsLevelSnippet::Representation
      
        end
      end
      
      class MembershipsLevelListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :event_id, as: 'eventId'
          collection :items, as: 'items', class: Google::Apis::YoutubeV3::MembershipsLevel, decorator: Google::Apis::YoutubeV3::MembershipsLevel::Representation
      
          property :kind, as: 'kind'
          property :visitor_id, as: 'visitorId'
        end
      end
      
      class MembershipsLevelSnippet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creator_channel_id, as: 'creatorChannelId'
          property :level_details, as: 'levelDetails', class: Google::Apis::YoutubeV3::LevelDetails, decorator: Google::Apis::YoutubeV3::LevelDetails::Representation
      
        end
      end
      
      class MonitorStreamInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :broadcast_stream_delay_ms, as: 'broadcastStreamDelayMs'
          property :embed_html, as: 'embedHtml'
          property :enable_monitor_stream, as: 'enableMonitorStream'
        end
      end
      
      class Nonprofit
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :nonprofit_id, as: 'nonprofitId', class: Google::Apis::YoutubeV3::NonprofitId, decorator: Google::Apis::YoutubeV3::NonprofitId::Representation
      
          property :nonprofit_legal_name, as: 'nonprofitLegalName'
        end
      end
      
      class NonprofitId
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :value, as: 'value'
        end
      end
      
      class PageInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :results_per_page, as: 'resultsPerPage'
          property :total_results, as: 'totalResults'
        end
      end
      
      class Playlist
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content_details, as: 'contentDetails', class: Google::Apis::YoutubeV3::PlaylistContentDetails, decorator: Google::Apis::YoutubeV3::PlaylistContentDetails::Representation
      
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :kind, as: 'kind'
          hash :localizations, as: 'localizations', class: Google::Apis::YoutubeV3::PlaylistLocalization, decorator: Google::Apis::YoutubeV3::PlaylistLocalization::Representation
      
          property :player, as: 'player', class: Google::Apis::YoutubeV3::PlaylistPlayer, decorator: Google::Apis::YoutubeV3::PlaylistPlayer::Representation
      
          property :snippet, as: 'snippet', class: Google::Apis::YoutubeV3::PlaylistSnippet, decorator: Google::Apis::YoutubeV3::PlaylistSnippet::Representation
      
          property :status, as: 'status', class: Google::Apis::YoutubeV3::PlaylistStatus, decorator: Google::Apis::YoutubeV3::PlaylistStatus::Representation
      
        end
      end
      
      class PlaylistContentDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :item_count, as: 'itemCount'
        end
      end
      
      class PlaylistItem
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content_details, as: 'contentDetails', class: Google::Apis::YoutubeV3::PlaylistItemContentDetails, decorator: Google::Apis::YoutubeV3::PlaylistItemContentDetails::Representation
      
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :snippet, as: 'snippet', class: Google::Apis::YoutubeV3::PlaylistItemSnippet, decorator: Google::Apis::YoutubeV3::PlaylistItemSnippet::Representation
      
          property :status, as: 'status', class: Google::Apis::YoutubeV3::PlaylistItemStatus, decorator: Google::Apis::YoutubeV3::PlaylistItemStatus::Representation
      
        end
      end
      
      class PlaylistItemContentDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_at, as: 'endAt'
          property :note, as: 'note'
          property :start_at, as: 'startAt'
          property :video_id, as: 'videoId'
          property :video_published_at, as: 'videoPublishedAt', type: DateTime
      
        end
      end
      
      class ListPlaylistItemsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :event_id, as: 'eventId'
          collection :items, as: 'items', class: Google::Apis::YoutubeV3::PlaylistItem, decorator: Google::Apis::YoutubeV3::PlaylistItem::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :page_info, as: 'pageInfo', class: Google::Apis::YoutubeV3::PageInfo, decorator: Google::Apis::YoutubeV3::PageInfo::Representation
      
          property :prev_page_token, as: 'prevPageToken'
          property :token_pagination, as: 'tokenPagination', class: Google::Apis::YoutubeV3::TokenPagination, decorator: Google::Apis::YoutubeV3::TokenPagination::Representation
      
          property :visitor_id, as: 'visitorId'
        end
      end
      
      class PlaylistItemSnippet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :channel_id, as: 'channelId'
          property :channel_title, as: 'channelTitle'
          property :description, as: 'description'
          property :playlist_id, as: 'playlistId'
          property :position, as: 'position'
          property :published_at, as: 'publishedAt', type: DateTime
      
          property :resource_id, as: 'resourceId', class: Google::Apis::YoutubeV3::ResourceId, decorator: Google::Apis::YoutubeV3::ResourceId::Representation
      
          property :thumbnails, as: 'thumbnails', class: Google::Apis::YoutubeV3::ThumbnailDetails, decorator: Google::Apis::YoutubeV3::ThumbnailDetails::Representation
      
          property :title, as: 'title'
        end
      end
      
      class PlaylistItemStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :privacy_status, as: 'privacyStatus'
        end
      end
      
      class ListPlaylistResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :event_id, as: 'eventId'
          collection :items, as: 'items', class: Google::Apis::YoutubeV3::Playlist, decorator: Google::Apis::YoutubeV3::Playlist::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :page_info, as: 'pageInfo', class: Google::Apis::YoutubeV3::PageInfo, decorator: Google::Apis::YoutubeV3::PageInfo::Representation
      
          property :prev_page_token, as: 'prevPageToken'
          property :token_pagination, as: 'tokenPagination', class: Google::Apis::YoutubeV3::TokenPagination, decorator: Google::Apis::YoutubeV3::TokenPagination::Representation
      
          property :visitor_id, as: 'visitorId'
        end
      end
      
      class PlaylistLocalization
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :title, as: 'title'
        end
      end
      
      class PlaylistPlayer
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :embed_html, as: 'embedHtml'
        end
      end
      
      class PlaylistSnippet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :channel_id, as: 'channelId'
          property :channel_title, as: 'channelTitle'
          property :default_language, as: 'defaultLanguage'
          property :description, as: 'description'
          property :localized, as: 'localized', class: Google::Apis::YoutubeV3::PlaylistLocalization, decorator: Google::Apis::YoutubeV3::PlaylistLocalization::Representation
      
          property :published_at, as: 'publishedAt', type: DateTime
      
          collection :tags, as: 'tags'
          property :thumbnails, as: 'thumbnails', class: Google::Apis::YoutubeV3::ThumbnailDetails, decorator: Google::Apis::YoutubeV3::ThumbnailDetails::Representation
      
          property :title, as: 'title'
        end
      end
      
      class PlaylistStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :privacy_status, as: 'privacyStatus'
        end
      end
      
      class PromotedItem
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :custom_message, as: 'customMessage'
          property :id, as: 'id', class: Google::Apis::YoutubeV3::PromotedItemId, decorator: Google::Apis::YoutubeV3::PromotedItemId::Representation
      
          property :promoted_by_content_owner, as: 'promotedByContentOwner'
          property :timing, as: 'timing', class: Google::Apis::YoutubeV3::InvideoTiming, decorator: Google::Apis::YoutubeV3::InvideoTiming::Representation
      
        end
      end
      
      class PromotedItemId
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :recently_uploaded_by, as: 'recentlyUploadedBy'
          property :type, as: 'type'
          property :video_id, as: 'videoId'
          property :website_url, as: 'websiteUrl'
        end
      end
      
      class PropertyValue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :property, as: 'property'
          property :value, as: 'value'
        end
      end
      
      class ResourceId
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :channel_id, as: 'channelId'
          property :kind, as: 'kind'
          property :playlist_id, as: 'playlistId'
          property :video_id, as: 'videoId'
        end
      end
      
      class SearchListsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :event_id, as: 'eventId'
          collection :items, as: 'items', class: Google::Apis::YoutubeV3::SearchResult, decorator: Google::Apis::YoutubeV3::SearchResult::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :page_info, as: 'pageInfo', class: Google::Apis::YoutubeV3::PageInfo, decorator: Google::Apis::YoutubeV3::PageInfo::Representation
      
          property :prev_page_token, as: 'prevPageToken'
          property :region_code, as: 'regionCode'
          property :token_pagination, as: 'tokenPagination', class: Google::Apis::YoutubeV3::TokenPagination, decorator: Google::Apis::YoutubeV3::TokenPagination::Representation
      
          property :visitor_id, as: 'visitorId'
        end
      end
      
      class SearchResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :id, as: 'id', class: Google::Apis::YoutubeV3::ResourceId, decorator: Google::Apis::YoutubeV3::ResourceId::Representation
      
          property :kind, as: 'kind'
          property :snippet, as: 'snippet', class: Google::Apis::YoutubeV3::SearchResultSnippet, decorator: Google::Apis::YoutubeV3::SearchResultSnippet::Representation
      
        end
      end
      
      class SearchResultSnippet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :channel_id, as: 'channelId'
          property :channel_title, as: 'channelTitle'
          property :description, as: 'description'
          property :live_broadcast_content, as: 'liveBroadcastContent'
          property :published_at, as: 'publishedAt', type: DateTime
      
          property :thumbnails, as: 'thumbnails', class: Google::Apis::YoutubeV3::ThumbnailDetails, decorator: Google::Apis::YoutubeV3::ThumbnailDetails::Representation
      
          property :title, as: 'title'
        end
      end
      
      class Sponsor
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :kind, as: 'kind'
          property :snippet, as: 'snippet', class: Google::Apis::YoutubeV3::SponsorSnippet, decorator: Google::Apis::YoutubeV3::SponsorSnippet::Representation
      
        end
      end
      
      class SponsorListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :event_id, as: 'eventId'
          collection :items, as: 'items', class: Google::Apis::YoutubeV3::Sponsor, decorator: Google::Apis::YoutubeV3::Sponsor::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :page_info, as: 'pageInfo', class: Google::Apis::YoutubeV3::PageInfo, decorator: Google::Apis::YoutubeV3::PageInfo::Representation
      
          property :token_pagination, as: 'tokenPagination', class: Google::Apis::YoutubeV3::TokenPagination, decorator: Google::Apis::YoutubeV3::TokenPagination::Representation
      
          property :visitor_id, as: 'visitorId'
        end
      end
      
      class SponsorSnippet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :channel_id, as: 'channelId'
          property :cumulative_duration_months, as: 'cumulativeDurationMonths'
          property :sponsor_details, as: 'sponsorDetails', class: Google::Apis::YoutubeV3::ChannelProfileDetails, decorator: Google::Apis::YoutubeV3::ChannelProfileDetails::Representation
      
          property :sponsor_since, as: 'sponsorSince', type: DateTime
      
        end
      end
      
      class Subscription
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content_details, as: 'contentDetails', class: Google::Apis::YoutubeV3::SubscriptionContentDetails, decorator: Google::Apis::YoutubeV3::SubscriptionContentDetails::Representation
      
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :snippet, as: 'snippet', class: Google::Apis::YoutubeV3::SubscriptionSnippet, decorator: Google::Apis::YoutubeV3::SubscriptionSnippet::Representation
      
          property :subscriber_snippet, as: 'subscriberSnippet', class: Google::Apis::YoutubeV3::SubscriptionSubscriberSnippet, decorator: Google::Apis::YoutubeV3::SubscriptionSubscriberSnippet::Representation
      
        end
      end
      
      class SubscriptionContentDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :activity_type, as: 'activityType'
          property :new_item_count, as: 'newItemCount'
          property :total_item_count, as: 'totalItemCount'
        end
      end
      
      class ListSubscriptionResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :event_id, as: 'eventId'
          collection :items, as: 'items', class: Google::Apis::YoutubeV3::Subscription, decorator: Google::Apis::YoutubeV3::Subscription::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :page_info, as: 'pageInfo', class: Google::Apis::YoutubeV3::PageInfo, decorator: Google::Apis::YoutubeV3::PageInfo::Representation
      
          property :prev_page_token, as: 'prevPageToken'
          property :token_pagination, as: 'tokenPagination', class: Google::Apis::YoutubeV3::TokenPagination, decorator: Google::Apis::YoutubeV3::TokenPagination::Representation
      
          property :visitor_id, as: 'visitorId'
        end
      end
      
      class SubscriptionSnippet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :channel_id, as: 'channelId'
          property :channel_title, as: 'channelTitle'
          property :description, as: 'description'
          property :published_at, as: 'publishedAt', type: DateTime
      
          property :resource_id, as: 'resourceId', class: Google::Apis::YoutubeV3::ResourceId, decorator: Google::Apis::YoutubeV3::ResourceId::Representation
      
          property :thumbnails, as: 'thumbnails', class: Google::Apis::YoutubeV3::ThumbnailDetails, decorator: Google::Apis::YoutubeV3::ThumbnailDetails::Representation
      
          property :title, as: 'title'
        end
      end
      
      class SubscriptionSubscriberSnippet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :channel_id, as: 'channelId'
          property :description, as: 'description'
          property :thumbnails, as: 'thumbnails', class: Google::Apis::YoutubeV3::ThumbnailDetails, decorator: Google::Apis::YoutubeV3::ThumbnailDetails::Representation
      
          property :title, as: 'title'
        end
      end
      
      class SuperChatEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :snippet, as: 'snippet', class: Google::Apis::YoutubeV3::SuperChatEventSnippet, decorator: Google::Apis::YoutubeV3::SuperChatEventSnippet::Representation
      
        end
      end
      
      class SuperChatEventListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :event_id, as: 'eventId'
          collection :items, as: 'items', class: Google::Apis::YoutubeV3::SuperChatEvent, decorator: Google::Apis::YoutubeV3::SuperChatEvent::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :page_info, as: 'pageInfo', class: Google::Apis::YoutubeV3::PageInfo, decorator: Google::Apis::YoutubeV3::PageInfo::Representation
      
          property :token_pagination, as: 'tokenPagination', class: Google::Apis::YoutubeV3::TokenPagination, decorator: Google::Apis::YoutubeV3::TokenPagination::Representation
      
          property :visitor_id, as: 'visitorId'
        end
      end
      
      class SuperChatEventSnippet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :amount_micros, :numeric_string => true, as: 'amountMicros'
          property :channel_id, as: 'channelId'
          property :comment_text, as: 'commentText'
          property :created_at, as: 'createdAt', type: DateTime
      
          property :currency, as: 'currency'
          property :display_string, as: 'displayString'
          property :is_super_chat_for_good, as: 'isSuperChatForGood'
          property :is_super_sticker_event, as: 'isSuperStickerEvent'
          property :message_type, as: 'messageType'
          property :nonprofit, as: 'nonprofit', class: Google::Apis::YoutubeV3::Nonprofit, decorator: Google::Apis::YoutubeV3::Nonprofit::Representation
      
          property :super_sticker_metadata, as: 'superStickerMetadata', class: Google::Apis::YoutubeV3::SuperStickerMetadata, decorator: Google::Apis::YoutubeV3::SuperStickerMetadata::Representation
      
          property :supporter_details, as: 'supporterDetails', class: Google::Apis::YoutubeV3::ChannelProfileDetails, decorator: Google::Apis::YoutubeV3::ChannelProfileDetails::Representation
      
        end
      end
      
      class SuperStickerMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :alt_text, as: 'altText'
          property :alt_text_language, as: 'altTextLanguage'
          property :sticker_id, as: 'stickerId'
        end
      end
      
      class Thumbnail
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :height, as: 'height'
          property :url, as: 'url'
          property :width, as: 'width'
        end
      end
      
      class ThumbnailDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :default, as: 'default', class: Google::Apis::YoutubeV3::Thumbnail, decorator: Google::Apis::YoutubeV3::Thumbnail::Representation
      
          property :high, as: 'high', class: Google::Apis::YoutubeV3::Thumbnail, decorator: Google::Apis::YoutubeV3::Thumbnail::Representation
      
          property :maxres, as: 'maxres', class: Google::Apis::YoutubeV3::Thumbnail, decorator: Google::Apis::YoutubeV3::Thumbnail::Representation
      
          property :medium, as: 'medium', class: Google::Apis::YoutubeV3::Thumbnail, decorator: Google::Apis::YoutubeV3::Thumbnail::Representation
      
          property :standard, as: 'standard', class: Google::Apis::YoutubeV3::Thumbnail, decorator: Google::Apis::YoutubeV3::Thumbnail::Representation
      
        end
      end
      
      class SetThumbnailResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :event_id, as: 'eventId'
          collection :items, as: 'items', class: Google::Apis::YoutubeV3::ThumbnailDetails, decorator: Google::Apis::YoutubeV3::ThumbnailDetails::Representation
      
          property :kind, as: 'kind'
          property :visitor_id, as: 'visitorId'
        end
      end
      
      class TokenPagination
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class Video
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :age_gating, as: 'ageGating', class: Google::Apis::YoutubeV3::VideoAgeGating, decorator: Google::Apis::YoutubeV3::VideoAgeGating::Representation
      
          property :content_details, as: 'contentDetails', class: Google::Apis::YoutubeV3::VideoContentDetails, decorator: Google::Apis::YoutubeV3::VideoContentDetails::Representation
      
          property :etag, as: 'etag'
          property :file_details, as: 'fileDetails', class: Google::Apis::YoutubeV3::VideoFileDetails, decorator: Google::Apis::YoutubeV3::VideoFileDetails::Representation
      
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :live_streaming_details, as: 'liveStreamingDetails', class: Google::Apis::YoutubeV3::VideoLiveStreamingDetails, decorator: Google::Apis::YoutubeV3::VideoLiveStreamingDetails::Representation
      
          hash :localizations, as: 'localizations', class: Google::Apis::YoutubeV3::VideoLocalization, decorator: Google::Apis::YoutubeV3::VideoLocalization::Representation
      
          property :monetization_details, as: 'monetizationDetails', class: Google::Apis::YoutubeV3::VideoMonetizationDetails, decorator: Google::Apis::YoutubeV3::VideoMonetizationDetails::Representation
      
          property :player, as: 'player', class: Google::Apis::YoutubeV3::VideoPlayer, decorator: Google::Apis::YoutubeV3::VideoPlayer::Representation
      
          property :processing_details, as: 'processingDetails', class: Google::Apis::YoutubeV3::VideoProcessingDetails, decorator: Google::Apis::YoutubeV3::VideoProcessingDetails::Representation
      
          property :project_details, as: 'projectDetails', class: Google::Apis::YoutubeV3::VideoProjectDetails, decorator: Google::Apis::YoutubeV3::VideoProjectDetails::Representation
      
          property :recording_details, as: 'recordingDetails', class: Google::Apis::YoutubeV3::VideoRecordingDetails, decorator: Google::Apis::YoutubeV3::VideoRecordingDetails::Representation
      
          property :snippet, as: 'snippet', class: Google::Apis::YoutubeV3::VideoSnippet, decorator: Google::Apis::YoutubeV3::VideoSnippet::Representation
      
          property :statistics, as: 'statistics', class: Google::Apis::YoutubeV3::VideoStatistics, decorator: Google::Apis::YoutubeV3::VideoStatistics::Representation
      
          property :status, as: 'status', class: Google::Apis::YoutubeV3::VideoStatus, decorator: Google::Apis::YoutubeV3::VideoStatus::Representation
      
          property :suggestions, as: 'suggestions', class: Google::Apis::YoutubeV3::VideoSuggestions, decorator: Google::Apis::YoutubeV3::VideoSuggestions::Representation
      
          property :topic_details, as: 'topicDetails', class: Google::Apis::YoutubeV3::VideoTopicDetails, decorator: Google::Apis::YoutubeV3::VideoTopicDetails::Representation
      
        end
      end
      
      class VideoAbuseReport
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :comments, as: 'comments'
          property :language, as: 'language'
          property :reason_id, as: 'reasonId'
          property :secondary_reason_id, as: 'secondaryReasonId'
          property :video_id, as: 'videoId'
        end
      end
      
      class VideoAbuseReportReason
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :snippet, as: 'snippet', class: Google::Apis::YoutubeV3::VideoAbuseReportReasonSnippet, decorator: Google::Apis::YoutubeV3::VideoAbuseReportReasonSnippet::Representation
      
        end
      end
      
      class ListVideoAbuseReportReasonResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :event_id, as: 'eventId'
          collection :items, as: 'items', class: Google::Apis::YoutubeV3::VideoAbuseReportReason, decorator: Google::Apis::YoutubeV3::VideoAbuseReportReason::Representation
      
          property :kind, as: 'kind'
          property :visitor_id, as: 'visitorId'
        end
      end
      
      class VideoAbuseReportReasonSnippet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :label, as: 'label'
          collection :secondary_reasons, as: 'secondaryReasons', class: Google::Apis::YoutubeV3::VideoAbuseReportSecondaryReason, decorator: Google::Apis::YoutubeV3::VideoAbuseReportSecondaryReason::Representation
      
        end
      end
      
      class VideoAbuseReportSecondaryReason
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :label, as: 'label'
        end
      end
      
      class VideoAgeGating
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :alcohol_content, as: 'alcoholContent'
          property :restricted, as: 'restricted'
          property :video_game_rating, as: 'videoGameRating'
        end
      end
      
      class VideoCategory
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :snippet, as: 'snippet', class: Google::Apis::YoutubeV3::VideoCategorySnippet, decorator: Google::Apis::YoutubeV3::VideoCategorySnippet::Representation
      
        end
      end
      
      class ListVideoCategoryResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :event_id, as: 'eventId'
          collection :items, as: 'items', class: Google::Apis::YoutubeV3::VideoCategory, decorator: Google::Apis::YoutubeV3::VideoCategory::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :page_info, as: 'pageInfo', class: Google::Apis::YoutubeV3::PageInfo, decorator: Google::Apis::YoutubeV3::PageInfo::Representation
      
          property :prev_page_token, as: 'prevPageToken'
          property :token_pagination, as: 'tokenPagination', class: Google::Apis::YoutubeV3::TokenPagination, decorator: Google::Apis::YoutubeV3::TokenPagination::Representation
      
          property :visitor_id, as: 'visitorId'
        end
      end
      
      class VideoCategorySnippet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :assignable, as: 'assignable'
          property :channel_id, as: 'channelId'
          property :title, as: 'title'
        end
      end
      
      class VideoContentDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :caption, as: 'caption'
          property :content_rating, as: 'contentRating', class: Google::Apis::YoutubeV3::ContentRating, decorator: Google::Apis::YoutubeV3::ContentRating::Representation
      
          property :country_restriction, as: 'countryRestriction', class: Google::Apis::YoutubeV3::AccessPolicy, decorator: Google::Apis::YoutubeV3::AccessPolicy::Representation
      
          property :definition, as: 'definition'
          property :dimension, as: 'dimension'
          property :duration, as: 'duration'
          property :has_custom_thumbnail, as: 'hasCustomThumbnail'
          property :licensed_content, as: 'licensedContent'
          property :projection, as: 'projection'
          property :region_restriction, as: 'regionRestriction', class: Google::Apis::YoutubeV3::VideoContentDetailsRegionRestriction, decorator: Google::Apis::YoutubeV3::VideoContentDetailsRegionRestriction::Representation
      
        end
      end
      
      class VideoContentDetailsRegionRestriction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :allowed, as: 'allowed'
          collection :blocked, as: 'blocked'
        end
      end
      
      class VideoFileDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :audio_streams, as: 'audioStreams', class: Google::Apis::YoutubeV3::VideoFileDetailsAudioStream, decorator: Google::Apis::YoutubeV3::VideoFileDetailsAudioStream::Representation
      
          property :bitrate_bps, :numeric_string => true, as: 'bitrateBps'
          property :container, as: 'container'
          property :creation_time, as: 'creationTime'
          property :duration_ms, :numeric_string => true, as: 'durationMs'
          property :file_name, as: 'fileName'
          property :file_size, :numeric_string => true, as: 'fileSize'
          property :file_type, as: 'fileType'
          collection :video_streams, as: 'videoStreams', class: Google::Apis::YoutubeV3::VideoFileDetailsVideoStream, decorator: Google::Apis::YoutubeV3::VideoFileDetailsVideoStream::Representation
      
        end
      end
      
      class VideoFileDetailsAudioStream
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bitrate_bps, :numeric_string => true, as: 'bitrateBps'
          property :channel_count, as: 'channelCount'
          property :codec, as: 'codec'
          property :vendor, as: 'vendor'
        end
      end
      
      class VideoFileDetailsVideoStream
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :aspect_ratio, as: 'aspectRatio'
          property :bitrate_bps, :numeric_string => true, as: 'bitrateBps'
          property :codec, as: 'codec'
          property :frame_rate_fps, as: 'frameRateFps'
          property :height_pixels, as: 'heightPixels'
          property :rotation, as: 'rotation'
          property :vendor, as: 'vendor'
          property :width_pixels, as: 'widthPixels'
        end
      end
      
      class GetVideoRatingResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :event_id, as: 'eventId'
          collection :items, as: 'items', class: Google::Apis::YoutubeV3::VideoRating, decorator: Google::Apis::YoutubeV3::VideoRating::Representation
      
          property :kind, as: 'kind'
          property :visitor_id, as: 'visitorId'
        end
      end
      
      class ListVideosResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :event_id, as: 'eventId'
          collection :items, as: 'items', class: Google::Apis::YoutubeV3::Video, decorator: Google::Apis::YoutubeV3::Video::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :page_info, as: 'pageInfo', class: Google::Apis::YoutubeV3::PageInfo, decorator: Google::Apis::YoutubeV3::PageInfo::Representation
      
          property :prev_page_token, as: 'prevPageToken'
          property :token_pagination, as: 'tokenPagination', class: Google::Apis::YoutubeV3::TokenPagination, decorator: Google::Apis::YoutubeV3::TokenPagination::Representation
      
          property :visitor_id, as: 'visitorId'
        end
      end
      
      class VideoLiveStreamingDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :active_live_chat_id, as: 'activeLiveChatId'
          property :actual_end_time, as: 'actualEndTime', type: DateTime
      
          property :actual_start_time, as: 'actualStartTime', type: DateTime
      
          property :concurrent_viewers, :numeric_string => true, as: 'concurrentViewers'
          property :scheduled_end_time, as: 'scheduledEndTime', type: DateTime
      
          property :scheduled_start_time, as: 'scheduledStartTime', type: DateTime
      
        end
      end
      
      class VideoLocalization
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :title, as: 'title'
        end
      end
      
      class VideoMonetizationDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :access, as: 'access', class: Google::Apis::YoutubeV3::AccessPolicy, decorator: Google::Apis::YoutubeV3::AccessPolicy::Representation
      
        end
      end
      
      class VideoPlayer
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :embed_height, :numeric_string => true, as: 'embedHeight'
          property :embed_html, as: 'embedHtml'
          property :embed_width, :numeric_string => true, as: 'embedWidth'
        end
      end
      
      class VideoProcessingDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :editor_suggestions_availability, as: 'editorSuggestionsAvailability'
          property :file_details_availability, as: 'fileDetailsAvailability'
          property :processing_failure_reason, as: 'processingFailureReason'
          property :processing_issues_availability, as: 'processingIssuesAvailability'
          property :processing_progress, as: 'processingProgress', class: Google::Apis::YoutubeV3::VideoProcessingDetailsProcessingProgress, decorator: Google::Apis::YoutubeV3::VideoProcessingDetailsProcessingProgress::Representation
      
          property :processing_status, as: 'processingStatus'
          property :tag_suggestions_availability, as: 'tagSuggestionsAvailability'
          property :thumbnails_availability, as: 'thumbnailsAvailability'
        end
      end
      
      class VideoProcessingDetailsProcessingProgress
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :parts_processed, :numeric_string => true, as: 'partsProcessed'
          property :parts_total, :numeric_string => true, as: 'partsTotal'
          property :time_left_ms, :numeric_string => true, as: 'timeLeftMs'
        end
      end
      
      class VideoProjectDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :tags, as: 'tags'
        end
      end
      
      class VideoRating
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :rating, as: 'rating'
          property :video_id, as: 'videoId'
        end
      end
      
      class VideoRecordingDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :location, as: 'location', class: Google::Apis::YoutubeV3::GeoPoint, decorator: Google::Apis::YoutubeV3::GeoPoint::Representation
      
          property :location_description, as: 'locationDescription'
          property :recording_date, as: 'recordingDate', type: DateTime
      
        end
      end
      
      class VideoSnippet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :category_id, as: 'categoryId'
          property :channel_id, as: 'channelId'
          property :channel_title, as: 'channelTitle'
          property :default_audio_language, as: 'defaultAudioLanguage'
          property :default_language, as: 'defaultLanguage'
          property :description, as: 'description'
          property :live_broadcast_content, as: 'liveBroadcastContent'
          property :localized, as: 'localized', class: Google::Apis::YoutubeV3::VideoLocalization, decorator: Google::Apis::YoutubeV3::VideoLocalization::Representation
      
          property :published_at, as: 'publishedAt', type: DateTime
      
          collection :tags, as: 'tags'
          property :thumbnails, as: 'thumbnails', class: Google::Apis::YoutubeV3::ThumbnailDetails, decorator: Google::Apis::YoutubeV3::ThumbnailDetails::Representation
      
          property :title, as: 'title'
        end
      end
      
      class VideoStatistics
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :comment_count, :numeric_string => true, as: 'commentCount'
          property :dislike_count, :numeric_string => true, as: 'dislikeCount'
          property :favorite_count, :numeric_string => true, as: 'favoriteCount'
          property :like_count, :numeric_string => true, as: 'likeCount'
          property :view_count, :numeric_string => true, as: 'viewCount'
        end
      end
      
      class VideoStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :embeddable, as: 'embeddable'
          property :failure_reason, as: 'failureReason'
          property :license, as: 'license'
          property :privacy_status, as: 'privacyStatus'
          property :public_stats_viewable, as: 'publicStatsViewable'
          property :publish_at, as: 'publishAt', type: DateTime
      
          property :rejection_reason, as: 'rejectionReason'
          property :upload_status, as: 'uploadStatus'
        end
      end
      
      class VideoSuggestions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :editor_suggestions, as: 'editorSuggestions'
          collection :processing_errors, as: 'processingErrors'
          collection :processing_hints, as: 'processingHints'
          collection :processing_warnings, as: 'processingWarnings'
          collection :tag_suggestions, as: 'tagSuggestions', class: Google::Apis::YoutubeV3::VideoSuggestionsTagSuggestion, decorator: Google::Apis::YoutubeV3::VideoSuggestionsTagSuggestion::Representation
      
        end
      end
      
      class VideoSuggestionsTagSuggestion
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :category_restricts, as: 'categoryRestricts'
          property :tag, as: 'tag'
        end
      end
      
      class VideoTopicDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :relevant_topic_ids, as: 'relevantTopicIds'
          collection :topic_categories, as: 'topicCategories'
          collection :topic_ids, as: 'topicIds'
        end
      end
      
      class WatchSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :background_color, as: 'backgroundColor'
          property :featured_playlist_id, as: 'featuredPlaylistId'
          property :text_color, as: 'textColor'
        end
      end
    end
  end
end
