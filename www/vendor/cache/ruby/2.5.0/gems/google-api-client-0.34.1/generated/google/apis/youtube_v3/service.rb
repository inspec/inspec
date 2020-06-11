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
    module YoutubeV3
      # YouTube Data API
      #
      # Supports core YouTube features, such as uploading videos, creating and
      #  managing playlists, searching for content, and much more.
      #
      # @example
      #    require 'google/apis/youtube_v3'
      #
      #    Youtube = Google::Apis::YoutubeV3 # Alias the module
      #    service = Youtube::YouTubeService.new
      #
      # @see https://developers.google.com/youtube/v3
      class YouTubeService < Google::Apis::Core::BaseService
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
          super('https://www.googleapis.com/', 'youtube/v3/')
          @batch_path = 'batch/youtube/v3'
        end
        
        # Posts a bulletin for a specific channel. (The user submitting the request must
        # be authorized to act on the channel's behalf.)
        # Note: Even though an activity resource can contain information about actions
        # like a user rating a video or marking a video as a favorite, you need to use
        # other API methods to generate those activity resources. For example, you would
        # use the API's videos.rate() method to rate a video and the playlistItems.
        # insert() method to mark a video as a favorite.
        # @param [String] part
        #   The part parameter serves two purposes in this operation. It identifies the
        #   properties that the write operation will set as well as the properties that
        #   the API response will include.
        # @param [Google::Apis::YoutubeV3::Activity] activity_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::Activity] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::Activity]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_activity(part, activity_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'activities', options)
          command.request_representation = Google::Apis::YoutubeV3::Activity::Representation
          command.request_object = activity_object
          command.response_representation = Google::Apis::YoutubeV3::Activity::Representation
          command.response_class = Google::Apis::YoutubeV3::Activity
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of channel activity events that match the request criteria. For
        # example, you can retrieve events associated with a particular channel, events
        # associated with the user's subscriptions and Google+ friends, or the YouTube
        # home page feed, which is customized for each user.
        # @param [String] part
        #   The part parameter specifies a comma-separated list of one or more activity
        #   resource properties that the API response will include.
        #   If the parameter identifies a property that contains child properties, the
        #   child properties will be included in the response. For example, in an activity
        #   resource, the snippet property contains other properties that identify the
        #   type of activity, a display title for the activity, and so forth. If you set
        #   part=snippet, the API response will also contain all of those nested
        #   properties.
        # @param [String] channel_id
        #   The channelId parameter specifies a unique YouTube channel ID. The API will
        #   then return a list of that channel's activities.
        # @param [Boolean] home
        #   Set this parameter's value to true to retrieve the activity feed that displays
        #   on the YouTube home page for the currently authenticated user.
        # @param [Fixnum] max_results
        #   The maxResults parameter specifies the maximum number of items that should be
        #   returned in the result set.
        # @param [Boolean] mine
        #   Set this parameter's value to true to retrieve a feed of the authenticated
        #   user's activities.
        # @param [String] page_token
        #   The pageToken parameter identifies a specific page in the result set that
        #   should be returned. In an API response, the nextPageToken and prevPageToken
        #   properties identify other pages that could be retrieved.
        # @param [DateTime] published_after
        #   The publishedAfter parameter specifies the earliest date and time that an
        #   activity could have occurred for that activity to be included in the API
        #   response. If the parameter value specifies a day, but not a time, then any
        #   activities that occurred that day will be included in the result set. The
        #   value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
        # @param [DateTime] published_before
        #   The publishedBefore parameter specifies the date and time before which an
        #   activity must have occurred for that activity to be included in the API
        #   response. If the parameter value specifies a day, but not a time, then any
        #   activities that occurred that day will be excluded from the result set. The
        #   value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
        # @param [String] region_code
        #   The regionCode parameter instructs the API to return results for the specified
        #   country. The parameter value is an ISO 3166-1 alpha-2 country code. YouTube
        #   uses this value when the authorized user's previous activity on YouTube does
        #   not provide enough information to generate the activity feed.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::ListActivitiesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::ListActivitiesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_activities(part, channel_id: nil, home: nil, max_results: nil, mine: nil, page_token: nil, published_after: nil, published_before: nil, region_code: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'activities', options)
          command.response_representation = Google::Apis::YoutubeV3::ListActivitiesResponse::Representation
          command.response_class = Google::Apis::YoutubeV3::ListActivitiesResponse
          command.query['channelId'] = channel_id unless channel_id.nil?
          command.query['home'] = home unless home.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['mine'] = mine unless mine.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['part'] = part unless part.nil?
          command.query['publishedAfter'] = published_after unless published_after.nil?
          command.query['publishedBefore'] = published_before unless published_before.nil?
          command.query['regionCode'] = region_code unless region_code.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a specified caption track.
        # @param [String] id
        #   The id parameter identifies the caption track that is being deleted. The value
        #   is a caption track ID as identified by the id property in a caption resource.
        # @param [String] on_behalf_of
        #   ID of the Google+ Page for the channel that the request is be on behalf of
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The actual CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
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
        def delete_caption(id, on_behalf_of: nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'captions', options)
          command.query['id'] = id unless id.nil?
          command.query['onBehalfOf'] = on_behalf_of unless on_behalf_of.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Downloads a caption track. The caption track is returned in its original
        # format unless the request specifies a value for the tfmt parameter and in its
        # original language unless the request specifies a value for the tlang parameter.
        # @param [String] id
        #   The id parameter identifies the caption track that is being retrieved. The
        #   value is a caption track ID as identified by the id property in a caption
        #   resource.
        # @param [String] on_behalf_of
        #   ID of the Google+ Page for the channel that the request is be on behalf of
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The actual CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] tfmt
        #   The tfmt parameter specifies that the caption track should be returned in a
        #   specific format. If the parameter is not included in the request, the track is
        #   returned in its original format.
        # @param [String] tlang
        #   The tlang parameter specifies that the API response should return a
        #   translation of the specified caption track. The parameter value is an ISO 639-
        #   1 two-letter language code that identifies the desired caption language. The
        #   translation is generated by using machine translation, such as Google
        #   Translate.
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def download_caption(id, on_behalf_of: nil, on_behalf_of_content_owner: nil, tfmt: nil, tlang: nil, fields: nil, quota_user: nil, user_ip: nil, download_dest: nil, options: nil, &block)
          if download_dest.nil?
            command = make_simple_command(:get, 'captions/{id}', options)
          else
            command = make_download_command(:get, 'captions/{id}', options)
            command.download_dest = download_dest
          end
          command.params['id'] = id unless id.nil?
          command.query['onBehalfOf'] = on_behalf_of unless on_behalf_of.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['tfmt'] = tfmt unless tfmt.nil?
          command.query['tlang'] = tlang unless tlang.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Uploads a caption track.
        # @param [String] part
        #   The part parameter specifies the caption resource parts that the API response
        #   will include. Set the parameter value to snippet.
        # @param [Google::Apis::YoutubeV3::Caption] caption_object
        # @param [String] on_behalf_of
        #   ID of the Google+ Page for the channel that the request is be on behalf of
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The actual CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [Boolean] sync
        #   The sync parameter indicates whether YouTube should automatically synchronize
        #   the caption file with the audio track of the video. If you set the value to
        #   true, YouTube will disregard any time codes that are in the uploaded caption
        #   file and generate new time codes for the captions.
        #   You should set the sync parameter to true if you are uploading a transcript,
        #   which has no time codes, or if you suspect the time codes in your file are
        #   incorrect and want YouTube to try to fix them.
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
        # @yieldparam result [Google::Apis::YoutubeV3::Caption] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::Caption]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_caption(part, caption_object = nil, on_behalf_of: nil, on_behalf_of_content_owner: nil, sync: nil, fields: nil, quota_user: nil, user_ip: nil, upload_source: nil, content_type: nil, options: nil, &block)
          if upload_source.nil?
            command = make_simple_command(:post, 'captions', options)
          else
            command = make_upload_command(:post, 'captions', options)
            command.upload_source = upload_source
            command.upload_content_type = content_type
          end
          command.request_representation = Google::Apis::YoutubeV3::Caption::Representation
          command.request_object = caption_object
          command.response_representation = Google::Apis::YoutubeV3::Caption::Representation
          command.response_class = Google::Apis::YoutubeV3::Caption
          command.query['onBehalfOf'] = on_behalf_of unless on_behalf_of.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['part'] = part unless part.nil?
          command.query['sync'] = sync unless sync.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of caption tracks that are associated with a specified video.
        # Note that the API response does not contain the actual captions and that the
        # captions.download method provides the ability to retrieve a caption track.
        # @param [String] part
        #   The part parameter specifies a comma-separated list of one or more caption
        #   resource parts that the API response will include. The part names that you can
        #   include in the parameter value are id and snippet.
        # @param [String] video_id
        #   The videoId parameter specifies the YouTube video ID of the video for which
        #   the API should return caption tracks.
        # @param [String] id
        #   The id parameter specifies a comma-separated list of IDs that identify the
        #   caption resources that should be retrieved. Each ID must identify a caption
        #   track associated with the specified video.
        # @param [String] on_behalf_of
        #   ID of the Google+ Page for the channel that the request is on behalf of.
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The actual CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::ListCaptionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::ListCaptionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_captions(part, video_id, id: nil, on_behalf_of: nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'captions', options)
          command.response_representation = Google::Apis::YoutubeV3::ListCaptionsResponse::Representation
          command.response_class = Google::Apis::YoutubeV3::ListCaptionsResponse
          command.query['id'] = id unless id.nil?
          command.query['onBehalfOf'] = on_behalf_of unless on_behalf_of.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['part'] = part unless part.nil?
          command.query['videoId'] = video_id unless video_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a caption track. When updating a caption track, you can change the
        # track's draft status, upload a new caption file for the track, or both.
        # @param [String] part
        #   The part parameter serves two purposes in this operation. It identifies the
        #   properties that the write operation will set as well as the properties that
        #   the API response will include. Set the property value to snippet if you are
        #   updating the track's draft status. Otherwise, set the property value to id.
        # @param [Google::Apis::YoutubeV3::Caption] caption_object
        # @param [String] on_behalf_of
        #   ID of the Google+ Page for the channel that the request is be on behalf of
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The actual CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [Boolean] sync
        #   Note: The API server only processes the parameter value if the request
        #   contains an updated caption file.
        #   The sync parameter indicates whether YouTube should automatically synchronize
        #   the caption file with the audio track of the video. If you set the value to
        #   true, YouTube will automatically synchronize the caption track with the audio
        #   track.
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
        # @yieldparam result [Google::Apis::YoutubeV3::Caption] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::Caption]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_caption(part, caption_object = nil, on_behalf_of: nil, on_behalf_of_content_owner: nil, sync: nil, fields: nil, quota_user: nil, user_ip: nil, upload_source: nil, content_type: nil, options: nil, &block)
          if upload_source.nil?
            command = make_simple_command(:put, 'captions', options)
          else
            command = make_upload_command(:put, 'captions', options)
            command.upload_source = upload_source
            command.upload_content_type = content_type
          end
          command.request_representation = Google::Apis::YoutubeV3::Caption::Representation
          command.request_object = caption_object
          command.response_representation = Google::Apis::YoutubeV3::Caption::Representation
          command.response_class = Google::Apis::YoutubeV3::Caption
          command.query['onBehalfOf'] = on_behalf_of unless on_behalf_of.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['part'] = part unless part.nil?
          command.query['sync'] = sync unless sync.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Uploads a channel banner image to YouTube. This method represents the first
        # two steps in a three-step process to update the banner image for a channel:
        # - Call the channelBanners.insert method to upload the binary image data to
        # YouTube. The image must have a 16:9 aspect ratio and be at least 2120x1192
        # pixels.
        # - Extract the url property's value from the response that the API returns for
        # step 1.
        # - Call the channels.update method to update the channel's branding settings.
        # Set the brandingSettings.image.bannerExternalUrl property's value to the URL
        # obtained in step 2.
        # @param [Google::Apis::YoutubeV3::ChannelBannerResource] channel_banner_resource_object
        # @param [String] channel_id
        #   The channelId parameter identifies the YouTube channel to which the banner is
        #   uploaded. The channelId parameter was introduced as a required parameter in
        #   May 2017. As this was a backward-incompatible change, channelBanners.insert
        #   requests that do not specify this parameter will not return an error until six
        #   months have passed from the time that the parameter was introduced. Please see
        #   the API Terms of Service for the official policy regarding backward
        #   incompatible changes and the API revision history for the exact date that the
        #   parameter was introduced.
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
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
        # @yieldparam result [Google::Apis::YoutubeV3::ChannelBannerResource] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::ChannelBannerResource]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_channel_banner(channel_banner_resource_object = nil, channel_id: nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, upload_source: nil, content_type: nil, options: nil, &block)
          if upload_source.nil?
            command = make_simple_command(:post, 'channelBanners/insert', options)
          else
            command = make_upload_command(:post, 'channelBanners/insert', options)
            command.upload_source = upload_source
            command.upload_content_type = content_type
          end
          command.request_representation = Google::Apis::YoutubeV3::ChannelBannerResource::Representation
          command.request_object = channel_banner_resource_object
          command.response_representation = Google::Apis::YoutubeV3::ChannelBannerResource::Representation
          command.response_class = Google::Apis::YoutubeV3::ChannelBannerResource
          command.query['channelId'] = channel_id unless channel_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a channelSection.
        # @param [String] id
        #   The id parameter specifies the YouTube channelSection ID for the resource that
        #   is being deleted. In a channelSection resource, the id property specifies the
        #   YouTube channelSection ID.
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
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
        def delete_channel_section(id, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'channelSections', options)
          command.query['id'] = id unless id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Adds a channelSection for the authenticated user's channel.
        # @param [String] part
        #   The part parameter serves two purposes in this operation. It identifies the
        #   properties that the write operation will set as well as the properties that
        #   the API response will include.
        #   The part names that you can include in the parameter value are snippet and
        #   contentDetails.
        # @param [Google::Apis::YoutubeV3::ChannelSection] channel_section_object
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] on_behalf_of_content_owner_channel
        #   This parameter can only be used in a properly authorized request. Note: This
        #   parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID
        #   of the channel to which a video is being added. This parameter is required
        #   when a request specifies a value for the onBehalfOfContentOwner parameter, and
        #   it can only be used in conjunction with that parameter. In addition, the
        #   request must be authorized using a CMS account that is linked to the content
        #   owner that the onBehalfOfContentOwner parameter specifies. Finally, the
        #   channel that the onBehalfOfContentOwnerChannel parameter value specifies must
        #   be linked to the content owner that the onBehalfOfContentOwner parameter
        #   specifies.
        #   This parameter is intended for YouTube content partners that own and manage
        #   many different YouTube channels. It allows content owners to authenticate once
        #   and perform actions on behalf of the channel specified in the parameter value,
        #   without having to provide authentication credentials for each separate channel.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::ChannelSection] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::ChannelSection]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_channel_section(part, channel_section_object = nil, on_behalf_of_content_owner: nil, on_behalf_of_content_owner_channel: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'channelSections', options)
          command.request_representation = Google::Apis::YoutubeV3::ChannelSection::Representation
          command.request_object = channel_section_object
          command.response_representation = Google::Apis::YoutubeV3::ChannelSection::Representation
          command.response_class = Google::Apis::YoutubeV3::ChannelSection
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['onBehalfOfContentOwnerChannel'] = on_behalf_of_content_owner_channel unless on_behalf_of_content_owner_channel.nil?
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns channelSection resources that match the API request criteria.
        # @param [String] part
        #   The part parameter specifies a comma-separated list of one or more
        #   channelSection resource properties that the API response will include. The
        #   part names that you can include in the parameter value are id, snippet, and
        #   contentDetails.
        #   If the parameter identifies a property that contains child properties, the
        #   child properties will be included in the response. For example, in a
        #   channelSection resource, the snippet property contains other properties, such
        #   as a display title for the channelSection. If you set part=snippet, the API
        #   response will also contain all of those nested properties.
        # @param [String] channel_id
        #   The channelId parameter specifies a YouTube channel ID. The API will only
        #   return that channel's channelSections.
        # @param [String] hl
        #   The hl parameter indicates that the snippet.localized property values in the
        #   returned channelSection resources should be in the specified language if
        #   localized values for that language are available. For example, if the API
        #   request specifies hl=de, the snippet.localized properties in the API response
        #   will contain German titles if German titles are available. Channel owners can
        #   provide localized channel section titles using either the channelSections.
        #   insert or channelSections.update method.
        # @param [String] id
        #   The id parameter specifies a comma-separated list of the YouTube
        #   channelSection ID(s) for the resource(s) that are being retrieved. In a
        #   channelSection resource, the id property specifies the YouTube channelSection
        #   ID.
        # @param [Boolean] mine
        #   Set this parameter's value to true to retrieve a feed of the authenticated
        #   user's channelSections.
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::ListChannelSectionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::ListChannelSectionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_channel_sections(part, channel_id: nil, hl: nil, id: nil, mine: nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'channelSections', options)
          command.response_representation = Google::Apis::YoutubeV3::ListChannelSectionsResponse::Representation
          command.response_class = Google::Apis::YoutubeV3::ListChannelSectionsResponse
          command.query['channelId'] = channel_id unless channel_id.nil?
          command.query['hl'] = hl unless hl.nil?
          command.query['id'] = id unless id.nil?
          command.query['mine'] = mine unless mine.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update a channelSection.
        # @param [String] part
        #   The part parameter serves two purposes in this operation. It identifies the
        #   properties that the write operation will set as well as the properties that
        #   the API response will include.
        #   The part names that you can include in the parameter value are snippet and
        #   contentDetails.
        # @param [Google::Apis::YoutubeV3::ChannelSection] channel_section_object
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::ChannelSection] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::ChannelSection]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_channel_section(part, channel_section_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'channelSections', options)
          command.request_representation = Google::Apis::YoutubeV3::ChannelSection::Representation
          command.request_object = channel_section_object
          command.response_representation = Google::Apis::YoutubeV3::ChannelSection::Representation
          command.response_class = Google::Apis::YoutubeV3::ChannelSection
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a collection of zero or more channel resources that match the request
        # criteria.
        # @param [String] part
        #   The part parameter specifies a comma-separated list of one or more channel
        #   resource properties that the API response will include.
        #   If the parameter identifies a property that contains child properties, the
        #   child properties will be included in the response. For example, in a channel
        #   resource, the contentDetails property contains other properties, such as the
        #   uploads properties. As such, if you set part=contentDetails, the API response
        #   will also contain all of those nested properties.
        # @param [String] category_id
        #   The categoryId parameter specifies a YouTube guide category, thereby
        #   requesting YouTube channels associated with that category.
        # @param [String] for_username
        #   The forUsername parameter specifies a YouTube username, thereby requesting the
        #   channel associated with that username.
        # @param [String] hl
        #   The hl parameter should be used for filter out the properties that are not in
        #   the given language. Used for the brandingSettings part.
        # @param [String] id
        #   The id parameter specifies a comma-separated list of the YouTube channel ID(s)
        #   for the resource(s) that are being retrieved. In a channel resource, the id
        #   property specifies the channel's YouTube channel ID.
        # @param [Boolean] managed_by_me
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   Set this parameter's value to true to instruct the API to only return channels
        #   managed by the content owner that the onBehalfOfContentOwner parameter
        #   specifies. The user must be authenticated as a CMS account linked to the
        #   specified content owner and onBehalfOfContentOwner must be provided.
        # @param [Fixnum] max_results
        #   The maxResults parameter specifies the maximum number of items that should be
        #   returned in the result set.
        # @param [Boolean] mine
        #   Set this parameter's value to true to instruct the API to only return channels
        #   owned by the authenticated user.
        # @param [Boolean] my_subscribers
        #   Use the subscriptions.list method and its mySubscribers parameter to retrieve
        #   a list of subscribers to the authenticated user's channel.
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] page_token
        #   The pageToken parameter identifies a specific page in the result set that
        #   should be returned. In an API response, the nextPageToken and prevPageToken
        #   properties identify other pages that could be retrieved.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::ListChannelsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::ListChannelsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_channels(part, category_id: nil, for_username: nil, hl: nil, id: nil, managed_by_me: nil, max_results: nil, mine: nil, my_subscribers: nil, on_behalf_of_content_owner: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'channels', options)
          command.response_representation = Google::Apis::YoutubeV3::ListChannelsResponse::Representation
          command.response_class = Google::Apis::YoutubeV3::ListChannelsResponse
          command.query['categoryId'] = category_id unless category_id.nil?
          command.query['forUsername'] = for_username unless for_username.nil?
          command.query['hl'] = hl unless hl.nil?
          command.query['id'] = id unless id.nil?
          command.query['managedByMe'] = managed_by_me unless managed_by_me.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['mine'] = mine unless mine.nil?
          command.query['mySubscribers'] = my_subscribers unless my_subscribers.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a channel's metadata. Note that this method currently only supports
        # updates to the channel resource's brandingSettings and invideoPromotion
        # objects and their child properties.
        # @param [String] part
        #   The part parameter serves two purposes in this operation. It identifies the
        #   properties that the write operation will set as well as the properties that
        #   the API response will include.
        #   The API currently only allows the parameter value to be set to either
        #   brandingSettings or invideoPromotion. (You cannot update both of those parts
        #   with a single request.)
        #   Note that this method overrides the existing values for all of the mutable
        #   properties that are contained in any parts that the parameter value specifies.
        # @param [Google::Apis::YoutubeV3::Channel] channel_object
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter indicates that the authenticated user is
        #   acting on behalf of the content owner specified in the parameter value. This
        #   parameter is intended for YouTube content partners that own and manage many
        #   different YouTube channels. It allows content owners to authenticate once and
        #   get access to all their video and channel data, without having to provide
        #   authentication credentials for each individual channel. The actual CMS account
        #   that the user authenticates with needs to be linked to the specified YouTube
        #   content owner.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::Channel] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::Channel]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_channel(part, channel_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'channels', options)
          command.request_representation = Google::Apis::YoutubeV3::Channel::Representation
          command.request_object = channel_object
          command.response_representation = Google::Apis::YoutubeV3::Channel::Representation
          command.response_class = Google::Apis::YoutubeV3::Channel
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new top-level comment. To add a reply to an existing comment, use
        # the comments.insert method instead.
        # @param [String] part
        #   The part parameter identifies the properties that the API response will
        #   include. Set the parameter value to snippet. The snippet part has a quota cost
        #   of 2 units.
        # @param [Google::Apis::YoutubeV3::CommentThread] comment_thread_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::CommentThread] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::CommentThread]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_comment_thread(part, comment_thread_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'commentThreads', options)
          command.request_representation = Google::Apis::YoutubeV3::CommentThread::Representation
          command.request_object = comment_thread_object
          command.response_representation = Google::Apis::YoutubeV3::CommentThread::Representation
          command.response_class = Google::Apis::YoutubeV3::CommentThread
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of comment threads that match the API request parameters.
        # @param [String] part
        #   The part parameter specifies a comma-separated list of one or more
        #   commentThread resource properties that the API response will include.
        # @param [String] all_threads_related_to_channel_id
        #   The allThreadsRelatedToChannelId parameter instructs the API to return all
        #   comment threads associated with the specified channel. The response can
        #   include comments about the channel or about the channel's videos.
        # @param [String] channel_id
        #   The channelId parameter instructs the API to return comment threads containing
        #   comments about the specified channel. (The response will not include comments
        #   left on videos that the channel uploaded.)
        # @param [String] id
        #   The id parameter specifies a comma-separated list of comment thread IDs for
        #   the resources that should be retrieved.
        # @param [Fixnum] max_results
        #   The maxResults parameter specifies the maximum number of items that should be
        #   returned in the result set.
        #   Note: This parameter is not supported for use in conjunction with the id
        #   parameter.
        # @param [String] moderation_status
        #   Set this parameter to limit the returned comment threads to a particular
        #   moderation state.
        #   Note: This parameter is not supported for use in conjunction with the id
        #   parameter.
        # @param [String] order
        #   The order parameter specifies the order in which the API response should list
        #   comment threads. Valid values are:
        #   - time - Comment threads are ordered by time. This is the default behavior.
        #   - relevance - Comment threads are ordered by relevance.Note: This parameter is
        #   not supported for use in conjunction with the id parameter.
        # @param [String] page_token
        #   The pageToken parameter identifies a specific page in the result set that
        #   should be returned. In an API response, the nextPageToken property identifies
        #   the next page of the result that can be retrieved.
        #   Note: This parameter is not supported for use in conjunction with the id
        #   parameter.
        # @param [String] search_terms
        #   The searchTerms parameter instructs the API to limit the API response to only
        #   contain comments that contain the specified search terms.
        #   Note: This parameter is not supported for use in conjunction with the id
        #   parameter.
        # @param [String] text_format
        #   Set this parameter's value to html or plainText to instruct the API to return
        #   the comments left by users in html formatted or in plain text.
        # @param [String] video_id
        #   The videoId parameter instructs the API to return comment threads associated
        #   with the specified video ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::ListCommentThreadsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::ListCommentThreadsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_comment_threads(part, all_threads_related_to_channel_id: nil, channel_id: nil, id: nil, max_results: nil, moderation_status: nil, order: nil, page_token: nil, search_terms: nil, text_format: nil, video_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'commentThreads', options)
          command.response_representation = Google::Apis::YoutubeV3::ListCommentThreadsResponse::Representation
          command.response_class = Google::Apis::YoutubeV3::ListCommentThreadsResponse
          command.query['allThreadsRelatedToChannelId'] = all_threads_related_to_channel_id unless all_threads_related_to_channel_id.nil?
          command.query['channelId'] = channel_id unless channel_id.nil?
          command.query['id'] = id unless id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['moderationStatus'] = moderation_status unless moderation_status.nil?
          command.query['order'] = order unless order.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['part'] = part unless part.nil?
          command.query['searchTerms'] = search_terms unless search_terms.nil?
          command.query['textFormat'] = text_format unless text_format.nil?
          command.query['videoId'] = video_id unless video_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Modifies the top-level comment in a comment thread.
        # @param [String] part
        #   The part parameter specifies a comma-separated list of commentThread resource
        #   properties that the API response will include. You must at least include the
        #   snippet part in the parameter value since that part contains all of the
        #   properties that the API request can update.
        # @param [Google::Apis::YoutubeV3::CommentThread] comment_thread_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::CommentThread] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::CommentThread]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_comment_thread(part, comment_thread_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'commentThreads', options)
          command.request_representation = Google::Apis::YoutubeV3::CommentThread::Representation
          command.request_object = comment_thread_object
          command.response_representation = Google::Apis::YoutubeV3::CommentThread::Representation
          command.response_class = Google::Apis::YoutubeV3::CommentThread
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a comment.
        # @param [String] id
        #   The id parameter specifies the comment ID for the resource that is being
        #   deleted.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
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
        def delete_comment(id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'comments', options)
          command.query['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a reply to an existing comment. Note: To create a top-level comment,
        # use the commentThreads.insert method.
        # @param [String] part
        #   The part parameter identifies the properties that the API response will
        #   include. Set the parameter value to snippet. The snippet part has a quota cost
        #   of 2 units.
        # @param [Google::Apis::YoutubeV3::Comment] comment_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::Comment] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::Comment]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_comment(part, comment_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'comments', options)
          command.request_representation = Google::Apis::YoutubeV3::Comment::Representation
          command.request_object = comment_object
          command.response_representation = Google::Apis::YoutubeV3::Comment::Representation
          command.response_class = Google::Apis::YoutubeV3::Comment
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of comments that match the API request parameters.
        # @param [String] part
        #   The part parameter specifies a comma-separated list of one or more comment
        #   resource properties that the API response will include.
        # @param [String] id
        #   The id parameter specifies a comma-separated list of comment IDs for the
        #   resources that are being retrieved. In a comment resource, the id property
        #   specifies the comment's ID.
        # @param [Fixnum] max_results
        #   The maxResults parameter specifies the maximum number of items that should be
        #   returned in the result set.
        #   Note: This parameter is not supported for use in conjunction with the id
        #   parameter.
        # @param [String] page_token
        #   The pageToken parameter identifies a specific page in the result set that
        #   should be returned. In an API response, the nextPageToken property identifies
        #   the next page of the result that can be retrieved.
        #   Note: This parameter is not supported for use in conjunction with the id
        #   parameter.
        # @param [String] parent_id
        #   The parentId parameter specifies the ID of the comment for which replies
        #   should be retrieved.
        #   Note: YouTube currently supports replies only for top-level comments. However,
        #   replies to replies may be supported in the future.
        # @param [String] text_format
        #   This parameter indicates whether the API should return comments formatted as
        #   HTML or as plain text.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::ListCommentsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::ListCommentsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_comments(part, id: nil, max_results: nil, page_token: nil, parent_id: nil, text_format: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'comments', options)
          command.response_representation = Google::Apis::YoutubeV3::ListCommentsResponse::Representation
          command.response_class = Google::Apis::YoutubeV3::ListCommentsResponse
          command.query['id'] = id unless id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['parentId'] = parent_id unless parent_id.nil?
          command.query['part'] = part unless part.nil?
          command.query['textFormat'] = text_format unless text_format.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Expresses the caller's opinion that one or more comments should be flagged as
        # spam.
        # @param [String] id
        #   The id parameter specifies a comma-separated list of IDs of comments that the
        #   caller believes should be classified as spam.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
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
        def mark_comment_as_spam(id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'comments/markAsSpam', options)
          command.query['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets the moderation status of one or more comments. The API request must be
        # authorized by the owner of the channel or video associated with the comments.
        # @param [String] id
        #   The id parameter specifies a comma-separated list of IDs that identify the
        #   comments for which you are updating the moderation status.
        # @param [String] moderation_status
        #   Identifies the new moderation status of the specified comments.
        # @param [Boolean] ban_author
        #   The banAuthor parameter lets you indicate that you want to automatically
        #   reject any additional comments written by the comment's author. Set the
        #   parameter value to true to ban the author.
        #   Note: This parameter is only valid if the moderationStatus parameter is also
        #   set to rejected.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
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
        def set_comment_moderation_status(id, moderation_status, ban_author: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'comments/setModerationStatus', options)
          command.query['banAuthor'] = ban_author unless ban_author.nil?
          command.query['id'] = id unless id.nil?
          command.query['moderationStatus'] = moderation_status unless moderation_status.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Modifies a comment.
        # @param [String] part
        #   The part parameter identifies the properties that the API response will
        #   include. You must at least include the snippet part in the parameter value
        #   since that part contains all of the properties that the API request can update.
        # @param [Google::Apis::YoutubeV3::Comment] comment_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::Comment] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::Comment]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_comment(part, comment_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'comments', options)
          command.request_representation = Google::Apis::YoutubeV3::Comment::Representation
          command.request_object = comment_object
          command.response_representation = Google::Apis::YoutubeV3::Comment::Representation
          command.response_class = Google::Apis::YoutubeV3::Comment
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of categories that can be associated with YouTube channels.
        # @param [String] part
        #   The part parameter specifies the guideCategory resource properties that the
        #   API response will include. Set the parameter value to snippet.
        # @param [String] hl
        #   The hl parameter specifies the language that will be used for text values in
        #   the API response.
        # @param [String] id
        #   The id parameter specifies a comma-separated list of the YouTube channel
        #   category ID(s) for the resource(s) that are being retrieved. In a
        #   guideCategory resource, the id property specifies the YouTube channel category
        #   ID.
        # @param [String] region_code
        #   The regionCode parameter instructs the API to return the list of guide
        #   categories available in the specified country. The parameter value is an ISO
        #   3166-1 alpha-2 country code.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::ListGuideCategoriesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::ListGuideCategoriesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_guide_categories(part, hl: nil, id: nil, region_code: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'guideCategories', options)
          command.response_representation = Google::Apis::YoutubeV3::ListGuideCategoriesResponse::Representation
          command.response_class = Google::Apis::YoutubeV3::ListGuideCategoriesResponse
          command.query['hl'] = hl unless hl.nil?
          command.query['id'] = id unless id.nil?
          command.query['part'] = part unless part.nil?
          command.query['regionCode'] = region_code unless region_code.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of application languages that the YouTube website supports.
        # @param [String] part
        #   The part parameter specifies the i18nLanguage resource properties that the API
        #   response will include. Set the parameter value to snippet.
        # @param [String] hl
        #   The hl parameter specifies the language that should be used for text values in
        #   the API response.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::ListI18nLanguagesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::ListI18nLanguagesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_i18n_languages(part, hl: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'i18nLanguages', options)
          command.response_representation = Google::Apis::YoutubeV3::ListI18nLanguagesResponse::Representation
          command.response_class = Google::Apis::YoutubeV3::ListI18nLanguagesResponse
          command.query['hl'] = hl unless hl.nil?
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of content regions that the YouTube website supports.
        # @param [String] part
        #   The part parameter specifies the i18nRegion resource properties that the API
        #   response will include. Set the parameter value to snippet.
        # @param [String] hl
        #   The hl parameter specifies the language that should be used for text values in
        #   the API response.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::ListI18nRegionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::ListI18nRegionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_i18n_regions(part, hl: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'i18nRegions', options)
          command.response_representation = Google::Apis::YoutubeV3::ListI18nRegionsResponse::Representation
          command.response_class = Google::Apis::YoutubeV3::ListI18nRegionsResponse
          command.query['hl'] = hl unless hl.nil?
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Binds a YouTube broadcast to a stream or removes an existing binding between a
        # broadcast and a stream. A broadcast can only be bound to one video stream,
        # though a video stream may be bound to more than one broadcast.
        # @param [String] id
        #   The id parameter specifies the unique ID of the broadcast that is being bound
        #   to a video stream.
        # @param [String] part
        #   The part parameter specifies a comma-separated list of one or more
        #   liveBroadcast resource properties that the API response will include. The part
        #   names that you can include in the parameter value are id, snippet,
        #   contentDetails, and status.
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] on_behalf_of_content_owner_channel
        #   This parameter can only be used in a properly authorized request. Note: This
        #   parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID
        #   of the channel to which a video is being added. This parameter is required
        #   when a request specifies a value for the onBehalfOfContentOwner parameter, and
        #   it can only be used in conjunction with that parameter. In addition, the
        #   request must be authorized using a CMS account that is linked to the content
        #   owner that the onBehalfOfContentOwner parameter specifies. Finally, the
        #   channel that the onBehalfOfContentOwnerChannel parameter value specifies must
        #   be linked to the content owner that the onBehalfOfContentOwner parameter
        #   specifies.
        #   This parameter is intended for YouTube content partners that own and manage
        #   many different YouTube channels. It allows content owners to authenticate once
        #   and perform actions on behalf of the channel specified in the parameter value,
        #   without having to provide authentication credentials for each separate channel.
        # @param [String] stream_id
        #   The streamId parameter specifies the unique ID of the video stream that is
        #   being bound to a broadcast. If this parameter is omitted, the API will remove
        #   any existing binding between the broadcast and a video stream.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::LiveBroadcast] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::LiveBroadcast]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def bind_live_broadcast(id, part, on_behalf_of_content_owner: nil, on_behalf_of_content_owner_channel: nil, stream_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'liveBroadcasts/bind', options)
          command.response_representation = Google::Apis::YoutubeV3::LiveBroadcast::Representation
          command.response_class = Google::Apis::YoutubeV3::LiveBroadcast
          command.query['id'] = id unless id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['onBehalfOfContentOwnerChannel'] = on_behalf_of_content_owner_channel unless on_behalf_of_content_owner_channel.nil?
          command.query['part'] = part unless part.nil?
          command.query['streamId'] = stream_id unless stream_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Controls the settings for a slate that can be displayed in the broadcast
        # stream.
        # @param [String] id
        #   The id parameter specifies the YouTube live broadcast ID that uniquely
        #   identifies the broadcast in which the slate is being updated.
        # @param [String] part
        #   The part parameter specifies a comma-separated list of one or more
        #   liveBroadcast resource properties that the API response will include. The part
        #   names that you can include in the parameter value are id, snippet,
        #   contentDetails, and status.
        # @param [Boolean] display_slate
        #   The displaySlate parameter specifies whether the slate is being enabled or
        #   disabled.
        # @param [Fixnum] offset_time_ms
        #   The offsetTimeMs parameter specifies a positive time offset when the specified
        #   slate change will occur. The value is measured in milliseconds from the
        #   beginning of the broadcast's monitor stream, which is the time that the
        #   testing phase for the broadcast began. Even though it is specified in
        #   milliseconds, the value is actually an approximation, and YouTube completes
        #   the requested action as closely as possible to that time.
        #   If you do not specify a value for this parameter, then YouTube performs the
        #   action as soon as possible. See the Getting started guide for more details.
        #   Important: You should only specify a value for this parameter if your
        #   broadcast stream is delayed.
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] on_behalf_of_content_owner_channel
        #   This parameter can only be used in a properly authorized request. Note: This
        #   parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID
        #   of the channel to which a video is being added. This parameter is required
        #   when a request specifies a value for the onBehalfOfContentOwner parameter, and
        #   it can only be used in conjunction with that parameter. In addition, the
        #   request must be authorized using a CMS account that is linked to the content
        #   owner that the onBehalfOfContentOwner parameter specifies. Finally, the
        #   channel that the onBehalfOfContentOwnerChannel parameter value specifies must
        #   be linked to the content owner that the onBehalfOfContentOwner parameter
        #   specifies.
        #   This parameter is intended for YouTube content partners that own and manage
        #   many different YouTube channels. It allows content owners to authenticate once
        #   and perform actions on behalf of the channel specified in the parameter value,
        #   without having to provide authentication credentials for each separate channel.
        # @param [DateTime] walltime
        #   The walltime parameter specifies the wall clock time at which the specified
        #   slate change will occur. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:
        #   ss.sssZ) format.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::LiveBroadcast] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::LiveBroadcast]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def control_live_broadcast(id, part, display_slate: nil, offset_time_ms: nil, on_behalf_of_content_owner: nil, on_behalf_of_content_owner_channel: nil, walltime: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'liveBroadcasts/control', options)
          command.response_representation = Google::Apis::YoutubeV3::LiveBroadcast::Representation
          command.response_class = Google::Apis::YoutubeV3::LiveBroadcast
          command.query['displaySlate'] = display_slate unless display_slate.nil?
          command.query['id'] = id unless id.nil?
          command.query['offsetTimeMs'] = offset_time_ms unless offset_time_ms.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['onBehalfOfContentOwnerChannel'] = on_behalf_of_content_owner_channel unless on_behalf_of_content_owner_channel.nil?
          command.query['part'] = part unless part.nil?
          command.query['walltime'] = walltime unless walltime.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a broadcast.
        # @param [String] id
        #   The id parameter specifies the YouTube live broadcast ID for the resource that
        #   is being deleted.
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] on_behalf_of_content_owner_channel
        #   This parameter can only be used in a properly authorized request. Note: This
        #   parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID
        #   of the channel to which a video is being added. This parameter is required
        #   when a request specifies a value for the onBehalfOfContentOwner parameter, and
        #   it can only be used in conjunction with that parameter. In addition, the
        #   request must be authorized using a CMS account that is linked to the content
        #   owner that the onBehalfOfContentOwner parameter specifies. Finally, the
        #   channel that the onBehalfOfContentOwnerChannel parameter value specifies must
        #   be linked to the content owner that the onBehalfOfContentOwner parameter
        #   specifies.
        #   This parameter is intended for YouTube content partners that own and manage
        #   many different YouTube channels. It allows content owners to authenticate once
        #   and perform actions on behalf of the channel specified in the parameter value,
        #   without having to provide authentication credentials for each separate channel.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
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
        def delete_live_broadcast(id, on_behalf_of_content_owner: nil, on_behalf_of_content_owner_channel: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'liveBroadcasts', options)
          command.query['id'] = id unless id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['onBehalfOfContentOwnerChannel'] = on_behalf_of_content_owner_channel unless on_behalf_of_content_owner_channel.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a broadcast.
        # @param [String] part
        #   The part parameter serves two purposes in this operation. It identifies the
        #   properties that the write operation will set as well as the properties that
        #   the API response will include.
        #   The part properties that you can include in the parameter value are id,
        #   snippet, contentDetails, and status.
        # @param [Google::Apis::YoutubeV3::LiveBroadcast] live_broadcast_object
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] on_behalf_of_content_owner_channel
        #   This parameter can only be used in a properly authorized request. Note: This
        #   parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID
        #   of the channel to which a video is being added. This parameter is required
        #   when a request specifies a value for the onBehalfOfContentOwner parameter, and
        #   it can only be used in conjunction with that parameter. In addition, the
        #   request must be authorized using a CMS account that is linked to the content
        #   owner that the onBehalfOfContentOwner parameter specifies. Finally, the
        #   channel that the onBehalfOfContentOwnerChannel parameter value specifies must
        #   be linked to the content owner that the onBehalfOfContentOwner parameter
        #   specifies.
        #   This parameter is intended for YouTube content partners that own and manage
        #   many different YouTube channels. It allows content owners to authenticate once
        #   and perform actions on behalf of the channel specified in the parameter value,
        #   without having to provide authentication credentials for each separate channel.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::LiveBroadcast] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::LiveBroadcast]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_live_broadcast(part, live_broadcast_object = nil, on_behalf_of_content_owner: nil, on_behalf_of_content_owner_channel: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'liveBroadcasts', options)
          command.request_representation = Google::Apis::YoutubeV3::LiveBroadcast::Representation
          command.request_object = live_broadcast_object
          command.response_representation = Google::Apis::YoutubeV3::LiveBroadcast::Representation
          command.response_class = Google::Apis::YoutubeV3::LiveBroadcast
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['onBehalfOfContentOwnerChannel'] = on_behalf_of_content_owner_channel unless on_behalf_of_content_owner_channel.nil?
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of YouTube broadcasts that match the API request parameters.
        # @param [String] part
        #   The part parameter specifies a comma-separated list of one or more
        #   liveBroadcast resource properties that the API response will include. The part
        #   names that you can include in the parameter value are id, snippet,
        #   contentDetails, and status.
        # @param [String] broadcast_status
        #   The broadcastStatus parameter filters the API response to only include
        #   broadcasts with the specified status.
        # @param [String] broadcast_type
        #   The broadcastType parameter filters the API response to only include
        #   broadcasts with the specified type. This is only compatible with the mine
        #   filter for now.
        # @param [String] id
        #   The id parameter specifies a comma-separated list of YouTube broadcast IDs
        #   that identify the broadcasts being retrieved. In a liveBroadcast resource, the
        #   id property specifies the broadcast's ID.
        # @param [Fixnum] max_results
        #   The maxResults parameter specifies the maximum number of items that should be
        #   returned in the result set.
        # @param [Boolean] mine
        #   The mine parameter can be used to instruct the API to only return broadcasts
        #   owned by the authenticated user. Set the parameter value to true to only
        #   retrieve your own broadcasts.
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] on_behalf_of_content_owner_channel
        #   This parameter can only be used in a properly authorized request. Note: This
        #   parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID
        #   of the channel to which a video is being added. This parameter is required
        #   when a request specifies a value for the onBehalfOfContentOwner parameter, and
        #   it can only be used in conjunction with that parameter. In addition, the
        #   request must be authorized using a CMS account that is linked to the content
        #   owner that the onBehalfOfContentOwner parameter specifies. Finally, the
        #   channel that the onBehalfOfContentOwnerChannel parameter value specifies must
        #   be linked to the content owner that the onBehalfOfContentOwner parameter
        #   specifies.
        #   This parameter is intended for YouTube content partners that own and manage
        #   many different YouTube channels. It allows content owners to authenticate once
        #   and perform actions on behalf of the channel specified in the parameter value,
        #   without having to provide authentication credentials for each separate channel.
        # @param [String] page_token
        #   The pageToken parameter identifies a specific page in the result set that
        #   should be returned. In an API response, the nextPageToken and prevPageToken
        #   properties identify other pages that could be retrieved.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::ListLiveBroadcastsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::ListLiveBroadcastsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_live_broadcasts(part, broadcast_status: nil, broadcast_type: nil, id: nil, max_results: nil, mine: nil, on_behalf_of_content_owner: nil, on_behalf_of_content_owner_channel: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'liveBroadcasts', options)
          command.response_representation = Google::Apis::YoutubeV3::ListLiveBroadcastsResponse::Representation
          command.response_class = Google::Apis::YoutubeV3::ListLiveBroadcastsResponse
          command.query['broadcastStatus'] = broadcast_status unless broadcast_status.nil?
          command.query['broadcastType'] = broadcast_type unless broadcast_type.nil?
          command.query['id'] = id unless id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['mine'] = mine unless mine.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['onBehalfOfContentOwnerChannel'] = on_behalf_of_content_owner_channel unless on_behalf_of_content_owner_channel.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Changes the status of a YouTube live broadcast and initiates any processes
        # associated with the new status. For example, when you transition a broadcast's
        # status to testing, YouTube starts to transmit video to that broadcast's
        # monitor stream. Before calling this method, you should confirm that the value
        # of the status.streamStatus property for the stream bound to your broadcast is
        # active.
        # @param [String] broadcast_status
        #   The broadcastStatus parameter identifies the state to which the broadcast is
        #   changing. Note that to transition a broadcast to either the testing or live
        #   state, the status.streamStatus must be active for the stream that the
        #   broadcast is bound to.
        # @param [String] id
        #   The id parameter specifies the unique ID of the broadcast that is
        #   transitioning to another status.
        # @param [String] part
        #   The part parameter specifies a comma-separated list of one or more
        #   liveBroadcast resource properties that the API response will include. The part
        #   names that you can include in the parameter value are id, snippet,
        #   contentDetails, and status.
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] on_behalf_of_content_owner_channel
        #   This parameter can only be used in a properly authorized request. Note: This
        #   parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID
        #   of the channel to which a video is being added. This parameter is required
        #   when a request specifies a value for the onBehalfOfContentOwner parameter, and
        #   it can only be used in conjunction with that parameter. In addition, the
        #   request must be authorized using a CMS account that is linked to the content
        #   owner that the onBehalfOfContentOwner parameter specifies. Finally, the
        #   channel that the onBehalfOfContentOwnerChannel parameter value specifies must
        #   be linked to the content owner that the onBehalfOfContentOwner parameter
        #   specifies.
        #   This parameter is intended for YouTube content partners that own and manage
        #   many different YouTube channels. It allows content owners to authenticate once
        #   and perform actions on behalf of the channel specified in the parameter value,
        #   without having to provide authentication credentials for each separate channel.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::LiveBroadcast] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::LiveBroadcast]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def transition_live_broadcast(broadcast_status, id, part, on_behalf_of_content_owner: nil, on_behalf_of_content_owner_channel: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'liveBroadcasts/transition', options)
          command.response_representation = Google::Apis::YoutubeV3::LiveBroadcast::Representation
          command.response_class = Google::Apis::YoutubeV3::LiveBroadcast
          command.query['broadcastStatus'] = broadcast_status unless broadcast_status.nil?
          command.query['id'] = id unless id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['onBehalfOfContentOwnerChannel'] = on_behalf_of_content_owner_channel unless on_behalf_of_content_owner_channel.nil?
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a broadcast. For example, you could modify the broadcast settings
        # defined in the liveBroadcast resource's contentDetails object.
        # @param [String] part
        #   The part parameter serves two purposes in this operation. It identifies the
        #   properties that the write operation will set as well as the properties that
        #   the API response will include.
        #   The part properties that you can include in the parameter value are id,
        #   snippet, contentDetails, and status.
        #   Note that this method will override the existing values for all of the mutable
        #   properties that are contained in any parts that the parameter value specifies.
        #   For example, a broadcast's privacy status is defined in the status part. As
        #   such, if your request is updating a private or unlisted broadcast, and the
        #   request's part parameter value includes the status part, the broadcast's
        #   privacy setting will be updated to whatever value the request body specifies.
        #   If the request body does not specify a value, the existing privacy setting
        #   will be removed and the broadcast will revert to the default privacy setting.
        # @param [Google::Apis::YoutubeV3::LiveBroadcast] live_broadcast_object
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] on_behalf_of_content_owner_channel
        #   This parameter can only be used in a properly authorized request. Note: This
        #   parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID
        #   of the channel to which a video is being added. This parameter is required
        #   when a request specifies a value for the onBehalfOfContentOwner parameter, and
        #   it can only be used in conjunction with that parameter. In addition, the
        #   request must be authorized using a CMS account that is linked to the content
        #   owner that the onBehalfOfContentOwner parameter specifies. Finally, the
        #   channel that the onBehalfOfContentOwnerChannel parameter value specifies must
        #   be linked to the content owner that the onBehalfOfContentOwner parameter
        #   specifies.
        #   This parameter is intended for YouTube content partners that own and manage
        #   many different YouTube channels. It allows content owners to authenticate once
        #   and perform actions on behalf of the channel specified in the parameter value,
        #   without having to provide authentication credentials for each separate channel.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::LiveBroadcast] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::LiveBroadcast]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_live_broadcast(part, live_broadcast_object = nil, on_behalf_of_content_owner: nil, on_behalf_of_content_owner_channel: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'liveBroadcasts', options)
          command.request_representation = Google::Apis::YoutubeV3::LiveBroadcast::Representation
          command.request_object = live_broadcast_object
          command.response_representation = Google::Apis::YoutubeV3::LiveBroadcast::Representation
          command.response_class = Google::Apis::YoutubeV3::LiveBroadcast
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['onBehalfOfContentOwnerChannel'] = on_behalf_of_content_owner_channel unless on_behalf_of_content_owner_channel.nil?
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Removes a chat ban.
        # @param [String] id
        #   The id parameter identifies the chat ban to remove. The value uniquely
        #   identifies both the ban and the chat.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
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
        def delete_live_chat_ban(id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'liveChat/bans', options)
          command.query['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Adds a new ban to the chat.
        # @param [String] part
        #   The part parameter serves two purposes in this operation. It identifies the
        #   properties that the write operation will set as well as the properties that
        #   the API response returns. Set the parameter value to snippet.
        # @param [Google::Apis::YoutubeV3::LiveChatBan] live_chat_ban_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::LiveChatBan] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::LiveChatBan]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_live_chat_ban(part, live_chat_ban_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'liveChat/bans', options)
          command.request_representation = Google::Apis::YoutubeV3::LiveChatBan::Representation
          command.request_object = live_chat_ban_object
          command.response_representation = Google::Apis::YoutubeV3::LiveChatBan::Representation
          command.response_class = Google::Apis::YoutubeV3::LiveChatBan
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a chat message.
        # @param [String] id
        #   The id parameter specifies the YouTube chat message ID of the resource that is
        #   being deleted.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
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
        def delete_live_chat_message(id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'liveChat/messages', options)
          command.query['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Adds a message to a live chat.
        # @param [String] part
        #   The part parameter serves two purposes. It identifies the properties that the
        #   write operation will set as well as the properties that the API response will
        #   include. Set the parameter value to snippet.
        # @param [Google::Apis::YoutubeV3::LiveChatMessage] live_chat_message_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::LiveChatMessage] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::LiveChatMessage]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_live_chat_message(part, live_chat_message_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'liveChat/messages', options)
          command.request_representation = Google::Apis::YoutubeV3::LiveChatMessage::Representation
          command.request_object = live_chat_message_object
          command.response_representation = Google::Apis::YoutubeV3::LiveChatMessage::Representation
          command.response_class = Google::Apis::YoutubeV3::LiveChatMessage
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists live chat messages for a specific chat.
        # @param [String] live_chat_id
        #   The liveChatId parameter specifies the ID of the chat whose messages will be
        #   returned.
        # @param [String] part
        #   The part parameter specifies the liveChatComment resource parts that the API
        #   response will include. Supported values are id and snippet.
        # @param [String] hl
        #   The hl parameter instructs the API to retrieve localized resource metadata for
        #   a specific application language that the YouTube website supports. The
        #   parameter value must be a language code included in the list returned by the
        #   i18nLanguages.list method.
        #   If localized resource details are available in that language, the resource's
        #   snippet.localized object will contain the localized values. However, if
        #   localized details are not available, the snippet.localized object will contain
        #   resource details in the resource's default language.
        # @param [Fixnum] max_results
        #   The maxResults parameter specifies the maximum number of messages that should
        #   be returned in the result set.
        # @param [String] page_token
        #   The pageToken parameter identifies a specific page in the result set that
        #   should be returned. In an API response, the nextPageToken property identify
        #   other pages that could be retrieved.
        # @param [Fixnum] profile_image_size
        #   The profileImageSize parameter specifies the size of the user profile pictures
        #   that should be returned in the result set. Default: 88.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::LiveChatMessageListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::LiveChatMessageListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_live_chat_messages(live_chat_id, part, hl: nil, max_results: nil, page_token: nil, profile_image_size: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'liveChat/messages', options)
          command.response_representation = Google::Apis::YoutubeV3::LiveChatMessageListResponse::Representation
          command.response_class = Google::Apis::YoutubeV3::LiveChatMessageListResponse
          command.query['hl'] = hl unless hl.nil?
          command.query['liveChatId'] = live_chat_id unless live_chat_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['part'] = part unless part.nil?
          command.query['profileImageSize'] = profile_image_size unless profile_image_size.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Removes a chat moderator.
        # @param [String] id
        #   The id parameter identifies the chat moderator to remove. The value uniquely
        #   identifies both the moderator and the chat.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
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
        def delete_live_chat_moderator(id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'liveChat/moderators', options)
          command.query['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Adds a new moderator for the chat.
        # @param [String] part
        #   The part parameter serves two purposes in this operation. It identifies the
        #   properties that the write operation will set as well as the properties that
        #   the API response returns. Set the parameter value to snippet.
        # @param [Google::Apis::YoutubeV3::LiveChatModerator] live_chat_moderator_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::LiveChatModerator] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::LiveChatModerator]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_live_chat_moderator(part, live_chat_moderator_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'liveChat/moderators', options)
          command.request_representation = Google::Apis::YoutubeV3::LiveChatModerator::Representation
          command.request_object = live_chat_moderator_object
          command.response_representation = Google::Apis::YoutubeV3::LiveChatModerator::Representation
          command.response_class = Google::Apis::YoutubeV3::LiveChatModerator
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists moderators for a live chat.
        # @param [String] live_chat_id
        #   The liveChatId parameter specifies the YouTube live chat for which the API
        #   should return moderators.
        # @param [String] part
        #   The part parameter specifies the liveChatModerator resource parts that the API
        #   response will include. Supported values are id and snippet.
        # @param [Fixnum] max_results
        #   The maxResults parameter specifies the maximum number of items that should be
        #   returned in the result set.
        # @param [String] page_token
        #   The pageToken parameter identifies a specific page in the result set that
        #   should be returned. In an API response, the nextPageToken and prevPageToken
        #   properties identify other pages that could be retrieved.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::LiveChatModeratorListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::LiveChatModeratorListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_live_chat_moderators(live_chat_id, part, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'liveChat/moderators', options)
          command.response_representation = Google::Apis::YoutubeV3::LiveChatModeratorListResponse::Representation
          command.response_class = Google::Apis::YoutubeV3::LiveChatModeratorListResponse
          command.query['liveChatId'] = live_chat_id unless live_chat_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a video stream.
        # @param [String] id
        #   The id parameter specifies the YouTube live stream ID for the resource that is
        #   being deleted.
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] on_behalf_of_content_owner_channel
        #   This parameter can only be used in a properly authorized request. Note: This
        #   parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID
        #   of the channel to which a video is being added. This parameter is required
        #   when a request specifies a value for the onBehalfOfContentOwner parameter, and
        #   it can only be used in conjunction with that parameter. In addition, the
        #   request must be authorized using a CMS account that is linked to the content
        #   owner that the onBehalfOfContentOwner parameter specifies. Finally, the
        #   channel that the onBehalfOfContentOwnerChannel parameter value specifies must
        #   be linked to the content owner that the onBehalfOfContentOwner parameter
        #   specifies.
        #   This parameter is intended for YouTube content partners that own and manage
        #   many different YouTube channels. It allows content owners to authenticate once
        #   and perform actions on behalf of the channel specified in the parameter value,
        #   without having to provide authentication credentials for each separate channel.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
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
        def delete_live_stream(id, on_behalf_of_content_owner: nil, on_behalf_of_content_owner_channel: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'liveStreams', options)
          command.query['id'] = id unless id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['onBehalfOfContentOwnerChannel'] = on_behalf_of_content_owner_channel unless on_behalf_of_content_owner_channel.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a video stream. The stream enables you to send your video to YouTube,
        # which can then broadcast the video to your audience.
        # @param [String] part
        #   The part parameter serves two purposes in this operation. It identifies the
        #   properties that the write operation will set as well as the properties that
        #   the API response will include.
        #   The part properties that you can include in the parameter value are id,
        #   snippet, cdn, and status.
        # @param [Google::Apis::YoutubeV3::LiveStream] live_stream_object
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] on_behalf_of_content_owner_channel
        #   This parameter can only be used in a properly authorized request. Note: This
        #   parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID
        #   of the channel to which a video is being added. This parameter is required
        #   when a request specifies a value for the onBehalfOfContentOwner parameter, and
        #   it can only be used in conjunction with that parameter. In addition, the
        #   request must be authorized using a CMS account that is linked to the content
        #   owner that the onBehalfOfContentOwner parameter specifies. Finally, the
        #   channel that the onBehalfOfContentOwnerChannel parameter value specifies must
        #   be linked to the content owner that the onBehalfOfContentOwner parameter
        #   specifies.
        #   This parameter is intended for YouTube content partners that own and manage
        #   many different YouTube channels. It allows content owners to authenticate once
        #   and perform actions on behalf of the channel specified in the parameter value,
        #   without having to provide authentication credentials for each separate channel.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::LiveStream] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::LiveStream]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_live_stream(part, live_stream_object = nil, on_behalf_of_content_owner: nil, on_behalf_of_content_owner_channel: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'liveStreams', options)
          command.request_representation = Google::Apis::YoutubeV3::LiveStream::Representation
          command.request_object = live_stream_object
          command.response_representation = Google::Apis::YoutubeV3::LiveStream::Representation
          command.response_class = Google::Apis::YoutubeV3::LiveStream
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['onBehalfOfContentOwnerChannel'] = on_behalf_of_content_owner_channel unless on_behalf_of_content_owner_channel.nil?
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of video streams that match the API request parameters.
        # @param [String] part
        #   The part parameter specifies a comma-separated list of one or more liveStream
        #   resource properties that the API response will include. The part names that
        #   you can include in the parameter value are id, snippet, cdn, and status.
        # @param [String] id
        #   The id parameter specifies a comma-separated list of YouTube stream IDs that
        #   identify the streams being retrieved. In a liveStream resource, the id
        #   property specifies the stream's ID.
        # @param [Fixnum] max_results
        #   The maxResults parameter specifies the maximum number of items that should be
        #   returned in the result set.
        # @param [Boolean] mine
        #   The mine parameter can be used to instruct the API to only return streams
        #   owned by the authenticated user. Set the parameter value to true to only
        #   retrieve your own streams.
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] on_behalf_of_content_owner_channel
        #   This parameter can only be used in a properly authorized request. Note: This
        #   parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID
        #   of the channel to which a video is being added. This parameter is required
        #   when a request specifies a value for the onBehalfOfContentOwner parameter, and
        #   it can only be used in conjunction with that parameter. In addition, the
        #   request must be authorized using a CMS account that is linked to the content
        #   owner that the onBehalfOfContentOwner parameter specifies. Finally, the
        #   channel that the onBehalfOfContentOwnerChannel parameter value specifies must
        #   be linked to the content owner that the onBehalfOfContentOwner parameter
        #   specifies.
        #   This parameter is intended for YouTube content partners that own and manage
        #   many different YouTube channels. It allows content owners to authenticate once
        #   and perform actions on behalf of the channel specified in the parameter value,
        #   without having to provide authentication credentials for each separate channel.
        # @param [String] page_token
        #   The pageToken parameter identifies a specific page in the result set that
        #   should be returned. In an API response, the nextPageToken and prevPageToken
        #   properties identify other pages that could be retrieved.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::ListLiveStreamsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::ListLiveStreamsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_live_streams(part, id: nil, max_results: nil, mine: nil, on_behalf_of_content_owner: nil, on_behalf_of_content_owner_channel: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'liveStreams', options)
          command.response_representation = Google::Apis::YoutubeV3::ListLiveStreamsResponse::Representation
          command.response_class = Google::Apis::YoutubeV3::ListLiveStreamsResponse
          command.query['id'] = id unless id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['mine'] = mine unless mine.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['onBehalfOfContentOwnerChannel'] = on_behalf_of_content_owner_channel unless on_behalf_of_content_owner_channel.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a video stream. If the properties that you want to change cannot be
        # updated, then you need to create a new stream with the proper settings.
        # @param [String] part
        #   The part parameter serves two purposes in this operation. It identifies the
        #   properties that the write operation will set as well as the properties that
        #   the API response will include.
        #   The part properties that you can include in the parameter value are id,
        #   snippet, cdn, and status.
        #   Note that this method will override the existing values for all of the mutable
        #   properties that are contained in any parts that the parameter value specifies.
        #   If the request body does not specify a value for a mutable property, the
        #   existing value for that property will be removed.
        # @param [Google::Apis::YoutubeV3::LiveStream] live_stream_object
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] on_behalf_of_content_owner_channel
        #   This parameter can only be used in a properly authorized request. Note: This
        #   parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID
        #   of the channel to which a video is being added. This parameter is required
        #   when a request specifies a value for the onBehalfOfContentOwner parameter, and
        #   it can only be used in conjunction with that parameter. In addition, the
        #   request must be authorized using a CMS account that is linked to the content
        #   owner that the onBehalfOfContentOwner parameter specifies. Finally, the
        #   channel that the onBehalfOfContentOwnerChannel parameter value specifies must
        #   be linked to the content owner that the onBehalfOfContentOwner parameter
        #   specifies.
        #   This parameter is intended for YouTube content partners that own and manage
        #   many different YouTube channels. It allows content owners to authenticate once
        #   and perform actions on behalf of the channel specified in the parameter value,
        #   without having to provide authentication credentials for each separate channel.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::LiveStream] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::LiveStream]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_live_stream(part, live_stream_object = nil, on_behalf_of_content_owner: nil, on_behalf_of_content_owner_channel: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'liveStreams', options)
          command.request_representation = Google::Apis::YoutubeV3::LiveStream::Representation
          command.request_object = live_stream_object
          command.response_representation = Google::Apis::YoutubeV3::LiveStream::Representation
          command.response_class = Google::Apis::YoutubeV3::LiveStream
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['onBehalfOfContentOwnerChannel'] = on_behalf_of_content_owner_channel unless on_behalf_of_content_owner_channel.nil?
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists members for a channel.
        # @param [String] part
        #   The part parameter specifies the member resource parts that the API response
        #   will include. Supported values are id and snippet.
        # @param [String] has_access_to_level
        #   The hasAccessToLevel parameter specifies, when set, the ID of a pricing level
        #   that members from the results set should have access to. When not set, all
        #   members will be considered, regardless of their active pricing level.
        # @param [Fixnum] max_results
        #   The maxResults parameter specifies the maximum number of items that should be
        #   returned in the result set.
        # @param [String] mode
        #   The mode parameter specifies which channel members to return.
        # @param [String] page_token
        #   The pageToken parameter identifies a specific page in the result set that
        #   should be returned. In an API response, the nextPageToken and prevPageToken
        #   properties identify other pages that could be retrieved.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::MemberListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::MemberListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_members(part, has_access_to_level: nil, max_results: nil, mode: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'members', options)
          command.response_representation = Google::Apis::YoutubeV3::MemberListResponse::Representation
          command.response_class = Google::Apis::YoutubeV3::MemberListResponse
          command.query['hasAccessToLevel'] = has_access_to_level unless has_access_to_level.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['mode'] = mode unless mode.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists pricing levels for a channel.
        # @param [String] part
        #   The part parameter specifies the membershipsLevel resource parts that the API
        #   response will include. Supported values are id and snippet.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::MembershipsLevelListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::MembershipsLevelListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_memberships_levels(part, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'membershipsLevels', options)
          command.response_representation = Google::Apis::YoutubeV3::MembershipsLevelListResponse::Representation
          command.response_class = Google::Apis::YoutubeV3::MembershipsLevelListResponse
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a playlist item.
        # @param [String] id
        #   The id parameter specifies the YouTube playlist item ID for the playlist item
        #   that is being deleted. In a playlistItem resource, the id property specifies
        #   the playlist item's ID.
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
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
        def delete_playlist_item(id, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'playlistItems', options)
          command.query['id'] = id unless id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Adds a resource to a playlist.
        # @param [String] part
        #   The part parameter serves two purposes in this operation. It identifies the
        #   properties that the write operation will set as well as the properties that
        #   the API response will include.
        # @param [Google::Apis::YoutubeV3::PlaylistItem] playlist_item_object
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::PlaylistItem] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::PlaylistItem]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_playlist_item(part, playlist_item_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'playlistItems', options)
          command.request_representation = Google::Apis::YoutubeV3::PlaylistItem::Representation
          command.request_object = playlist_item_object
          command.response_representation = Google::Apis::YoutubeV3::PlaylistItem::Representation
          command.response_class = Google::Apis::YoutubeV3::PlaylistItem
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a collection of playlist items that match the API request parameters.
        # You can retrieve all of the playlist items in a specified playlist or retrieve
        # one or more playlist items by their unique IDs.
        # @param [String] part
        #   The part parameter specifies a comma-separated list of one or more
        #   playlistItem resource properties that the API response will include.
        #   If the parameter identifies a property that contains child properties, the
        #   child properties will be included in the response. For example, in a
        #   playlistItem resource, the snippet property contains numerous fields,
        #   including the title, description, position, and resourceId properties. As such,
        #   if you set part=snippet, the API response will contain all of those
        #   properties.
        # @param [String] id
        #   The id parameter specifies a comma-separated list of one or more unique
        #   playlist item IDs.
        # @param [Fixnum] max_results
        #   The maxResults parameter specifies the maximum number of items that should be
        #   returned in the result set.
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] page_token
        #   The pageToken parameter identifies a specific page in the result set that
        #   should be returned. In an API response, the nextPageToken and prevPageToken
        #   properties identify other pages that could be retrieved.
        # @param [String] playlist_id
        #   The playlistId parameter specifies the unique ID of the playlist for which you
        #   want to retrieve playlist items. Note that even though this is an optional
        #   parameter, every request to retrieve playlist items must specify a value for
        #   either the id parameter or the playlistId parameter.
        # @param [String] video_id
        #   The videoId parameter specifies that the request should return only the
        #   playlist items that contain the specified video.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::ListPlaylistItemsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::ListPlaylistItemsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_playlist_items(part, id: nil, max_results: nil, on_behalf_of_content_owner: nil, page_token: nil, playlist_id: nil, video_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'playlistItems', options)
          command.response_representation = Google::Apis::YoutubeV3::ListPlaylistItemsResponse::Representation
          command.response_class = Google::Apis::YoutubeV3::ListPlaylistItemsResponse
          command.query['id'] = id unless id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['part'] = part unless part.nil?
          command.query['playlistId'] = playlist_id unless playlist_id.nil?
          command.query['videoId'] = video_id unless video_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Modifies a playlist item. For example, you could update the item's position in
        # the playlist.
        # @param [String] part
        #   The part parameter serves two purposes in this operation. It identifies the
        #   properties that the write operation will set as well as the properties that
        #   the API response will include.
        #   Note that this method will override the existing values for all of the mutable
        #   properties that are contained in any parts that the parameter value specifies.
        #   For example, a playlist item can specify a start time and end time, which
        #   identify the times portion of the video that should play when users watch the
        #   video in the playlist. If your request is updating a playlist item that sets
        #   these values, and the request's part parameter value includes the
        #   contentDetails part, the playlist item's start and end times will be updated
        #   to whatever value the request body specifies. If the request body does not
        #   specify values, the existing start and end times will be removed and replaced
        #   with the default settings.
        # @param [Google::Apis::YoutubeV3::PlaylistItem] playlist_item_object
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::PlaylistItem] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::PlaylistItem]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_playlist_item(part, playlist_item_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'playlistItems', options)
          command.request_representation = Google::Apis::YoutubeV3::PlaylistItem::Representation
          command.request_object = playlist_item_object
          command.response_representation = Google::Apis::YoutubeV3::PlaylistItem::Representation
          command.response_class = Google::Apis::YoutubeV3::PlaylistItem
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a playlist.
        # @param [String] id
        #   The id parameter specifies the YouTube playlist ID for the playlist that is
        #   being deleted. In a playlist resource, the id property specifies the playlist'
        #   s ID.
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
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
        def delete_playlist(id, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'playlists', options)
          command.query['id'] = id unless id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a playlist.
        # @param [String] part
        #   The part parameter serves two purposes in this operation. It identifies the
        #   properties that the write operation will set as well as the properties that
        #   the API response will include.
        # @param [Google::Apis::YoutubeV3::Playlist] playlist_object
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] on_behalf_of_content_owner_channel
        #   This parameter can only be used in a properly authorized request. Note: This
        #   parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID
        #   of the channel to which a video is being added. This parameter is required
        #   when a request specifies a value for the onBehalfOfContentOwner parameter, and
        #   it can only be used in conjunction with that parameter. In addition, the
        #   request must be authorized using a CMS account that is linked to the content
        #   owner that the onBehalfOfContentOwner parameter specifies. Finally, the
        #   channel that the onBehalfOfContentOwnerChannel parameter value specifies must
        #   be linked to the content owner that the onBehalfOfContentOwner parameter
        #   specifies.
        #   This parameter is intended for YouTube content partners that own and manage
        #   many different YouTube channels. It allows content owners to authenticate once
        #   and perform actions on behalf of the channel specified in the parameter value,
        #   without having to provide authentication credentials for each separate channel.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::Playlist] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::Playlist]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_playlist(part, playlist_object = nil, on_behalf_of_content_owner: nil, on_behalf_of_content_owner_channel: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'playlists', options)
          command.request_representation = Google::Apis::YoutubeV3::Playlist::Representation
          command.request_object = playlist_object
          command.response_representation = Google::Apis::YoutubeV3::Playlist::Representation
          command.response_class = Google::Apis::YoutubeV3::Playlist
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['onBehalfOfContentOwnerChannel'] = on_behalf_of_content_owner_channel unless on_behalf_of_content_owner_channel.nil?
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a collection of playlists that match the API request parameters. For
        # example, you can retrieve all playlists that the authenticated user owns, or
        # you can retrieve one or more playlists by their unique IDs.
        # @param [String] part
        #   The part parameter specifies a comma-separated list of one or more playlist
        #   resource properties that the API response will include.
        #   If the parameter identifies a property that contains child properties, the
        #   child properties will be included in the response. For example, in a playlist
        #   resource, the snippet property contains properties like author, title,
        #   description, tags, and timeCreated. As such, if you set part=snippet, the API
        #   response will contain all of those properties.
        # @param [String] channel_id
        #   This value indicates that the API should only return the specified channel's
        #   playlists.
        # @param [String] hl
        #   The hl parameter should be used for filter out the properties that are not in
        #   the given language. Used for the snippet part.
        # @param [String] id
        #   The id parameter specifies a comma-separated list of the YouTube playlist ID(s)
        #   for the resource(s) that are being retrieved. In a playlist resource, the id
        #   property specifies the playlist's YouTube playlist ID.
        # @param [Fixnum] max_results
        #   The maxResults parameter specifies the maximum number of items that should be
        #   returned in the result set.
        # @param [Boolean] mine
        #   Set this parameter's value to true to instruct the API to only return
        #   playlists owned by the authenticated user.
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] on_behalf_of_content_owner_channel
        #   This parameter can only be used in a properly authorized request. Note: This
        #   parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID
        #   of the channel to which a video is being added. This parameter is required
        #   when a request specifies a value for the onBehalfOfContentOwner parameter, and
        #   it can only be used in conjunction with that parameter. In addition, the
        #   request must be authorized using a CMS account that is linked to the content
        #   owner that the onBehalfOfContentOwner parameter specifies. Finally, the
        #   channel that the onBehalfOfContentOwnerChannel parameter value specifies must
        #   be linked to the content owner that the onBehalfOfContentOwner parameter
        #   specifies.
        #   This parameter is intended for YouTube content partners that own and manage
        #   many different YouTube channels. It allows content owners to authenticate once
        #   and perform actions on behalf of the channel specified in the parameter value,
        #   without having to provide authentication credentials for each separate channel.
        # @param [String] page_token
        #   The pageToken parameter identifies a specific page in the result set that
        #   should be returned. In an API response, the nextPageToken and prevPageToken
        #   properties identify other pages that could be retrieved.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::ListPlaylistResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::ListPlaylistResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_playlists(part, channel_id: nil, hl: nil, id: nil, max_results: nil, mine: nil, on_behalf_of_content_owner: nil, on_behalf_of_content_owner_channel: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'playlists', options)
          command.response_representation = Google::Apis::YoutubeV3::ListPlaylistResponse::Representation
          command.response_class = Google::Apis::YoutubeV3::ListPlaylistResponse
          command.query['channelId'] = channel_id unless channel_id.nil?
          command.query['hl'] = hl unless hl.nil?
          command.query['id'] = id unless id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['mine'] = mine unless mine.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['onBehalfOfContentOwnerChannel'] = on_behalf_of_content_owner_channel unless on_behalf_of_content_owner_channel.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Modifies a playlist. For example, you could change a playlist's title,
        # description, or privacy status.
        # @param [String] part
        #   The part parameter serves two purposes in this operation. It identifies the
        #   properties that the write operation will set as well as the properties that
        #   the API response will include.
        #   Note that this method will override the existing values for mutable properties
        #   that are contained in any parts that the request body specifies. For example,
        #   a playlist's description is contained in the snippet part, which must be
        #   included in the request body. If the request does not specify a value for the
        #   snippet.description property, the playlist's existing description will be
        #   deleted.
        # @param [Google::Apis::YoutubeV3::Playlist] playlist_object
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::Playlist] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::Playlist]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_playlist(part, playlist_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'playlists', options)
          command.request_representation = Google::Apis::YoutubeV3::Playlist::Representation
          command.request_object = playlist_object
          command.response_representation = Google::Apis::YoutubeV3::Playlist::Representation
          command.response_class = Google::Apis::YoutubeV3::Playlist
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a collection of search results that match the query parameters
        # specified in the API request. By default, a search result set identifies
        # matching video, channel, and playlist resources, but you can also configure
        # queries to only retrieve a specific type of resource.
        # @param [String] part
        #   The part parameter specifies a comma-separated list of one or more search
        #   resource properties that the API response will include. Set the parameter
        #   value to snippet.
        # @param [String] channel_id
        #   The channelId parameter indicates that the API response should only contain
        #   resources created by the channel
        # @param [String] channel_type
        #   The channelType parameter lets you restrict a search to a particular type of
        #   channel.
        # @param [String] event_type
        #   The eventType parameter restricts a search to broadcast events. If you specify
        #   a value for this parameter, you must also set the type parameter's value to
        #   video.
        # @param [Boolean] for_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The forContentOwner parameter restricts the search to only retrieve resources
        #   owned by the content owner specified by the onBehalfOfContentOwner parameter.
        #   The user must be authenticated using a CMS account linked to the specified
        #   content owner and onBehalfOfContentOwner must be provided.
        # @param [Boolean] for_developer
        #   The forDeveloper parameter restricts the search to only retrieve videos
        #   uploaded via the developer's application or website. The API server uses the
        #   request's authorization credentials to identify the developer. Therefore, a
        #   developer can restrict results to videos uploaded through the developer's own
        #   app or website but not to videos uploaded through other apps or sites.
        # @param [Boolean] for_mine
        #   The forMine parameter restricts the search to only retrieve videos owned by
        #   the authenticated user. If you set this parameter to true, then the type
        #   parameter's value must also be set to video.
        # @param [String] location
        #   The location parameter, in conjunction with the locationRadius parameter,
        #   defines a circular geographic area and also restricts a search to videos that
        #   specify, in their metadata, a geographic location that falls within that area.
        #   The parameter value is a string that specifies latitude/longitude coordinates
        #   e.g. (37.42307,-122.08427).
        #   - The location parameter value identifies the point at the center of the area.
        #   - The locationRadius parameter specifies the maximum distance that the
        #   location associated with a video can be from that point for the video to still
        #   be included in the search results.The API returns an error if your request
        #   specifies a value for the location parameter but does not also specify a value
        #   for the locationRadius parameter.
        # @param [String] location_radius
        #   The locationRadius parameter, in conjunction with the location parameter,
        #   defines a circular geographic area.
        #   The parameter value must be a floating point number followed by a measurement
        #   unit. Valid measurement units are m, km, ft, and mi. For example, valid
        #   parameter values include 1500m, 5km, 10000ft, and 0.75mi. The API does not
        #   support locationRadius parameter values larger than 1000 kilometers.
        #   Note: See the definition of the location parameter for more information.
        # @param [Fixnum] max_results
        #   The maxResults parameter specifies the maximum number of items that should be
        #   returned in the result set.
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] order
        #   The order parameter specifies the method that will be used to order resources
        #   in the API response.
        # @param [String] page_token
        #   The pageToken parameter identifies a specific page in the result set that
        #   should be returned. In an API response, the nextPageToken and prevPageToken
        #   properties identify other pages that could be retrieved.
        # @param [DateTime] published_after
        #   The publishedAfter parameter indicates that the API response should only
        #   contain resources created after the specified time. The value is an RFC 3339
        #   formatted date-time value (1970-01-01T00:00:00Z).
        # @param [DateTime] published_before
        #   The publishedBefore parameter indicates that the API response should only
        #   contain resources created before the specified time. The value is an RFC 3339
        #   formatted date-time value (1970-01-01T00:00:00Z).
        # @param [String] q
        #   The q parameter specifies the query term to search for.
        #   Your request can also use the Boolean NOT (-) and OR (|) operators to exclude
        #   videos or to find videos that are associated with one of several search terms.
        #   For example, to search for videos matching either "boating" or "sailing", set
        #   the q parameter value to boating|sailing. Similarly, to search for videos
        #   matching either "boating" or "sailing" but not "fishing", set the q parameter
        #   value to boating|sailing -fishing. Note that the pipe character must be URL-
        #   escaped when it is sent in your API request. The URL-escaped value for the
        #   pipe character is %7C.
        # @param [String] region_code
        #   The regionCode parameter instructs the API to return search results for the
        #   specified country. The parameter value is an ISO 3166-1 alpha-2 country code.
        # @param [String] related_to_video_id
        #   The relatedToVideoId parameter retrieves a list of videos that are related to
        #   the video that the parameter value identifies. The parameter value must be set
        #   to a YouTube video ID and, if you are using this parameter, the type parameter
        #   must be set to video.
        # @param [String] relevance_language
        #   The relevanceLanguage parameter instructs the API to return search results
        #   that are most relevant to the specified language. The parameter value is
        #   typically an ISO 639-1 two-letter language code. However, you should use the
        #   values zh-Hans for simplified Chinese and zh-Hant for traditional Chinese.
        #   Please note that results in other languages will still be returned if they are
        #   highly relevant to the search query term.
        # @param [String] safe_search
        #   The safeSearch parameter indicates whether the search results should include
        #   restricted content as well as standard content.
        # @param [String] topic_id
        #   The topicId parameter indicates that the API response should only contain
        #   resources associated with the specified topic. The value identifies a Freebase
        #   topic ID.
        # @param [String] type
        #   The type parameter restricts a search query to only retrieve a particular type
        #   of resource. The value is a comma-separated list of resource types.
        # @param [String] video_caption
        #   The videoCaption parameter indicates whether the API should filter video
        #   search results based on whether they have captions. If you specify a value for
        #   this parameter, you must also set the type parameter's value to video.
        # @param [String] video_category_id
        #   The videoCategoryId parameter filters video search results based on their
        #   category. If you specify a value for this parameter, you must also set the
        #   type parameter's value to video.
        # @param [String] video_definition
        #   The videoDefinition parameter lets you restrict a search to only include
        #   either high definition (HD) or standard definition (SD) videos. HD videos are
        #   available for playback in at least 720p, though higher resolutions, like 1080p,
        #   might also be available. If you specify a value for this parameter, you must
        #   also set the type parameter's value to video.
        # @param [String] video_dimension
        #   The videoDimension parameter lets you restrict a search to only retrieve 2D or
        #   3D videos. If you specify a value for this parameter, you must also set the
        #   type parameter's value to video.
        # @param [String] video_duration
        #   The videoDuration parameter filters video search results based on their
        #   duration. If you specify a value for this parameter, you must also set the
        #   type parameter's value to video.
        # @param [String] video_embeddable
        #   The videoEmbeddable parameter lets you to restrict a search to only videos
        #   that can be embedded into a webpage. If you specify a value for this parameter,
        #   you must also set the type parameter's value to video.
        # @param [String] video_license
        #   The videoLicense parameter filters search results to only include videos with
        #   a particular license. YouTube lets video uploaders choose to attach either the
        #   Creative Commons license or the standard YouTube license to each of their
        #   videos. If you specify a value for this parameter, you must also set the type
        #   parameter's value to video.
        # @param [String] video_syndicated
        #   The videoSyndicated parameter lets you to restrict a search to only videos
        #   that can be played outside youtube.com. If you specify a value for this
        #   parameter, you must also set the type parameter's value to video.
        # @param [String] video_type
        #   The videoType parameter lets you restrict a search to a particular type of
        #   videos. If you specify a value for this parameter, you must also set the type
        #   parameter's value to video.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::SearchListsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::SearchListsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_searches(part, channel_id: nil, channel_type: nil, event_type: nil, for_content_owner: nil, for_developer: nil, for_mine: nil, location: nil, location_radius: nil, max_results: nil, on_behalf_of_content_owner: nil, order: nil, page_token: nil, published_after: nil, published_before: nil, q: nil, region_code: nil, related_to_video_id: nil, relevance_language: nil, safe_search: nil, topic_id: nil, type: nil, video_caption: nil, video_category_id: nil, video_definition: nil, video_dimension: nil, video_duration: nil, video_embeddable: nil, video_license: nil, video_syndicated: nil, video_type: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'search', options)
          command.response_representation = Google::Apis::YoutubeV3::SearchListsResponse::Representation
          command.response_class = Google::Apis::YoutubeV3::SearchListsResponse
          command.query['channelId'] = channel_id unless channel_id.nil?
          command.query['channelType'] = channel_type unless channel_type.nil?
          command.query['eventType'] = event_type unless event_type.nil?
          command.query['forContentOwner'] = for_content_owner unless for_content_owner.nil?
          command.query['forDeveloper'] = for_developer unless for_developer.nil?
          command.query['forMine'] = for_mine unless for_mine.nil?
          command.query['location'] = location unless location.nil?
          command.query['locationRadius'] = location_radius unless location_radius.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['order'] = order unless order.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['part'] = part unless part.nil?
          command.query['publishedAfter'] = published_after unless published_after.nil?
          command.query['publishedBefore'] = published_before unless published_before.nil?
          command.query['q'] = q unless q.nil?
          command.query['regionCode'] = region_code unless region_code.nil?
          command.query['relatedToVideoId'] = related_to_video_id unless related_to_video_id.nil?
          command.query['relevanceLanguage'] = relevance_language unless relevance_language.nil?
          command.query['safeSearch'] = safe_search unless safe_search.nil?
          command.query['topicId'] = topic_id unless topic_id.nil?
          command.query['type'] = type unless type.nil?
          command.query['videoCaption'] = video_caption unless video_caption.nil?
          command.query['videoCategoryId'] = video_category_id unless video_category_id.nil?
          command.query['videoDefinition'] = video_definition unless video_definition.nil?
          command.query['videoDimension'] = video_dimension unless video_dimension.nil?
          command.query['videoDuration'] = video_duration unless video_duration.nil?
          command.query['videoEmbeddable'] = video_embeddable unless video_embeddable.nil?
          command.query['videoLicense'] = video_license unless video_license.nil?
          command.query['videoSyndicated'] = video_syndicated unless video_syndicated.nil?
          command.query['videoType'] = video_type unless video_type.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists sponsors for a channel.
        # @param [String] part
        #   The part parameter specifies the sponsor resource parts that the API response
        #   will include. Supported values are id and snippet.
        # @param [String] filter
        #   The filter parameter specifies which channel sponsors to return.
        # @param [Fixnum] max_results
        #   The maxResults parameter specifies the maximum number of items that should be
        #   returned in the result set.
        # @param [String] page_token
        #   The pageToken parameter identifies a specific page in the result set that
        #   should be returned. In an API response, the nextPageToken and prevPageToken
        #   properties identify other pages that could be retrieved.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::SponsorListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::SponsorListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_sponsors(part, filter: nil, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'sponsors', options)
          command.response_representation = Google::Apis::YoutubeV3::SponsorListResponse::Representation
          command.response_class = Google::Apis::YoutubeV3::SponsorListResponse
          command.query['filter'] = filter unless filter.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a subscription.
        # @param [String] id
        #   The id parameter specifies the YouTube subscription ID for the resource that
        #   is being deleted. In a subscription resource, the id property specifies the
        #   YouTube subscription ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
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
        def delete_subscription(id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'subscriptions', options)
          command.query['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Adds a subscription for the authenticated user's channel.
        # @param [String] part
        #   The part parameter serves two purposes in this operation. It identifies the
        #   properties that the write operation will set as well as the properties that
        #   the API response will include.
        # @param [Google::Apis::YoutubeV3::Subscription] subscription_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::Subscription] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::Subscription]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_subscription(part, subscription_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'subscriptions', options)
          command.request_representation = Google::Apis::YoutubeV3::Subscription::Representation
          command.request_object = subscription_object
          command.response_representation = Google::Apis::YoutubeV3::Subscription::Representation
          command.response_class = Google::Apis::YoutubeV3::Subscription
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns subscription resources that match the API request criteria.
        # @param [String] part
        #   The part parameter specifies a comma-separated list of one or more
        #   subscription resource properties that the API response will include.
        #   If the parameter identifies a property that contains child properties, the
        #   child properties will be included in the response. For example, in a
        #   subscription resource, the snippet property contains other properties, such as
        #   a display title for the subscription. If you set part=snippet, the API
        #   response will also contain all of those nested properties.
        # @param [String] channel_id
        #   The channelId parameter specifies a YouTube channel ID. The API will only
        #   return that channel's subscriptions.
        # @param [String] for_channel_id
        #   The forChannelId parameter specifies a comma-separated list of channel IDs.
        #   The API response will then only contain subscriptions matching those channels.
        # @param [String] id
        #   The id parameter specifies a comma-separated list of the YouTube subscription
        #   ID(s) for the resource(s) that are being retrieved. In a subscription resource,
        #   the id property specifies the YouTube subscription ID.
        # @param [Fixnum] max_results
        #   The maxResults parameter specifies the maximum number of items that should be
        #   returned in the result set.
        # @param [Boolean] mine
        #   Set this parameter's value to true to retrieve a feed of the authenticated
        #   user's subscriptions.
        # @param [Boolean] my_recent_subscribers
        #   Set this parameter's value to true to retrieve a feed of the subscribers of
        #   the authenticated user in reverse chronological order (newest first).
        # @param [Boolean] my_subscribers
        #   Set this parameter's value to true to retrieve a feed of the subscribers of
        #   the authenticated user in no particular order.
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] on_behalf_of_content_owner_channel
        #   This parameter can only be used in a properly authorized request. Note: This
        #   parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID
        #   of the channel to which a video is being added. This parameter is required
        #   when a request specifies a value for the onBehalfOfContentOwner parameter, and
        #   it can only be used in conjunction with that parameter. In addition, the
        #   request must be authorized using a CMS account that is linked to the content
        #   owner that the onBehalfOfContentOwner parameter specifies. Finally, the
        #   channel that the onBehalfOfContentOwnerChannel parameter value specifies must
        #   be linked to the content owner that the onBehalfOfContentOwner parameter
        #   specifies.
        #   This parameter is intended for YouTube content partners that own and manage
        #   many different YouTube channels. It allows content owners to authenticate once
        #   and perform actions on behalf of the channel specified in the parameter value,
        #   without having to provide authentication credentials for each separate channel.
        # @param [String] order
        #   The order parameter specifies the method that will be used to sort resources
        #   in the API response.
        # @param [String] page_token
        #   The pageToken parameter identifies a specific page in the result set that
        #   should be returned. In an API response, the nextPageToken and prevPageToken
        #   properties identify other pages that could be retrieved.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::ListSubscriptionResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::ListSubscriptionResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_subscriptions(part, channel_id: nil, for_channel_id: nil, id: nil, max_results: nil, mine: nil, my_recent_subscribers: nil, my_subscribers: nil, on_behalf_of_content_owner: nil, on_behalf_of_content_owner_channel: nil, order: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'subscriptions', options)
          command.response_representation = Google::Apis::YoutubeV3::ListSubscriptionResponse::Representation
          command.response_class = Google::Apis::YoutubeV3::ListSubscriptionResponse
          command.query['channelId'] = channel_id unless channel_id.nil?
          command.query['forChannelId'] = for_channel_id unless for_channel_id.nil?
          command.query['id'] = id unless id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['mine'] = mine unless mine.nil?
          command.query['myRecentSubscribers'] = my_recent_subscribers unless my_recent_subscribers.nil?
          command.query['mySubscribers'] = my_subscribers unless my_subscribers.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['onBehalfOfContentOwnerChannel'] = on_behalf_of_content_owner_channel unless on_behalf_of_content_owner_channel.nil?
          command.query['order'] = order unless order.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists Super Chat events for a channel.
        # @param [String] part
        #   The part parameter specifies the superChatEvent resource parts that the API
        #   response will include. Supported values are id and snippet.
        # @param [String] hl
        #   The hl parameter instructs the API to retrieve localized resource metadata for
        #   a specific application language that the YouTube website supports. The
        #   parameter value must be a language code included in the list returned by the
        #   i18nLanguages.list method.
        #   If localized resource details are available in that language, the resource's
        #   snippet.localized object will contain the localized values. However, if
        #   localized details are not available, the snippet.localized object will contain
        #   resource details in the resource's default language.
        # @param [Fixnum] max_results
        #   The maxResults parameter specifies the maximum number of items that should be
        #   returned in the result set.
        # @param [String] page_token
        #   The pageToken parameter identifies a specific page in the result set that
        #   should be returned. In an API response, the nextPageToken and prevPageToken
        #   properties identify other pages that could be retrieved.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::SuperChatEventListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::SuperChatEventListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_super_chat_events(part, hl: nil, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'superChatEvents', options)
          command.response_representation = Google::Apis::YoutubeV3::SuperChatEventListResponse::Representation
          command.response_class = Google::Apis::YoutubeV3::SuperChatEventListResponse
          command.query['hl'] = hl unless hl.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Uploads a custom video thumbnail to YouTube and sets it for a video.
        # @param [String] video_id
        #   The videoId parameter specifies a YouTube video ID for which the custom video
        #   thumbnail is being provided.
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The actual CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
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
        # @yieldparam result [Google::Apis::YoutubeV3::SetThumbnailResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::SetThumbnailResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def set_thumbnail(video_id, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, upload_source: nil, content_type: nil, options: nil, &block)
          if upload_source.nil?
            command = make_simple_command(:post, 'thumbnails/set', options)
          else
            command = make_upload_command(:post, 'thumbnails/set', options)
            command.upload_source = upload_source
            command.upload_content_type = content_type
          end
          command.response_representation = Google::Apis::YoutubeV3::SetThumbnailResponse::Representation
          command.response_class = Google::Apis::YoutubeV3::SetThumbnailResponse
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['videoId'] = video_id unless video_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of abuse reasons that can be used for reporting abusive videos.
        # @param [String] part
        #   The part parameter specifies the videoCategory resource parts that the API
        #   response will include. Supported values are id and snippet.
        # @param [String] hl
        #   The hl parameter specifies the language that should be used for text values in
        #   the API response.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::ListVideoAbuseReportReasonResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::ListVideoAbuseReportReasonResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_video_abuse_report_reasons(part, hl: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'videoAbuseReportReasons', options)
          command.response_representation = Google::Apis::YoutubeV3::ListVideoAbuseReportReasonResponse::Representation
          command.response_class = Google::Apis::YoutubeV3::ListVideoAbuseReportReasonResponse
          command.query['hl'] = hl unless hl.nil?
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of categories that can be associated with YouTube videos.
        # @param [String] part
        #   The part parameter specifies the videoCategory resource properties that the
        #   API response will include. Set the parameter value to snippet.
        # @param [String] hl
        #   The hl parameter specifies the language that should be used for text values in
        #   the API response.
        # @param [String] id
        #   The id parameter specifies a comma-separated list of video category IDs for
        #   the resources that you are retrieving.
        # @param [String] region_code
        #   The regionCode parameter instructs the API to return the list of video
        #   categories available in the specified country. The parameter value is an ISO
        #   3166-1 alpha-2 country code.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::ListVideoCategoryResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::ListVideoCategoryResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_video_categories(part, hl: nil, id: nil, region_code: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'videoCategories', options)
          command.response_representation = Google::Apis::YoutubeV3::ListVideoCategoryResponse::Representation
          command.response_class = Google::Apis::YoutubeV3::ListVideoCategoryResponse
          command.query['hl'] = hl unless hl.nil?
          command.query['id'] = id unless id.nil?
          command.query['part'] = part unless part.nil?
          command.query['regionCode'] = region_code unless region_code.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a YouTube video.
        # @param [String] id
        #   The id parameter specifies the YouTube video ID for the resource that is being
        #   deleted. In a video resource, the id property specifies the video's ID.
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The actual CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
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
        def delete_video(id, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'videos', options)
          command.query['id'] = id unless id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the ratings that the authorized user gave to a list of specified
        # videos.
        # @param [String] id
        #   The id parameter specifies a comma-separated list of the YouTube video ID(s)
        #   for the resource(s) for which you are retrieving rating data. In a video
        #   resource, the id property specifies the video's ID.
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::GetVideoRatingResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::GetVideoRatingResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_video_rating(id, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'videos/getRating', options)
          command.response_representation = Google::Apis::YoutubeV3::GetVideoRatingResponse::Representation
          command.response_class = Google::Apis::YoutubeV3::GetVideoRatingResponse
          command.query['id'] = id unless id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Uploads a video to YouTube and optionally sets the video's metadata.
        # @param [String] part
        #   The part parameter serves two purposes in this operation. It identifies the
        #   properties that the write operation will set as well as the properties that
        #   the API response will include.
        #   Note that not all parts contain properties that can be set when inserting or
        #   updating a video. For example, the statistics object encapsulates statistics
        #   that YouTube calculates for a video and does not contain values that you can
        #   set or modify. If the parameter value specifies a part that does not contain
        #   mutable values, that part will still be included in the API response.
        # @param [Google::Apis::YoutubeV3::Video] video_object
        # @param [Boolean] auto_levels
        #   The autoLevels parameter indicates whether YouTube should automatically
        #   enhance the video's lighting and color.
        # @param [Boolean] notify_subscribers
        #   The notifySubscribers parameter indicates whether YouTube should send a
        #   notification about the new video to users who subscribe to the video's channel.
        #   A parameter value of True indicates that subscribers will be notified of
        #   newly uploaded videos. However, a channel owner who is uploading many videos
        #   might prefer to set the value to False to avoid sending a notification about
        #   each new video to the channel's subscribers.
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] on_behalf_of_content_owner_channel
        #   This parameter can only be used in a properly authorized request. Note: This
        #   parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID
        #   of the channel to which a video is being added. This parameter is required
        #   when a request specifies a value for the onBehalfOfContentOwner parameter, and
        #   it can only be used in conjunction with that parameter. In addition, the
        #   request must be authorized using a CMS account that is linked to the content
        #   owner that the onBehalfOfContentOwner parameter specifies. Finally, the
        #   channel that the onBehalfOfContentOwnerChannel parameter value specifies must
        #   be linked to the content owner that the onBehalfOfContentOwner parameter
        #   specifies.
        #   This parameter is intended for YouTube content partners that own and manage
        #   many different YouTube channels. It allows content owners to authenticate once
        #   and perform actions on behalf of the channel specified in the parameter value,
        #   without having to provide authentication credentials for each separate channel.
        # @param [Boolean] stabilize
        #   The stabilize parameter indicates whether YouTube should adjust the video to
        #   remove shaky camera motions.
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
        # @yieldparam result [Google::Apis::YoutubeV3::Video] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::Video]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_video(part, video_object = nil, auto_levels: nil, notify_subscribers: nil, on_behalf_of_content_owner: nil, on_behalf_of_content_owner_channel: nil, stabilize: nil, fields: nil, quota_user: nil, user_ip: nil, upload_source: nil, content_type: nil, options: nil, &block)
          if upload_source.nil?
            command = make_simple_command(:post, 'videos', options)
          else
            command = make_upload_command(:post, 'videos', options)
            command.upload_source = upload_source
            command.upload_content_type = content_type
          end
          command.request_representation = Google::Apis::YoutubeV3::Video::Representation
          command.request_object = video_object
          command.response_representation = Google::Apis::YoutubeV3::Video::Representation
          command.response_class = Google::Apis::YoutubeV3::Video
          command.query['autoLevels'] = auto_levels unless auto_levels.nil?
          command.query['notifySubscribers'] = notify_subscribers unless notify_subscribers.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['onBehalfOfContentOwnerChannel'] = on_behalf_of_content_owner_channel unless on_behalf_of_content_owner_channel.nil?
          command.query['part'] = part unless part.nil?
          command.query['stabilize'] = stabilize unless stabilize.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of videos that match the API request parameters.
        # @param [String] part
        #   The part parameter specifies a comma-separated list of one or more video
        #   resource properties that the API response will include.
        #   If the parameter identifies a property that contains child properties, the
        #   child properties will be included in the response. For example, in a video
        #   resource, the snippet property contains the channelId, title, description,
        #   tags, and categoryId properties. As such, if you set part=snippet, the API
        #   response will contain all of those properties.
        # @param [String] chart
        #   The chart parameter identifies the chart that you want to retrieve.
        # @param [String] hl
        #   The hl parameter instructs the API to retrieve localized resource metadata for
        #   a specific application language that the YouTube website supports. The
        #   parameter value must be a language code included in the list returned by the
        #   i18nLanguages.list method.
        #   If localized resource details are available in that language, the resource's
        #   snippet.localized object will contain the localized values. However, if
        #   localized details are not available, the snippet.localized object will contain
        #   resource details in the resource's default language.
        # @param [String] id
        #   The id parameter specifies a comma-separated list of the YouTube video ID(s)
        #   for the resource(s) that are being retrieved. In a video resource, the id
        #   property specifies the video's ID.
        # @param [String] locale
        #   DEPRECATED
        # @param [Fixnum] max_height
        #   The maxHeight parameter specifies a maximum height of the embedded player. If
        #   maxWidth is provided, maxHeight may not be reached in order to not violate the
        #   width request.
        # @param [Fixnum] max_results
        #   The maxResults parameter specifies the maximum number of items that should be
        #   returned in the result set.
        #   Note: This parameter is supported for use in conjunction with the myRating and
        #   chart parameters, but it is not supported for use in conjunction with the id
        #   parameter.
        # @param [Fixnum] max_width
        #   The maxWidth parameter specifies a maximum width of the embedded player. If
        #   maxHeight is provided, maxWidth may not be reached in order to not violate the
        #   height request.
        # @param [String] my_rating
        #   Set this parameter's value to like or dislike to instruct the API to only
        #   return videos liked or disliked by the authenticated user.
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] page_token
        #   The pageToken parameter identifies a specific page in the result set that
        #   should be returned. In an API response, the nextPageToken and prevPageToken
        #   properties identify other pages that could be retrieved.
        #   Note: This parameter is supported for use in conjunction with the myRating and
        #   chart parameters, but it is not supported for use in conjunction with the id
        #   parameter.
        # @param [String] region_code
        #   The regionCode parameter instructs the API to select a video chart available
        #   in the specified region. This parameter can only be used in conjunction with
        #   the chart parameter. The parameter value is an ISO 3166-1 alpha-2 country code.
        # @param [String] video_category_id
        #   The videoCategoryId parameter identifies the video category for which the
        #   chart should be retrieved. This parameter can only be used in conjunction with
        #   the chart parameter. By default, charts are not restricted to a particular
        #   category.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::ListVideosResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::ListVideosResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_videos(part, chart: nil, hl: nil, id: nil, locale: nil, max_height: nil, max_results: nil, max_width: nil, my_rating: nil, on_behalf_of_content_owner: nil, page_token: nil, region_code: nil, video_category_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'videos', options)
          command.response_representation = Google::Apis::YoutubeV3::ListVideosResponse::Representation
          command.response_class = Google::Apis::YoutubeV3::ListVideosResponse
          command.query['chart'] = chart unless chart.nil?
          command.query['hl'] = hl unless hl.nil?
          command.query['id'] = id unless id.nil?
          command.query['locale'] = locale unless locale.nil?
          command.query['maxHeight'] = max_height unless max_height.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['maxWidth'] = max_width unless max_width.nil?
          command.query['myRating'] = my_rating unless my_rating.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['part'] = part unless part.nil?
          command.query['regionCode'] = region_code unless region_code.nil?
          command.query['videoCategoryId'] = video_category_id unless video_category_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Add a like or dislike rating to a video or remove a rating from a video.
        # @param [String] id
        #   The id parameter specifies the YouTube video ID of the video that is being
        #   rated or having its rating removed.
        # @param [String] rating
        #   Specifies the rating to record.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
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
        def rate_video(id, rating, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'videos/rate', options)
          command.query['id'] = id unless id.nil?
          command.query['rating'] = rating unless rating.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Report abuse for a video.
        # @param [Google::Apis::YoutubeV3::VideoAbuseReport] video_abuse_report_object
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
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
        def report_video_abuse(video_abuse_report_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'videos/reportAbuse', options)
          command.request_representation = Google::Apis::YoutubeV3::VideoAbuseReport::Representation
          command.request_object = video_abuse_report_object
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a video's metadata.
        # @param [String] part
        #   The part parameter serves two purposes in this operation. It identifies the
        #   properties that the write operation will set as well as the properties that
        #   the API response will include.
        #   Note that this method will override the existing values for all of the mutable
        #   properties that are contained in any parts that the parameter value specifies.
        #   For example, a video's privacy setting is contained in the status part. As
        #   such, if your request is updating a private video, and the request's part
        #   parameter value includes the status part, the video's privacy setting will be
        #   updated to whatever value the request body specifies. If the request body does
        #   not specify a value, the existing privacy setting will be removed and the
        #   video will revert to the default privacy setting.
        #   In addition, not all parts contain properties that can be set when inserting
        #   or updating a video. For example, the statistics object encapsulates
        #   statistics that YouTube calculates for a video and does not contain values
        #   that you can set or modify. If the parameter value specifies a part that does
        #   not contain mutable values, that part will still be included in the API
        #   response.
        # @param [Google::Apis::YoutubeV3::Video] video_object
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The actual CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeV3::Video] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeV3::Video]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_video(part, video_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'videos', options)
          command.request_representation = Google::Apis::YoutubeV3::Video::Representation
          command.request_object = video_object
          command.response_representation = Google::Apis::YoutubeV3::Video::Representation
          command.response_class = Google::Apis::YoutubeV3::Video
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['part'] = part unless part.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Uploads a watermark image to YouTube and sets it for a channel.
        # @param [String] channel_id
        #   The channelId parameter specifies the YouTube channel ID for which the
        #   watermark is being provided.
        # @param [Google::Apis::YoutubeV3::InvideoBranding] invideo_branding_object
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def set_watermark(channel_id, invideo_branding_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, upload_source: nil, content_type: nil, options: nil, &block)
          if upload_source.nil?
            command = make_simple_command(:post, 'watermarks/set', options)
          else
            command = make_upload_command(:post, 'watermarks/set', options)
            command.upload_source = upload_source
            command.upload_content_type = content_type
          end
          command.request_representation = Google::Apis::YoutubeV3::InvideoBranding::Representation
          command.request_object = invideo_branding_object
          command.query['channelId'] = channel_id unless channel_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a channel's watermark image.
        # @param [String] channel_id
        #   The channelId parameter specifies the YouTube channel ID for which the
        #   watermark is being unset.
        # @param [String] on_behalf_of_content_owner
        #   Note: This parameter is intended exclusively for YouTube content partners.
        #   The onBehalfOfContentOwner parameter indicates that the request's
        #   authorization credentials identify a YouTube CMS user who is acting on behalf
        #   of the content owner specified in the parameter value. This parameter is
        #   intended for YouTube content partners that own and manage many different
        #   YouTube channels. It allows content owners to authenticate once and get access
        #   to all their video and channel data, without having to provide authentication
        #   credentials for each individual channel. The CMS account that the user
        #   authenticates with must be linked to the specified YouTube content owner.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
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
        def unset_watermark(channel_id, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'watermarks/unset', options)
          command.query['channelId'] = channel_id unless channel_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
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
