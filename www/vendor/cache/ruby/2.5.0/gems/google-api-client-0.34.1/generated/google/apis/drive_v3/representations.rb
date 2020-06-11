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
      
      class About
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class DriveTheme
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class StorageQuota
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class TeamDriveTheme
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Change
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ChangeList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Channel
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Comment
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class QuotedFileContent
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CommentList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Drive
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class BackgroundImageFile
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Capabilities
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Restrictions
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DriveList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class File
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Capabilities
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class ContentHints
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Thumbnail
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class ImageMediaMetadata
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Location
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class VideoMediaMetadata
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FileList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GeneratedIds
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Permission
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class PermissionDetail
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class TeamDrivePermissionDetail
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PermissionList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Reply
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReplyList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Revision
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RevisionList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StartPageToken
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TeamDrive
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class BackgroundImageFile
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Capabilities
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Restrictions
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TeamDriveList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class User
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class About
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :app_installed, as: 'appInstalled'
          property :can_create_drives, as: 'canCreateDrives'
          property :can_create_team_drives, as: 'canCreateTeamDrives'
          collection :drive_themes, as: 'driveThemes', class: Google::Apis::DriveV3::About::DriveTheme, decorator: Google::Apis::DriveV3::About::DriveTheme::Representation
      
          hash :export_formats, as: 'exportFormats', :class => Array do
        include Representable::JSON::Collection
        items
      end
      
          collection :folder_color_palette, as: 'folderColorPalette'
          hash :import_formats, as: 'importFormats', :class => Array do
        include Representable::JSON::Collection
        items
      end
      
          property :kind, as: 'kind'
          hash :max_import_sizes, as: 'maxImportSizes'
          property :max_upload_size, :numeric_string => true, as: 'maxUploadSize'
          property :storage_quota, as: 'storageQuota', class: Google::Apis::DriveV3::About::StorageQuota, decorator: Google::Apis::DriveV3::About::StorageQuota::Representation
      
          collection :team_drive_themes, as: 'teamDriveThemes', class: Google::Apis::DriveV3::About::TeamDriveTheme, decorator: Google::Apis::DriveV3::About::TeamDriveTheme::Representation
      
          property :user, as: 'user', class: Google::Apis::DriveV3::User, decorator: Google::Apis::DriveV3::User::Representation
      
        end
        
        class DriveTheme
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :background_image_link, as: 'backgroundImageLink'
            property :color_rgb, as: 'colorRgb'
            property :id, as: 'id'
          end
        end
        
        class StorageQuota
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :limit, :numeric_string => true, as: 'limit'
            property :usage, :numeric_string => true, as: 'usage'
            property :usage_in_drive, :numeric_string => true, as: 'usageInDrive'
            property :usage_in_drive_trash, :numeric_string => true, as: 'usageInDriveTrash'
          end
        end
        
        class TeamDriveTheme
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :background_image_link, as: 'backgroundImageLink'
            property :color_rgb, as: 'colorRgb'
            property :id, as: 'id'
          end
        end
      end
      
      class Change
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :change_type, as: 'changeType'
          property :drive, as: 'drive', class: Google::Apis::DriveV3::Drive, decorator: Google::Apis::DriveV3::Drive::Representation
      
          property :drive_id, as: 'driveId'
          property :file, as: 'file', class: Google::Apis::DriveV3::File, decorator: Google::Apis::DriveV3::File::Representation
      
          property :file_id, as: 'fileId'
          property :kind, as: 'kind'
          property :removed, as: 'removed'
          property :team_drive, as: 'teamDrive', class: Google::Apis::DriveV3::TeamDrive, decorator: Google::Apis::DriveV3::TeamDrive::Representation
      
          property :team_drive_id, as: 'teamDriveId'
          property :time, as: 'time', type: DateTime
      
          property :type, as: 'type'
        end
      end
      
      class ChangeList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :changes, as: 'changes', class: Google::Apis::DriveV3::Change, decorator: Google::Apis::DriveV3::Change::Representation
      
          property :kind, as: 'kind'
          property :new_start_page_token, as: 'newStartPageToken'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class Channel
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :address, as: 'address'
          property :expiration, :numeric_string => true, as: 'expiration'
          property :id, as: 'id'
          property :kind, as: 'kind'
          hash :params, as: 'params'
          property :payload, as: 'payload'
          property :resource_id, as: 'resourceId'
          property :resource_uri, as: 'resourceUri'
          property :token, as: 'token'
          property :type, as: 'type'
        end
      end
      
      class Comment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :anchor, as: 'anchor'
          property :author, as: 'author', class: Google::Apis::DriveV3::User, decorator: Google::Apis::DriveV3::User::Representation
      
          property :content, as: 'content'
          property :created_time, as: 'createdTime', type: DateTime
      
          property :deleted, as: 'deleted'
          property :html_content, as: 'htmlContent'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :modified_time, as: 'modifiedTime', type: DateTime
      
          property :quoted_file_content, as: 'quotedFileContent', class: Google::Apis::DriveV3::Comment::QuotedFileContent, decorator: Google::Apis::DriveV3::Comment::QuotedFileContent::Representation
      
          collection :replies, as: 'replies', class: Google::Apis::DriveV3::Reply, decorator: Google::Apis::DriveV3::Reply::Representation
      
          property :resolved, as: 'resolved'
        end
        
        class QuotedFileContent
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :mime_type, as: 'mimeType'
            property :value, as: 'value'
          end
        end
      end
      
      class CommentList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :comments, as: 'comments', class: Google::Apis::DriveV3::Comment, decorator: Google::Apis::DriveV3::Comment::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class Drive
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :background_image_file, as: 'backgroundImageFile', class: Google::Apis::DriveV3::Drive::BackgroundImageFile, decorator: Google::Apis::DriveV3::Drive::BackgroundImageFile::Representation
      
          property :background_image_link, as: 'backgroundImageLink'
          property :capabilities, as: 'capabilities', class: Google::Apis::DriveV3::Drive::Capabilities, decorator: Google::Apis::DriveV3::Drive::Capabilities::Representation
      
          property :color_rgb, as: 'colorRgb'
          property :created_time, as: 'createdTime', type: DateTime
      
          property :hidden, as: 'hidden'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :restrictions, as: 'restrictions', class: Google::Apis::DriveV3::Drive::Restrictions, decorator: Google::Apis::DriveV3::Drive::Restrictions::Representation
      
          property :theme_id, as: 'themeId'
        end
        
        class BackgroundImageFile
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :id, as: 'id'
            property :width, as: 'width'
            property :x_coordinate, as: 'xCoordinate'
            property :y_coordinate, as: 'yCoordinate'
          end
        end
        
        class Capabilities
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :can_add_children, as: 'canAddChildren'
            property :can_change_copy_requires_writer_permission_restriction, as: 'canChangeCopyRequiresWriterPermissionRestriction'
            property :can_change_domain_users_only_restriction, as: 'canChangeDomainUsersOnlyRestriction'
            property :can_change_drive_background, as: 'canChangeDriveBackground'
            property :can_change_drive_members_only_restriction, as: 'canChangeDriveMembersOnlyRestriction'
            property :can_comment, as: 'canComment'
            property :can_copy, as: 'canCopy'
            property :can_delete_children, as: 'canDeleteChildren'
            property :can_delete_drive, as: 'canDeleteDrive'
            property :can_download, as: 'canDownload'
            property :can_edit, as: 'canEdit'
            property :can_list_children, as: 'canListChildren'
            property :can_manage_members, as: 'canManageMembers'
            property :can_read_revisions, as: 'canReadRevisions'
            property :can_rename, as: 'canRename'
            property :can_rename_drive, as: 'canRenameDrive'
            property :can_share, as: 'canShare'
            property :can_trash_children, as: 'canTrashChildren'
          end
        end
        
        class Restrictions
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :admin_managed_restrictions, as: 'adminManagedRestrictions'
            property :copy_requires_writer_permission, as: 'copyRequiresWriterPermission'
            property :domain_users_only, as: 'domainUsersOnly'
            property :drive_members_only, as: 'driveMembersOnly'
          end
        end
      end
      
      class DriveList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :drives, as: 'drives', class: Google::Apis::DriveV3::Drive, decorator: Google::Apis::DriveV3::Drive::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class File
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :app_properties, as: 'appProperties'
          property :capabilities, as: 'capabilities', class: Google::Apis::DriveV3::File::Capabilities, decorator: Google::Apis::DriveV3::File::Capabilities::Representation
      
          property :content_hints, as: 'contentHints', class: Google::Apis::DriveV3::File::ContentHints, decorator: Google::Apis::DriveV3::File::ContentHints::Representation
      
          property :copy_requires_writer_permission, as: 'copyRequiresWriterPermission'
          property :created_time, as: 'createdTime', type: DateTime
      
          property :description, as: 'description'
          property :drive_id, as: 'driveId'
          property :explicitly_trashed, as: 'explicitlyTrashed'
          hash :export_links, as: 'exportLinks'
          property :file_extension, as: 'fileExtension'
          property :folder_color_rgb, as: 'folderColorRgb'
          property :full_file_extension, as: 'fullFileExtension'
          property :has_augmented_permissions, as: 'hasAugmentedPermissions'
          property :has_thumbnail, as: 'hasThumbnail'
          property :head_revision_id, as: 'headRevisionId'
          property :icon_link, as: 'iconLink'
          property :id, as: 'id'
          property :image_media_metadata, as: 'imageMediaMetadata', class: Google::Apis::DriveV3::File::ImageMediaMetadata, decorator: Google::Apis::DriveV3::File::ImageMediaMetadata::Representation
      
          property :is_app_authorized, as: 'isAppAuthorized'
          property :kind, as: 'kind'
          property :last_modifying_user, as: 'lastModifyingUser', class: Google::Apis::DriveV3::User, decorator: Google::Apis::DriveV3::User::Representation
      
          property :md5_checksum, as: 'md5Checksum'
          property :mime_type, as: 'mimeType'
          property :modified_by_me, as: 'modifiedByMe'
          property :modified_by_me_time, as: 'modifiedByMeTime', type: DateTime
      
          property :modified_time, as: 'modifiedTime', type: DateTime
      
          property :name, as: 'name'
          property :original_filename, as: 'originalFilename'
          property :owned_by_me, as: 'ownedByMe'
          collection :owners, as: 'owners', class: Google::Apis::DriveV3::User, decorator: Google::Apis::DriveV3::User::Representation
      
          collection :parents, as: 'parents'
          collection :permission_ids, as: 'permissionIds'
          collection :permissions, as: 'permissions', class: Google::Apis::DriveV3::Permission, decorator: Google::Apis::DriveV3::Permission::Representation
      
          hash :properties, as: 'properties'
          property :quota_bytes_used, :numeric_string => true, as: 'quotaBytesUsed'
          property :shared, as: 'shared'
          property :shared_with_me_time, as: 'sharedWithMeTime', type: DateTime
      
          property :sharing_user, as: 'sharingUser', class: Google::Apis::DriveV3::User, decorator: Google::Apis::DriveV3::User::Representation
      
          property :size, :numeric_string => true, as: 'size'
          collection :spaces, as: 'spaces'
          property :starred, as: 'starred'
          property :team_drive_id, as: 'teamDriveId'
          property :thumbnail_link, as: 'thumbnailLink'
          property :thumbnail_version, :numeric_string => true, as: 'thumbnailVersion'
          property :trashed, as: 'trashed'
          property :trashed_time, as: 'trashedTime', type: DateTime
      
          property :trashing_user, as: 'trashingUser', class: Google::Apis::DriveV3::User, decorator: Google::Apis::DriveV3::User::Representation
      
          property :version, :numeric_string => true, as: 'version'
          property :video_media_metadata, as: 'videoMediaMetadata', class: Google::Apis::DriveV3::File::VideoMediaMetadata, decorator: Google::Apis::DriveV3::File::VideoMediaMetadata::Representation
      
          property :viewed_by_me, as: 'viewedByMe'
          property :viewed_by_me_time, as: 'viewedByMeTime', type: DateTime
      
          property :viewers_can_copy_content, as: 'viewersCanCopyContent'
          property :web_content_link, as: 'webContentLink'
          property :web_view_link, as: 'webViewLink'
          property :writers_can_share, as: 'writersCanShare'
        end
        
        class Capabilities
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :can_add_children, as: 'canAddChildren'
            property :can_change_copy_requires_writer_permission, as: 'canChangeCopyRequiresWriterPermission'
            property :can_change_viewers_can_copy_content, as: 'canChangeViewersCanCopyContent'
            property :can_comment, as: 'canComment'
            property :can_copy, as: 'canCopy'
            property :can_delete, as: 'canDelete'
            property :can_delete_children, as: 'canDeleteChildren'
            property :can_download, as: 'canDownload'
            property :can_edit, as: 'canEdit'
            property :can_list_children, as: 'canListChildren'
            property :can_modify_content, as: 'canModifyContent'
            property :can_move_children_out_of_drive, as: 'canMoveChildrenOutOfDrive'
            property :can_move_children_out_of_team_drive, as: 'canMoveChildrenOutOfTeamDrive'
            property :can_move_children_within_drive, as: 'canMoveChildrenWithinDrive'
            property :can_move_children_within_team_drive, as: 'canMoveChildrenWithinTeamDrive'
            property :can_move_item_into_team_drive, as: 'canMoveItemIntoTeamDrive'
            property :can_move_item_out_of_drive, as: 'canMoveItemOutOfDrive'
            property :can_move_item_out_of_team_drive, as: 'canMoveItemOutOfTeamDrive'
            property :can_move_item_within_drive, as: 'canMoveItemWithinDrive'
            property :can_move_item_within_team_drive, as: 'canMoveItemWithinTeamDrive'
            property :can_move_team_drive_item, as: 'canMoveTeamDriveItem'
            property :can_read_drive, as: 'canReadDrive'
            property :can_read_revisions, as: 'canReadRevisions'
            property :can_read_team_drive, as: 'canReadTeamDrive'
            property :can_remove_children, as: 'canRemoveChildren'
            property :can_rename, as: 'canRename'
            property :can_share, as: 'canShare'
            property :can_trash, as: 'canTrash'
            property :can_trash_children, as: 'canTrashChildren'
            property :can_untrash, as: 'canUntrash'
          end
        end
        
        class ContentHints
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :indexable_text, as: 'indexableText'
            property :thumbnail, as: 'thumbnail', class: Google::Apis::DriveV3::File::ContentHints::Thumbnail, decorator: Google::Apis::DriveV3::File::ContentHints::Thumbnail::Representation
        
          end
          
          class Thumbnail
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :image, :base64 => true, as: 'image'
              property :mime_type, as: 'mimeType'
            end
          end
        end
        
        class ImageMediaMetadata
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :aperture, as: 'aperture'
            property :camera_make, as: 'cameraMake'
            property :camera_model, as: 'cameraModel'
            property :color_space, as: 'colorSpace'
            property :exposure_bias, as: 'exposureBias'
            property :exposure_mode, as: 'exposureMode'
            property :exposure_time, as: 'exposureTime'
            property :flash_used, as: 'flashUsed'
            property :focal_length, as: 'focalLength'
            property :height, as: 'height'
            property :iso_speed, as: 'isoSpeed'
            property :lens, as: 'lens'
            property :location, as: 'location', class: Google::Apis::DriveV3::File::ImageMediaMetadata::Location, decorator: Google::Apis::DriveV3::File::ImageMediaMetadata::Location::Representation
        
            property :max_aperture_value, as: 'maxApertureValue'
            property :metering_mode, as: 'meteringMode'
            property :rotation, as: 'rotation'
            property :sensor, as: 'sensor'
            property :subject_distance, as: 'subjectDistance'
            property :time, as: 'time'
            property :white_balance, as: 'whiteBalance'
            property :width, as: 'width'
          end
          
          class Location
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :altitude, as: 'altitude'
              property :latitude, as: 'latitude'
              property :longitude, as: 'longitude'
            end
          end
        end
        
        class VideoMediaMetadata
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :duration_millis, :numeric_string => true, as: 'durationMillis'
            property :height, as: 'height'
            property :width, as: 'width'
          end
        end
      end
      
      class FileList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :files, as: 'files', class: Google::Apis::DriveV3::File, decorator: Google::Apis::DriveV3::File::Representation
      
          property :incomplete_search, as: 'incompleteSearch'
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class GeneratedIds
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :ids, as: 'ids'
          property :kind, as: 'kind'
          property :space, as: 'space'
        end
      end
      
      class Permission
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :allow_file_discovery, as: 'allowFileDiscovery'
          property :deleted, as: 'deleted'
          property :display_name, as: 'displayName'
          property :domain, as: 'domain'
          property :email_address, as: 'emailAddress'
          property :expiration_time, as: 'expirationTime', type: DateTime
      
          property :id, as: 'id'
          property :kind, as: 'kind'
          collection :permission_details, as: 'permissionDetails', class: Google::Apis::DriveV3::Permission::PermissionDetail, decorator: Google::Apis::DriveV3::Permission::PermissionDetail::Representation
      
          property :photo_link, as: 'photoLink'
          property :role, as: 'role'
          collection :team_drive_permission_details, as: 'teamDrivePermissionDetails', class: Google::Apis::DriveV3::Permission::TeamDrivePermissionDetail, decorator: Google::Apis::DriveV3::Permission::TeamDrivePermissionDetail::Representation
      
          property :type, as: 'type'
        end
        
        class PermissionDetail
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :inherited, as: 'inherited'
            property :inherited_from, as: 'inheritedFrom'
            property :permission_type, as: 'permissionType'
            property :role, as: 'role'
          end
        end
        
        class TeamDrivePermissionDetail
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :inherited, as: 'inherited'
            property :inherited_from, as: 'inheritedFrom'
            property :role, as: 'role'
            property :team_drive_permission_type, as: 'teamDrivePermissionType'
          end
        end
      end
      
      class PermissionList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :permissions, as: 'permissions', class: Google::Apis::DriveV3::Permission, decorator: Google::Apis::DriveV3::Permission::Representation
      
        end
      end
      
      class Reply
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action, as: 'action'
          property :author, as: 'author', class: Google::Apis::DriveV3::User, decorator: Google::Apis::DriveV3::User::Representation
      
          property :content, as: 'content'
          property :created_time, as: 'createdTime', type: DateTime
      
          property :deleted, as: 'deleted'
          property :html_content, as: 'htmlContent'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :modified_time, as: 'modifiedTime', type: DateTime
      
        end
      end
      
      class ReplyList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :replies, as: 'replies', class: Google::Apis::DriveV3::Reply, decorator: Google::Apis::DriveV3::Reply::Representation
      
        end
      end
      
      class Revision
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :export_links, as: 'exportLinks'
          property :id, as: 'id'
          property :keep_forever, as: 'keepForever'
          property :kind, as: 'kind'
          property :last_modifying_user, as: 'lastModifyingUser', class: Google::Apis::DriveV3::User, decorator: Google::Apis::DriveV3::User::Representation
      
          property :md5_checksum, as: 'md5Checksum'
          property :mime_type, as: 'mimeType'
          property :modified_time, as: 'modifiedTime', type: DateTime
      
          property :original_filename, as: 'originalFilename'
          property :publish_auto, as: 'publishAuto'
          property :published, as: 'published'
          property :published_outside_domain, as: 'publishedOutsideDomain'
          property :size, :numeric_string => true, as: 'size'
        end
      end
      
      class RevisionList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :revisions, as: 'revisions', class: Google::Apis::DriveV3::Revision, decorator: Google::Apis::DriveV3::Revision::Representation
      
        end
      end
      
      class StartPageToken
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :start_page_token, as: 'startPageToken'
        end
      end
      
      class TeamDrive
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :background_image_file, as: 'backgroundImageFile', class: Google::Apis::DriveV3::TeamDrive::BackgroundImageFile, decorator: Google::Apis::DriveV3::TeamDrive::BackgroundImageFile::Representation
      
          property :background_image_link, as: 'backgroundImageLink'
          property :capabilities, as: 'capabilities', class: Google::Apis::DriveV3::TeamDrive::Capabilities, decorator: Google::Apis::DriveV3::TeamDrive::Capabilities::Representation
      
          property :color_rgb, as: 'colorRgb'
          property :created_time, as: 'createdTime', type: DateTime
      
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :restrictions, as: 'restrictions', class: Google::Apis::DriveV3::TeamDrive::Restrictions, decorator: Google::Apis::DriveV3::TeamDrive::Restrictions::Representation
      
          property :theme_id, as: 'themeId'
        end
        
        class BackgroundImageFile
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :id, as: 'id'
            property :width, as: 'width'
            property :x_coordinate, as: 'xCoordinate'
            property :y_coordinate, as: 'yCoordinate'
          end
        end
        
        class Capabilities
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :can_add_children, as: 'canAddChildren'
            property :can_change_copy_requires_writer_permission_restriction, as: 'canChangeCopyRequiresWriterPermissionRestriction'
            property :can_change_domain_users_only_restriction, as: 'canChangeDomainUsersOnlyRestriction'
            property :can_change_team_drive_background, as: 'canChangeTeamDriveBackground'
            property :can_change_team_members_only_restriction, as: 'canChangeTeamMembersOnlyRestriction'
            property :can_comment, as: 'canComment'
            property :can_copy, as: 'canCopy'
            property :can_delete_children, as: 'canDeleteChildren'
            property :can_delete_team_drive, as: 'canDeleteTeamDrive'
            property :can_download, as: 'canDownload'
            property :can_edit, as: 'canEdit'
            property :can_list_children, as: 'canListChildren'
            property :can_manage_members, as: 'canManageMembers'
            property :can_read_revisions, as: 'canReadRevisions'
            property :can_remove_children, as: 'canRemoveChildren'
            property :can_rename, as: 'canRename'
            property :can_rename_team_drive, as: 'canRenameTeamDrive'
            property :can_share, as: 'canShare'
            property :can_trash_children, as: 'canTrashChildren'
          end
        end
        
        class Restrictions
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :admin_managed_restrictions, as: 'adminManagedRestrictions'
            property :copy_requires_writer_permission, as: 'copyRequiresWriterPermission'
            property :domain_users_only, as: 'domainUsersOnly'
            property :team_members_only, as: 'teamMembersOnly'
          end
        end
      end
      
      class TeamDriveList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :team_drives, as: 'teamDrives', class: Google::Apis::DriveV3::TeamDrive, decorator: Google::Apis::DriveV3::TeamDrive::Representation
      
        end
      end
      
      class User
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_name, as: 'displayName'
          property :email_address, as: 'emailAddress'
          property :kind, as: 'kind'
          property :me, as: 'me'
          property :permission_id, as: 'permissionId'
          property :photo_link, as: 'photoLink'
        end
      end
    end
  end
end
