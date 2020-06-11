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
    module CalendarV3
      
      # 
      class Acl
        include Google::Apis::Core::Hashable
      
        # ETag of the collection.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # List of rules on the access control list.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::CalendarV3::AclRule>]
        attr_accessor :items
      
        # Type of the collection ("calendar#acl").
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Token used to access the next page of this result. Omitted if no further
        # results are available, in which case nextSyncToken is provided.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Token used at a later point in time to retrieve only the entries that have
        # changed since this result was returned. Omitted if further results are
        # available, in which case nextPageToken is provided.
        # Corresponds to the JSON property `nextSyncToken`
        # @return [String]
        attr_accessor :next_sync_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @next_sync_token = args[:next_sync_token] if args.key?(:next_sync_token)
        end
      end
      
      # 
      class AclRule
        include Google::Apis::Core::Hashable
      
        # ETag of the resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Identifier of the ACL rule.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Type of the resource ("calendar#aclRule").
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The role assigned to the scope. Possible values are:
        # - "none" - Provides no access.
        # - "freeBusyReader" - Provides read access to free/busy information.
        # - "reader" - Provides read access to the calendar. Private events will appear
        # to users with reader access, but event details will be hidden.
        # - "writer" - Provides read and write access to the calendar. Private events
        # will appear to users with writer access, and event details will be visible.
        # - "owner" - Provides ownership of the calendar. This role has all of the
        # permissions of the writer role with the additional ability to see and
        # manipulate ACLs.
        # Corresponds to the JSON property `role`
        # @return [String]
        attr_accessor :role
      
        # The scope of the rule.
        # Corresponds to the JSON property `scope`
        # @return [Google::Apis::CalendarV3::AclRule::Scope]
        attr_accessor :scope
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @role = args[:role] if args.key?(:role)
          @scope = args[:scope] if args.key?(:scope)
        end
        
        # The scope of the rule.
        class Scope
          include Google::Apis::Core::Hashable
        
          # The type of the scope. Possible values are:
          # - "default" - The public scope. This is the default value.
          # - "user" - Limits the scope to a single user.
          # - "group" - Limits the scope to a group.
          # - "domain" - Limits the scope to a domain.  Note: The permissions granted to
          # the "default", or public, scope apply to any user, authenticated or not.
          # Corresponds to the JSON property `type`
          # @return [String]
          attr_accessor :type
        
          # The email address of a user or group, or the name of a domain, depending on
          # the scope type. Omitted for type "default".
          # Corresponds to the JSON property `value`
          # @return [String]
          attr_accessor :value
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @type = args[:type] if args.key?(:type)
            @value = args[:value] if args.key?(:value)
          end
        end
      end
      
      # 
      class Calendar
        include Google::Apis::Core::Hashable
      
        # Conferencing properties for this calendar, for example what types of
        # conferences are allowed.
        # Corresponds to the JSON property `conferenceProperties`
        # @return [Google::Apis::CalendarV3::ConferenceProperties]
        attr_accessor :conference_properties
      
        # Description of the calendar. Optional.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # ETag of the resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Identifier of the calendar. To retrieve IDs call the calendarList.list()
        # method.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Type of the resource ("calendar#calendar").
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Geographic location of the calendar as free-form text. Optional.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # Title of the calendar.
        # Corresponds to the JSON property `summary`
        # @return [String]
        attr_accessor :summary
      
        # The time zone of the calendar. (Formatted as an IANA Time Zone Database name,
        # e.g. "Europe/Zurich".) Optional.
        # Corresponds to the JSON property `timeZone`
        # @return [String]
        attr_accessor :time_zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @conference_properties = args[:conference_properties] if args.key?(:conference_properties)
          @description = args[:description] if args.key?(:description)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @location = args[:location] if args.key?(:location)
          @summary = args[:summary] if args.key?(:summary)
          @time_zone = args[:time_zone] if args.key?(:time_zone)
        end
      end
      
      # 
      class CalendarList
        include Google::Apis::Core::Hashable
      
        # ETag of the collection.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Calendars that are present on the user's calendar list.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::CalendarV3::CalendarListEntry>]
        attr_accessor :items
      
        # Type of the collection ("calendar#calendarList").
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Token used to access the next page of this result. Omitted if no further
        # results are available, in which case nextSyncToken is provided.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Token used at a later point in time to retrieve only the entries that have
        # changed since this result was returned. Omitted if further results are
        # available, in which case nextPageToken is provided.
        # Corresponds to the JSON property `nextSyncToken`
        # @return [String]
        attr_accessor :next_sync_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @next_sync_token = args[:next_sync_token] if args.key?(:next_sync_token)
        end
      end
      
      # 
      class CalendarListEntry
        include Google::Apis::Core::Hashable
      
        # The effective access role that the authenticated user has on the calendar.
        # Read-only. Possible values are:
        # - "freeBusyReader" - Provides read access to free/busy information.
        # - "reader" - Provides read access to the calendar. Private events will appear
        # to users with reader access, but event details will be hidden.
        # - "writer" - Provides read and write access to the calendar. Private events
        # will appear to users with writer access, and event details will be visible.
        # - "owner" - Provides ownership of the calendar. This role has all of the
        # permissions of the writer role with the additional ability to see and
        # manipulate ACLs.
        # Corresponds to the JSON property `accessRole`
        # @return [String]
        attr_accessor :access_role
      
        # The main color of the calendar in the hexadecimal format "#0088aa". This
        # property supersedes the index-based colorId property. To set or change this
        # property, you need to specify colorRgbFormat=true in the parameters of the
        # insert, update and patch methods. Optional.
        # Corresponds to the JSON property `backgroundColor`
        # @return [String]
        attr_accessor :background_color
      
        # The color of the calendar. This is an ID referring to an entry in the calendar
        # section of the colors definition (see the colors endpoint). This property is
        # superseded by the backgroundColor and foregroundColor properties and can be
        # ignored when using these properties. Optional.
        # Corresponds to the JSON property `colorId`
        # @return [String]
        attr_accessor :color_id
      
        # Conferencing properties for this calendar, for example what types of
        # conferences are allowed.
        # Corresponds to the JSON property `conferenceProperties`
        # @return [Google::Apis::CalendarV3::ConferenceProperties]
        attr_accessor :conference_properties
      
        # The default reminders that the authenticated user has for this calendar.
        # Corresponds to the JSON property `defaultReminders`
        # @return [Array<Google::Apis::CalendarV3::EventReminder>]
        attr_accessor :default_reminders
      
        # Whether this calendar list entry has been deleted from the calendar list. Read-
        # only. Optional. The default is False.
        # Corresponds to the JSON property `deleted`
        # @return [Boolean]
        attr_accessor :deleted
        alias_method :deleted?, :deleted
      
        # Description of the calendar. Optional. Read-only.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # ETag of the resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The foreground color of the calendar in the hexadecimal format "#ffffff". This
        # property supersedes the index-based colorId property. To set or change this
        # property, you need to specify colorRgbFormat=true in the parameters of the
        # insert, update and patch methods. Optional.
        # Corresponds to the JSON property `foregroundColor`
        # @return [String]
        attr_accessor :foreground_color
      
        # Whether the calendar has been hidden from the list. Optional. The default is
        # False.
        # Corresponds to the JSON property `hidden`
        # @return [Boolean]
        attr_accessor :hidden
        alias_method :hidden?, :hidden
      
        # Identifier of the calendar.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Type of the resource ("calendar#calendarListEntry").
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Geographic location of the calendar as free-form text. Optional. Read-only.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # The notifications that the authenticated user is receiving for this calendar.
        # Corresponds to the JSON property `notificationSettings`
        # @return [Google::Apis::CalendarV3::CalendarListEntry::NotificationSettings]
        attr_accessor :notification_settings
      
        # Whether the calendar is the primary calendar of the authenticated user. Read-
        # only. Optional. The default is False.
        # Corresponds to the JSON property `primary`
        # @return [Boolean]
        attr_accessor :primary
        alias_method :primary?, :primary
      
        # Whether the calendar content shows up in the calendar UI. Optional. The
        # default is False.
        # Corresponds to the JSON property `selected`
        # @return [Boolean]
        attr_accessor :selected
        alias_method :selected?, :selected
      
        # Title of the calendar. Read-only.
        # Corresponds to the JSON property `summary`
        # @return [String]
        attr_accessor :summary
      
        # The summary that the authenticated user has set for this calendar. Optional.
        # Corresponds to the JSON property `summaryOverride`
        # @return [String]
        attr_accessor :summary_override
      
        # The time zone of the calendar. Optional. Read-only.
        # Corresponds to the JSON property `timeZone`
        # @return [String]
        attr_accessor :time_zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @access_role = args[:access_role] if args.key?(:access_role)
          @background_color = args[:background_color] if args.key?(:background_color)
          @color_id = args[:color_id] if args.key?(:color_id)
          @conference_properties = args[:conference_properties] if args.key?(:conference_properties)
          @default_reminders = args[:default_reminders] if args.key?(:default_reminders)
          @deleted = args[:deleted] if args.key?(:deleted)
          @description = args[:description] if args.key?(:description)
          @etag = args[:etag] if args.key?(:etag)
          @foreground_color = args[:foreground_color] if args.key?(:foreground_color)
          @hidden = args[:hidden] if args.key?(:hidden)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @location = args[:location] if args.key?(:location)
          @notification_settings = args[:notification_settings] if args.key?(:notification_settings)
          @primary = args[:primary] if args.key?(:primary)
          @selected = args[:selected] if args.key?(:selected)
          @summary = args[:summary] if args.key?(:summary)
          @summary_override = args[:summary_override] if args.key?(:summary_override)
          @time_zone = args[:time_zone] if args.key?(:time_zone)
        end
        
        # The notifications that the authenticated user is receiving for this calendar.
        class NotificationSettings
          include Google::Apis::Core::Hashable
        
          # The list of notifications set for this calendar.
          # Corresponds to the JSON property `notifications`
          # @return [Array<Google::Apis::CalendarV3::CalendarNotification>]
          attr_accessor :notifications
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @notifications = args[:notifications] if args.key?(:notifications)
          end
        end
      end
      
      # 
      class CalendarNotification
        include Google::Apis::Core::Hashable
      
        # The method used to deliver the notification. Possible values are:
        # - "email" - Notifications are sent via email.
        # - "sms" - Deprecated. Once this feature is shutdown, the API will no longer
        # return notifications using this method. Any newly added SMS notifications will
        # be ignored. See  Google Calendar SMS notifications to be removed for more
        # information.
        # Notifications are sent via SMS. This value is read-only and is ignored on
        # inserts and updates. SMS notifications are only available for G Suite
        # customers.
        # Required when adding a notification.
        # Corresponds to the JSON property `method`
        # @return [String]
        attr_accessor :delivery_method
      
        # The type of notification. Possible values are:
        # - "eventCreation" - Notification sent when a new event is put on the calendar.
        # - "eventChange" - Notification sent when an event is changed.
        # - "eventCancellation" - Notification sent when an event is cancelled.
        # - "eventResponse" - Notification sent when an attendee responds to the event
        # invitation.
        # - "agenda" - An agenda with the events of the day (sent out in the morning).
        # Required when adding a notification.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @delivery_method = args[:delivery_method] if args.key?(:delivery_method)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # 
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
      
      # 
      class ColorDefinition
        include Google::Apis::Core::Hashable
      
        # The background color associated with this color definition.
        # Corresponds to the JSON property `background`
        # @return [String]
        attr_accessor :background
      
        # The foreground color that can be used to write on top of a background with '
        # background' color.
        # Corresponds to the JSON property `foreground`
        # @return [String]
        attr_accessor :foreground
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @background = args[:background] if args.key?(:background)
          @foreground = args[:foreground] if args.key?(:foreground)
        end
      end
      
      # 
      class Colors
        include Google::Apis::Core::Hashable
      
        # A global palette of calendar colors, mapping from the color ID to its
        # definition. A calendarListEntry resource refers to one of these color IDs in
        # its color field. Read-only.
        # Corresponds to the JSON property `calendar`
        # @return [Hash<String,Google::Apis::CalendarV3::ColorDefinition>]
        attr_accessor :calendar
      
        # A global palette of event colors, mapping from the color ID to its definition.
        # An event resource may refer to one of these color IDs in its color field. Read-
        # only.
        # Corresponds to the JSON property `event`
        # @return [Hash<String,Google::Apis::CalendarV3::ColorDefinition>]
        attr_accessor :event
      
        # Type of the resource ("calendar#colors").
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Last modification time of the color palette (as a RFC3339 timestamp). Read-
        # only.
        # Corresponds to the JSON property `updated`
        # @return [DateTime]
        attr_accessor :updated
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @calendar = args[:calendar] if args.key?(:calendar)
          @event = args[:event] if args.key?(:event)
          @kind = args[:kind] if args.key?(:kind)
          @updated = args[:updated] if args.key?(:updated)
        end
      end
      
      # 
      class ConferenceData
        include Google::Apis::Core::Hashable
      
        # The ID of the conference.
        # Can be used by developers to keep track of conferences, should not be
        # displayed to users.
        # Values for solution types:
        # - "eventHangout": unset.
        # - "eventNamedHangout": the name of the Hangout.
        # - "hangoutsMeet": the 10-letter meeting code, for example "aaa-bbbb-ccc".
        # - "addOn": defined by 3P conference provider.  Optional.
        # Corresponds to the JSON property `conferenceId`
        # @return [String]
        attr_accessor :conference_id
      
        # The conference solution, such as Hangouts or Hangouts Meet.
        # Unset for a conference with a failed create request.
        # Either conferenceSolution and at least one entryPoint, or createRequest is
        # required.
        # Corresponds to the JSON property `conferenceSolution`
        # @return [Google::Apis::CalendarV3::ConferenceSolution]
        attr_accessor :conference_solution
      
        # A request to generate a new conference and attach it to the event. The data is
        # generated asynchronously. To see whether the data is present check the status
        # field.
        # Either conferenceSolution and at least one entryPoint, or createRequest is
        # required.
        # Corresponds to the JSON property `createRequest`
        # @return [Google::Apis::CalendarV3::CreateConferenceRequest]
        attr_accessor :create_request
      
        # Information about individual conference entry points, such as URLs or phone
        # numbers.
        # All of them must belong to the same conference.
        # Either conferenceSolution and at least one entryPoint, or createRequest is
        # required.
        # Corresponds to the JSON property `entryPoints`
        # @return [Array<Google::Apis::CalendarV3::EntryPoint>]
        attr_accessor :entry_points
      
        # Additional notes (such as instructions from the domain administrator, legal
        # notices) to display to the user. Can contain HTML. The maximum length is 2048
        # characters. Optional.
        # Corresponds to the JSON property `notes`
        # @return [String]
        attr_accessor :notes
      
        # Additional properties related to a conference. An example would be a solution-
        # specific setting for enabling video streaming.
        # Corresponds to the JSON property `parameters`
        # @return [Google::Apis::CalendarV3::ConferenceParameters]
        attr_accessor :parameters
      
        # The signature of the conference data.
        # Generated on server side. Must be preserved while copying the conference data
        # between events, otherwise the conference data will not be copied.
        # Unset for a conference with a failed create request.
        # Optional for a conference with a pending create request.
        # Corresponds to the JSON property `signature`
        # @return [String]
        attr_accessor :signature
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @conference_id = args[:conference_id] if args.key?(:conference_id)
          @conference_solution = args[:conference_solution] if args.key?(:conference_solution)
          @create_request = args[:create_request] if args.key?(:create_request)
          @entry_points = args[:entry_points] if args.key?(:entry_points)
          @notes = args[:notes] if args.key?(:notes)
          @parameters = args[:parameters] if args.key?(:parameters)
          @signature = args[:signature] if args.key?(:signature)
        end
      end
      
      # 
      class ConferenceParameters
        include Google::Apis::Core::Hashable
      
        # Additional add-on specific data.
        # Corresponds to the JSON property `addOnParameters`
        # @return [Google::Apis::CalendarV3::ConferenceParametersAddOnParameters]
        attr_accessor :add_on_parameters
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @add_on_parameters = args[:add_on_parameters] if args.key?(:add_on_parameters)
        end
      end
      
      # 
      class ConferenceParametersAddOnParameters
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `parameters`
        # @return [Hash<String,String>]
        attr_accessor :parameters
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @parameters = args[:parameters] if args.key?(:parameters)
        end
      end
      
      # 
      class ConferenceProperties
        include Google::Apis::Core::Hashable
      
        # The types of conference solutions that are supported for this calendar.
        # The possible values are:
        # - "eventHangout"
        # - "eventNamedHangout"
        # - "hangoutsMeet"  Optional.
        # Corresponds to the JSON property `allowedConferenceSolutionTypes`
        # @return [Array<String>]
        attr_accessor :allowed_conference_solution_types
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @allowed_conference_solution_types = args[:allowed_conference_solution_types] if args.key?(:allowed_conference_solution_types)
        end
      end
      
      # 
      class ConferenceRequestStatus
        include Google::Apis::Core::Hashable
      
        # The current status of the conference create request. Read-only.
        # The possible values are:
        # - "pending": the conference create request is still being processed.
        # - "success": the conference create request succeeded, the entry points are
        # populated.
        # - "failure": the conference create request failed, there are no entry points.
        # Corresponds to the JSON property `statusCode`
        # @return [String]
        attr_accessor :status_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @status_code = args[:status_code] if args.key?(:status_code)
        end
      end
      
      # 
      class ConferenceSolution
        include Google::Apis::Core::Hashable
      
        # The user-visible icon for this solution.
        # Corresponds to the JSON property `iconUri`
        # @return [String]
        attr_accessor :icon_uri
      
        # The key which can uniquely identify the conference solution for this event.
        # Corresponds to the JSON property `key`
        # @return [Google::Apis::CalendarV3::ConferenceSolutionKey]
        attr_accessor :key
      
        # The user-visible name of this solution. Not localized.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @icon_uri = args[:icon_uri] if args.key?(:icon_uri)
          @key = args[:key] if args.key?(:key)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # 
      class ConferenceSolutionKey
        include Google::Apis::Core::Hashable
      
        # The conference solution type.
        # If a client encounters an unfamiliar or empty type, it should still be able to
        # display the entry points. However, it should disallow modifications.
        # The possible values are:
        # - "eventHangout" for Hangouts for consumers (http://hangouts.google.com)
        # - "eventNamedHangout" for classic Hangouts for G Suite users (http://hangouts.
        # google.com)
        # - "hangoutsMeet" for Hangouts Meet (http://meet.google.com)
        # - "addOn" for 3P conference providers
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
      
      # 
      class CreateConferenceRequest
        include Google::Apis::Core::Hashable
      
        # The conference solution, such as Hangouts or Hangouts Meet.
        # Corresponds to the JSON property `conferenceSolutionKey`
        # @return [Google::Apis::CalendarV3::ConferenceSolutionKey]
        attr_accessor :conference_solution_key
      
        # The client-generated unique ID for this request.
        # Clients should regenerate this ID for every new request. If an ID provided is
        # the same as for the previous request, the request is ignored.
        # Corresponds to the JSON property `requestId`
        # @return [String]
        attr_accessor :request_id
      
        # The status of the conference create request.
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::CalendarV3::ConferenceRequestStatus]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @conference_solution_key = args[:conference_solution_key] if args.key?(:conference_solution_key)
          @request_id = args[:request_id] if args.key?(:request_id)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # 
      class EntryPoint
        include Google::Apis::Core::Hashable
      
        # The access code to access the conference. The maximum length is 128 characters.
        # When creating new conference data, populate only the subset of `meetingCode,
        # accessCode, passcode, password, pin` fields that match the terminology that
        # the conference provider uses. Only the populated fields should be displayed.
        # Optional.
        # Corresponds to the JSON property `accessCode`
        # @return [String]
        attr_accessor :access_code
      
        # Features of the entry point, such as being toll or toll-free. One entry point
        # can have multiple features. However, toll and toll-free cannot be both set on
        # the same entry point.
        # Corresponds to the JSON property `entryPointFeatures`
        # @return [Array<String>]
        attr_accessor :entry_point_features
      
        # The type of the conference entry point.
        # Possible values are:
        # - "video" - joining a conference over HTTP. A conference can have zero or one
        # video entry point.
        # - "phone" - joining a conference by dialing a phone number. A conference can
        # have zero or more phone entry points.
        # - "sip" - joining a conference over SIP. A conference can have zero or one sip
        # entry point.
        # - "more" - further conference joining instructions, for example additional
        # phone numbers. A conference can have zero or one more entry point. A
        # conference with only a more entry point is not a valid conference.
        # Corresponds to the JSON property `entryPointType`
        # @return [String]
        attr_accessor :entry_point_type
      
        # The label for the URI. Visible to end users. Not localized. The maximum length
        # is 512 characters.
        # Examples:
        # - for video: meet.google.com/aaa-bbbb-ccc
        # - for phone: +1 123 268 2601
        # - for sip: 12345678@altostrat.com
        # - for more: should not be filled
        # Optional.
        # Corresponds to the JSON property `label`
        # @return [String]
        attr_accessor :label
      
        # The meeting code to access the conference. The maximum length is 128
        # characters.
        # When creating new conference data, populate only the subset of `meetingCode,
        # accessCode, passcode, password, pin` fields that match the terminology that
        # the conference provider uses. Only the populated fields should be displayed.
        # Optional.
        # Corresponds to the JSON property `meetingCode`
        # @return [String]
        attr_accessor :meeting_code
      
        # The passcode to access the conference. The maximum length is 128 characters.
        # When creating new conference data, populate only the subset of `meetingCode,
        # accessCode, passcode, password, pin` fields that match the terminology that
        # the conference provider uses. Only the populated fields should be displayed.
        # Corresponds to the JSON property `passcode`
        # @return [String]
        attr_accessor :passcode
      
        # The password to access the conference. The maximum length is 128 characters.
        # When creating new conference data, populate only the subset of `meetingCode,
        # accessCode, passcode, password, pin` fields that match the terminology that
        # the conference provider uses. Only the populated fields should be displayed.
        # Optional.
        # Corresponds to the JSON property `password`
        # @return [String]
        attr_accessor :password
      
        # The PIN to access the conference. The maximum length is 128 characters.
        # When creating new conference data, populate only the subset of `meetingCode,
        # accessCode, passcode, password, pin` fields that match the terminology that
        # the conference provider uses. Only the populated fields should be displayed.
        # Optional.
        # Corresponds to the JSON property `pin`
        # @return [String]
        attr_accessor :pin
      
        # The CLDR/ISO 3166 region code for the country associated with this phone
        # access. Example: "SE" for Sweden.
        # Calendar backend will populate this field only for EntryPointType.PHONE.
        # Corresponds to the JSON property `regionCode`
        # @return [String]
        attr_accessor :region_code
      
        # The URI of the entry point. The maximum length is 1300 characters.
        # Format:
        # - for video, http: or https: schema is required.
        # - for phone, tel: schema is required. The URI should include the entire dial
        # sequence (e.g., tel:+12345678900,,,123456789;1234).
        # - for sip, sip: schema is required, e.g., sip:12345678@myprovider.com.
        # - for more, http: or https: schema is required.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @access_code = args[:access_code] if args.key?(:access_code)
          @entry_point_features = args[:entry_point_features] if args.key?(:entry_point_features)
          @entry_point_type = args[:entry_point_type] if args.key?(:entry_point_type)
          @label = args[:label] if args.key?(:label)
          @meeting_code = args[:meeting_code] if args.key?(:meeting_code)
          @passcode = args[:passcode] if args.key?(:passcode)
          @password = args[:password] if args.key?(:password)
          @pin = args[:pin] if args.key?(:pin)
          @region_code = args[:region_code] if args.key?(:region_code)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # 
      class Error
        include Google::Apis::Core::Hashable
      
        # Domain, or broad category, of the error.
        # Corresponds to the JSON property `domain`
        # @return [String]
        attr_accessor :domain
      
        # Specific reason for the error. Some of the possible values are:
        # - "groupTooBig" - The group of users requested is too large for a single query.
        # 
        # - "tooManyCalendarsRequested" - The number of calendars requested is too large
        # for a single query.
        # - "notFound" - The requested resource was not found.
        # - "internalError" - The API service has encountered an internal error.
        # Additional error types may be added in the future, so clients should
        # gracefully handle additional error statuses not included in this list.
        # Corresponds to the JSON property `reason`
        # @return [String]
        attr_accessor :reason
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @domain = args[:domain] if args.key?(:domain)
          @reason = args[:reason] if args.key?(:reason)
        end
      end
      
      # 
      class Event
        include Google::Apis::Core::Hashable
      
        # Whether anyone can invite themselves to the event (currently works for Google+
        # events only). Optional. The default is False.
        # Corresponds to the JSON property `anyoneCanAddSelf`
        # @return [Boolean]
        attr_accessor :anyone_can_add_self
        alias_method :anyone_can_add_self?, :anyone_can_add_self
      
        # File attachments for the event. Currently only Google Drive attachments are
        # supported.
        # In order to modify attachments the supportsAttachments request parameter
        # should be set to true.
        # There can be at most 25 attachments per event,
        # Corresponds to the JSON property `attachments`
        # @return [Array<Google::Apis::CalendarV3::EventAttachment>]
        attr_accessor :attachments
      
        # The attendees of the event. See the Events with attendees guide for more
        # information on scheduling events with other calendar users.
        # Corresponds to the JSON property `attendees`
        # @return [Array<Google::Apis::CalendarV3::EventAttendee>]
        attr_accessor :attendees
      
        # Whether attendees may have been omitted from the event's representation. When
        # retrieving an event, this may be due to a restriction specified by the
        # maxAttendee query parameter. When updating an event, this can be used to only
        # update the participant's response. Optional. The default is False.
        # Corresponds to the JSON property `attendeesOmitted`
        # @return [Boolean]
        attr_accessor :attendees_omitted
        alias_method :attendees_omitted?, :attendees_omitted
      
        # The color of the event. This is an ID referring to an entry in the event
        # section of the colors definition (see the  colors endpoint). Optional.
        # Corresponds to the JSON property `colorId`
        # @return [String]
        attr_accessor :color_id
      
        # The conference-related information, such as details of a Hangouts Meet
        # conference. To create new conference details use the createRequest field. To
        # persist your changes, remember to set the conferenceDataVersion request
        # parameter to 1 for all event modification requests.
        # Corresponds to the JSON property `conferenceData`
        # @return [Google::Apis::CalendarV3::ConferenceData]
        attr_accessor :conference_data
      
        # Creation time of the event (as a RFC3339 timestamp). Read-only.
        # Corresponds to the JSON property `created`
        # @return [DateTime]
        attr_accessor :created
      
        # The creator of the event. Read-only.
        # Corresponds to the JSON property `creator`
        # @return [Google::Apis::CalendarV3::Event::Creator]
        attr_accessor :creator
      
        # Description of the event. Optional.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The (exclusive) end time of the event. For a recurring event, this is the end
        # time of the first instance.
        # Corresponds to the JSON property `end`
        # @return [Google::Apis::CalendarV3::EventDateTime]
        attr_accessor :end
      
        # Whether the end time is actually unspecified. An end time is still provided
        # for compatibility reasons, even if this attribute is set to True. The default
        # is False.
        # Corresponds to the JSON property `endTimeUnspecified`
        # @return [Boolean]
        attr_accessor :end_time_unspecified
        alias_method :end_time_unspecified?, :end_time_unspecified
      
        # ETag of the resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Extended properties of the event.
        # Corresponds to the JSON property `extendedProperties`
        # @return [Google::Apis::CalendarV3::Event::ExtendedProperties]
        attr_accessor :extended_properties
      
        # A gadget that extends this event.
        # Corresponds to the JSON property `gadget`
        # @return [Google::Apis::CalendarV3::Event::Gadget]
        attr_accessor :gadget
      
        # Whether attendees other than the organizer can invite others to the event.
        # Optional. The default is True.
        # Corresponds to the JSON property `guestsCanInviteOthers`
        # @return [Boolean]
        attr_accessor :guests_can_invite_others
        alias_method :guests_can_invite_others?, :guests_can_invite_others
      
        # Whether attendees other than the organizer can modify the event. Optional. The
        # default is False.
        # Corresponds to the JSON property `guestsCanModify`
        # @return [Boolean]
        attr_accessor :guests_can_modify
        alias_method :guests_can_modify?, :guests_can_modify
      
        # Whether attendees other than the organizer can see who the event's attendees
        # are. Optional. The default is True.
        # Corresponds to the JSON property `guestsCanSeeOtherGuests`
        # @return [Boolean]
        attr_accessor :guests_can_see_other_guests
        alias_method :guests_can_see_other_guests?, :guests_can_see_other_guests
      
        # An absolute link to the Google+ hangout associated with this event. Read-only.
        # Corresponds to the JSON property `hangoutLink`
        # @return [String]
        attr_accessor :hangout_link
      
        # An absolute link to this event in the Google Calendar Web UI. Read-only.
        # Corresponds to the JSON property `htmlLink`
        # @return [String]
        attr_accessor :html_link
      
        # Event unique identifier as defined in RFC5545. It is used to uniquely identify
        # events accross calendaring systems and must be supplied when importing events
        # via the import method.
        # Note that the icalUID and the id are not identical and only one of them should
        # be supplied at event creation time. One difference in their semantics is that
        # in recurring events, all occurrences of one event have different ids while
        # they all share the same icalUIDs.
        # Corresponds to the JSON property `iCalUID`
        # @return [String]
        attr_accessor :i_cal_uid
      
        # Opaque identifier of the event. When creating new single or recurring events,
        # you can specify their IDs. Provided IDs must follow these rules:
        # - characters allowed in the ID are those used in base32hex encoding, i.e.
        # lowercase letters a-v and digits 0-9, see section 3.1.2 in RFC2938
        # - the length of the ID must be between 5 and 1024 characters
        # - the ID must be unique per calendar  Due to the globally distributed nature
        # of the system, we cannot guarantee that ID collisions will be detected at
        # event creation time. To minimize the risk of collisions we recommend using an
        # established UUID algorithm such as one described in RFC4122.
        # If you do not specify an ID, it will be automatically generated by the server.
        # Note that the icalUID and the id are not identical and only one of them should
        # be supplied at event creation time. One difference in their semantics is that
        # in recurring events, all occurrences of one event have different ids while
        # they all share the same icalUIDs.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Type of the resource ("calendar#event").
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Geographic location of the event as free-form text. Optional.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # Whether this is a locked event copy where no changes can be made to the main
        # event fields "summary", "description", "location", "start", "end" or "
        # recurrence". The default is False. Read-Only.
        # Corresponds to the JSON property `locked`
        # @return [Boolean]
        attr_accessor :locked
        alias_method :locked?, :locked
      
        # The organizer of the event. If the organizer is also an attendee, this is
        # indicated with a separate entry in attendees with the organizer field set to
        # True. To change the organizer, use the move operation. Read-only, except when
        # importing an event.
        # Corresponds to the JSON property `organizer`
        # @return [Google::Apis::CalendarV3::Event::Organizer]
        attr_accessor :organizer
      
        # For an instance of a recurring event, this is the time at which this event
        # would start according to the recurrence data in the recurring event identified
        # by recurringEventId. It uniquely identifies the instance within the recurring
        # event series even if the instance was moved to a different time. Immutable.
        # Corresponds to the JSON property `originalStartTime`
        # @return [Google::Apis::CalendarV3::EventDateTime]
        attr_accessor :original_start_time
      
        # If set to True, Event propagation is disabled. Note that it is not the same
        # thing as Private event properties. Optional. Immutable. The default is False.
        # Corresponds to the JSON property `privateCopy`
        # @return [Boolean]
        attr_accessor :private_copy
        alias_method :private_copy?, :private_copy
      
        # List of RRULE, EXRULE, RDATE and EXDATE lines for a recurring event, as
        # specified in RFC5545. Note that DTSTART and DTEND lines are not allowed in
        # this field; event start and end times are specified in the start and end
        # fields. This field is omitted for single events or instances of recurring
        # events.
        # Corresponds to the JSON property `recurrence`
        # @return [Array<String>]
        attr_accessor :recurrence
      
        # For an instance of a recurring event, this is the id of the recurring event to
        # which this instance belongs. Immutable.
        # Corresponds to the JSON property `recurringEventId`
        # @return [String]
        attr_accessor :recurring_event_id
      
        # Information about the event's reminders for the authenticated user.
        # Corresponds to the JSON property `reminders`
        # @return [Google::Apis::CalendarV3::Event::Reminders]
        attr_accessor :reminders
      
        # Sequence number as per iCalendar.
        # Corresponds to the JSON property `sequence`
        # @return [Fixnum]
        attr_accessor :sequence
      
        # Source from which the event was created. For example, a web page, an email
        # message or any document identifiable by an URL with HTTP or HTTPS scheme. Can
        # only be seen or modified by the creator of the event.
        # Corresponds to the JSON property `source`
        # @return [Google::Apis::CalendarV3::Event::Source]
        attr_accessor :source
      
        # The (inclusive) start time of the event. For a recurring event, this is the
        # start time of the first instance.
        # Corresponds to the JSON property `start`
        # @return [Google::Apis::CalendarV3::EventDateTime]
        attr_accessor :start
      
        # Status of the event. Optional. Possible values are:
        # - "confirmed" - The event is confirmed. This is the default status.
        # - "tentative" - The event is tentatively confirmed.
        # - "cancelled" - The event is cancelled (deleted). The list method returns
        # cancelled events only on incremental sync (when syncToken or updatedMin are
        # specified) or if the showDeleted flag is set to true. The get method always
        # returns them.
        # A cancelled status represents two different states depending on the event type:
        # 
        # - Cancelled exceptions of an uncancelled recurring event indicate that this
        # instance should no longer be presented to the user. Clients should store these
        # events for the lifetime of the parent recurring event.
        # Cancelled exceptions are only guaranteed to have values for the id,
        # recurringEventId and originalStartTime fields populated. The other fields
        # might be empty.
        # - All other cancelled events represent deleted events. Clients should remove
        # their locally synced copies. Such cancelled events will eventually disappear,
        # so do not rely on them being available indefinitely.
        # Deleted events are only guaranteed to have the id field populated.   On the
        # organizer's calendar, cancelled events continue to expose event details (
        # summary, location, etc.) so that they can be restored (undeleted). Similarly,
        # the events to which the user was invited and that they manually removed
        # continue to provide details. However, incremental sync requests with
        # showDeleted set to false will not return these details.
        # If an event changes its organizer (for example via the move operation) and the
        # original organizer is not on the attendee list, it will leave behind a
        # cancelled event where only the id field is guaranteed to be populated.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # Title of the event.
        # Corresponds to the JSON property `summary`
        # @return [String]
        attr_accessor :summary
      
        # Whether the event blocks time on the calendar. Optional. Possible values are:
        # - "opaque" - Default value. The event does block time on the calendar. This is
        # equivalent to setting Show me as to Busy in the Calendar UI.
        # - "transparent" - The event does not block time on the calendar. This is
        # equivalent to setting Show me as to Available in the Calendar UI.
        # Corresponds to the JSON property `transparency`
        # @return [String]
        attr_accessor :transparency
      
        # Last modification time of the event (as a RFC3339 timestamp). Read-only.
        # Corresponds to the JSON property `updated`
        # @return [DateTime]
        attr_accessor :updated
      
        # Visibility of the event. Optional. Possible values are:
        # - "default" - Uses the default visibility for events on the calendar. This is
        # the default value.
        # - "public" - The event is public and event details are visible to all readers
        # of the calendar.
        # - "private" - The event is private and only event attendees may view event
        # details.
        # - "confidential" - The event is private. This value is provided for
        # compatibility reasons.
        # Corresponds to the JSON property `visibility`
        # @return [String]
        attr_accessor :visibility
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @anyone_can_add_self = args[:anyone_can_add_self] if args.key?(:anyone_can_add_self)
          @attachments = args[:attachments] if args.key?(:attachments)
          @attendees = args[:attendees] if args.key?(:attendees)
          @attendees_omitted = args[:attendees_omitted] if args.key?(:attendees_omitted)
          @color_id = args[:color_id] if args.key?(:color_id)
          @conference_data = args[:conference_data] if args.key?(:conference_data)
          @created = args[:created] if args.key?(:created)
          @creator = args[:creator] if args.key?(:creator)
          @description = args[:description] if args.key?(:description)
          @end = args[:end] if args.key?(:end)
          @end_time_unspecified = args[:end_time_unspecified] if args.key?(:end_time_unspecified)
          @etag = args[:etag] if args.key?(:etag)
          @extended_properties = args[:extended_properties] if args.key?(:extended_properties)
          @gadget = args[:gadget] if args.key?(:gadget)
          @guests_can_invite_others = args[:guests_can_invite_others] if args.key?(:guests_can_invite_others)
          @guests_can_modify = args[:guests_can_modify] if args.key?(:guests_can_modify)
          @guests_can_see_other_guests = args[:guests_can_see_other_guests] if args.key?(:guests_can_see_other_guests)
          @hangout_link = args[:hangout_link] if args.key?(:hangout_link)
          @html_link = args[:html_link] if args.key?(:html_link)
          @i_cal_uid = args[:i_cal_uid] if args.key?(:i_cal_uid)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @location = args[:location] if args.key?(:location)
          @locked = args[:locked] if args.key?(:locked)
          @organizer = args[:organizer] if args.key?(:organizer)
          @original_start_time = args[:original_start_time] if args.key?(:original_start_time)
          @private_copy = args[:private_copy] if args.key?(:private_copy)
          @recurrence = args[:recurrence] if args.key?(:recurrence)
          @recurring_event_id = args[:recurring_event_id] if args.key?(:recurring_event_id)
          @reminders = args[:reminders] if args.key?(:reminders)
          @sequence = args[:sequence] if args.key?(:sequence)
          @source = args[:source] if args.key?(:source)
          @start = args[:start] if args.key?(:start)
          @status = args[:status] if args.key?(:status)
          @summary = args[:summary] if args.key?(:summary)
          @transparency = args[:transparency] if args.key?(:transparency)
          @updated = args[:updated] if args.key?(:updated)
          @visibility = args[:visibility] if args.key?(:visibility)
        end
        
        # The creator of the event. Read-only.
        class Creator
          include Google::Apis::Core::Hashable
        
          # The creator's name, if available.
          # Corresponds to the JSON property `displayName`
          # @return [String]
          attr_accessor :display_name
        
          # The creator's email address, if available.
          # Corresponds to the JSON property `email`
          # @return [String]
          attr_accessor :email
        
          # The creator's Profile ID, if available. It corresponds to the id field in the
          # People collection of the Google+ API
          # Corresponds to the JSON property `id`
          # @return [String]
          attr_accessor :id
        
          # Whether the creator corresponds to the calendar on which this copy of the
          # event appears. Read-only. The default is False.
          # Corresponds to the JSON property `self`
          # @return [Boolean]
          attr_accessor :self
          alias_method :self?, :self
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @display_name = args[:display_name] if args.key?(:display_name)
            @email = args[:email] if args.key?(:email)
            @id = args[:id] if args.key?(:id)
            @self = args[:self] if args.key?(:self)
          end
        end
        
        # Extended properties of the event.
        class ExtendedProperties
          include Google::Apis::Core::Hashable
        
          # Properties that are private to the copy of the event that appears on this
          # calendar.
          # Corresponds to the JSON property `private`
          # @return [Hash<String,String>]
          attr_accessor :private
        
          # Properties that are shared between copies of the event on other attendees'
          # calendars.
          # Corresponds to the JSON property `shared`
          # @return [Hash<String,String>]
          attr_accessor :shared
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @private = args[:private] if args.key?(:private)
            @shared = args[:shared] if args.key?(:shared)
          end
        end
        
        # A gadget that extends this event.
        class Gadget
          include Google::Apis::Core::Hashable
        
          # The gadget's display mode. Optional. Possible values are:
          # - "icon" - The gadget displays next to the event's title in the calendar view.
          # - "chip" - The gadget displays when the event is clicked.
          # Corresponds to the JSON property `display`
          # @return [String]
          attr_accessor :display_mode
        
          # The gadget's height in pixels. The height must be an integer greater than 0.
          # Optional.
          # Corresponds to the JSON property `height`
          # @return [Fixnum]
          attr_accessor :height
        
          # The gadget's icon URL. The URL scheme must be HTTPS.
          # Corresponds to the JSON property `iconLink`
          # @return [String]
          attr_accessor :icon_link
        
          # The gadget's URL. The URL scheme must be HTTPS.
          # Corresponds to the JSON property `link`
          # @return [String]
          attr_accessor :link
        
          # Preferences.
          # Corresponds to the JSON property `preferences`
          # @return [Hash<String,String>]
          attr_accessor :preferences
        
          # The gadget's title.
          # Corresponds to the JSON property `title`
          # @return [String]
          attr_accessor :title
        
          # The gadget's type.
          # Corresponds to the JSON property `type`
          # @return [String]
          attr_accessor :type
        
          # The gadget's width in pixels. The width must be an integer greater than 0.
          # Optional.
          # Corresponds to the JSON property `width`
          # @return [Fixnum]
          attr_accessor :width
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @display_mode = args[:display_mode] if args.key?(:display_mode)
            @height = args[:height] if args.key?(:height)
            @icon_link = args[:icon_link] if args.key?(:icon_link)
            @link = args[:link] if args.key?(:link)
            @preferences = args[:preferences] if args.key?(:preferences)
            @title = args[:title] if args.key?(:title)
            @type = args[:type] if args.key?(:type)
            @width = args[:width] if args.key?(:width)
          end
        end
        
        # The organizer of the event. If the organizer is also an attendee, this is
        # indicated with a separate entry in attendees with the organizer field set to
        # True. To change the organizer, use the move operation. Read-only, except when
        # importing an event.
        class Organizer
          include Google::Apis::Core::Hashable
        
          # The organizer's name, if available.
          # Corresponds to the JSON property `displayName`
          # @return [String]
          attr_accessor :display_name
        
          # The organizer's email address, if available. It must be a valid email address
          # as per RFC5322.
          # Corresponds to the JSON property `email`
          # @return [String]
          attr_accessor :email
        
          # The organizer's Profile ID, if available. It corresponds to the id field in
          # the People collection of the Google+ API
          # Corresponds to the JSON property `id`
          # @return [String]
          attr_accessor :id
        
          # Whether the organizer corresponds to the calendar on which this copy of the
          # event appears. Read-only. The default is False.
          # Corresponds to the JSON property `self`
          # @return [Boolean]
          attr_accessor :self
          alias_method :self?, :self
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @display_name = args[:display_name] if args.key?(:display_name)
            @email = args[:email] if args.key?(:email)
            @id = args[:id] if args.key?(:id)
            @self = args[:self] if args.key?(:self)
          end
        end
        
        # Information about the event's reminders for the authenticated user.
        class Reminders
          include Google::Apis::Core::Hashable
        
          # If the event doesn't use the default reminders, this lists the reminders
          # specific to the event, or, if not set, indicates that no reminders are set for
          # this event. The maximum number of override reminders is 5.
          # Corresponds to the JSON property `overrides`
          # @return [Array<Google::Apis::CalendarV3::EventReminder>]
          attr_accessor :overrides
        
          # Whether the default reminders of the calendar apply to the event.
          # Corresponds to the JSON property `useDefault`
          # @return [Boolean]
          attr_accessor :use_default
          alias_method :use_default?, :use_default
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @overrides = args[:overrides] if args.key?(:overrides)
            @use_default = args[:use_default] if args.key?(:use_default)
          end
        end
        
        # Source from which the event was created. For example, a web page, an email
        # message or any document identifiable by an URL with HTTP or HTTPS scheme. Can
        # only be seen or modified by the creator of the event.
        class Source
          include Google::Apis::Core::Hashable
        
          # Title of the source; for example a title of a web page or an email subject.
          # Corresponds to the JSON property `title`
          # @return [String]
          attr_accessor :title
        
          # URL of the source pointing to a resource. The URL scheme must be HTTP or HTTPS.
          # Corresponds to the JSON property `url`
          # @return [String]
          attr_accessor :url
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @title = args[:title] if args.key?(:title)
            @url = args[:url] if args.key?(:url)
          end
        end
      end
      
      # 
      class EventAttachment
        include Google::Apis::Core::Hashable
      
        # ID of the attached file. Read-only.
        # For Google Drive files, this is the ID of the corresponding Files resource
        # entry in the Drive API.
        # Corresponds to the JSON property `fileId`
        # @return [String]
        attr_accessor :file_id
      
        # URL link to the attachment.
        # For adding Google Drive file attachments use the same format as in
        # alternateLink property of the Files resource in the Drive API.
        # Required when adding an attachment.
        # Corresponds to the JSON property `fileUrl`
        # @return [String]
        attr_accessor :file_url
      
        # URL link to the attachment's icon. Read-only.
        # Corresponds to the JSON property `iconLink`
        # @return [String]
        attr_accessor :icon_link
      
        # Internet media type (MIME type) of the attachment.
        # Corresponds to the JSON property `mimeType`
        # @return [String]
        attr_accessor :mime_type
      
        # Attachment title.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @file_id = args[:file_id] if args.key?(:file_id)
          @file_url = args[:file_url] if args.key?(:file_url)
          @icon_link = args[:icon_link] if args.key?(:icon_link)
          @mime_type = args[:mime_type] if args.key?(:mime_type)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # 
      class EventAttendee
        include Google::Apis::Core::Hashable
      
        # Number of additional guests. Optional. The default is 0.
        # Corresponds to the JSON property `additionalGuests`
        # @return [Fixnum]
        attr_accessor :additional_guests
      
        # The attendee's response comment. Optional.
        # Corresponds to the JSON property `comment`
        # @return [String]
        attr_accessor :comment
      
        # The attendee's name, if available. Optional.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The attendee's email address, if available. This field must be present when
        # adding an attendee. It must be a valid email address as per RFC5322.
        # Required when adding an attendee.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # The attendee's Profile ID, if available. It corresponds to the id field in the
        # People collection of the Google+ API
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Whether this is an optional attendee. Optional. The default is False.
        # Corresponds to the JSON property `optional`
        # @return [Boolean]
        attr_accessor :optional
        alias_method :optional?, :optional
      
        # Whether the attendee is the organizer of the event. Read-only. The default is
        # False.
        # Corresponds to the JSON property `organizer`
        # @return [Boolean]
        attr_accessor :organizer
        alias_method :organizer?, :organizer
      
        # Whether the attendee is a resource. Can only be set when the attendee is added
        # to the event for the first time. Subsequent modifications are ignored.
        # Optional. The default is False.
        # Corresponds to the JSON property `resource`
        # @return [Boolean]
        attr_accessor :resource
        alias_method :resource?, :resource
      
        # The attendee's response status. Possible values are:
        # - "needsAction" - The attendee has not responded to the invitation.
        # - "declined" - The attendee has declined the invitation.
        # - "tentative" - The attendee has tentatively accepted the invitation.
        # - "accepted" - The attendee has accepted the invitation.
        # Corresponds to the JSON property `responseStatus`
        # @return [String]
        attr_accessor :response_status
      
        # Whether this entry represents the calendar on which this copy of the event
        # appears. Read-only. The default is False.
        # Corresponds to the JSON property `self`
        # @return [Boolean]
        attr_accessor :self
        alias_method :self?, :self
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @additional_guests = args[:additional_guests] if args.key?(:additional_guests)
          @comment = args[:comment] if args.key?(:comment)
          @display_name = args[:display_name] if args.key?(:display_name)
          @email = args[:email] if args.key?(:email)
          @id = args[:id] if args.key?(:id)
          @optional = args[:optional] if args.key?(:optional)
          @organizer = args[:organizer] if args.key?(:organizer)
          @resource = args[:resource] if args.key?(:resource)
          @response_status = args[:response_status] if args.key?(:response_status)
          @self = args[:self] if args.key?(:self)
        end
      end
      
      # 
      class EventDateTime
        include Google::Apis::Core::Hashable
      
        # The date, in the format "yyyy-mm-dd", if this is an all-day event.
        # Corresponds to the JSON property `date`
        # @return [Date]
        attr_accessor :date
      
        # The time, as a combined date-time value (formatted according to RFC3339). A
        # time zone offset is required unless a time zone is explicitly specified in
        # timeZone.
        # Corresponds to the JSON property `dateTime`
        # @return [DateTime]
        attr_accessor :date_time
      
        # The time zone in which the time is specified. (Formatted as an IANA Time Zone
        # Database name, e.g. "Europe/Zurich".) For recurring events this field is
        # required and specifies the time zone in which the recurrence is expanded. For
        # single events this field is optional and indicates a custom time zone for the
        # event start/end.
        # Corresponds to the JSON property `timeZone`
        # @return [String]
        attr_accessor :time_zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @date = args[:date] if args.key?(:date)
          @date_time = args[:date_time] if args.key?(:date_time)
          @time_zone = args[:time_zone] if args.key?(:time_zone)
        end
      end
      
      # 
      class EventReminder
        include Google::Apis::Core::Hashable
      
        # The method used by this reminder. Possible values are:
        # - "email" - Reminders are sent via email.
        # - "sms" - Deprecated. Once this feature is shutdown, the API will no longer
        # return reminders using this method. Any newly added SMS reminders will be
        # ignored. See  Google Calendar SMS notifications to be removed for more
        # information.
        # Reminders are sent via SMS. These are only available for G Suite customers.
        # Requests to set SMS reminders for other account types are ignored.
        # - "popup" - Reminders are sent via a UI popup.
        # Required when adding a reminder.
        # Corresponds to the JSON property `method`
        # @return [String]
        attr_accessor :reminder_method
      
        # Number of minutes before the start of the event when the reminder should
        # trigger. Valid values are between 0 and 40320 (4 weeks in minutes).
        # Required when adding a reminder.
        # Corresponds to the JSON property `minutes`
        # @return [Fixnum]
        attr_accessor :minutes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @reminder_method = args[:reminder_method] if args.key?(:reminder_method)
          @minutes = args[:minutes] if args.key?(:minutes)
        end
      end
      
      # 
      class Events
        include Google::Apis::Core::Hashable
      
        # The user's access role for this calendar. Read-only. Possible values are:
        # - "none" - The user has no access.
        # - "freeBusyReader" - The user has read access to free/busy information.
        # - "reader" - The user has read access to the calendar. Private events will
        # appear to users with reader access, but event details will be hidden.
        # - "writer" - The user has read and write access to the calendar. Private
        # events will appear to users with writer access, and event details will be
        # visible.
        # - "owner" - The user has ownership of the calendar. This role has all of the
        # permissions of the writer role with the additional ability to see and
        # manipulate ACLs.
        # Corresponds to the JSON property `accessRole`
        # @return [String]
        attr_accessor :access_role
      
        # The default reminders on the calendar for the authenticated user. These
        # reminders apply to all events on this calendar that do not explicitly override
        # them (i.e. do not have reminders.useDefault set to True).
        # Corresponds to the JSON property `defaultReminders`
        # @return [Array<Google::Apis::CalendarV3::EventReminder>]
        attr_accessor :default_reminders
      
        # Description of the calendar. Read-only.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # ETag of the collection.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # List of events on the calendar.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::CalendarV3::Event>]
        attr_accessor :items
      
        # Type of the collection ("calendar#events").
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Token used to access the next page of this result. Omitted if no further
        # results are available, in which case nextSyncToken is provided.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Token used at a later point in time to retrieve only the entries that have
        # changed since this result was returned. Omitted if further results are
        # available, in which case nextPageToken is provided.
        # Corresponds to the JSON property `nextSyncToken`
        # @return [String]
        attr_accessor :next_sync_token
      
        # Title of the calendar. Read-only.
        # Corresponds to the JSON property `summary`
        # @return [String]
        attr_accessor :summary
      
        # The time zone of the calendar. Read-only.
        # Corresponds to the JSON property `timeZone`
        # @return [String]
        attr_accessor :time_zone
      
        # Last modification time of the calendar (as a RFC3339 timestamp). Read-only.
        # Corresponds to the JSON property `updated`
        # @return [DateTime]
        attr_accessor :updated
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @access_role = args[:access_role] if args.key?(:access_role)
          @default_reminders = args[:default_reminders] if args.key?(:default_reminders)
          @description = args[:description] if args.key?(:description)
          @etag = args[:etag] if args.key?(:etag)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @next_sync_token = args[:next_sync_token] if args.key?(:next_sync_token)
          @summary = args[:summary] if args.key?(:summary)
          @time_zone = args[:time_zone] if args.key?(:time_zone)
          @updated = args[:updated] if args.key?(:updated)
        end
      end
      
      # 
      class FreeBusyCalendar
        include Google::Apis::Core::Hashable
      
        # List of time ranges during which this calendar should be regarded as busy.
        # Corresponds to the JSON property `busy`
        # @return [Array<Google::Apis::CalendarV3::TimePeriod>]
        attr_accessor :busy
      
        # Optional error(s) (if computation for the calendar failed).
        # Corresponds to the JSON property `errors`
        # @return [Array<Google::Apis::CalendarV3::Error>]
        attr_accessor :errors
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @busy = args[:busy] if args.key?(:busy)
          @errors = args[:errors] if args.key?(:errors)
        end
      end
      
      # 
      class FreeBusyGroup
        include Google::Apis::Core::Hashable
      
        # List of calendars' identifiers within a group.
        # Corresponds to the JSON property `calendars`
        # @return [Array<String>]
        attr_accessor :calendars
      
        # Optional error(s) (if computation for the group failed).
        # Corresponds to the JSON property `errors`
        # @return [Array<Google::Apis::CalendarV3::Error>]
        attr_accessor :errors
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @calendars = args[:calendars] if args.key?(:calendars)
          @errors = args[:errors] if args.key?(:errors)
        end
      end
      
      # 
      class FreeBusyRequest
        include Google::Apis::Core::Hashable
      
        # Maximal number of calendars for which FreeBusy information is to be provided.
        # Optional. Maximum value is 50.
        # Corresponds to the JSON property `calendarExpansionMax`
        # @return [Fixnum]
        attr_accessor :calendar_expansion_max
      
        # Maximal number of calendar identifiers to be provided for a single group.
        # Optional. An error is returned for a group with more members than this value.
        # Maximum value is 100.
        # Corresponds to the JSON property `groupExpansionMax`
        # @return [Fixnum]
        attr_accessor :group_expansion_max
      
        # List of calendars and/or groups to query.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::CalendarV3::FreeBusyRequestItem>]
        attr_accessor :items
      
        # The end of the interval for the query formatted as per RFC3339.
        # Corresponds to the JSON property `timeMax`
        # @return [DateTime]
        attr_accessor :time_max
      
        # The start of the interval for the query formatted as per RFC3339.
        # Corresponds to the JSON property `timeMin`
        # @return [DateTime]
        attr_accessor :time_min
      
        # Time zone used in the response. Optional. The default is UTC.
        # Corresponds to the JSON property `timeZone`
        # @return [String]
        attr_accessor :time_zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @calendar_expansion_max = args[:calendar_expansion_max] if args.key?(:calendar_expansion_max)
          @group_expansion_max = args[:group_expansion_max] if args.key?(:group_expansion_max)
          @items = args[:items] if args.key?(:items)
          @time_max = args[:time_max] if args.key?(:time_max)
          @time_min = args[:time_min] if args.key?(:time_min)
          @time_zone = args[:time_zone] if args.key?(:time_zone)
        end
      end
      
      # 
      class FreeBusyRequestItem
        include Google::Apis::Core::Hashable
      
        # The identifier of a calendar or a group.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
        end
      end
      
      # 
      class FreeBusyResponse
        include Google::Apis::Core::Hashable
      
        # List of free/busy information for calendars.
        # Corresponds to the JSON property `calendars`
        # @return [Hash<String,Google::Apis::CalendarV3::FreeBusyCalendar>]
        attr_accessor :calendars
      
        # Expansion of groups.
        # Corresponds to the JSON property `groups`
        # @return [Hash<String,Google::Apis::CalendarV3::FreeBusyGroup>]
        attr_accessor :groups
      
        # Type of the resource ("calendar#freeBusy").
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The end of the interval.
        # Corresponds to the JSON property `timeMax`
        # @return [DateTime]
        attr_accessor :time_max
      
        # The start of the interval.
        # Corresponds to the JSON property `timeMin`
        # @return [DateTime]
        attr_accessor :time_min
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @calendars = args[:calendars] if args.key?(:calendars)
          @groups = args[:groups] if args.key?(:groups)
          @kind = args[:kind] if args.key?(:kind)
          @time_max = args[:time_max] if args.key?(:time_max)
          @time_min = args[:time_min] if args.key?(:time_min)
        end
      end
      
      # 
      class Setting
        include Google::Apis::Core::Hashable
      
        # ETag of the resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The id of the user setting.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Type of the resource ("calendar#setting").
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Value of the user setting. The format of the value depends on the ID of the
        # setting. It must always be a UTF-8 string of length up to 1024 characters.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # 
      class Settings
        include Google::Apis::Core::Hashable
      
        # Etag of the collection.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # List of user settings.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::CalendarV3::Setting>]
        attr_accessor :items
      
        # Type of the collection ("calendar#settings").
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Token used to access the next page of this result. Omitted if no further
        # results are available, in which case nextSyncToken is provided.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Token used at a later point in time to retrieve only the entries that have
        # changed since this result was returned. Omitted if further results are
        # available, in which case nextPageToken is provided.
        # Corresponds to the JSON property `nextSyncToken`
        # @return [String]
        attr_accessor :next_sync_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @next_sync_token = args[:next_sync_token] if args.key?(:next_sync_token)
        end
      end
      
      # 
      class TimePeriod
        include Google::Apis::Core::Hashable
      
        # The (exclusive) end of the time period.
        # Corresponds to the JSON property `end`
        # @return [DateTime]
        attr_accessor :end
      
        # The (inclusive) start of the time period.
        # Corresponds to the JSON property `start`
        # @return [DateTime]
        attr_accessor :start
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end = args[:end] if args.key?(:end)
          @start = args[:start] if args.key?(:start)
        end
      end
    end
  end
end
