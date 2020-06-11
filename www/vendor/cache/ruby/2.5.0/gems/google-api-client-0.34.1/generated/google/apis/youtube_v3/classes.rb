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
      
      # Rights management policy for YouTube resources.
      class AccessPolicy
        include Google::Apis::Core::Hashable
      
        # The value of allowed indicates whether the access to the policy is allowed or
        # denied by default.
        # Corresponds to the JSON property `allowed`
        # @return [Boolean]
        attr_accessor :allowed
        alias_method :allowed?, :allowed
      
        # A list of region codes that identify countries where the default policy do not
        # apply.
        # Corresponds to the JSON property `exception`
        # @return [Array<String>]
        attr_accessor :exception
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @allowed = args[:allowed] if args.key?(:allowed)
          @exception = args[:exception] if args.key?(:exception)
        end
      end
      
      # An activity resource contains information about an action that a particular
      # channel, or user, has taken on YouTube.The actions reported in activity feeds
      # include rating a video, sharing a video, marking a video as a favorite,
      # commenting on a video, uploading a video, and so forth. Each activity resource
      # identifies the type of action, the channel associated with the action, and the
      # resource(s) associated with the action, such as the video that was rated or
      # uploaded.
      class Activity
        include Google::Apis::Core::Hashable
      
        # Details about the content of an activity: the video that was shared, the
        # channel that was subscribed to, etc.
        # Corresponds to the JSON property `contentDetails`
        # @return [Google::Apis::YoutubeV3::ActivityContentDetails]
        attr_accessor :content_details
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The ID that YouTube uses to uniquely identify the activity.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # activity".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Basic details about an activity, including title, description, thumbnails,
        # activity type and group.
        # Corresponds to the JSON property `snippet`
        # @return [Google::Apis::YoutubeV3::ActivitySnippet]
        attr_accessor :snippet
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content_details = args[:content_details] if args.key?(:content_details)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @snippet = args[:snippet] if args.key?(:snippet)
        end
      end
      
      # Details about the content of an activity: the video that was shared, the
      # channel that was subscribed to, etc.
      class ActivityContentDetails
        include Google::Apis::Core::Hashable
      
        # Details about a channel bulletin post.
        # Corresponds to the JSON property `bulletin`
        # @return [Google::Apis::YoutubeV3::ActivityContentDetailsBulletin]
        attr_accessor :bulletin
      
        # Details about a resource which was added to a channel.
        # Corresponds to the JSON property `channelItem`
        # @return [Google::Apis::YoutubeV3::ActivityContentDetailsChannelItem]
        attr_accessor :channel_item
      
        # Information about a resource that received a comment.
        # Corresponds to the JSON property `comment`
        # @return [Google::Apis::YoutubeV3::ActivityContentDetailsComment]
        attr_accessor :comment
      
        # Information about a video that was marked as a favorite video.
        # Corresponds to the JSON property `favorite`
        # @return [Google::Apis::YoutubeV3::ActivityContentDetailsFavorite]
        attr_accessor :favorite
      
        # Information about a resource that received a positive (like) rating.
        # Corresponds to the JSON property `like`
        # @return [Google::Apis::YoutubeV3::ActivityContentDetailsLike]
        attr_accessor :like
      
        # Information about a new playlist item.
        # Corresponds to the JSON property `playlistItem`
        # @return [Google::Apis::YoutubeV3::ActivityContentDetailsPlaylistItem]
        attr_accessor :playlist_item
      
        # Details about a resource which is being promoted.
        # Corresponds to the JSON property `promotedItem`
        # @return [Google::Apis::YoutubeV3::ActivityContentDetailsPromotedItem]
        attr_accessor :promoted_item
      
        # Information that identifies the recommended resource.
        # Corresponds to the JSON property `recommendation`
        # @return [Google::Apis::YoutubeV3::ActivityContentDetailsRecommendation]
        attr_accessor :recommendation
      
        # Details about a social network post.
        # Corresponds to the JSON property `social`
        # @return [Google::Apis::YoutubeV3::ActivityContentDetailsSocial]
        attr_accessor :social
      
        # Information about a channel that a user subscribed to.
        # Corresponds to the JSON property `subscription`
        # @return [Google::Apis::YoutubeV3::ActivityContentDetailsSubscription]
        attr_accessor :subscription
      
        # Information about the uploaded video.
        # Corresponds to the JSON property `upload`
        # @return [Google::Apis::YoutubeV3::ActivityContentDetailsUpload]
        attr_accessor :upload
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bulletin = args[:bulletin] if args.key?(:bulletin)
          @channel_item = args[:channel_item] if args.key?(:channel_item)
          @comment = args[:comment] if args.key?(:comment)
          @favorite = args[:favorite] if args.key?(:favorite)
          @like = args[:like] if args.key?(:like)
          @playlist_item = args[:playlist_item] if args.key?(:playlist_item)
          @promoted_item = args[:promoted_item] if args.key?(:promoted_item)
          @recommendation = args[:recommendation] if args.key?(:recommendation)
          @social = args[:social] if args.key?(:social)
          @subscription = args[:subscription] if args.key?(:subscription)
          @upload = args[:upload] if args.key?(:upload)
        end
      end
      
      # Details about a channel bulletin post.
      class ActivityContentDetailsBulletin
        include Google::Apis::Core::Hashable
      
        # A resource id is a generic reference that points to another YouTube resource.
        # Corresponds to the JSON property `resourceId`
        # @return [Google::Apis::YoutubeV3::ResourceId]
        attr_accessor :resource_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @resource_id = args[:resource_id] if args.key?(:resource_id)
        end
      end
      
      # Details about a resource which was added to a channel.
      class ActivityContentDetailsChannelItem
        include Google::Apis::Core::Hashable
      
        # A resource id is a generic reference that points to another YouTube resource.
        # Corresponds to the JSON property `resourceId`
        # @return [Google::Apis::YoutubeV3::ResourceId]
        attr_accessor :resource_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @resource_id = args[:resource_id] if args.key?(:resource_id)
        end
      end
      
      # Information about a resource that received a comment.
      class ActivityContentDetailsComment
        include Google::Apis::Core::Hashable
      
        # A resource id is a generic reference that points to another YouTube resource.
        # Corresponds to the JSON property `resourceId`
        # @return [Google::Apis::YoutubeV3::ResourceId]
        attr_accessor :resource_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @resource_id = args[:resource_id] if args.key?(:resource_id)
        end
      end
      
      # Information about a video that was marked as a favorite video.
      class ActivityContentDetailsFavorite
        include Google::Apis::Core::Hashable
      
        # A resource id is a generic reference that points to another YouTube resource.
        # Corresponds to the JSON property `resourceId`
        # @return [Google::Apis::YoutubeV3::ResourceId]
        attr_accessor :resource_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @resource_id = args[:resource_id] if args.key?(:resource_id)
        end
      end
      
      # Information about a resource that received a positive (like) rating.
      class ActivityContentDetailsLike
        include Google::Apis::Core::Hashable
      
        # A resource id is a generic reference that points to another YouTube resource.
        # Corresponds to the JSON property `resourceId`
        # @return [Google::Apis::YoutubeV3::ResourceId]
        attr_accessor :resource_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @resource_id = args[:resource_id] if args.key?(:resource_id)
        end
      end
      
      # Information about a new playlist item.
      class ActivityContentDetailsPlaylistItem
        include Google::Apis::Core::Hashable
      
        # The value that YouTube uses to uniquely identify the playlist.
        # Corresponds to the JSON property `playlistId`
        # @return [String]
        attr_accessor :playlist_id
      
        # ID of the item within the playlist.
        # Corresponds to the JSON property `playlistItemId`
        # @return [String]
        attr_accessor :playlist_item_id
      
        # A resource id is a generic reference that points to another YouTube resource.
        # Corresponds to the JSON property `resourceId`
        # @return [Google::Apis::YoutubeV3::ResourceId]
        attr_accessor :resource_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @playlist_id = args[:playlist_id] if args.key?(:playlist_id)
          @playlist_item_id = args[:playlist_item_id] if args.key?(:playlist_item_id)
          @resource_id = args[:resource_id] if args.key?(:resource_id)
        end
      end
      
      # Details about a resource which is being promoted.
      class ActivityContentDetailsPromotedItem
        include Google::Apis::Core::Hashable
      
        # The URL the client should fetch to request a promoted item.
        # Corresponds to the JSON property `adTag`
        # @return [String]
        attr_accessor :ad_tag
      
        # The URL the client should ping to indicate that the user clicked through on
        # this promoted item.
        # Corresponds to the JSON property `clickTrackingUrl`
        # @return [String]
        attr_accessor :click_tracking_url
      
        # The URL the client should ping to indicate that the user was shown this
        # promoted item.
        # Corresponds to the JSON property `creativeViewUrl`
        # @return [String]
        attr_accessor :creative_view_url
      
        # The type of call-to-action, a message to the user indicating action that can
        # be taken.
        # Corresponds to the JSON property `ctaType`
        # @return [String]
        attr_accessor :cta_type
      
        # The custom call-to-action button text. If specified, it will override the
        # default button text for the cta_type.
        # Corresponds to the JSON property `customCtaButtonText`
        # @return [String]
        attr_accessor :custom_cta_button_text
      
        # The text description to accompany the promoted item.
        # Corresponds to the JSON property `descriptionText`
        # @return [String]
        attr_accessor :description_text
      
        # The URL the client should direct the user to, if the user chooses to visit the
        # advertiser's website.
        # Corresponds to the JSON property `destinationUrl`
        # @return [String]
        attr_accessor :destination_url
      
        # The list of forecasting URLs. The client should ping all of these URLs when a
        # promoted item is not available, to indicate that a promoted item could have
        # been shown.
        # Corresponds to the JSON property `forecastingUrl`
        # @return [Array<String>]
        attr_accessor :forecasting_url
      
        # The list of impression URLs. The client should ping all of these URLs to
        # indicate that the user was shown this promoted item.
        # Corresponds to the JSON property `impressionUrl`
        # @return [Array<String>]
        attr_accessor :impression_url
      
        # The ID that YouTube uses to uniquely identify the promoted video.
        # Corresponds to the JSON property `videoId`
        # @return [String]
        attr_accessor :video_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ad_tag = args[:ad_tag] if args.key?(:ad_tag)
          @click_tracking_url = args[:click_tracking_url] if args.key?(:click_tracking_url)
          @creative_view_url = args[:creative_view_url] if args.key?(:creative_view_url)
          @cta_type = args[:cta_type] if args.key?(:cta_type)
          @custom_cta_button_text = args[:custom_cta_button_text] if args.key?(:custom_cta_button_text)
          @description_text = args[:description_text] if args.key?(:description_text)
          @destination_url = args[:destination_url] if args.key?(:destination_url)
          @forecasting_url = args[:forecasting_url] if args.key?(:forecasting_url)
          @impression_url = args[:impression_url] if args.key?(:impression_url)
          @video_id = args[:video_id] if args.key?(:video_id)
        end
      end
      
      # Information that identifies the recommended resource.
      class ActivityContentDetailsRecommendation
        include Google::Apis::Core::Hashable
      
        # The reason that the resource is recommended to the user.
        # Corresponds to the JSON property `reason`
        # @return [String]
        attr_accessor :reason
      
        # A resource id is a generic reference that points to another YouTube resource.
        # Corresponds to the JSON property `resourceId`
        # @return [Google::Apis::YoutubeV3::ResourceId]
        attr_accessor :resource_id
      
        # A resource id is a generic reference that points to another YouTube resource.
        # Corresponds to the JSON property `seedResourceId`
        # @return [Google::Apis::YoutubeV3::ResourceId]
        attr_accessor :seed_resource_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @reason = args[:reason] if args.key?(:reason)
          @resource_id = args[:resource_id] if args.key?(:resource_id)
          @seed_resource_id = args[:seed_resource_id] if args.key?(:seed_resource_id)
        end
      end
      
      # Details about a social network post.
      class ActivityContentDetailsSocial
        include Google::Apis::Core::Hashable
      
        # The author of the social network post.
        # Corresponds to the JSON property `author`
        # @return [String]
        attr_accessor :author
      
        # An image of the post's author.
        # Corresponds to the JSON property `imageUrl`
        # @return [String]
        attr_accessor :image_url
      
        # The URL of the social network post.
        # Corresponds to the JSON property `referenceUrl`
        # @return [String]
        attr_accessor :reference_url
      
        # A resource id is a generic reference that points to another YouTube resource.
        # Corresponds to the JSON property `resourceId`
        # @return [Google::Apis::YoutubeV3::ResourceId]
        attr_accessor :resource_id
      
        # The name of the social network.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @author = args[:author] if args.key?(:author)
          @image_url = args[:image_url] if args.key?(:image_url)
          @reference_url = args[:reference_url] if args.key?(:reference_url)
          @resource_id = args[:resource_id] if args.key?(:resource_id)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Information about a channel that a user subscribed to.
      class ActivityContentDetailsSubscription
        include Google::Apis::Core::Hashable
      
        # A resource id is a generic reference that points to another YouTube resource.
        # Corresponds to the JSON property `resourceId`
        # @return [Google::Apis::YoutubeV3::ResourceId]
        attr_accessor :resource_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @resource_id = args[:resource_id] if args.key?(:resource_id)
        end
      end
      
      # Information about the uploaded video.
      class ActivityContentDetailsUpload
        include Google::Apis::Core::Hashable
      
        # The ID that YouTube uses to uniquely identify the uploaded video.
        # Corresponds to the JSON property `videoId`
        # @return [String]
        attr_accessor :video_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @video_id = args[:video_id] if args.key?(:video_id)
        end
      end
      
      # 
      class ListActivitiesResponse
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Serialized EventId of the request which produced this response.
        # Corresponds to the JSON property `eventId`
        # @return [String]
        attr_accessor :event_id
      
        # A list of activities, or events, that match the request criteria.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::YoutubeV3::Activity>]
        attr_accessor :items
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # activityListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The token that can be used as the value of the pageToken parameter to retrieve
        # the next page in the result set.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Paging details for lists of resources, including total number of items
        # available and number of resources returned in a single page.
        # Corresponds to the JSON property `pageInfo`
        # @return [Google::Apis::YoutubeV3::PageInfo]
        attr_accessor :page_info
      
        # The token that can be used as the value of the pageToken parameter to retrieve
        # the previous page in the result set.
        # Corresponds to the JSON property `prevPageToken`
        # @return [String]
        attr_accessor :prev_page_token
      
        # Stub token pagination template to suppress results.
        # Corresponds to the JSON property `tokenPagination`
        # @return [Google::Apis::YoutubeV3::TokenPagination]
        attr_accessor :token_pagination
      
        # The visitorId identifies the visitor.
        # Corresponds to the JSON property `visitorId`
        # @return [String]
        attr_accessor :visitor_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @event_id = args[:event_id] if args.key?(:event_id)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @page_info = args[:page_info] if args.key?(:page_info)
          @prev_page_token = args[:prev_page_token] if args.key?(:prev_page_token)
          @token_pagination = args[:token_pagination] if args.key?(:token_pagination)
          @visitor_id = args[:visitor_id] if args.key?(:visitor_id)
        end
      end
      
      # Basic details about an activity, including title, description, thumbnails,
      # activity type and group.
      class ActivitySnippet
        include Google::Apis::Core::Hashable
      
        # The ID that YouTube uses to uniquely identify the channel associated with the
        # activity.
        # Corresponds to the JSON property `channelId`
        # @return [String]
        attr_accessor :channel_id
      
        # Channel title for the channel responsible for this activity
        # Corresponds to the JSON property `channelTitle`
        # @return [String]
        attr_accessor :channel_title
      
        # The description of the resource primarily associated with the activity.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The group ID associated with the activity. A group ID identifies user events
        # that are associated with the same user and resource. For example, if a user
        # rates a video and marks the same video as a favorite, the entries for those
        # events would have the same group ID in the user's activity feed. In your user
        # interface, you can avoid repetition by grouping events with the same groupId
        # value.
        # Corresponds to the JSON property `groupId`
        # @return [String]
        attr_accessor :group_id
      
        # The date and time that the video was uploaded. The value is specified in ISO
        # 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
        # Corresponds to the JSON property `publishedAt`
        # @return [DateTime]
        attr_accessor :published_at
      
        # Internal representation of thumbnails for a YouTube resource.
        # Corresponds to the JSON property `thumbnails`
        # @return [Google::Apis::YoutubeV3::ThumbnailDetails]
        attr_accessor :thumbnails
      
        # The title of the resource primarily associated with the activity.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # The type of activity that the resource describes.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @channel_id = args[:channel_id] if args.key?(:channel_id)
          @channel_title = args[:channel_title] if args.key?(:channel_title)
          @description = args[:description] if args.key?(:description)
          @group_id = args[:group_id] if args.key?(:group_id)
          @published_at = args[:published_at] if args.key?(:published_at)
          @thumbnails = args[:thumbnails] if args.key?(:thumbnails)
          @title = args[:title] if args.key?(:title)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # A caption resource represents a YouTube caption track. A caption track is
      # associated with exactly one YouTube video.
      class Caption
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The ID that YouTube uses to uniquely identify the caption track.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # caption".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Basic details about a caption track, such as its language and name.
        # Corresponds to the JSON property `snippet`
        # @return [Google::Apis::YoutubeV3::CaptionSnippet]
        attr_accessor :snippet
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @snippet = args[:snippet] if args.key?(:snippet)
        end
      end
      
      # 
      class ListCaptionsResponse
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Serialized EventId of the request which produced this response.
        # Corresponds to the JSON property `eventId`
        # @return [String]
        attr_accessor :event_id
      
        # A list of captions that match the request criteria.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::YoutubeV3::Caption>]
        attr_accessor :items
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # captionListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The visitorId identifies the visitor.
        # Corresponds to the JSON property `visitorId`
        # @return [String]
        attr_accessor :visitor_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @event_id = args[:event_id] if args.key?(:event_id)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @visitor_id = args[:visitor_id] if args.key?(:visitor_id)
        end
      end
      
      # Basic details about a caption track, such as its language and name.
      class CaptionSnippet
        include Google::Apis::Core::Hashable
      
        # The type of audio track associated with the caption track.
        # Corresponds to the JSON property `audioTrackType`
        # @return [String]
        attr_accessor :audio_track_type
      
        # The reason that YouTube failed to process the caption track. This property is
        # only present if the state property's value is failed.
        # Corresponds to the JSON property `failureReason`
        # @return [String]
        attr_accessor :failure_reason
      
        # Indicates whether YouTube synchronized the caption track to the audio track in
        # the video. The value will be true if a sync was explicitly requested when the
        # caption track was uploaded. For example, when calling the captions.insert or
        # captions.update methods, you can set the sync parameter to true to instruct
        # YouTube to sync the uploaded track to the video. If the value is false,
        # YouTube uses the time codes in the uploaded caption track to determine when to
        # display captions.
        # Corresponds to the JSON property `isAutoSynced`
        # @return [Boolean]
        attr_accessor :is_auto_synced
        alias_method :is_auto_synced?, :is_auto_synced
      
        # Indicates whether the track contains closed captions for the deaf and hard of
        # hearing. The default value is false.
        # Corresponds to the JSON property `isCC`
        # @return [Boolean]
        attr_accessor :is_cc
        alias_method :is_cc?, :is_cc
      
        # Indicates whether the caption track is a draft. If the value is true, then the
        # track is not publicly visible. The default value is false.
        # Corresponds to the JSON property `isDraft`
        # @return [Boolean]
        attr_accessor :is_draft
        alias_method :is_draft?, :is_draft
      
        # Indicates whether caption track is formatted for "easy reader," meaning it is
        # at a third-grade level for language learners. The default value is false.
        # Corresponds to the JSON property `isEasyReader`
        # @return [Boolean]
        attr_accessor :is_easy_reader
        alias_method :is_easy_reader?, :is_easy_reader
      
        # Indicates whether the caption track uses large text for the vision-impaired.
        # The default value is false.
        # Corresponds to the JSON property `isLarge`
        # @return [Boolean]
        attr_accessor :is_large
        alias_method :is_large?, :is_large
      
        # The language of the caption track. The property value is a BCP-47 language tag.
        # Corresponds to the JSON property `language`
        # @return [String]
        attr_accessor :language
      
        # The date and time when the caption track was last updated. The value is
        # specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
        # Corresponds to the JSON property `lastUpdated`
        # @return [DateTime]
        attr_accessor :last_updated
      
        # The name of the caption track. The name is intended to be visible to the user
        # as an option during playback.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The caption track's status.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # The caption track's type.
        # Corresponds to the JSON property `trackKind`
        # @return [String]
        attr_accessor :track_kind
      
        # The ID that YouTube uses to uniquely identify the video associated with the
        # caption track.
        # Corresponds to the JSON property `videoId`
        # @return [String]
        attr_accessor :video_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @audio_track_type = args[:audio_track_type] if args.key?(:audio_track_type)
          @failure_reason = args[:failure_reason] if args.key?(:failure_reason)
          @is_auto_synced = args[:is_auto_synced] if args.key?(:is_auto_synced)
          @is_cc = args[:is_cc] if args.key?(:is_cc)
          @is_draft = args[:is_draft] if args.key?(:is_draft)
          @is_easy_reader = args[:is_easy_reader] if args.key?(:is_easy_reader)
          @is_large = args[:is_large] if args.key?(:is_large)
          @language = args[:language] if args.key?(:language)
          @last_updated = args[:last_updated] if args.key?(:last_updated)
          @name = args[:name] if args.key?(:name)
          @status = args[:status] if args.key?(:status)
          @track_kind = args[:track_kind] if args.key?(:track_kind)
          @video_id = args[:video_id] if args.key?(:video_id)
        end
      end
      
      # Brief description of the live stream cdn settings.
      class CdnSettings
        include Google::Apis::Core::Hashable
      
        # The format of the video stream that you are sending to Youtube.
        # Corresponds to the JSON property `format`
        # @return [String]
        attr_accessor :format
      
        # The frame rate of the inbound video data.
        # Corresponds to the JSON property `frameRate`
        # @return [String]
        attr_accessor :frame_rate
      
        # Describes information necessary for ingesting an RTMP or an HTTP stream.
        # Corresponds to the JSON property `ingestionInfo`
        # @return [Google::Apis::YoutubeV3::IngestionInfo]
        attr_accessor :ingestion_info
      
        # The method or protocol used to transmit the video stream.
        # Corresponds to the JSON property `ingestionType`
        # @return [String]
        attr_accessor :ingestion_type
      
        # The resolution of the inbound video data.
        # Corresponds to the JSON property `resolution`
        # @return [String]
        attr_accessor :resolution
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @format = args[:format] if args.key?(:format)
          @frame_rate = args[:frame_rate] if args.key?(:frame_rate)
          @ingestion_info = args[:ingestion_info] if args.key?(:ingestion_info)
          @ingestion_type = args[:ingestion_type] if args.key?(:ingestion_type)
          @resolution = args[:resolution] if args.key?(:resolution)
        end
      end
      
      # A channel resource contains information about a YouTube channel.
      class Channel
        include Google::Apis::Core::Hashable
      
        # The auditDetails object encapsulates channel data that is relevant for YouTube
        # Partners during the audit process.
        # Corresponds to the JSON property `auditDetails`
        # @return [Google::Apis::YoutubeV3::ChannelAuditDetails]
        attr_accessor :audit_details
      
        # Branding properties of a YouTube channel.
        # Corresponds to the JSON property `brandingSettings`
        # @return [Google::Apis::YoutubeV3::ChannelBrandingSettings]
        attr_accessor :branding_settings
      
        # Details about the content of a channel.
        # Corresponds to the JSON property `contentDetails`
        # @return [Google::Apis::YoutubeV3::ChannelContentDetails]
        attr_accessor :content_details
      
        # The contentOwnerDetails object encapsulates channel data that is relevant for
        # YouTube Partners linked with the channel.
        # Corresponds to the JSON property `contentOwnerDetails`
        # @return [Google::Apis::YoutubeV3::ChannelContentOwnerDetails]
        attr_accessor :content_owner_details
      
        # The conversionPings object encapsulates information about conversion pings
        # that need to be respected by the channel.
        # Corresponds to the JSON property `conversionPings`
        # @return [Google::Apis::YoutubeV3::ChannelConversionPings]
        attr_accessor :conversion_pings
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The ID that YouTube uses to uniquely identify the channel.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Describes an invideo promotion campaign consisting of multiple promoted items.
        # A campaign belongs to a single channel_id.
        # Corresponds to the JSON property `invideoPromotion`
        # @return [Google::Apis::YoutubeV3::InvideoPromotion]
        attr_accessor :invideo_promotion
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # channel".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Localizations for different languages
        # Corresponds to the JSON property `localizations`
        # @return [Hash<String,Google::Apis::YoutubeV3::ChannelLocalization>]
        attr_accessor :localizations
      
        # Basic details about a channel, including title, description and thumbnails.
        # Corresponds to the JSON property `snippet`
        # @return [Google::Apis::YoutubeV3::ChannelSnippet]
        attr_accessor :snippet
      
        # Statistics about a channel: number of subscribers, number of videos in the
        # channel, etc.
        # Corresponds to the JSON property `statistics`
        # @return [Google::Apis::YoutubeV3::ChannelStatistics]
        attr_accessor :statistics
      
        # JSON template for the status part of a channel.
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::YoutubeV3::ChannelStatus]
        attr_accessor :status
      
        # Freebase topic information related to the channel.
        # Corresponds to the JSON property `topicDetails`
        # @return [Google::Apis::YoutubeV3::ChannelTopicDetails]
        attr_accessor :topic_details
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @audit_details = args[:audit_details] if args.key?(:audit_details)
          @branding_settings = args[:branding_settings] if args.key?(:branding_settings)
          @content_details = args[:content_details] if args.key?(:content_details)
          @content_owner_details = args[:content_owner_details] if args.key?(:content_owner_details)
          @conversion_pings = args[:conversion_pings] if args.key?(:conversion_pings)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @invideo_promotion = args[:invideo_promotion] if args.key?(:invideo_promotion)
          @kind = args[:kind] if args.key?(:kind)
          @localizations = args[:localizations] if args.key?(:localizations)
          @snippet = args[:snippet] if args.key?(:snippet)
          @statistics = args[:statistics] if args.key?(:statistics)
          @status = args[:status] if args.key?(:status)
          @topic_details = args[:topic_details] if args.key?(:topic_details)
        end
      end
      
      # The auditDetails object encapsulates channel data that is relevant for YouTube
      # Partners during the audit process.
      class ChannelAuditDetails
        include Google::Apis::Core::Hashable
      
        # Whether or not the channel respects the community guidelines.
        # Corresponds to the JSON property `communityGuidelinesGoodStanding`
        # @return [Boolean]
        attr_accessor :community_guidelines_good_standing
        alias_method :community_guidelines_good_standing?, :community_guidelines_good_standing
      
        # Whether or not the channel has any unresolved claims.
        # Corresponds to the JSON property `contentIdClaimsGoodStanding`
        # @return [Boolean]
        attr_accessor :content_id_claims_good_standing
        alias_method :content_id_claims_good_standing?, :content_id_claims_good_standing
      
        # Whether or not the channel has any copyright strikes.
        # Corresponds to the JSON property `copyrightStrikesGoodStanding`
        # @return [Boolean]
        attr_accessor :copyright_strikes_good_standing
        alias_method :copyright_strikes_good_standing?, :copyright_strikes_good_standing
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @community_guidelines_good_standing = args[:community_guidelines_good_standing] if args.key?(:community_guidelines_good_standing)
          @content_id_claims_good_standing = args[:content_id_claims_good_standing] if args.key?(:content_id_claims_good_standing)
          @copyright_strikes_good_standing = args[:copyright_strikes_good_standing] if args.key?(:copyright_strikes_good_standing)
        end
      end
      
      # A channel banner returned as the response to a channel_banner.insert call.
      class ChannelBannerResource
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # channelBannerResource".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The URL of this banner image.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @kind = args[:kind] if args.key?(:kind)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # Branding properties of a YouTube channel.
      class ChannelBrandingSettings
        include Google::Apis::Core::Hashable
      
        # Branding properties for the channel view.
        # Corresponds to the JSON property `channel`
        # @return [Google::Apis::YoutubeV3::ChannelSettings]
        attr_accessor :channel
      
        # Additional experimental branding properties.
        # Corresponds to the JSON property `hints`
        # @return [Array<Google::Apis::YoutubeV3::PropertyValue>]
        attr_accessor :hints
      
        # Branding properties for images associated with the channel.
        # Corresponds to the JSON property `image`
        # @return [Google::Apis::YoutubeV3::ImageSettings]
        attr_accessor :image
      
        # Branding properties for the watch. All deprecated.
        # Corresponds to the JSON property `watch`
        # @return [Google::Apis::YoutubeV3::WatchSettings]
        attr_accessor :watch
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @channel = args[:channel] if args.key?(:channel)
          @hints = args[:hints] if args.key?(:hints)
          @image = args[:image] if args.key?(:image)
          @watch = args[:watch] if args.key?(:watch)
        end
      end
      
      # Details about the content of a channel.
      class ChannelContentDetails
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `relatedPlaylists`
        # @return [Google::Apis::YoutubeV3::ChannelContentDetails::RelatedPlaylists]
        attr_accessor :related_playlists
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @related_playlists = args[:related_playlists] if args.key?(:related_playlists)
        end
        
        # 
        class RelatedPlaylists
          include Google::Apis::Core::Hashable
        
          # The ID of the playlist that contains the channel"s favorite videos. Use the
          # playlistItems.insert and  playlistItems.delete to add or remove items from
          # that list.
          # Corresponds to the JSON property `favorites`
          # @return [String]
          attr_accessor :favorites
        
          # The ID of the playlist that contains the channel"s liked videos. Use the
          # playlistItems.insert and  playlistItems.delete to add or remove items from
          # that list.
          # Corresponds to the JSON property `likes`
          # @return [String]
          attr_accessor :likes
        
          # The ID of the playlist that contains the channel"s uploaded videos. Use the
          # videos.insert method to upload new videos and the videos.delete method to
          # delete previously uploaded videos.
          # Corresponds to the JSON property `uploads`
          # @return [String]
          attr_accessor :uploads
        
          # The ID of the playlist that contains the channel"s watch history. Use the
          # playlistItems.insert and  playlistItems.delete to add or remove items from
          # that list.
          # Corresponds to the JSON property `watchHistory`
          # @return [String]
          attr_accessor :watch_history
        
          # The ID of the playlist that contains the channel"s watch later playlist. Use
          # the playlistItems.insert and  playlistItems.delete to add or remove items from
          # that list.
          # Corresponds to the JSON property `watchLater`
          # @return [String]
          attr_accessor :watch_later
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @favorites = args[:favorites] if args.key?(:favorites)
            @likes = args[:likes] if args.key?(:likes)
            @uploads = args[:uploads] if args.key?(:uploads)
            @watch_history = args[:watch_history] if args.key?(:watch_history)
            @watch_later = args[:watch_later] if args.key?(:watch_later)
          end
        end
      end
      
      # The contentOwnerDetails object encapsulates channel data that is relevant for
      # YouTube Partners linked with the channel.
      class ChannelContentOwnerDetails
        include Google::Apis::Core::Hashable
      
        # The ID of the content owner linked to the channel.
        # Corresponds to the JSON property `contentOwner`
        # @return [String]
        attr_accessor :content_owner
      
        # The date and time of when the channel was linked to the content owner. The
        # value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
        # Corresponds to the JSON property `timeLinked`
        # @return [DateTime]
        attr_accessor :time_linked
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content_owner = args[:content_owner] if args.key?(:content_owner)
          @time_linked = args[:time_linked] if args.key?(:time_linked)
        end
      end
      
      # Pings that the app shall fire (authenticated by biscotti cookie). Each ping
      # has a context, in which the app must fire the ping, and a url identifying the
      # ping.
      class ChannelConversionPing
        include Google::Apis::Core::Hashable
      
        # Defines the context of the ping.
        # Corresponds to the JSON property `context`
        # @return [String]
        attr_accessor :context
      
        # The url (without the schema) that the player shall send the ping to. It's at
        # caller's descretion to decide which schema to use (http vs https) Example of a
        # returned url: //googleads.g.doubleclick.net/pagead/ viewthroughconversion/
        # 962985656/?data=path%3DtHe_path%3Btype%3D cview%3Butuid%
        # 3DGISQtTNGYqaYl4sKxoVvKA&labe=default The caller must append biscotti
        # authentication (ms param in case of mobile, for example) to this ping.
        # Corresponds to the JSON property `conversionUrl`
        # @return [String]
        attr_accessor :conversion_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @context = args[:context] if args.key?(:context)
          @conversion_url = args[:conversion_url] if args.key?(:conversion_url)
        end
      end
      
      # The conversionPings object encapsulates information about conversion pings
      # that need to be respected by the channel.
      class ChannelConversionPings
        include Google::Apis::Core::Hashable
      
        # Pings that the app shall fire (authenticated by biscotti cookie). Each ping
        # has a context, in which the app must fire the ping, and a url identifying the
        # ping.
        # Corresponds to the JSON property `pings`
        # @return [Array<Google::Apis::YoutubeV3::ChannelConversionPing>]
        attr_accessor :pings
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @pings = args[:pings] if args.key?(:pings)
        end
      end
      
      # 
      class ListChannelsResponse
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Serialized EventId of the request which produced this response.
        # Corresponds to the JSON property `eventId`
        # @return [String]
        attr_accessor :event_id
      
        # A list of channels that match the request criteria.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::YoutubeV3::Channel>]
        attr_accessor :items
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # channelListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The token that can be used as the value of the pageToken parameter to retrieve
        # the next page in the result set.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Paging details for lists of resources, including total number of items
        # available and number of resources returned in a single page.
        # Corresponds to the JSON property `pageInfo`
        # @return [Google::Apis::YoutubeV3::PageInfo]
        attr_accessor :page_info
      
        # The token that can be used as the value of the pageToken parameter to retrieve
        # the previous page in the result set.
        # Corresponds to the JSON property `prevPageToken`
        # @return [String]
        attr_accessor :prev_page_token
      
        # Stub token pagination template to suppress results.
        # Corresponds to the JSON property `tokenPagination`
        # @return [Google::Apis::YoutubeV3::TokenPagination]
        attr_accessor :token_pagination
      
        # The visitorId identifies the visitor.
        # Corresponds to the JSON property `visitorId`
        # @return [String]
        attr_accessor :visitor_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @event_id = args[:event_id] if args.key?(:event_id)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @page_info = args[:page_info] if args.key?(:page_info)
          @prev_page_token = args[:prev_page_token] if args.key?(:prev_page_token)
          @token_pagination = args[:token_pagination] if args.key?(:token_pagination)
          @visitor_id = args[:visitor_id] if args.key?(:visitor_id)
        end
      end
      
      # Channel localization setting
      class ChannelLocalization
        include Google::Apis::Core::Hashable
      
        # The localized strings for channel's description.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The localized strings for channel's title.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # 
      class ChannelProfileDetails
        include Google::Apis::Core::Hashable
      
        # The YouTube channel ID.
        # Corresponds to the JSON property `channelId`
        # @return [String]
        attr_accessor :channel_id
      
        # The channel's URL.
        # Corresponds to the JSON property `channelUrl`
        # @return [String]
        attr_accessor :channel_url
      
        # The channel's display name.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The channels's avatar URL.
        # Corresponds to the JSON property `profileImageUrl`
        # @return [String]
        attr_accessor :profile_image_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @channel_id = args[:channel_id] if args.key?(:channel_id)
          @channel_url = args[:channel_url] if args.key?(:channel_url)
          @display_name = args[:display_name] if args.key?(:display_name)
          @profile_image_url = args[:profile_image_url] if args.key?(:profile_image_url)
        end
      end
      
      # 
      class ChannelSection
        include Google::Apis::Core::Hashable
      
        # Details about a channelsection, including playlists and channels.
        # Corresponds to the JSON property `contentDetails`
        # @return [Google::Apis::YoutubeV3::ChannelSectionContentDetails]
        attr_accessor :content_details
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The ID that YouTube uses to uniquely identify the channel section.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # channelSection".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Localizations for different languages
        # Corresponds to the JSON property `localizations`
        # @return [Hash<String,Google::Apis::YoutubeV3::ChannelSectionLocalization>]
        attr_accessor :localizations
      
        # Basic details about a channel section, including title, style and position.
        # Corresponds to the JSON property `snippet`
        # @return [Google::Apis::YoutubeV3::ChannelSectionSnippet]
        attr_accessor :snippet
      
        # ChannelSection targeting setting.
        # Corresponds to the JSON property `targeting`
        # @return [Google::Apis::YoutubeV3::ChannelSectionTargeting]
        attr_accessor :targeting
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content_details = args[:content_details] if args.key?(:content_details)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @localizations = args[:localizations] if args.key?(:localizations)
          @snippet = args[:snippet] if args.key?(:snippet)
          @targeting = args[:targeting] if args.key?(:targeting)
        end
      end
      
      # Details about a channelsection, including playlists and channels.
      class ChannelSectionContentDetails
        include Google::Apis::Core::Hashable
      
        # The channel ids for type multiple_channels.
        # Corresponds to the JSON property `channels`
        # @return [Array<String>]
        attr_accessor :channels
      
        # The playlist ids for type single_playlist and multiple_playlists. For
        # singlePlaylist, only one playlistId is allowed.
        # Corresponds to the JSON property `playlists`
        # @return [Array<String>]
        attr_accessor :playlists
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @channels = args[:channels] if args.key?(:channels)
          @playlists = args[:playlists] if args.key?(:playlists)
        end
      end
      
      # 
      class ListChannelSectionsResponse
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Serialized EventId of the request which produced this response.
        # Corresponds to the JSON property `eventId`
        # @return [String]
        attr_accessor :event_id
      
        # A list of ChannelSections that match the request criteria.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::YoutubeV3::ChannelSection>]
        attr_accessor :items
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # channelSectionListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The visitorId identifies the visitor.
        # Corresponds to the JSON property `visitorId`
        # @return [String]
        attr_accessor :visitor_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @event_id = args[:event_id] if args.key?(:event_id)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @visitor_id = args[:visitor_id] if args.key?(:visitor_id)
        end
      end
      
      # ChannelSection localization setting
      class ChannelSectionLocalization
        include Google::Apis::Core::Hashable
      
        # The localized strings for channel section's title.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Basic details about a channel section, including title, style and position.
      class ChannelSectionSnippet
        include Google::Apis::Core::Hashable
      
        # The ID that YouTube uses to uniquely identify the channel that published the
        # channel section.
        # Corresponds to the JSON property `channelId`
        # @return [String]
        attr_accessor :channel_id
      
        # The language of the channel section's default title and description.
        # Corresponds to the JSON property `defaultLanguage`
        # @return [String]
        attr_accessor :default_language
      
        # ChannelSection localization setting
        # Corresponds to the JSON property `localized`
        # @return [Google::Apis::YoutubeV3::ChannelSectionLocalization]
        attr_accessor :localized
      
        # The position of the channel section in the channel.
        # Corresponds to the JSON property `position`
        # @return [Fixnum]
        attr_accessor :position
      
        # The style of the channel section.
        # Corresponds to the JSON property `style`
        # @return [String]
        attr_accessor :style
      
        # The channel section's title for multiple_playlists and multiple_channels.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # The type of the channel section.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @channel_id = args[:channel_id] if args.key?(:channel_id)
          @default_language = args[:default_language] if args.key?(:default_language)
          @localized = args[:localized] if args.key?(:localized)
          @position = args[:position] if args.key?(:position)
          @style = args[:style] if args.key?(:style)
          @title = args[:title] if args.key?(:title)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # ChannelSection targeting setting.
      class ChannelSectionTargeting
        include Google::Apis::Core::Hashable
      
        # The country the channel section is targeting.
        # Corresponds to the JSON property `countries`
        # @return [Array<String>]
        attr_accessor :countries
      
        # The language the channel section is targeting.
        # Corresponds to the JSON property `languages`
        # @return [Array<String>]
        attr_accessor :languages
      
        # The region the channel section is targeting.
        # Corresponds to the JSON property `regions`
        # @return [Array<String>]
        attr_accessor :regions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @countries = args[:countries] if args.key?(:countries)
          @languages = args[:languages] if args.key?(:languages)
          @regions = args[:regions] if args.key?(:regions)
        end
      end
      
      # Branding properties for the channel view.
      class ChannelSettings
        include Google::Apis::Core::Hashable
      
        # The country of the channel.
        # Corresponds to the JSON property `country`
        # @return [String]
        attr_accessor :country
      
        # 
        # Corresponds to the JSON property `defaultLanguage`
        # @return [String]
        attr_accessor :default_language
      
        # Which content tab users should see when viewing the channel.
        # Corresponds to the JSON property `defaultTab`
        # @return [String]
        attr_accessor :default_tab
      
        # Specifies the channel description.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Title for the featured channels tab.
        # Corresponds to the JSON property `featuredChannelsTitle`
        # @return [String]
        attr_accessor :featured_channels_title
      
        # The list of featured channels.
        # Corresponds to the JSON property `featuredChannelsUrls`
        # @return [Array<String>]
        attr_accessor :featured_channels_urls
      
        # Lists keywords associated with the channel, comma-separated.
        # Corresponds to the JSON property `keywords`
        # @return [String]
        attr_accessor :keywords
      
        # Whether user-submitted comments left on the channel page need to be approved
        # by the channel owner to be publicly visible.
        # Corresponds to the JSON property `moderateComments`
        # @return [Boolean]
        attr_accessor :moderate_comments
        alias_method :moderate_comments?, :moderate_comments
      
        # A prominent color that can be rendered on this channel page.
        # Corresponds to the JSON property `profileColor`
        # @return [String]
        attr_accessor :profile_color
      
        # Whether the tab to browse the videos should be displayed.
        # Corresponds to the JSON property `showBrowseView`
        # @return [Boolean]
        attr_accessor :show_browse_view
        alias_method :show_browse_view?, :show_browse_view
      
        # Whether related channels should be proposed.
        # Corresponds to the JSON property `showRelatedChannels`
        # @return [Boolean]
        attr_accessor :show_related_channels
        alias_method :show_related_channels?, :show_related_channels
      
        # Specifies the channel title.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # The ID for a Google Analytics account to track and measure traffic to the
        # channels.
        # Corresponds to the JSON property `trackingAnalyticsAccountId`
        # @return [String]
        attr_accessor :tracking_analytics_account_id
      
        # The trailer of the channel, for users that are not subscribers.
        # Corresponds to the JSON property `unsubscribedTrailer`
        # @return [String]
        attr_accessor :unsubscribed_trailer
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @country = args[:country] if args.key?(:country)
          @default_language = args[:default_language] if args.key?(:default_language)
          @default_tab = args[:default_tab] if args.key?(:default_tab)
          @description = args[:description] if args.key?(:description)
          @featured_channels_title = args[:featured_channels_title] if args.key?(:featured_channels_title)
          @featured_channels_urls = args[:featured_channels_urls] if args.key?(:featured_channels_urls)
          @keywords = args[:keywords] if args.key?(:keywords)
          @moderate_comments = args[:moderate_comments] if args.key?(:moderate_comments)
          @profile_color = args[:profile_color] if args.key?(:profile_color)
          @show_browse_view = args[:show_browse_view] if args.key?(:show_browse_view)
          @show_related_channels = args[:show_related_channels] if args.key?(:show_related_channels)
          @title = args[:title] if args.key?(:title)
          @tracking_analytics_account_id = args[:tracking_analytics_account_id] if args.key?(:tracking_analytics_account_id)
          @unsubscribed_trailer = args[:unsubscribed_trailer] if args.key?(:unsubscribed_trailer)
        end
      end
      
      # Basic details about a channel, including title, description and thumbnails.
      class ChannelSnippet
        include Google::Apis::Core::Hashable
      
        # The country of the channel.
        # Corresponds to the JSON property `country`
        # @return [String]
        attr_accessor :country
      
        # The custom url of the channel.
        # Corresponds to the JSON property `customUrl`
        # @return [String]
        attr_accessor :custom_url
      
        # The language of the channel's default title and description.
        # Corresponds to the JSON property `defaultLanguage`
        # @return [String]
        attr_accessor :default_language
      
        # The description of the channel.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Channel localization setting
        # Corresponds to the JSON property `localized`
        # @return [Google::Apis::YoutubeV3::ChannelLocalization]
        attr_accessor :localized
      
        # The date and time that the channel was created. The value is specified in ISO
        # 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
        # Corresponds to the JSON property `publishedAt`
        # @return [DateTime]
        attr_accessor :published_at
      
        # Internal representation of thumbnails for a YouTube resource.
        # Corresponds to the JSON property `thumbnails`
        # @return [Google::Apis::YoutubeV3::ThumbnailDetails]
        attr_accessor :thumbnails
      
        # The channel's title.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @country = args[:country] if args.key?(:country)
          @custom_url = args[:custom_url] if args.key?(:custom_url)
          @default_language = args[:default_language] if args.key?(:default_language)
          @description = args[:description] if args.key?(:description)
          @localized = args[:localized] if args.key?(:localized)
          @published_at = args[:published_at] if args.key?(:published_at)
          @thumbnails = args[:thumbnails] if args.key?(:thumbnails)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Statistics about a channel: number of subscribers, number of videos in the
      # channel, etc.
      class ChannelStatistics
        include Google::Apis::Core::Hashable
      
        # The number of comments for the channel.
        # Corresponds to the JSON property `commentCount`
        # @return [Fixnum]
        attr_accessor :comment_count
      
        # Whether or not the number of subscribers is shown for this user.
        # Corresponds to the JSON property `hiddenSubscriberCount`
        # @return [Boolean]
        attr_accessor :hidden_subscriber_count
        alias_method :hidden_subscriber_count?, :hidden_subscriber_count
      
        # The number of subscribers that the channel has.
        # Corresponds to the JSON property `subscriberCount`
        # @return [Fixnum]
        attr_accessor :subscriber_count
      
        # The number of videos uploaded to the channel.
        # Corresponds to the JSON property `videoCount`
        # @return [Fixnum]
        attr_accessor :video_count
      
        # The number of times the channel has been viewed.
        # Corresponds to the JSON property `viewCount`
        # @return [Fixnum]
        attr_accessor :view_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @comment_count = args[:comment_count] if args.key?(:comment_count)
          @hidden_subscriber_count = args[:hidden_subscriber_count] if args.key?(:hidden_subscriber_count)
          @subscriber_count = args[:subscriber_count] if args.key?(:subscriber_count)
          @video_count = args[:video_count] if args.key?(:video_count)
          @view_count = args[:view_count] if args.key?(:view_count)
        end
      end
      
      # JSON template for the status part of a channel.
      class ChannelStatus
        include Google::Apis::Core::Hashable
      
        # If true, then the user is linked to either a YouTube username or G+ account.
        # Otherwise, the user doesn't have a public YouTube identity.
        # Corresponds to the JSON property `isLinked`
        # @return [Boolean]
        attr_accessor :is_linked
        alias_method :is_linked?, :is_linked
      
        # The long uploads status of this channel. See
        # Corresponds to the JSON property `longUploadsStatus`
        # @return [String]
        attr_accessor :long_uploads_status
      
        # Privacy status of the channel.
        # Corresponds to the JSON property `privacyStatus`
        # @return [String]
        attr_accessor :privacy_status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @is_linked = args[:is_linked] if args.key?(:is_linked)
          @long_uploads_status = args[:long_uploads_status] if args.key?(:long_uploads_status)
          @privacy_status = args[:privacy_status] if args.key?(:privacy_status)
        end
      end
      
      # Freebase topic information related to the channel.
      class ChannelTopicDetails
        include Google::Apis::Core::Hashable
      
        # A list of Wikipedia URLs that describe the channel's content.
        # Corresponds to the JSON property `topicCategories`
        # @return [Array<String>]
        attr_accessor :topic_categories
      
        # A list of Freebase topic IDs associated with the channel. You can retrieve
        # information about each topic using the Freebase Topic API.
        # Corresponds to the JSON property `topicIds`
        # @return [Array<String>]
        attr_accessor :topic_ids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @topic_categories = args[:topic_categories] if args.key?(:topic_categories)
          @topic_ids = args[:topic_ids] if args.key?(:topic_ids)
        end
      end
      
      # A comment represents a single YouTube comment.
      class Comment
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The ID that YouTube uses to uniquely identify the comment.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # comment".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Basic details about a comment, such as its author and text.
        # Corresponds to the JSON property `snippet`
        # @return [Google::Apis::YoutubeV3::CommentSnippet]
        attr_accessor :snippet
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @snippet = args[:snippet] if args.key?(:snippet)
        end
      end
      
      # 
      class ListCommentsResponse
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Serialized EventId of the request which produced this response.
        # Corresponds to the JSON property `eventId`
        # @return [String]
        attr_accessor :event_id
      
        # A list of comments that match the request criteria.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::YoutubeV3::Comment>]
        attr_accessor :items
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # commentListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The token that can be used as the value of the pageToken parameter to retrieve
        # the next page in the result set.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Paging details for lists of resources, including total number of items
        # available and number of resources returned in a single page.
        # Corresponds to the JSON property `pageInfo`
        # @return [Google::Apis::YoutubeV3::PageInfo]
        attr_accessor :page_info
      
        # Stub token pagination template to suppress results.
        # Corresponds to the JSON property `tokenPagination`
        # @return [Google::Apis::YoutubeV3::TokenPagination]
        attr_accessor :token_pagination
      
        # The visitorId identifies the visitor.
        # Corresponds to the JSON property `visitorId`
        # @return [String]
        attr_accessor :visitor_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @event_id = args[:event_id] if args.key?(:event_id)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @page_info = args[:page_info] if args.key?(:page_info)
          @token_pagination = args[:token_pagination] if args.key?(:token_pagination)
          @visitor_id = args[:visitor_id] if args.key?(:visitor_id)
        end
      end
      
      # Basic details about a comment, such as its author and text.
      class CommentSnippet
        include Google::Apis::Core::Hashable
      
        # The id of the author's YouTube channel, if any.
        # Corresponds to the JSON property `authorChannelId`
        # @return [Object]
        attr_accessor :author_channel_id
      
        # Link to the author's YouTube channel, if any.
        # Corresponds to the JSON property `authorChannelUrl`
        # @return [String]
        attr_accessor :author_channel_url
      
        # The name of the user who posted the comment.
        # Corresponds to the JSON property `authorDisplayName`
        # @return [String]
        attr_accessor :author_display_name
      
        # The URL for the avatar of the user who posted the comment.
        # Corresponds to the JSON property `authorProfileImageUrl`
        # @return [String]
        attr_accessor :author_profile_image_url
      
        # Whether the current viewer can rate this comment.
        # Corresponds to the JSON property `canRate`
        # @return [Boolean]
        attr_accessor :can_rate
        alias_method :can_rate?, :can_rate
      
        # The id of the corresponding YouTube channel. In case of a channel comment this
        # is the channel the comment refers to. In case of a video comment it's the
        # video's channel.
        # Corresponds to the JSON property `channelId`
        # @return [String]
        attr_accessor :channel_id
      
        # The total number of likes this comment has received.
        # Corresponds to the JSON property `likeCount`
        # @return [Fixnum]
        attr_accessor :like_count
      
        # The comment's moderation status. Will not be set if the comments were
        # requested through the id filter.
        # Corresponds to the JSON property `moderationStatus`
        # @return [String]
        attr_accessor :moderation_status
      
        # The unique id of the parent comment, only set for replies.
        # Corresponds to the JSON property `parentId`
        # @return [String]
        attr_accessor :parent_id
      
        # The date and time when the comment was orignally published. The value is
        # specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
        # Corresponds to the JSON property `publishedAt`
        # @return [DateTime]
        attr_accessor :published_at
      
        # The comment's text. The format is either plain text or HTML dependent on what
        # has been requested. Even the plain text representation may differ from the
        # text originally posted in that it may replace video links with video titles
        # etc.
        # Corresponds to the JSON property `textDisplay`
        # @return [String]
        attr_accessor :text_display
      
        # The comment's original raw text as initially posted or last updated. The
        # original text will only be returned if it is accessible to the viewer, which
        # is only guaranteed if the viewer is the comment's author.
        # Corresponds to the JSON property `textOriginal`
        # @return [String]
        attr_accessor :text_original
      
        # The date and time when was last updated . The value is specified in ISO 8601 (
        # YYYY-MM-DDThh:mm:ss.sZ) format.
        # Corresponds to the JSON property `updatedAt`
        # @return [DateTime]
        attr_accessor :updated_at
      
        # The ID of the video the comment refers to, if any.
        # Corresponds to the JSON property `videoId`
        # @return [String]
        attr_accessor :video_id
      
        # The rating the viewer has given to this comment. For the time being this will
        # never return RATE_TYPE_DISLIKE and instead return RATE_TYPE_NONE. This may
        # change in the future.
        # Corresponds to the JSON property `viewerRating`
        # @return [String]
        attr_accessor :viewer_rating
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @author_channel_id = args[:author_channel_id] if args.key?(:author_channel_id)
          @author_channel_url = args[:author_channel_url] if args.key?(:author_channel_url)
          @author_display_name = args[:author_display_name] if args.key?(:author_display_name)
          @author_profile_image_url = args[:author_profile_image_url] if args.key?(:author_profile_image_url)
          @can_rate = args[:can_rate] if args.key?(:can_rate)
          @channel_id = args[:channel_id] if args.key?(:channel_id)
          @like_count = args[:like_count] if args.key?(:like_count)
          @moderation_status = args[:moderation_status] if args.key?(:moderation_status)
          @parent_id = args[:parent_id] if args.key?(:parent_id)
          @published_at = args[:published_at] if args.key?(:published_at)
          @text_display = args[:text_display] if args.key?(:text_display)
          @text_original = args[:text_original] if args.key?(:text_original)
          @updated_at = args[:updated_at] if args.key?(:updated_at)
          @video_id = args[:video_id] if args.key?(:video_id)
          @viewer_rating = args[:viewer_rating] if args.key?(:viewer_rating)
        end
      end
      
      # A comment thread represents information that applies to a top level comment
      # and all its replies. It can also include the top level comment itself and some
      # of the replies.
      class CommentThread
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The ID that YouTube uses to uniquely identify the comment thread.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # commentThread".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Comments written in (direct or indirect) reply to the top level comment.
        # Corresponds to the JSON property `replies`
        # @return [Google::Apis::YoutubeV3::CommentThreadReplies]
        attr_accessor :replies
      
        # Basic details about a comment thread.
        # Corresponds to the JSON property `snippet`
        # @return [Google::Apis::YoutubeV3::CommentThreadSnippet]
        attr_accessor :snippet
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @replies = args[:replies] if args.key?(:replies)
          @snippet = args[:snippet] if args.key?(:snippet)
        end
      end
      
      # 
      class ListCommentThreadsResponse
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Serialized EventId of the request which produced this response.
        # Corresponds to the JSON property `eventId`
        # @return [String]
        attr_accessor :event_id
      
        # A list of comment threads that match the request criteria.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::YoutubeV3::CommentThread>]
        attr_accessor :items
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # commentThreadListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The token that can be used as the value of the pageToken parameter to retrieve
        # the next page in the result set.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Paging details for lists of resources, including total number of items
        # available and number of resources returned in a single page.
        # Corresponds to the JSON property `pageInfo`
        # @return [Google::Apis::YoutubeV3::PageInfo]
        attr_accessor :page_info
      
        # Stub token pagination template to suppress results.
        # Corresponds to the JSON property `tokenPagination`
        # @return [Google::Apis::YoutubeV3::TokenPagination]
        attr_accessor :token_pagination
      
        # The visitorId identifies the visitor.
        # Corresponds to the JSON property `visitorId`
        # @return [String]
        attr_accessor :visitor_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @event_id = args[:event_id] if args.key?(:event_id)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @page_info = args[:page_info] if args.key?(:page_info)
          @token_pagination = args[:token_pagination] if args.key?(:token_pagination)
          @visitor_id = args[:visitor_id] if args.key?(:visitor_id)
        end
      end
      
      # Comments written in (direct or indirect) reply to the top level comment.
      class CommentThreadReplies
        include Google::Apis::Core::Hashable
      
        # A limited number of replies. Unless the number of replies returned equals
        # total_reply_count in the snippet the returned replies are only a subset of the
        # total number of replies.
        # Corresponds to the JSON property `comments`
        # @return [Array<Google::Apis::YoutubeV3::Comment>]
        attr_accessor :comments
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @comments = args[:comments] if args.key?(:comments)
        end
      end
      
      # Basic details about a comment thread.
      class CommentThreadSnippet
        include Google::Apis::Core::Hashable
      
        # Whether the current viewer of the thread can reply to it. This is viewer
        # specific - other viewers may see a different value for this field.
        # Corresponds to the JSON property `canReply`
        # @return [Boolean]
        attr_accessor :can_reply
        alias_method :can_reply?, :can_reply
      
        # The YouTube channel the comments in the thread refer to or the channel with
        # the video the comments refer to. If video_id isn't set the comments refer to
        # the channel itself.
        # Corresponds to the JSON property `channelId`
        # @return [String]
        attr_accessor :channel_id
      
        # Whether the thread (and therefore all its comments) is visible to all YouTube
        # users.
        # Corresponds to the JSON property `isPublic`
        # @return [Boolean]
        attr_accessor :is_public
        alias_method :is_public?, :is_public
      
        # A comment represents a single YouTube comment.
        # Corresponds to the JSON property `topLevelComment`
        # @return [Google::Apis::YoutubeV3::Comment]
        attr_accessor :top_level_comment
      
        # The total number of replies (not including the top level comment).
        # Corresponds to the JSON property `totalReplyCount`
        # @return [Fixnum]
        attr_accessor :total_reply_count
      
        # The ID of the video the comments refer to, if any. No video_id implies a
        # channel discussion comment.
        # Corresponds to the JSON property `videoId`
        # @return [String]
        attr_accessor :video_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @can_reply = args[:can_reply] if args.key?(:can_reply)
          @channel_id = args[:channel_id] if args.key?(:channel_id)
          @is_public = args[:is_public] if args.key?(:is_public)
          @top_level_comment = args[:top_level_comment] if args.key?(:top_level_comment)
          @total_reply_count = args[:total_reply_count] if args.key?(:total_reply_count)
          @video_id = args[:video_id] if args.key?(:video_id)
        end
      end
      
      # Ratings schemes. The country-specific ratings are mostly for movies and shows.
      # NEXT_ID: 72
      class ContentRating
        include Google::Apis::Core::Hashable
      
        # The video's Australian Classification Board (ACB) or Australian Communications
        # and Media Authority (ACMA) rating. ACMA ratings are used to classify children'
        # s television programming.
        # Corresponds to the JSON property `acbRating`
        # @return [String]
        attr_accessor :acb_rating
      
        # The video's rating from Italy's Autorità per le Garanzie nelle Comunicazioni (
        # AGCOM).
        # Corresponds to the JSON property `agcomRating`
        # @return [String]
        attr_accessor :agcom_rating
      
        # The video's Anatel (Asociación Nacional de Televisión) rating for Chilean
        # television.
        # Corresponds to the JSON property `anatelRating`
        # @return [String]
        attr_accessor :anatel_rating
      
        # The video's British Board of Film Classification (BBFC) rating.
        # Corresponds to the JSON property `bbfcRating`
        # @return [String]
        attr_accessor :bbfc_rating
      
        # The video's rating from Thailand's Board of Film and Video Censors.
        # Corresponds to the JSON property `bfvcRating`
        # @return [String]
        attr_accessor :bfvc_rating
      
        # The video's rating from the Austrian Board of Media Classification (
        # Bundesministerium für Unterricht, Kunst und Kultur).
        # Corresponds to the JSON property `bmukkRating`
        # @return [String]
        attr_accessor :bmukk_rating
      
        # Rating system for Canadian TV - Canadian TV Classification System The video's
        # rating from the Canadian Radio-Television and Telecommunications Commission (
        # CRTC) for Canadian English-language broadcasts. For more information, see the
        # Canadian Broadcast Standards Council website.
        # Corresponds to the JSON property `catvRating`
        # @return [String]
        attr_accessor :catv_rating
      
        # The video's rating from the Canadian Radio-Television and Telecommunications
        # Commission (CRTC) for Canadian French-language broadcasts. For more
        # information, see the Canadian Broadcast Standards Council website.
        # Corresponds to the JSON property `catvfrRating`
        # @return [String]
        attr_accessor :catvfr_rating
      
        # The video's Central Board of Film Certification (CBFC - India) rating.
        # Corresponds to the JSON property `cbfcRating`
        # @return [String]
        attr_accessor :cbfc_rating
      
        # The video's Consejo de Calificación Cinematográfica (Chile) rating.
        # Corresponds to the JSON property `cccRating`
        # @return [String]
        attr_accessor :ccc_rating
      
        # The video's rating from Portugal's Comissão de Classificação de Espect´culos.
        # Corresponds to the JSON property `cceRating`
        # @return [String]
        attr_accessor :cce_rating
      
        # The video's rating in Switzerland.
        # Corresponds to the JSON property `chfilmRating`
        # @return [String]
        attr_accessor :chfilm_rating
      
        # The video's Canadian Home Video Rating System (CHVRS) rating.
        # Corresponds to the JSON property `chvrsRating`
        # @return [String]
        attr_accessor :chvrs_rating
      
        # The video's rating from the Commission de Contrôle des Films (Belgium).
        # Corresponds to the JSON property `cicfRating`
        # @return [String]
        attr_accessor :cicf_rating
      
        # The video's rating from Romania's CONSILIUL NATIONAL AL AUDIOVIZUALULUI (CNA).
        # Corresponds to the JSON property `cnaRating`
        # @return [String]
        attr_accessor :cna_rating
      
        # Rating system in France - Commission de classification cinematographique
        # Corresponds to the JSON property `cncRating`
        # @return [String]
        attr_accessor :cnc_rating
      
        # The video's rating from France's Conseil supérieur de l?audiovisuel, which
        # rates broadcast content.
        # Corresponds to the JSON property `csaRating`
        # @return [String]
        attr_accessor :csa_rating
      
        # The video's rating from Luxembourg's Commission de surveillance de la
        # classification des films (CSCF).
        # Corresponds to the JSON property `cscfRating`
        # @return [String]
        attr_accessor :cscf_rating
      
        # The video's rating in the Czech Republic.
        # Corresponds to the JSON property `czfilmRating`
        # @return [String]
        attr_accessor :czfilm_rating
      
        # The video's Departamento de Justiça, Classificação, Qualificação e Títulos (
        # DJCQT - Brazil) rating.
        # Corresponds to the JSON property `djctqRating`
        # @return [String]
        attr_accessor :djctq_rating
      
        # Reasons that explain why the video received its DJCQT (Brazil) rating.
        # Corresponds to the JSON property `djctqRatingReasons`
        # @return [Array<String>]
        attr_accessor :djctq_rating_reasons
      
        # Rating system in Turkey - Evaluation and Classification Board of the Ministry
        # of Culture and Tourism
        # Corresponds to the JSON property `ecbmctRating`
        # @return [String]
        attr_accessor :ecbmct_rating
      
        # The video's rating in Estonia.
        # Corresponds to the JSON property `eefilmRating`
        # @return [String]
        attr_accessor :eefilm_rating
      
        # The video's rating in Egypt.
        # Corresponds to the JSON property `egfilmRating`
        # @return [String]
        attr_accessor :egfilm_rating
      
        # The video's Eirin (映倫) rating. Eirin is the Japanese rating system.
        # Corresponds to the JSON property `eirinRating`
        # @return [String]
        attr_accessor :eirin_rating
      
        # The video's rating from Malaysia's Film Censorship Board.
        # Corresponds to the JSON property `fcbmRating`
        # @return [String]
        attr_accessor :fcbm_rating
      
        # The video's rating from Hong Kong's Office for Film, Newspaper and Article
        # Administration.
        # Corresponds to the JSON property `fcoRating`
        # @return [String]
        attr_accessor :fco_rating
      
        # This property has been deprecated. Use the contentDetails.contentRating.
        # cncRating instead.
        # Corresponds to the JSON property `fmocRating`
        # @return [String]
        attr_accessor :fmoc_rating
      
        # The video's rating from South Africa's Film and Publication Board.
        # Corresponds to the JSON property `fpbRating`
        # @return [String]
        attr_accessor :fpb_rating
      
        # Reasons that explain why the video received its FPB (South Africa) rating.
        # Corresponds to the JSON property `fpbRatingReasons`
        # @return [Array<String>]
        attr_accessor :fpb_rating_reasons
      
        # The video's Freiwillige Selbstkontrolle der Filmwirtschaft (FSK - Germany)
        # rating.
        # Corresponds to the JSON property `fskRating`
        # @return [String]
        attr_accessor :fsk_rating
      
        # The video's rating in Greece.
        # Corresponds to the JSON property `grfilmRating`
        # @return [String]
        attr_accessor :grfilm_rating
      
        # The video's Instituto de la Cinematografía y de las Artes Audiovisuales (ICAA -
        # Spain) rating.
        # Corresponds to the JSON property `icaaRating`
        # @return [String]
        attr_accessor :icaa_rating
      
        # The video's Irish Film Classification Office (IFCO - Ireland) rating. See the
        # IFCO website for more information.
        # Corresponds to the JSON property `ifcoRating`
        # @return [String]
        attr_accessor :ifco_rating
      
        # The video's rating in Israel.
        # Corresponds to the JSON property `ilfilmRating`
        # @return [String]
        attr_accessor :ilfilm_rating
      
        # The video's INCAA (Instituto Nacional de Cine y Artes Audiovisuales -
        # Argentina) rating.
        # Corresponds to the JSON property `incaaRating`
        # @return [String]
        attr_accessor :incaa_rating
      
        # The video's rating from the Kenya Film Classification Board.
        # Corresponds to the JSON property `kfcbRating`
        # @return [String]
        attr_accessor :kfcb_rating
      
        # voor de Classificatie van Audiovisuele Media (Netherlands).
        # Corresponds to the JSON property `kijkwijzerRating`
        # @return [String]
        attr_accessor :kijkwijzer_rating
      
        # The video's Korea Media Rating Board (영상물등급위원회) rating. The KMRB rates videos
        # in South Korea.
        # Corresponds to the JSON property `kmrbRating`
        # @return [String]
        attr_accessor :kmrb_rating
      
        # The video's rating from Indonesia's Lembaga Sensor Film.
        # Corresponds to the JSON property `lsfRating`
        # @return [String]
        attr_accessor :lsf_rating
      
        # The video's rating from Malta's Film Age-Classification Board.
        # Corresponds to the JSON property `mccaaRating`
        # @return [String]
        attr_accessor :mccaa_rating
      
        # The video's rating from the Danish Film Institute's (Det Danske Filminstitut)
        # Media Council for Children and Young People.
        # Corresponds to the JSON property `mccypRating`
        # @return [String]
        attr_accessor :mccyp_rating
      
        # The video's rating system for Vietnam - MCST
        # Corresponds to the JSON property `mcstRating`
        # @return [String]
        attr_accessor :mcst_rating
      
        # The video's rating from Singapore's Media Development Authority (MDA) and,
        # specifically, it's Board of Film Censors (BFC).
        # Corresponds to the JSON property `mdaRating`
        # @return [String]
        attr_accessor :mda_rating
      
        # The video's rating from Medietilsynet, the Norwegian Media Authority.
        # Corresponds to the JSON property `medietilsynetRating`
        # @return [String]
        attr_accessor :medietilsynet_rating
      
        # The video's rating from Finland's Kansallinen Audiovisuaalinen Instituutti (
        # National Audiovisual Institute).
        # Corresponds to the JSON property `mekuRating`
        # @return [String]
        attr_accessor :meku_rating
      
        # The rating system for MENA countries, a clone of MPAA. It is needed to
        # Corresponds to the JSON property `menaMpaaRating`
        # @return [String]
        attr_accessor :mena_mpaa_rating
      
        # The video's rating from the Ministero dei Beni e delle Attività Culturali e
        # del Turismo (Italy).
        # Corresponds to the JSON property `mibacRating`
        # @return [String]
        attr_accessor :mibac_rating
      
        # The video's Ministerio de Cultura (Colombia) rating.
        # Corresponds to the JSON property `mocRating`
        # @return [String]
        attr_accessor :moc_rating
      
        # The video's rating from Taiwan's Ministry of Culture (文化部).
        # Corresponds to the JSON property `moctwRating`
        # @return [String]
        attr_accessor :moctw_rating
      
        # The video's Motion Picture Association of America (MPAA) rating.
        # Corresponds to the JSON property `mpaaRating`
        # @return [String]
        attr_accessor :mpaa_rating
      
        # The rating system for trailer, DVD, and Ad in the US. See http://movielabs.com/
        # md/ratings/v2.3/html/US_MPAAT_Ratings.html.
        # Corresponds to the JSON property `mpaatRating`
        # @return [String]
        attr_accessor :mpaat_rating
      
        # The video's rating from the Movie and Television Review and Classification
        # Board (Philippines).
        # Corresponds to the JSON property `mtrcbRating`
        # @return [String]
        attr_accessor :mtrcb_rating
      
        # The video's rating from the Maldives National Bureau of Classification.
        # Corresponds to the JSON property `nbcRating`
        # @return [String]
        attr_accessor :nbc_rating
      
        # The video's rating in Poland.
        # Corresponds to the JSON property `nbcplRating`
        # @return [String]
        attr_accessor :nbcpl_rating
      
        # The video's rating from the Bulgarian National Film Center.
        # Corresponds to the JSON property `nfrcRating`
        # @return [String]
        attr_accessor :nfrc_rating
      
        # The video's rating from Nigeria's National Film and Video Censors Board.
        # Corresponds to the JSON property `nfvcbRating`
        # @return [String]
        attr_accessor :nfvcb_rating
      
        # The video's rating from the Nacionãlais Kino centrs (National Film Centre of
        # Latvia).
        # Corresponds to the JSON property `nkclvRating`
        # @return [String]
        attr_accessor :nkclv_rating
      
        # 
        # Corresponds to the JSON property `nmcRating`
        # @return [String]
        attr_accessor :nmc_rating
      
        # The video's Office of Film and Literature Classification (OFLC - New Zealand)
        # rating.
        # Corresponds to the JSON property `oflcRating`
        # @return [String]
        attr_accessor :oflc_rating
      
        # The video's rating in Peru.
        # Corresponds to the JSON property `pefilmRating`
        # @return [String]
        attr_accessor :pefilm_rating
      
        # The video's rating from the Hungarian Nemzeti Filmiroda, the Rating Committee
        # of the National Office of Film.
        # Corresponds to the JSON property `rcnofRating`
        # @return [String]
        attr_accessor :rcnof_rating
      
        # The video's rating in Venezuela.
        # Corresponds to the JSON property `resorteviolenciaRating`
        # @return [String]
        attr_accessor :resorteviolencia_rating
      
        # The video's General Directorate of Radio, Television and Cinematography (
        # Mexico) rating.
        # Corresponds to the JSON property `rtcRating`
        # @return [String]
        attr_accessor :rtc_rating
      
        # The video's rating from Ireland's Raidió Teilifís Éireann.
        # Corresponds to the JSON property `rteRating`
        # @return [String]
        attr_accessor :rte_rating
      
        # The video's National Film Registry of the Russian Federation (MKRF - Russia)
        # rating.
        # Corresponds to the JSON property `russiaRating`
        # @return [String]
        attr_accessor :russia_rating
      
        # The video's rating in Slovakia.
        # Corresponds to the JSON property `skfilmRating`
        # @return [String]
        attr_accessor :skfilm_rating
      
        # The video's rating in Iceland.
        # Corresponds to the JSON property `smaisRating`
        # @return [String]
        attr_accessor :smais_rating
      
        # The video's rating from Statens medieråd (Sweden's National Media Council).
        # Corresponds to the JSON property `smsaRating`
        # @return [String]
        attr_accessor :smsa_rating
      
        # The video's TV Parental Guidelines (TVPG) rating.
        # Corresponds to the JSON property `tvpgRating`
        # @return [String]
        attr_accessor :tvpg_rating
      
        # A rating that YouTube uses to identify age-restricted content.
        # Corresponds to the JSON property `ytRating`
        # @return [String]
        attr_accessor :yt_rating
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @acb_rating = args[:acb_rating] if args.key?(:acb_rating)
          @agcom_rating = args[:agcom_rating] if args.key?(:agcom_rating)
          @anatel_rating = args[:anatel_rating] if args.key?(:anatel_rating)
          @bbfc_rating = args[:bbfc_rating] if args.key?(:bbfc_rating)
          @bfvc_rating = args[:bfvc_rating] if args.key?(:bfvc_rating)
          @bmukk_rating = args[:bmukk_rating] if args.key?(:bmukk_rating)
          @catv_rating = args[:catv_rating] if args.key?(:catv_rating)
          @catvfr_rating = args[:catvfr_rating] if args.key?(:catvfr_rating)
          @cbfc_rating = args[:cbfc_rating] if args.key?(:cbfc_rating)
          @ccc_rating = args[:ccc_rating] if args.key?(:ccc_rating)
          @cce_rating = args[:cce_rating] if args.key?(:cce_rating)
          @chfilm_rating = args[:chfilm_rating] if args.key?(:chfilm_rating)
          @chvrs_rating = args[:chvrs_rating] if args.key?(:chvrs_rating)
          @cicf_rating = args[:cicf_rating] if args.key?(:cicf_rating)
          @cna_rating = args[:cna_rating] if args.key?(:cna_rating)
          @cnc_rating = args[:cnc_rating] if args.key?(:cnc_rating)
          @csa_rating = args[:csa_rating] if args.key?(:csa_rating)
          @cscf_rating = args[:cscf_rating] if args.key?(:cscf_rating)
          @czfilm_rating = args[:czfilm_rating] if args.key?(:czfilm_rating)
          @djctq_rating = args[:djctq_rating] if args.key?(:djctq_rating)
          @djctq_rating_reasons = args[:djctq_rating_reasons] if args.key?(:djctq_rating_reasons)
          @ecbmct_rating = args[:ecbmct_rating] if args.key?(:ecbmct_rating)
          @eefilm_rating = args[:eefilm_rating] if args.key?(:eefilm_rating)
          @egfilm_rating = args[:egfilm_rating] if args.key?(:egfilm_rating)
          @eirin_rating = args[:eirin_rating] if args.key?(:eirin_rating)
          @fcbm_rating = args[:fcbm_rating] if args.key?(:fcbm_rating)
          @fco_rating = args[:fco_rating] if args.key?(:fco_rating)
          @fmoc_rating = args[:fmoc_rating] if args.key?(:fmoc_rating)
          @fpb_rating = args[:fpb_rating] if args.key?(:fpb_rating)
          @fpb_rating_reasons = args[:fpb_rating_reasons] if args.key?(:fpb_rating_reasons)
          @fsk_rating = args[:fsk_rating] if args.key?(:fsk_rating)
          @grfilm_rating = args[:grfilm_rating] if args.key?(:grfilm_rating)
          @icaa_rating = args[:icaa_rating] if args.key?(:icaa_rating)
          @ifco_rating = args[:ifco_rating] if args.key?(:ifco_rating)
          @ilfilm_rating = args[:ilfilm_rating] if args.key?(:ilfilm_rating)
          @incaa_rating = args[:incaa_rating] if args.key?(:incaa_rating)
          @kfcb_rating = args[:kfcb_rating] if args.key?(:kfcb_rating)
          @kijkwijzer_rating = args[:kijkwijzer_rating] if args.key?(:kijkwijzer_rating)
          @kmrb_rating = args[:kmrb_rating] if args.key?(:kmrb_rating)
          @lsf_rating = args[:lsf_rating] if args.key?(:lsf_rating)
          @mccaa_rating = args[:mccaa_rating] if args.key?(:mccaa_rating)
          @mccyp_rating = args[:mccyp_rating] if args.key?(:mccyp_rating)
          @mcst_rating = args[:mcst_rating] if args.key?(:mcst_rating)
          @mda_rating = args[:mda_rating] if args.key?(:mda_rating)
          @medietilsynet_rating = args[:medietilsynet_rating] if args.key?(:medietilsynet_rating)
          @meku_rating = args[:meku_rating] if args.key?(:meku_rating)
          @mena_mpaa_rating = args[:mena_mpaa_rating] if args.key?(:mena_mpaa_rating)
          @mibac_rating = args[:mibac_rating] if args.key?(:mibac_rating)
          @moc_rating = args[:moc_rating] if args.key?(:moc_rating)
          @moctw_rating = args[:moctw_rating] if args.key?(:moctw_rating)
          @mpaa_rating = args[:mpaa_rating] if args.key?(:mpaa_rating)
          @mpaat_rating = args[:mpaat_rating] if args.key?(:mpaat_rating)
          @mtrcb_rating = args[:mtrcb_rating] if args.key?(:mtrcb_rating)
          @nbc_rating = args[:nbc_rating] if args.key?(:nbc_rating)
          @nbcpl_rating = args[:nbcpl_rating] if args.key?(:nbcpl_rating)
          @nfrc_rating = args[:nfrc_rating] if args.key?(:nfrc_rating)
          @nfvcb_rating = args[:nfvcb_rating] if args.key?(:nfvcb_rating)
          @nkclv_rating = args[:nkclv_rating] if args.key?(:nkclv_rating)
          @nmc_rating = args[:nmc_rating] if args.key?(:nmc_rating)
          @oflc_rating = args[:oflc_rating] if args.key?(:oflc_rating)
          @pefilm_rating = args[:pefilm_rating] if args.key?(:pefilm_rating)
          @rcnof_rating = args[:rcnof_rating] if args.key?(:rcnof_rating)
          @resorteviolencia_rating = args[:resorteviolencia_rating] if args.key?(:resorteviolencia_rating)
          @rtc_rating = args[:rtc_rating] if args.key?(:rtc_rating)
          @rte_rating = args[:rte_rating] if args.key?(:rte_rating)
          @russia_rating = args[:russia_rating] if args.key?(:russia_rating)
          @skfilm_rating = args[:skfilm_rating] if args.key?(:skfilm_rating)
          @smais_rating = args[:smais_rating] if args.key?(:smais_rating)
          @smsa_rating = args[:smsa_rating] if args.key?(:smsa_rating)
          @tvpg_rating = args[:tvpg_rating] if args.key?(:tvpg_rating)
          @yt_rating = args[:yt_rating] if args.key?(:yt_rating)
        end
      end
      
      # Geographical coordinates of a point, in WGS84.
      class GeoPoint
        include Google::Apis::Core::Hashable
      
        # Altitude above the reference ellipsoid, in meters.
        # Corresponds to the JSON property `altitude`
        # @return [Float]
        attr_accessor :altitude
      
        # Latitude in degrees.
        # Corresponds to the JSON property `latitude`
        # @return [Float]
        attr_accessor :latitude
      
        # Longitude in degrees.
        # Corresponds to the JSON property `longitude`
        # @return [Float]
        attr_accessor :longitude
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @altitude = args[:altitude] if args.key?(:altitude)
          @latitude = args[:latitude] if args.key?(:latitude)
          @longitude = args[:longitude] if args.key?(:longitude)
        end
      end
      
      # A guideCategory resource identifies a category that YouTube algorithmically
      # assigns based on a channel's content or other indicators, such as the channel'
      # s popularity. The list is similar to video categories, with the difference
      # being that a video's uploader can assign a video category but only YouTube can
      # assign a channel category.
      class GuideCategory
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The ID that YouTube uses to uniquely identify the guide category.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # guideCategory".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Basic details about a guide category.
        # Corresponds to the JSON property `snippet`
        # @return [Google::Apis::YoutubeV3::GuideCategorySnippet]
        attr_accessor :snippet
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @snippet = args[:snippet] if args.key?(:snippet)
        end
      end
      
      # 
      class ListGuideCategoriesResponse
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Serialized EventId of the request which produced this response.
        # Corresponds to the JSON property `eventId`
        # @return [String]
        attr_accessor :event_id
      
        # A list of categories that can be associated with YouTube channels. In this map,
        # the category ID is the map key, and its value is the corresponding
        # guideCategory resource.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::YoutubeV3::GuideCategory>]
        attr_accessor :items
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # guideCategoryListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The token that can be used as the value of the pageToken parameter to retrieve
        # the next page in the result set.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Paging details for lists of resources, including total number of items
        # available and number of resources returned in a single page.
        # Corresponds to the JSON property `pageInfo`
        # @return [Google::Apis::YoutubeV3::PageInfo]
        attr_accessor :page_info
      
        # The token that can be used as the value of the pageToken parameter to retrieve
        # the previous page in the result set.
        # Corresponds to the JSON property `prevPageToken`
        # @return [String]
        attr_accessor :prev_page_token
      
        # Stub token pagination template to suppress results.
        # Corresponds to the JSON property `tokenPagination`
        # @return [Google::Apis::YoutubeV3::TokenPagination]
        attr_accessor :token_pagination
      
        # The visitorId identifies the visitor.
        # Corresponds to the JSON property `visitorId`
        # @return [String]
        attr_accessor :visitor_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @event_id = args[:event_id] if args.key?(:event_id)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @page_info = args[:page_info] if args.key?(:page_info)
          @prev_page_token = args[:prev_page_token] if args.key?(:prev_page_token)
          @token_pagination = args[:token_pagination] if args.key?(:token_pagination)
          @visitor_id = args[:visitor_id] if args.key?(:visitor_id)
        end
      end
      
      # Basic details about a guide category.
      class GuideCategorySnippet
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `channelId`
        # @return [String]
        attr_accessor :channel_id
      
        # Description of the guide category.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @channel_id = args[:channel_id] if args.key?(:channel_id)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # An i18nLanguage resource identifies a UI language currently supported by
      # YouTube.
      class I18nLanguage
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The ID that YouTube uses to uniquely identify the i18n language.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # i18nLanguage".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Basic details about an i18n language, such as language code and human-readable
        # name.
        # Corresponds to the JSON property `snippet`
        # @return [Google::Apis::YoutubeV3::I18nLanguageSnippet]
        attr_accessor :snippet
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @snippet = args[:snippet] if args.key?(:snippet)
        end
      end
      
      # 
      class ListI18nLanguagesResponse
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Serialized EventId of the request which produced this response.
        # Corresponds to the JSON property `eventId`
        # @return [String]
        attr_accessor :event_id
      
        # A list of supported i18n languages. In this map, the i18n language ID is the
        # map key, and its value is the corresponding i18nLanguage resource.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::YoutubeV3::I18nLanguage>]
        attr_accessor :items
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # i18nLanguageListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The visitorId identifies the visitor.
        # Corresponds to the JSON property `visitorId`
        # @return [String]
        attr_accessor :visitor_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @event_id = args[:event_id] if args.key?(:event_id)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @visitor_id = args[:visitor_id] if args.key?(:visitor_id)
        end
      end
      
      # Basic details about an i18n language, such as language code and human-readable
      # name.
      class I18nLanguageSnippet
        include Google::Apis::Core::Hashable
      
        # A short BCP-47 code that uniquely identifies a language.
        # Corresponds to the JSON property `hl`
        # @return [String]
        attr_accessor :hl
      
        # The human-readable name of the language in the language itself.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @hl = args[:hl] if args.key?(:hl)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # A i18nRegion resource identifies a region where YouTube is available.
      class I18nRegion
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The ID that YouTube uses to uniquely identify the i18n region.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # i18nRegion".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Basic details about an i18n region, such as region code and human-readable
        # name.
        # Corresponds to the JSON property `snippet`
        # @return [Google::Apis::YoutubeV3::I18nRegionSnippet]
        attr_accessor :snippet
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @snippet = args[:snippet] if args.key?(:snippet)
        end
      end
      
      # 
      class ListI18nRegionsResponse
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Serialized EventId of the request which produced this response.
        # Corresponds to the JSON property `eventId`
        # @return [String]
        attr_accessor :event_id
      
        # A list of regions where YouTube is available. In this map, the i18n region ID
        # is the map key, and its value is the corresponding i18nRegion resource.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::YoutubeV3::I18nRegion>]
        attr_accessor :items
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # i18nRegionListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The visitorId identifies the visitor.
        # Corresponds to the JSON property `visitorId`
        # @return [String]
        attr_accessor :visitor_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @event_id = args[:event_id] if args.key?(:event_id)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @visitor_id = args[:visitor_id] if args.key?(:visitor_id)
        end
      end
      
      # Basic details about an i18n region, such as region code and human-readable
      # name.
      class I18nRegionSnippet
        include Google::Apis::Core::Hashable
      
        # The region code as a 2-letter ISO country code.
        # Corresponds to the JSON property `gl`
        # @return [String]
        attr_accessor :gl
      
        # The human-readable name of the region.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @gl = args[:gl] if args.key?(:gl)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Branding properties for images associated with the channel.
      class ImageSettings
        include Google::Apis::Core::Hashable
      
        # The URL for the background image shown on the video watch page. The image
        # should be 1200px by 615px, with a maximum file size of 128k.
        # Corresponds to the JSON property `backgroundImageUrl`
        # @return [Google::Apis::YoutubeV3::LocalizedProperty]
        attr_accessor :background_image_url
      
        # This is used only in update requests; if it's set, we use this URL to generate
        # all of the above banner URLs.
        # Corresponds to the JSON property `bannerExternalUrl`
        # @return [String]
        attr_accessor :banner_external_url
      
        # Banner image. Desktop size (1060x175).
        # Corresponds to the JSON property `bannerImageUrl`
        # @return [String]
        attr_accessor :banner_image_url
      
        # Banner image. Mobile size high resolution (1440x395).
        # Corresponds to the JSON property `bannerMobileExtraHdImageUrl`
        # @return [String]
        attr_accessor :banner_mobile_extra_hd_image_url
      
        # Banner image. Mobile size high resolution (1280x360).
        # Corresponds to the JSON property `bannerMobileHdImageUrl`
        # @return [String]
        attr_accessor :banner_mobile_hd_image_url
      
        # Banner image. Mobile size (640x175).
        # Corresponds to the JSON property `bannerMobileImageUrl`
        # @return [String]
        attr_accessor :banner_mobile_image_url
      
        # Banner image. Mobile size low resolution (320x88).
        # Corresponds to the JSON property `bannerMobileLowImageUrl`
        # @return [String]
        attr_accessor :banner_mobile_low_image_url
      
        # Banner image. Mobile size medium/high resolution (960x263).
        # Corresponds to the JSON property `bannerMobileMediumHdImageUrl`
        # @return [String]
        attr_accessor :banner_mobile_medium_hd_image_url
      
        # Banner image. Tablet size extra high resolution (2560x424).
        # Corresponds to the JSON property `bannerTabletExtraHdImageUrl`
        # @return [String]
        attr_accessor :banner_tablet_extra_hd_image_url
      
        # Banner image. Tablet size high resolution (2276x377).
        # Corresponds to the JSON property `bannerTabletHdImageUrl`
        # @return [String]
        attr_accessor :banner_tablet_hd_image_url
      
        # Banner image. Tablet size (1707x283).
        # Corresponds to the JSON property `bannerTabletImageUrl`
        # @return [String]
        attr_accessor :banner_tablet_image_url
      
        # Banner image. Tablet size low resolution (1138x188).
        # Corresponds to the JSON property `bannerTabletLowImageUrl`
        # @return [String]
        attr_accessor :banner_tablet_low_image_url
      
        # Banner image. TV size high resolution (1920x1080).
        # Corresponds to the JSON property `bannerTvHighImageUrl`
        # @return [String]
        attr_accessor :banner_tv_high_image_url
      
        # Banner image. TV size extra high resolution (2120x1192).
        # Corresponds to the JSON property `bannerTvImageUrl`
        # @return [String]
        attr_accessor :banner_tv_image_url
      
        # Banner image. TV size low resolution (854x480).
        # Corresponds to the JSON property `bannerTvLowImageUrl`
        # @return [String]
        attr_accessor :banner_tv_low_image_url
      
        # Banner image. TV size medium resolution (1280x720).
        # Corresponds to the JSON property `bannerTvMediumImageUrl`
        # @return [String]
        attr_accessor :banner_tv_medium_image_url
      
        # The image map script for the large banner image.
        # Corresponds to the JSON property `largeBrandedBannerImageImapScript`
        # @return [Google::Apis::YoutubeV3::LocalizedProperty]
        attr_accessor :large_branded_banner_image_imap_script
      
        # The URL for the 854px by 70px image that appears below the video player in the
        # expanded video view of the video watch page.
        # Corresponds to the JSON property `largeBrandedBannerImageUrl`
        # @return [Google::Apis::YoutubeV3::LocalizedProperty]
        attr_accessor :large_branded_banner_image_url
      
        # The image map script for the small banner image.
        # Corresponds to the JSON property `smallBrandedBannerImageImapScript`
        # @return [Google::Apis::YoutubeV3::LocalizedProperty]
        attr_accessor :small_branded_banner_image_imap_script
      
        # The URL for the 640px by 70px banner image that appears below the video player
        # in the default view of the video watch page.
        # Corresponds to the JSON property `smallBrandedBannerImageUrl`
        # @return [Google::Apis::YoutubeV3::LocalizedProperty]
        attr_accessor :small_branded_banner_image_url
      
        # The URL for a 1px by 1px tracking pixel that can be used to collect statistics
        # for views of the channel or video pages.
        # Corresponds to the JSON property `trackingImageUrl`
        # @return [String]
        attr_accessor :tracking_image_url
      
        # The URL for the image that appears above the top-left corner of the video
        # player. This is a 25-pixel-high image with a flexible width that cannot exceed
        # 170 pixels.
        # Corresponds to the JSON property `watchIconImageUrl`
        # @return [String]
        attr_accessor :watch_icon_image_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @background_image_url = args[:background_image_url] if args.key?(:background_image_url)
          @banner_external_url = args[:banner_external_url] if args.key?(:banner_external_url)
          @banner_image_url = args[:banner_image_url] if args.key?(:banner_image_url)
          @banner_mobile_extra_hd_image_url = args[:banner_mobile_extra_hd_image_url] if args.key?(:banner_mobile_extra_hd_image_url)
          @banner_mobile_hd_image_url = args[:banner_mobile_hd_image_url] if args.key?(:banner_mobile_hd_image_url)
          @banner_mobile_image_url = args[:banner_mobile_image_url] if args.key?(:banner_mobile_image_url)
          @banner_mobile_low_image_url = args[:banner_mobile_low_image_url] if args.key?(:banner_mobile_low_image_url)
          @banner_mobile_medium_hd_image_url = args[:banner_mobile_medium_hd_image_url] if args.key?(:banner_mobile_medium_hd_image_url)
          @banner_tablet_extra_hd_image_url = args[:banner_tablet_extra_hd_image_url] if args.key?(:banner_tablet_extra_hd_image_url)
          @banner_tablet_hd_image_url = args[:banner_tablet_hd_image_url] if args.key?(:banner_tablet_hd_image_url)
          @banner_tablet_image_url = args[:banner_tablet_image_url] if args.key?(:banner_tablet_image_url)
          @banner_tablet_low_image_url = args[:banner_tablet_low_image_url] if args.key?(:banner_tablet_low_image_url)
          @banner_tv_high_image_url = args[:banner_tv_high_image_url] if args.key?(:banner_tv_high_image_url)
          @banner_tv_image_url = args[:banner_tv_image_url] if args.key?(:banner_tv_image_url)
          @banner_tv_low_image_url = args[:banner_tv_low_image_url] if args.key?(:banner_tv_low_image_url)
          @banner_tv_medium_image_url = args[:banner_tv_medium_image_url] if args.key?(:banner_tv_medium_image_url)
          @large_branded_banner_image_imap_script = args[:large_branded_banner_image_imap_script] if args.key?(:large_branded_banner_image_imap_script)
          @large_branded_banner_image_url = args[:large_branded_banner_image_url] if args.key?(:large_branded_banner_image_url)
          @small_branded_banner_image_imap_script = args[:small_branded_banner_image_imap_script] if args.key?(:small_branded_banner_image_imap_script)
          @small_branded_banner_image_url = args[:small_branded_banner_image_url] if args.key?(:small_branded_banner_image_url)
          @tracking_image_url = args[:tracking_image_url] if args.key?(:tracking_image_url)
          @watch_icon_image_url = args[:watch_icon_image_url] if args.key?(:watch_icon_image_url)
        end
      end
      
      # Describes information necessary for ingesting an RTMP or an HTTP stream.
      class IngestionInfo
        include Google::Apis::Core::Hashable
      
        # The backup ingestion URL that you should use to stream video to YouTube. You
        # have the option of simultaneously streaming the content that you are sending
        # to the ingestionAddress to this URL.
        # Corresponds to the JSON property `backupIngestionAddress`
        # @return [String]
        attr_accessor :backup_ingestion_address
      
        # The primary ingestion URL that you should use to stream video to YouTube. You
        # must stream video to this URL.
        # Depending on which application or tool you use to encode your video stream,
        # you may need to enter the stream URL and stream name separately or you may
        # need to concatenate them in the following format:
        # STREAM_URL/STREAM_NAME
        # Corresponds to the JSON property `ingestionAddress`
        # @return [String]
        attr_accessor :ingestion_address
      
        # The HTTP or RTMP stream name that YouTube assigns to the video stream.
        # Corresponds to the JSON property `streamName`
        # @return [String]
        attr_accessor :stream_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @backup_ingestion_address = args[:backup_ingestion_address] if args.key?(:backup_ingestion_address)
          @ingestion_address = args[:ingestion_address] if args.key?(:ingestion_address)
          @stream_name = args[:stream_name] if args.key?(:stream_name)
        end
      end
      
      # 
      class InvideoBranding
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `imageBytes`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :image_bytes
      
        # 
        # Corresponds to the JSON property `imageUrl`
        # @return [String]
        attr_accessor :image_url
      
        # Describes the spatial position of a visual widget inside a video. It is a
        # union of various position types, out of which only will be set one.
        # Corresponds to the JSON property `position`
        # @return [Google::Apis::YoutubeV3::InvideoPosition]
        attr_accessor :position
      
        # 
        # Corresponds to the JSON property `targetChannelId`
        # @return [String]
        attr_accessor :target_channel_id
      
        # Describes a temporal position of a visual widget inside a video.
        # Corresponds to the JSON property `timing`
        # @return [Google::Apis::YoutubeV3::InvideoTiming]
        attr_accessor :timing
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @image_bytes = args[:image_bytes] if args.key?(:image_bytes)
          @image_url = args[:image_url] if args.key?(:image_url)
          @position = args[:position] if args.key?(:position)
          @target_channel_id = args[:target_channel_id] if args.key?(:target_channel_id)
          @timing = args[:timing] if args.key?(:timing)
        end
      end
      
      # Describes the spatial position of a visual widget inside a video. It is a
      # union of various position types, out of which only will be set one.
      class InvideoPosition
        include Google::Apis::Core::Hashable
      
        # Describes in which corner of the video the visual widget will appear.
        # Corresponds to the JSON property `cornerPosition`
        # @return [String]
        attr_accessor :corner_position
      
        # Defines the position type.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @corner_position = args[:corner_position] if args.key?(:corner_position)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Describes an invideo promotion campaign consisting of multiple promoted items.
      # A campaign belongs to a single channel_id.
      class InvideoPromotion
        include Google::Apis::Core::Hashable
      
        # Describes a temporal position of a visual widget inside a video.
        # Corresponds to the JSON property `defaultTiming`
        # @return [Google::Apis::YoutubeV3::InvideoTiming]
        attr_accessor :default_timing
      
        # List of promoted items in decreasing priority.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::YoutubeV3::PromotedItem>]
        attr_accessor :items
      
        # Describes the spatial position of a visual widget inside a video. It is a
        # union of various position types, out of which only will be set one.
        # Corresponds to the JSON property `position`
        # @return [Google::Apis::YoutubeV3::InvideoPosition]
        attr_accessor :position
      
        # Indicates whether the channel's promotional campaign uses "smart timing." This
        # feature attempts to show promotions at a point in the video when they are more
        # likely to be clicked and less likely to disrupt the viewing experience. This
        # feature also picks up a single promotion to show on each video.
        # Corresponds to the JSON property `useSmartTiming`
        # @return [Boolean]
        attr_accessor :use_smart_timing
        alias_method :use_smart_timing?, :use_smart_timing
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @default_timing = args[:default_timing] if args.key?(:default_timing)
          @items = args[:items] if args.key?(:items)
          @position = args[:position] if args.key?(:position)
          @use_smart_timing = args[:use_smart_timing] if args.key?(:use_smart_timing)
        end
      end
      
      # Describes a temporal position of a visual widget inside a video.
      class InvideoTiming
        include Google::Apis::Core::Hashable
      
        # Defines the duration in milliseconds for which the promotion should be
        # displayed. If missing, the client should use the default.
        # Corresponds to the JSON property `durationMs`
        # @return [Fixnum]
        attr_accessor :duration_ms
      
        # Defines the time at which the promotion will appear. Depending on the value of
        # type the value of the offsetMs field will represent a time offset from the
        # start or from the end of the video, expressed in milliseconds.
        # Corresponds to the JSON property `offsetMs`
        # @return [Fixnum]
        attr_accessor :offset_ms
      
        # Describes a timing type. If the value is offsetFromStart, then the offsetMs
        # field represents an offset from the start of the video. If the value is
        # offsetFromEnd, then the offsetMs field represents an offset from the end of
        # the video.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @duration_ms = args[:duration_ms] if args.key?(:duration_ms)
          @offset_ms = args[:offset_ms] if args.key?(:offset_ms)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # 
      class LanguageTag
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # 
      class LevelDetails
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_name = args[:display_name] if args.key?(:display_name)
        end
      end
      
      # A liveBroadcast resource represents an event that will be streamed, via live
      # video, on YouTube.
      class LiveBroadcast
        include Google::Apis::Core::Hashable
      
        # Detailed settings of a broadcast.
        # Corresponds to the JSON property `contentDetails`
        # @return [Google::Apis::YoutubeV3::LiveBroadcastContentDetails]
        attr_accessor :content_details
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The ID that YouTube assigns to uniquely identify the broadcast.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # liveBroadcast".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The snippet object contains basic details about the event, including its title,
        # description, start time, and end time.
        # Corresponds to the JSON property `snippet`
        # @return [Google::Apis::YoutubeV3::LiveBroadcastSnippet]
        attr_accessor :snippet
      
        # Statistics about the live broadcast. These represent a snapshot of the values
        # at the time of the request. Statistics are only returned for live broadcasts.
        # Corresponds to the JSON property `statistics`
        # @return [Google::Apis::YoutubeV3::LiveBroadcastStatistics]
        attr_accessor :statistics
      
        # The status object contains information about the event's status.
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::YoutubeV3::LiveBroadcastStatus]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content_details = args[:content_details] if args.key?(:content_details)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @snippet = args[:snippet] if args.key?(:snippet)
          @statistics = args[:statistics] if args.key?(:statistics)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # Detailed settings of a broadcast.
      class LiveBroadcastContentDetails
        include Google::Apis::Core::Hashable
      
        # This value uniquely identifies the live stream bound to the broadcast.
        # Corresponds to the JSON property `boundStreamId`
        # @return [String]
        attr_accessor :bound_stream_id
      
        # The date and time that the live stream referenced by boundStreamId was last
        # updated.
        # Corresponds to the JSON property `boundStreamLastUpdateTimeMs`
        # @return [DateTime]
        attr_accessor :bound_stream_last_update_time_ms
      
        # 
        # Corresponds to the JSON property `closedCaptionsType`
        # @return [String]
        attr_accessor :closed_captions_type
      
        # This setting indicates whether auto start is enabled for this broadcast.
        # Corresponds to the JSON property `enableAutoStart`
        # @return [Boolean]
        attr_accessor :enable_auto_start
        alias_method :enable_auto_start?, :enable_auto_start
      
        # This setting indicates whether HTTP POST closed captioning is enabled for this
        # broadcast. The ingestion URL of the closed captions is returned through the
        # liveStreams API. This is mutually exclusive with using the
        # closed_captions_type property, and is equivalent to setting
        # closed_captions_type to CLOSED_CAPTIONS_HTTP_POST.
        # Corresponds to the JSON property `enableClosedCaptions`
        # @return [Boolean]
        attr_accessor :enable_closed_captions
        alias_method :enable_closed_captions?, :enable_closed_captions
      
        # This setting indicates whether YouTube should enable content encryption for
        # the broadcast.
        # Corresponds to the JSON property `enableContentEncryption`
        # @return [Boolean]
        attr_accessor :enable_content_encryption
        alias_method :enable_content_encryption?, :enable_content_encryption
      
        # This setting determines whether viewers can access DVR controls while watching
        # the video. DVR controls enable the viewer to control the video playback
        # experience by pausing, rewinding, or fast forwarding content. The default
        # value for this property is true.
        # Important: You must set the value to true and also set the enableArchive
        # property's value to true if you want to make playback available immediately
        # after the broadcast ends.
        # Corresponds to the JSON property `enableDvr`
        # @return [Boolean]
        attr_accessor :enable_dvr
        alias_method :enable_dvr?, :enable_dvr
      
        # This setting indicates whether the broadcast video can be played in an
        # embedded player. If you choose to archive the video (using the enableArchive
        # property), this setting will also apply to the archived video.
        # Corresponds to the JSON property `enableEmbed`
        # @return [Boolean]
        attr_accessor :enable_embed
        alias_method :enable_embed?, :enable_embed
      
        # Indicates whether this broadcast has low latency enabled.
        # Corresponds to the JSON property `enableLowLatency`
        # @return [Boolean]
        attr_accessor :enable_low_latency
        alias_method :enable_low_latency?, :enable_low_latency
      
        # If both this and enable_low_latency are set, they must match. LATENCY_NORMAL
        # should match enable_low_latency=false LATENCY_LOW should match
        # enable_low_latency=true LATENCY_ULTRA_LOW should have enable_low_latency
        # omitted.
        # Corresponds to the JSON property `latencyPreference`
        # @return [String]
        attr_accessor :latency_preference
      
        # 
        # Corresponds to the JSON property `mesh`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :mesh
      
        # Settings and Info of the monitor stream
        # Corresponds to the JSON property `monitorStream`
        # @return [Google::Apis::YoutubeV3::MonitorStreamInfo]
        attr_accessor :monitor_stream
      
        # The projection format of this broadcast. This defaults to rectangular.
        # Corresponds to the JSON property `projection`
        # @return [String]
        attr_accessor :projection
      
        # Automatically start recording after the event goes live. The default value for
        # this property is true.
        # Important: You must also set the enableDvr property's value to true if you
        # want the playback to be available immediately after the broadcast ends. If you
        # set this property's value to true but do not also set the enableDvr property
        # to true, there may be a delay of around one day before the archived video will
        # be available for playback.
        # Corresponds to the JSON property `recordFromStart`
        # @return [Boolean]
        attr_accessor :record_from_start
        alias_method :record_from_start?, :record_from_start
      
        # This setting indicates whether the broadcast should automatically begin with
        # an in-stream slate when you update the broadcast's status to live. After
        # updating the status, you then need to send a liveCuepoints.insert request that
        # sets the cuepoint's eventState to end to remove the in-stream slate and make
        # your broadcast stream visible to viewers.
        # Corresponds to the JSON property `startWithSlate`
        # @return [Boolean]
        attr_accessor :start_with_slate
        alias_method :start_with_slate?, :start_with_slate
      
        # 
        # Corresponds to the JSON property `stereoLayout`
        # @return [String]
        attr_accessor :stereo_layout
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bound_stream_id = args[:bound_stream_id] if args.key?(:bound_stream_id)
          @bound_stream_last_update_time_ms = args[:bound_stream_last_update_time_ms] if args.key?(:bound_stream_last_update_time_ms)
          @closed_captions_type = args[:closed_captions_type] if args.key?(:closed_captions_type)
          @enable_auto_start = args[:enable_auto_start] if args.key?(:enable_auto_start)
          @enable_closed_captions = args[:enable_closed_captions] if args.key?(:enable_closed_captions)
          @enable_content_encryption = args[:enable_content_encryption] if args.key?(:enable_content_encryption)
          @enable_dvr = args[:enable_dvr] if args.key?(:enable_dvr)
          @enable_embed = args[:enable_embed] if args.key?(:enable_embed)
          @enable_low_latency = args[:enable_low_latency] if args.key?(:enable_low_latency)
          @latency_preference = args[:latency_preference] if args.key?(:latency_preference)
          @mesh = args[:mesh] if args.key?(:mesh)
          @monitor_stream = args[:monitor_stream] if args.key?(:monitor_stream)
          @projection = args[:projection] if args.key?(:projection)
          @record_from_start = args[:record_from_start] if args.key?(:record_from_start)
          @start_with_slate = args[:start_with_slate] if args.key?(:start_with_slate)
          @stereo_layout = args[:stereo_layout] if args.key?(:stereo_layout)
        end
      end
      
      # 
      class ListLiveBroadcastsResponse
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Serialized EventId of the request which produced this response.
        # Corresponds to the JSON property `eventId`
        # @return [String]
        attr_accessor :event_id
      
        # A list of broadcasts that match the request criteria.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::YoutubeV3::LiveBroadcast>]
        attr_accessor :items
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # liveBroadcastListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The token that can be used as the value of the pageToken parameter to retrieve
        # the next page in the result set.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Paging details for lists of resources, including total number of items
        # available and number of resources returned in a single page.
        # Corresponds to the JSON property `pageInfo`
        # @return [Google::Apis::YoutubeV3::PageInfo]
        attr_accessor :page_info
      
        # The token that can be used as the value of the pageToken parameter to retrieve
        # the previous page in the result set.
        # Corresponds to the JSON property `prevPageToken`
        # @return [String]
        attr_accessor :prev_page_token
      
        # Stub token pagination template to suppress results.
        # Corresponds to the JSON property `tokenPagination`
        # @return [Google::Apis::YoutubeV3::TokenPagination]
        attr_accessor :token_pagination
      
        # The visitorId identifies the visitor.
        # Corresponds to the JSON property `visitorId`
        # @return [String]
        attr_accessor :visitor_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @event_id = args[:event_id] if args.key?(:event_id)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @page_info = args[:page_info] if args.key?(:page_info)
          @prev_page_token = args[:prev_page_token] if args.key?(:prev_page_token)
          @token_pagination = args[:token_pagination] if args.key?(:token_pagination)
          @visitor_id = args[:visitor_id] if args.key?(:visitor_id)
        end
      end
      
      # 
      class LiveBroadcastSnippet
        include Google::Apis::Core::Hashable
      
        # The date and time that the broadcast actually ended. This information is only
        # available once the broadcast's state is complete. The value is specified in
        # ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
        # Corresponds to the JSON property `actualEndTime`
        # @return [DateTime]
        attr_accessor :actual_end_time
      
        # The date and time that the broadcast actually started. This information is
        # only available once the broadcast's state is live. The value is specified in
        # ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
        # Corresponds to the JSON property `actualStartTime`
        # @return [DateTime]
        attr_accessor :actual_start_time
      
        # 
        # Corresponds to the JSON property `broadcastType`
        # @return [String]
        attr_accessor :broadcast_type
      
        # The ID that YouTube uses to uniquely identify the channel that is publishing
        # the broadcast.
        # Corresponds to the JSON property `channelId`
        # @return [String]
        attr_accessor :channel_id
      
        # The broadcast's description. As with the title, you can set this field by
        # modifying the broadcast resource or by setting the description field of the
        # corresponding video resource.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # 
        # Corresponds to the JSON property `isDefaultBroadcast`
        # @return [Boolean]
        attr_accessor :is_default_broadcast
        alias_method :is_default_broadcast?, :is_default_broadcast
      
        # The id of the live chat for this broadcast.
        # Corresponds to the JSON property `liveChatId`
        # @return [String]
        attr_accessor :live_chat_id
      
        # The date and time that the broadcast was added to YouTube's live broadcast
        # schedule. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
        # Corresponds to the JSON property `publishedAt`
        # @return [DateTime]
        attr_accessor :published_at
      
        # The date and time that the broadcast is scheduled to end. The value is
        # specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
        # Corresponds to the JSON property `scheduledEndTime`
        # @return [DateTime]
        attr_accessor :scheduled_end_time
      
        # The date and time that the broadcast is scheduled to start. The value is
        # specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
        # Corresponds to the JSON property `scheduledStartTime`
        # @return [DateTime]
        attr_accessor :scheduled_start_time
      
        # Internal representation of thumbnails for a YouTube resource.
        # Corresponds to the JSON property `thumbnails`
        # @return [Google::Apis::YoutubeV3::ThumbnailDetails]
        attr_accessor :thumbnails
      
        # The broadcast's title. Note that the broadcast represents exactly one YouTube
        # video. You can set this field by modifying the broadcast resource or by
        # setting the title field of the corresponding video resource.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @actual_end_time = args[:actual_end_time] if args.key?(:actual_end_time)
          @actual_start_time = args[:actual_start_time] if args.key?(:actual_start_time)
          @broadcast_type = args[:broadcast_type] if args.key?(:broadcast_type)
          @channel_id = args[:channel_id] if args.key?(:channel_id)
          @description = args[:description] if args.key?(:description)
          @is_default_broadcast = args[:is_default_broadcast] if args.key?(:is_default_broadcast)
          @live_chat_id = args[:live_chat_id] if args.key?(:live_chat_id)
          @published_at = args[:published_at] if args.key?(:published_at)
          @scheduled_end_time = args[:scheduled_end_time] if args.key?(:scheduled_end_time)
          @scheduled_start_time = args[:scheduled_start_time] if args.key?(:scheduled_start_time)
          @thumbnails = args[:thumbnails] if args.key?(:thumbnails)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Statistics about the live broadcast. These represent a snapshot of the values
      # at the time of the request. Statistics are only returned for live broadcasts.
      class LiveBroadcastStatistics
        include Google::Apis::Core::Hashable
      
        # The number of viewers currently watching the broadcast. The property and its
        # value will be present if the broadcast has current viewers and the broadcast
        # owner has not hidden the viewcount for the video. Note that YouTube stops
        # tracking the number of concurrent viewers for a broadcast when the broadcast
        # ends. So, this property would not identify the number of viewers watching an
        # archived video of a live broadcast that already ended.
        # Corresponds to the JSON property `concurrentViewers`
        # @return [Fixnum]
        attr_accessor :concurrent_viewers
      
        # The total number of live chat messages currently on the broadcast. The
        # property and its value will be present if the broadcast is public, has the
        # live chat feature enabled, and has at least one message. Note that this field
        # will not be filled after the broadcast ends. So this property would not
        # identify the number of chat messages for an archived video of a completed live
        # broadcast.
        # Corresponds to the JSON property `totalChatCount`
        # @return [Fixnum]
        attr_accessor :total_chat_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @concurrent_viewers = args[:concurrent_viewers] if args.key?(:concurrent_viewers)
          @total_chat_count = args[:total_chat_count] if args.key?(:total_chat_count)
        end
      end
      
      # 
      class LiveBroadcastStatus
        include Google::Apis::Core::Hashable
      
        # The broadcast's status. The status can be updated using the API's
        # liveBroadcasts.transition method.
        # Corresponds to the JSON property `lifeCycleStatus`
        # @return [String]
        attr_accessor :life_cycle_status
      
        # Priority of the live broadcast event (internal state).
        # Corresponds to the JSON property `liveBroadcastPriority`
        # @return [String]
        attr_accessor :live_broadcast_priority
      
        # The broadcast's privacy status. Note that the broadcast represents exactly one
        # YouTube video, so the privacy settings are identical to those supported for
        # videos. In addition, you can set this field by modifying the broadcast
        # resource or by setting the privacyStatus field of the corresponding video
        # resource.
        # Corresponds to the JSON property `privacyStatus`
        # @return [String]
        attr_accessor :privacy_status
      
        # The broadcast's recording status.
        # Corresponds to the JSON property `recordingStatus`
        # @return [String]
        attr_accessor :recording_status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @life_cycle_status = args[:life_cycle_status] if args.key?(:life_cycle_status)
          @live_broadcast_priority = args[:live_broadcast_priority] if args.key?(:live_broadcast_priority)
          @privacy_status = args[:privacy_status] if args.key?(:privacy_status)
          @recording_status = args[:recording_status] if args.key?(:recording_status)
        end
      end
      
      # A liveChatBan resource represents a ban for a YouTube live chat.
      class LiveChatBan
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The ID that YouTube assigns to uniquely identify the ban.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # liveChatBan".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The snippet object contains basic details about the ban.
        # Corresponds to the JSON property `snippet`
        # @return [Google::Apis::YoutubeV3::LiveChatBanSnippet]
        attr_accessor :snippet
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @snippet = args[:snippet] if args.key?(:snippet)
        end
      end
      
      # 
      class LiveChatBanSnippet
        include Google::Apis::Core::Hashable
      
        # The duration of a ban, only filled if the ban has type TEMPORARY.
        # Corresponds to the JSON property `banDurationSeconds`
        # @return [Fixnum]
        attr_accessor :ban_duration_seconds
      
        # 
        # Corresponds to the JSON property `bannedUserDetails`
        # @return [Google::Apis::YoutubeV3::ChannelProfileDetails]
        attr_accessor :banned_user_details
      
        # The chat this ban is pertinent to.
        # Corresponds to the JSON property `liveChatId`
        # @return [String]
        attr_accessor :live_chat_id
      
        # The type of ban.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ban_duration_seconds = args[:ban_duration_seconds] if args.key?(:ban_duration_seconds)
          @banned_user_details = args[:banned_user_details] if args.key?(:banned_user_details)
          @live_chat_id = args[:live_chat_id] if args.key?(:live_chat_id)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # 
      class LiveChatFanFundingEventDetails
        include Google::Apis::Core::Hashable
      
        # A rendered string that displays the fund amount and currency to the user.
        # Corresponds to the JSON property `amountDisplayString`
        # @return [String]
        attr_accessor :amount_display_string
      
        # The amount of the fund.
        # Corresponds to the JSON property `amountMicros`
        # @return [Fixnum]
        attr_accessor :amount_micros
      
        # The currency in which the fund was made.
        # Corresponds to the JSON property `currency`
        # @return [String]
        attr_accessor :currency
      
        # The comment added by the user to this fan funding event.
        # Corresponds to the JSON property `userComment`
        # @return [String]
        attr_accessor :user_comment
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @amount_display_string = args[:amount_display_string] if args.key?(:amount_display_string)
          @amount_micros = args[:amount_micros] if args.key?(:amount_micros)
          @currency = args[:currency] if args.key?(:currency)
          @user_comment = args[:user_comment] if args.key?(:user_comment)
        end
      end
      
      # A liveChatMessage resource represents a chat message in a YouTube Live Chat.
      class LiveChatMessage
        include Google::Apis::Core::Hashable
      
        # The authorDetails object contains basic details about the user that posted
        # this message.
        # Corresponds to the JSON property `authorDetails`
        # @return [Google::Apis::YoutubeV3::LiveChatMessageAuthorDetails]
        attr_accessor :author_details
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The ID that YouTube assigns to uniquely identify the message.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # liveChatMessage".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The snippet object contains basic details about the message.
        # Corresponds to the JSON property `snippet`
        # @return [Google::Apis::YoutubeV3::LiveChatMessageSnippet]
        attr_accessor :snippet
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @author_details = args[:author_details] if args.key?(:author_details)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @snippet = args[:snippet] if args.key?(:snippet)
        end
      end
      
      # 
      class LiveChatMessageAuthorDetails
        include Google::Apis::Core::Hashable
      
        # The YouTube channel ID.
        # Corresponds to the JSON property `channelId`
        # @return [String]
        attr_accessor :channel_id
      
        # The channel's URL.
        # Corresponds to the JSON property `channelUrl`
        # @return [String]
        attr_accessor :channel_url
      
        # The channel's display name.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Whether the author is a moderator of the live chat.
        # Corresponds to the JSON property `isChatModerator`
        # @return [Boolean]
        attr_accessor :is_chat_moderator
        alias_method :is_chat_moderator?, :is_chat_moderator
      
        # Whether the author is the owner of the live chat.
        # Corresponds to the JSON property `isChatOwner`
        # @return [Boolean]
        attr_accessor :is_chat_owner
        alias_method :is_chat_owner?, :is_chat_owner
      
        # Whether the author is a sponsor of the live chat.
        # Corresponds to the JSON property `isChatSponsor`
        # @return [Boolean]
        attr_accessor :is_chat_sponsor
        alias_method :is_chat_sponsor?, :is_chat_sponsor
      
        # Whether the author's identity has been verified by YouTube.
        # Corresponds to the JSON property `isVerified`
        # @return [Boolean]
        attr_accessor :is_verified
        alias_method :is_verified?, :is_verified
      
        # The channels's avatar URL.
        # Corresponds to the JSON property `profileImageUrl`
        # @return [String]
        attr_accessor :profile_image_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @channel_id = args[:channel_id] if args.key?(:channel_id)
          @channel_url = args[:channel_url] if args.key?(:channel_url)
          @display_name = args[:display_name] if args.key?(:display_name)
          @is_chat_moderator = args[:is_chat_moderator] if args.key?(:is_chat_moderator)
          @is_chat_owner = args[:is_chat_owner] if args.key?(:is_chat_owner)
          @is_chat_sponsor = args[:is_chat_sponsor] if args.key?(:is_chat_sponsor)
          @is_verified = args[:is_verified] if args.key?(:is_verified)
          @profile_image_url = args[:profile_image_url] if args.key?(:profile_image_url)
        end
      end
      
      # 
      class LiveChatMessageDeletedDetails
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `deletedMessageId`
        # @return [String]
        attr_accessor :deleted_message_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @deleted_message_id = args[:deleted_message_id] if args.key?(:deleted_message_id)
        end
      end
      
      # 
      class LiveChatMessageListResponse
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Serialized EventId of the request which produced this response.
        # Corresponds to the JSON property `eventId`
        # @return [String]
        attr_accessor :event_id
      
        # A list of live chat messages.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::YoutubeV3::LiveChatMessage>]
        attr_accessor :items
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # liveChatMessageListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The token that can be used as the value of the pageToken parameter to retrieve
        # the next page in the result set.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The date and time when the underlying stream went offline. The value is
        # specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
        # Corresponds to the JSON property `offlineAt`
        # @return [DateTime]
        attr_accessor :offline_at
      
        # Paging details for lists of resources, including total number of items
        # available and number of resources returned in a single page.
        # Corresponds to the JSON property `pageInfo`
        # @return [Google::Apis::YoutubeV3::PageInfo]
        attr_accessor :page_info
      
        # The amount of time the client should wait before polling again.
        # Corresponds to the JSON property `pollingIntervalMillis`
        # @return [Fixnum]
        attr_accessor :polling_interval_millis
      
        # Stub token pagination template to suppress results.
        # Corresponds to the JSON property `tokenPagination`
        # @return [Google::Apis::YoutubeV3::TokenPagination]
        attr_accessor :token_pagination
      
        # The visitorId identifies the visitor.
        # Corresponds to the JSON property `visitorId`
        # @return [String]
        attr_accessor :visitor_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @event_id = args[:event_id] if args.key?(:event_id)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @offline_at = args[:offline_at] if args.key?(:offline_at)
          @page_info = args[:page_info] if args.key?(:page_info)
          @polling_interval_millis = args[:polling_interval_millis] if args.key?(:polling_interval_millis)
          @token_pagination = args[:token_pagination] if args.key?(:token_pagination)
          @visitor_id = args[:visitor_id] if args.key?(:visitor_id)
        end
      end
      
      # 
      class LiveChatMessageRetractedDetails
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `retractedMessageId`
        # @return [String]
        attr_accessor :retracted_message_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @retracted_message_id = args[:retracted_message_id] if args.key?(:retracted_message_id)
        end
      end
      
      # 
      class LiveChatMessageSnippet
        include Google::Apis::Core::Hashable
      
        # The ID of the user that authored this message, this field is not always filled.
        # textMessageEvent - the user that wrote the message fanFundingEvent - the user
        # that funded the broadcast newSponsorEvent - the user that just became a
        # sponsor messageDeletedEvent - the moderator that took the action
        # messageRetractedEvent - the author that retracted their message
        # userBannedEvent - the moderator that took the action superChatEvent - the user
        # that made the purchase
        # Corresponds to the JSON property `authorChannelId`
        # @return [String]
        attr_accessor :author_channel_id
      
        # Contains a string that can be displayed to the user. If this field is not
        # present the message is silent, at the moment only messages of type TOMBSTONE
        # and CHAT_ENDED_EVENT are silent.
        # Corresponds to the JSON property `displayMessage`
        # @return [String]
        attr_accessor :display_message
      
        # Details about the funding event, this is only set if the type is '
        # fanFundingEvent'.
        # Corresponds to the JSON property `fanFundingEventDetails`
        # @return [Google::Apis::YoutubeV3::LiveChatFanFundingEventDetails]
        attr_accessor :fan_funding_event_details
      
        # Whether the message has display content that should be displayed to users.
        # Corresponds to the JSON property `hasDisplayContent`
        # @return [Boolean]
        attr_accessor :has_display_content
        alias_method :has_display_content?, :has_display_content
      
        # 
        # Corresponds to the JSON property `liveChatId`
        # @return [String]
        attr_accessor :live_chat_id
      
        # 
        # Corresponds to the JSON property `messageDeletedDetails`
        # @return [Google::Apis::YoutubeV3::LiveChatMessageDeletedDetails]
        attr_accessor :message_deleted_details
      
        # 
        # Corresponds to the JSON property `messageRetractedDetails`
        # @return [Google::Apis::YoutubeV3::LiveChatMessageRetractedDetails]
        attr_accessor :message_retracted_details
      
        # 
        # Corresponds to the JSON property `pollClosedDetails`
        # @return [Google::Apis::YoutubeV3::LiveChatPollClosedDetails]
        attr_accessor :poll_closed_details
      
        # 
        # Corresponds to the JSON property `pollEditedDetails`
        # @return [Google::Apis::YoutubeV3::LiveChatPollEditedDetails]
        attr_accessor :poll_edited_details
      
        # 
        # Corresponds to the JSON property `pollOpenedDetails`
        # @return [Google::Apis::YoutubeV3::LiveChatPollOpenedDetails]
        attr_accessor :poll_opened_details
      
        # 
        # Corresponds to the JSON property `pollVotedDetails`
        # @return [Google::Apis::YoutubeV3::LiveChatPollVotedDetails]
        attr_accessor :poll_voted_details
      
        # The date and time when the message was orignally published. The value is
        # specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
        # Corresponds to the JSON property `publishedAt`
        # @return [DateTime]
        attr_accessor :published_at
      
        # Details about the Super Chat event, this is only set if the type is '
        # superChatEvent'.
        # Corresponds to the JSON property `superChatDetails`
        # @return [Google::Apis::YoutubeV3::LiveChatSuperChatDetails]
        attr_accessor :super_chat_details
      
        # Details about the Super Sticker event, this is only set if the type is '
        # superStickerEvent'.
        # Corresponds to the JSON property `superStickerDetails`
        # @return [Google::Apis::YoutubeV3::LiveChatSuperStickerDetails]
        attr_accessor :super_sticker_details
      
        # Details about the text message, this is only set if the type is '
        # textMessageEvent'.
        # Corresponds to the JSON property `textMessageDetails`
        # @return [Google::Apis::YoutubeV3::LiveChatTextMessageDetails]
        attr_accessor :text_message_details
      
        # The type of message, this will always be present, it determines the contents
        # of the message as well as which fields will be present.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # 
        # Corresponds to the JSON property `userBannedDetails`
        # @return [Google::Apis::YoutubeV3::LiveChatUserBannedMessageDetails]
        attr_accessor :user_banned_details
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @author_channel_id = args[:author_channel_id] if args.key?(:author_channel_id)
          @display_message = args[:display_message] if args.key?(:display_message)
          @fan_funding_event_details = args[:fan_funding_event_details] if args.key?(:fan_funding_event_details)
          @has_display_content = args[:has_display_content] if args.key?(:has_display_content)
          @live_chat_id = args[:live_chat_id] if args.key?(:live_chat_id)
          @message_deleted_details = args[:message_deleted_details] if args.key?(:message_deleted_details)
          @message_retracted_details = args[:message_retracted_details] if args.key?(:message_retracted_details)
          @poll_closed_details = args[:poll_closed_details] if args.key?(:poll_closed_details)
          @poll_edited_details = args[:poll_edited_details] if args.key?(:poll_edited_details)
          @poll_opened_details = args[:poll_opened_details] if args.key?(:poll_opened_details)
          @poll_voted_details = args[:poll_voted_details] if args.key?(:poll_voted_details)
          @published_at = args[:published_at] if args.key?(:published_at)
          @super_chat_details = args[:super_chat_details] if args.key?(:super_chat_details)
          @super_sticker_details = args[:super_sticker_details] if args.key?(:super_sticker_details)
          @text_message_details = args[:text_message_details] if args.key?(:text_message_details)
          @type = args[:type] if args.key?(:type)
          @user_banned_details = args[:user_banned_details] if args.key?(:user_banned_details)
        end
      end
      
      # A liveChatModerator resource represents a moderator for a YouTube live chat. A
      # chat moderator has the ability to ban/unban users from a chat, remove message,
      # etc.
      class LiveChatModerator
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The ID that YouTube assigns to uniquely identify the moderator.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # liveChatModerator".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The snippet object contains basic details about the moderator.
        # Corresponds to the JSON property `snippet`
        # @return [Google::Apis::YoutubeV3::LiveChatModeratorSnippet]
        attr_accessor :snippet
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @snippet = args[:snippet] if args.key?(:snippet)
        end
      end
      
      # 
      class LiveChatModeratorListResponse
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Serialized EventId of the request which produced this response.
        # Corresponds to the JSON property `eventId`
        # @return [String]
        attr_accessor :event_id
      
        # A list of moderators that match the request criteria.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::YoutubeV3::LiveChatModerator>]
        attr_accessor :items
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # liveChatModeratorListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The token that can be used as the value of the pageToken parameter to retrieve
        # the next page in the result set.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Paging details for lists of resources, including total number of items
        # available and number of resources returned in a single page.
        # Corresponds to the JSON property `pageInfo`
        # @return [Google::Apis::YoutubeV3::PageInfo]
        attr_accessor :page_info
      
        # The token that can be used as the value of the pageToken parameter to retrieve
        # the previous page in the result set.
        # Corresponds to the JSON property `prevPageToken`
        # @return [String]
        attr_accessor :prev_page_token
      
        # Stub token pagination template to suppress results.
        # Corresponds to the JSON property `tokenPagination`
        # @return [Google::Apis::YoutubeV3::TokenPagination]
        attr_accessor :token_pagination
      
        # The visitorId identifies the visitor.
        # Corresponds to the JSON property `visitorId`
        # @return [String]
        attr_accessor :visitor_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @event_id = args[:event_id] if args.key?(:event_id)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @page_info = args[:page_info] if args.key?(:page_info)
          @prev_page_token = args[:prev_page_token] if args.key?(:prev_page_token)
          @token_pagination = args[:token_pagination] if args.key?(:token_pagination)
          @visitor_id = args[:visitor_id] if args.key?(:visitor_id)
        end
      end
      
      # 
      class LiveChatModeratorSnippet
        include Google::Apis::Core::Hashable
      
        # The ID of the live chat this moderator can act on.
        # Corresponds to the JSON property `liveChatId`
        # @return [String]
        attr_accessor :live_chat_id
      
        # Details about the moderator.
        # Corresponds to the JSON property `moderatorDetails`
        # @return [Google::Apis::YoutubeV3::ChannelProfileDetails]
        attr_accessor :moderator_details
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @live_chat_id = args[:live_chat_id] if args.key?(:live_chat_id)
          @moderator_details = args[:moderator_details] if args.key?(:moderator_details)
        end
      end
      
      # 
      class LiveChatPollClosedDetails
        include Google::Apis::Core::Hashable
      
        # The id of the poll that was closed.
        # Corresponds to the JSON property `pollId`
        # @return [String]
        attr_accessor :poll_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @poll_id = args[:poll_id] if args.key?(:poll_id)
        end
      end
      
      # 
      class LiveChatPollEditedDetails
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # 
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::YoutubeV3::LiveChatPollItem>]
        attr_accessor :items
      
        # 
        # Corresponds to the JSON property `prompt`
        # @return [String]
        attr_accessor :prompt
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @items = args[:items] if args.key?(:items)
          @prompt = args[:prompt] if args.key?(:prompt)
        end
      end
      
      # 
      class LiveChatPollItem
        include Google::Apis::Core::Hashable
      
        # Plain text description of the item.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # 
        # Corresponds to the JSON property `itemId`
        # @return [String]
        attr_accessor :item_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @item_id = args[:item_id] if args.key?(:item_id)
        end
      end
      
      # 
      class LiveChatPollOpenedDetails
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # 
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::YoutubeV3::LiveChatPollItem>]
        attr_accessor :items
      
        # 
        # Corresponds to the JSON property `prompt`
        # @return [String]
        attr_accessor :prompt
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @items = args[:items] if args.key?(:items)
          @prompt = args[:prompt] if args.key?(:prompt)
        end
      end
      
      # 
      class LiveChatPollVotedDetails
        include Google::Apis::Core::Hashable
      
        # The poll item the user chose.
        # Corresponds to the JSON property `itemId`
        # @return [String]
        attr_accessor :item_id
      
        # The poll the user voted on.
        # Corresponds to the JSON property `pollId`
        # @return [String]
        attr_accessor :poll_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @item_id = args[:item_id] if args.key?(:item_id)
          @poll_id = args[:poll_id] if args.key?(:poll_id)
        end
      end
      
      # 
      class LiveChatSuperChatDetails
        include Google::Apis::Core::Hashable
      
        # A rendered string that displays the fund amount and currency to the user.
        # Corresponds to the JSON property `amountDisplayString`
        # @return [String]
        attr_accessor :amount_display_string
      
        # The amount purchased by the user, in micros (1,750,000 micros = 1.75).
        # Corresponds to the JSON property `amountMicros`
        # @return [Fixnum]
        attr_accessor :amount_micros
      
        # The currency in which the purchase was made.
        # Corresponds to the JSON property `currency`
        # @return [String]
        attr_accessor :currency
      
        # The tier in which the amount belongs. Lower amounts belong to lower tiers. The
        # lowest tier is 1.
        # Corresponds to the JSON property `tier`
        # @return [Fixnum]
        attr_accessor :tier
      
        # The comment added by the user to this Super Chat event.
        # Corresponds to the JSON property `userComment`
        # @return [String]
        attr_accessor :user_comment
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @amount_display_string = args[:amount_display_string] if args.key?(:amount_display_string)
          @amount_micros = args[:amount_micros] if args.key?(:amount_micros)
          @currency = args[:currency] if args.key?(:currency)
          @tier = args[:tier] if args.key?(:tier)
          @user_comment = args[:user_comment] if args.key?(:user_comment)
        end
      end
      
      # 
      class LiveChatSuperStickerDetails
        include Google::Apis::Core::Hashable
      
        # A rendered string that displays the fund amount and currency to the user.
        # Corresponds to the JSON property `amountDisplayString`
        # @return [String]
        attr_accessor :amount_display_string
      
        # The amount purchased by the user, in micros (1,750,000 micros = 1.75).
        # Corresponds to the JSON property `amountMicros`
        # @return [Fixnum]
        attr_accessor :amount_micros
      
        # The currency in which the purchase was made.
        # Corresponds to the JSON property `currency`
        # @return [String]
        attr_accessor :currency
      
        # Information about the Super Sticker.
        # Corresponds to the JSON property `superStickerMetadata`
        # @return [Google::Apis::YoutubeV3::SuperStickerMetadata]
        attr_accessor :super_sticker_metadata
      
        # The tier in which the amount belongs. Lower amounts belong to lower tiers. The
        # lowest tier is 1.
        # Corresponds to the JSON property `tier`
        # @return [Fixnum]
        attr_accessor :tier
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @amount_display_string = args[:amount_display_string] if args.key?(:amount_display_string)
          @amount_micros = args[:amount_micros] if args.key?(:amount_micros)
          @currency = args[:currency] if args.key?(:currency)
          @super_sticker_metadata = args[:super_sticker_metadata] if args.key?(:super_sticker_metadata)
          @tier = args[:tier] if args.key?(:tier)
        end
      end
      
      # 
      class LiveChatTextMessageDetails
        include Google::Apis::Core::Hashable
      
        # The user's message.
        # Corresponds to the JSON property `messageText`
        # @return [String]
        attr_accessor :message_text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @message_text = args[:message_text] if args.key?(:message_text)
        end
      end
      
      # 
      class LiveChatUserBannedMessageDetails
        include Google::Apis::Core::Hashable
      
        # The duration of the ban. This property is only present if the banType is
        # temporary.
        # Corresponds to the JSON property `banDurationSeconds`
        # @return [Fixnum]
        attr_accessor :ban_duration_seconds
      
        # The type of ban.
        # Corresponds to the JSON property `banType`
        # @return [String]
        attr_accessor :ban_type
      
        # The details of the user that was banned.
        # Corresponds to the JSON property `bannedUserDetails`
        # @return [Google::Apis::YoutubeV3::ChannelProfileDetails]
        attr_accessor :banned_user_details
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ban_duration_seconds = args[:ban_duration_seconds] if args.key?(:ban_duration_seconds)
          @ban_type = args[:ban_type] if args.key?(:ban_type)
          @banned_user_details = args[:banned_user_details] if args.key?(:banned_user_details)
        end
      end
      
      # A live stream describes a live ingestion point.
      class LiveStream
        include Google::Apis::Core::Hashable
      
        # Brief description of the live stream cdn settings.
        # Corresponds to the JSON property `cdn`
        # @return [Google::Apis::YoutubeV3::CdnSettings]
        attr_accessor :cdn
      
        # Detailed settings of a stream.
        # Corresponds to the JSON property `contentDetails`
        # @return [Google::Apis::YoutubeV3::LiveStreamContentDetails]
        attr_accessor :content_details
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The ID that YouTube assigns to uniquely identify the stream.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # liveStream".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The snippet object contains basic details about the stream, including its
        # channel, title, and description.
        # Corresponds to the JSON property `snippet`
        # @return [Google::Apis::YoutubeV3::LiveStreamSnippet]
        attr_accessor :snippet
      
        # Brief description of the live stream status.
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::YoutubeV3::LiveStreamStatus]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cdn = args[:cdn] if args.key?(:cdn)
          @content_details = args[:content_details] if args.key?(:content_details)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @snippet = args[:snippet] if args.key?(:snippet)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # 
      class LiveStreamConfigurationIssue
        include Google::Apis::Core::Hashable
      
        # The long-form description of the issue and how to resolve it.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The short-form reason for this issue.
        # Corresponds to the JSON property `reason`
        # @return [String]
        attr_accessor :reason
      
        # How severe this issue is to the stream.
        # Corresponds to the JSON property `severity`
        # @return [String]
        attr_accessor :severity
      
        # The kind of error happening.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @reason = args[:reason] if args.key?(:reason)
          @severity = args[:severity] if args.key?(:severity)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Detailed settings of a stream.
      class LiveStreamContentDetails
        include Google::Apis::Core::Hashable
      
        # The ingestion URL where the closed captions of this stream are sent.
        # Corresponds to the JSON property `closedCaptionsIngestionUrl`
        # @return [String]
        attr_accessor :closed_captions_ingestion_url
      
        # Indicates whether the stream is reusable, which means that it can be bound to
        # multiple broadcasts. It is common for broadcasters to reuse the same stream
        # for many different broadcasts if those broadcasts occur at different times.
        # If you set this value to false, then the stream will not be reusable, which
        # means that it can only be bound to one broadcast. Non-reusable streams differ
        # from reusable streams in the following ways:
        # - A non-reusable stream can only be bound to one broadcast.
        # - A non-reusable stream might be deleted by an automated process after the
        # broadcast ends.
        # - The  liveStreams.list method does not list non-reusable streams if you call
        # the method and set the mine parameter to true. The only way to use that method
        # to retrieve the resource for a non-reusable stream is to use the id parameter
        # to identify the stream.
        # Corresponds to the JSON property `isReusable`
        # @return [Boolean]
        attr_accessor :is_reusable
        alias_method :is_reusable?, :is_reusable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @closed_captions_ingestion_url = args[:closed_captions_ingestion_url] if args.key?(:closed_captions_ingestion_url)
          @is_reusable = args[:is_reusable] if args.key?(:is_reusable)
        end
      end
      
      # 
      class LiveStreamHealthStatus
        include Google::Apis::Core::Hashable
      
        # The configurations issues on this stream
        # Corresponds to the JSON property `configurationIssues`
        # @return [Array<Google::Apis::YoutubeV3::LiveStreamConfigurationIssue>]
        attr_accessor :configuration_issues
      
        # The last time this status was updated (in seconds)
        # Corresponds to the JSON property `lastUpdateTimeSeconds`
        # @return [Fixnum]
        attr_accessor :last_update_time_seconds
      
        # The status code of this stream
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @configuration_issues = args[:configuration_issues] if args.key?(:configuration_issues)
          @last_update_time_seconds = args[:last_update_time_seconds] if args.key?(:last_update_time_seconds)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # 
      class ListLiveStreamsResponse
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Serialized EventId of the request which produced this response.
        # Corresponds to the JSON property `eventId`
        # @return [String]
        attr_accessor :event_id
      
        # A list of live streams that match the request criteria.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::YoutubeV3::LiveStream>]
        attr_accessor :items
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # liveStreamListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The token that can be used as the value of the pageToken parameter to retrieve
        # the next page in the result set.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Paging details for lists of resources, including total number of items
        # available and number of resources returned in a single page.
        # Corresponds to the JSON property `pageInfo`
        # @return [Google::Apis::YoutubeV3::PageInfo]
        attr_accessor :page_info
      
        # The token that can be used as the value of the pageToken parameter to retrieve
        # the previous page in the result set.
        # Corresponds to the JSON property `prevPageToken`
        # @return [String]
        attr_accessor :prev_page_token
      
        # Stub token pagination template to suppress results.
        # Corresponds to the JSON property `tokenPagination`
        # @return [Google::Apis::YoutubeV3::TokenPagination]
        attr_accessor :token_pagination
      
        # The visitorId identifies the visitor.
        # Corresponds to the JSON property `visitorId`
        # @return [String]
        attr_accessor :visitor_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @event_id = args[:event_id] if args.key?(:event_id)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @page_info = args[:page_info] if args.key?(:page_info)
          @prev_page_token = args[:prev_page_token] if args.key?(:prev_page_token)
          @token_pagination = args[:token_pagination] if args.key?(:token_pagination)
          @visitor_id = args[:visitor_id] if args.key?(:visitor_id)
        end
      end
      
      # 
      class LiveStreamSnippet
        include Google::Apis::Core::Hashable
      
        # The ID that YouTube uses to uniquely identify the channel that is transmitting
        # the stream.
        # Corresponds to the JSON property `channelId`
        # @return [String]
        attr_accessor :channel_id
      
        # The stream's description. The value cannot be longer than 10000 characters.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # 
        # Corresponds to the JSON property `isDefaultStream`
        # @return [Boolean]
        attr_accessor :is_default_stream
        alias_method :is_default_stream?, :is_default_stream
      
        # The date and time that the stream was created. The value is specified in ISO
        # 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
        # Corresponds to the JSON property `publishedAt`
        # @return [DateTime]
        attr_accessor :published_at
      
        # The stream's title. The value must be between 1 and 128 characters long.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @channel_id = args[:channel_id] if args.key?(:channel_id)
          @description = args[:description] if args.key?(:description)
          @is_default_stream = args[:is_default_stream] if args.key?(:is_default_stream)
          @published_at = args[:published_at] if args.key?(:published_at)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Brief description of the live stream status.
      class LiveStreamStatus
        include Google::Apis::Core::Hashable
      
        # The health status of the stream.
        # Corresponds to the JSON property `healthStatus`
        # @return [Google::Apis::YoutubeV3::LiveStreamHealthStatus]
        attr_accessor :health_status
      
        # 
        # Corresponds to the JSON property `streamStatus`
        # @return [String]
        attr_accessor :stream_status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @health_status = args[:health_status] if args.key?(:health_status)
          @stream_status = args[:stream_status] if args.key?(:stream_status)
        end
      end
      
      # 
      class LocalizedProperty
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `default`
        # @return [String]
        attr_accessor :default
      
        # The language of the default property.
        # Corresponds to the JSON property `defaultLanguage`
        # @return [Google::Apis::YoutubeV3::LanguageTag]
        attr_accessor :default_language
      
        # 
        # Corresponds to the JSON property `localized`
        # @return [Array<Google::Apis::YoutubeV3::LocalizedString>]
        attr_accessor :localized
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @default = args[:default] if args.key?(:default)
          @default_language = args[:default_language] if args.key?(:default_language)
          @localized = args[:localized] if args.key?(:localized)
        end
      end
      
      # 
      class LocalizedString
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `language`
        # @return [String]
        attr_accessor :language
      
        # 
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @language = args[:language] if args.key?(:language)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # A member resource represents a member for a YouTube channel. A member provides
      # recurring monetary support to a creator and receives special benefits.
      class Member
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The ID that YouTube assigns to uniquely identify the member.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # member".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The snippet object contains basic details about the member.
        # Corresponds to the JSON property `snippet`
        # @return [Google::Apis::YoutubeV3::MemberSnippet]
        attr_accessor :snippet
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @snippet = args[:snippet] if args.key?(:snippet)
        end
      end
      
      # 
      class MemberListResponse
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Serialized EventId of the request which produced this response.
        # Corresponds to the JSON property `eventId`
        # @return [String]
        attr_accessor :event_id
      
        # A list of members that match the request criteria.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::YoutubeV3::Member>]
        attr_accessor :items
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # memberListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The token that can be used as the value of the pageToken parameter to retrieve
        # the next page in the result set.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Paging details for lists of resources, including total number of items
        # available and number of resources returned in a single page.
        # Corresponds to the JSON property `pageInfo`
        # @return [Google::Apis::YoutubeV3::PageInfo]
        attr_accessor :page_info
      
        # Stub token pagination template to suppress results.
        # Corresponds to the JSON property `tokenPagination`
        # @return [Google::Apis::YoutubeV3::TokenPagination]
        attr_accessor :token_pagination
      
        # The visitorId identifies the visitor.
        # Corresponds to the JSON property `visitorId`
        # @return [String]
        attr_accessor :visitor_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @event_id = args[:event_id] if args.key?(:event_id)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @page_info = args[:page_info] if args.key?(:page_info)
          @token_pagination = args[:token_pagination] if args.key?(:token_pagination)
          @visitor_id = args[:visitor_id] if args.key?(:visitor_id)
        end
      end
      
      # 
      class MemberSnippet
        include Google::Apis::Core::Hashable
      
        # The id of the channel that's offering memberships.
        # Corresponds to the JSON property `creatorChannelId`
        # @return [String]
        attr_accessor :creator_channel_id
      
        # Details about the member.
        # Corresponds to the JSON property `memberDetails`
        # @return [Google::Apis::YoutubeV3::ChannelProfileDetails]
        attr_accessor :member_details
      
        # Details about the user's membership.
        # Corresponds to the JSON property `membershipsDetails`
        # @return [Google::Apis::YoutubeV3::MembershipsDetails]
        attr_accessor :memberships_details
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @creator_channel_id = args[:creator_channel_id] if args.key?(:creator_channel_id)
          @member_details = args[:member_details] if args.key?(:member_details)
          @memberships_details = args[:memberships_details] if args.key?(:memberships_details)
        end
      end
      
      # 
      class MembershipsDetails
        include Google::Apis::Core::Hashable
      
        # All levels that the user has access to. This includes the purchased level and
        # all other levels that are included because of a higher purchase.
        # Corresponds to the JSON property `accessibleLevels`
        # @return [Array<String>]
        attr_accessor :accessible_levels
      
        # The date and time when the user became a continuous member across all levels.
        # Corresponds to the JSON property `memberSince`
        # @return [String]
        attr_accessor :member_since
      
        # The date and time when the user started to continuously have access to the
        # currently highest level.
        # Corresponds to the JSON property `memberSinceCurrentLevel`
        # @return [String]
        attr_accessor :member_since_current_level
      
        # The cumulative time the user has been a member across all levels in complete
        # months (the time is rounded down to the nearest integer).
        # Corresponds to the JSON property `memberTotalDuration`
        # @return [Fixnum]
        attr_accessor :member_total_duration
      
        # The cumulative time the user has had access to the currently highest level in
        # complete months (the time is rounded down to the nearest integer).
        # Corresponds to the JSON property `memberTotalDurationCurrentLevel`
        # @return [Fixnum]
        attr_accessor :member_total_duration_current_level
      
        # The highest level the user has access to at the moment.
        # Corresponds to the JSON property `purchasedLevel`
        # @return [String]
        attr_accessor :purchased_level
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @accessible_levels = args[:accessible_levels] if args.key?(:accessible_levels)
          @member_since = args[:member_since] if args.key?(:member_since)
          @member_since_current_level = args[:member_since_current_level] if args.key?(:member_since_current_level)
          @member_total_duration = args[:member_total_duration] if args.key?(:member_total_duration)
          @member_total_duration_current_level = args[:member_total_duration_current_level] if args.key?(:member_total_duration_current_level)
          @purchased_level = args[:purchased_level] if args.key?(:purchased_level)
        end
      end
      
      # A membershipsLevel resource represents an offer made by YouTube creators for
      # their fans. Users can become members of the channel by joining one of the
      # available levels. They will provide recurring monetary support and receives
      # special benefits.
      class MembershipsLevel
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The ID that YouTube assigns to uniquely identify the memberships level.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # membershipsLevel".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The snippet object contains basic details about the level.
        # Corresponds to the JSON property `snippet`
        # @return [Google::Apis::YoutubeV3::MembershipsLevelSnippet]
        attr_accessor :snippet
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @snippet = args[:snippet] if args.key?(:snippet)
        end
      end
      
      # 
      class MembershipsLevelListResponse
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Serialized EventId of the request which produced this response.
        # Corresponds to the JSON property `eventId`
        # @return [String]
        attr_accessor :event_id
      
        # A list of pricing levels offered by a creator to the fans.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::YoutubeV3::MembershipsLevel>]
        attr_accessor :items
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # membershipsLevelListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The visitorId identifies the visitor.
        # Corresponds to the JSON property `visitorId`
        # @return [String]
        attr_accessor :visitor_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @event_id = args[:event_id] if args.key?(:event_id)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @visitor_id = args[:visitor_id] if args.key?(:visitor_id)
        end
      end
      
      # 
      class MembershipsLevelSnippet
        include Google::Apis::Core::Hashable
      
        # The id of the channel that's offering channel memberships.
        # Corresponds to the JSON property `creatorChannelId`
        # @return [String]
        attr_accessor :creator_channel_id
      
        # 
        # Corresponds to the JSON property `levelDetails`
        # @return [Google::Apis::YoutubeV3::LevelDetails]
        attr_accessor :level_details
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @creator_channel_id = args[:creator_channel_id] if args.key?(:creator_channel_id)
          @level_details = args[:level_details] if args.key?(:level_details)
        end
      end
      
      # Settings and Info of the monitor stream
      class MonitorStreamInfo
        include Google::Apis::Core::Hashable
      
        # If you have set the enableMonitorStream property to true, then this property
        # determines the length of the live broadcast delay.
        # Corresponds to the JSON property `broadcastStreamDelayMs`
        # @return [Fixnum]
        attr_accessor :broadcast_stream_delay_ms
      
        # HTML code that embeds a player that plays the monitor stream.
        # Corresponds to the JSON property `embedHtml`
        # @return [String]
        attr_accessor :embed_html
      
        # This value determines whether the monitor stream is enabled for the broadcast.
        # If the monitor stream is enabled, then YouTube will broadcast the event
        # content on a special stream intended only for the broadcaster's consumption.
        # The broadcaster can use the stream to review the event content and also to
        # identify the optimal times to insert cuepoints.
        # You need to set this value to true if you intend to have a broadcast delay for
        # your event.
        # Note: This property cannot be updated once the broadcast is in the testing or
        # live state.
        # Corresponds to the JSON property `enableMonitorStream`
        # @return [Boolean]
        attr_accessor :enable_monitor_stream
        alias_method :enable_monitor_stream?, :enable_monitor_stream
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @broadcast_stream_delay_ms = args[:broadcast_stream_delay_ms] if args.key?(:broadcast_stream_delay_ms)
          @embed_html = args[:embed_html] if args.key?(:embed_html)
          @enable_monitor_stream = args[:enable_monitor_stream] if args.key?(:enable_monitor_stream)
        end
      end
      
      # Nonprofit information.
      class Nonprofit
        include Google::Apis::Core::Hashable
      
        # Id of the nonprofit.
        # Corresponds to the JSON property `nonprofitId`
        # @return [Google::Apis::YoutubeV3::NonprofitId]
        attr_accessor :nonprofit_id
      
        # Legal name of the nonprofit.
        # Corresponds to the JSON property `nonprofitLegalName`
        # @return [String]
        attr_accessor :nonprofit_legal_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @nonprofit_id = args[:nonprofit_id] if args.key?(:nonprofit_id)
          @nonprofit_legal_name = args[:nonprofit_legal_name] if args.key?(:nonprofit_legal_name)
        end
      end
      
      # 
      class NonprofitId
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Paging details for lists of resources, including total number of items
      # available and number of resources returned in a single page.
      class PageInfo
        include Google::Apis::Core::Hashable
      
        # The number of results included in the API response.
        # Corresponds to the JSON property `resultsPerPage`
        # @return [Fixnum]
        attr_accessor :results_per_page
      
        # The total number of results in the result set.
        # Corresponds to the JSON property `totalResults`
        # @return [Fixnum]
        attr_accessor :total_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @results_per_page = args[:results_per_page] if args.key?(:results_per_page)
          @total_results = args[:total_results] if args.key?(:total_results)
        end
      end
      
      # A playlist resource represents a YouTube playlist. A playlist is a collection
      # of videos that can be viewed sequentially and shared with other users. A
      # playlist can contain up to 200 videos, and YouTube does not limit the number
      # of playlists that each user creates. By default, playlists are publicly
      # visible to other users, but playlists can be public or private.
      # YouTube also uses playlists to identify special collections of videos for a
      # channel, such as:
      # - uploaded videos
      # - favorite videos
      # - positively rated (liked) videos
      # - watch history
      # - watch later  To be more specific, these lists are associated with a channel,
      # which is a collection of a person, group, or company's videos, playlists, and
      # other YouTube information. You can retrieve the playlist IDs for each of these
      # lists from the  channel resource for a given channel.
      # You can then use the   playlistItems.list method to retrieve any of those
      # lists. You can also add or remove items from those lists by calling the
      # playlistItems.insert and   playlistItems.delete methods.
      class Playlist
        include Google::Apis::Core::Hashable
      
        # The contentDetails object contains information like video count.
        # Corresponds to the JSON property `contentDetails`
        # @return [Google::Apis::YoutubeV3::PlaylistContentDetails]
        attr_accessor :content_details
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The ID that YouTube uses to uniquely identify the playlist.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # playlist".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Localizations for different languages
        # Corresponds to the JSON property `localizations`
        # @return [Hash<String,Google::Apis::YoutubeV3::PlaylistLocalization>]
        attr_accessor :localizations
      
        # The player object contains information that you would use to play the playlist
        # in an embedded player.
        # Corresponds to the JSON property `player`
        # @return [Google::Apis::YoutubeV3::PlaylistPlayer]
        attr_accessor :player
      
        # Basic details about a playlist, including title, description and thumbnails.
        # Corresponds to the JSON property `snippet`
        # @return [Google::Apis::YoutubeV3::PlaylistSnippet]
        attr_accessor :snippet
      
        # The status object contains status information for the playlist.
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::YoutubeV3::PlaylistStatus]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content_details = args[:content_details] if args.key?(:content_details)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @localizations = args[:localizations] if args.key?(:localizations)
          @player = args[:player] if args.key?(:player)
          @snippet = args[:snippet] if args.key?(:snippet)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # 
      class PlaylistContentDetails
        include Google::Apis::Core::Hashable
      
        # The number of videos in the playlist.
        # Corresponds to the JSON property `itemCount`
        # @return [Fixnum]
        attr_accessor :item_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @item_count = args[:item_count] if args.key?(:item_count)
        end
      end
      
      # A playlistItem resource identifies another resource, such as a video, that is
      # included in a playlist. In addition, the playlistItem  resource contains
      # details about the included resource that pertain specifically to how that
      # resource is used in that playlist.
      # YouTube uses playlists to identify special collections of videos for a channel,
      # such as:
      # - uploaded videos
      # - favorite videos
      # - positively rated (liked) videos
      # - watch history
      # - watch later  To be more specific, these lists are associated with a channel,
      # which is a collection of a person, group, or company's videos, playlists, and
      # other YouTube information.
      # You can retrieve the playlist IDs for each of these lists from the  channel
      # resource  for a given channel. You can then use the   playlistItems.list
      # method to retrieve any of those lists. You can also add or remove items from
      # those lists by calling the   playlistItems.insert and   playlistItems.delete
      # methods. For example, if a user gives a positive rating to a video, you would
      # insert that video into the liked videos playlist for that user's channel.
      class PlaylistItem
        include Google::Apis::Core::Hashable
      
        # The contentDetails object is included in the resource if the included item is
        # a YouTube video. The object contains additional information about the video.
        # Corresponds to the JSON property `contentDetails`
        # @return [Google::Apis::YoutubeV3::PlaylistItemContentDetails]
        attr_accessor :content_details
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The ID that YouTube uses to uniquely identify the playlist item.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # playlistItem".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Basic details about a playlist, including title, description and thumbnails.
        # Corresponds to the JSON property `snippet`
        # @return [Google::Apis::YoutubeV3::PlaylistItemSnippet]
        attr_accessor :snippet
      
        # Information about the playlist item's privacy status.
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::YoutubeV3::PlaylistItemStatus]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content_details = args[:content_details] if args.key?(:content_details)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @snippet = args[:snippet] if args.key?(:snippet)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # 
      class PlaylistItemContentDetails
        include Google::Apis::Core::Hashable
      
        # The time, measured in seconds from the start of the video, when the video
        # should stop playing. (The playlist owner can specify the times when the video
        # should start and stop playing when the video is played in the context of the
        # playlist.) By default, assume that the video.endTime is the end of the video.
        # Corresponds to the JSON property `endAt`
        # @return [String]
        attr_accessor :end_at
      
        # A user-generated note for this item.
        # Corresponds to the JSON property `note`
        # @return [String]
        attr_accessor :note
      
        # The time, measured in seconds from the start of the video, when the video
        # should start playing. (The playlist owner can specify the times when the video
        # should start and stop playing when the video is played in the context of the
        # playlist.) The default value is 0.
        # Corresponds to the JSON property `startAt`
        # @return [String]
        attr_accessor :start_at
      
        # The ID that YouTube uses to uniquely identify a video. To retrieve the video
        # resource, set the id query parameter to this value in your API request.
        # Corresponds to the JSON property `videoId`
        # @return [String]
        attr_accessor :video_id
      
        # The date and time that the video was published to YouTube. The value is
        # specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
        # Corresponds to the JSON property `videoPublishedAt`
        # @return [DateTime]
        attr_accessor :video_published_at
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_at = args[:end_at] if args.key?(:end_at)
          @note = args[:note] if args.key?(:note)
          @start_at = args[:start_at] if args.key?(:start_at)
          @video_id = args[:video_id] if args.key?(:video_id)
          @video_published_at = args[:video_published_at] if args.key?(:video_published_at)
        end
      end
      
      # 
      class ListPlaylistItemsResponse
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Serialized EventId of the request which produced this response.
        # Corresponds to the JSON property `eventId`
        # @return [String]
        attr_accessor :event_id
      
        # A list of playlist items that match the request criteria.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::YoutubeV3::PlaylistItem>]
        attr_accessor :items
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # playlistItemListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The token that can be used as the value of the pageToken parameter to retrieve
        # the next page in the result set.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Paging details for lists of resources, including total number of items
        # available and number of resources returned in a single page.
        # Corresponds to the JSON property `pageInfo`
        # @return [Google::Apis::YoutubeV3::PageInfo]
        attr_accessor :page_info
      
        # The token that can be used as the value of the pageToken parameter to retrieve
        # the previous page in the result set.
        # Corresponds to the JSON property `prevPageToken`
        # @return [String]
        attr_accessor :prev_page_token
      
        # Stub token pagination template to suppress results.
        # Corresponds to the JSON property `tokenPagination`
        # @return [Google::Apis::YoutubeV3::TokenPagination]
        attr_accessor :token_pagination
      
        # The visitorId identifies the visitor.
        # Corresponds to the JSON property `visitorId`
        # @return [String]
        attr_accessor :visitor_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @event_id = args[:event_id] if args.key?(:event_id)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @page_info = args[:page_info] if args.key?(:page_info)
          @prev_page_token = args[:prev_page_token] if args.key?(:prev_page_token)
          @token_pagination = args[:token_pagination] if args.key?(:token_pagination)
          @visitor_id = args[:visitor_id] if args.key?(:visitor_id)
        end
      end
      
      # Basic details about a playlist, including title, description and thumbnails.
      class PlaylistItemSnippet
        include Google::Apis::Core::Hashable
      
        # The ID that YouTube uses to uniquely identify the user that added the item to
        # the playlist.
        # Corresponds to the JSON property `channelId`
        # @return [String]
        attr_accessor :channel_id
      
        # Channel title for the channel that the playlist item belongs to.
        # Corresponds to the JSON property `channelTitle`
        # @return [String]
        attr_accessor :channel_title
      
        # The item's description.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The ID that YouTube uses to uniquely identify the playlist that the playlist
        # item is in.
        # Corresponds to the JSON property `playlistId`
        # @return [String]
        attr_accessor :playlist_id
      
        # The order in which the item appears in the playlist. The value uses a zero-
        # based index, so the first item has a position of 0, the second item has a
        # position of 1, and so forth.
        # Corresponds to the JSON property `position`
        # @return [Fixnum]
        attr_accessor :position
      
        # The date and time that the item was added to the playlist. The value is
        # specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
        # Corresponds to the JSON property `publishedAt`
        # @return [DateTime]
        attr_accessor :published_at
      
        # A resource id is a generic reference that points to another YouTube resource.
        # Corresponds to the JSON property `resourceId`
        # @return [Google::Apis::YoutubeV3::ResourceId]
        attr_accessor :resource_id
      
        # Internal representation of thumbnails for a YouTube resource.
        # Corresponds to the JSON property `thumbnails`
        # @return [Google::Apis::YoutubeV3::ThumbnailDetails]
        attr_accessor :thumbnails
      
        # The item's title.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @channel_id = args[:channel_id] if args.key?(:channel_id)
          @channel_title = args[:channel_title] if args.key?(:channel_title)
          @description = args[:description] if args.key?(:description)
          @playlist_id = args[:playlist_id] if args.key?(:playlist_id)
          @position = args[:position] if args.key?(:position)
          @published_at = args[:published_at] if args.key?(:published_at)
          @resource_id = args[:resource_id] if args.key?(:resource_id)
          @thumbnails = args[:thumbnails] if args.key?(:thumbnails)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Information about the playlist item's privacy status.
      class PlaylistItemStatus
        include Google::Apis::Core::Hashable
      
        # This resource's privacy status.
        # Corresponds to the JSON property `privacyStatus`
        # @return [String]
        attr_accessor :privacy_status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @privacy_status = args[:privacy_status] if args.key?(:privacy_status)
        end
      end
      
      # 
      class ListPlaylistResponse
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Serialized EventId of the request which produced this response.
        # Corresponds to the JSON property `eventId`
        # @return [String]
        attr_accessor :event_id
      
        # A list of playlists that match the request criteria.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::YoutubeV3::Playlist>]
        attr_accessor :items
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # playlistListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The token that can be used as the value of the pageToken parameter to retrieve
        # the next page in the result set.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Paging details for lists of resources, including total number of items
        # available and number of resources returned in a single page.
        # Corresponds to the JSON property `pageInfo`
        # @return [Google::Apis::YoutubeV3::PageInfo]
        attr_accessor :page_info
      
        # The token that can be used as the value of the pageToken parameter to retrieve
        # the previous page in the result set.
        # Corresponds to the JSON property `prevPageToken`
        # @return [String]
        attr_accessor :prev_page_token
      
        # Stub token pagination template to suppress results.
        # Corresponds to the JSON property `tokenPagination`
        # @return [Google::Apis::YoutubeV3::TokenPagination]
        attr_accessor :token_pagination
      
        # The visitorId identifies the visitor.
        # Corresponds to the JSON property `visitorId`
        # @return [String]
        attr_accessor :visitor_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @event_id = args[:event_id] if args.key?(:event_id)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @page_info = args[:page_info] if args.key?(:page_info)
          @prev_page_token = args[:prev_page_token] if args.key?(:prev_page_token)
          @token_pagination = args[:token_pagination] if args.key?(:token_pagination)
          @visitor_id = args[:visitor_id] if args.key?(:visitor_id)
        end
      end
      
      # Playlist localization setting
      class PlaylistLocalization
        include Google::Apis::Core::Hashable
      
        # The localized strings for playlist's description.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The localized strings for playlist's title.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # 
      class PlaylistPlayer
        include Google::Apis::Core::Hashable
      
        # An <iframe> tag that embeds a player that will play the playlist.
        # Corresponds to the JSON property `embedHtml`
        # @return [String]
        attr_accessor :embed_html
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @embed_html = args[:embed_html] if args.key?(:embed_html)
        end
      end
      
      # Basic details about a playlist, including title, description and thumbnails.
      class PlaylistSnippet
        include Google::Apis::Core::Hashable
      
        # The ID that YouTube uses to uniquely identify the channel that published the
        # playlist.
        # Corresponds to the JSON property `channelId`
        # @return [String]
        attr_accessor :channel_id
      
        # The channel title of the channel that the video belongs to.
        # Corresponds to the JSON property `channelTitle`
        # @return [String]
        attr_accessor :channel_title
      
        # The language of the playlist's default title and description.
        # Corresponds to the JSON property `defaultLanguage`
        # @return [String]
        attr_accessor :default_language
      
        # The playlist's description.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Playlist localization setting
        # Corresponds to the JSON property `localized`
        # @return [Google::Apis::YoutubeV3::PlaylistLocalization]
        attr_accessor :localized
      
        # The date and time that the playlist was created. The value is specified in ISO
        # 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
        # Corresponds to the JSON property `publishedAt`
        # @return [DateTime]
        attr_accessor :published_at
      
        # Keyword tags associated with the playlist.
        # Corresponds to the JSON property `tags`
        # @return [Array<String>]
        attr_accessor :tags
      
        # Internal representation of thumbnails for a YouTube resource.
        # Corresponds to the JSON property `thumbnails`
        # @return [Google::Apis::YoutubeV3::ThumbnailDetails]
        attr_accessor :thumbnails
      
        # The playlist's title.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @channel_id = args[:channel_id] if args.key?(:channel_id)
          @channel_title = args[:channel_title] if args.key?(:channel_title)
          @default_language = args[:default_language] if args.key?(:default_language)
          @description = args[:description] if args.key?(:description)
          @localized = args[:localized] if args.key?(:localized)
          @published_at = args[:published_at] if args.key?(:published_at)
          @tags = args[:tags] if args.key?(:tags)
          @thumbnails = args[:thumbnails] if args.key?(:thumbnails)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # 
      class PlaylistStatus
        include Google::Apis::Core::Hashable
      
        # The playlist's privacy status.
        # Corresponds to the JSON property `privacyStatus`
        # @return [String]
        attr_accessor :privacy_status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @privacy_status = args[:privacy_status] if args.key?(:privacy_status)
        end
      end
      
      # Describes a single promoted item.
      class PromotedItem
        include Google::Apis::Core::Hashable
      
        # A custom message to display for this promotion. This field is currently
        # ignored unless the promoted item is a website.
        # Corresponds to the JSON property `customMessage`
        # @return [String]
        attr_accessor :custom_message
      
        # Describes a single promoted item id. It is a union of various possible types.
        # Corresponds to the JSON property `id`
        # @return [Google::Apis::YoutubeV3::PromotedItemId]
        attr_accessor :id
      
        # If true, the content owner's name will be used when displaying the promotion.
        # This field can only be set when the update is made on behalf of the content
        # owner.
        # Corresponds to the JSON property `promotedByContentOwner`
        # @return [Boolean]
        attr_accessor :promoted_by_content_owner
        alias_method :promoted_by_content_owner?, :promoted_by_content_owner
      
        # Describes a temporal position of a visual widget inside a video.
        # Corresponds to the JSON property `timing`
        # @return [Google::Apis::YoutubeV3::InvideoTiming]
        attr_accessor :timing
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @custom_message = args[:custom_message] if args.key?(:custom_message)
          @id = args[:id] if args.key?(:id)
          @promoted_by_content_owner = args[:promoted_by_content_owner] if args.key?(:promoted_by_content_owner)
          @timing = args[:timing] if args.key?(:timing)
        end
      end
      
      # Describes a single promoted item id. It is a union of various possible types.
      class PromotedItemId
        include Google::Apis::Core::Hashable
      
        # If type is recentUpload, this field identifies the channel from which to take
        # the recent upload. If missing, the channel is assumed to be the same channel
        # for which the invideoPromotion is set.
        # Corresponds to the JSON property `recentlyUploadedBy`
        # @return [String]
        attr_accessor :recently_uploaded_by
      
        # Describes the type of the promoted item.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # If the promoted item represents a video, this field represents the unique
        # YouTube ID identifying it. This field will be present only if type has the
        # value video.
        # Corresponds to the JSON property `videoId`
        # @return [String]
        attr_accessor :video_id
      
        # If the promoted item represents a website, this field represents the url
        # pointing to the website. This field will be present only if type has the value
        # website.
        # Corresponds to the JSON property `websiteUrl`
        # @return [String]
        attr_accessor :website_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @recently_uploaded_by = args[:recently_uploaded_by] if args.key?(:recently_uploaded_by)
          @type = args[:type] if args.key?(:type)
          @video_id = args[:video_id] if args.key?(:video_id)
          @website_url = args[:website_url] if args.key?(:website_url)
        end
      end
      
      # A pair Property / Value.
      class PropertyValue
        include Google::Apis::Core::Hashable
      
        # A property.
        # Corresponds to the JSON property `property`
        # @return [String]
        attr_accessor :property
      
        # The property's value.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @property = args[:property] if args.key?(:property)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # A resource id is a generic reference that points to another YouTube resource.
      class ResourceId
        include Google::Apis::Core::Hashable
      
        # The ID that YouTube uses to uniquely identify the referred resource, if that
        # resource is a channel. This property is only present if the resourceId.kind
        # value is youtube#channel.
        # Corresponds to the JSON property `channelId`
        # @return [String]
        attr_accessor :channel_id
      
        # The type of the API resource.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The ID that YouTube uses to uniquely identify the referred resource, if that
        # resource is a playlist. This property is only present if the resourceId.kind
        # value is youtube#playlist.
        # Corresponds to the JSON property `playlistId`
        # @return [String]
        attr_accessor :playlist_id
      
        # The ID that YouTube uses to uniquely identify the referred resource, if that
        # resource is a video. This property is only present if the resourceId.kind
        # value is youtube#video.
        # Corresponds to the JSON property `videoId`
        # @return [String]
        attr_accessor :video_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @channel_id = args[:channel_id] if args.key?(:channel_id)
          @kind = args[:kind] if args.key?(:kind)
          @playlist_id = args[:playlist_id] if args.key?(:playlist_id)
          @video_id = args[:video_id] if args.key?(:video_id)
        end
      end
      
      # 
      class SearchListsResponse
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Serialized EventId of the request which produced this response.
        # Corresponds to the JSON property `eventId`
        # @return [String]
        attr_accessor :event_id
      
        # A list of results that match the search criteria.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::YoutubeV3::SearchResult>]
        attr_accessor :items
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # searchListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The token that can be used as the value of the pageToken parameter to retrieve
        # the next page in the result set.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Paging details for lists of resources, including total number of items
        # available and number of resources returned in a single page.
        # Corresponds to the JSON property `pageInfo`
        # @return [Google::Apis::YoutubeV3::PageInfo]
        attr_accessor :page_info
      
        # The token that can be used as the value of the pageToken parameter to retrieve
        # the previous page in the result set.
        # Corresponds to the JSON property `prevPageToken`
        # @return [String]
        attr_accessor :prev_page_token
      
        # 
        # Corresponds to the JSON property `regionCode`
        # @return [String]
        attr_accessor :region_code
      
        # Stub token pagination template to suppress results.
        # Corresponds to the JSON property `tokenPagination`
        # @return [Google::Apis::YoutubeV3::TokenPagination]
        attr_accessor :token_pagination
      
        # The visitorId identifies the visitor.
        # Corresponds to the JSON property `visitorId`
        # @return [String]
        attr_accessor :visitor_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @event_id = args[:event_id] if args.key?(:event_id)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @page_info = args[:page_info] if args.key?(:page_info)
          @prev_page_token = args[:prev_page_token] if args.key?(:prev_page_token)
          @region_code = args[:region_code] if args.key?(:region_code)
          @token_pagination = args[:token_pagination] if args.key?(:token_pagination)
          @visitor_id = args[:visitor_id] if args.key?(:visitor_id)
        end
      end
      
      # A search result contains information about a YouTube video, channel, or
      # playlist that matches the search parameters specified in an API request. While
      # a search result points to a uniquely identifiable resource, like a video, it
      # does not have its own persistent data.
      class SearchResult
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # A resource id is a generic reference that points to another YouTube resource.
        # Corresponds to the JSON property `id`
        # @return [Google::Apis::YoutubeV3::ResourceId]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # searchResult".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Basic details about a search result, including title, description and
        # thumbnails of the item referenced by the search result.
        # Corresponds to the JSON property `snippet`
        # @return [Google::Apis::YoutubeV3::SearchResultSnippet]
        attr_accessor :snippet
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @snippet = args[:snippet] if args.key?(:snippet)
        end
      end
      
      # Basic details about a search result, including title, description and
      # thumbnails of the item referenced by the search result.
      class SearchResultSnippet
        include Google::Apis::Core::Hashable
      
        # The value that YouTube uses to uniquely identify the channel that published
        # the resource that the search result identifies.
        # Corresponds to the JSON property `channelId`
        # @return [String]
        attr_accessor :channel_id
      
        # The title of the channel that published the resource that the search result
        # identifies.
        # Corresponds to the JSON property `channelTitle`
        # @return [String]
        attr_accessor :channel_title
      
        # A description of the search result.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # It indicates if the resource (video or channel) has upcoming/active live
        # broadcast content. Or it's "none" if there is not any upcoming/active live
        # broadcasts.
        # Corresponds to the JSON property `liveBroadcastContent`
        # @return [String]
        attr_accessor :live_broadcast_content
      
        # The creation date and time of the resource that the search result identifies.
        # The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
        # Corresponds to the JSON property `publishedAt`
        # @return [DateTime]
        attr_accessor :published_at
      
        # Internal representation of thumbnails for a YouTube resource.
        # Corresponds to the JSON property `thumbnails`
        # @return [Google::Apis::YoutubeV3::ThumbnailDetails]
        attr_accessor :thumbnails
      
        # The title of the search result.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @channel_id = args[:channel_id] if args.key?(:channel_id)
          @channel_title = args[:channel_title] if args.key?(:channel_title)
          @description = args[:description] if args.key?(:description)
          @live_broadcast_content = args[:live_broadcast_content] if args.key?(:live_broadcast_content)
          @published_at = args[:published_at] if args.key?(:published_at)
          @thumbnails = args[:thumbnails] if args.key?(:thumbnails)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # A sponsor resource represents a sponsor for a YouTube channel. A sponsor
      # provides recurring monetary support to a creator and receives special benefits.
      class Sponsor
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # sponsor".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The snippet object contains basic details about the sponsor.
        # Corresponds to the JSON property `snippet`
        # @return [Google::Apis::YoutubeV3::SponsorSnippet]
        attr_accessor :snippet
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @kind = args[:kind] if args.key?(:kind)
          @snippet = args[:snippet] if args.key?(:snippet)
        end
      end
      
      # 
      class SponsorListResponse
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Serialized EventId of the request which produced this response.
        # Corresponds to the JSON property `eventId`
        # @return [String]
        attr_accessor :event_id
      
        # A list of sponsors that match the request criteria.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::YoutubeV3::Sponsor>]
        attr_accessor :items
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # sponsorListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The token that can be used as the value of the pageToken parameter to retrieve
        # the next page in the result set.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Paging details for lists of resources, including total number of items
        # available and number of resources returned in a single page.
        # Corresponds to the JSON property `pageInfo`
        # @return [Google::Apis::YoutubeV3::PageInfo]
        attr_accessor :page_info
      
        # Stub token pagination template to suppress results.
        # Corresponds to the JSON property `tokenPagination`
        # @return [Google::Apis::YoutubeV3::TokenPagination]
        attr_accessor :token_pagination
      
        # The visitorId identifies the visitor.
        # Corresponds to the JSON property `visitorId`
        # @return [String]
        attr_accessor :visitor_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @event_id = args[:event_id] if args.key?(:event_id)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @page_info = args[:page_info] if args.key?(:page_info)
          @token_pagination = args[:token_pagination] if args.key?(:token_pagination)
          @visitor_id = args[:visitor_id] if args.key?(:visitor_id)
        end
      end
      
      # 
      class SponsorSnippet
        include Google::Apis::Core::Hashable
      
        # The id of the channel being sponsored.
        # Corresponds to the JSON property `channelId`
        # @return [String]
        attr_accessor :channel_id
      
        # The cumulative time a user has been a sponsor in months.
        # Corresponds to the JSON property `cumulativeDurationMonths`
        # @return [Fixnum]
        attr_accessor :cumulative_duration_months
      
        # Details about the sponsor.
        # Corresponds to the JSON property `sponsorDetails`
        # @return [Google::Apis::YoutubeV3::ChannelProfileDetails]
        attr_accessor :sponsor_details
      
        # The date and time when the user became a sponsor. The value is specified in
        # ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
        # Corresponds to the JSON property `sponsorSince`
        # @return [DateTime]
        attr_accessor :sponsor_since
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @channel_id = args[:channel_id] if args.key?(:channel_id)
          @cumulative_duration_months = args[:cumulative_duration_months] if args.key?(:cumulative_duration_months)
          @sponsor_details = args[:sponsor_details] if args.key?(:sponsor_details)
          @sponsor_since = args[:sponsor_since] if args.key?(:sponsor_since)
        end
      end
      
      # A subscription resource contains information about a YouTube user subscription.
      # A subscription notifies a user when new videos are added to a channel or when
      # another user takes one of several actions on YouTube, such as uploading a
      # video, rating a video, or commenting on a video.
      class Subscription
        include Google::Apis::Core::Hashable
      
        # Details about the content to witch a subscription refers.
        # Corresponds to the JSON property `contentDetails`
        # @return [Google::Apis::YoutubeV3::SubscriptionContentDetails]
        attr_accessor :content_details
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The ID that YouTube uses to uniquely identify the subscription.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # subscription".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Basic details about a subscription, including title, description and
        # thumbnails of the subscribed item.
        # Corresponds to the JSON property `snippet`
        # @return [Google::Apis::YoutubeV3::SubscriptionSnippet]
        attr_accessor :snippet
      
        # Basic details about a subscription's subscriber including title, description,
        # channel ID and thumbnails.
        # Corresponds to the JSON property `subscriberSnippet`
        # @return [Google::Apis::YoutubeV3::SubscriptionSubscriberSnippet]
        attr_accessor :subscriber_snippet
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content_details = args[:content_details] if args.key?(:content_details)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @snippet = args[:snippet] if args.key?(:snippet)
          @subscriber_snippet = args[:subscriber_snippet] if args.key?(:subscriber_snippet)
        end
      end
      
      # Details about the content to witch a subscription refers.
      class SubscriptionContentDetails
        include Google::Apis::Core::Hashable
      
        # The type of activity this subscription is for (only uploads, everything).
        # Corresponds to the JSON property `activityType`
        # @return [String]
        attr_accessor :activity_type
      
        # The number of new items in the subscription since its content was last read.
        # Corresponds to the JSON property `newItemCount`
        # @return [Fixnum]
        attr_accessor :new_item_count
      
        # The approximate number of items that the subscription points to.
        # Corresponds to the JSON property `totalItemCount`
        # @return [Fixnum]
        attr_accessor :total_item_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @activity_type = args[:activity_type] if args.key?(:activity_type)
          @new_item_count = args[:new_item_count] if args.key?(:new_item_count)
          @total_item_count = args[:total_item_count] if args.key?(:total_item_count)
        end
      end
      
      # 
      class ListSubscriptionResponse
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Serialized EventId of the request which produced this response.
        # Corresponds to the JSON property `eventId`
        # @return [String]
        attr_accessor :event_id
      
        # A list of subscriptions that match the request criteria.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::YoutubeV3::Subscription>]
        attr_accessor :items
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # subscriptionListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The token that can be used as the value of the pageToken parameter to retrieve
        # the next page in the result set.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Paging details for lists of resources, including total number of items
        # available and number of resources returned in a single page.
        # Corresponds to the JSON property `pageInfo`
        # @return [Google::Apis::YoutubeV3::PageInfo]
        attr_accessor :page_info
      
        # The token that can be used as the value of the pageToken parameter to retrieve
        # the previous page in the result set.
        # Corresponds to the JSON property `prevPageToken`
        # @return [String]
        attr_accessor :prev_page_token
      
        # Stub token pagination template to suppress results.
        # Corresponds to the JSON property `tokenPagination`
        # @return [Google::Apis::YoutubeV3::TokenPagination]
        attr_accessor :token_pagination
      
        # The visitorId identifies the visitor.
        # Corresponds to the JSON property `visitorId`
        # @return [String]
        attr_accessor :visitor_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @event_id = args[:event_id] if args.key?(:event_id)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @page_info = args[:page_info] if args.key?(:page_info)
          @prev_page_token = args[:prev_page_token] if args.key?(:prev_page_token)
          @token_pagination = args[:token_pagination] if args.key?(:token_pagination)
          @visitor_id = args[:visitor_id] if args.key?(:visitor_id)
        end
      end
      
      # Basic details about a subscription, including title, description and
      # thumbnails of the subscribed item.
      class SubscriptionSnippet
        include Google::Apis::Core::Hashable
      
        # The ID that YouTube uses to uniquely identify the subscriber's channel.
        # Corresponds to the JSON property `channelId`
        # @return [String]
        attr_accessor :channel_id
      
        # Channel title for the channel that the subscription belongs to.
        # Corresponds to the JSON property `channelTitle`
        # @return [String]
        attr_accessor :channel_title
      
        # The subscription's details.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The date and time that the subscription was created. The value is specified in
        # ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
        # Corresponds to the JSON property `publishedAt`
        # @return [DateTime]
        attr_accessor :published_at
      
        # A resource id is a generic reference that points to another YouTube resource.
        # Corresponds to the JSON property `resourceId`
        # @return [Google::Apis::YoutubeV3::ResourceId]
        attr_accessor :resource_id
      
        # Internal representation of thumbnails for a YouTube resource.
        # Corresponds to the JSON property `thumbnails`
        # @return [Google::Apis::YoutubeV3::ThumbnailDetails]
        attr_accessor :thumbnails
      
        # The subscription's title.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @channel_id = args[:channel_id] if args.key?(:channel_id)
          @channel_title = args[:channel_title] if args.key?(:channel_title)
          @description = args[:description] if args.key?(:description)
          @published_at = args[:published_at] if args.key?(:published_at)
          @resource_id = args[:resource_id] if args.key?(:resource_id)
          @thumbnails = args[:thumbnails] if args.key?(:thumbnails)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Basic details about a subscription's subscriber including title, description,
      # channel ID and thumbnails.
      class SubscriptionSubscriberSnippet
        include Google::Apis::Core::Hashable
      
        # The channel ID of the subscriber.
        # Corresponds to the JSON property `channelId`
        # @return [String]
        attr_accessor :channel_id
      
        # The description of the subscriber.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Internal representation of thumbnails for a YouTube resource.
        # Corresponds to the JSON property `thumbnails`
        # @return [Google::Apis::YoutubeV3::ThumbnailDetails]
        attr_accessor :thumbnails
      
        # The title of the subscriber.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @channel_id = args[:channel_id] if args.key?(:channel_id)
          @description = args[:description] if args.key?(:description)
          @thumbnails = args[:thumbnails] if args.key?(:thumbnails)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # A superChatEvent resource represents a Super Chat purchase on a YouTube
      # channel.
      class SuperChatEvent
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The ID that YouTube assigns to uniquely identify the Super Chat event.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # superChatEvent".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The snippet object contains basic details about the Super Chat event.
        # Corresponds to the JSON property `snippet`
        # @return [Google::Apis::YoutubeV3::SuperChatEventSnippet]
        attr_accessor :snippet
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @snippet = args[:snippet] if args.key?(:snippet)
        end
      end
      
      # 
      class SuperChatEventListResponse
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Serialized EventId of the request which produced this response.
        # Corresponds to the JSON property `eventId`
        # @return [String]
        attr_accessor :event_id
      
        # A list of Super Chat purchases that match the request criteria.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::YoutubeV3::SuperChatEvent>]
        attr_accessor :items
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # superChatEventListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The token that can be used as the value of the pageToken parameter to retrieve
        # the next page in the result set.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Paging details for lists of resources, including total number of items
        # available and number of resources returned in a single page.
        # Corresponds to the JSON property `pageInfo`
        # @return [Google::Apis::YoutubeV3::PageInfo]
        attr_accessor :page_info
      
        # Stub token pagination template to suppress results.
        # Corresponds to the JSON property `tokenPagination`
        # @return [Google::Apis::YoutubeV3::TokenPagination]
        attr_accessor :token_pagination
      
        # The visitorId identifies the visitor.
        # Corresponds to the JSON property `visitorId`
        # @return [String]
        attr_accessor :visitor_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @event_id = args[:event_id] if args.key?(:event_id)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @page_info = args[:page_info] if args.key?(:page_info)
          @token_pagination = args[:token_pagination] if args.key?(:token_pagination)
          @visitor_id = args[:visitor_id] if args.key?(:visitor_id)
        end
      end
      
      # 
      class SuperChatEventSnippet
        include Google::Apis::Core::Hashable
      
        # The purchase amount, in micros of the purchase currency. e.g., 1 is
        # represented as 1000000.
        # Corresponds to the JSON property `amountMicros`
        # @return [Fixnum]
        attr_accessor :amount_micros
      
        # Channel id where the event occurred.
        # Corresponds to the JSON property `channelId`
        # @return [String]
        attr_accessor :channel_id
      
        # The text contents of the comment left by the user.
        # Corresponds to the JSON property `commentText`
        # @return [String]
        attr_accessor :comment_text
      
        # The date and time when the event occurred. The value is specified in ISO 8601 (
        # YYYY-MM-DDThh:mm:ss.sZ) format.
        # Corresponds to the JSON property `createdAt`
        # @return [DateTime]
        attr_accessor :created_at
      
        # The currency in which the purchase was made. ISO 4217.
        # Corresponds to the JSON property `currency`
        # @return [String]
        attr_accessor :currency
      
        # A rendered string that displays the purchase amount and currency (e.g., "$1.00"
        # ). The string is rendered for the given language.
        # Corresponds to the JSON property `displayString`
        # @return [String]
        attr_accessor :display_string
      
        # True if this event is a Super Chat for Good purchase.
        # Corresponds to the JSON property `isSuperChatForGood`
        # @return [Boolean]
        attr_accessor :is_super_chat_for_good
        alias_method :is_super_chat_for_good?, :is_super_chat_for_good
      
        # True if this event is a Super Sticker event.
        # Corresponds to the JSON property `isSuperStickerEvent`
        # @return [Boolean]
        attr_accessor :is_super_sticker_event
        alias_method :is_super_sticker_event?, :is_super_sticker_event
      
        # The tier for the paid message, which is based on the amount of money spent to
        # purchase the message.
        # Corresponds to the JSON property `messageType`
        # @return [Fixnum]
        attr_accessor :message_type
      
        # Nonprofit information.
        # Corresponds to the JSON property `nonprofit`
        # @return [Google::Apis::YoutubeV3::Nonprofit]
        attr_accessor :nonprofit
      
        # If this event is a Super Sticker event, this field will contain metadata about
        # the Super Sticker.
        # Corresponds to the JSON property `superStickerMetadata`
        # @return [Google::Apis::YoutubeV3::SuperStickerMetadata]
        attr_accessor :super_sticker_metadata
      
        # Details about the supporter.
        # Corresponds to the JSON property `supporterDetails`
        # @return [Google::Apis::YoutubeV3::ChannelProfileDetails]
        attr_accessor :supporter_details
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @amount_micros = args[:amount_micros] if args.key?(:amount_micros)
          @channel_id = args[:channel_id] if args.key?(:channel_id)
          @comment_text = args[:comment_text] if args.key?(:comment_text)
          @created_at = args[:created_at] if args.key?(:created_at)
          @currency = args[:currency] if args.key?(:currency)
          @display_string = args[:display_string] if args.key?(:display_string)
          @is_super_chat_for_good = args[:is_super_chat_for_good] if args.key?(:is_super_chat_for_good)
          @is_super_sticker_event = args[:is_super_sticker_event] if args.key?(:is_super_sticker_event)
          @message_type = args[:message_type] if args.key?(:message_type)
          @nonprofit = args[:nonprofit] if args.key?(:nonprofit)
          @super_sticker_metadata = args[:super_sticker_metadata] if args.key?(:super_sticker_metadata)
          @supporter_details = args[:supporter_details] if args.key?(:supporter_details)
        end
      end
      
      # 
      class SuperStickerMetadata
        include Google::Apis::Core::Hashable
      
        # Internationalized alt text that describes the sticker image and any animation
        # associated with it.
        # Corresponds to the JSON property `altText`
        # @return [String]
        attr_accessor :alt_text
      
        # Specifies the localization language in which the alt text is returned.
        # Corresponds to the JSON property `altTextLanguage`
        # @return [String]
        attr_accessor :alt_text_language
      
        # Unique identifier of the Super Sticker. This is a shorter form of the alt_text
        # that includes pack name and a recognizable characteristic of the sticker.
        # Corresponds to the JSON property `stickerId`
        # @return [String]
        attr_accessor :sticker_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alt_text = args[:alt_text] if args.key?(:alt_text)
          @alt_text_language = args[:alt_text_language] if args.key?(:alt_text_language)
          @sticker_id = args[:sticker_id] if args.key?(:sticker_id)
        end
      end
      
      # A thumbnail is an image representing a YouTube resource.
      class Thumbnail
        include Google::Apis::Core::Hashable
      
        # (Optional) Height of the thumbnail image.
        # Corresponds to the JSON property `height`
        # @return [Fixnum]
        attr_accessor :height
      
        # The thumbnail image's URL.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        # (Optional) Width of the thumbnail image.
        # Corresponds to the JSON property `width`
        # @return [Fixnum]
        attr_accessor :width
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @height = args[:height] if args.key?(:height)
          @url = args[:url] if args.key?(:url)
          @width = args[:width] if args.key?(:width)
        end
      end
      
      # Internal representation of thumbnails for a YouTube resource.
      class ThumbnailDetails
        include Google::Apis::Core::Hashable
      
        # A thumbnail is an image representing a YouTube resource.
        # Corresponds to the JSON property `default`
        # @return [Google::Apis::YoutubeV3::Thumbnail]
        attr_accessor :default
      
        # A thumbnail is an image representing a YouTube resource.
        # Corresponds to the JSON property `high`
        # @return [Google::Apis::YoutubeV3::Thumbnail]
        attr_accessor :high
      
        # A thumbnail is an image representing a YouTube resource.
        # Corresponds to the JSON property `maxres`
        # @return [Google::Apis::YoutubeV3::Thumbnail]
        attr_accessor :maxres
      
        # A thumbnail is an image representing a YouTube resource.
        # Corresponds to the JSON property `medium`
        # @return [Google::Apis::YoutubeV3::Thumbnail]
        attr_accessor :medium
      
        # A thumbnail is an image representing a YouTube resource.
        # Corresponds to the JSON property `standard`
        # @return [Google::Apis::YoutubeV3::Thumbnail]
        attr_accessor :standard
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @default = args[:default] if args.key?(:default)
          @high = args[:high] if args.key?(:high)
          @maxres = args[:maxres] if args.key?(:maxres)
          @medium = args[:medium] if args.key?(:medium)
          @standard = args[:standard] if args.key?(:standard)
        end
      end
      
      # 
      class SetThumbnailResponse
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Serialized EventId of the request which produced this response.
        # Corresponds to the JSON property `eventId`
        # @return [String]
        attr_accessor :event_id
      
        # A list of thumbnails.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::YoutubeV3::ThumbnailDetails>]
        attr_accessor :items
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # thumbnailSetResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The visitorId identifies the visitor.
        # Corresponds to the JSON property `visitorId`
        # @return [String]
        attr_accessor :visitor_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @event_id = args[:event_id] if args.key?(:event_id)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @visitor_id = args[:visitor_id] if args.key?(:visitor_id)
        end
      end
      
      # Stub token pagination template to suppress results.
      class TokenPagination
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # A video resource represents a YouTube video.
      class Video
        include Google::Apis::Core::Hashable
      
        # Age restriction details related to a video. This data can only be retrieved by
        # the video owner.
        # Corresponds to the JSON property `ageGating`
        # @return [Google::Apis::YoutubeV3::VideoAgeGating]
        attr_accessor :age_gating
      
        # Details about the content of a YouTube Video.
        # Corresponds to the JSON property `contentDetails`
        # @return [Google::Apis::YoutubeV3::VideoContentDetails]
        attr_accessor :content_details
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Describes original video file properties, including technical details about
        # audio and video streams, but also metadata information like content length,
        # digitization time, or geotagging information.
        # Corresponds to the JSON property `fileDetails`
        # @return [Google::Apis::YoutubeV3::VideoFileDetails]
        attr_accessor :file_details
      
        # The ID that YouTube uses to uniquely identify the video.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # video".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Details about the live streaming metadata.
        # Corresponds to the JSON property `liveStreamingDetails`
        # @return [Google::Apis::YoutubeV3::VideoLiveStreamingDetails]
        attr_accessor :live_streaming_details
      
        # List with all localizations.
        # Corresponds to the JSON property `localizations`
        # @return [Hash<String,Google::Apis::YoutubeV3::VideoLocalization>]
        attr_accessor :localizations
      
        # Details about monetization of a YouTube Video.
        # Corresponds to the JSON property `monetizationDetails`
        # @return [Google::Apis::YoutubeV3::VideoMonetizationDetails]
        attr_accessor :monetization_details
      
        # Player to be used for a video playback.
        # Corresponds to the JSON property `player`
        # @return [Google::Apis::YoutubeV3::VideoPlayer]
        attr_accessor :player
      
        # Describes processing status and progress and availability of some other Video
        # resource parts.
        # Corresponds to the JSON property `processingDetails`
        # @return [Google::Apis::YoutubeV3::VideoProcessingDetails]
        attr_accessor :processing_details
      
        # Project specific details about the content of a YouTube Video.
        # Corresponds to the JSON property `projectDetails`
        # @return [Google::Apis::YoutubeV3::VideoProjectDetails]
        attr_accessor :project_details
      
        # Recording information associated with the video.
        # Corresponds to the JSON property `recordingDetails`
        # @return [Google::Apis::YoutubeV3::VideoRecordingDetails]
        attr_accessor :recording_details
      
        # Basic details about a video, including title, description, uploader,
        # thumbnails and category.
        # Corresponds to the JSON property `snippet`
        # @return [Google::Apis::YoutubeV3::VideoSnippet]
        attr_accessor :snippet
      
        # Statistics about the video, such as the number of times the video was viewed
        # or liked.
        # Corresponds to the JSON property `statistics`
        # @return [Google::Apis::YoutubeV3::VideoStatistics]
        attr_accessor :statistics
      
        # Basic details about a video category, such as its localized title.
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::YoutubeV3::VideoStatus]
        attr_accessor :status
      
        # Specifies suggestions on how to improve video content, including encoding
        # hints, tag suggestions, and editor suggestions.
        # Corresponds to the JSON property `suggestions`
        # @return [Google::Apis::YoutubeV3::VideoSuggestions]
        attr_accessor :suggestions
      
        # Freebase topic information related to the video.
        # Corresponds to the JSON property `topicDetails`
        # @return [Google::Apis::YoutubeV3::VideoTopicDetails]
        attr_accessor :topic_details
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @age_gating = args[:age_gating] if args.key?(:age_gating)
          @content_details = args[:content_details] if args.key?(:content_details)
          @etag = args[:etag] if args.key?(:etag)
          @file_details = args[:file_details] if args.key?(:file_details)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @live_streaming_details = args[:live_streaming_details] if args.key?(:live_streaming_details)
          @localizations = args[:localizations] if args.key?(:localizations)
          @monetization_details = args[:monetization_details] if args.key?(:monetization_details)
          @player = args[:player] if args.key?(:player)
          @processing_details = args[:processing_details] if args.key?(:processing_details)
          @project_details = args[:project_details] if args.key?(:project_details)
          @recording_details = args[:recording_details] if args.key?(:recording_details)
          @snippet = args[:snippet] if args.key?(:snippet)
          @statistics = args[:statistics] if args.key?(:statistics)
          @status = args[:status] if args.key?(:status)
          @suggestions = args[:suggestions] if args.key?(:suggestions)
          @topic_details = args[:topic_details] if args.key?(:topic_details)
        end
      end
      
      # 
      class VideoAbuseReport
        include Google::Apis::Core::Hashable
      
        # Additional comments regarding the abuse report.
        # Corresponds to the JSON property `comments`
        # @return [String]
        attr_accessor :comments
      
        # The language that the content was viewed in.
        # Corresponds to the JSON property `language`
        # @return [String]
        attr_accessor :language
      
        # The high-level, or primary, reason that the content is abusive. The value is
        # an abuse report reason ID.
        # Corresponds to the JSON property `reasonId`
        # @return [String]
        attr_accessor :reason_id
      
        # The specific, or secondary, reason that this content is abusive (if available).
        # The value is an abuse report reason ID that is a valid secondary reason for
        # the primary reason.
        # Corresponds to the JSON property `secondaryReasonId`
        # @return [String]
        attr_accessor :secondary_reason_id
      
        # The ID that YouTube uses to uniquely identify the video.
        # Corresponds to the JSON property `videoId`
        # @return [String]
        attr_accessor :video_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @comments = args[:comments] if args.key?(:comments)
          @language = args[:language] if args.key?(:language)
          @reason_id = args[:reason_id] if args.key?(:reason_id)
          @secondary_reason_id = args[:secondary_reason_id] if args.key?(:secondary_reason_id)
          @video_id = args[:video_id] if args.key?(:video_id)
        end
      end
      
      # A videoAbuseReportReason resource identifies a reason that a video could be
      # reported as abusive. Video abuse report reasons are used with video.
      # ReportAbuse.
      class VideoAbuseReportReason
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The ID of this abuse report reason.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # videoAbuseReportReason".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Basic details about a video category, such as its localized title.
        # Corresponds to the JSON property `snippet`
        # @return [Google::Apis::YoutubeV3::VideoAbuseReportReasonSnippet]
        attr_accessor :snippet
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @snippet = args[:snippet] if args.key?(:snippet)
        end
      end
      
      # 
      class ListVideoAbuseReportReasonResponse
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Serialized EventId of the request which produced this response.
        # Corresponds to the JSON property `eventId`
        # @return [String]
        attr_accessor :event_id
      
        # A list of valid abuse reasons that are used with video.ReportAbuse.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::YoutubeV3::VideoAbuseReportReason>]
        attr_accessor :items
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # videoAbuseReportReasonListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The visitorId identifies the visitor.
        # Corresponds to the JSON property `visitorId`
        # @return [String]
        attr_accessor :visitor_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @event_id = args[:event_id] if args.key?(:event_id)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @visitor_id = args[:visitor_id] if args.key?(:visitor_id)
        end
      end
      
      # Basic details about a video category, such as its localized title.
      class VideoAbuseReportReasonSnippet
        include Google::Apis::Core::Hashable
      
        # The localized label belonging to this abuse report reason.
        # Corresponds to the JSON property `label`
        # @return [String]
        attr_accessor :label
      
        # The secondary reasons associated with this reason, if any are available. (
        # There might be 0 or more.)
        # Corresponds to the JSON property `secondaryReasons`
        # @return [Array<Google::Apis::YoutubeV3::VideoAbuseReportSecondaryReason>]
        attr_accessor :secondary_reasons
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @label = args[:label] if args.key?(:label)
          @secondary_reasons = args[:secondary_reasons] if args.key?(:secondary_reasons)
        end
      end
      
      # 
      class VideoAbuseReportSecondaryReason
        include Google::Apis::Core::Hashable
      
        # The ID of this abuse report secondary reason.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The localized label for this abuse report secondary reason.
        # Corresponds to the JSON property `label`
        # @return [String]
        attr_accessor :label
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @label = args[:label] if args.key?(:label)
        end
      end
      
      # 
      class VideoAgeGating
        include Google::Apis::Core::Hashable
      
        # Indicates whether or not the video has alcoholic beverage content. Only users
        # of legal purchasing age in a particular country, as identified by ICAP, can
        # view the content.
        # Corresponds to the JSON property `alcoholContent`
        # @return [Boolean]
        attr_accessor :alcohol_content
        alias_method :alcohol_content?, :alcohol_content
      
        # Age-restricted trailers. For redband trailers and adult-rated video-games.
        # Only users aged 18+ can view the content. The the field is true the content is
        # restricted to viewers aged 18+. Otherwise The field won't be present.
        # Corresponds to the JSON property `restricted`
        # @return [Boolean]
        attr_accessor :restricted
        alias_method :restricted?, :restricted
      
        # Video game rating, if any.
        # Corresponds to the JSON property `videoGameRating`
        # @return [String]
        attr_accessor :video_game_rating
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alcohol_content = args[:alcohol_content] if args.key?(:alcohol_content)
          @restricted = args[:restricted] if args.key?(:restricted)
          @video_game_rating = args[:video_game_rating] if args.key?(:video_game_rating)
        end
      end
      
      # A videoCategory resource identifies a category that has been or could be
      # associated with uploaded videos.
      class VideoCategory
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The ID that YouTube uses to uniquely identify the video category.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # videoCategory".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Basic details about a video category, such as its localized title.
        # Corresponds to the JSON property `snippet`
        # @return [Google::Apis::YoutubeV3::VideoCategorySnippet]
        attr_accessor :snippet
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @snippet = args[:snippet] if args.key?(:snippet)
        end
      end
      
      # 
      class ListVideoCategoryResponse
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Serialized EventId of the request which produced this response.
        # Corresponds to the JSON property `eventId`
        # @return [String]
        attr_accessor :event_id
      
        # A list of video categories that can be associated with YouTube videos. In this
        # map, the video category ID is the map key, and its value is the corresponding
        # videoCategory resource.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::YoutubeV3::VideoCategory>]
        attr_accessor :items
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # videoCategoryListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The token that can be used as the value of the pageToken parameter to retrieve
        # the next page in the result set.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Paging details for lists of resources, including total number of items
        # available and number of resources returned in a single page.
        # Corresponds to the JSON property `pageInfo`
        # @return [Google::Apis::YoutubeV3::PageInfo]
        attr_accessor :page_info
      
        # The token that can be used as the value of the pageToken parameter to retrieve
        # the previous page in the result set.
        # Corresponds to the JSON property `prevPageToken`
        # @return [String]
        attr_accessor :prev_page_token
      
        # Stub token pagination template to suppress results.
        # Corresponds to the JSON property `tokenPagination`
        # @return [Google::Apis::YoutubeV3::TokenPagination]
        attr_accessor :token_pagination
      
        # The visitorId identifies the visitor.
        # Corresponds to the JSON property `visitorId`
        # @return [String]
        attr_accessor :visitor_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @event_id = args[:event_id] if args.key?(:event_id)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @page_info = args[:page_info] if args.key?(:page_info)
          @prev_page_token = args[:prev_page_token] if args.key?(:prev_page_token)
          @token_pagination = args[:token_pagination] if args.key?(:token_pagination)
          @visitor_id = args[:visitor_id] if args.key?(:visitor_id)
        end
      end
      
      # Basic details about a video category, such as its localized title.
      class VideoCategorySnippet
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `assignable`
        # @return [Boolean]
        attr_accessor :assignable
        alias_method :assignable?, :assignable
      
        # The YouTube channel that created the video category.
        # Corresponds to the JSON property `channelId`
        # @return [String]
        attr_accessor :channel_id
      
        # The video category's title.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @assignable = args[:assignable] if args.key?(:assignable)
          @channel_id = args[:channel_id] if args.key?(:channel_id)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Details about the content of a YouTube Video.
      class VideoContentDetails
        include Google::Apis::Core::Hashable
      
        # The value of captions indicates whether the video has captions or not.
        # Corresponds to the JSON property `caption`
        # @return [String]
        attr_accessor :caption
      
        # Ratings schemes. The country-specific ratings are mostly for movies and shows.
        # NEXT_ID: 72
        # Corresponds to the JSON property `contentRating`
        # @return [Google::Apis::YoutubeV3::ContentRating]
        attr_accessor :content_rating
      
        # Rights management policy for YouTube resources.
        # Corresponds to the JSON property `countryRestriction`
        # @return [Google::Apis::YoutubeV3::AccessPolicy]
        attr_accessor :country_restriction
      
        # The value of definition indicates whether the video is available in high
        # definition or only in standard definition.
        # Corresponds to the JSON property `definition`
        # @return [String]
        attr_accessor :definition
      
        # The value of dimension indicates whether the video is available in 3D or in 2D.
        # Corresponds to the JSON property `dimension`
        # @return [String]
        attr_accessor :dimension
      
        # The length of the video. The tag value is an ISO 8601 duration in the format
        # PT#M#S, in which the letters PT indicate that the value specifies a period of
        # time, and the letters M and S refer to length in minutes and seconds,
        # respectively. The # characters preceding the M and S letters are both integers
        # that specify the number of minutes (or seconds) of the video. For example, a
        # value of PT15M51S indicates that the video is 15 minutes and 51 seconds long.
        # Corresponds to the JSON property `duration`
        # @return [String]
        attr_accessor :duration
      
        # Indicates whether the video uploader has provided a custom thumbnail image for
        # the video. This property is only visible to the video uploader.
        # Corresponds to the JSON property `hasCustomThumbnail`
        # @return [Boolean]
        attr_accessor :has_custom_thumbnail
        alias_method :has_custom_thumbnail?, :has_custom_thumbnail
      
        # The value of is_license_content indicates whether the video is licensed
        # content.
        # Corresponds to the JSON property `licensedContent`
        # @return [Boolean]
        attr_accessor :licensed_content
        alias_method :licensed_content?, :licensed_content
      
        # Specifies the projection format of the video.
        # Corresponds to the JSON property `projection`
        # @return [String]
        attr_accessor :projection
      
        # DEPRECATED Region restriction of the video.
        # Corresponds to the JSON property `regionRestriction`
        # @return [Google::Apis::YoutubeV3::VideoContentDetailsRegionRestriction]
        attr_accessor :region_restriction
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @caption = args[:caption] if args.key?(:caption)
          @content_rating = args[:content_rating] if args.key?(:content_rating)
          @country_restriction = args[:country_restriction] if args.key?(:country_restriction)
          @definition = args[:definition] if args.key?(:definition)
          @dimension = args[:dimension] if args.key?(:dimension)
          @duration = args[:duration] if args.key?(:duration)
          @has_custom_thumbnail = args[:has_custom_thumbnail] if args.key?(:has_custom_thumbnail)
          @licensed_content = args[:licensed_content] if args.key?(:licensed_content)
          @projection = args[:projection] if args.key?(:projection)
          @region_restriction = args[:region_restriction] if args.key?(:region_restriction)
        end
      end
      
      # DEPRECATED Region restriction of the video.
      class VideoContentDetailsRegionRestriction
        include Google::Apis::Core::Hashable
      
        # A list of region codes that identify countries where the video is viewable. If
        # this property is present and a country is not listed in its value, then the
        # video is blocked from appearing in that country. If this property is present
        # and contains an empty list, the video is blocked in all countries.
        # Corresponds to the JSON property `allowed`
        # @return [Array<String>]
        attr_accessor :allowed
      
        # A list of region codes that identify countries where the video is blocked. If
        # this property is present and a country is not listed in its value, then the
        # video is viewable in that country. If this property is present and contains an
        # empty list, the video is viewable in all countries.
        # Corresponds to the JSON property `blocked`
        # @return [Array<String>]
        attr_accessor :blocked
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @allowed = args[:allowed] if args.key?(:allowed)
          @blocked = args[:blocked] if args.key?(:blocked)
        end
      end
      
      # Describes original video file properties, including technical details about
      # audio and video streams, but also metadata information like content length,
      # digitization time, or geotagging information.
      class VideoFileDetails
        include Google::Apis::Core::Hashable
      
        # A list of audio streams contained in the uploaded video file. Each item in the
        # list contains detailed metadata about an audio stream.
        # Corresponds to the JSON property `audioStreams`
        # @return [Array<Google::Apis::YoutubeV3::VideoFileDetailsAudioStream>]
        attr_accessor :audio_streams
      
        # The uploaded video file's combined (video and audio) bitrate in bits per
        # second.
        # Corresponds to the JSON property `bitrateBps`
        # @return [Fixnum]
        attr_accessor :bitrate_bps
      
        # The uploaded video file's container format.
        # Corresponds to the JSON property `container`
        # @return [String]
        attr_accessor :container
      
        # The date and time when the uploaded video file was created. The value is
        # specified in ISO 8601 format. Currently, the following ISO 8601 formats are
        # supported:
        # - Date only: YYYY-MM-DD
        # - Naive time: YYYY-MM-DDTHH:MM:SS
        # - Time with timezone: YYYY-MM-DDTHH:MM:SS+HH:MM
        # Corresponds to the JSON property `creationTime`
        # @return [String]
        attr_accessor :creation_time
      
        # The length of the uploaded video in milliseconds.
        # Corresponds to the JSON property `durationMs`
        # @return [Fixnum]
        attr_accessor :duration_ms
      
        # The uploaded file's name. This field is present whether a video file or
        # another type of file was uploaded.
        # Corresponds to the JSON property `fileName`
        # @return [String]
        attr_accessor :file_name
      
        # The uploaded file's size in bytes. This field is present whether a video file
        # or another type of file was uploaded.
        # Corresponds to the JSON property `fileSize`
        # @return [Fixnum]
        attr_accessor :file_size
      
        # The uploaded file's type as detected by YouTube's video processing engine.
        # Currently, YouTube only processes video files, but this field is present
        # whether a video file or another type of file was uploaded.
        # Corresponds to the JSON property `fileType`
        # @return [String]
        attr_accessor :file_type
      
        # A list of video streams contained in the uploaded video file. Each item in the
        # list contains detailed metadata about a video stream.
        # Corresponds to the JSON property `videoStreams`
        # @return [Array<Google::Apis::YoutubeV3::VideoFileDetailsVideoStream>]
        attr_accessor :video_streams
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @audio_streams = args[:audio_streams] if args.key?(:audio_streams)
          @bitrate_bps = args[:bitrate_bps] if args.key?(:bitrate_bps)
          @container = args[:container] if args.key?(:container)
          @creation_time = args[:creation_time] if args.key?(:creation_time)
          @duration_ms = args[:duration_ms] if args.key?(:duration_ms)
          @file_name = args[:file_name] if args.key?(:file_name)
          @file_size = args[:file_size] if args.key?(:file_size)
          @file_type = args[:file_type] if args.key?(:file_type)
          @video_streams = args[:video_streams] if args.key?(:video_streams)
        end
      end
      
      # Information about an audio stream.
      class VideoFileDetailsAudioStream
        include Google::Apis::Core::Hashable
      
        # The audio stream's bitrate, in bits per second.
        # Corresponds to the JSON property `bitrateBps`
        # @return [Fixnum]
        attr_accessor :bitrate_bps
      
        # The number of audio channels that the stream contains.
        # Corresponds to the JSON property `channelCount`
        # @return [Fixnum]
        attr_accessor :channel_count
      
        # The audio codec that the stream uses.
        # Corresponds to the JSON property `codec`
        # @return [String]
        attr_accessor :codec
      
        # A value that uniquely identifies a video vendor. Typically, the value is a
        # four-letter vendor code.
        # Corresponds to the JSON property `vendor`
        # @return [String]
        attr_accessor :vendor
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bitrate_bps = args[:bitrate_bps] if args.key?(:bitrate_bps)
          @channel_count = args[:channel_count] if args.key?(:channel_count)
          @codec = args[:codec] if args.key?(:codec)
          @vendor = args[:vendor] if args.key?(:vendor)
        end
      end
      
      # Information about a video stream.
      class VideoFileDetailsVideoStream
        include Google::Apis::Core::Hashable
      
        # The video content's display aspect ratio, which specifies the aspect ratio in
        # which the video should be displayed.
        # Corresponds to the JSON property `aspectRatio`
        # @return [Float]
        attr_accessor :aspect_ratio
      
        # The video stream's bitrate, in bits per second.
        # Corresponds to the JSON property `bitrateBps`
        # @return [Fixnum]
        attr_accessor :bitrate_bps
      
        # The video codec that the stream uses.
        # Corresponds to the JSON property `codec`
        # @return [String]
        attr_accessor :codec
      
        # The video stream's frame rate, in frames per second.
        # Corresponds to the JSON property `frameRateFps`
        # @return [Float]
        attr_accessor :frame_rate_fps
      
        # The encoded video content's height in pixels.
        # Corresponds to the JSON property `heightPixels`
        # @return [Fixnum]
        attr_accessor :height_pixels
      
        # The amount that YouTube needs to rotate the original source content to
        # properly display the video.
        # Corresponds to the JSON property `rotation`
        # @return [String]
        attr_accessor :rotation
      
        # A value that uniquely identifies a video vendor. Typically, the value is a
        # four-letter vendor code.
        # Corresponds to the JSON property `vendor`
        # @return [String]
        attr_accessor :vendor
      
        # The encoded video content's width in pixels. You can calculate the video's
        # encoding aspect ratio as width_pixels / height_pixels.
        # Corresponds to the JSON property `widthPixels`
        # @return [Fixnum]
        attr_accessor :width_pixels
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @aspect_ratio = args[:aspect_ratio] if args.key?(:aspect_ratio)
          @bitrate_bps = args[:bitrate_bps] if args.key?(:bitrate_bps)
          @codec = args[:codec] if args.key?(:codec)
          @frame_rate_fps = args[:frame_rate_fps] if args.key?(:frame_rate_fps)
          @height_pixels = args[:height_pixels] if args.key?(:height_pixels)
          @rotation = args[:rotation] if args.key?(:rotation)
          @vendor = args[:vendor] if args.key?(:vendor)
          @width_pixels = args[:width_pixels] if args.key?(:width_pixels)
        end
      end
      
      # 
      class GetVideoRatingResponse
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Serialized EventId of the request which produced this response.
        # Corresponds to the JSON property `eventId`
        # @return [String]
        attr_accessor :event_id
      
        # A list of ratings that match the request criteria.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::YoutubeV3::VideoRating>]
        attr_accessor :items
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # videoGetRatingResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The visitorId identifies the visitor.
        # Corresponds to the JSON property `visitorId`
        # @return [String]
        attr_accessor :visitor_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @event_id = args[:event_id] if args.key?(:event_id)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @visitor_id = args[:visitor_id] if args.key?(:visitor_id)
        end
      end
      
      # 
      class ListVideosResponse
        include Google::Apis::Core::Hashable
      
        # Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Serialized EventId of the request which produced this response.
        # Corresponds to the JSON property `eventId`
        # @return [String]
        attr_accessor :event_id
      
        # A list of videos that match the request criteria.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::YoutubeV3::Video>]
        attr_accessor :items
      
        # Identifies what kind of resource this is. Value: the fixed string "youtube#
        # videoListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The token that can be used as the value of the pageToken parameter to retrieve
        # the next page in the result set.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Paging details for lists of resources, including total number of items
        # available and number of resources returned in a single page.
        # Corresponds to the JSON property `pageInfo`
        # @return [Google::Apis::YoutubeV3::PageInfo]
        attr_accessor :page_info
      
        # The token that can be used as the value of the pageToken parameter to retrieve
        # the previous page in the result set.
        # Corresponds to the JSON property `prevPageToken`
        # @return [String]
        attr_accessor :prev_page_token
      
        # Stub token pagination template to suppress results.
        # Corresponds to the JSON property `tokenPagination`
        # @return [Google::Apis::YoutubeV3::TokenPagination]
        attr_accessor :token_pagination
      
        # The visitorId identifies the visitor.
        # Corresponds to the JSON property `visitorId`
        # @return [String]
        attr_accessor :visitor_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @event_id = args[:event_id] if args.key?(:event_id)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @page_info = args[:page_info] if args.key?(:page_info)
          @prev_page_token = args[:prev_page_token] if args.key?(:prev_page_token)
          @token_pagination = args[:token_pagination] if args.key?(:token_pagination)
          @visitor_id = args[:visitor_id] if args.key?(:visitor_id)
        end
      end
      
      # Details about the live streaming metadata.
      class VideoLiveStreamingDetails
        include Google::Apis::Core::Hashable
      
        # The ID of the currently active live chat attached to this video. This field is
        # filled only if the video is a currently live broadcast that has live chat.
        # Once the broadcast transitions to complete this field will be removed and the
        # live chat closed down. For persistent broadcasts that live chat id will no
        # longer be tied to this video but rather to the new video being displayed at
        # the persistent page.
        # Corresponds to the JSON property `activeLiveChatId`
        # @return [String]
        attr_accessor :active_live_chat_id
      
        # The time that the broadcast actually ended. The value is specified in ISO 8601
        # (YYYY-MM-DDThh:mm:ss.sZ) format. This value will not be available until the
        # broadcast is over.
        # Corresponds to the JSON property `actualEndTime`
        # @return [DateTime]
        attr_accessor :actual_end_time
      
        # The time that the broadcast actually started. The value is specified in ISO
        # 8601 (YYYY-MM-DDThh:mm:ss.sZ) format. This value will not be available until
        # the broadcast begins.
        # Corresponds to the JSON property `actualStartTime`
        # @return [DateTime]
        attr_accessor :actual_start_time
      
        # The number of viewers currently watching the broadcast. The property and its
        # value will be present if the broadcast has current viewers and the broadcast
        # owner has not hidden the viewcount for the video. Note that YouTube stops
        # tracking the number of concurrent viewers for a broadcast when the broadcast
        # ends. So, this property would not identify the number of viewers watching an
        # archived video of a live broadcast that already ended.
        # Corresponds to the JSON property `concurrentViewers`
        # @return [Fixnum]
        attr_accessor :concurrent_viewers
      
        # The time that the broadcast is scheduled to end. The value is specified in ISO
        # 8601 (YYYY-MM-DDThh:mm:ss.sZ) format. If the value is empty or the property is
        # not present, then the broadcast is scheduled to continue indefinitely.
        # Corresponds to the JSON property `scheduledEndTime`
        # @return [DateTime]
        attr_accessor :scheduled_end_time
      
        # The time that the broadcast is scheduled to begin. The value is specified in
        # ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
        # Corresponds to the JSON property `scheduledStartTime`
        # @return [DateTime]
        attr_accessor :scheduled_start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @active_live_chat_id = args[:active_live_chat_id] if args.key?(:active_live_chat_id)
          @actual_end_time = args[:actual_end_time] if args.key?(:actual_end_time)
          @actual_start_time = args[:actual_start_time] if args.key?(:actual_start_time)
          @concurrent_viewers = args[:concurrent_viewers] if args.key?(:concurrent_viewers)
          @scheduled_end_time = args[:scheduled_end_time] if args.key?(:scheduled_end_time)
          @scheduled_start_time = args[:scheduled_start_time] if args.key?(:scheduled_start_time)
        end
      end
      
      # Localized versions of certain video properties (e.g. title).
      class VideoLocalization
        include Google::Apis::Core::Hashable
      
        # Localized version of the video's description.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Localized version of the video's title.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Details about monetization of a YouTube Video.
      class VideoMonetizationDetails
        include Google::Apis::Core::Hashable
      
        # Rights management policy for YouTube resources.
        # Corresponds to the JSON property `access`
        # @return [Google::Apis::YoutubeV3::AccessPolicy]
        attr_accessor :access
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @access = args[:access] if args.key?(:access)
        end
      end
      
      # Player to be used for a video playback.
      class VideoPlayer
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `embedHeight`
        # @return [Fixnum]
        attr_accessor :embed_height
      
        # An <iframe> tag that embeds a player that will play the video.
        # Corresponds to the JSON property `embedHtml`
        # @return [String]
        attr_accessor :embed_html
      
        # The embed width
        # Corresponds to the JSON property `embedWidth`
        # @return [Fixnum]
        attr_accessor :embed_width
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @embed_height = args[:embed_height] if args.key?(:embed_height)
          @embed_html = args[:embed_html] if args.key?(:embed_html)
          @embed_width = args[:embed_width] if args.key?(:embed_width)
        end
      end
      
      # Describes processing status and progress and availability of some other Video
      # resource parts.
      class VideoProcessingDetails
        include Google::Apis::Core::Hashable
      
        # This value indicates whether video editing suggestions, which might improve
        # video quality or the playback experience, are available for the video. You can
        # retrieve these suggestions by requesting the suggestions part in your videos.
        # list() request.
        # Corresponds to the JSON property `editorSuggestionsAvailability`
        # @return [String]
        attr_accessor :editor_suggestions_availability
      
        # This value indicates whether file details are available for the uploaded video.
        # You can retrieve a video's file details by requesting the fileDetails part in
        # your videos.list() request.
        # Corresponds to the JSON property `fileDetailsAvailability`
        # @return [String]
        attr_accessor :file_details_availability
      
        # The reason that YouTube failed to process the video. This property will only
        # have a value if the processingStatus property's value is failed.
        # Corresponds to the JSON property `processingFailureReason`
        # @return [String]
        attr_accessor :processing_failure_reason
      
        # This value indicates whether the video processing engine has generated
        # suggestions that might improve YouTube's ability to process the the video,
        # warnings that explain video processing problems, or errors that cause video
        # processing problems. You can retrieve these suggestions by requesting the
        # suggestions part in your videos.list() request.
        # Corresponds to the JSON property `processingIssuesAvailability`
        # @return [String]
        attr_accessor :processing_issues_availability
      
        # Video processing progress and completion time estimate.
        # Corresponds to the JSON property `processingProgress`
        # @return [Google::Apis::YoutubeV3::VideoProcessingDetailsProcessingProgress]
        attr_accessor :processing_progress
      
        # The video's processing status. This value indicates whether YouTube was able
        # to process the video or if the video is still being processed.
        # Corresponds to the JSON property `processingStatus`
        # @return [String]
        attr_accessor :processing_status
      
        # This value indicates whether keyword (tag) suggestions are available for the
        # video. Tags can be added to a video's metadata to make it easier for other
        # users to find the video. You can retrieve these suggestions by requesting the
        # suggestions part in your videos.list() request.
        # Corresponds to the JSON property `tagSuggestionsAvailability`
        # @return [String]
        attr_accessor :tag_suggestions_availability
      
        # This value indicates whether thumbnail images have been generated for the
        # video.
        # Corresponds to the JSON property `thumbnailsAvailability`
        # @return [String]
        attr_accessor :thumbnails_availability
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @editor_suggestions_availability = args[:editor_suggestions_availability] if args.key?(:editor_suggestions_availability)
          @file_details_availability = args[:file_details_availability] if args.key?(:file_details_availability)
          @processing_failure_reason = args[:processing_failure_reason] if args.key?(:processing_failure_reason)
          @processing_issues_availability = args[:processing_issues_availability] if args.key?(:processing_issues_availability)
          @processing_progress = args[:processing_progress] if args.key?(:processing_progress)
          @processing_status = args[:processing_status] if args.key?(:processing_status)
          @tag_suggestions_availability = args[:tag_suggestions_availability] if args.key?(:tag_suggestions_availability)
          @thumbnails_availability = args[:thumbnails_availability] if args.key?(:thumbnails_availability)
        end
      end
      
      # Video processing progress and completion time estimate.
      class VideoProcessingDetailsProcessingProgress
        include Google::Apis::Core::Hashable
      
        # The number of parts of the video that YouTube has already processed. You can
        # estimate the percentage of the video that YouTube has already processed by
        # calculating:
        # 100 * parts_processed / parts_total
        # Note that since the estimated number of parts could increase without a
        # corresponding increase in the number of parts that have already been processed,
        # it is possible that the calculated progress could periodically decrease while
        # YouTube processes a video.
        # Corresponds to the JSON property `partsProcessed`
        # @return [Fixnum]
        attr_accessor :parts_processed
      
        # An estimate of the total number of parts that need to be processed for the
        # video. The number may be updated with more precise estimates while YouTube
        # processes the video.
        # Corresponds to the JSON property `partsTotal`
        # @return [Fixnum]
        attr_accessor :parts_total
      
        # An estimate of the amount of time, in millseconds, that YouTube needs to
        # finish processing the video.
        # Corresponds to the JSON property `timeLeftMs`
        # @return [Fixnum]
        attr_accessor :time_left_ms
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @parts_processed = args[:parts_processed] if args.key?(:parts_processed)
          @parts_total = args[:parts_total] if args.key?(:parts_total)
          @time_left_ms = args[:time_left_ms] if args.key?(:time_left_ms)
        end
      end
      
      # Project specific details about the content of a YouTube Video.
      class VideoProjectDetails
        include Google::Apis::Core::Hashable
      
        # A list of project tags associated with the video during the upload.
        # Corresponds to the JSON property `tags`
        # @return [Array<String>]
        attr_accessor :tags
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @tags = args[:tags] if args.key?(:tags)
        end
      end
      
      # 
      class VideoRating
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `rating`
        # @return [String]
        attr_accessor :rating
      
        # 
        # Corresponds to the JSON property `videoId`
        # @return [String]
        attr_accessor :video_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @rating = args[:rating] if args.key?(:rating)
          @video_id = args[:video_id] if args.key?(:video_id)
        end
      end
      
      # Recording information associated with the video.
      class VideoRecordingDetails
        include Google::Apis::Core::Hashable
      
        # Geographical coordinates of a point, in WGS84.
        # Corresponds to the JSON property `location`
        # @return [Google::Apis::YoutubeV3::GeoPoint]
        attr_accessor :location
      
        # The text description of the location where the video was recorded.
        # Corresponds to the JSON property `locationDescription`
        # @return [String]
        attr_accessor :location_description
      
        # The date and time when the video was recorded. The value is specified in ISO
        # 8601 (YYYY-MM-DDThh:mm:ss.sssZ) format.
        # Corresponds to the JSON property `recordingDate`
        # @return [DateTime]
        attr_accessor :recording_date
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @location = args[:location] if args.key?(:location)
          @location_description = args[:location_description] if args.key?(:location_description)
          @recording_date = args[:recording_date] if args.key?(:recording_date)
        end
      end
      
      # Basic details about a video, including title, description, uploader,
      # thumbnails and category.
      class VideoSnippet
        include Google::Apis::Core::Hashable
      
        # The YouTube video category associated with the video.
        # Corresponds to the JSON property `categoryId`
        # @return [String]
        attr_accessor :category_id
      
        # The ID that YouTube uses to uniquely identify the channel that the video was
        # uploaded to.
        # Corresponds to the JSON property `channelId`
        # @return [String]
        attr_accessor :channel_id
      
        # Channel title for the channel that the video belongs to.
        # Corresponds to the JSON property `channelTitle`
        # @return [String]
        attr_accessor :channel_title
      
        # The default_audio_language property specifies the language spoken in the video'
        # s default audio track.
        # Corresponds to the JSON property `defaultAudioLanguage`
        # @return [String]
        attr_accessor :default_audio_language
      
        # The language of the videos's default snippet.
        # Corresponds to the JSON property `defaultLanguage`
        # @return [String]
        attr_accessor :default_language
      
        # The video's description.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Indicates if the video is an upcoming/active live broadcast. Or it's "none" if
        # the video is not an upcoming/active live broadcast.
        # Corresponds to the JSON property `liveBroadcastContent`
        # @return [String]
        attr_accessor :live_broadcast_content
      
        # Localized versions of certain video properties (e.g. title).
        # Corresponds to the JSON property `localized`
        # @return [Google::Apis::YoutubeV3::VideoLocalization]
        attr_accessor :localized
      
        # The date and time that the video was uploaded. The value is specified in ISO
        # 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
        # Corresponds to the JSON property `publishedAt`
        # @return [DateTime]
        attr_accessor :published_at
      
        # A list of keyword tags associated with the video. Tags may contain spaces.
        # Corresponds to the JSON property `tags`
        # @return [Array<String>]
        attr_accessor :tags
      
        # Internal representation of thumbnails for a YouTube resource.
        # Corresponds to the JSON property `thumbnails`
        # @return [Google::Apis::YoutubeV3::ThumbnailDetails]
        attr_accessor :thumbnails
      
        # The video's title.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @category_id = args[:category_id] if args.key?(:category_id)
          @channel_id = args[:channel_id] if args.key?(:channel_id)
          @channel_title = args[:channel_title] if args.key?(:channel_title)
          @default_audio_language = args[:default_audio_language] if args.key?(:default_audio_language)
          @default_language = args[:default_language] if args.key?(:default_language)
          @description = args[:description] if args.key?(:description)
          @live_broadcast_content = args[:live_broadcast_content] if args.key?(:live_broadcast_content)
          @localized = args[:localized] if args.key?(:localized)
          @published_at = args[:published_at] if args.key?(:published_at)
          @tags = args[:tags] if args.key?(:tags)
          @thumbnails = args[:thumbnails] if args.key?(:thumbnails)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Statistics about the video, such as the number of times the video was viewed
      # or liked.
      class VideoStatistics
        include Google::Apis::Core::Hashable
      
        # The number of comments for the video.
        # Corresponds to the JSON property `commentCount`
        # @return [Fixnum]
        attr_accessor :comment_count
      
        # The number of users who have indicated that they disliked the video by giving
        # it a negative rating.
        # Corresponds to the JSON property `dislikeCount`
        # @return [Fixnum]
        attr_accessor :dislike_count
      
        # The number of users who currently have the video marked as a favorite video.
        # Corresponds to the JSON property `favoriteCount`
        # @return [Fixnum]
        attr_accessor :favorite_count
      
        # The number of users who have indicated that they liked the video by giving it
        # a positive rating.
        # Corresponds to the JSON property `likeCount`
        # @return [Fixnum]
        attr_accessor :like_count
      
        # The number of times the video has been viewed.
        # Corresponds to the JSON property `viewCount`
        # @return [Fixnum]
        attr_accessor :view_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @comment_count = args[:comment_count] if args.key?(:comment_count)
          @dislike_count = args[:dislike_count] if args.key?(:dislike_count)
          @favorite_count = args[:favorite_count] if args.key?(:favorite_count)
          @like_count = args[:like_count] if args.key?(:like_count)
          @view_count = args[:view_count] if args.key?(:view_count)
        end
      end
      
      # Basic details about a video category, such as its localized title.
      class VideoStatus
        include Google::Apis::Core::Hashable
      
        # This value indicates if the video can be embedded on another website.
        # Corresponds to the JSON property `embeddable`
        # @return [Boolean]
        attr_accessor :embeddable
        alias_method :embeddable?, :embeddable
      
        # This value explains why a video failed to upload. This property is only
        # present if the uploadStatus property indicates that the upload failed.
        # Corresponds to the JSON property `failureReason`
        # @return [String]
        attr_accessor :failure_reason
      
        # The video's license.
        # Corresponds to the JSON property `license`
        # @return [String]
        attr_accessor :license
      
        # The video's privacy status.
        # Corresponds to the JSON property `privacyStatus`
        # @return [String]
        attr_accessor :privacy_status
      
        # This value indicates if the extended video statistics on the watch page can be
        # viewed by everyone. Note that the view count, likes, etc will still be visible
        # if this is disabled.
        # Corresponds to the JSON property `publicStatsViewable`
        # @return [Boolean]
        attr_accessor :public_stats_viewable
        alias_method :public_stats_viewable?, :public_stats_viewable
      
        # The date and time when the video is scheduled to publish. It can be set only
        # if the privacy status of the video is private. The value is specified in ISO
        # 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
        # Corresponds to the JSON property `publishAt`
        # @return [DateTime]
        attr_accessor :publish_at
      
        # This value explains why YouTube rejected an uploaded video. This property is
        # only present if the uploadStatus property indicates that the upload was
        # rejected.
        # Corresponds to the JSON property `rejectionReason`
        # @return [String]
        attr_accessor :rejection_reason
      
        # The status of the uploaded video.
        # Corresponds to the JSON property `uploadStatus`
        # @return [String]
        attr_accessor :upload_status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @embeddable = args[:embeddable] if args.key?(:embeddable)
          @failure_reason = args[:failure_reason] if args.key?(:failure_reason)
          @license = args[:license] if args.key?(:license)
          @privacy_status = args[:privacy_status] if args.key?(:privacy_status)
          @public_stats_viewable = args[:public_stats_viewable] if args.key?(:public_stats_viewable)
          @publish_at = args[:publish_at] if args.key?(:publish_at)
          @rejection_reason = args[:rejection_reason] if args.key?(:rejection_reason)
          @upload_status = args[:upload_status] if args.key?(:upload_status)
        end
      end
      
      # Specifies suggestions on how to improve video content, including encoding
      # hints, tag suggestions, and editor suggestions.
      class VideoSuggestions
        include Google::Apis::Core::Hashable
      
        # A list of video editing operations that might improve the video quality or
        # playback experience of the uploaded video.
        # Corresponds to the JSON property `editorSuggestions`
        # @return [Array<String>]
        attr_accessor :editor_suggestions
      
        # A list of errors that will prevent YouTube from successfully processing the
        # uploaded video video. These errors indicate that, regardless of the video's
        # current processing status, eventually, that status will almost certainly be
        # failed.
        # Corresponds to the JSON property `processingErrors`
        # @return [Array<String>]
        attr_accessor :processing_errors
      
        # A list of suggestions that may improve YouTube's ability to process the video.
        # Corresponds to the JSON property `processingHints`
        # @return [Array<String>]
        attr_accessor :processing_hints
      
        # A list of reasons why YouTube may have difficulty transcoding the uploaded
        # video or that might result in an erroneous transcoding. These warnings are
        # generated before YouTube actually processes the uploaded video file. In
        # addition, they identify issues that are unlikely to cause the video processing
        # to fail but that might cause problems such as sync issues, video artifacts, or
        # a missing audio track.
        # Corresponds to the JSON property `processingWarnings`
        # @return [Array<String>]
        attr_accessor :processing_warnings
      
        # A list of keyword tags that could be added to the video's metadata to increase
        # the likelihood that users will locate your video when searching or browsing on
        # YouTube.
        # Corresponds to the JSON property `tagSuggestions`
        # @return [Array<Google::Apis::YoutubeV3::VideoSuggestionsTagSuggestion>]
        attr_accessor :tag_suggestions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @editor_suggestions = args[:editor_suggestions] if args.key?(:editor_suggestions)
          @processing_errors = args[:processing_errors] if args.key?(:processing_errors)
          @processing_hints = args[:processing_hints] if args.key?(:processing_hints)
          @processing_warnings = args[:processing_warnings] if args.key?(:processing_warnings)
          @tag_suggestions = args[:tag_suggestions] if args.key?(:tag_suggestions)
        end
      end
      
      # A single tag suggestion with it's relevance information.
      class VideoSuggestionsTagSuggestion
        include Google::Apis::Core::Hashable
      
        # A set of video categories for which the tag is relevant. You can use this
        # information to display appropriate tag suggestions based on the video category
        # that the video uploader associates with the video. By default, tag suggestions
        # are relevant for all categories if there are no restricts defined for the
        # keyword.
        # Corresponds to the JSON property `categoryRestricts`
        # @return [Array<String>]
        attr_accessor :category_restricts
      
        # The keyword tag suggested for the video.
        # Corresponds to the JSON property `tag`
        # @return [String]
        attr_accessor :tag
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @category_restricts = args[:category_restricts] if args.key?(:category_restricts)
          @tag = args[:tag] if args.key?(:tag)
        end
      end
      
      # Freebase topic information related to the video.
      class VideoTopicDetails
        include Google::Apis::Core::Hashable
      
        # Similar to topic_id, except that these topics are merely relevant to the video.
        # These are topics that may be mentioned in, or appear in the video. You can
        # retrieve information about each topic using Freebase Topic API.
        # Corresponds to the JSON property `relevantTopicIds`
        # @return [Array<String>]
        attr_accessor :relevant_topic_ids
      
        # A list of Wikipedia URLs that provide a high-level description of the video's
        # content.
        # Corresponds to the JSON property `topicCategories`
        # @return [Array<String>]
        attr_accessor :topic_categories
      
        # A list of Freebase topic IDs that are centrally associated with the video.
        # These are topics that are centrally featured in the video, and it can be said
        # that the video is mainly about each of these. You can retrieve information
        # about each topic using the Freebase Topic API.
        # Corresponds to the JSON property `topicIds`
        # @return [Array<String>]
        attr_accessor :topic_ids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @relevant_topic_ids = args[:relevant_topic_ids] if args.key?(:relevant_topic_ids)
          @topic_categories = args[:topic_categories] if args.key?(:topic_categories)
          @topic_ids = args[:topic_ids] if args.key?(:topic_ids)
        end
      end
      
      # Branding properties for the watch. All deprecated.
      class WatchSettings
        include Google::Apis::Core::Hashable
      
        # The text color for the video watch page's branded area.
        # Corresponds to the JSON property `backgroundColor`
        # @return [String]
        attr_accessor :background_color
      
        # An ID that uniquely identifies a playlist that displays next to the video
        # player.
        # Corresponds to the JSON property `featuredPlaylistId`
        # @return [String]
        attr_accessor :featured_playlist_id
      
        # The background color for the video watch page's branded area.
        # Corresponds to the JSON property `textColor`
        # @return [String]
        attr_accessor :text_color
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @background_color = args[:background_color] if args.key?(:background_color)
          @featured_playlist_id = args[:featured_playlist_id] if args.key?(:featured_playlist_id)
          @text_color = args[:text_color] if args.key?(:text_color)
        end
      end
    end
  end
end
