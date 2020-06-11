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
    module MirrorV1
      
      # Represents an account passed into the Account Manager on Glass.
      class Account
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `authTokens`
        # @return [Array<Google::Apis::MirrorV1::AuthToken>]
        attr_accessor :auth_tokens
      
        # 
        # Corresponds to the JSON property `features`
        # @return [Array<String>]
        attr_accessor :features
      
        # 
        # Corresponds to the JSON property `password`
        # @return [String]
        attr_accessor :password
      
        # 
        # Corresponds to the JSON property `userData`
        # @return [Array<Google::Apis::MirrorV1::UserData>]
        attr_accessor :user_data
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @auth_tokens = args[:auth_tokens] if args.key?(:auth_tokens)
          @features = args[:features] if args.key?(:features)
          @password = args[:password] if args.key?(:password)
          @user_data = args[:user_data] if args.key?(:user_data)
        end
      end
      
      # Represents media content, such as a photo, that can be attached to a timeline
      # item.
      class Attachment
        include Google::Apis::Core::Hashable
      
        # The MIME type of the attachment.
        # Corresponds to the JSON property `contentType`
        # @return [String]
        attr_accessor :content_type
      
        # The URL for the content.
        # Corresponds to the JSON property `contentUrl`
        # @return [String]
        attr_accessor :content_url
      
        # The ID of the attachment.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Indicates that the contentUrl is not available because the attachment content
        # is still being processed. If the caller wishes to retrieve the content, it
        # should try again later.
        # Corresponds to the JSON property `isProcessingContent`
        # @return [Boolean]
        attr_accessor :is_processing_content
        alias_method :is_processing_content?, :is_processing_content
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content_type = args[:content_type] if args.key?(:content_type)
          @content_url = args[:content_url] if args.key?(:content_url)
          @id = args[:id] if args.key?(:id)
          @is_processing_content = args[:is_processing_content] if args.key?(:is_processing_content)
        end
      end
      
      # A list of Attachments. This is the response from the server to GET requests on
      # the attachments collection.
      class ListAttachmentsResponse
        include Google::Apis::Core::Hashable
      
        # The list of attachments.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::MirrorV1::Attachment>]
        attr_accessor :items
      
        # The type of resource. This is always mirror#attachmentsList.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # 
      class AuthToken
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `authToken`
        # @return [String]
        attr_accessor :auth_token
      
        # 
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @auth_token = args[:auth_token] if args.key?(:auth_token)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # A single menu command that is part of a Contact.
      class Command
        include Google::Apis::Core::Hashable
      
        # The type of operation this command corresponds to. Allowed values are:
        # - TAKE_A_NOTE - Shares a timeline item with the transcription of user speech
        # from the "Take a note" voice menu command.
        # - POST_AN_UPDATE - Shares a timeline item with the transcription of user
        # speech from the "Post an update" voice menu command.
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
      
      # A person or group that can be used as a creator or a contact.
      class Contact
        include Google::Apis::Core::Hashable
      
        # A list of voice menu commands that a contact can handle. Glass shows up to
        # three contacts for each voice menu command. If there are more than that, the
        # three contacts with the highest priority are shown for that particular command.
        # Corresponds to the JSON property `acceptCommands`
        # @return [Array<Google::Apis::MirrorV1::Command>]
        attr_accessor :accept_commands
      
        # A list of MIME types that a contact supports. The contact will be shown to the
        # user if any of its acceptTypes matches any of the types of the attachments on
        # the item. If no acceptTypes are given, the contact will be shown for all items.
        # Corresponds to the JSON property `acceptTypes`
        # @return [Array<String>]
        attr_accessor :accept_types
      
        # The name to display for this contact.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # An ID for this contact. This is generated by the application and is treated as
        # an opaque token.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Set of image URLs to display for a contact. Most contacts will have a single
        # image, but a "group" contact may include up to 8 image URLs and they will be
        # resized and cropped into a mosaic on the client.
        # Corresponds to the JSON property `imageUrls`
        # @return [Array<String>]
        attr_accessor :image_urls
      
        # The type of resource. This is always mirror#contact.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Primary phone number for the contact. This can be a fully-qualified number,
        # with country calling code and area code, or a local number.
        # Corresponds to the JSON property `phoneNumber`
        # @return [String]
        attr_accessor :phone_number
      
        # Priority for the contact to determine ordering in a list of contacts. Contacts
        # with higher priorities will be shown before ones with lower priorities.
        # Corresponds to the JSON property `priority`
        # @return [Fixnum]
        attr_accessor :priority
      
        # A list of sharing features that a contact can handle. Allowed values are:
        # - ADD_CAPTION
        # Corresponds to the JSON property `sharingFeatures`
        # @return [Array<String>]
        attr_accessor :sharing_features
      
        # The ID of the application that created this contact. This is populated by the
        # API
        # Corresponds to the JSON property `source`
        # @return [String]
        attr_accessor :source
      
        # Name of this contact as it should be pronounced. If this contact's name must
        # be spoken as part of a voice disambiguation menu, this name is used as the
        # expected pronunciation. This is useful for contact names with unpronounceable
        # characters or whose display spelling is otherwise not phonetic.
        # Corresponds to the JSON property `speakableName`
        # @return [String]
        attr_accessor :speakable_name
      
        # The type for this contact. This is used for sorting in UIs. Allowed values are:
        # 
        # - INDIVIDUAL - Represents a single person. This is the default.
        # - GROUP - Represents more than a single person.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @accept_commands = args[:accept_commands] if args.key?(:accept_commands)
          @accept_types = args[:accept_types] if args.key?(:accept_types)
          @display_name = args[:display_name] if args.key?(:display_name)
          @id = args[:id] if args.key?(:id)
          @image_urls = args[:image_urls] if args.key?(:image_urls)
          @kind = args[:kind] if args.key?(:kind)
          @phone_number = args[:phone_number] if args.key?(:phone_number)
          @priority = args[:priority] if args.key?(:priority)
          @sharing_features = args[:sharing_features] if args.key?(:sharing_features)
          @source = args[:source] if args.key?(:source)
          @speakable_name = args[:speakable_name] if args.key?(:speakable_name)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # A list of Contacts representing contacts. This is the response from the server
      # to GET requests on the contacts collection.
      class ListContactsResponse
        include Google::Apis::Core::Hashable
      
        # Contact list.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::MirrorV1::Contact>]
        attr_accessor :items
      
        # The type of resource. This is always mirror#contacts.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # A geographic location that can be associated with a timeline item.
      class Location
        include Google::Apis::Core::Hashable
      
        # The accuracy of the location fix in meters.
        # Corresponds to the JSON property `accuracy`
        # @return [Float]
        attr_accessor :accuracy
      
        # The full address of the location.
        # Corresponds to the JSON property `address`
        # @return [String]
        attr_accessor :address
      
        # The name to be displayed. This may be a business name or a user-defined place,
        # such as "Home".
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The ID of the location.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The type of resource. This is always mirror#location.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The latitude, in degrees.
        # Corresponds to the JSON property `latitude`
        # @return [Float]
        attr_accessor :latitude
      
        # The longitude, in degrees.
        # Corresponds to the JSON property `longitude`
        # @return [Float]
        attr_accessor :longitude
      
        # The time at which this location was captured, formatted according to RFC 3339.
        # Corresponds to the JSON property `timestamp`
        # @return [DateTime]
        attr_accessor :timestamp
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @accuracy = args[:accuracy] if args.key?(:accuracy)
          @address = args[:address] if args.key?(:address)
          @display_name = args[:display_name] if args.key?(:display_name)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @latitude = args[:latitude] if args.key?(:latitude)
          @longitude = args[:longitude] if args.key?(:longitude)
          @timestamp = args[:timestamp] if args.key?(:timestamp)
        end
      end
      
      # A list of Locations. This is the response from the server to GET requests on
      # the locations collection.
      class ListLocationsResponse
        include Google::Apis::Core::Hashable
      
        # The list of locations.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::MirrorV1::Location>]
        attr_accessor :items
      
        # The type of resource. This is always mirror#locationsList.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # A custom menu item that can be presented to the user by a timeline item.
      class MenuItem
        include Google::Apis::Core::Hashable
      
        # Controls the behavior when the user picks the menu option. Allowed values are:
        # 
        # - CUSTOM - Custom action set by the service. When the user selects this
        # menuItem, the API triggers a notification to your callbackUrl with the
        # userActions.type set to CUSTOM and the userActions.payload set to the ID of
        # this menu item. This is the default value.
        # - Built-in actions:
        # - REPLY - Initiate a reply to the timeline item using the voice recording UI.
        # The creator attribute must be set in the timeline item for this menu to be
        # available.
        # - REPLY_ALL - Same behavior as REPLY. The original timeline item's recipients
        # will be added to the reply item.
        # - DELETE - Delete the timeline item.
        # - SHARE - Share the timeline item with the available contacts.
        # - READ_ALOUD - Read the timeline item's speakableText aloud; if this field is
        # not set, read the text field; if none of those fields are set, this menu item
        # is ignored.
        # - GET_MEDIA_INPUT - Allow users to provide media payloads to Glassware from a
        # menu item (currently, only transcribed text from voice input is supported).
        # Subscribe to notifications when users invoke this menu item to receive the
        # timeline item ID. Retrieve the media from the timeline item in the payload
        # property.
        # - VOICE_CALL - Initiate a phone call using the timeline item's creator.
        # phoneNumber attribute as recipient.
        # - NAVIGATE - Navigate to the timeline item's location.
        # - TOGGLE_PINNED - Toggle the isPinned state of the timeline item.
        # - OPEN_URI - Open the payload of the menu item in the browser.
        # - PLAY_VIDEO - Open the payload of the menu item in the Glass video player.
        # - SEND_MESSAGE - Initiate sending a message to the timeline item's creator:
        # - If the creator.phoneNumber is set and Glass is connected to an Android phone,
        # the message is an SMS.
        # - Otherwise, if the creator.email is set, the message is an email.
        # Corresponds to the JSON property `action`
        # @return [String]
        attr_accessor :action
      
        # The ContextualMenus.Command associated with this MenuItem (e.g. READ_ALOUD).
        # The voice label for this command will be displayed in the voice menu and the
        # touch label will be displayed in the touch menu. Note that the default menu
        # value's display name will be overriden if you specify this property. Values
        # that do not correspond to a ContextualMenus.Command name will be ignored.
        # Corresponds to the JSON property `contextual_command`
        # @return [String]
        attr_accessor :contextual_command
      
        # The ID for this menu item. This is generated by the application and is treated
        # as an opaque token.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # A generic payload whose meaning changes depending on this MenuItem's action.
        # - When the action is OPEN_URI, the payload is the URL of the website to view.
        # - When the action is PLAY_VIDEO, the payload is the streaming URL of the video
        # - When the action is GET_MEDIA_INPUT, the payload is the text transcription of
        # a user's speech input
        # Corresponds to the JSON property `payload`
        # @return [String]
        attr_accessor :payload
      
        # If set to true on a CUSTOM menu item, that item will be removed from the menu
        # after it is selected.
        # Corresponds to the JSON property `removeWhenSelected`
        # @return [Boolean]
        attr_accessor :remove_when_selected
        alias_method :remove_when_selected?, :remove_when_selected
      
        # For CUSTOM items, a list of values controlling the appearance of the menu item
        # in each of its states. A value for the DEFAULT state must be provided. If the
        # PENDING or CONFIRMED states are missing, they will not be shown.
        # Corresponds to the JSON property `values`
        # @return [Array<Google::Apis::MirrorV1::MenuValue>]
        attr_accessor :values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action = args[:action] if args.key?(:action)
          @contextual_command = args[:contextual_command] if args.key?(:contextual_command)
          @id = args[:id] if args.key?(:id)
          @payload = args[:payload] if args.key?(:payload)
          @remove_when_selected = args[:remove_when_selected] if args.key?(:remove_when_selected)
          @values = args[:values] if args.key?(:values)
        end
      end
      
      # A single value that is part of a MenuItem.
      class MenuValue
        include Google::Apis::Core::Hashable
      
        # The name to display for the menu item. If you specify this property for a
        # built-in menu item, the default contextual voice command for that menu item is
        # not shown.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # URL of an icon to display with the menu item.
        # Corresponds to the JSON property `iconUrl`
        # @return [String]
        attr_accessor :icon_url
      
        # The state that this value applies to. Allowed values are:
        # - DEFAULT - Default value shown when displayed in the menuItems list.
        # - PENDING - Value shown when the menuItem has been selected by the user but
        # can still be cancelled.
        # - CONFIRMED - Value shown when the menuItem has been selected by the user and
        # can no longer be cancelled.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_name = args[:display_name] if args.key?(:display_name)
          @icon_url = args[:icon_url] if args.key?(:icon_url)
          @state = args[:state] if args.key?(:state)
        end
      end
      
      # A notification delivered by the API.
      class Notification
        include Google::Apis::Core::Hashable
      
        # The collection that generated the notification.
        # Corresponds to the JSON property `collection`
        # @return [String]
        attr_accessor :collection
      
        # The ID of the item that generated the notification.
        # Corresponds to the JSON property `itemId`
        # @return [String]
        attr_accessor :item_id
      
        # The type of operation that generated the notification.
        # Corresponds to the JSON property `operation`
        # @return [String]
        attr_accessor :operation
      
        # A list of actions taken by the user that triggered the notification.
        # Corresponds to the JSON property `userActions`
        # @return [Array<Google::Apis::MirrorV1::UserAction>]
        attr_accessor :user_actions
      
        # The user token provided by the service when it subscribed for notifications.
        # Corresponds to the JSON property `userToken`
        # @return [String]
        attr_accessor :user_token
      
        # The secret verify token provided by the service when it subscribed for
        # notifications.
        # Corresponds to the JSON property `verifyToken`
        # @return [String]
        attr_accessor :verify_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @collection = args[:collection] if args.key?(:collection)
          @item_id = args[:item_id] if args.key?(:item_id)
          @operation = args[:operation] if args.key?(:operation)
          @user_actions = args[:user_actions] if args.key?(:user_actions)
          @user_token = args[:user_token] if args.key?(:user_token)
          @verify_token = args[:verify_token] if args.key?(:verify_token)
        end
      end
      
      # Controls how notifications for a timeline item are presented to the user.
      class NotificationConfig
        include Google::Apis::Core::Hashable
      
        # The time at which the notification should be delivered.
        # Corresponds to the JSON property `deliveryTime`
        # @return [DateTime]
        attr_accessor :delivery_time
      
        # Describes how important the notification is. Allowed values are:
        # - DEFAULT - Notifications of default importance. A chime will be played to
        # alert users.
        # Corresponds to the JSON property `level`
        # @return [String]
        attr_accessor :level
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @delivery_time = args[:delivery_time] if args.key?(:delivery_time)
          @level = args[:level] if args.key?(:level)
        end
      end
      
      # A setting for Glass.
      class Setting
        include Google::Apis::Core::Hashable
      
        # The setting's ID. The following IDs are valid:
        # - locale - The key to the user’s language/locale (BCP 47 identifier) that
        # Glassware should use to render localized content.
        # - timezone - The key to the user’s current time zone region as defined in the
        # tz database. Example: America/Los_Angeles.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The type of resource. This is always mirror#setting.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The setting value, as a string.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # A subscription to events on a collection.
      class Subscription
        include Google::Apis::Core::Hashable
      
        # The URL where notifications should be delivered (must start with https://).
        # Corresponds to the JSON property `callbackUrl`
        # @return [String]
        attr_accessor :callback_url
      
        # The collection to subscribe to. Allowed values are:
        # - timeline - Changes in the timeline including insertion, deletion, and
        # updates.
        # - locations - Location updates.
        # - settings - Settings updates.
        # Corresponds to the JSON property `collection`
        # @return [String]
        attr_accessor :collection
      
        # The ID of the subscription.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The type of resource. This is always mirror#subscription.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # A notification delivered by the API.
        # Corresponds to the JSON property `notification`
        # @return [Google::Apis::MirrorV1::Notification]
        attr_accessor :notification
      
        # A list of operations that should be subscribed to. An empty list indicates
        # that all operations on the collection should be subscribed to. Allowed values
        # are:
        # - UPDATE - The item has been updated.
        # - INSERT - A new item has been inserted.
        # - DELETE - The item has been deleted.
        # - MENU_ACTION - A custom menu item has been triggered by the user.
        # Corresponds to the JSON property `operation`
        # @return [Array<String>]
        attr_accessor :operation
      
        # The time at which this subscription was last modified, formatted according to
        # RFC 3339.
        # Corresponds to the JSON property `updated`
        # @return [DateTime]
        attr_accessor :updated
      
        # An opaque token sent to the subscriber in notifications so that it can
        # determine the ID of the user.
        # Corresponds to the JSON property `userToken`
        # @return [String]
        attr_accessor :user_token
      
        # A secret token sent to the subscriber in notifications so that it can verify
        # that the notification was generated by Google.
        # Corresponds to the JSON property `verifyToken`
        # @return [String]
        attr_accessor :verify_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @callback_url = args[:callback_url] if args.key?(:callback_url)
          @collection = args[:collection] if args.key?(:collection)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @notification = args[:notification] if args.key?(:notification)
          @operation = args[:operation] if args.key?(:operation)
          @updated = args[:updated] if args.key?(:updated)
          @user_token = args[:user_token] if args.key?(:user_token)
          @verify_token = args[:verify_token] if args.key?(:verify_token)
        end
      end
      
      # A list of Subscriptions. This is the response from the server to GET requests
      # on the subscription collection.
      class ListSubscriptionsResponse
        include Google::Apis::Core::Hashable
      
        # The list of subscriptions.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::MirrorV1::Subscription>]
        attr_accessor :items
      
        # The type of resource. This is always mirror#subscriptionsList.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # Each item in the user's timeline is represented as a TimelineItem JSON
      # structure, described below.
      class TimelineItem
        include Google::Apis::Core::Hashable
      
        # A list of media attachments associated with this item. As a convenience, you
        # can refer to attachments in your HTML payloads with the attachment or cid
        # scheme. For example:
        # - attachment: <img src="attachment:attachment_index"> where attachment_index
        # is the 0-based index of this array.
        # - cid: <img src="cid:attachment_id"> where attachment_id is the ID of the
        # attachment.
        # Corresponds to the JSON property `attachments`
        # @return [Array<Google::Apis::MirrorV1::Attachment>]
        attr_accessor :attachments
      
        # The bundle ID for this item. Services can specify a bundleId to group many
        # items together. They appear under a single top-level item on the device.
        # Corresponds to the JSON property `bundleId`
        # @return [String]
        attr_accessor :bundle_id
      
        # A canonical URL pointing to the canonical/high quality version of the data
        # represented by the timeline item.
        # Corresponds to the JSON property `canonicalUrl`
        # @return [String]
        attr_accessor :canonical_url
      
        # The time at which this item was created, formatted according to RFC 3339.
        # Corresponds to the JSON property `created`
        # @return [DateTime]
        attr_accessor :created
      
        # A person or group that can be used as a creator or a contact.
        # Corresponds to the JSON property `creator`
        # @return [Google::Apis::MirrorV1::Contact]
        attr_accessor :creator
      
        # The time that should be displayed when this item is viewed in the timeline,
        # formatted according to RFC 3339. This user's timeline is sorted
        # chronologically on display time, so this will also determine where the item is
        # displayed in the timeline. If not set by the service, the display time
        # defaults to the updated time.
        # Corresponds to the JSON property `displayTime`
        # @return [DateTime]
        attr_accessor :display_time
      
        # ETag for this item.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # HTML content for this item. If both text and html are provided for an item,
        # the html will be rendered in the timeline.
        # Allowed HTML elements - You can use these elements in your timeline cards.
        # 
        # - Headers: h1, h2, h3, h4, h5, h6
        # - Images: img
        # - Lists: li, ol, ul
        # - HTML5 semantics: article, aside, details, figure, figcaption, footer, header,
        # nav, section, summary, time
        # - Structural: blockquote, br, div, hr, p, span
        # - Style: b, big, center, em, i, u, s, small, strike, strong, style, sub, sup
        # - Tables: table, tbody, td, tfoot, th, thead, tr
        # Blocked HTML elements: These elements and their contents are removed from HTML
        # payloads.
        # 
        # - Document headers: head, title
        # - Embeds: audio, embed, object, source, video
        # - Frames: frame, frameset
        # - Scripting: applet, script
        # Other elements: Any elements that aren't listed are removed, but their
        # contents are preserved.
        # Corresponds to the JSON property `html`
        # @return [String]
        attr_accessor :html
      
        # The ID of the timeline item. This is unique within a user's timeline.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # If this item was generated as a reply to another item, this field will be set
        # to the ID of the item being replied to. This can be used to attach a reply to
        # the appropriate conversation or post.
        # Corresponds to the JSON property `inReplyTo`
        # @return [String]
        attr_accessor :in_reply_to
      
        # Whether this item is a bundle cover.
        # If an item is marked as a bundle cover, it will be the entry point to the
        # bundle of items that have the same bundleId as that item. It will be shown
        # only on the main timeline — not within the opened bundle.
        # On the main timeline, items that are shown are:
        # - Items that have isBundleCover set to true
        # - Items that do not have a bundleId  In a bundle sub-timeline, items that are
        # shown are:
        # - Items that have the bundleId in question AND isBundleCover set to false
        # Corresponds to the JSON property `isBundleCover`
        # @return [Boolean]
        attr_accessor :is_bundle_cover
        alias_method :is_bundle_cover?, :is_bundle_cover
      
        # When true, indicates this item is deleted, and only the ID property is set.
        # Corresponds to the JSON property `isDeleted`
        # @return [Boolean]
        attr_accessor :is_deleted
        alias_method :is_deleted?, :is_deleted
      
        # When true, indicates this item is pinned, which means it's grouped alongside "
        # active" items like navigation and hangouts, on the opposite side of the home
        # screen from historical (non-pinned) timeline items. You can allow the user to
        # toggle the value of this property with the TOGGLE_PINNED built-in menu item.
        # Corresponds to the JSON property `isPinned`
        # @return [Boolean]
        attr_accessor :is_pinned
        alias_method :is_pinned?, :is_pinned
      
        # The type of resource. This is always mirror#timelineItem.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # A geographic location that can be associated with a timeline item.
        # Corresponds to the JSON property `location`
        # @return [Google::Apis::MirrorV1::Location]
        attr_accessor :location
      
        # A list of menu items that will be presented to the user when this item is
        # selected in the timeline.
        # Corresponds to the JSON property `menuItems`
        # @return [Array<Google::Apis::MirrorV1::MenuItem>]
        attr_accessor :menu_items
      
        # Controls how notifications for a timeline item are presented to the user.
        # Corresponds to the JSON property `notification`
        # @return [Google::Apis::MirrorV1::NotificationConfig]
        attr_accessor :notification
      
        # For pinned items, this determines the order in which the item is displayed in
        # the timeline, with a higher score appearing closer to the clock. Note: setting
        # this field is currently not supported.
        # Corresponds to the JSON property `pinScore`
        # @return [Fixnum]
        attr_accessor :pin_score
      
        # A list of users or groups that this item has been shared with.
        # Corresponds to the JSON property `recipients`
        # @return [Array<Google::Apis::MirrorV1::Contact>]
        attr_accessor :recipients
      
        # A URL that can be used to retrieve this item.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # Opaque string you can use to map a timeline item to data in your own service.
        # Corresponds to the JSON property `sourceItemId`
        # @return [String]
        attr_accessor :source_item_id
      
        # The speakable version of the content of this item. Along with the READ_ALOUD
        # menu item, use this field to provide text that would be clearer when read
        # aloud, or to provide extended information to what is displayed visually on
        # Glass.
        # Glassware should also specify the speakableType field, which will be spoken
        # before this text in cases where the additional context is useful, for example
        # when the user requests that the item be read aloud following a notification.
        # Corresponds to the JSON property `speakableText`
        # @return [String]
        attr_accessor :speakable_text
      
        # A speakable description of the type of this item. This will be announced to
        # the user prior to reading the content of the item in cases where the
        # additional context is useful, for example when the user requests that the item
        # be read aloud following a notification.
        # This should be a short, simple noun phrase such as "Email", "Text message", or
        # "Daily Planet News Update".
        # Glassware are encouraged to populate this field for every timeline item, even
        # if the item does not contain speakableText or text so that the user can learn
        # the type of the item without looking at the screen.
        # Corresponds to the JSON property `speakableType`
        # @return [String]
        attr_accessor :speakable_type
      
        # Text content of this item.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        # The title of this item.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # The time at which this item was last modified, formatted according to RFC 3339.
        # Corresponds to the JSON property `updated`
        # @return [DateTime]
        attr_accessor :updated
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attachments = args[:attachments] if args.key?(:attachments)
          @bundle_id = args[:bundle_id] if args.key?(:bundle_id)
          @canonical_url = args[:canonical_url] if args.key?(:canonical_url)
          @created = args[:created] if args.key?(:created)
          @creator = args[:creator] if args.key?(:creator)
          @display_time = args[:display_time] if args.key?(:display_time)
          @etag = args[:etag] if args.key?(:etag)
          @html = args[:html] if args.key?(:html)
          @id = args[:id] if args.key?(:id)
          @in_reply_to = args[:in_reply_to] if args.key?(:in_reply_to)
          @is_bundle_cover = args[:is_bundle_cover] if args.key?(:is_bundle_cover)
          @is_deleted = args[:is_deleted] if args.key?(:is_deleted)
          @is_pinned = args[:is_pinned] if args.key?(:is_pinned)
          @kind = args[:kind] if args.key?(:kind)
          @location = args[:location] if args.key?(:location)
          @menu_items = args[:menu_items] if args.key?(:menu_items)
          @notification = args[:notification] if args.key?(:notification)
          @pin_score = args[:pin_score] if args.key?(:pin_score)
          @recipients = args[:recipients] if args.key?(:recipients)
          @self_link = args[:self_link] if args.key?(:self_link)
          @source_item_id = args[:source_item_id] if args.key?(:source_item_id)
          @speakable_text = args[:speakable_text] if args.key?(:speakable_text)
          @speakable_type = args[:speakable_type] if args.key?(:speakable_type)
          @text = args[:text] if args.key?(:text)
          @title = args[:title] if args.key?(:title)
          @updated = args[:updated] if args.key?(:updated)
        end
      end
      
      # A list of timeline items. This is the response from the server to GET requests
      # on the timeline collection.
      class ListTimelineResponse
        include Google::Apis::Core::Hashable
      
        # Items in the timeline.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::MirrorV1::TimelineItem>]
        attr_accessor :items
      
        # The type of resource. This is always mirror#timeline.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The next page token. Provide this as the pageToken parameter in the request to
        # retrieve the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Represents an action taken by the user that triggered a notification.
      class UserAction
        include Google::Apis::Core::Hashable
      
        # An optional payload for the action.
        # For actions of type CUSTOM, this is the ID of the custom menu item that was
        # selected.
        # Corresponds to the JSON property `payload`
        # @return [String]
        attr_accessor :payload
      
        # The type of action. The value of this can be:
        # - SHARE - the user shared an item.
        # - REPLY - the user replied to an item.
        # - REPLY_ALL - the user replied to all recipients of an item.
        # - CUSTOM - the user selected a custom menu item on the timeline item.
        # - DELETE - the user deleted the item.
        # - PIN - the user pinned the item.
        # - UNPIN - the user unpinned the item.
        # - LAUNCH - the user initiated a voice command.  In the future, additional
        # types may be added. UserActions with unrecognized types should be ignored.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @payload = args[:payload] if args.key?(:payload)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # 
      class UserData
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # 
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @key = args[:key] if args.key?(:key)
          @value = args[:value] if args.key?(:value)
        end
      end
    end
  end
end
