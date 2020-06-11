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
      
      # Information about the action.
      class Action
        include Google::Apis::Core::Hashable
      
        # The actor of a Drive activity.
        # Corresponds to the JSON property `actor`
        # @return [Google::Apis::DriveactivityV2::Actor]
        attr_accessor :actor
      
        # Data describing the type and additional information of an action.
        # Corresponds to the JSON property `detail`
        # @return [Google::Apis::DriveactivityV2::ActionDetail]
        attr_accessor :detail
      
        # Information about the target of activity.
        # Corresponds to the JSON property `target`
        # @return [Google::Apis::DriveactivityV2::Target]
        attr_accessor :target
      
        # Information about time ranges.
        # Corresponds to the JSON property `timeRange`
        # @return [Google::Apis::DriveactivityV2::TimeRange]
        attr_accessor :time_range
      
        # The action occurred at this specific time.
        # Corresponds to the JSON property `timestamp`
        # @return [String]
        attr_accessor :timestamp
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @actor = args[:actor] if args.key?(:actor)
          @detail = args[:detail] if args.key?(:detail)
          @target = args[:target] if args.key?(:target)
          @time_range = args[:time_range] if args.key?(:time_range)
          @timestamp = args[:timestamp] if args.key?(:timestamp)
        end
      end
      
      # Data describing the type and additional information of an action.
      class ActionDetail
        include Google::Apis::Core::Hashable
      
        # A change about comments on an object.
        # Corresponds to the JSON property `comment`
        # @return [Google::Apis::DriveactivityV2::Comment]
        attr_accessor :comment
      
        # An object was created.
        # Corresponds to the JSON property `create`
        # @return [Google::Apis::DriveactivityV2::Create]
        attr_accessor :create
      
        # An object was deleted.
        # Corresponds to the JSON property `delete`
        # @return [Google::Apis::DriveactivityV2::Delete]
        attr_accessor :delete
      
        # A change in the object's data leak prevention status.
        # Corresponds to the JSON property `dlpChange`
        # @return [Google::Apis::DriveactivityV2::DataLeakPreventionChange]
        attr_accessor :dlp_change
      
        # An empty message indicating an object was edited.
        # Corresponds to the JSON property `edit`
        # @return [Google::Apis::DriveactivityV2::Edit]
        attr_accessor :edit
      
        # An object was moved.
        # Corresponds to the JSON property `move`
        # @return [Google::Apis::DriveactivityV2::Move]
        attr_accessor :move
      
        # A change of the permission setting on an item.
        # Corresponds to the JSON property `permissionChange`
        # @return [Google::Apis::DriveactivityV2::PermissionChange]
        attr_accessor :permission_change
      
        # Activity in applications other than Drive.
        # Corresponds to the JSON property `reference`
        # @return [Google::Apis::DriveactivityV2::ApplicationReference]
        attr_accessor :reference
      
        # An object was renamed.
        # Corresponds to the JSON property `rename`
        # @return [Google::Apis::DriveactivityV2::Rename]
        attr_accessor :rename
      
        # A deleted object was restored.
        # Corresponds to the JSON property `restore`
        # @return [Google::Apis::DriveactivityV2::Restore]
        attr_accessor :restore
      
        # Information about settings changes.
        # Corresponds to the JSON property `settingsChange`
        # @return [Google::Apis::DriveactivityV2::SettingsChange]
        attr_accessor :settings_change
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @comment = args[:comment] if args.key?(:comment)
          @create = args[:create] if args.key?(:create)
          @delete = args[:delete] if args.key?(:delete)
          @dlp_change = args[:dlp_change] if args.key?(:dlp_change)
          @edit = args[:edit] if args.key?(:edit)
          @move = args[:move] if args.key?(:move)
          @permission_change = args[:permission_change] if args.key?(:permission_change)
          @reference = args[:reference] if args.key?(:reference)
          @rename = args[:rename] if args.key?(:rename)
          @restore = args[:restore] if args.key?(:restore)
          @settings_change = args[:settings_change] if args.key?(:settings_change)
        end
      end
      
      # The actor of a Drive activity.
      class Actor
        include Google::Apis::Core::Hashable
      
        # Empty message representing an administrator.
        # Corresponds to the JSON property `administrator`
        # @return [Google::Apis::DriveactivityV2::Administrator]
        attr_accessor :administrator
      
        # Empty message representing an anonymous user or indicating the authenticated
        # user should be anonymized.
        # Corresponds to the JSON property `anonymous`
        # @return [Google::Apis::DriveactivityV2::AnonymousUser]
        attr_accessor :anonymous
      
        # Information about an impersonation, where an admin acts on behalf of an end
        # user. Information about the acting admin is not currently available.
        # Corresponds to the JSON property `impersonation`
        # @return [Google::Apis::DriveactivityV2::Impersonation]
        attr_accessor :impersonation
      
        # Event triggered by system operations instead of end users.
        # Corresponds to the JSON property `system`
        # @return [Google::Apis::DriveactivityV2::SystemEvent]
        attr_accessor :system
      
        # Information about an end user.
        # Corresponds to the JSON property `user`
        # @return [Google::Apis::DriveactivityV2::User]
        attr_accessor :user
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @administrator = args[:administrator] if args.key?(:administrator)
          @anonymous = args[:anonymous] if args.key?(:anonymous)
          @impersonation = args[:impersonation] if args.key?(:impersonation)
          @system = args[:system] if args.key?(:system)
          @user = args[:user] if args.key?(:user)
        end
      end
      
      # Empty message representing an administrator.
      class Administrator
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Empty message representing an anonymous user or indicating the authenticated
      # user should be anonymized.
      class AnonymousUser
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Represents any user (including a logged out user).
      class Anyone
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Activity in applications other than Drive.
      class ApplicationReference
        include Google::Apis::Core::Hashable
      
        # The reference type corresponding to this event.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # A comment with an assignment.
      class Assignment
        include Google::Apis::Core::Hashable
      
        # The sub-type of this event.
        # Corresponds to the JSON property `subtype`
        # @return [String]
        attr_accessor :subtype
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @subtype = args[:subtype] if args.key?(:subtype)
        end
      end
      
      # A change about comments on an object.
      class Comment
        include Google::Apis::Core::Hashable
      
        # A comment with an assignment.
        # Corresponds to the JSON property `assignment`
        # @return [Google::Apis::DriveactivityV2::Assignment]
        attr_accessor :assignment
      
        # Users who are mentioned in this comment.
        # Corresponds to the JSON property `mentionedUsers`
        # @return [Array<Google::Apis::DriveactivityV2::User>]
        attr_accessor :mentioned_users
      
        # A regular posted comment.
        # Corresponds to the JSON property `post`
        # @return [Google::Apis::DriveactivityV2::Post]
        attr_accessor :post
      
        # A suggestion.
        # Corresponds to the JSON property `suggestion`
        # @return [Google::Apis::DriveactivityV2::Suggestion]
        attr_accessor :suggestion
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @assignment = args[:assignment] if args.key?(:assignment)
          @mentioned_users = args[:mentioned_users] if args.key?(:mentioned_users)
          @post = args[:post] if args.key?(:post)
          @suggestion = args[:suggestion] if args.key?(:suggestion)
        end
      end
      
      # How the individual activities are consolidated. A set of activities may be
      # consolidated into one combined activity if they are related in some way, such
      # as one actor performing the same action on multiple targets, or multiple
      # actors performing the same action on a single target. The strategy defines
      # the rules for which activities are related.
      class ConsolidationStrategy
        include Google::Apis::Core::Hashable
      
        # A strategy which consolidates activities using the grouping rules from the
        # legacy V1 Activity API. Similar actions occurring within a window of time
        # can be grouped across multiple targets (such as moving a set of files at
        # once) or multiple actors (such as several users editing the same item).
        # Grouping rules for this strategy are specific to each type of action.
        # Corresponds to the JSON property `legacy`
        # @return [Google::Apis::DriveactivityV2::Legacy]
        attr_accessor :legacy
      
        # A strategy which does no consolidation of individual activities.
        # Corresponds to the JSON property `none`
        # @return [Google::Apis::DriveactivityV2::NoConsolidation]
        attr_accessor :none
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @legacy = args[:legacy] if args.key?(:legacy)
          @none = args[:none] if args.key?(:none)
        end
      end
      
      # An object was created by copying an existing object.
      class Copy
        include Google::Apis::Core::Hashable
      
        # A lightweight reference to the target of activity.
        # Corresponds to the JSON property `originalObject`
        # @return [Google::Apis::DriveactivityV2::TargetReference]
        attr_accessor :original_object
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @original_object = args[:original_object] if args.key?(:original_object)
        end
      end
      
      # An object was created.
      class Create
        include Google::Apis::Core::Hashable
      
        # An object was created by copying an existing object.
        # Corresponds to the JSON property `copy`
        # @return [Google::Apis::DriveactivityV2::Copy]
        attr_accessor :copy
      
        # An object was created from scratch.
        # Corresponds to the JSON property `new`
        # @return [Google::Apis::DriveactivityV2::New]
        attr_accessor :new
      
        # An object was uploaded into Drive.
        # Corresponds to the JSON property `upload`
        # @return [Google::Apis::DriveactivityV2::Upload]
        attr_accessor :upload
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @copy = args[:copy] if args.key?(:copy)
          @new = args[:new] if args.key?(:new)
          @upload = args[:upload] if args.key?(:upload)
        end
      end
      
      # A change in the object's data leak prevention status.
      class DataLeakPreventionChange
        include Google::Apis::Core::Hashable
      
        # The type of Data Leak Prevention (DLP) change.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # An object was deleted.
      class Delete
        include Google::Apis::Core::Hashable
      
        # The type of delete action taken.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # A user whose account has since been deleted.
      class DeletedUser
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Information about a domain.
      class Domain
        include Google::Apis::Core::Hashable
      
        # An opaque string used to identify this domain.
        # Corresponds to the JSON property `legacyId`
        # @return [String]
        attr_accessor :legacy_id
      
        # The name of the domain, e.g. "google.com".
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @legacy_id = args[:legacy_id] if args.key?(:legacy_id)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Information about a shared drive.
      class Drive
        include Google::Apis::Core::Hashable
      
        # The resource name of the shared drive. The format is
        # "COLLECTION_ID/DRIVE_ID". Clients should not assume a specific collection
        # ID for this resource name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # A Drive item, such as a file or folder.
        # Corresponds to the JSON property `root`
        # @return [Google::Apis::DriveactivityV2::DriveItem]
        attr_accessor :root
      
        # The title of the shared drive.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @root = args[:root] if args.key?(:root)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # A single Drive activity comprising one or more Actions by one or more
      # Actors on one or more Targets. Some Action groupings occur spontaneously,
      # such as moving an item into a shared folder triggering a permission change.
      # Other groupings of related Actions, such as multiple Actors editing one item
      # or moving multiple files into a new folder, are controlled by the selection
      # of a ConsolidationStrategy in the QueryDriveActivityRequest.
      class DriveActivity
        include Google::Apis::Core::Hashable
      
        # Details on all actions in this activity.
        # Corresponds to the JSON property `actions`
        # @return [Array<Google::Apis::DriveactivityV2::Action>]
        attr_accessor :actions
      
        # All actor(s) responsible for the activity.
        # Corresponds to the JSON property `actors`
        # @return [Array<Google::Apis::DriveactivityV2::Actor>]
        attr_accessor :actors
      
        # Data describing the type and additional information of an action.
        # Corresponds to the JSON property `primaryActionDetail`
        # @return [Google::Apis::DriveactivityV2::ActionDetail]
        attr_accessor :primary_action_detail
      
        # All Google Drive objects this activity is about (e.g. file, folder, drive).
        # This represents the state of the target immediately after the actions
        # occurred.
        # Corresponds to the JSON property `targets`
        # @return [Array<Google::Apis::DriveactivityV2::Target>]
        attr_accessor :targets
      
        # Information about time ranges.
        # Corresponds to the JSON property `timeRange`
        # @return [Google::Apis::DriveactivityV2::TimeRange]
        attr_accessor :time_range
      
        # The activity occurred at this specific time.
        # Corresponds to the JSON property `timestamp`
        # @return [String]
        attr_accessor :timestamp
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @actions = args[:actions] if args.key?(:actions)
          @actors = args[:actors] if args.key?(:actors)
          @primary_action_detail = args[:primary_action_detail] if args.key?(:primary_action_detail)
          @targets = args[:targets] if args.key?(:targets)
          @time_range = args[:time_range] if args.key?(:time_range)
          @timestamp = args[:timestamp] if args.key?(:timestamp)
        end
      end
      
      # A Drive item which is a file.
      class DriveFile
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # A Drive item which is a folder.
      class DriveFolder
        include Google::Apis::Core::Hashable
      
        # The type of Drive folder.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # A Drive item, such as a file or folder.
      class DriveItem
        include Google::Apis::Core::Hashable
      
        # A Drive item which is a file.
        # Corresponds to the JSON property `driveFile`
        # @return [Google::Apis::DriveactivityV2::DriveFile]
        attr_accessor :drive_file
      
        # A Drive item which is a folder.
        # Corresponds to the JSON property `driveFolder`
        # @return [Google::Apis::DriveactivityV2::DriveFolder]
        attr_accessor :drive_folder
      
        # This item is deprecated; please see `DriveFile` instead.
        # Corresponds to the JSON property `file`
        # @return [Google::Apis::DriveactivityV2::File]
        attr_accessor :file
      
        # This item is deprecated; please see `DriveFolder` instead.
        # Corresponds to the JSON property `folder`
        # @return [Google::Apis::DriveactivityV2::Folder]
        attr_accessor :folder
      
        # The MIME type of the Drive item.  See
        # https://developers.google.com/drive/v3/web/mime-types.
        # Corresponds to the JSON property `mimeType`
        # @return [String]
        attr_accessor :mime_type
      
        # The target Drive item. The format is "items/ITEM_ID".
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Information about the owner of a Drive item.
        # Corresponds to the JSON property `owner`
        # @return [Google::Apis::DriveactivityV2::Owner]
        attr_accessor :owner
      
        # The title of the Drive item.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @drive_file = args[:drive_file] if args.key?(:drive_file)
          @drive_folder = args[:drive_folder] if args.key?(:drive_folder)
          @file = args[:file] if args.key?(:file)
          @folder = args[:folder] if args.key?(:folder)
          @mime_type = args[:mime_type] if args.key?(:mime_type)
          @name = args[:name] if args.key?(:name)
          @owner = args[:owner] if args.key?(:owner)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # A lightweight reference to a Drive item, such as a file or folder.
      class DriveItemReference
        include Google::Apis::Core::Hashable
      
        # A Drive item which is a file.
        # Corresponds to the JSON property `driveFile`
        # @return [Google::Apis::DriveactivityV2::DriveFile]
        attr_accessor :drive_file
      
        # A Drive item which is a folder.
        # Corresponds to the JSON property `driveFolder`
        # @return [Google::Apis::DriveactivityV2::DriveFolder]
        attr_accessor :drive_folder
      
        # This item is deprecated; please see `DriveFile` instead.
        # Corresponds to the JSON property `file`
        # @return [Google::Apis::DriveactivityV2::File]
        attr_accessor :file
      
        # This item is deprecated; please see `DriveFolder` instead.
        # Corresponds to the JSON property `folder`
        # @return [Google::Apis::DriveactivityV2::Folder]
        attr_accessor :folder
      
        # The target Drive item. The format is "items/ITEM_ID".
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The title of the Drive item.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @drive_file = args[:drive_file] if args.key?(:drive_file)
          @drive_folder = args[:drive_folder] if args.key?(:drive_folder)
          @file = args[:file] if args.key?(:file)
          @folder = args[:folder] if args.key?(:folder)
          @name = args[:name] if args.key?(:name)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # A lightweight reference to a shared drive.
      class DriveReference
        include Google::Apis::Core::Hashable
      
        # The resource name of the shared drive. The format is
        # "COLLECTION_ID/DRIVE_ID". Clients should not assume a specific collection
        # ID for this resource name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The title of the shared drive.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # An empty message indicating an object was edited.
      class Edit
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # This item is deprecated; please see `DriveFile` instead.
      class File
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # A comment on a file.
      class FileComment
        include Google::Apis::Core::Hashable
      
        # The comment in the discussion thread. This identifier is an opaque string
        # compatible with the Drive API; see
        # https://developers.google.com/drive/v3/reference/comments/get
        # Corresponds to the JSON property `legacyCommentId`
        # @return [String]
        attr_accessor :legacy_comment_id
      
        # The discussion thread to which the comment was added. This identifier is an
        # opaque string compatible with the Drive API and references the first
        # comment in a discussion; see
        # https://developers.google.com/drive/v3/reference/comments/get
        # Corresponds to the JSON property `legacyDiscussionId`
        # @return [String]
        attr_accessor :legacy_discussion_id
      
        # The link to the discussion thread containing this comment, for example,
        # "https://docs.google.com/DOCUMENT_ID/edit?disco=THREAD_ID".
        # Corresponds to the JSON property `linkToDiscussion`
        # @return [String]
        attr_accessor :link_to_discussion
      
        # A Drive item, such as a file or folder.
        # Corresponds to the JSON property `parent`
        # @return [Google::Apis::DriveactivityV2::DriveItem]
        attr_accessor :parent
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @legacy_comment_id = args[:legacy_comment_id] if args.key?(:legacy_comment_id)
          @legacy_discussion_id = args[:legacy_discussion_id] if args.key?(:legacy_discussion_id)
          @link_to_discussion = args[:link_to_discussion] if args.key?(:link_to_discussion)
          @parent = args[:parent] if args.key?(:parent)
        end
      end
      
      # This item is deprecated; please see `DriveFolder` instead.
      class Folder
        include Google::Apis::Core::Hashable
      
        # This field is deprecated; please see `DriveFolder.type` instead.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Information about a group.
      class Group
        include Google::Apis::Core::Hashable
      
        # The email address of the group.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # The title of the group.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @email = args[:email] if args.key?(:email)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Information about an impersonation, where an admin acts on behalf of an end
      # user. Information about the acting admin is not currently available.
      class Impersonation
        include Google::Apis::Core::Hashable
      
        # Information about an end user.
        # Corresponds to the JSON property `impersonatedUser`
        # @return [Google::Apis::DriveactivityV2::User]
        attr_accessor :impersonated_user
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @impersonated_user = args[:impersonated_user] if args.key?(:impersonated_user)
        end
      end
      
      # A known user.
      class KnownUser
        include Google::Apis::Core::Hashable
      
        # True if this is the user making the request.
        # Corresponds to the JSON property `isCurrentUser`
        # @return [Boolean]
        attr_accessor :is_current_user
        alias_method :is_current_user?, :is_current_user
      
        # The identifier for this user that can be used with the People API to get
        # more information. The format is "people/ACCOUNT_ID". See
        # https://developers.google.com/people/.
        # Corresponds to the JSON property `personName`
        # @return [String]
        attr_accessor :person_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @is_current_user = args[:is_current_user] if args.key?(:is_current_user)
          @person_name = args[:person_name] if args.key?(:person_name)
        end
      end
      
      # A strategy which consolidates activities using the grouping rules from the
      # legacy V1 Activity API. Similar actions occurring within a window of time
      # can be grouped across multiple targets (such as moving a set of files at
      # once) or multiple actors (such as several users editing the same item).
      # Grouping rules for this strategy are specific to each type of action.
      class Legacy
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # An object was moved.
      class Move
        include Google::Apis::Core::Hashable
      
        # The added parent object(s).
        # Corresponds to the JSON property `addedParents`
        # @return [Array<Google::Apis::DriveactivityV2::TargetReference>]
        attr_accessor :added_parents
      
        # The removed parent object(s).
        # Corresponds to the JSON property `removedParents`
        # @return [Array<Google::Apis::DriveactivityV2::TargetReference>]
        attr_accessor :removed_parents
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @added_parents = args[:added_parents] if args.key?(:added_parents)
          @removed_parents = args[:removed_parents] if args.key?(:removed_parents)
        end
      end
      
      # An object was created from scratch.
      class New
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # A strategy which does no consolidation of individual activities.
      class NoConsolidation
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Information about the owner of a Drive item.
      class Owner
        include Google::Apis::Core::Hashable
      
        # Information about a domain.
        # Corresponds to the JSON property `domain`
        # @return [Google::Apis::DriveactivityV2::Domain]
        attr_accessor :domain
      
        # A lightweight reference to a shared drive.
        # Corresponds to the JSON property `drive`
        # @return [Google::Apis::DriveactivityV2::DriveReference]
        attr_accessor :drive
      
        # This item is deprecated; please see `DriveReference` instead.
        # Corresponds to the JSON property `teamDrive`
        # @return [Google::Apis::DriveactivityV2::TeamDriveReference]
        attr_accessor :team_drive
      
        # Information about an end user.
        # Corresponds to the JSON property `user`
        # @return [Google::Apis::DriveactivityV2::User]
        attr_accessor :user
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @domain = args[:domain] if args.key?(:domain)
          @drive = args[:drive] if args.key?(:drive)
          @team_drive = args[:team_drive] if args.key?(:team_drive)
          @user = args[:user] if args.key?(:user)
        end
      end
      
      # The permission setting of an object.
      class Permission
        include Google::Apis::Core::Hashable
      
        # If true, the item can be discovered (e.g. in the user's "Shared with me"
        # collection) without needing a link to the item.
        # Corresponds to the JSON property `allowDiscovery`
        # @return [Boolean]
        attr_accessor :allow_discovery
        alias_method :allow_discovery?, :allow_discovery
      
        # Represents any user (including a logged out user).
        # Corresponds to the JSON property `anyone`
        # @return [Google::Apis::DriveactivityV2::Anyone]
        attr_accessor :anyone
      
        # Information about a domain.
        # Corresponds to the JSON property `domain`
        # @return [Google::Apis::DriveactivityV2::Domain]
        attr_accessor :domain
      
        # Information about a group.
        # Corresponds to the JSON property `group`
        # @return [Google::Apis::DriveactivityV2::Group]
        attr_accessor :group
      
        # Indicates the
        # <a href="/drive/web/manage-sharing#roles">Google Drive permissions
        # role</a>. The role determines a user's ability to read, write, and
        # comment on items.
        # Corresponds to the JSON property `role`
        # @return [String]
        attr_accessor :role
      
        # Information about an end user.
        # Corresponds to the JSON property `user`
        # @return [Google::Apis::DriveactivityV2::User]
        attr_accessor :user
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @allow_discovery = args[:allow_discovery] if args.key?(:allow_discovery)
          @anyone = args[:anyone] if args.key?(:anyone)
          @domain = args[:domain] if args.key?(:domain)
          @group = args[:group] if args.key?(:group)
          @role = args[:role] if args.key?(:role)
          @user = args[:user] if args.key?(:user)
        end
      end
      
      # A change of the permission setting on an item.
      class PermissionChange
        include Google::Apis::Core::Hashable
      
        # The set of permissions added by this change.
        # Corresponds to the JSON property `addedPermissions`
        # @return [Array<Google::Apis::DriveactivityV2::Permission>]
        attr_accessor :added_permissions
      
        # The set of permissions removed by this change.
        # Corresponds to the JSON property `removedPermissions`
        # @return [Array<Google::Apis::DriveactivityV2::Permission>]
        attr_accessor :removed_permissions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @added_permissions = args[:added_permissions] if args.key?(:added_permissions)
          @removed_permissions = args[:removed_permissions] if args.key?(:removed_permissions)
        end
      end
      
      # A regular posted comment.
      class Post
        include Google::Apis::Core::Hashable
      
        # The sub-type of this event.
        # Corresponds to the JSON property `subtype`
        # @return [String]
        attr_accessor :subtype
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @subtype = args[:subtype] if args.key?(:subtype)
        end
      end
      
      # The request message for querying Drive activity.
      class QueryDriveActivityRequest
        include Google::Apis::Core::Hashable
      
        # Return activities for this Drive folder and all children and descendants.
        # The format is "items/ITEM_ID".
        # Corresponds to the JSON property `ancestorName`
        # @return [String]
        attr_accessor :ancestor_name
      
        # How the individual activities are consolidated. A set of activities may be
        # consolidated into one combined activity if they are related in some way, such
        # as one actor performing the same action on multiple targets, or multiple
        # actors performing the same action on a single target. The strategy defines
        # the rules for which activities are related.
        # Corresponds to the JSON property `consolidationStrategy`
        # @return [Google::Apis::DriveactivityV2::ConsolidationStrategy]
        attr_accessor :consolidation_strategy
      
        # The filtering for items returned from this query request. The format of the
        # filter string is a sequence of expressions, joined by an optional "AND",
        # where each expression is of the form "field operator value".
        # Supported fields:
        # - <tt>time</tt>: Uses numerical operators on date values either in
        # terms of milliseconds since Jan 1, 1970 or in RFC 3339 format.
        # Examples:
        # - <tt>time > 1452409200000 AND time <= 1492812924310</tt>
        # - <tt>time >= "2016-01-10T01:02:03-05:00"</tt>
        # - <tt>detail.action_detail_case</tt>: Uses the "has" operator (:) and
        # either a singular value or a list of allowed action types enclosed in
        # parentheses.
        # Examples:
        # - <tt>detail.action_detail_case: RENAME</tt>
        # - <tt>detail.action_detail_case:(CREATE UPLOAD)</tt>
        # - <tt>-detail.action_detail_case:MOVE</tt>
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        # Return activities for this Drive item. The format is
        # "items/ITEM_ID".
        # Corresponds to the JSON property `itemName`
        # @return [String]
        attr_accessor :item_name
      
        # The requested number of activity to return. If not set, a default value
        # will be used.
        # Corresponds to the JSON property `pageSize`
        # @return [Fixnum]
        attr_accessor :page_size
      
        # The next_page_token value returned from a previous QueryDriveActivity
        # request, if any.
        # Corresponds to the JSON property `pageToken`
        # @return [String]
        attr_accessor :page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ancestor_name = args[:ancestor_name] if args.key?(:ancestor_name)
          @consolidation_strategy = args[:consolidation_strategy] if args.key?(:consolidation_strategy)
          @filter = args[:filter] if args.key?(:filter)
          @item_name = args[:item_name] if args.key?(:item_name)
          @page_size = args[:page_size] if args.key?(:page_size)
          @page_token = args[:page_token] if args.key?(:page_token)
        end
      end
      
      # Response message for querying Drive activity.
      class QueryDriveActivityResponse
        include Google::Apis::Core::Hashable
      
        # List of activity requested.
        # Corresponds to the JSON property `activities`
        # @return [Array<Google::Apis::DriveactivityV2::DriveActivity>]
        attr_accessor :activities
      
        # Token to retrieve the next page of results, or
        # empty if there are no more results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @activities = args[:activities] if args.key?(:activities)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # An object was renamed.
      class Rename
        include Google::Apis::Core::Hashable
      
        # The new title of the drive object.
        # Corresponds to the JSON property `newTitle`
        # @return [String]
        attr_accessor :new_title
      
        # The previous title of the drive object.
        # Corresponds to the JSON property `oldTitle`
        # @return [String]
        attr_accessor :old_title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @new_title = args[:new_title] if args.key?(:new_title)
          @old_title = args[:old_title] if args.key?(:old_title)
        end
      end
      
      # A deleted object was restored.
      class Restore
        include Google::Apis::Core::Hashable
      
        # The type of restore action taken.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Information about restriction policy changes to a feature.
      class RestrictionChange
        include Google::Apis::Core::Hashable
      
        # The feature which had a change in restriction policy.
        # Corresponds to the JSON property `feature`
        # @return [String]
        attr_accessor :feature
      
        # The restriction in place after the change.
        # Corresponds to the JSON property `newRestriction`
        # @return [String]
        attr_accessor :new_restriction
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @feature = args[:feature] if args.key?(:feature)
          @new_restriction = args[:new_restriction] if args.key?(:new_restriction)
        end
      end
      
      # Information about settings changes.
      class SettingsChange
        include Google::Apis::Core::Hashable
      
        # The set of changes made to restrictions.
        # Corresponds to the JSON property `restrictionChanges`
        # @return [Array<Google::Apis::DriveactivityV2::RestrictionChange>]
        attr_accessor :restriction_changes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @restriction_changes = args[:restriction_changes] if args.key?(:restriction_changes)
        end
      end
      
      # A suggestion.
      class Suggestion
        include Google::Apis::Core::Hashable
      
        # The sub-type of this event.
        # Corresponds to the JSON property `subtype`
        # @return [String]
        attr_accessor :subtype
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @subtype = args[:subtype] if args.key?(:subtype)
        end
      end
      
      # Event triggered by system operations instead of end users.
      class SystemEvent
        include Google::Apis::Core::Hashable
      
        # The type of the system event that may triggered activity.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Information about the target of activity.
      class Target
        include Google::Apis::Core::Hashable
      
        # Information about a shared drive.
        # Corresponds to the JSON property `drive`
        # @return [Google::Apis::DriveactivityV2::Drive]
        attr_accessor :drive
      
        # A Drive item, such as a file or folder.
        # Corresponds to the JSON property `driveItem`
        # @return [Google::Apis::DriveactivityV2::DriveItem]
        attr_accessor :drive_item
      
        # A comment on a file.
        # Corresponds to the JSON property `fileComment`
        # @return [Google::Apis::DriveactivityV2::FileComment]
        attr_accessor :file_comment
      
        # This item is deprecated; please see `Drive` instead.
        # Corresponds to the JSON property `teamDrive`
        # @return [Google::Apis::DriveactivityV2::TeamDrive]
        attr_accessor :team_drive
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @drive = args[:drive] if args.key?(:drive)
          @drive_item = args[:drive_item] if args.key?(:drive_item)
          @file_comment = args[:file_comment] if args.key?(:file_comment)
          @team_drive = args[:team_drive] if args.key?(:team_drive)
        end
      end
      
      # A lightweight reference to the target of activity.
      class TargetReference
        include Google::Apis::Core::Hashable
      
        # A lightweight reference to a shared drive.
        # Corresponds to the JSON property `drive`
        # @return [Google::Apis::DriveactivityV2::DriveReference]
        attr_accessor :drive
      
        # A lightweight reference to a Drive item, such as a file or folder.
        # Corresponds to the JSON property `driveItem`
        # @return [Google::Apis::DriveactivityV2::DriveItemReference]
        attr_accessor :drive_item
      
        # This item is deprecated; please see `DriveReference` instead.
        # Corresponds to the JSON property `teamDrive`
        # @return [Google::Apis::DriveactivityV2::TeamDriveReference]
        attr_accessor :team_drive
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @drive = args[:drive] if args.key?(:drive)
          @drive_item = args[:drive_item] if args.key?(:drive_item)
          @team_drive = args[:team_drive] if args.key?(:team_drive)
        end
      end
      
      # This item is deprecated; please see `Drive` instead.
      class TeamDrive
        include Google::Apis::Core::Hashable
      
        # This field is deprecated; please see `Drive.name` instead.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # A Drive item, such as a file or folder.
        # Corresponds to the JSON property `root`
        # @return [Google::Apis::DriveactivityV2::DriveItem]
        attr_accessor :root
      
        # This field is deprecated; please see `Drive.title` instead.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @root = args[:root] if args.key?(:root)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # This item is deprecated; please see `DriveReference` instead.
      class TeamDriveReference
        include Google::Apis::Core::Hashable
      
        # This field is deprecated; please see `DriveReference.name` instead.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # This field is deprecated; please see `DriveReference.title` instead.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Information about time ranges.
      class TimeRange
        include Google::Apis::Core::Hashable
      
        # The end of the time range.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # The start of the time range.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_time = args[:end_time] if args.key?(:end_time)
          @start_time = args[:start_time] if args.key?(:start_time)
        end
      end
      
      # A user about whom nothing is currently known.
      class UnknownUser
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # An object was uploaded into Drive.
      class Upload
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Information about an end user.
      class User
        include Google::Apis::Core::Hashable
      
        # A user whose account has since been deleted.
        # Corresponds to the JSON property `deletedUser`
        # @return [Google::Apis::DriveactivityV2::DeletedUser]
        attr_accessor :deleted_user
      
        # A known user.
        # Corresponds to the JSON property `knownUser`
        # @return [Google::Apis::DriveactivityV2::KnownUser]
        attr_accessor :known_user
      
        # A user about whom nothing is currently known.
        # Corresponds to the JSON property `unknownUser`
        # @return [Google::Apis::DriveactivityV2::UnknownUser]
        attr_accessor :unknown_user
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @deleted_user = args[:deleted_user] if args.key?(:deleted_user)
          @known_user = args[:known_user] if args.key?(:known_user)
          @unknown_user = args[:unknown_user] if args.key?(:unknown_user)
        end
      end
    end
  end
end
