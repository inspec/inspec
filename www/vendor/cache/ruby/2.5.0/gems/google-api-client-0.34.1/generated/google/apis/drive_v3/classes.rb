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
    module DriveV3
      
      # Information about the user, the user's Drive, and system capabilities.
      class About
        include Google::Apis::Core::Hashable
      
        # Whether the user has installed the requesting app.
        # Corresponds to the JSON property `appInstalled`
        # @return [Boolean]
        attr_accessor :app_installed
        alias_method :app_installed?, :app_installed
      
        # Whether the user can create shared drives.
        # Corresponds to the JSON property `canCreateDrives`
        # @return [Boolean]
        attr_accessor :can_create_drives
        alias_method :can_create_drives?, :can_create_drives
      
        # Deprecated - use canCreateDrives instead.
        # Corresponds to the JSON property `canCreateTeamDrives`
        # @return [Boolean]
        attr_accessor :can_create_team_drives
        alias_method :can_create_team_drives?, :can_create_team_drives
      
        # A list of themes that are supported for shared drives.
        # Corresponds to the JSON property `driveThemes`
        # @return [Array<Google::Apis::DriveV3::About::DriveTheme>]
        attr_accessor :drive_themes
      
        # A map of source MIME type to possible targets for all supported exports.
        # Corresponds to the JSON property `exportFormats`
        # @return [Hash<String,Array<String>>]
        attr_accessor :export_formats
      
        # The currently supported folder colors as RGB hex strings.
        # Corresponds to the JSON property `folderColorPalette`
        # @return [Array<String>]
        attr_accessor :folder_color_palette
      
        # A map of source MIME type to possible targets for all supported imports.
        # Corresponds to the JSON property `importFormats`
        # @return [Hash<String,Array<String>>]
        attr_accessor :import_formats
      
        # Identifies what kind of resource this is. Value: the fixed string "drive#about"
        # .
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # A map of maximum import sizes by MIME type, in bytes.
        # Corresponds to the JSON property `maxImportSizes`
        # @return [Hash<String,Fixnum>]
        attr_accessor :max_import_sizes
      
        # The maximum upload size in bytes.
        # Corresponds to the JSON property `maxUploadSize`
        # @return [Fixnum]
        attr_accessor :max_upload_size
      
        # The user's storage quota limits and usage. All fields are measured in bytes.
        # Corresponds to the JSON property `storageQuota`
        # @return [Google::Apis::DriveV3::About::StorageQuota]
        attr_accessor :storage_quota
      
        # Deprecated - use driveThemes instead.
        # Corresponds to the JSON property `teamDriveThemes`
        # @return [Array<Google::Apis::DriveV3::About::TeamDriveTheme>]
        attr_accessor :team_drive_themes
      
        # Information about a Drive user.
        # Corresponds to the JSON property `user`
        # @return [Google::Apis::DriveV3::User]
        attr_accessor :user
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app_installed = args[:app_installed] if args.key?(:app_installed)
          @can_create_drives = args[:can_create_drives] if args.key?(:can_create_drives)
          @can_create_team_drives = args[:can_create_team_drives] if args.key?(:can_create_team_drives)
          @drive_themes = args[:drive_themes] if args.key?(:drive_themes)
          @export_formats = args[:export_formats] if args.key?(:export_formats)
          @folder_color_palette = args[:folder_color_palette] if args.key?(:folder_color_palette)
          @import_formats = args[:import_formats] if args.key?(:import_formats)
          @kind = args[:kind] if args.key?(:kind)
          @max_import_sizes = args[:max_import_sizes] if args.key?(:max_import_sizes)
          @max_upload_size = args[:max_upload_size] if args.key?(:max_upload_size)
          @storage_quota = args[:storage_quota] if args.key?(:storage_quota)
          @team_drive_themes = args[:team_drive_themes] if args.key?(:team_drive_themes)
          @user = args[:user] if args.key?(:user)
        end
        
        # 
        class DriveTheme
          include Google::Apis::Core::Hashable
        
          # A link to this theme's background image.
          # Corresponds to the JSON property `backgroundImageLink`
          # @return [String]
          attr_accessor :background_image_link
        
          # The color of this theme as an RGB hex string.
          # Corresponds to the JSON property `colorRgb`
          # @return [String]
          attr_accessor :color_rgb
        
          # The ID of the theme.
          # Corresponds to the JSON property `id`
          # @return [String]
          attr_accessor :id
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @background_image_link = args[:background_image_link] if args.key?(:background_image_link)
            @color_rgb = args[:color_rgb] if args.key?(:color_rgb)
            @id = args[:id] if args.key?(:id)
          end
        end
        
        # The user's storage quota limits and usage. All fields are measured in bytes.
        class StorageQuota
          include Google::Apis::Core::Hashable
        
          # The usage limit, if applicable. This will not be present if the user has
          # unlimited storage.
          # Corresponds to the JSON property `limit`
          # @return [Fixnum]
          attr_accessor :limit
        
          # The total usage across all services.
          # Corresponds to the JSON property `usage`
          # @return [Fixnum]
          attr_accessor :usage
        
          # The usage by all files in Google Drive.
          # Corresponds to the JSON property `usageInDrive`
          # @return [Fixnum]
          attr_accessor :usage_in_drive
        
          # The usage by trashed files in Google Drive.
          # Corresponds to the JSON property `usageInDriveTrash`
          # @return [Fixnum]
          attr_accessor :usage_in_drive_trash
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @limit = args[:limit] if args.key?(:limit)
            @usage = args[:usage] if args.key?(:usage)
            @usage_in_drive = args[:usage_in_drive] if args.key?(:usage_in_drive)
            @usage_in_drive_trash = args[:usage_in_drive_trash] if args.key?(:usage_in_drive_trash)
          end
        end
        
        # 
        class TeamDriveTheme
          include Google::Apis::Core::Hashable
        
          # Deprecated - use driveThemes/backgroundImageLink instead.
          # Corresponds to the JSON property `backgroundImageLink`
          # @return [String]
          attr_accessor :background_image_link
        
          # Deprecated - use driveThemes/colorRgb instead.
          # Corresponds to the JSON property `colorRgb`
          # @return [String]
          attr_accessor :color_rgb
        
          # Deprecated - use driveThemes/id instead.
          # Corresponds to the JSON property `id`
          # @return [String]
          attr_accessor :id
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @background_image_link = args[:background_image_link] if args.key?(:background_image_link)
            @color_rgb = args[:color_rgb] if args.key?(:color_rgb)
            @id = args[:id] if args.key?(:id)
          end
        end
      end
      
      # A change to a file or shared drive.
      class Change
        include Google::Apis::Core::Hashable
      
        # The type of the change. Possible values are file and drive.
        # Corresponds to the JSON property `changeType`
        # @return [String]
        attr_accessor :change_type
      
        # Representation of a shared drive.
        # Corresponds to the JSON property `drive`
        # @return [Google::Apis::DriveV3::Drive]
        attr_accessor :drive
      
        # The ID of the shared drive associated with this change.
        # Corresponds to the JSON property `driveId`
        # @return [String]
        attr_accessor :drive_id
      
        # The metadata for a file.
        # Corresponds to the JSON property `file`
        # @return [Google::Apis::DriveV3::File]
        attr_accessor :file
      
        # The ID of the file which has changed.
        # Corresponds to the JSON property `fileId`
        # @return [String]
        attr_accessor :file_id
      
        # Identifies what kind of resource this is. Value: the fixed string "drive#
        # change".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Whether the file or shared drive has been removed from this list of changes,
        # for example by deletion or loss of access.
        # Corresponds to the JSON property `removed`
        # @return [Boolean]
        attr_accessor :removed
        alias_method :removed?, :removed
      
        # Deprecated: use the drive collection instead.
        # Corresponds to the JSON property `teamDrive`
        # @return [Google::Apis::DriveV3::TeamDrive]
        attr_accessor :team_drive
      
        # Deprecated - use driveId instead.
        # Corresponds to the JSON property `teamDriveId`
        # @return [String]
        attr_accessor :team_drive_id
      
        # The time of this change (RFC 3339 date-time).
        # Corresponds to the JSON property `time`
        # @return [DateTime]
        attr_accessor :time
      
        # Deprecated - use changeType instead.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @change_type = args[:change_type] if args.key?(:change_type)
          @drive = args[:drive] if args.key?(:drive)
          @drive_id = args[:drive_id] if args.key?(:drive_id)
          @file = args[:file] if args.key?(:file)
          @file_id = args[:file_id] if args.key?(:file_id)
          @kind = args[:kind] if args.key?(:kind)
          @removed = args[:removed] if args.key?(:removed)
          @team_drive = args[:team_drive] if args.key?(:team_drive)
          @team_drive_id = args[:team_drive_id] if args.key?(:team_drive_id)
          @time = args[:time] if args.key?(:time)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # A list of changes for a user.
      class ChangeList
        include Google::Apis::Core::Hashable
      
        # The list of changes. If nextPageToken is populated, then this list may be
        # incomplete and an additional page of results should be fetched.
        # Corresponds to the JSON property `changes`
        # @return [Array<Google::Apis::DriveV3::Change>]
        attr_accessor :changes
      
        # Identifies what kind of resource this is. Value: the fixed string "drive#
        # changeList".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The starting page token for future changes. This will be present only if the
        # end of the current changes list has been reached.
        # Corresponds to the JSON property `newStartPageToken`
        # @return [String]
        attr_accessor :new_start_page_token
      
        # The page token for the next page of changes. This will be absent if the end of
        # the changes list has been reached. If the token is rejected for any reason, it
        # should be discarded, and pagination should be restarted from the first page of
        # results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @changes = args[:changes] if args.key?(:changes)
          @kind = args[:kind] if args.key?(:kind)
          @new_start_page_token = args[:new_start_page_token] if args.key?(:new_start_page_token)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # An notification channel used to watch for resource changes.
      class Channel
        include Google::Apis::Core::Hashable
      
        # The address where notifications are delivered for this channel.
        # Corresponds to the JSON property `address`
        # @return [String]
        attr_accessor :address
      
        # Date and time of notification channel expiration, expressed as a Unix
        # timestamp, in milliseconds. Optional.
        # Corresponds to the JSON property `expiration`
        # @return [Fixnum]
        attr_accessor :expiration
      
        # A UUID or similar unique string that identifies this channel.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies this as a notification channel used to watch for changes to a
        # resource, which is "api#channel".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Additional parameters controlling delivery channel behavior. Optional.
        # Corresponds to the JSON property `params`
        # @return [Hash<String,String>]
        attr_accessor :params
      
        # A Boolean value to indicate whether payload is wanted. Optional.
        # Corresponds to the JSON property `payload`
        # @return [Boolean]
        attr_accessor :payload
        alias_method :payload?, :payload
      
        # An opaque ID that identifies the resource being watched on this channel.
        # Stable across different API versions.
        # Corresponds to the JSON property `resourceId`
        # @return [String]
        attr_accessor :resource_id
      
        # A version-specific identifier for the watched resource.
        # Corresponds to the JSON property `resourceUri`
        # @return [String]
        attr_accessor :resource_uri
      
        # An arbitrary string delivered to the target address with each notification
        # delivered over this channel. Optional.
        # Corresponds to the JSON property `token`
        # @return [String]
        attr_accessor :token
      
        # The type of delivery mechanism used for this channel.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @address = args[:address] if args.key?(:address)
          @expiration = args[:expiration] if args.key?(:expiration)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @params = args[:params] if args.key?(:params)
          @payload = args[:payload] if args.key?(:payload)
          @resource_id = args[:resource_id] if args.key?(:resource_id)
          @resource_uri = args[:resource_uri] if args.key?(:resource_uri)
          @token = args[:token] if args.key?(:token)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # A comment on a file.
      class Comment
        include Google::Apis::Core::Hashable
      
        # A region of the document represented as a JSON string. See anchor
        # documentation for details on how to define and interpret anchor properties.
        # Corresponds to the JSON property `anchor`
        # @return [String]
        attr_accessor :anchor
      
        # Information about a Drive user.
        # Corresponds to the JSON property `author`
        # @return [Google::Apis::DriveV3::User]
        attr_accessor :author
      
        # The plain text content of the comment. This field is used for setting the
        # content, while htmlContent should be displayed.
        # Corresponds to the JSON property `content`
        # @return [String]
        attr_accessor :content
      
        # The time at which the comment was created (RFC 3339 date-time).
        # Corresponds to the JSON property `createdTime`
        # @return [DateTime]
        attr_accessor :created_time
      
        # Whether the comment has been deleted. A deleted comment has no content.
        # Corresponds to the JSON property `deleted`
        # @return [Boolean]
        attr_accessor :deleted
        alias_method :deleted?, :deleted
      
        # The content of the comment with HTML formatting.
        # Corresponds to the JSON property `htmlContent`
        # @return [String]
        attr_accessor :html_content
      
        # The ID of the comment.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "drive#
        # comment".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The last time the comment or any of its replies was modified (RFC 3339 date-
        # time).
        # Corresponds to the JSON property `modifiedTime`
        # @return [DateTime]
        attr_accessor :modified_time
      
        # The file content to which the comment refers, typically within the anchor
        # region. For a text file, for example, this would be the text at the location
        # of the comment.
        # Corresponds to the JSON property `quotedFileContent`
        # @return [Google::Apis::DriveV3::Comment::QuotedFileContent]
        attr_accessor :quoted_file_content
      
        # The full list of replies to the comment in chronological order.
        # Corresponds to the JSON property `replies`
        # @return [Array<Google::Apis::DriveV3::Reply>]
        attr_accessor :replies
      
        # Whether the comment has been resolved by one of its replies.
        # Corresponds to the JSON property `resolved`
        # @return [Boolean]
        attr_accessor :resolved
        alias_method :resolved?, :resolved
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @anchor = args[:anchor] if args.key?(:anchor)
          @author = args[:author] if args.key?(:author)
          @content = args[:content] if args.key?(:content)
          @created_time = args[:created_time] if args.key?(:created_time)
          @deleted = args[:deleted] if args.key?(:deleted)
          @html_content = args[:html_content] if args.key?(:html_content)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @modified_time = args[:modified_time] if args.key?(:modified_time)
          @quoted_file_content = args[:quoted_file_content] if args.key?(:quoted_file_content)
          @replies = args[:replies] if args.key?(:replies)
          @resolved = args[:resolved] if args.key?(:resolved)
        end
        
        # The file content to which the comment refers, typically within the anchor
        # region. For a text file, for example, this would be the text at the location
        # of the comment.
        class QuotedFileContent
          include Google::Apis::Core::Hashable
        
          # The MIME type of the quoted content.
          # Corresponds to the JSON property `mimeType`
          # @return [String]
          attr_accessor :mime_type
        
          # The quoted content itself. This is interpreted as plain text if set through
          # the API.
          # Corresponds to the JSON property `value`
          # @return [String]
          attr_accessor :value
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @mime_type = args[:mime_type] if args.key?(:mime_type)
            @value = args[:value] if args.key?(:value)
          end
        end
      end
      
      # A list of comments on a file.
      class CommentList
        include Google::Apis::Core::Hashable
      
        # The list of comments. If nextPageToken is populated, then this list may be
        # incomplete and an additional page of results should be fetched.
        # Corresponds to the JSON property `comments`
        # @return [Array<Google::Apis::DriveV3::Comment>]
        attr_accessor :comments
      
        # Identifies what kind of resource this is. Value: the fixed string "drive#
        # commentList".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The page token for the next page of comments. This will be absent if the end
        # of the comments list has been reached. If the token is rejected for any reason,
        # it should be discarded, and pagination should be restarted from the first
        # page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @comments = args[:comments] if args.key?(:comments)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Representation of a shared drive.
      class Drive
        include Google::Apis::Core::Hashable
      
        # An image file and cropping parameters from which a background image for this
        # shared drive is set. This is a write only field; it can only be set on drive.
        # drives.update requests that don't set themeId. When specified, all fields of
        # the backgroundImageFile must be set.
        # Corresponds to the JSON property `backgroundImageFile`
        # @return [Google::Apis::DriveV3::Drive::BackgroundImageFile]
        attr_accessor :background_image_file
      
        # A short-lived link to this shared drive's background image.
        # Corresponds to the JSON property `backgroundImageLink`
        # @return [String]
        attr_accessor :background_image_link
      
        # Capabilities the current user has on this shared drive.
        # Corresponds to the JSON property `capabilities`
        # @return [Google::Apis::DriveV3::Drive::Capabilities]
        attr_accessor :capabilities
      
        # The color of this shared drive as an RGB hex string. It can only be set on a
        # drive.drives.update request that does not set themeId.
        # Corresponds to the JSON property `colorRgb`
        # @return [String]
        attr_accessor :color_rgb
      
        # The time at which the shared drive was created (RFC 3339 date-time).
        # Corresponds to the JSON property `createdTime`
        # @return [DateTime]
        attr_accessor :created_time
      
        # Whether the shared drive is hidden from default view.
        # Corresponds to the JSON property `hidden`
        # @return [Boolean]
        attr_accessor :hidden
        alias_method :hidden?, :hidden
      
        # The ID of this shared drive which is also the ID of the top level folder of
        # this shared drive.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "drive#drive"
        # .
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The name of this shared drive.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # A set of restrictions that apply to this shared drive or items inside this
        # shared drive.
        # Corresponds to the JSON property `restrictions`
        # @return [Google::Apis::DriveV3::Drive::Restrictions]
        attr_accessor :restrictions
      
        # The ID of the theme from which the background image and color will be set. The
        # set of possible driveThemes can be retrieved from a drive.about.get response.
        # When not specified on a drive.drives.create request, a random theme is chosen
        # from which the background image and color are set. This is a write-only field;
        # it can only be set on requests that don't set colorRgb or backgroundImageFile.
        # Corresponds to the JSON property `themeId`
        # @return [String]
        attr_accessor :theme_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @background_image_file = args[:background_image_file] if args.key?(:background_image_file)
          @background_image_link = args[:background_image_link] if args.key?(:background_image_link)
          @capabilities = args[:capabilities] if args.key?(:capabilities)
          @color_rgb = args[:color_rgb] if args.key?(:color_rgb)
          @created_time = args[:created_time] if args.key?(:created_time)
          @hidden = args[:hidden] if args.key?(:hidden)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @restrictions = args[:restrictions] if args.key?(:restrictions)
          @theme_id = args[:theme_id] if args.key?(:theme_id)
        end
        
        # An image file and cropping parameters from which a background image for this
        # shared drive is set. This is a write only field; it can only be set on drive.
        # drives.update requests that don't set themeId. When specified, all fields of
        # the backgroundImageFile must be set.
        class BackgroundImageFile
          include Google::Apis::Core::Hashable
        
          # The ID of an image file in Google Drive to use for the background image.
          # Corresponds to the JSON property `id`
          # @return [String]
          attr_accessor :id
        
          # The width of the cropped image in the closed range of 0 to 1. This value
          # represents the width of the cropped image divided by the width of the entire
          # image. The height is computed by applying a width to height aspect ratio of 80
          # to 9. The resulting image must be at least 1280 pixels wide and 144 pixels
          # high.
          # Corresponds to the JSON property `width`
          # @return [Float]
          attr_accessor :width
        
          # The X coordinate of the upper left corner of the cropping area in the
          # background image. This is a value in the closed range of 0 to 1. This value
          # represents the horizontal distance from the left side of the entire image to
          # the left side of the cropping area divided by the width of the entire image.
          # Corresponds to the JSON property `xCoordinate`
          # @return [Float]
          attr_accessor :x_coordinate
        
          # The Y coordinate of the upper left corner of the cropping area in the
          # background image. This is a value in the closed range of 0 to 1. This value
          # represents the vertical distance from the top side of the entire image to the
          # top side of the cropping area divided by the height of the entire image.
          # Corresponds to the JSON property `yCoordinate`
          # @return [Float]
          attr_accessor :y_coordinate
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @id = args[:id] if args.key?(:id)
            @width = args[:width] if args.key?(:width)
            @x_coordinate = args[:x_coordinate] if args.key?(:x_coordinate)
            @y_coordinate = args[:y_coordinate] if args.key?(:y_coordinate)
          end
        end
        
        # Capabilities the current user has on this shared drive.
        class Capabilities
          include Google::Apis::Core::Hashable
        
          # Whether the current user can add children to folders in this shared drive.
          # Corresponds to the JSON property `canAddChildren`
          # @return [Boolean]
          attr_accessor :can_add_children
          alias_method :can_add_children?, :can_add_children
        
          # Whether the current user can change the copyRequiresWriterPermission
          # restriction of this shared drive.
          # Corresponds to the JSON property `canChangeCopyRequiresWriterPermissionRestriction`
          # @return [Boolean]
          attr_accessor :can_change_copy_requires_writer_permission_restriction
          alias_method :can_change_copy_requires_writer_permission_restriction?, :can_change_copy_requires_writer_permission_restriction
        
          # Whether the current user can change the domainUsersOnly restriction of this
          # shared drive.
          # Corresponds to the JSON property `canChangeDomainUsersOnlyRestriction`
          # @return [Boolean]
          attr_accessor :can_change_domain_users_only_restriction
          alias_method :can_change_domain_users_only_restriction?, :can_change_domain_users_only_restriction
        
          # Whether the current user can change the background of this shared drive.
          # Corresponds to the JSON property `canChangeDriveBackground`
          # @return [Boolean]
          attr_accessor :can_change_drive_background
          alias_method :can_change_drive_background?, :can_change_drive_background
        
          # Whether the current user can change the driveMembersOnly restriction of this
          # shared drive.
          # Corresponds to the JSON property `canChangeDriveMembersOnlyRestriction`
          # @return [Boolean]
          attr_accessor :can_change_drive_members_only_restriction
          alias_method :can_change_drive_members_only_restriction?, :can_change_drive_members_only_restriction
        
          # Whether the current user can comment on files in this shared drive.
          # Corresponds to the JSON property `canComment`
          # @return [Boolean]
          attr_accessor :can_comment
          alias_method :can_comment?, :can_comment
        
          # Whether the current user can copy files in this shared drive.
          # Corresponds to the JSON property `canCopy`
          # @return [Boolean]
          attr_accessor :can_copy
          alias_method :can_copy?, :can_copy
        
          # Whether the current user can delete children from folders in this shared drive.
          # Corresponds to the JSON property `canDeleteChildren`
          # @return [Boolean]
          attr_accessor :can_delete_children
          alias_method :can_delete_children?, :can_delete_children
        
          # Whether the current user can delete this shared drive. Attempting to delete
          # the shared drive may still fail if there are untrashed items inside the shared
          # drive.
          # Corresponds to the JSON property `canDeleteDrive`
          # @return [Boolean]
          attr_accessor :can_delete_drive
          alias_method :can_delete_drive?, :can_delete_drive
        
          # Whether the current user can download files in this shared drive.
          # Corresponds to the JSON property `canDownload`
          # @return [Boolean]
          attr_accessor :can_download
          alias_method :can_download?, :can_download
        
          # Whether the current user can edit files in this shared drive
          # Corresponds to the JSON property `canEdit`
          # @return [Boolean]
          attr_accessor :can_edit
          alias_method :can_edit?, :can_edit
        
          # Whether the current user can list the children of folders in this shared drive.
          # Corresponds to the JSON property `canListChildren`
          # @return [Boolean]
          attr_accessor :can_list_children
          alias_method :can_list_children?, :can_list_children
        
          # Whether the current user can add members to this shared drive or remove them
          # or change their role.
          # Corresponds to the JSON property `canManageMembers`
          # @return [Boolean]
          attr_accessor :can_manage_members
          alias_method :can_manage_members?, :can_manage_members
        
          # Whether the current user can read the revisions resource of files in this
          # shared drive.
          # Corresponds to the JSON property `canReadRevisions`
          # @return [Boolean]
          attr_accessor :can_read_revisions
          alias_method :can_read_revisions?, :can_read_revisions
        
          # Whether the current user can rename files or folders in this shared drive.
          # Corresponds to the JSON property `canRename`
          # @return [Boolean]
          attr_accessor :can_rename
          alias_method :can_rename?, :can_rename
        
          # Whether the current user can rename this shared drive.
          # Corresponds to the JSON property `canRenameDrive`
          # @return [Boolean]
          attr_accessor :can_rename_drive
          alias_method :can_rename_drive?, :can_rename_drive
        
          # Whether the current user can share files or folders in this shared drive.
          # Corresponds to the JSON property `canShare`
          # @return [Boolean]
          attr_accessor :can_share
          alias_method :can_share?, :can_share
        
          # Whether the current user can trash children from folders in this shared drive.
          # Corresponds to the JSON property `canTrashChildren`
          # @return [Boolean]
          attr_accessor :can_trash_children
          alias_method :can_trash_children?, :can_trash_children
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @can_add_children = args[:can_add_children] if args.key?(:can_add_children)
            @can_change_copy_requires_writer_permission_restriction = args[:can_change_copy_requires_writer_permission_restriction] if args.key?(:can_change_copy_requires_writer_permission_restriction)
            @can_change_domain_users_only_restriction = args[:can_change_domain_users_only_restriction] if args.key?(:can_change_domain_users_only_restriction)
            @can_change_drive_background = args[:can_change_drive_background] if args.key?(:can_change_drive_background)
            @can_change_drive_members_only_restriction = args[:can_change_drive_members_only_restriction] if args.key?(:can_change_drive_members_only_restriction)
            @can_comment = args[:can_comment] if args.key?(:can_comment)
            @can_copy = args[:can_copy] if args.key?(:can_copy)
            @can_delete_children = args[:can_delete_children] if args.key?(:can_delete_children)
            @can_delete_drive = args[:can_delete_drive] if args.key?(:can_delete_drive)
            @can_download = args[:can_download] if args.key?(:can_download)
            @can_edit = args[:can_edit] if args.key?(:can_edit)
            @can_list_children = args[:can_list_children] if args.key?(:can_list_children)
            @can_manage_members = args[:can_manage_members] if args.key?(:can_manage_members)
            @can_read_revisions = args[:can_read_revisions] if args.key?(:can_read_revisions)
            @can_rename = args[:can_rename] if args.key?(:can_rename)
            @can_rename_drive = args[:can_rename_drive] if args.key?(:can_rename_drive)
            @can_share = args[:can_share] if args.key?(:can_share)
            @can_trash_children = args[:can_trash_children] if args.key?(:can_trash_children)
          end
        end
        
        # A set of restrictions that apply to this shared drive or items inside this
        # shared drive.
        class Restrictions
          include Google::Apis::Core::Hashable
        
          # Whether administrative privileges on this shared drive are required to modify
          # restrictions.
          # Corresponds to the JSON property `adminManagedRestrictions`
          # @return [Boolean]
          attr_accessor :admin_managed_restrictions
          alias_method :admin_managed_restrictions?, :admin_managed_restrictions
        
          # Whether the options to copy, print, or download files inside this shared drive,
          # should be disabled for readers and commenters. When this restriction is set
          # to true, it will override the similarly named field to true for any file
          # inside this shared drive.
          # Corresponds to the JSON property `copyRequiresWriterPermission`
          # @return [Boolean]
          attr_accessor :copy_requires_writer_permission
          alias_method :copy_requires_writer_permission?, :copy_requires_writer_permission
        
          # Whether access to this shared drive and items inside this shared drive is
          # restricted to users of the domain to which this shared drive belongs. This
          # restriction may be overridden by other sharing policies controlled outside of
          # this shared drive.
          # Corresponds to the JSON property `domainUsersOnly`
          # @return [Boolean]
          attr_accessor :domain_users_only
          alias_method :domain_users_only?, :domain_users_only
        
          # Whether access to items inside this shared drive is restricted to its members.
          # Corresponds to the JSON property `driveMembersOnly`
          # @return [Boolean]
          attr_accessor :drive_members_only
          alias_method :drive_members_only?, :drive_members_only
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @admin_managed_restrictions = args[:admin_managed_restrictions] if args.key?(:admin_managed_restrictions)
            @copy_requires_writer_permission = args[:copy_requires_writer_permission] if args.key?(:copy_requires_writer_permission)
            @domain_users_only = args[:domain_users_only] if args.key?(:domain_users_only)
            @drive_members_only = args[:drive_members_only] if args.key?(:drive_members_only)
          end
        end
      end
      
      # A list of shared drives.
      class DriveList
        include Google::Apis::Core::Hashable
      
        # The list of shared drives. If nextPageToken is populated, then this list may
        # be incomplete and an additional page of results should be fetched.
        # Corresponds to the JSON property `drives`
        # @return [Array<Google::Apis::DriveV3::Drive>]
        attr_accessor :drives
      
        # Identifies what kind of resource this is. Value: the fixed string "drive#
        # driveList".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The page token for the next page of shared drives. This will be absent if the
        # end of the list has been reached. If the token is rejected for any reason, it
        # should be discarded, and pagination should be restarted from the first page of
        # results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @drives = args[:drives] if args.key?(:drives)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The metadata for a file.
      class File
        include Google::Apis::Core::Hashable
      
        # A collection of arbitrary key-value pairs which are private to the requesting
        # app.
        # Entries with null values are cleared in update and copy requests.
        # Corresponds to the JSON property `appProperties`
        # @return [Hash<String,String>]
        attr_accessor :app_properties
      
        # Capabilities the current user has on this file. Each capability corresponds to
        # a fine-grained action that a user may take.
        # Corresponds to the JSON property `capabilities`
        # @return [Google::Apis::DriveV3::File::Capabilities]
        attr_accessor :capabilities
      
        # Additional information about the content of the file. These fields are never
        # populated in responses.
        # Corresponds to the JSON property `contentHints`
        # @return [Google::Apis::DriveV3::File::ContentHints]
        attr_accessor :content_hints
      
        # Whether the options to copy, print, or download this file, should be disabled
        # for readers and commenters.
        # Corresponds to the JSON property `copyRequiresWriterPermission`
        # @return [Boolean]
        attr_accessor :copy_requires_writer_permission
        alias_method :copy_requires_writer_permission?, :copy_requires_writer_permission
      
        # The time at which the file was created (RFC 3339 date-time).
        # Corresponds to the JSON property `createdTime`
        # @return [DateTime]
        attr_accessor :created_time
      
        # A short description of the file.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # ID of the shared drive the file resides in. Only populated for items in shared
        # drives.
        # Corresponds to the JSON property `driveId`
        # @return [String]
        attr_accessor :drive_id
      
        # Whether the file has been explicitly trashed, as opposed to recursively
        # trashed from a parent folder.
        # Corresponds to the JSON property `explicitlyTrashed`
        # @return [Boolean]
        attr_accessor :explicitly_trashed
        alias_method :explicitly_trashed?, :explicitly_trashed
      
        # Links for exporting Google Docs to specific formats.
        # Corresponds to the JSON property `exportLinks`
        # @return [Hash<String,String>]
        attr_accessor :export_links
      
        # The final component of fullFileExtension. This is only available for files
        # with binary content in Google Drive.
        # Corresponds to the JSON property `fileExtension`
        # @return [String]
        attr_accessor :file_extension
      
        # The color for a folder as an RGB hex string. The supported colors are
        # published in the folderColorPalette field of the About resource.
        # If an unsupported color is specified, the closest color in the palette will be
        # used instead.
        # Corresponds to the JSON property `folderColorRgb`
        # @return [String]
        attr_accessor :folder_color_rgb
      
        # The full file extension extracted from the name field. May contain multiple
        # concatenated extensions, such as "tar.gz". This is only available for files
        # with binary content in Google Drive.
        # This is automatically updated when the name field changes, however it is not
        # cleared if the new name does not contain a valid extension.
        # Corresponds to the JSON property `fullFileExtension`
        # @return [String]
        attr_accessor :full_file_extension
      
        # Whether there are permissions directly on this file. This field is only
        # populated for items in shared drives.
        # Corresponds to the JSON property `hasAugmentedPermissions`
        # @return [Boolean]
        attr_accessor :has_augmented_permissions
        alias_method :has_augmented_permissions?, :has_augmented_permissions
      
        # Whether this file has a thumbnail. This does not indicate whether the
        # requesting app has access to the thumbnail. To check access, look for the
        # presence of the thumbnailLink field.
        # Corresponds to the JSON property `hasThumbnail`
        # @return [Boolean]
        attr_accessor :has_thumbnail
        alias_method :has_thumbnail?, :has_thumbnail
      
        # The ID of the file's head revision. This is currently only available for files
        # with binary content in Google Drive.
        # Corresponds to the JSON property `headRevisionId`
        # @return [String]
        attr_accessor :head_revision_id
      
        # A static, unauthenticated link to the file's icon.
        # Corresponds to the JSON property `iconLink`
        # @return [String]
        attr_accessor :icon_link
      
        # The ID of the file.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Additional metadata about image media, if available.
        # Corresponds to the JSON property `imageMediaMetadata`
        # @return [Google::Apis::DriveV3::File::ImageMediaMetadata]
        attr_accessor :image_media_metadata
      
        # Whether the file was created or opened by the requesting app.
        # Corresponds to the JSON property `isAppAuthorized`
        # @return [Boolean]
        attr_accessor :is_app_authorized
        alias_method :is_app_authorized?, :is_app_authorized
      
        # Identifies what kind of resource this is. Value: the fixed string "drive#file".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Information about a Drive user.
        # Corresponds to the JSON property `lastModifyingUser`
        # @return [Google::Apis::DriveV3::User]
        attr_accessor :last_modifying_user
      
        # The MD5 checksum for the content of the file. This is only applicable to files
        # with binary content in Google Drive.
        # Corresponds to the JSON property `md5Checksum`
        # @return [String]
        attr_accessor :md5_checksum
      
        # The MIME type of the file.
        # Google Drive will attempt to automatically detect an appropriate value from
        # uploaded content if no value is provided. The value cannot be changed unless a
        # new revision is uploaded.
        # If a file is created with a Google Doc MIME type, the uploaded content will be
        # imported if possible. The supported import formats are published in the About
        # resource.
        # Corresponds to the JSON property `mimeType`
        # @return [String]
        attr_accessor :mime_type
      
        # Whether the file has been modified by this user.
        # Corresponds to the JSON property `modifiedByMe`
        # @return [Boolean]
        attr_accessor :modified_by_me
        alias_method :modified_by_me?, :modified_by_me
      
        # The last time the file was modified by the user (RFC 3339 date-time).
        # Corresponds to the JSON property `modifiedByMeTime`
        # @return [DateTime]
        attr_accessor :modified_by_me_time
      
        # The last time the file was modified by anyone (RFC 3339 date-time).
        # Note that setting modifiedTime will also update modifiedByMeTime for the user.
        # Corresponds to the JSON property `modifiedTime`
        # @return [DateTime]
        attr_accessor :modified_time
      
        # The name of the file. This is not necessarily unique within a folder. Note
        # that for immutable items such as the top level folders of shared drives, My
        # Drive root folder, and Application Data folder the name is constant.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The original filename of the uploaded content if available, or else the
        # original value of the name field. This is only available for files with binary
        # content in Google Drive.
        # Corresponds to the JSON property `originalFilename`
        # @return [String]
        attr_accessor :original_filename
      
        # Whether the user owns the file. Not populated for items in shared drives.
        # Corresponds to the JSON property `ownedByMe`
        # @return [Boolean]
        attr_accessor :owned_by_me
        alias_method :owned_by_me?, :owned_by_me
      
        # The owners of the file. Currently, only certain legacy files may have more
        # than one owner. Not populated for items in shared drives.
        # Corresponds to the JSON property `owners`
        # @return [Array<Google::Apis::DriveV3::User>]
        attr_accessor :owners
      
        # The IDs of the parent folders which contain the file.
        # If not specified as part of a create request, the file will be placed directly
        # in the user's My Drive folder. If not specified as part of a copy request, the
        # file will inherit any discoverable parents of the source file. Update requests
        # must use the addParents and removeParents parameters to modify the parents
        # list.
        # Corresponds to the JSON property `parents`
        # @return [Array<String>]
        attr_accessor :parents
      
        # List of permission IDs for users with access to this file.
        # Corresponds to the JSON property `permissionIds`
        # @return [Array<String>]
        attr_accessor :permission_ids
      
        # The full list of permissions for the file. This is only available if the
        # requesting user can share the file. Not populated for items in shared drives.
        # Corresponds to the JSON property `permissions`
        # @return [Array<Google::Apis::DriveV3::Permission>]
        attr_accessor :permissions
      
        # A collection of arbitrary key-value pairs which are visible to all apps.
        # Entries with null values are cleared in update and copy requests.
        # Corresponds to the JSON property `properties`
        # @return [Hash<String,String>]
        attr_accessor :properties
      
        # The number of storage quota bytes used by the file. This includes the head
        # revision as well as previous revisions with keepForever enabled.
        # Corresponds to the JSON property `quotaBytesUsed`
        # @return [Fixnum]
        attr_accessor :quota_bytes_used
      
        # Whether the file has been shared. Not populated for items in shared drives.
        # Corresponds to the JSON property `shared`
        # @return [Boolean]
        attr_accessor :shared
        alias_method :shared?, :shared
      
        # The time at which the file was shared with the user, if applicable (RFC 3339
        # date-time).
        # Corresponds to the JSON property `sharedWithMeTime`
        # @return [DateTime]
        attr_accessor :shared_with_me_time
      
        # Information about a Drive user.
        # Corresponds to the JSON property `sharingUser`
        # @return [Google::Apis::DriveV3::User]
        attr_accessor :sharing_user
      
        # The size of the file's content in bytes. This is only applicable to files with
        # binary content in Google Drive.
        # Corresponds to the JSON property `size`
        # @return [Fixnum]
        attr_accessor :size
      
        # The list of spaces which contain the file. The currently supported values are '
        # drive', 'appDataFolder' and 'photos'.
        # Corresponds to the JSON property `spaces`
        # @return [Array<String>]
        attr_accessor :spaces
      
        # Whether the user has starred the file.
        # Corresponds to the JSON property `starred`
        # @return [Boolean]
        attr_accessor :starred
        alias_method :starred?, :starred
      
        # Deprecated - use driveId instead.
        # Corresponds to the JSON property `teamDriveId`
        # @return [String]
        attr_accessor :team_drive_id
      
        # A short-lived link to the file's thumbnail, if available. Typically lasts on
        # the order of hours. Only populated when the requesting app can access the file'
        # s content.
        # Corresponds to the JSON property `thumbnailLink`
        # @return [String]
        attr_accessor :thumbnail_link
      
        # The thumbnail version for use in thumbnail cache invalidation.
        # Corresponds to the JSON property `thumbnailVersion`
        # @return [Fixnum]
        attr_accessor :thumbnail_version
      
        # Whether the file has been trashed, either explicitly or from a trashed parent
        # folder. Only the owner may trash a file, and other users cannot see files in
        # the owner's trash.
        # Corresponds to the JSON property `trashed`
        # @return [Boolean]
        attr_accessor :trashed
        alias_method :trashed?, :trashed
      
        # The time that the item was trashed (RFC 3339 date-time). Only populated for
        # items in shared drives.
        # Corresponds to the JSON property `trashedTime`
        # @return [DateTime]
        attr_accessor :trashed_time
      
        # Information about a Drive user.
        # Corresponds to the JSON property `trashingUser`
        # @return [Google::Apis::DriveV3::User]
        attr_accessor :trashing_user
      
        # A monotonically increasing version number for the file. This reflects every
        # change made to the file on the server, even those not visible to the user.
        # Corresponds to the JSON property `version`
        # @return [Fixnum]
        attr_accessor :version
      
        # Additional metadata about video media. This may not be available immediately
        # upon upload.
        # Corresponds to the JSON property `videoMediaMetadata`
        # @return [Google::Apis::DriveV3::File::VideoMediaMetadata]
        attr_accessor :video_media_metadata
      
        # Whether the file has been viewed by this user.
        # Corresponds to the JSON property `viewedByMe`
        # @return [Boolean]
        attr_accessor :viewed_by_me
        alias_method :viewed_by_me?, :viewed_by_me
      
        # The last time the file was viewed by the user (RFC 3339 date-time).
        # Corresponds to the JSON property `viewedByMeTime`
        # @return [DateTime]
        attr_accessor :viewed_by_me_time
      
        # Deprecated - use copyRequiresWriterPermission instead.
        # Corresponds to the JSON property `viewersCanCopyContent`
        # @return [Boolean]
        attr_accessor :viewers_can_copy_content
        alias_method :viewers_can_copy_content?, :viewers_can_copy_content
      
        # A link for downloading the content of the file in a browser. This is only
        # available for files with binary content in Google Drive.
        # Corresponds to the JSON property `webContentLink`
        # @return [String]
        attr_accessor :web_content_link
      
        # A link for opening the file in a relevant Google editor or viewer in a browser.
        # Corresponds to the JSON property `webViewLink`
        # @return [String]
        attr_accessor :web_view_link
      
        # Whether users with only writer permission can modify the file's permissions.
        # Not populated for items in shared drives.
        # Corresponds to the JSON property `writersCanShare`
        # @return [Boolean]
        attr_accessor :writers_can_share
        alias_method :writers_can_share?, :writers_can_share
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app_properties = args[:app_properties] if args.key?(:app_properties)
          @capabilities = args[:capabilities] if args.key?(:capabilities)
          @content_hints = args[:content_hints] if args.key?(:content_hints)
          @copy_requires_writer_permission = args[:copy_requires_writer_permission] if args.key?(:copy_requires_writer_permission)
          @created_time = args[:created_time] if args.key?(:created_time)
          @description = args[:description] if args.key?(:description)
          @drive_id = args[:drive_id] if args.key?(:drive_id)
          @explicitly_trashed = args[:explicitly_trashed] if args.key?(:explicitly_trashed)
          @export_links = args[:export_links] if args.key?(:export_links)
          @file_extension = args[:file_extension] if args.key?(:file_extension)
          @folder_color_rgb = args[:folder_color_rgb] if args.key?(:folder_color_rgb)
          @full_file_extension = args[:full_file_extension] if args.key?(:full_file_extension)
          @has_augmented_permissions = args[:has_augmented_permissions] if args.key?(:has_augmented_permissions)
          @has_thumbnail = args[:has_thumbnail] if args.key?(:has_thumbnail)
          @head_revision_id = args[:head_revision_id] if args.key?(:head_revision_id)
          @icon_link = args[:icon_link] if args.key?(:icon_link)
          @id = args[:id] if args.key?(:id)
          @image_media_metadata = args[:image_media_metadata] if args.key?(:image_media_metadata)
          @is_app_authorized = args[:is_app_authorized] if args.key?(:is_app_authorized)
          @kind = args[:kind] if args.key?(:kind)
          @last_modifying_user = args[:last_modifying_user] if args.key?(:last_modifying_user)
          @md5_checksum = args[:md5_checksum] if args.key?(:md5_checksum)
          @mime_type = args[:mime_type] if args.key?(:mime_type)
          @modified_by_me = args[:modified_by_me] if args.key?(:modified_by_me)
          @modified_by_me_time = args[:modified_by_me_time] if args.key?(:modified_by_me_time)
          @modified_time = args[:modified_time] if args.key?(:modified_time)
          @name = args[:name] if args.key?(:name)
          @original_filename = args[:original_filename] if args.key?(:original_filename)
          @owned_by_me = args[:owned_by_me] if args.key?(:owned_by_me)
          @owners = args[:owners] if args.key?(:owners)
          @parents = args[:parents] if args.key?(:parents)
          @permission_ids = args[:permission_ids] if args.key?(:permission_ids)
          @permissions = args[:permissions] if args.key?(:permissions)
          @properties = args[:properties] if args.key?(:properties)
          @quota_bytes_used = args[:quota_bytes_used] if args.key?(:quota_bytes_used)
          @shared = args[:shared] if args.key?(:shared)
          @shared_with_me_time = args[:shared_with_me_time] if args.key?(:shared_with_me_time)
          @sharing_user = args[:sharing_user] if args.key?(:sharing_user)
          @size = args[:size] if args.key?(:size)
          @spaces = args[:spaces] if args.key?(:spaces)
          @starred = args[:starred] if args.key?(:starred)
          @team_drive_id = args[:team_drive_id] if args.key?(:team_drive_id)
          @thumbnail_link = args[:thumbnail_link] if args.key?(:thumbnail_link)
          @thumbnail_version = args[:thumbnail_version] if args.key?(:thumbnail_version)
          @trashed = args[:trashed] if args.key?(:trashed)
          @trashed_time = args[:trashed_time] if args.key?(:trashed_time)
          @trashing_user = args[:trashing_user] if args.key?(:trashing_user)
          @version = args[:version] if args.key?(:version)
          @video_media_metadata = args[:video_media_metadata] if args.key?(:video_media_metadata)
          @viewed_by_me = args[:viewed_by_me] if args.key?(:viewed_by_me)
          @viewed_by_me_time = args[:viewed_by_me_time] if args.key?(:viewed_by_me_time)
          @viewers_can_copy_content = args[:viewers_can_copy_content] if args.key?(:viewers_can_copy_content)
          @web_content_link = args[:web_content_link] if args.key?(:web_content_link)
          @web_view_link = args[:web_view_link] if args.key?(:web_view_link)
          @writers_can_share = args[:writers_can_share] if args.key?(:writers_can_share)
        end
        
        # Capabilities the current user has on this file. Each capability corresponds to
        # a fine-grained action that a user may take.
        class Capabilities
          include Google::Apis::Core::Hashable
        
          # Whether the current user can add children to this folder. This is always false
          # when the item is not a folder.
          # Corresponds to the JSON property `canAddChildren`
          # @return [Boolean]
          attr_accessor :can_add_children
          alias_method :can_add_children?, :can_add_children
        
          # Whether the current user can change the copyRequiresWriterPermission
          # restriction of this file.
          # Corresponds to the JSON property `canChangeCopyRequiresWriterPermission`
          # @return [Boolean]
          attr_accessor :can_change_copy_requires_writer_permission
          alias_method :can_change_copy_requires_writer_permission?, :can_change_copy_requires_writer_permission
        
          # Deprecated
          # Corresponds to the JSON property `canChangeViewersCanCopyContent`
          # @return [Boolean]
          attr_accessor :can_change_viewers_can_copy_content
          alias_method :can_change_viewers_can_copy_content?, :can_change_viewers_can_copy_content
        
          # Whether the current user can comment on this file.
          # Corresponds to the JSON property `canComment`
          # @return [Boolean]
          attr_accessor :can_comment
          alias_method :can_comment?, :can_comment
        
          # Whether the current user can copy this file. For an item in a shared drive,
          # whether the current user can copy non-folder descendants of this item, or this
          # item itself if it is not a folder.
          # Corresponds to the JSON property `canCopy`
          # @return [Boolean]
          attr_accessor :can_copy
          alias_method :can_copy?, :can_copy
        
          # Whether the current user can delete this file.
          # Corresponds to the JSON property `canDelete`
          # @return [Boolean]
          attr_accessor :can_delete
          alias_method :can_delete?, :can_delete
        
          # Whether the current user can delete children of this folder. This is false
          # when the item is not a folder. Only populated for items in shared drives.
          # Corresponds to the JSON property `canDeleteChildren`
          # @return [Boolean]
          attr_accessor :can_delete_children
          alias_method :can_delete_children?, :can_delete_children
        
          # Whether the current user can download this file.
          # Corresponds to the JSON property `canDownload`
          # @return [Boolean]
          attr_accessor :can_download
          alias_method :can_download?, :can_download
        
          # Whether the current user can edit this file. Other factors may limit the type
          # of changes a user can make to a file. For example, see
          # canChangeCopyRequiresWriterPermission or canModifyContent.
          # Corresponds to the JSON property `canEdit`
          # @return [Boolean]
          attr_accessor :can_edit
          alias_method :can_edit?, :can_edit
        
          # Whether the current user can list the children of this folder. This is always
          # false when the item is not a folder.
          # Corresponds to the JSON property `canListChildren`
          # @return [Boolean]
          attr_accessor :can_list_children
          alias_method :can_list_children?, :can_list_children
        
          # Whether the current user can modify the content of this file.
          # Corresponds to the JSON property `canModifyContent`
          # @return [Boolean]
          attr_accessor :can_modify_content
          alias_method :can_modify_content?, :can_modify_content
        
          # Whether the current user can move children of this folder outside of the
          # shared drive. This is false when the item is not a folder. Only populated for
          # items in shared drives.
          # Corresponds to the JSON property `canMoveChildrenOutOfDrive`
          # @return [Boolean]
          attr_accessor :can_move_children_out_of_drive
          alias_method :can_move_children_out_of_drive?, :can_move_children_out_of_drive
        
          # Deprecated - use canMoveChildrenOutOfDrive instead.
          # Corresponds to the JSON property `canMoveChildrenOutOfTeamDrive`
          # @return [Boolean]
          attr_accessor :can_move_children_out_of_team_drive
          alias_method :can_move_children_out_of_team_drive?, :can_move_children_out_of_team_drive
        
          # Whether the current user can move children of this folder within the shared
          # drive. This is false when the item is not a folder. Only populated for items
          # in shared drives.
          # Corresponds to the JSON property `canMoveChildrenWithinDrive`
          # @return [Boolean]
          attr_accessor :can_move_children_within_drive
          alias_method :can_move_children_within_drive?, :can_move_children_within_drive
        
          # Deprecated - use canMoveChildrenWithinDrive instead.
          # Corresponds to the JSON property `canMoveChildrenWithinTeamDrive`
          # @return [Boolean]
          attr_accessor :can_move_children_within_team_drive
          alias_method :can_move_children_within_team_drive?, :can_move_children_within_team_drive
        
          # Deprecated - use canMoveItemOutOfDrive instead.
          # Corresponds to the JSON property `canMoveItemIntoTeamDrive`
          # @return [Boolean]
          attr_accessor :can_move_item_into_team_drive
          alias_method :can_move_item_into_team_drive?, :can_move_item_into_team_drive
        
          # Whether the current user can move this item outside of this drive by changing
          # its parent. Note that a request to change the parent of the item may still
          # fail depending on the new parent that is being added.
          # Corresponds to the JSON property `canMoveItemOutOfDrive`
          # @return [Boolean]
          attr_accessor :can_move_item_out_of_drive
          alias_method :can_move_item_out_of_drive?, :can_move_item_out_of_drive
        
          # Deprecated - use canMoveItemOutOfDrive instead.
          # Corresponds to the JSON property `canMoveItemOutOfTeamDrive`
          # @return [Boolean]
          attr_accessor :can_move_item_out_of_team_drive
          alias_method :can_move_item_out_of_team_drive?, :can_move_item_out_of_team_drive
        
          # Whether the current user can move this item within this shared drive. Note
          # that a request to change the parent of the item may still fail depending on
          # the new parent that is being added. Only populated for items in shared drives.
          # Corresponds to the JSON property `canMoveItemWithinDrive`
          # @return [Boolean]
          attr_accessor :can_move_item_within_drive
          alias_method :can_move_item_within_drive?, :can_move_item_within_drive
        
          # Deprecated - use canMoveItemWithinDrive instead.
          # Corresponds to the JSON property `canMoveItemWithinTeamDrive`
          # @return [Boolean]
          attr_accessor :can_move_item_within_team_drive
          alias_method :can_move_item_within_team_drive?, :can_move_item_within_team_drive
        
          # Deprecated - use canMoveItemWithinDrive or canMoveItemOutOfDrive instead.
          # Corresponds to the JSON property `canMoveTeamDriveItem`
          # @return [Boolean]
          attr_accessor :can_move_team_drive_item
          alias_method :can_move_team_drive_item?, :can_move_team_drive_item
        
          # Whether the current user can read the shared drive to which this file belongs.
          # Only populated for items in shared drives.
          # Corresponds to the JSON property `canReadDrive`
          # @return [Boolean]
          attr_accessor :can_read_drive
          alias_method :can_read_drive?, :can_read_drive
        
          # Whether the current user can read the revisions resource of this file. For a
          # shared drive item, whether revisions of non-folder descendants of this item,
          # or this item itself if it is not a folder, can be read.
          # Corresponds to the JSON property `canReadRevisions`
          # @return [Boolean]
          attr_accessor :can_read_revisions
          alias_method :can_read_revisions?, :can_read_revisions
        
          # Deprecated - use canReadDrive instead.
          # Corresponds to the JSON property `canReadTeamDrive`
          # @return [Boolean]
          attr_accessor :can_read_team_drive
          alias_method :can_read_team_drive?, :can_read_team_drive
        
          # Whether the current user can remove children from this folder. This is always
          # false when the item is not a folder. For a folder in a shared drive, use
          # canDeleteChildren or canTrashChildren instead.
          # Corresponds to the JSON property `canRemoveChildren`
          # @return [Boolean]
          attr_accessor :can_remove_children
          alias_method :can_remove_children?, :can_remove_children
        
          # Whether the current user can rename this file.
          # Corresponds to the JSON property `canRename`
          # @return [Boolean]
          attr_accessor :can_rename
          alias_method :can_rename?, :can_rename
        
          # Whether the current user can modify the sharing settings for this file.
          # Corresponds to the JSON property `canShare`
          # @return [Boolean]
          attr_accessor :can_share
          alias_method :can_share?, :can_share
        
          # Whether the current user can move this file to trash.
          # Corresponds to the JSON property `canTrash`
          # @return [Boolean]
          attr_accessor :can_trash
          alias_method :can_trash?, :can_trash
        
          # Whether the current user can trash children of this folder. This is false when
          # the item is not a folder. Only populated for items in shared drives.
          # Corresponds to the JSON property `canTrashChildren`
          # @return [Boolean]
          attr_accessor :can_trash_children
          alias_method :can_trash_children?, :can_trash_children
        
          # Whether the current user can restore this file from trash.
          # Corresponds to the JSON property `canUntrash`
          # @return [Boolean]
          attr_accessor :can_untrash
          alias_method :can_untrash?, :can_untrash
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @can_add_children = args[:can_add_children] if args.key?(:can_add_children)
            @can_change_copy_requires_writer_permission = args[:can_change_copy_requires_writer_permission] if args.key?(:can_change_copy_requires_writer_permission)
            @can_change_viewers_can_copy_content = args[:can_change_viewers_can_copy_content] if args.key?(:can_change_viewers_can_copy_content)
            @can_comment = args[:can_comment] if args.key?(:can_comment)
            @can_copy = args[:can_copy] if args.key?(:can_copy)
            @can_delete = args[:can_delete] if args.key?(:can_delete)
            @can_delete_children = args[:can_delete_children] if args.key?(:can_delete_children)
            @can_download = args[:can_download] if args.key?(:can_download)
            @can_edit = args[:can_edit] if args.key?(:can_edit)
            @can_list_children = args[:can_list_children] if args.key?(:can_list_children)
            @can_modify_content = args[:can_modify_content] if args.key?(:can_modify_content)
            @can_move_children_out_of_drive = args[:can_move_children_out_of_drive] if args.key?(:can_move_children_out_of_drive)
            @can_move_children_out_of_team_drive = args[:can_move_children_out_of_team_drive] if args.key?(:can_move_children_out_of_team_drive)
            @can_move_children_within_drive = args[:can_move_children_within_drive] if args.key?(:can_move_children_within_drive)
            @can_move_children_within_team_drive = args[:can_move_children_within_team_drive] if args.key?(:can_move_children_within_team_drive)
            @can_move_item_into_team_drive = args[:can_move_item_into_team_drive] if args.key?(:can_move_item_into_team_drive)
            @can_move_item_out_of_drive = args[:can_move_item_out_of_drive] if args.key?(:can_move_item_out_of_drive)
            @can_move_item_out_of_team_drive = args[:can_move_item_out_of_team_drive] if args.key?(:can_move_item_out_of_team_drive)
            @can_move_item_within_drive = args[:can_move_item_within_drive] if args.key?(:can_move_item_within_drive)
            @can_move_item_within_team_drive = args[:can_move_item_within_team_drive] if args.key?(:can_move_item_within_team_drive)
            @can_move_team_drive_item = args[:can_move_team_drive_item] if args.key?(:can_move_team_drive_item)
            @can_read_drive = args[:can_read_drive] if args.key?(:can_read_drive)
            @can_read_revisions = args[:can_read_revisions] if args.key?(:can_read_revisions)
            @can_read_team_drive = args[:can_read_team_drive] if args.key?(:can_read_team_drive)
            @can_remove_children = args[:can_remove_children] if args.key?(:can_remove_children)
            @can_rename = args[:can_rename] if args.key?(:can_rename)
            @can_share = args[:can_share] if args.key?(:can_share)
            @can_trash = args[:can_trash] if args.key?(:can_trash)
            @can_trash_children = args[:can_trash_children] if args.key?(:can_trash_children)
            @can_untrash = args[:can_untrash] if args.key?(:can_untrash)
          end
        end
        
        # Additional information about the content of the file. These fields are never
        # populated in responses.
        class ContentHints
          include Google::Apis::Core::Hashable
        
          # Text to be indexed for the file to improve fullText queries. This is limited
          # to 128KB in length and may contain HTML elements.
          # Corresponds to the JSON property `indexableText`
          # @return [String]
          attr_accessor :indexable_text
        
          # A thumbnail for the file. This will only be used if Google Drive cannot
          # generate a standard thumbnail.
          # Corresponds to the JSON property `thumbnail`
          # @return [Google::Apis::DriveV3::File::ContentHints::Thumbnail]
          attr_accessor :thumbnail
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @indexable_text = args[:indexable_text] if args.key?(:indexable_text)
            @thumbnail = args[:thumbnail] if args.key?(:thumbnail)
          end
          
          # A thumbnail for the file. This will only be used if Google Drive cannot
          # generate a standard thumbnail.
          class Thumbnail
            include Google::Apis::Core::Hashable
          
            # The thumbnail data encoded with URL-safe Base64 (RFC 4648 section 5).
            # Corresponds to the JSON property `image`
            # NOTE: Values are automatically base64 encoded/decoded in the client library.
            # @return [String]
            attr_accessor :image
          
            # The MIME type of the thumbnail.
            # Corresponds to the JSON property `mimeType`
            # @return [String]
            attr_accessor :mime_type
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @image = args[:image] if args.key?(:image)
              @mime_type = args[:mime_type] if args.key?(:mime_type)
            end
          end
        end
        
        # Additional metadata about image media, if available.
        class ImageMediaMetadata
          include Google::Apis::Core::Hashable
        
          # The aperture used to create the photo (f-number).
          # Corresponds to the JSON property `aperture`
          # @return [Float]
          attr_accessor :aperture
        
          # The make of the camera used to create the photo.
          # Corresponds to the JSON property `cameraMake`
          # @return [String]
          attr_accessor :camera_make
        
          # The model of the camera used to create the photo.
          # Corresponds to the JSON property `cameraModel`
          # @return [String]
          attr_accessor :camera_model
        
          # The color space of the photo.
          # Corresponds to the JSON property `colorSpace`
          # @return [String]
          attr_accessor :color_space
        
          # The exposure bias of the photo (APEX value).
          # Corresponds to the JSON property `exposureBias`
          # @return [Float]
          attr_accessor :exposure_bias
        
          # The exposure mode used to create the photo.
          # Corresponds to the JSON property `exposureMode`
          # @return [String]
          attr_accessor :exposure_mode
        
          # The length of the exposure, in seconds.
          # Corresponds to the JSON property `exposureTime`
          # @return [Float]
          attr_accessor :exposure_time
        
          # Whether a flash was used to create the photo.
          # Corresponds to the JSON property `flashUsed`
          # @return [Boolean]
          attr_accessor :flash_used
          alias_method :flash_used?, :flash_used
        
          # The focal length used to create the photo, in millimeters.
          # Corresponds to the JSON property `focalLength`
          # @return [Float]
          attr_accessor :focal_length
        
          # The height of the image in pixels.
          # Corresponds to the JSON property `height`
          # @return [Fixnum]
          attr_accessor :height
        
          # The ISO speed used to create the photo.
          # Corresponds to the JSON property `isoSpeed`
          # @return [Fixnum]
          attr_accessor :iso_speed
        
          # The lens used to create the photo.
          # Corresponds to the JSON property `lens`
          # @return [String]
          attr_accessor :lens
        
          # Geographic location information stored in the image.
          # Corresponds to the JSON property `location`
          # @return [Google::Apis::DriveV3::File::ImageMediaMetadata::Location]
          attr_accessor :location
        
          # The smallest f-number of the lens at the focal length used to create the photo
          # (APEX value).
          # Corresponds to the JSON property `maxApertureValue`
          # @return [Float]
          attr_accessor :max_aperture_value
        
          # The metering mode used to create the photo.
          # Corresponds to the JSON property `meteringMode`
          # @return [String]
          attr_accessor :metering_mode
        
          # The rotation in clockwise degrees from the image's original orientation.
          # Corresponds to the JSON property `rotation`
          # @return [Fixnum]
          attr_accessor :rotation
        
          # The type of sensor used to create the photo.
          # Corresponds to the JSON property `sensor`
          # @return [String]
          attr_accessor :sensor
        
          # The distance to the subject of the photo, in meters.
          # Corresponds to the JSON property `subjectDistance`
          # @return [Fixnum]
          attr_accessor :subject_distance
        
          # The date and time the photo was taken (EXIF DateTime).
          # Corresponds to the JSON property `time`
          # @return [String]
          attr_accessor :time
        
          # The white balance mode used to create the photo.
          # Corresponds to the JSON property `whiteBalance`
          # @return [String]
          attr_accessor :white_balance
        
          # The width of the image in pixels.
          # Corresponds to the JSON property `width`
          # @return [Fixnum]
          attr_accessor :width
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @aperture = args[:aperture] if args.key?(:aperture)
            @camera_make = args[:camera_make] if args.key?(:camera_make)
            @camera_model = args[:camera_model] if args.key?(:camera_model)
            @color_space = args[:color_space] if args.key?(:color_space)
            @exposure_bias = args[:exposure_bias] if args.key?(:exposure_bias)
            @exposure_mode = args[:exposure_mode] if args.key?(:exposure_mode)
            @exposure_time = args[:exposure_time] if args.key?(:exposure_time)
            @flash_used = args[:flash_used] if args.key?(:flash_used)
            @focal_length = args[:focal_length] if args.key?(:focal_length)
            @height = args[:height] if args.key?(:height)
            @iso_speed = args[:iso_speed] if args.key?(:iso_speed)
            @lens = args[:lens] if args.key?(:lens)
            @location = args[:location] if args.key?(:location)
            @max_aperture_value = args[:max_aperture_value] if args.key?(:max_aperture_value)
            @metering_mode = args[:metering_mode] if args.key?(:metering_mode)
            @rotation = args[:rotation] if args.key?(:rotation)
            @sensor = args[:sensor] if args.key?(:sensor)
            @subject_distance = args[:subject_distance] if args.key?(:subject_distance)
            @time = args[:time] if args.key?(:time)
            @white_balance = args[:white_balance] if args.key?(:white_balance)
            @width = args[:width] if args.key?(:width)
          end
          
          # Geographic location information stored in the image.
          class Location
            include Google::Apis::Core::Hashable
          
            # The altitude stored in the image.
            # Corresponds to the JSON property `altitude`
            # @return [Float]
            attr_accessor :altitude
          
            # The latitude stored in the image.
            # Corresponds to the JSON property `latitude`
            # @return [Float]
            attr_accessor :latitude
          
            # The longitude stored in the image.
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
        end
        
        # Additional metadata about video media. This may not be available immediately
        # upon upload.
        class VideoMediaMetadata
          include Google::Apis::Core::Hashable
        
          # The duration of the video in milliseconds.
          # Corresponds to the JSON property `durationMillis`
          # @return [Fixnum]
          attr_accessor :duration_millis
        
          # The height of the video in pixels.
          # Corresponds to the JSON property `height`
          # @return [Fixnum]
          attr_accessor :height
        
          # The width of the video in pixels.
          # Corresponds to the JSON property `width`
          # @return [Fixnum]
          attr_accessor :width
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @duration_millis = args[:duration_millis] if args.key?(:duration_millis)
            @height = args[:height] if args.key?(:height)
            @width = args[:width] if args.key?(:width)
          end
        end
      end
      
      # A list of files.
      class FileList
        include Google::Apis::Core::Hashable
      
        # The list of files. If nextPageToken is populated, then this list may be
        # incomplete and an additional page of results should be fetched.
        # Corresponds to the JSON property `files`
        # @return [Array<Google::Apis::DriveV3::File>]
        attr_accessor :files
      
        # Whether the search process was incomplete. If true, then some search results
        # may be missing, since all documents were not searched. This may occur when
        # searching multiple drives with the "allDrives" corpora, but all corpora could
        # not be searched. When this happens, it is suggested that clients narrow their
        # query by choosing a different corpus such as "user" or "drive".
        # Corresponds to the JSON property `incompleteSearch`
        # @return [Boolean]
        attr_accessor :incomplete_search
        alias_method :incomplete_search?, :incomplete_search
      
        # Identifies what kind of resource this is. Value: the fixed string "drive#
        # fileList".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The page token for the next page of files. This will be absent if the end of
        # the files list has been reached. If the token is rejected for any reason, it
        # should be discarded, and pagination should be restarted from the first page of
        # results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @files = args[:files] if args.key?(:files)
          @incomplete_search = args[:incomplete_search] if args.key?(:incomplete_search)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # A list of generated file IDs which can be provided in create requests.
      class GeneratedIds
        include Google::Apis::Core::Hashable
      
        # The IDs generated for the requesting user in the specified space.
        # Corresponds to the JSON property `ids`
        # @return [Array<String>]
        attr_accessor :ids
      
        # Identifies what kind of resource this is. Value: the fixed string "drive#
        # generatedIds".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The type of file that can be created with these IDs.
        # Corresponds to the JSON property `space`
        # @return [String]
        attr_accessor :space
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ids = args[:ids] if args.key?(:ids)
          @kind = args[:kind] if args.key?(:kind)
          @space = args[:space] if args.key?(:space)
        end
      end
      
      # A permission for a file. A permission grants a user, group, domain or the
      # world access to a file or a folder hierarchy.
      class Permission
        include Google::Apis::Core::Hashable
      
        # Whether the permission allows the file to be discovered through search. This
        # is only applicable for permissions of type domain or anyone.
        # Corresponds to the JSON property `allowFileDiscovery`
        # @return [Boolean]
        attr_accessor :allow_file_discovery
        alias_method :allow_file_discovery?, :allow_file_discovery
      
        # Whether the account associated with this permission has been deleted. This
        # field only pertains to user and group permissions.
        # Corresponds to the JSON property `deleted`
        # @return [Boolean]
        attr_accessor :deleted
        alias_method :deleted?, :deleted
      
        # A displayable name for users, groups or domains.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The domain to which this permission refers.
        # Corresponds to the JSON property `domain`
        # @return [String]
        attr_accessor :domain
      
        # The email address of the user or group to which this permission refers.
        # Corresponds to the JSON property `emailAddress`
        # @return [String]
        attr_accessor :email_address
      
        # The time at which this permission will expire (RFC 3339 date-time). Expiration
        # times have the following restrictions:
        # - They can only be set on user and group permissions
        # - The time must be in the future
        # - The time cannot be more than a year in the future
        # Corresponds to the JSON property `expirationTime`
        # @return [DateTime]
        attr_accessor :expiration_time
      
        # The ID of this permission. This is a unique identifier for the grantee, and is
        # published in User resources as permissionId.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "drive#
        # permission".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Details of whether the permissions on this shared drive item are inherited or
        # directly on this item. This is an output-only field which is present only for
        # shared drive items.
        # Corresponds to the JSON property `permissionDetails`
        # @return [Array<Google::Apis::DriveV3::Permission::PermissionDetail>]
        attr_accessor :permission_details
      
        # A link to the user's profile photo, if available.
        # Corresponds to the JSON property `photoLink`
        # @return [String]
        attr_accessor :photo_link
      
        # The role granted by this permission. While new values may be supported in the
        # future, the following are currently allowed:
        # - owner
        # - organizer
        # - fileOrganizer
        # - writer
        # - commenter
        # - reader
        # Corresponds to the JSON property `role`
        # @return [String]
        attr_accessor :role
      
        # Deprecated - use permissionDetails instead.
        # Corresponds to the JSON property `teamDrivePermissionDetails`
        # @return [Array<Google::Apis::DriveV3::Permission::TeamDrivePermissionDetail>]
        attr_accessor :team_drive_permission_details
      
        # The type of the grantee. Valid values are:
        # - user
        # - group
        # - domain
        # - anyone
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @allow_file_discovery = args[:allow_file_discovery] if args.key?(:allow_file_discovery)
          @deleted = args[:deleted] if args.key?(:deleted)
          @display_name = args[:display_name] if args.key?(:display_name)
          @domain = args[:domain] if args.key?(:domain)
          @email_address = args[:email_address] if args.key?(:email_address)
          @expiration_time = args[:expiration_time] if args.key?(:expiration_time)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @permission_details = args[:permission_details] if args.key?(:permission_details)
          @photo_link = args[:photo_link] if args.key?(:photo_link)
          @role = args[:role] if args.key?(:role)
          @team_drive_permission_details = args[:team_drive_permission_details] if args.key?(:team_drive_permission_details)
          @type = args[:type] if args.key?(:type)
        end
        
        # 
        class PermissionDetail
          include Google::Apis::Core::Hashable
        
          # Whether this permission is inherited. This field is always populated. This is
          # an output-only field.
          # Corresponds to the JSON property `inherited`
          # @return [Boolean]
          attr_accessor :inherited
          alias_method :inherited?, :inherited
        
          # The ID of the item from which this permission is inherited. This is an output-
          # only field and is only populated for members of the shared drive.
          # Corresponds to the JSON property `inheritedFrom`
          # @return [String]
          attr_accessor :inherited_from
        
          # The permission type for this user. While new values may be added in future,
          # the following are currently possible:
          # - file
          # - member
          # Corresponds to the JSON property `permissionType`
          # @return [String]
          attr_accessor :permission_type
        
          # The primary role for this user. While new values may be added in the future,
          # the following are currently possible:
          # - organizer
          # - fileOrganizer
          # - writer
          # - commenter
          # - reader
          # Corresponds to the JSON property `role`
          # @return [String]
          attr_accessor :role
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @inherited = args[:inherited] if args.key?(:inherited)
            @inherited_from = args[:inherited_from] if args.key?(:inherited_from)
            @permission_type = args[:permission_type] if args.key?(:permission_type)
            @role = args[:role] if args.key?(:role)
          end
        end
        
        # 
        class TeamDrivePermissionDetail
          include Google::Apis::Core::Hashable
        
          # Deprecated - use permissionDetails/inherited instead.
          # Corresponds to the JSON property `inherited`
          # @return [Boolean]
          attr_accessor :inherited
          alias_method :inherited?, :inherited
        
          # Deprecated - use permissionDetails/inheritedFrom instead.
          # Corresponds to the JSON property `inheritedFrom`
          # @return [String]
          attr_accessor :inherited_from
        
          # Deprecated - use permissionDetails/role instead.
          # Corresponds to the JSON property `role`
          # @return [String]
          attr_accessor :role
        
          # Deprecated - use permissionDetails/permissionType instead.
          # Corresponds to the JSON property `teamDrivePermissionType`
          # @return [String]
          attr_accessor :team_drive_permission_type
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @inherited = args[:inherited] if args.key?(:inherited)
            @inherited_from = args[:inherited_from] if args.key?(:inherited_from)
            @role = args[:role] if args.key?(:role)
            @team_drive_permission_type = args[:team_drive_permission_type] if args.key?(:team_drive_permission_type)
          end
        end
      end
      
      # A list of permissions for a file.
      class PermissionList
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "drive#
        # permissionList".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The page token for the next page of permissions. This field will be absent if
        # the end of the permissions list has been reached. If the token is rejected for
        # any reason, it should be discarded, and pagination should be restarted from
        # the first page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The list of permissions. If nextPageToken is populated, then this list may be
        # incomplete and an additional page of results should be fetched.
        # Corresponds to the JSON property `permissions`
        # @return [Array<Google::Apis::DriveV3::Permission>]
        attr_accessor :permissions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @permissions = args[:permissions] if args.key?(:permissions)
        end
      end
      
      # A reply to a comment on a file.
      class Reply
        include Google::Apis::Core::Hashable
      
        # The action the reply performed to the parent comment. Valid values are:
        # - resolve
        # - reopen
        # Corresponds to the JSON property `action`
        # @return [String]
        attr_accessor :action
      
        # Information about a Drive user.
        # Corresponds to the JSON property `author`
        # @return [Google::Apis::DriveV3::User]
        attr_accessor :author
      
        # The plain text content of the reply. This field is used for setting the
        # content, while htmlContent should be displayed. This is required on creates if
        # no action is specified.
        # Corresponds to the JSON property `content`
        # @return [String]
        attr_accessor :content
      
        # The time at which the reply was created (RFC 3339 date-time).
        # Corresponds to the JSON property `createdTime`
        # @return [DateTime]
        attr_accessor :created_time
      
        # Whether the reply has been deleted. A deleted reply has no content.
        # Corresponds to the JSON property `deleted`
        # @return [Boolean]
        attr_accessor :deleted
        alias_method :deleted?, :deleted
      
        # The content of the reply with HTML formatting.
        # Corresponds to the JSON property `htmlContent`
        # @return [String]
        attr_accessor :html_content
      
        # The ID of the reply.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "drive#reply"
        # .
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The last time the reply was modified (RFC 3339 date-time).
        # Corresponds to the JSON property `modifiedTime`
        # @return [DateTime]
        attr_accessor :modified_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action = args[:action] if args.key?(:action)
          @author = args[:author] if args.key?(:author)
          @content = args[:content] if args.key?(:content)
          @created_time = args[:created_time] if args.key?(:created_time)
          @deleted = args[:deleted] if args.key?(:deleted)
          @html_content = args[:html_content] if args.key?(:html_content)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @modified_time = args[:modified_time] if args.key?(:modified_time)
        end
      end
      
      # A list of replies to a comment on a file.
      class ReplyList
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "drive#
        # replyList".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The page token for the next page of replies. This will be absent if the end of
        # the replies list has been reached. If the token is rejected for any reason, it
        # should be discarded, and pagination should be restarted from the first page of
        # results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The list of replies. If nextPageToken is populated, then this list may be
        # incomplete and an additional page of results should be fetched.
        # Corresponds to the JSON property `replies`
        # @return [Array<Google::Apis::DriveV3::Reply>]
        attr_accessor :replies
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @replies = args[:replies] if args.key?(:replies)
        end
      end
      
      # The metadata for a revision to a file.
      class Revision
        include Google::Apis::Core::Hashable
      
        # Links for exporting Google Docs to specific formats.
        # Corresponds to the JSON property `exportLinks`
        # @return [Hash<String,String>]
        attr_accessor :export_links
      
        # The ID of the revision.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Whether to keep this revision forever, even if it is no longer the head
        # revision. If not set, the revision will be automatically purged 30 days after
        # newer content is uploaded. This can be set on a maximum of 200 revisions for a
        # file.
        # This field is only applicable to files with binary content in Drive.
        # Corresponds to the JSON property `keepForever`
        # @return [Boolean]
        attr_accessor :keep_forever
        alias_method :keep_forever?, :keep_forever
      
        # Identifies what kind of resource this is. Value: the fixed string "drive#
        # revision".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Information about a Drive user.
        # Corresponds to the JSON property `lastModifyingUser`
        # @return [Google::Apis::DriveV3::User]
        attr_accessor :last_modifying_user
      
        # The MD5 checksum of the revision's content. This is only applicable to files
        # with binary content in Drive.
        # Corresponds to the JSON property `md5Checksum`
        # @return [String]
        attr_accessor :md5_checksum
      
        # The MIME type of the revision.
        # Corresponds to the JSON property `mimeType`
        # @return [String]
        attr_accessor :mime_type
      
        # The last time the revision was modified (RFC 3339 date-time).
        # Corresponds to the JSON property `modifiedTime`
        # @return [DateTime]
        attr_accessor :modified_time
      
        # The original filename used to create this revision. This is only applicable to
        # files with binary content in Drive.
        # Corresponds to the JSON property `originalFilename`
        # @return [String]
        attr_accessor :original_filename
      
        # Whether subsequent revisions will be automatically republished. This is only
        # applicable to Google Docs.
        # Corresponds to the JSON property `publishAuto`
        # @return [Boolean]
        attr_accessor :publish_auto
        alias_method :publish_auto?, :publish_auto
      
        # Whether this revision is published. This is only applicable to Google Docs.
        # Corresponds to the JSON property `published`
        # @return [Boolean]
        attr_accessor :published
        alias_method :published?, :published
      
        # Whether this revision is published outside the domain. This is only applicable
        # to Google Docs.
        # Corresponds to the JSON property `publishedOutsideDomain`
        # @return [Boolean]
        attr_accessor :published_outside_domain
        alias_method :published_outside_domain?, :published_outside_domain
      
        # The size of the revision's content in bytes. This is only applicable to files
        # with binary content in Drive.
        # Corresponds to the JSON property `size`
        # @return [Fixnum]
        attr_accessor :size
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @export_links = args[:export_links] if args.key?(:export_links)
          @id = args[:id] if args.key?(:id)
          @keep_forever = args[:keep_forever] if args.key?(:keep_forever)
          @kind = args[:kind] if args.key?(:kind)
          @last_modifying_user = args[:last_modifying_user] if args.key?(:last_modifying_user)
          @md5_checksum = args[:md5_checksum] if args.key?(:md5_checksum)
          @mime_type = args[:mime_type] if args.key?(:mime_type)
          @modified_time = args[:modified_time] if args.key?(:modified_time)
          @original_filename = args[:original_filename] if args.key?(:original_filename)
          @publish_auto = args[:publish_auto] if args.key?(:publish_auto)
          @published = args[:published] if args.key?(:published)
          @published_outside_domain = args[:published_outside_domain] if args.key?(:published_outside_domain)
          @size = args[:size] if args.key?(:size)
        end
      end
      
      # A list of revisions of a file.
      class RevisionList
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "drive#
        # revisionList".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The page token for the next page of revisions. This will be absent if the end
        # of the revisions list has been reached. If the token is rejected for any
        # reason, it should be discarded, and pagination should be restarted from the
        # first page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The list of revisions. If nextPageToken is populated, then this list may be
        # incomplete and an additional page of results should be fetched.
        # Corresponds to the JSON property `revisions`
        # @return [Array<Google::Apis::DriveV3::Revision>]
        attr_accessor :revisions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @revisions = args[:revisions] if args.key?(:revisions)
        end
      end
      
      # 
      class StartPageToken
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "drive#
        # startPageToken".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The starting page token for listing changes.
        # Corresponds to the JSON property `startPageToken`
        # @return [String]
        attr_accessor :start_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @start_page_token = args[:start_page_token] if args.key?(:start_page_token)
        end
      end
      
      # Deprecated: use the drive collection instead.
      class TeamDrive
        include Google::Apis::Core::Hashable
      
        # An image file and cropping parameters from which a background image for this
        # Team Drive is set. This is a write only field; it can only be set on drive.
        # teamdrives.update requests that don't set themeId. When specified, all fields
        # of the backgroundImageFile must be set.
        # Corresponds to the JSON property `backgroundImageFile`
        # @return [Google::Apis::DriveV3::TeamDrive::BackgroundImageFile]
        attr_accessor :background_image_file
      
        # A short-lived link to this Team Drive's background image.
        # Corresponds to the JSON property `backgroundImageLink`
        # @return [String]
        attr_accessor :background_image_link
      
        # Capabilities the current user has on this Team Drive.
        # Corresponds to the JSON property `capabilities`
        # @return [Google::Apis::DriveV3::TeamDrive::Capabilities]
        attr_accessor :capabilities
      
        # The color of this Team Drive as an RGB hex string. It can only be set on a
        # drive.teamdrives.update request that does not set themeId.
        # Corresponds to the JSON property `colorRgb`
        # @return [String]
        attr_accessor :color_rgb
      
        # The time at which the Team Drive was created (RFC 3339 date-time).
        # Corresponds to the JSON property `createdTime`
        # @return [DateTime]
        attr_accessor :created_time
      
        # The ID of this Team Drive which is also the ID of the top level folder of this
        # Team Drive.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "drive#
        # teamDrive".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The name of this Team Drive.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # A set of restrictions that apply to this Team Drive or items inside this Team
        # Drive.
        # Corresponds to the JSON property `restrictions`
        # @return [Google::Apis::DriveV3::TeamDrive::Restrictions]
        attr_accessor :restrictions
      
        # The ID of the theme from which the background image and color will be set. The
        # set of possible teamDriveThemes can be retrieved from a drive.about.get
        # response. When not specified on a drive.teamdrives.create request, a random
        # theme is chosen from which the background image and color are set. This is a
        # write-only field; it can only be set on requests that don't set colorRgb or
        # backgroundImageFile.
        # Corresponds to the JSON property `themeId`
        # @return [String]
        attr_accessor :theme_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @background_image_file = args[:background_image_file] if args.key?(:background_image_file)
          @background_image_link = args[:background_image_link] if args.key?(:background_image_link)
          @capabilities = args[:capabilities] if args.key?(:capabilities)
          @color_rgb = args[:color_rgb] if args.key?(:color_rgb)
          @created_time = args[:created_time] if args.key?(:created_time)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @restrictions = args[:restrictions] if args.key?(:restrictions)
          @theme_id = args[:theme_id] if args.key?(:theme_id)
        end
        
        # An image file and cropping parameters from which a background image for this
        # Team Drive is set. This is a write only field; it can only be set on drive.
        # teamdrives.update requests that don't set themeId. When specified, all fields
        # of the backgroundImageFile must be set.
        class BackgroundImageFile
          include Google::Apis::Core::Hashable
        
          # The ID of an image file in Drive to use for the background image.
          # Corresponds to the JSON property `id`
          # @return [String]
          attr_accessor :id
        
          # The width of the cropped image in the closed range of 0 to 1. This value
          # represents the width of the cropped image divided by the width of the entire
          # image. The height is computed by applying a width to height aspect ratio of 80
          # to 9. The resulting image must be at least 1280 pixels wide and 144 pixels
          # high.
          # Corresponds to the JSON property `width`
          # @return [Float]
          attr_accessor :width
        
          # The X coordinate of the upper left corner of the cropping area in the
          # background image. This is a value in the closed range of 0 to 1. This value
          # represents the horizontal distance from the left side of the entire image to
          # the left side of the cropping area divided by the width of the entire image.
          # Corresponds to the JSON property `xCoordinate`
          # @return [Float]
          attr_accessor :x_coordinate
        
          # The Y coordinate of the upper left corner of the cropping area in the
          # background image. This is a value in the closed range of 0 to 1. This value
          # represents the vertical distance from the top side of the entire image to the
          # top side of the cropping area divided by the height of the entire image.
          # Corresponds to the JSON property `yCoordinate`
          # @return [Float]
          attr_accessor :y_coordinate
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @id = args[:id] if args.key?(:id)
            @width = args[:width] if args.key?(:width)
            @x_coordinate = args[:x_coordinate] if args.key?(:x_coordinate)
            @y_coordinate = args[:y_coordinate] if args.key?(:y_coordinate)
          end
        end
        
        # Capabilities the current user has on this Team Drive.
        class Capabilities
          include Google::Apis::Core::Hashable
        
          # Whether the current user can add children to folders in this Team Drive.
          # Corresponds to the JSON property `canAddChildren`
          # @return [Boolean]
          attr_accessor :can_add_children
          alias_method :can_add_children?, :can_add_children
        
          # Whether the current user can change the copyRequiresWriterPermission
          # restriction of this Team Drive.
          # Corresponds to the JSON property `canChangeCopyRequiresWriterPermissionRestriction`
          # @return [Boolean]
          attr_accessor :can_change_copy_requires_writer_permission_restriction
          alias_method :can_change_copy_requires_writer_permission_restriction?, :can_change_copy_requires_writer_permission_restriction
        
          # Whether the current user can change the domainUsersOnly restriction of this
          # Team Drive.
          # Corresponds to the JSON property `canChangeDomainUsersOnlyRestriction`
          # @return [Boolean]
          attr_accessor :can_change_domain_users_only_restriction
          alias_method :can_change_domain_users_only_restriction?, :can_change_domain_users_only_restriction
        
          # Whether the current user can change the background of this Team Drive.
          # Corresponds to the JSON property `canChangeTeamDriveBackground`
          # @return [Boolean]
          attr_accessor :can_change_team_drive_background
          alias_method :can_change_team_drive_background?, :can_change_team_drive_background
        
          # Whether the current user can change the teamMembersOnly restriction of this
          # Team Drive.
          # Corresponds to the JSON property `canChangeTeamMembersOnlyRestriction`
          # @return [Boolean]
          attr_accessor :can_change_team_members_only_restriction
          alias_method :can_change_team_members_only_restriction?, :can_change_team_members_only_restriction
        
          # Whether the current user can comment on files in this Team Drive.
          # Corresponds to the JSON property `canComment`
          # @return [Boolean]
          attr_accessor :can_comment
          alias_method :can_comment?, :can_comment
        
          # Whether the current user can copy files in this Team Drive.
          # Corresponds to the JSON property `canCopy`
          # @return [Boolean]
          attr_accessor :can_copy
          alias_method :can_copy?, :can_copy
        
          # Whether the current user can delete children from folders in this Team Drive.
          # Corresponds to the JSON property `canDeleteChildren`
          # @return [Boolean]
          attr_accessor :can_delete_children
          alias_method :can_delete_children?, :can_delete_children
        
          # Whether the current user can delete this Team Drive. Attempting to delete the
          # Team Drive may still fail if there are untrashed items inside the Team Drive.
          # Corresponds to the JSON property `canDeleteTeamDrive`
          # @return [Boolean]
          attr_accessor :can_delete_team_drive
          alias_method :can_delete_team_drive?, :can_delete_team_drive
        
          # Whether the current user can download files in this Team Drive.
          # Corresponds to the JSON property `canDownload`
          # @return [Boolean]
          attr_accessor :can_download
          alias_method :can_download?, :can_download
        
          # Whether the current user can edit files in this Team Drive
          # Corresponds to the JSON property `canEdit`
          # @return [Boolean]
          attr_accessor :can_edit
          alias_method :can_edit?, :can_edit
        
          # Whether the current user can list the children of folders in this Team Drive.
          # Corresponds to the JSON property `canListChildren`
          # @return [Boolean]
          attr_accessor :can_list_children
          alias_method :can_list_children?, :can_list_children
        
          # Whether the current user can add members to this Team Drive or remove them or
          # change their role.
          # Corresponds to the JSON property `canManageMembers`
          # @return [Boolean]
          attr_accessor :can_manage_members
          alias_method :can_manage_members?, :can_manage_members
        
          # Whether the current user can read the revisions resource of files in this Team
          # Drive.
          # Corresponds to the JSON property `canReadRevisions`
          # @return [Boolean]
          attr_accessor :can_read_revisions
          alias_method :can_read_revisions?, :can_read_revisions
        
          # Deprecated - use canDeleteChildren or canTrashChildren instead.
          # Corresponds to the JSON property `canRemoveChildren`
          # @return [Boolean]
          attr_accessor :can_remove_children
          alias_method :can_remove_children?, :can_remove_children
        
          # Whether the current user can rename files or folders in this Team Drive.
          # Corresponds to the JSON property `canRename`
          # @return [Boolean]
          attr_accessor :can_rename
          alias_method :can_rename?, :can_rename
        
          # Whether the current user can rename this Team Drive.
          # Corresponds to the JSON property `canRenameTeamDrive`
          # @return [Boolean]
          attr_accessor :can_rename_team_drive
          alias_method :can_rename_team_drive?, :can_rename_team_drive
        
          # Whether the current user can share files or folders in this Team Drive.
          # Corresponds to the JSON property `canShare`
          # @return [Boolean]
          attr_accessor :can_share
          alias_method :can_share?, :can_share
        
          # Whether the current user can trash children from folders in this Team Drive.
          # Corresponds to the JSON property `canTrashChildren`
          # @return [Boolean]
          attr_accessor :can_trash_children
          alias_method :can_trash_children?, :can_trash_children
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @can_add_children = args[:can_add_children] if args.key?(:can_add_children)
            @can_change_copy_requires_writer_permission_restriction = args[:can_change_copy_requires_writer_permission_restriction] if args.key?(:can_change_copy_requires_writer_permission_restriction)
            @can_change_domain_users_only_restriction = args[:can_change_domain_users_only_restriction] if args.key?(:can_change_domain_users_only_restriction)
            @can_change_team_drive_background = args[:can_change_team_drive_background] if args.key?(:can_change_team_drive_background)
            @can_change_team_members_only_restriction = args[:can_change_team_members_only_restriction] if args.key?(:can_change_team_members_only_restriction)
            @can_comment = args[:can_comment] if args.key?(:can_comment)
            @can_copy = args[:can_copy] if args.key?(:can_copy)
            @can_delete_children = args[:can_delete_children] if args.key?(:can_delete_children)
            @can_delete_team_drive = args[:can_delete_team_drive] if args.key?(:can_delete_team_drive)
            @can_download = args[:can_download] if args.key?(:can_download)
            @can_edit = args[:can_edit] if args.key?(:can_edit)
            @can_list_children = args[:can_list_children] if args.key?(:can_list_children)
            @can_manage_members = args[:can_manage_members] if args.key?(:can_manage_members)
            @can_read_revisions = args[:can_read_revisions] if args.key?(:can_read_revisions)
            @can_remove_children = args[:can_remove_children] if args.key?(:can_remove_children)
            @can_rename = args[:can_rename] if args.key?(:can_rename)
            @can_rename_team_drive = args[:can_rename_team_drive] if args.key?(:can_rename_team_drive)
            @can_share = args[:can_share] if args.key?(:can_share)
            @can_trash_children = args[:can_trash_children] if args.key?(:can_trash_children)
          end
        end
        
        # A set of restrictions that apply to this Team Drive or items inside this Team
        # Drive.
        class Restrictions
          include Google::Apis::Core::Hashable
        
          # Whether administrative privileges on this Team Drive are required to modify
          # restrictions.
          # Corresponds to the JSON property `adminManagedRestrictions`
          # @return [Boolean]
          attr_accessor :admin_managed_restrictions
          alias_method :admin_managed_restrictions?, :admin_managed_restrictions
        
          # Whether the options to copy, print, or download files inside this Team Drive,
          # should be disabled for readers and commenters. When this restriction is set to
          # true, it will override the similarly named field to true for any file inside
          # this Team Drive.
          # Corresponds to the JSON property `copyRequiresWriterPermission`
          # @return [Boolean]
          attr_accessor :copy_requires_writer_permission
          alias_method :copy_requires_writer_permission?, :copy_requires_writer_permission
        
          # Whether access to this Team Drive and items inside this Team Drive is
          # restricted to users of the domain to which this Team Drive belongs. This
          # restriction may be overridden by other sharing policies controlled outside of
          # this Team Drive.
          # Corresponds to the JSON property `domainUsersOnly`
          # @return [Boolean]
          attr_accessor :domain_users_only
          alias_method :domain_users_only?, :domain_users_only
        
          # Whether access to items inside this Team Drive is restricted to members of
          # this Team Drive.
          # Corresponds to the JSON property `teamMembersOnly`
          # @return [Boolean]
          attr_accessor :team_members_only
          alias_method :team_members_only?, :team_members_only
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @admin_managed_restrictions = args[:admin_managed_restrictions] if args.key?(:admin_managed_restrictions)
            @copy_requires_writer_permission = args[:copy_requires_writer_permission] if args.key?(:copy_requires_writer_permission)
            @domain_users_only = args[:domain_users_only] if args.key?(:domain_users_only)
            @team_members_only = args[:team_members_only] if args.key?(:team_members_only)
          end
        end
      end
      
      # A list of Team Drives.
      class TeamDriveList
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "drive#
        # teamDriveList".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The page token for the next page of Team Drives. This will be absent if the
        # end of the Team Drives list has been reached. If the token is rejected for any
        # reason, it should be discarded, and pagination should be restarted from the
        # first page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The list of Team Drives. If nextPageToken is populated, then this list may be
        # incomplete and an additional page of results should be fetched.
        # Corresponds to the JSON property `teamDrives`
        # @return [Array<Google::Apis::DriveV3::TeamDrive>]
        attr_accessor :team_drives
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @team_drives = args[:team_drives] if args.key?(:team_drives)
        end
      end
      
      # Information about a Drive user.
      class User
        include Google::Apis::Core::Hashable
      
        # A plain text displayable name for this user.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The email address of the user. This may not be present in certain contexts if
        # the user has not made their email address visible to the requester.
        # Corresponds to the JSON property `emailAddress`
        # @return [String]
        attr_accessor :email_address
      
        # Identifies what kind of resource this is. Value: the fixed string "drive#user".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Whether this user is the requesting user.
        # Corresponds to the JSON property `me`
        # @return [Boolean]
        attr_accessor :me
        alias_method :me?, :me
      
        # The user's ID as visible in Permission resources.
        # Corresponds to the JSON property `permissionId`
        # @return [String]
        attr_accessor :permission_id
      
        # A link to the user's profile photo, if available.
        # Corresponds to the JSON property `photoLink`
        # @return [String]
        attr_accessor :photo_link
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_name = args[:display_name] if args.key?(:display_name)
          @email_address = args[:email_address] if args.key?(:email_address)
          @kind = args[:kind] if args.key?(:kind)
          @me = args[:me] if args.key?(:me)
          @permission_id = args[:permission_id] if args.key?(:permission_id)
          @photo_link = args[:photo_link] if args.key?(:photo_link)
        end
      end
    end
  end
end
