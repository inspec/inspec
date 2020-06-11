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
    module AppsactivityV1
      
      # An Activity resource is a combined view of multiple events. An activity has a
      # list of individual events and a combined view of the common fields among all
      # events.
      class Activity
        include Google::Apis::Core::Hashable
      
        # Represents the changes associated with an action taken by a user.
        # Corresponds to the JSON property `combinedEvent`
        # @return [Google::Apis::AppsactivityV1::Event]
        attr_accessor :combined_event
      
        # A list of all the Events that make up the Activity.
        # Corresponds to the JSON property `singleEvents`
        # @return [Array<Google::Apis::AppsactivityV1::Event>]
        attr_accessor :single_events
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @combined_event = args[:combined_event] if args.key?(:combined_event)
          @single_events = args[:single_events] if args.key?(:single_events)
        end
      end
      
      # Represents the changes associated with an action taken by a user.
      class Event
        include Google::Apis::Core::Hashable
      
        # Additional event types. Some events may have multiple types when multiple
        # actions are part of a single event. For example, creating a document, renaming
        # it, and sharing it may be part of a single file-creation event.
        # Corresponds to the JSON property `additionalEventTypes`
        # @return [Array<String>]
        attr_accessor :additional_event_types
      
        # The time at which the event occurred formatted as Unix time in milliseconds.
        # Corresponds to the JSON property `eventTimeMillis`
        # @return [Fixnum]
        attr_accessor :event_time_millis
      
        # Whether this event is caused by a user being deleted.
        # Corresponds to the JSON property `fromUserDeletion`
        # @return [Boolean]
        attr_accessor :from_user_deletion
        alias_method :from_user_deletion?, :from_user_deletion
      
        # Contains information about changes in an object's parents as a result of a
        # move type event.
        # Corresponds to the JSON property `move`
        # @return [Google::Apis::AppsactivityV1::Move]
        attr_accessor :move
      
        # Extra information for permissionChange type events, such as the user or group
        # the new permission applies to.
        # Corresponds to the JSON property `permissionChanges`
        # @return [Array<Google::Apis::AppsactivityV1::PermissionChange>]
        attr_accessor :permission_changes
      
        # The main type of event that occurred.
        # Corresponds to the JSON property `primaryEventType`
        # @return [String]
        attr_accessor :primary_event_type
      
        # Contains information about a renametype event.
        # Corresponds to the JSON property `rename`
        # @return [Google::Apis::AppsactivityV1::Rename]
        attr_accessor :rename
      
        # Information about the object modified by the event.
        # Corresponds to the JSON property `target`
        # @return [Google::Apis::AppsactivityV1::Target]
        attr_accessor :target
      
        # A representation of a user.
        # Corresponds to the JSON property `user`
        # @return [Google::Apis::AppsactivityV1::User]
        attr_accessor :user
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @additional_event_types = args[:additional_event_types] if args.key?(:additional_event_types)
          @event_time_millis = args[:event_time_millis] if args.key?(:event_time_millis)
          @from_user_deletion = args[:from_user_deletion] if args.key?(:from_user_deletion)
          @move = args[:move] if args.key?(:move)
          @permission_changes = args[:permission_changes] if args.key?(:permission_changes)
          @primary_event_type = args[:primary_event_type] if args.key?(:primary_event_type)
          @rename = args[:rename] if args.key?(:rename)
          @target = args[:target] if args.key?(:target)
          @user = args[:user] if args.key?(:user)
        end
      end
      
      # The response from the list request. Contains a list of activities and a token
      # to retrieve the next page of results.
      class ListActivitiesResponse
        include Google::Apis::Core::Hashable
      
        # List of activities.
        # Corresponds to the JSON property `activities`
        # @return [Array<Google::Apis::AppsactivityV1::Activity>]
        attr_accessor :activities
      
        # Token for the next page of results.
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
      
      # Contains information about changes in an object's parents as a result of a
      # move type event.
      class Move
        include Google::Apis::Core::Hashable
      
        # The added parent(s).
        # Corresponds to the JSON property `addedParents`
        # @return [Array<Google::Apis::AppsactivityV1::Parent>]
        attr_accessor :added_parents
      
        # The removed parent(s).
        # Corresponds to the JSON property `removedParents`
        # @return [Array<Google::Apis::AppsactivityV1::Parent>]
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
      
      # Contains information about a parent object. For example, a folder in Drive is
      # a parent for all files within it.
      class Parent
        include Google::Apis::Core::Hashable
      
        # The parent's ID.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Whether this is the root folder.
        # Corresponds to the JSON property `isRoot`
        # @return [Boolean]
        attr_accessor :is_root
        alias_method :is_root?, :is_root
      
        # The parent's title.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @is_root = args[:is_root] if args.key?(:is_root)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Contains information about the permissions and type of access allowed with
      # regards to a Google Drive object. This is a subset of the fields contained in
      # a corresponding Drive Permissions object.
      class Permission
        include Google::Apis::Core::Hashable
      
        # The name of the user or group the permission applies to.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The ID for this permission. Corresponds to the Drive API's permission ID
        # returned as part of the Drive Permissions resource.
        # Corresponds to the JSON property `permissionId`
        # @return [String]
        attr_accessor :permission_id
      
        # Indicates the Google Drive permissions role. The role determines a user's
        # ability to read, write, or comment on the file.
        # Corresponds to the JSON property `role`
        # @return [String]
        attr_accessor :role
      
        # Indicates how widely permissions are granted.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # A representation of a user.
        # Corresponds to the JSON property `user`
        # @return [Google::Apis::AppsactivityV1::User]
        attr_accessor :user
      
        # Whether the permission requires a link to the file.
        # Corresponds to the JSON property `withLink`
        # @return [Boolean]
        attr_accessor :with_link
        alias_method :with_link?, :with_link
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @permission_id = args[:permission_id] if args.key?(:permission_id)
          @role = args[:role] if args.key?(:role)
          @type = args[:type] if args.key?(:type)
          @user = args[:user] if args.key?(:user)
          @with_link = args[:with_link] if args.key?(:with_link)
        end
      end
      
      # Contains information about a Drive object's permissions that changed as a
      # result of a permissionChange type event.
      class PermissionChange
        include Google::Apis::Core::Hashable
      
        # Lists all Permission objects added.
        # Corresponds to the JSON property `addedPermissions`
        # @return [Array<Google::Apis::AppsactivityV1::Permission>]
        attr_accessor :added_permissions
      
        # Lists all Permission objects removed.
        # Corresponds to the JSON property `removedPermissions`
        # @return [Array<Google::Apis::AppsactivityV1::Permission>]
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
      
      # Photo information for a user.
      class Photo
        include Google::Apis::Core::Hashable
      
        # The URL of the photo.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # Contains information about a renametype event.
      class Rename
        include Google::Apis::Core::Hashable
      
        # The new title.
        # Corresponds to the JSON property `newTitle`
        # @return [String]
        attr_accessor :new_title
      
        # The old title.
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
      
      # Information about the object modified by the event.
      class Target
        include Google::Apis::Core::Hashable
      
        # The ID of the target. For example, in Google Drive, this is the file or folder
        # ID.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The MIME type of the target.
        # Corresponds to the JSON property `mimeType`
        # @return [String]
        attr_accessor :mime_type
      
        # The name of the target. For example, in Google Drive, this is the title of the
        # file.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @mime_type = args[:mime_type] if args.key?(:mime_type)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # A representation of a user.
      class User
        include Google::Apis::Core::Hashable
      
        # A boolean which indicates whether the specified User was deleted. If true,
        # name, photo and permission_id will be omitted.
        # Corresponds to the JSON property `isDeleted`
        # @return [Boolean]
        attr_accessor :is_deleted
        alias_method :is_deleted?, :is_deleted
      
        # Whether the user is the authenticated user.
        # Corresponds to the JSON property `isMe`
        # @return [Boolean]
        attr_accessor :is_me
        alias_method :is_me?, :is_me
      
        # The displayable name of the user.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The permission ID associated with this user. Equivalent to the Drive API's
        # permission ID for this user, returned as part of the Drive Permissions
        # resource.
        # Corresponds to the JSON property `permissionId`
        # @return [String]
        attr_accessor :permission_id
      
        # Photo information for a user.
        # Corresponds to the JSON property `photo`
        # @return [Google::Apis::AppsactivityV1::Photo]
        attr_accessor :photo
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @is_deleted = args[:is_deleted] if args.key?(:is_deleted)
          @is_me = args[:is_me] if args.key?(:is_me)
          @name = args[:name] if args.key?(:name)
          @permission_id = args[:permission_id] if args.key?(:permission_id)
          @photo = args[:photo] if args.key?(:photo)
        end
      end
    end
  end
end
