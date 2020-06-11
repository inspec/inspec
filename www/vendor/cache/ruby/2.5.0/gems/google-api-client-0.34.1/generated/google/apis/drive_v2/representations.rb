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
    module DriveV2
      
      class About
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class AdditionalRoleInfo
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class RoleSet
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class DriveTheme
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class ExportFormat
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Feature
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class ImportFormat
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class MaxUploadSize
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class QuotaBytesByService
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class TeamDriveTheme
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class App
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Icon
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AppList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
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
      
      class ChildList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ChildReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Comment
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Context
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CommentList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CommentReply
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CommentReplyList
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
        
        class ImageMediaMetadata
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Location
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class IndexableText
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Labels
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Thumbnail
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
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
      
      class ParentList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ParentReference
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
      
      class PermissionId
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PermissionList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Property
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PropertyList
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
        
        class Picture
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class About
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :additional_role_info, as: 'additionalRoleInfo', class: Google::Apis::DriveV2::About::AdditionalRoleInfo, decorator: Google::Apis::DriveV2::About::AdditionalRoleInfo::Representation
      
          property :can_create_drives, as: 'canCreateDrives'
          property :can_create_team_drives, as: 'canCreateTeamDrives'
          property :domain_sharing_policy, as: 'domainSharingPolicy'
          collection :drive_themes, as: 'driveThemes', class: Google::Apis::DriveV2::About::DriveTheme, decorator: Google::Apis::DriveV2::About::DriveTheme::Representation
      
          property :etag, as: 'etag'
          collection :export_formats, as: 'exportFormats', class: Google::Apis::DriveV2::About::ExportFormat, decorator: Google::Apis::DriveV2::About::ExportFormat::Representation
      
          collection :features, as: 'features', class: Google::Apis::DriveV2::About::Feature, decorator: Google::Apis::DriveV2::About::Feature::Representation
      
          collection :folder_color_palette, as: 'folderColorPalette'
          collection :import_formats, as: 'importFormats', class: Google::Apis::DriveV2::About::ImportFormat, decorator: Google::Apis::DriveV2::About::ImportFormat::Representation
      
          property :is_current_app_installed, as: 'isCurrentAppInstalled'
          property :kind, as: 'kind'
          property :language_code, as: 'languageCode'
          property :largest_change_id, :numeric_string => true, as: 'largestChangeId'
          collection :max_upload_sizes, as: 'maxUploadSizes', class: Google::Apis::DriveV2::About::MaxUploadSize, decorator: Google::Apis::DriveV2::About::MaxUploadSize::Representation
      
          property :name, as: 'name'
          property :permission_id, as: 'permissionId'
          collection :quota_bytes_by_service, as: 'quotaBytesByService', class: Google::Apis::DriveV2::About::QuotaBytesByService, decorator: Google::Apis::DriveV2::About::QuotaBytesByService::Representation
      
          property :quota_bytes_total, :numeric_string => true, as: 'quotaBytesTotal'
          property :quota_bytes_used, :numeric_string => true, as: 'quotaBytesUsed'
          property :quota_bytes_used_aggregate, :numeric_string => true, as: 'quotaBytesUsedAggregate'
          property :quota_bytes_used_in_trash, :numeric_string => true, as: 'quotaBytesUsedInTrash'
          property :quota_type, as: 'quotaType'
          property :remaining_change_ids, :numeric_string => true, as: 'remainingChangeIds'
          property :root_folder_id, as: 'rootFolderId'
          property :self_link, as: 'selfLink'
          collection :team_drive_themes, as: 'teamDriveThemes', class: Google::Apis::DriveV2::About::TeamDriveTheme, decorator: Google::Apis::DriveV2::About::TeamDriveTheme::Representation
      
          property :user, as: 'user', class: Google::Apis::DriveV2::User, decorator: Google::Apis::DriveV2::User::Representation
      
        end
        
        class AdditionalRoleInfo
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :role_sets, as: 'roleSets', class: Google::Apis::DriveV2::About::AdditionalRoleInfo::RoleSet, decorator: Google::Apis::DriveV2::About::AdditionalRoleInfo::RoleSet::Representation
        
            property :type, as: 'type'
          end
          
          class RoleSet
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              collection :additional_roles, as: 'additionalRoles'
              property :primary_role, as: 'primaryRole'
            end
          end
        end
        
        class DriveTheme
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :background_image_link, as: 'backgroundImageLink'
            property :color_rgb, as: 'colorRgb'
            property :id, as: 'id'
          end
        end
        
        class ExportFormat
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :source, as: 'source'
            collection :targets, as: 'targets'
          end
        end
        
        class Feature
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :feature_name, as: 'featureName'
            property :feature_rate, as: 'featureRate'
          end
        end
        
        class ImportFormat
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :source, as: 'source'
            collection :targets, as: 'targets'
          end
        end
        
        class MaxUploadSize
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :size, :numeric_string => true, as: 'size'
            property :type, as: 'type'
          end
        end
        
        class QuotaBytesByService
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :bytes_used, :numeric_string => true, as: 'bytesUsed'
            property :service_name, as: 'serviceName'
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
      
      class App
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :authorized, as: 'authorized'
          property :create_in_folder_template, as: 'createInFolderTemplate'
          property :create_url, as: 'createUrl'
          property :has_drive_wide_scope, as: 'hasDriveWideScope'
          collection :icons, as: 'icons', class: Google::Apis::DriveV2::App::Icon, decorator: Google::Apis::DriveV2::App::Icon::Representation
      
          property :id, as: 'id'
          property :installed, as: 'installed'
          property :kind, as: 'kind'
          property :long_description, as: 'longDescription'
          property :name, as: 'name'
          property :object_type, as: 'objectType'
          property :open_url_template, as: 'openUrlTemplate'
          collection :primary_file_extensions, as: 'primaryFileExtensions'
          collection :primary_mime_types, as: 'primaryMimeTypes'
          property :product_id, as: 'productId'
          property :product_url, as: 'productUrl'
          collection :secondary_file_extensions, as: 'secondaryFileExtensions'
          collection :secondary_mime_types, as: 'secondaryMimeTypes'
          property :short_description, as: 'shortDescription'
          property :supports_create, as: 'supportsCreate'
          property :supports_import, as: 'supportsImport'
          property :supports_multi_open, as: 'supportsMultiOpen'
          property :supports_offline_create, as: 'supportsOfflineCreate'
          property :use_by_default, as: 'useByDefault'
        end
        
        class Icon
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :category, as: 'category'
            property :icon_url, as: 'iconUrl'
            property :size, as: 'size'
          end
        end
      end
      
      class AppList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :default_app_ids, as: 'defaultAppIds'
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::DriveV2::App, decorator: Google::Apis::DriveV2::App::Representation
      
          property :kind, as: 'kind'
          property :self_link, as: 'selfLink'
        end
      end
      
      class Change
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :change_type, as: 'changeType'
          property :deleted, as: 'deleted'
          property :drive, as: 'drive', class: Google::Apis::DriveV2::Drive, decorator: Google::Apis::DriveV2::Drive::Representation
      
          property :drive_id, as: 'driveId'
          property :file, as: 'file', class: Google::Apis::DriveV2::File, decorator: Google::Apis::DriveV2::File::Representation
      
          property :file_id, as: 'fileId'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :modification_date, as: 'modificationDate', type: DateTime
      
          property :self_link, as: 'selfLink'
          property :team_drive, as: 'teamDrive', class: Google::Apis::DriveV2::TeamDrive, decorator: Google::Apis::DriveV2::TeamDrive::Representation
      
          property :team_drive_id, as: 'teamDriveId'
          property :type, as: 'type'
        end
      end
      
      class ChangeList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::DriveV2::Change, decorator: Google::Apis::DriveV2::Change::Representation
      
          property :kind, as: 'kind'
          property :largest_change_id, :numeric_string => true, as: 'largestChangeId'
          property :new_start_page_token, as: 'newStartPageToken'
          property :next_link, as: 'nextLink'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
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
      
      class ChildList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::DriveV2::ChildReference, decorator: Google::Apis::DriveV2::ChildReference::Representation
      
          property :kind, as: 'kind'
          property :next_link, as: 'nextLink'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
        end
      end
      
      class ChildReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :child_link, as: 'childLink'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :self_link, as: 'selfLink'
        end
      end
      
      class Comment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :anchor, as: 'anchor'
          property :author, as: 'author', class: Google::Apis::DriveV2::User, decorator: Google::Apis::DriveV2::User::Representation
      
          property :comment_id, as: 'commentId'
          property :content, as: 'content'
          property :context, as: 'context', class: Google::Apis::DriveV2::Comment::Context, decorator: Google::Apis::DriveV2::Comment::Context::Representation
      
          property :created_date, as: 'createdDate', type: DateTime
      
          property :deleted, as: 'deleted'
          property :file_id, as: 'fileId'
          property :file_title, as: 'fileTitle'
          property :html_content, as: 'htmlContent'
          property :kind, as: 'kind'
          property :modified_date, as: 'modifiedDate', type: DateTime
      
          collection :replies, as: 'replies', class: Google::Apis::DriveV2::CommentReply, decorator: Google::Apis::DriveV2::CommentReply::Representation
      
          property :self_link, as: 'selfLink'
          property :status, as: 'status'
        end
        
        class Context
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :type, as: 'type'
            property :value, as: 'value'
          end
        end
      end
      
      class CommentList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::DriveV2::Comment, decorator: Google::Apis::DriveV2::Comment::Representation
      
          property :kind, as: 'kind'
          property :next_link, as: 'nextLink'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
        end
      end
      
      class CommentReply
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :author, as: 'author', class: Google::Apis::DriveV2::User, decorator: Google::Apis::DriveV2::User::Representation
      
          property :content, as: 'content'
          property :created_date, as: 'createdDate', type: DateTime
      
          property :deleted, as: 'deleted'
          property :html_content, as: 'htmlContent'
          property :kind, as: 'kind'
          property :modified_date, as: 'modifiedDate', type: DateTime
      
          property :reply_id, as: 'replyId'
          property :verb, as: 'verb'
        end
      end
      
      class CommentReplyList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::DriveV2::CommentReply, decorator: Google::Apis::DriveV2::CommentReply::Representation
      
          property :kind, as: 'kind'
          property :next_link, as: 'nextLink'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
        end
      end
      
      class Drive
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :background_image_file, as: 'backgroundImageFile', class: Google::Apis::DriveV2::Drive::BackgroundImageFile, decorator: Google::Apis::DriveV2::Drive::BackgroundImageFile::Representation
      
          property :background_image_link, as: 'backgroundImageLink'
          property :capabilities, as: 'capabilities', class: Google::Apis::DriveV2::Drive::Capabilities, decorator: Google::Apis::DriveV2::Drive::Capabilities::Representation
      
          property :color_rgb, as: 'colorRgb'
          property :created_date, as: 'createdDate', type: DateTime
      
          property :hidden, as: 'hidden'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :restrictions, as: 'restrictions', class: Google::Apis::DriveV2::Drive::Restrictions, decorator: Google::Apis::DriveV2::Drive::Restrictions::Representation
      
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
          collection :items, as: 'items', class: Google::Apis::DriveV2::Drive, decorator: Google::Apis::DriveV2::Drive::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class File
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :alternate_link, as: 'alternateLink'
          property :app_data_contents, as: 'appDataContents'
          property :can_comment, as: 'canComment'
          property :can_read_revisions, as: 'canReadRevisions'
          property :capabilities, as: 'capabilities', class: Google::Apis::DriveV2::File::Capabilities, decorator: Google::Apis::DriveV2::File::Capabilities::Representation
      
          property :copy_requires_writer_permission, as: 'copyRequiresWriterPermission'
          property :copyable, as: 'copyable'
          property :created_date, as: 'createdDate', type: DateTime
      
          property :default_open_with_link, as: 'defaultOpenWithLink'
          property :description, as: 'description'
          property :download_url, as: 'downloadUrl'
          property :drive_id, as: 'driveId'
          property :editable, as: 'editable'
          property :embed_link, as: 'embedLink'
          property :etag, as: 'etag'
          property :explicitly_trashed, as: 'explicitlyTrashed'
          hash :export_links, as: 'exportLinks'
          property :file_extension, as: 'fileExtension'
          property :file_size, :numeric_string => true, as: 'fileSize'
          property :folder_color_rgb, as: 'folderColorRgb'
          property :full_file_extension, as: 'fullFileExtension'
          property :has_augmented_permissions, as: 'hasAugmentedPermissions'
          property :has_thumbnail, as: 'hasThumbnail'
          property :head_revision_id, as: 'headRevisionId'
          property :icon_link, as: 'iconLink'
          property :id, as: 'id'
          property :image_media_metadata, as: 'imageMediaMetadata', class: Google::Apis::DriveV2::File::ImageMediaMetadata, decorator: Google::Apis::DriveV2::File::ImageMediaMetadata::Representation
      
          property :indexable_text, as: 'indexableText', class: Google::Apis::DriveV2::File::IndexableText, decorator: Google::Apis::DriveV2::File::IndexableText::Representation
      
          property :is_app_authorized, as: 'isAppAuthorized'
          property :kind, as: 'kind'
          property :labels, as: 'labels', class: Google::Apis::DriveV2::File::Labels, decorator: Google::Apis::DriveV2::File::Labels::Representation
      
          property :last_modifying_user, as: 'lastModifyingUser', class: Google::Apis::DriveV2::User, decorator: Google::Apis::DriveV2::User::Representation
      
          property :last_modifying_user_name, as: 'lastModifyingUserName'
          property :last_viewed_by_me_date, as: 'lastViewedByMeDate', type: DateTime
      
          property :marked_viewed_by_me_date, as: 'markedViewedByMeDate', type: DateTime
      
          property :md5_checksum, as: 'md5Checksum'
          property :mime_type, as: 'mimeType'
          property :modified_by_me_date, as: 'modifiedByMeDate', type: DateTime
      
          property :modified_date, as: 'modifiedDate', type: DateTime
      
          hash :open_with_links, as: 'openWithLinks'
          property :original_filename, as: 'originalFilename'
          property :owned_by_me, as: 'ownedByMe'
          collection :owner_names, as: 'ownerNames'
          collection :owners, as: 'owners', class: Google::Apis::DriveV2::User, decorator: Google::Apis::DriveV2::User::Representation
      
          collection :parents, as: 'parents', class: Google::Apis::DriveV2::ParentReference, decorator: Google::Apis::DriveV2::ParentReference::Representation
      
          collection :permission_ids, as: 'permissionIds'
          collection :permissions, as: 'permissions', class: Google::Apis::DriveV2::Permission, decorator: Google::Apis::DriveV2::Permission::Representation
      
          collection :properties, as: 'properties', class: Google::Apis::DriveV2::Property, decorator: Google::Apis::DriveV2::Property::Representation
      
          property :quota_bytes_used, :numeric_string => true, as: 'quotaBytesUsed'
          property :self_link, as: 'selfLink'
          property :shareable, as: 'shareable'
          property :shared, as: 'shared'
          property :shared_with_me_date, as: 'sharedWithMeDate', type: DateTime
      
          property :sharing_user, as: 'sharingUser', class: Google::Apis::DriveV2::User, decorator: Google::Apis::DriveV2::User::Representation
      
          collection :spaces, as: 'spaces'
          property :team_drive_id, as: 'teamDriveId'
          property :thumbnail, as: 'thumbnail', class: Google::Apis::DriveV2::File::Thumbnail, decorator: Google::Apis::DriveV2::File::Thumbnail::Representation
      
          property :thumbnail_link, as: 'thumbnailLink'
          property :thumbnail_version, :numeric_string => true, as: 'thumbnailVersion'
          property :title, as: 'title'
          property :trashed_date, as: 'trashedDate', type: DateTime
      
          property :trashing_user, as: 'trashingUser', class: Google::Apis::DriveV2::User, decorator: Google::Apis::DriveV2::User::Representation
      
          property :user_permission, as: 'userPermission', class: Google::Apis::DriveV2::Permission, decorator: Google::Apis::DriveV2::Permission::Representation
      
          property :version, :numeric_string => true, as: 'version'
          property :video_media_metadata, as: 'videoMediaMetadata', class: Google::Apis::DriveV2::File::VideoMediaMetadata, decorator: Google::Apis::DriveV2::File::VideoMediaMetadata::Representation
      
          property :web_content_link, as: 'webContentLink'
          property :web_view_link, as: 'webViewLink'
          property :writers_can_share, as: 'writersCanShare'
        end
        
        class Capabilities
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :can_add_children, as: 'canAddChildren'
            property :can_change_copy_requires_writer_permission, as: 'canChangeCopyRequiresWriterPermission'
            property :can_change_restricted_download, as: 'canChangeRestrictedDownload'
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
        
        class ImageMediaMetadata
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :aperture, as: 'aperture'
            property :camera_make, as: 'cameraMake'
            property :camera_model, as: 'cameraModel'
            property :color_space, as: 'colorSpace'
            property :date, as: 'date'
            property :exposure_bias, as: 'exposureBias'
            property :exposure_mode, as: 'exposureMode'
            property :exposure_time, as: 'exposureTime'
            property :flash_used, as: 'flashUsed'
            property :focal_length, as: 'focalLength'
            property :height, as: 'height'
            property :iso_speed, as: 'isoSpeed'
            property :lens, as: 'lens'
            property :location, as: 'location', class: Google::Apis::DriveV2::File::ImageMediaMetadata::Location, decorator: Google::Apis::DriveV2::File::ImageMediaMetadata::Location::Representation
        
            property :max_aperture_value, as: 'maxApertureValue'
            property :metering_mode, as: 'meteringMode'
            property :rotation, as: 'rotation'
            property :sensor, as: 'sensor'
            property :subject_distance, as: 'subjectDistance'
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
        
        class IndexableText
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :text, as: 'text'
          end
        end
        
        class Labels
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :hidden, as: 'hidden'
            property :modified, as: 'modified'
            property :restricted, as: 'restricted'
            property :starred, as: 'starred'
            property :trashed, as: 'trashed'
            property :viewed, as: 'viewed'
          end
        end
        
        class Thumbnail
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :image, :base64 => true, as: 'image'
            property :mime_type, as: 'mimeType'
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
          property :etag, as: 'etag'
          property :incomplete_search, as: 'incompleteSearch'
          collection :items, as: 'items', class: Google::Apis::DriveV2::File, decorator: Google::Apis::DriveV2::File::Representation
      
          property :kind, as: 'kind'
          property :next_link, as: 'nextLink'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
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
      
      class ParentList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::DriveV2::ParentReference, decorator: Google::Apis::DriveV2::ParentReference::Representation
      
          property :kind, as: 'kind'
          property :self_link, as: 'selfLink'
        end
      end
      
      class ParentReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :is_root, as: 'isRoot'
          property :kind, as: 'kind'
          property :parent_link, as: 'parentLink'
          property :self_link, as: 'selfLink'
        end
      end
      
      class Permission
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :additional_roles, as: 'additionalRoles'
          property :auth_key, as: 'authKey'
          property :deleted, as: 'deleted'
          property :domain, as: 'domain'
          property :email_address, as: 'emailAddress'
          property :etag, as: 'etag'
          property :expiration_date, as: 'expirationDate', type: DateTime
      
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          collection :permission_details, as: 'permissionDetails', class: Google::Apis::DriveV2::Permission::PermissionDetail, decorator: Google::Apis::DriveV2::Permission::PermissionDetail::Representation
      
          property :photo_link, as: 'photoLink'
          property :role, as: 'role'
          property :self_link, as: 'selfLink'
          collection :team_drive_permission_details, as: 'teamDrivePermissionDetails', class: Google::Apis::DriveV2::Permission::TeamDrivePermissionDetail, decorator: Google::Apis::DriveV2::Permission::TeamDrivePermissionDetail::Representation
      
          property :type, as: 'type'
          property :value, as: 'value'
          property :with_link, as: 'withLink'
        end
        
        class PermissionDetail
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :additional_roles, as: 'additionalRoles'
            property :inherited, as: 'inherited'
            property :inherited_from, as: 'inheritedFrom'
            property :permission_type, as: 'permissionType'
            property :role, as: 'role'
          end
        end
        
        class TeamDrivePermissionDetail
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :additional_roles, as: 'additionalRoles'
            property :inherited, as: 'inherited'
            property :inherited_from, as: 'inheritedFrom'
            property :role, as: 'role'
            property :team_drive_permission_type, as: 'teamDrivePermissionType'
          end
        end
      end
      
      class PermissionId
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :kind, as: 'kind'
        end
      end
      
      class PermissionList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::DriveV2::Permission, decorator: Google::Apis::DriveV2::Permission::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
        end
      end
      
      class Property
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :key, as: 'key'
          property :kind, as: 'kind'
          property :self_link, as: 'selfLink'
          property :value, as: 'value'
          property :visibility, as: 'visibility'
        end
      end
      
      class PropertyList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::DriveV2::Property, decorator: Google::Apis::DriveV2::Property::Representation
      
          property :kind, as: 'kind'
          property :self_link, as: 'selfLink'
        end
      end
      
      class Revision
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :download_url, as: 'downloadUrl'
          property :etag, as: 'etag'
          hash :export_links, as: 'exportLinks'
          property :file_size, :numeric_string => true, as: 'fileSize'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :last_modifying_user, as: 'lastModifyingUser', class: Google::Apis::DriveV2::User, decorator: Google::Apis::DriveV2::User::Representation
      
          property :last_modifying_user_name, as: 'lastModifyingUserName'
          property :md5_checksum, as: 'md5Checksum'
          property :mime_type, as: 'mimeType'
          property :modified_date, as: 'modifiedDate', type: DateTime
      
          property :original_filename, as: 'originalFilename'
          property :pinned, as: 'pinned'
          property :publish_auto, as: 'publishAuto'
          property :published, as: 'published'
          property :published_link, as: 'publishedLink'
          property :published_outside_domain, as: 'publishedOutsideDomain'
          property :self_link, as: 'selfLink'
        end
      end
      
      class RevisionList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::DriveV2::Revision, decorator: Google::Apis::DriveV2::Revision::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
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
          property :background_image_file, as: 'backgroundImageFile', class: Google::Apis::DriveV2::TeamDrive::BackgroundImageFile, decorator: Google::Apis::DriveV2::TeamDrive::BackgroundImageFile::Representation
      
          property :background_image_link, as: 'backgroundImageLink'
          property :capabilities, as: 'capabilities', class: Google::Apis::DriveV2::TeamDrive::Capabilities, decorator: Google::Apis::DriveV2::TeamDrive::Capabilities::Representation
      
          property :color_rgb, as: 'colorRgb'
          property :created_date, as: 'createdDate', type: DateTime
      
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :restrictions, as: 'restrictions', class: Google::Apis::DriveV2::TeamDrive::Restrictions, decorator: Google::Apis::DriveV2::TeamDrive::Restrictions::Representation
      
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
          collection :items, as: 'items', class: Google::Apis::DriveV2::TeamDrive, decorator: Google::Apis::DriveV2::TeamDrive::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class User
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_name, as: 'displayName'
          property :email_address, as: 'emailAddress'
          property :is_authenticated_user, as: 'isAuthenticatedUser'
          property :kind, as: 'kind'
          property :permission_id, as: 'permissionId'
          property :picture, as: 'picture', class: Google::Apis::DriveV2::User::Picture, decorator: Google::Apis::DriveV2::User::Picture::Representation
      
        end
        
        class Picture
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :url, as: 'url'
          end
        end
      end
    end
  end
end
