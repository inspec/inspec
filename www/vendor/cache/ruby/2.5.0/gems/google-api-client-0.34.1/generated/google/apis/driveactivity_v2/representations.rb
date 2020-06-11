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
    module DriveactivityV2
      
      class Action
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ActionDetail
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Actor
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Administrator
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AnonymousUser
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Anyone
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ApplicationReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Assignment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Comment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConsolidationStrategy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Copy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Create
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DataLeakPreventionChange
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Delete
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeletedUser
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Domain
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Drive
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DriveActivity
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DriveFile
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DriveFolder
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DriveItem
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DriveItemReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DriveReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Edit
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class File
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FileComment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Folder
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Group
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Impersonation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class KnownUser
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Legacy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Move
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class New
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NoConsolidation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Owner
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Permission
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PermissionChange
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Post
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class QueryDriveActivityRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class QueryDriveActivityResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Rename
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Restore
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RestrictionChange
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SettingsChange
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Suggestion
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SystemEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Target
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TeamDrive
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TeamDriveReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TimeRange
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UnknownUser
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Upload
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class User
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Action
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :actor, as: 'actor', class: Google::Apis::DriveactivityV2::Actor, decorator: Google::Apis::DriveactivityV2::Actor::Representation
      
          property :detail, as: 'detail', class: Google::Apis::DriveactivityV2::ActionDetail, decorator: Google::Apis::DriveactivityV2::ActionDetail::Representation
      
          property :target, as: 'target', class: Google::Apis::DriveactivityV2::Target, decorator: Google::Apis::DriveactivityV2::Target::Representation
      
          property :time_range, as: 'timeRange', class: Google::Apis::DriveactivityV2::TimeRange, decorator: Google::Apis::DriveactivityV2::TimeRange::Representation
      
          property :timestamp, as: 'timestamp'
        end
      end
      
      class ActionDetail
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :comment, as: 'comment', class: Google::Apis::DriveactivityV2::Comment, decorator: Google::Apis::DriveactivityV2::Comment::Representation
      
          property :create, as: 'create', class: Google::Apis::DriveactivityV2::Create, decorator: Google::Apis::DriveactivityV2::Create::Representation
      
          property :delete, as: 'delete', class: Google::Apis::DriveactivityV2::Delete, decorator: Google::Apis::DriveactivityV2::Delete::Representation
      
          property :dlp_change, as: 'dlpChange', class: Google::Apis::DriveactivityV2::DataLeakPreventionChange, decorator: Google::Apis::DriveactivityV2::DataLeakPreventionChange::Representation
      
          property :edit, as: 'edit', class: Google::Apis::DriveactivityV2::Edit, decorator: Google::Apis::DriveactivityV2::Edit::Representation
      
          property :move, as: 'move', class: Google::Apis::DriveactivityV2::Move, decorator: Google::Apis::DriveactivityV2::Move::Representation
      
          property :permission_change, as: 'permissionChange', class: Google::Apis::DriveactivityV2::PermissionChange, decorator: Google::Apis::DriveactivityV2::PermissionChange::Representation
      
          property :reference, as: 'reference', class: Google::Apis::DriveactivityV2::ApplicationReference, decorator: Google::Apis::DriveactivityV2::ApplicationReference::Representation
      
          property :rename, as: 'rename', class: Google::Apis::DriveactivityV2::Rename, decorator: Google::Apis::DriveactivityV2::Rename::Representation
      
          property :restore, as: 'restore', class: Google::Apis::DriveactivityV2::Restore, decorator: Google::Apis::DriveactivityV2::Restore::Representation
      
          property :settings_change, as: 'settingsChange', class: Google::Apis::DriveactivityV2::SettingsChange, decorator: Google::Apis::DriveactivityV2::SettingsChange::Representation
      
        end
      end
      
      class Actor
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :administrator, as: 'administrator', class: Google::Apis::DriveactivityV2::Administrator, decorator: Google::Apis::DriveactivityV2::Administrator::Representation
      
          property :anonymous, as: 'anonymous', class: Google::Apis::DriveactivityV2::AnonymousUser, decorator: Google::Apis::DriveactivityV2::AnonymousUser::Representation
      
          property :impersonation, as: 'impersonation', class: Google::Apis::DriveactivityV2::Impersonation, decorator: Google::Apis::DriveactivityV2::Impersonation::Representation
      
          property :system, as: 'system', class: Google::Apis::DriveactivityV2::SystemEvent, decorator: Google::Apis::DriveactivityV2::SystemEvent::Representation
      
          property :user, as: 'user', class: Google::Apis::DriveactivityV2::User, decorator: Google::Apis::DriveactivityV2::User::Representation
      
        end
      end
      
      class Administrator
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class AnonymousUser
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class Anyone
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class ApplicationReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :type, as: 'type'
        end
      end
      
      class Assignment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :subtype, as: 'subtype'
        end
      end
      
      class Comment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :assignment, as: 'assignment', class: Google::Apis::DriveactivityV2::Assignment, decorator: Google::Apis::DriveactivityV2::Assignment::Representation
      
          collection :mentioned_users, as: 'mentionedUsers', class: Google::Apis::DriveactivityV2::User, decorator: Google::Apis::DriveactivityV2::User::Representation
      
          property :post, as: 'post', class: Google::Apis::DriveactivityV2::Post, decorator: Google::Apis::DriveactivityV2::Post::Representation
      
          property :suggestion, as: 'suggestion', class: Google::Apis::DriveactivityV2::Suggestion, decorator: Google::Apis::DriveactivityV2::Suggestion::Representation
      
        end
      end
      
      class ConsolidationStrategy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :legacy, as: 'legacy', class: Google::Apis::DriveactivityV2::Legacy, decorator: Google::Apis::DriveactivityV2::Legacy::Representation
      
          property :none, as: 'none', class: Google::Apis::DriveactivityV2::NoConsolidation, decorator: Google::Apis::DriveactivityV2::NoConsolidation::Representation
      
        end
      end
      
      class Copy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :original_object, as: 'originalObject', class: Google::Apis::DriveactivityV2::TargetReference, decorator: Google::Apis::DriveactivityV2::TargetReference::Representation
      
        end
      end
      
      class Create
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :copy, as: 'copy', class: Google::Apis::DriveactivityV2::Copy, decorator: Google::Apis::DriveactivityV2::Copy::Representation
      
          property :new, as: 'new', class: Google::Apis::DriveactivityV2::New, decorator: Google::Apis::DriveactivityV2::New::Representation
      
          property :upload, as: 'upload', class: Google::Apis::DriveactivityV2::Upload, decorator: Google::Apis::DriveactivityV2::Upload::Representation
      
        end
      end
      
      class DataLeakPreventionChange
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :type, as: 'type'
        end
      end
      
      class Delete
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :type, as: 'type'
        end
      end
      
      class DeletedUser
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class Domain
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :legacy_id, as: 'legacyId'
          property :name, as: 'name'
        end
      end
      
      class Drive
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :root, as: 'root', class: Google::Apis::DriveactivityV2::DriveItem, decorator: Google::Apis::DriveactivityV2::DriveItem::Representation
      
          property :title, as: 'title'
        end
      end
      
      class DriveActivity
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :actions, as: 'actions', class: Google::Apis::DriveactivityV2::Action, decorator: Google::Apis::DriveactivityV2::Action::Representation
      
          collection :actors, as: 'actors', class: Google::Apis::DriveactivityV2::Actor, decorator: Google::Apis::DriveactivityV2::Actor::Representation
      
          property :primary_action_detail, as: 'primaryActionDetail', class: Google::Apis::DriveactivityV2::ActionDetail, decorator: Google::Apis::DriveactivityV2::ActionDetail::Representation
      
          collection :targets, as: 'targets', class: Google::Apis::DriveactivityV2::Target, decorator: Google::Apis::DriveactivityV2::Target::Representation
      
          property :time_range, as: 'timeRange', class: Google::Apis::DriveactivityV2::TimeRange, decorator: Google::Apis::DriveactivityV2::TimeRange::Representation
      
          property :timestamp, as: 'timestamp'
        end
      end
      
      class DriveFile
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class DriveFolder
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :type, as: 'type'
        end
      end
      
      class DriveItem
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :drive_file, as: 'driveFile', class: Google::Apis::DriveactivityV2::DriveFile, decorator: Google::Apis::DriveactivityV2::DriveFile::Representation
      
          property :drive_folder, as: 'driveFolder', class: Google::Apis::DriveactivityV2::DriveFolder, decorator: Google::Apis::DriveactivityV2::DriveFolder::Representation
      
          property :file, as: 'file', class: Google::Apis::DriveactivityV2::File, decorator: Google::Apis::DriveactivityV2::File::Representation
      
          property :folder, as: 'folder', class: Google::Apis::DriveactivityV2::Folder, decorator: Google::Apis::DriveactivityV2::Folder::Representation
      
          property :mime_type, as: 'mimeType'
          property :name, as: 'name'
          property :owner, as: 'owner', class: Google::Apis::DriveactivityV2::Owner, decorator: Google::Apis::DriveactivityV2::Owner::Representation
      
          property :title, as: 'title'
        end
      end
      
      class DriveItemReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :drive_file, as: 'driveFile', class: Google::Apis::DriveactivityV2::DriveFile, decorator: Google::Apis::DriveactivityV2::DriveFile::Representation
      
          property :drive_folder, as: 'driveFolder', class: Google::Apis::DriveactivityV2::DriveFolder, decorator: Google::Apis::DriveactivityV2::DriveFolder::Representation
      
          property :file, as: 'file', class: Google::Apis::DriveactivityV2::File, decorator: Google::Apis::DriveactivityV2::File::Representation
      
          property :folder, as: 'folder', class: Google::Apis::DriveactivityV2::Folder, decorator: Google::Apis::DriveactivityV2::Folder::Representation
      
          property :name, as: 'name'
          property :title, as: 'title'
        end
      end
      
      class DriveReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :title, as: 'title'
        end
      end
      
      class Edit
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class File
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class FileComment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :legacy_comment_id, as: 'legacyCommentId'
          property :legacy_discussion_id, as: 'legacyDiscussionId'
          property :link_to_discussion, as: 'linkToDiscussion'
          property :parent, as: 'parent', class: Google::Apis::DriveactivityV2::DriveItem, decorator: Google::Apis::DriveactivityV2::DriveItem::Representation
      
        end
      end
      
      class Folder
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :type, as: 'type'
        end
      end
      
      class Group
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :email, as: 'email'
          property :title, as: 'title'
        end
      end
      
      class Impersonation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :impersonated_user, as: 'impersonatedUser', class: Google::Apis::DriveactivityV2::User, decorator: Google::Apis::DriveactivityV2::User::Representation
      
        end
      end
      
      class KnownUser
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :is_current_user, as: 'isCurrentUser'
          property :person_name, as: 'personName'
        end
      end
      
      class Legacy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class Move
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :added_parents, as: 'addedParents', class: Google::Apis::DriveactivityV2::TargetReference, decorator: Google::Apis::DriveactivityV2::TargetReference::Representation
      
          collection :removed_parents, as: 'removedParents', class: Google::Apis::DriveactivityV2::TargetReference, decorator: Google::Apis::DriveactivityV2::TargetReference::Representation
      
        end
      end
      
      class New
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class NoConsolidation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class Owner
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :domain, as: 'domain', class: Google::Apis::DriveactivityV2::Domain, decorator: Google::Apis::DriveactivityV2::Domain::Representation
      
          property :drive, as: 'drive', class: Google::Apis::DriveactivityV2::DriveReference, decorator: Google::Apis::DriveactivityV2::DriveReference::Representation
      
          property :team_drive, as: 'teamDrive', class: Google::Apis::DriveactivityV2::TeamDriveReference, decorator: Google::Apis::DriveactivityV2::TeamDriveReference::Representation
      
          property :user, as: 'user', class: Google::Apis::DriveactivityV2::User, decorator: Google::Apis::DriveactivityV2::User::Representation
      
        end
      end
      
      class Permission
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :allow_discovery, as: 'allowDiscovery'
          property :anyone, as: 'anyone', class: Google::Apis::DriveactivityV2::Anyone, decorator: Google::Apis::DriveactivityV2::Anyone::Representation
      
          property :domain, as: 'domain', class: Google::Apis::DriveactivityV2::Domain, decorator: Google::Apis::DriveactivityV2::Domain::Representation
      
          property :group, as: 'group', class: Google::Apis::DriveactivityV2::Group, decorator: Google::Apis::DriveactivityV2::Group::Representation
      
          property :role, as: 'role'
          property :user, as: 'user', class: Google::Apis::DriveactivityV2::User, decorator: Google::Apis::DriveactivityV2::User::Representation
      
        end
      end
      
      class PermissionChange
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :added_permissions, as: 'addedPermissions', class: Google::Apis::DriveactivityV2::Permission, decorator: Google::Apis::DriveactivityV2::Permission::Representation
      
          collection :removed_permissions, as: 'removedPermissions', class: Google::Apis::DriveactivityV2::Permission, decorator: Google::Apis::DriveactivityV2::Permission::Representation
      
        end
      end
      
      class Post
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :subtype, as: 'subtype'
        end
      end
      
      class QueryDriveActivityRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ancestor_name, as: 'ancestorName'
          property :consolidation_strategy, as: 'consolidationStrategy', class: Google::Apis::DriveactivityV2::ConsolidationStrategy, decorator: Google::Apis::DriveactivityV2::ConsolidationStrategy::Representation
      
          property :filter, as: 'filter'
          property :item_name, as: 'itemName'
          property :page_size, as: 'pageSize'
          property :page_token, as: 'pageToken'
        end
      end
      
      class QueryDriveActivityResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :activities, as: 'activities', class: Google::Apis::DriveactivityV2::DriveActivity, decorator: Google::Apis::DriveactivityV2::DriveActivity::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class Rename
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :new_title, as: 'newTitle'
          property :old_title, as: 'oldTitle'
        end
      end
      
      class Restore
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :type, as: 'type'
        end
      end
      
      class RestrictionChange
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :feature, as: 'feature'
          property :new_restriction, as: 'newRestriction'
        end
      end
      
      class SettingsChange
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :restriction_changes, as: 'restrictionChanges', class: Google::Apis::DriveactivityV2::RestrictionChange, decorator: Google::Apis::DriveactivityV2::RestrictionChange::Representation
      
        end
      end
      
      class Suggestion
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :subtype, as: 'subtype'
        end
      end
      
      class SystemEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :type, as: 'type'
        end
      end
      
      class Target
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :drive, as: 'drive', class: Google::Apis::DriveactivityV2::Drive, decorator: Google::Apis::DriveactivityV2::Drive::Representation
      
          property :drive_item, as: 'driveItem', class: Google::Apis::DriveactivityV2::DriveItem, decorator: Google::Apis::DriveactivityV2::DriveItem::Representation
      
          property :file_comment, as: 'fileComment', class: Google::Apis::DriveactivityV2::FileComment, decorator: Google::Apis::DriveactivityV2::FileComment::Representation
      
          property :team_drive, as: 'teamDrive', class: Google::Apis::DriveactivityV2::TeamDrive, decorator: Google::Apis::DriveactivityV2::TeamDrive::Representation
      
        end
      end
      
      class TargetReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :drive, as: 'drive', class: Google::Apis::DriveactivityV2::DriveReference, decorator: Google::Apis::DriveactivityV2::DriveReference::Representation
      
          property :drive_item, as: 'driveItem', class: Google::Apis::DriveactivityV2::DriveItemReference, decorator: Google::Apis::DriveactivityV2::DriveItemReference::Representation
      
          property :team_drive, as: 'teamDrive', class: Google::Apis::DriveactivityV2::TeamDriveReference, decorator: Google::Apis::DriveactivityV2::TeamDriveReference::Representation
      
        end
      end
      
      class TeamDrive
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :root, as: 'root', class: Google::Apis::DriveactivityV2::DriveItem, decorator: Google::Apis::DriveactivityV2::DriveItem::Representation
      
          property :title, as: 'title'
        end
      end
      
      class TeamDriveReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :title, as: 'title'
        end
      end
      
      class TimeRange
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_time, as: 'endTime'
          property :start_time, as: 'startTime'
        end
      end
      
      class UnknownUser
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class Upload
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class User
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :deleted_user, as: 'deletedUser', class: Google::Apis::DriveactivityV2::DeletedUser, decorator: Google::Apis::DriveactivityV2::DeletedUser::Representation
      
          property :known_user, as: 'knownUser', class: Google::Apis::DriveactivityV2::KnownUser, decorator: Google::Apis::DriveactivityV2::KnownUser::Representation
      
          property :unknown_user, as: 'unknownUser', class: Google::Apis::DriveactivityV2::UnknownUser, decorator: Google::Apis::DriveactivityV2::UnknownUser::Representation
      
        end
      end
    end
  end
end
