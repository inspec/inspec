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
    module GmailV1
      
      # Auto-forwarding settings for an account.
      class AutoForwarding
        include Google::Apis::Core::Hashable
      
        # The state that a message should be left in after it has been forwarded.
        # Corresponds to the JSON property `disposition`
        # @return [String]
        attr_accessor :disposition
      
        # Email address to which all incoming messages are forwarded. This email address
        # must be a verified member of the forwarding addresses.
        # Corresponds to the JSON property `emailAddress`
        # @return [String]
        attr_accessor :email_address
      
        # Whether all incoming mail is automatically forwarded to another address.
        # Corresponds to the JSON property `enabled`
        # @return [Boolean]
        attr_accessor :enabled
        alias_method :enabled?, :enabled
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @disposition = args[:disposition] if args.key?(:disposition)
          @email_address = args[:email_address] if args.key?(:email_address)
          @enabled = args[:enabled] if args.key?(:enabled)
        end
      end
      
      # 
      class BatchDeleteMessagesRequest
        include Google::Apis::Core::Hashable
      
        # The IDs of the messages to delete.
        # Corresponds to the JSON property `ids`
        # @return [Array<String>]
        attr_accessor :ids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ids = args[:ids] if args.key?(:ids)
        end
      end
      
      # 
      class BatchModifyMessagesRequest
        include Google::Apis::Core::Hashable
      
        # A list of label IDs to add to messages.
        # Corresponds to the JSON property `addLabelIds`
        # @return [Array<String>]
        attr_accessor :add_label_ids
      
        # The IDs of the messages to modify. There is a limit of 1000 ids per request.
        # Corresponds to the JSON property `ids`
        # @return [Array<String>]
        attr_accessor :ids
      
        # A list of label IDs to remove from messages.
        # Corresponds to the JSON property `removeLabelIds`
        # @return [Array<String>]
        attr_accessor :remove_label_ids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @add_label_ids = args[:add_label_ids] if args.key?(:add_label_ids)
          @ids = args[:ids] if args.key?(:ids)
          @remove_label_ids = args[:remove_label_ids] if args.key?(:remove_label_ids)
        end
      end
      
      # Settings for a delegate. Delegates can read, send, and delete messages, as
      # well as view and add contacts, for the delegator's account. See "Set up mail
      # delegation" for more information about delegates.
      class Delegate
        include Google::Apis::Core::Hashable
      
        # The email address of the delegate.
        # Corresponds to the JSON property `delegateEmail`
        # @return [String]
        attr_accessor :delegate_email
      
        # Indicates whether this address has been verified and can act as a delegate for
        # the account. Read-only.
        # Corresponds to the JSON property `verificationStatus`
        # @return [String]
        attr_accessor :verification_status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @delegate_email = args[:delegate_email] if args.key?(:delegate_email)
          @verification_status = args[:verification_status] if args.key?(:verification_status)
        end
      end
      
      # A draft email in the user's mailbox.
      class Draft
        include Google::Apis::Core::Hashable
      
        # The immutable ID of the draft.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # An email message.
        # Corresponds to the JSON property `message`
        # @return [Google::Apis::GmailV1::Message]
        attr_accessor :message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @message = args[:message] if args.key?(:message)
        end
      end
      
      # Resource definition for Gmail filters. Filters apply to specific messages
      # instead of an entire email thread.
      class Filter
        include Google::Apis::Core::Hashable
      
        # A set of actions to perform on a message.
        # Corresponds to the JSON property `action`
        # @return [Google::Apis::GmailV1::FilterAction]
        attr_accessor :action
      
        # Message matching criteria.
        # Corresponds to the JSON property `criteria`
        # @return [Google::Apis::GmailV1::FilterCriteria]
        attr_accessor :criteria
      
        # The server assigned ID of the filter.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action = args[:action] if args.key?(:action)
          @criteria = args[:criteria] if args.key?(:criteria)
          @id = args[:id] if args.key?(:id)
        end
      end
      
      # A set of actions to perform on a message.
      class FilterAction
        include Google::Apis::Core::Hashable
      
        # List of labels to add to the message.
        # Corresponds to the JSON property `addLabelIds`
        # @return [Array<String>]
        attr_accessor :add_label_ids
      
        # Email address that the message should be forwarded to.
        # Corresponds to the JSON property `forward`
        # @return [String]
        attr_accessor :forward
      
        # List of labels to remove from the message.
        # Corresponds to the JSON property `removeLabelIds`
        # @return [Array<String>]
        attr_accessor :remove_label_ids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @add_label_ids = args[:add_label_ids] if args.key?(:add_label_ids)
          @forward = args[:forward] if args.key?(:forward)
          @remove_label_ids = args[:remove_label_ids] if args.key?(:remove_label_ids)
        end
      end
      
      # Message matching criteria.
      class FilterCriteria
        include Google::Apis::Core::Hashable
      
        # Whether the response should exclude chats.
        # Corresponds to the JSON property `excludeChats`
        # @return [Boolean]
        attr_accessor :exclude_chats
        alias_method :exclude_chats?, :exclude_chats
      
        # The sender's display name or email address.
        # Corresponds to the JSON property `from`
        # @return [String]
        attr_accessor :from
      
        # Whether the message has any attachment.
        # Corresponds to the JSON property `hasAttachment`
        # @return [Boolean]
        attr_accessor :has_attachment
        alias_method :has_attachment?, :has_attachment
      
        # Only return messages not matching the specified query. Supports the same query
        # format as the Gmail search box. For example, "from:someuser@example.com
        # rfc822msgid: is:unread".
        # Corresponds to the JSON property `negatedQuery`
        # @return [String]
        attr_accessor :negated_query
      
        # Only return messages matching the specified query. Supports the same query
        # format as the Gmail search box. For example, "from:someuser@example.com
        # rfc822msgid: is:unread".
        # Corresponds to the JSON property `query`
        # @return [String]
        attr_accessor :query
      
        # The size of the entire RFC822 message in bytes, including all headers and
        # attachments.
        # Corresponds to the JSON property `size`
        # @return [Fixnum]
        attr_accessor :size
      
        # How the message size in bytes should be in relation to the size field.
        # Corresponds to the JSON property `sizeComparison`
        # @return [String]
        attr_accessor :size_comparison
      
        # Case-insensitive phrase found in the message's subject. Trailing and leading
        # whitespace are be trimmed and adjacent spaces are collapsed.
        # Corresponds to the JSON property `subject`
        # @return [String]
        attr_accessor :subject
      
        # The recipient's display name or email address. Includes recipients in the "to",
        # "cc", and "bcc" header fields. You can use simply the local part of the email
        # address. For example, "example" and "example@" both match "example@gmail.com".
        # This field is case-insensitive.
        # Corresponds to the JSON property `to`
        # @return [String]
        attr_accessor :to
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @exclude_chats = args[:exclude_chats] if args.key?(:exclude_chats)
          @from = args[:from] if args.key?(:from)
          @has_attachment = args[:has_attachment] if args.key?(:has_attachment)
          @negated_query = args[:negated_query] if args.key?(:negated_query)
          @query = args[:query] if args.key?(:query)
          @size = args[:size] if args.key?(:size)
          @size_comparison = args[:size_comparison] if args.key?(:size_comparison)
          @subject = args[:subject] if args.key?(:subject)
          @to = args[:to] if args.key?(:to)
        end
      end
      
      # Settings for a forwarding address.
      class ForwardingAddress
        include Google::Apis::Core::Hashable
      
        # An email address to which messages can be forwarded.
        # Corresponds to the JSON property `forwardingEmail`
        # @return [String]
        attr_accessor :forwarding_email
      
        # Indicates whether this address has been verified and is usable for forwarding.
        # Read-only.
        # Corresponds to the JSON property `verificationStatus`
        # @return [String]
        attr_accessor :verification_status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @forwarding_email = args[:forwarding_email] if args.key?(:forwarding_email)
          @verification_status = args[:verification_status] if args.key?(:verification_status)
        end
      end
      
      # A record of a change to the user's mailbox. Each history change may affect
      # multiple messages in multiple ways.
      class History
        include Google::Apis::Core::Hashable
      
        # The mailbox sequence ID.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Labels added to messages in this history record.
        # Corresponds to the JSON property `labelsAdded`
        # @return [Array<Google::Apis::GmailV1::HistoryLabelAdded>]
        attr_accessor :labels_added
      
        # Labels removed from messages in this history record.
        # Corresponds to the JSON property `labelsRemoved`
        # @return [Array<Google::Apis::GmailV1::HistoryLabelRemoved>]
        attr_accessor :labels_removed
      
        # List of messages changed in this history record. The fields for specific
        # change types, such as messagesAdded may duplicate messages in this field. We
        # recommend using the specific change-type fields instead of this.
        # Corresponds to the JSON property `messages`
        # @return [Array<Google::Apis::GmailV1::Message>]
        attr_accessor :messages
      
        # Messages added to the mailbox in this history record.
        # Corresponds to the JSON property `messagesAdded`
        # @return [Array<Google::Apis::GmailV1::HistoryMessageAdded>]
        attr_accessor :messages_added
      
        # Messages deleted (not Trashed) from the mailbox in this history record.
        # Corresponds to the JSON property `messagesDeleted`
        # @return [Array<Google::Apis::GmailV1::HistoryMessageDeleted>]
        attr_accessor :messages_deleted
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @labels_added = args[:labels_added] if args.key?(:labels_added)
          @labels_removed = args[:labels_removed] if args.key?(:labels_removed)
          @messages = args[:messages] if args.key?(:messages)
          @messages_added = args[:messages_added] if args.key?(:messages_added)
          @messages_deleted = args[:messages_deleted] if args.key?(:messages_deleted)
        end
      end
      
      # 
      class HistoryLabelAdded
        include Google::Apis::Core::Hashable
      
        # Label IDs added to the message.
        # Corresponds to the JSON property `labelIds`
        # @return [Array<String>]
        attr_accessor :label_ids
      
        # An email message.
        # Corresponds to the JSON property `message`
        # @return [Google::Apis::GmailV1::Message]
        attr_accessor :message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @label_ids = args[:label_ids] if args.key?(:label_ids)
          @message = args[:message] if args.key?(:message)
        end
      end
      
      # 
      class HistoryLabelRemoved
        include Google::Apis::Core::Hashable
      
        # Label IDs removed from the message.
        # Corresponds to the JSON property `labelIds`
        # @return [Array<String>]
        attr_accessor :label_ids
      
        # An email message.
        # Corresponds to the JSON property `message`
        # @return [Google::Apis::GmailV1::Message]
        attr_accessor :message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @label_ids = args[:label_ids] if args.key?(:label_ids)
          @message = args[:message] if args.key?(:message)
        end
      end
      
      # 
      class HistoryMessageAdded
        include Google::Apis::Core::Hashable
      
        # An email message.
        # Corresponds to the JSON property `message`
        # @return [Google::Apis::GmailV1::Message]
        attr_accessor :message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @message = args[:message] if args.key?(:message)
        end
      end
      
      # 
      class HistoryMessageDeleted
        include Google::Apis::Core::Hashable
      
        # An email message.
        # Corresponds to the JSON property `message`
        # @return [Google::Apis::GmailV1::Message]
        attr_accessor :message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @message = args[:message] if args.key?(:message)
        end
      end
      
      # IMAP settings for an account.
      class ImapSettings
        include Google::Apis::Core::Hashable
      
        # If this value is true, Gmail will immediately expunge a message when it is
        # marked as deleted in IMAP. Otherwise, Gmail will wait for an update from the
        # client before expunging messages marked as deleted.
        # Corresponds to the JSON property `autoExpunge`
        # @return [Boolean]
        attr_accessor :auto_expunge
        alias_method :auto_expunge?, :auto_expunge
      
        # Whether IMAP is enabled for the account.
        # Corresponds to the JSON property `enabled`
        # @return [Boolean]
        attr_accessor :enabled
        alias_method :enabled?, :enabled
      
        # The action that will be executed on a message when it is marked as deleted and
        # expunged from the last visible IMAP folder.
        # Corresponds to the JSON property `expungeBehavior`
        # @return [String]
        attr_accessor :expunge_behavior
      
        # An optional limit on the number of messages that an IMAP folder may contain.
        # Legal values are 0, 1000, 2000, 5000 or 10000. A value of zero is interpreted
        # to mean that there is no limit.
        # Corresponds to the JSON property `maxFolderSize`
        # @return [Fixnum]
        attr_accessor :max_folder_size
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @auto_expunge = args[:auto_expunge] if args.key?(:auto_expunge)
          @enabled = args[:enabled] if args.key?(:enabled)
          @expunge_behavior = args[:expunge_behavior] if args.key?(:expunge_behavior)
          @max_folder_size = args[:max_folder_size] if args.key?(:max_folder_size)
        end
      end
      
      # Labels are used to categorize messages and threads within the user's mailbox.
      class Label
        include Google::Apis::Core::Hashable
      
        # The color to assign to the label. Color is only available for labels that have
        # their type set to user.
        # Corresponds to the JSON property `color`
        # @return [Google::Apis::GmailV1::LabelColor]
        attr_accessor :color
      
        # The immutable ID of the label.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The visibility of the label in the label list in the Gmail web interface.
        # Corresponds to the JSON property `labelListVisibility`
        # @return [String]
        attr_accessor :label_list_visibility
      
        # The visibility of the label in the message list in the Gmail web interface.
        # Corresponds to the JSON property `messageListVisibility`
        # @return [String]
        attr_accessor :message_list_visibility
      
        # The total number of messages with the label.
        # Corresponds to the JSON property `messagesTotal`
        # @return [Fixnum]
        attr_accessor :messages_total
      
        # The number of unread messages with the label.
        # Corresponds to the JSON property `messagesUnread`
        # @return [Fixnum]
        attr_accessor :messages_unread
      
        # The display name of the label.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The total number of threads with the label.
        # Corresponds to the JSON property `threadsTotal`
        # @return [Fixnum]
        attr_accessor :threads_total
      
        # The number of unread threads with the label.
        # Corresponds to the JSON property `threadsUnread`
        # @return [Fixnum]
        attr_accessor :threads_unread
      
        # The owner type for the label. User labels are created by the user and can be
        # modified and deleted by the user and can be applied to any message or thread.
        # System labels are internally created and cannot be added, modified, or deleted.
        # System labels may be able to be applied to or removed from messages and
        # threads under some circumstances but this is not guaranteed. For example,
        # users can apply and remove the INBOX and UNREAD labels from messages and
        # threads, but cannot apply or remove the DRAFTS or SENT labels from messages or
        # threads.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @color = args[:color] if args.key?(:color)
          @id = args[:id] if args.key?(:id)
          @label_list_visibility = args[:label_list_visibility] if args.key?(:label_list_visibility)
          @message_list_visibility = args[:message_list_visibility] if args.key?(:message_list_visibility)
          @messages_total = args[:messages_total] if args.key?(:messages_total)
          @messages_unread = args[:messages_unread] if args.key?(:messages_unread)
          @name = args[:name] if args.key?(:name)
          @threads_total = args[:threads_total] if args.key?(:threads_total)
          @threads_unread = args[:threads_unread] if args.key?(:threads_unread)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # 
      class LabelColor
        include Google::Apis::Core::Hashable
      
        # The background color represented as hex string #RRGGBB (ex #000000). This
        # field is required in order to set the color of a label. Only the following
        # predefined set of color values are allowed:
        # #000000, #434343, #666666, #999999, #cccccc, #efefef, #f3f3f3, #ffffff, #
        # fb4c2f, #ffad47, #fad165, #16a766, #43d692, #4a86e8, #a479e2, #f691b3, #f6c5be,
        # #ffe6c7, #fef1d1, #b9e4d0, #c6f3de, #c9daf8, #e4d7f5, #fcdee8, #efa093, #
        # ffd6a2, #fce8b3, #89d3b2, #a0eac9, #a4c2f4, #d0bcf1, #fbc8d9, #e66550, #ffbc6b,
        # #fcda83, #44b984, #68dfa9, #6d9eeb, #b694e8, #f7a7c0, #cc3a21, #eaa041, #
        # f2c960, #149e60, #3dc789, #3c78d8, #8e63ce, #e07798, #ac2b16, #cf8933, #d5ae49,
        # #0b804b, #2a9c68, #285bac, #653e9b, #b65775, #822111, #a46a21, #aa8831, #
        # 076239, #1a764d, #1c4587, #41236d, #83334c #464646, #e7e7e7, #0d3472, #b6cff5,
        # #0d3b44, #98d7e4, #3d188e, #e3d7ff, #711a36, #fbd3e0, #8a1c0a, #f2b2a8, #
        # 7a2e0b, #ffc8af, #7a4706, #ffdeb5, #594c05, #fbe983, #684e07, #fdedc1, #0b4f30,
        # #b3efd3, #04502e, #a2dcc1, #c2c2c2, #4986e7, #2da2bb, #b99aff, #994a64, #
        # f691b2, #ff7537, #ffad46, #662e37, #ebdbde, #cca6ac, #094228, #42d692, #16a765
        # Corresponds to the JSON property `backgroundColor`
        # @return [String]
        attr_accessor :background_color
      
        # The text color of the label, represented as hex string. This field is required
        # in order to set the color of a label. Only the following predefined set of
        # color values are allowed:
        # #000000, #434343, #666666, #999999, #cccccc, #efefef, #f3f3f3, #ffffff, #
        # fb4c2f, #ffad47, #fad165, #16a766, #43d692, #4a86e8, #a479e2, #f691b3, #f6c5be,
        # #ffe6c7, #fef1d1, #b9e4d0, #c6f3de, #c9daf8, #e4d7f5, #fcdee8, #efa093, #
        # ffd6a2, #fce8b3, #89d3b2, #a0eac9, #a4c2f4, #d0bcf1, #fbc8d9, #e66550, #ffbc6b,
        # #fcda83, #44b984, #68dfa9, #6d9eeb, #b694e8, #f7a7c0, #cc3a21, #eaa041, #
        # f2c960, #149e60, #3dc789, #3c78d8, #8e63ce, #e07798, #ac2b16, #cf8933, #d5ae49,
        # #0b804b, #2a9c68, #285bac, #653e9b, #b65775, #822111, #a46a21, #aa8831, #
        # 076239, #1a764d, #1c4587, #41236d, #83334c #464646, #e7e7e7, #0d3472, #b6cff5,
        # #0d3b44, #98d7e4, #3d188e, #e3d7ff, #711a36, #fbd3e0, #8a1c0a, #f2b2a8, #
        # 7a2e0b, #ffc8af, #7a4706, #ffdeb5, #594c05, #fbe983, #684e07, #fdedc1, #0b4f30,
        # #b3efd3, #04502e, #a2dcc1, #c2c2c2, #4986e7, #2da2bb, #b99aff, #994a64, #
        # f691b2, #ff7537, #ffad46, #662e37, #ebdbde, #cca6ac, #094228, #42d692, #16a765
        # Corresponds to the JSON property `textColor`
        # @return [String]
        attr_accessor :text_color
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @background_color = args[:background_color] if args.key?(:background_color)
          @text_color = args[:text_color] if args.key?(:text_color)
        end
      end
      
      # Language settings for an account. These settings correspond to the "Language
      # settings" feature in the web interface.
      class LanguageSettings
        include Google::Apis::Core::Hashable
      
        # The language to display Gmail in, formatted as an RFC 3066 Language Tag (for
        # example en-GB, fr or ja for British English, French, or Japanese respectively).
        # The set of languages supported by Gmail evolves over time, so please refer to
        # the "Language" dropdown in the Gmail settings  for all available options, as
        # described in the language settings help article. A table of sample values is
        # also provided in the Managing Language Settings guide
        # Not all Gmail clients can display the same set of languages. In the case that
        # a user's display language is not available for use on a particular client,
        # said client automatically chooses to display in the closest supported variant (
        # or a reasonable default).
        # Corresponds to the JSON property `displayLanguage`
        # @return [String]
        attr_accessor :display_language
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_language = args[:display_language] if args.key?(:display_language)
        end
      end
      
      # Response for the ListDelegates method.
      class ListDelegatesResponse
        include Google::Apis::Core::Hashable
      
        # List of the user's delegates (with any verification status).
        # Corresponds to the JSON property `delegates`
        # @return [Array<Google::Apis::GmailV1::Delegate>]
        attr_accessor :delegates
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @delegates = args[:delegates] if args.key?(:delegates)
        end
      end
      
      # 
      class ListDraftsResponse
        include Google::Apis::Core::Hashable
      
        # List of drafts.
        # Corresponds to the JSON property `drafts`
        # @return [Array<Google::Apis::GmailV1::Draft>]
        attr_accessor :drafts
      
        # Token to retrieve the next page of results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Estimated total number of results.
        # Corresponds to the JSON property `resultSizeEstimate`
        # @return [Fixnum]
        attr_accessor :result_size_estimate
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @drafts = args[:drafts] if args.key?(:drafts)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @result_size_estimate = args[:result_size_estimate] if args.key?(:result_size_estimate)
        end
      end
      
      # Response for the ListFilters method.
      class ListFiltersResponse
        include Google::Apis::Core::Hashable
      
        # List of a user's filters.
        # Corresponds to the JSON property `filter`
        # @return [Array<Google::Apis::GmailV1::Filter>]
        attr_accessor :filter
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @filter = args[:filter] if args.key?(:filter)
        end
      end
      
      # Response for the ListForwardingAddresses method.
      class ListForwardingAddressesResponse
        include Google::Apis::Core::Hashable
      
        # List of addresses that may be used for forwarding.
        # Corresponds to the JSON property `forwardingAddresses`
        # @return [Array<Google::Apis::GmailV1::ForwardingAddress>]
        attr_accessor :forwarding_addresses
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @forwarding_addresses = args[:forwarding_addresses] if args.key?(:forwarding_addresses)
        end
      end
      
      # 
      class ListHistoryResponse
        include Google::Apis::Core::Hashable
      
        # List of history records. Any messages contained in the response will typically
        # only have id and threadId fields populated.
        # Corresponds to the JSON property `history`
        # @return [Array<Google::Apis::GmailV1::History>]
        attr_accessor :history
      
        # The ID of the mailbox's current history record.
        # Corresponds to the JSON property `historyId`
        # @return [Fixnum]
        attr_accessor :history_id
      
        # Page token to retrieve the next page of results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @history = args[:history] if args.key?(:history)
          @history_id = args[:history_id] if args.key?(:history_id)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # 
      class ListLabelsResponse
        include Google::Apis::Core::Hashable
      
        # List of labels.
        # Corresponds to the JSON property `labels`
        # @return [Array<Google::Apis::GmailV1::Label>]
        attr_accessor :labels
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @labels = args[:labels] if args.key?(:labels)
        end
      end
      
      # 
      class ListMessagesResponse
        include Google::Apis::Core::Hashable
      
        # List of messages. Note that each message resource contains only an id and a
        # threadId. Additional message details can be fetched using the messages.get
        # method.
        # Corresponds to the JSON property `messages`
        # @return [Array<Google::Apis::GmailV1::Message>]
        attr_accessor :messages
      
        # Token to retrieve the next page of results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Estimated total number of results.
        # Corresponds to the JSON property `resultSizeEstimate`
        # @return [Fixnum]
        attr_accessor :result_size_estimate
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @messages = args[:messages] if args.key?(:messages)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @result_size_estimate = args[:result_size_estimate] if args.key?(:result_size_estimate)
        end
      end
      
      # Response for the ListSendAs method.
      class ListSendAsResponse
        include Google::Apis::Core::Hashable
      
        # List of send-as aliases.
        # Corresponds to the JSON property `sendAs`
        # @return [Array<Google::Apis::GmailV1::SendAs>]
        attr_accessor :send_as
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @send_as = args[:send_as] if args.key?(:send_as)
        end
      end
      
      # 
      class ListSmimeInfoResponse
        include Google::Apis::Core::Hashable
      
        # List of SmimeInfo.
        # Corresponds to the JSON property `smimeInfo`
        # @return [Array<Google::Apis::GmailV1::SmimeInfo>]
        attr_accessor :smime_info
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @smime_info = args[:smime_info] if args.key?(:smime_info)
        end
      end
      
      # 
      class ListThreadsResponse
        include Google::Apis::Core::Hashable
      
        # Page token to retrieve the next page of results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Estimated total number of results.
        # Corresponds to the JSON property `resultSizeEstimate`
        # @return [Fixnum]
        attr_accessor :result_size_estimate
      
        # List of threads. Note that each thread resource does not contain a list of
        # messages. The list of messages for a given thread can be fetched using the
        # threads.get method.
        # Corresponds to the JSON property `threads`
        # @return [Array<Google::Apis::GmailV1::Thread>]
        attr_accessor :threads
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @result_size_estimate = args[:result_size_estimate] if args.key?(:result_size_estimate)
          @threads = args[:threads] if args.key?(:threads)
        end
      end
      
      # An email message.
      class Message
        include Google::Apis::Core::Hashable
      
        # The ID of the last history record that modified this message.
        # Corresponds to the JSON property `historyId`
        # @return [Fixnum]
        attr_accessor :history_id
      
        # The immutable ID of the message.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The internal message creation timestamp (epoch ms), which determines ordering
        # in the inbox. For normal SMTP-received email, this represents the time the
        # message was originally accepted by Google, which is more reliable than the
        # Date header. However, for API-migrated mail, it can be configured by client to
        # be based on the Date header.
        # Corresponds to the JSON property `internalDate`
        # @return [Fixnum]
        attr_accessor :internal_date
      
        # List of IDs of labels applied to this message.
        # Corresponds to the JSON property `labelIds`
        # @return [Array<String>]
        attr_accessor :label_ids
      
        # A single MIME message part.
        # Corresponds to the JSON property `payload`
        # @return [Google::Apis::GmailV1::MessagePart]
        attr_accessor :payload
      
        # The entire email message in an RFC 2822 formatted and base64url encoded string.
        # Returned in messages.get and drafts.get responses when the format=RAW
        # parameter is supplied.
        # Corresponds to the JSON property `raw`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :raw
      
        # Estimated size in bytes of the message.
        # Corresponds to the JSON property `sizeEstimate`
        # @return [Fixnum]
        attr_accessor :size_estimate
      
        # A short part of the message text.
        # Corresponds to the JSON property `snippet`
        # @return [String]
        attr_accessor :snippet
      
        # The ID of the thread the message belongs to. To add a message or draft to a
        # thread, the following criteria must be met:
        # - The requested threadId must be specified on the Message or Draft.Message you
        # supply with your request.
        # - The References and In-Reply-To headers must be set in compliance with the
        # RFC 2822 standard.
        # - The Subject headers must match.
        # Corresponds to the JSON property `threadId`
        # @return [String]
        attr_accessor :thread_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @history_id = args[:history_id] if args.key?(:history_id)
          @id = args[:id] if args.key?(:id)
          @internal_date = args[:internal_date] if args.key?(:internal_date)
          @label_ids = args[:label_ids] if args.key?(:label_ids)
          @payload = args[:payload] if args.key?(:payload)
          @raw = args[:raw] if args.key?(:raw)
          @size_estimate = args[:size_estimate] if args.key?(:size_estimate)
          @snippet = args[:snippet] if args.key?(:snippet)
          @thread_id = args[:thread_id] if args.key?(:thread_id)
        end
      end
      
      # A single MIME message part.
      class MessagePart
        include Google::Apis::Core::Hashable
      
        # The body of a single MIME message part.
        # Corresponds to the JSON property `body`
        # @return [Google::Apis::GmailV1::MessagePartBody]
        attr_accessor :body
      
        # The filename of the attachment. Only present if this message part represents
        # an attachment.
        # Corresponds to the JSON property `filename`
        # @return [String]
        attr_accessor :filename
      
        # List of headers on this message part. For the top-level message part,
        # representing the entire message payload, it will contain the standard RFC 2822
        # email headers such as To, From, and Subject.
        # Corresponds to the JSON property `headers`
        # @return [Array<Google::Apis::GmailV1::MessagePartHeader>]
        attr_accessor :headers
      
        # The MIME type of the message part.
        # Corresponds to the JSON property `mimeType`
        # @return [String]
        attr_accessor :mime_type
      
        # The immutable ID of the message part.
        # Corresponds to the JSON property `partId`
        # @return [String]
        attr_accessor :part_id
      
        # The child MIME message parts of this part. This only applies to container MIME
        # message parts, for example multipart/*. For non- container MIME message part
        # types, such as text/plain, this field is empty. For more information, see RFC
        # 1521.
        # Corresponds to the JSON property `parts`
        # @return [Array<Google::Apis::GmailV1::MessagePart>]
        attr_accessor :parts
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @body = args[:body] if args.key?(:body)
          @filename = args[:filename] if args.key?(:filename)
          @headers = args[:headers] if args.key?(:headers)
          @mime_type = args[:mime_type] if args.key?(:mime_type)
          @part_id = args[:part_id] if args.key?(:part_id)
          @parts = args[:parts] if args.key?(:parts)
        end
      end
      
      # The body of a single MIME message part.
      class MessagePartBody
        include Google::Apis::Core::Hashable
      
        # When present, contains the ID of an external attachment that can be retrieved
        # in a separate messages.attachments.get request. When not present, the entire
        # content of the message part body is contained in the data field.
        # Corresponds to the JSON property `attachmentId`
        # @return [String]
        attr_accessor :attachment_id
      
        # The body data of a MIME message part as a base64url encoded string. May be
        # empty for MIME container types that have no message body or when the body data
        # is sent as a separate attachment. An attachment ID is present if the body data
        # is contained in a separate attachment.
        # Corresponds to the JSON property `data`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :data
      
        # Number of bytes for the message part data (encoding notwithstanding).
        # Corresponds to the JSON property `size`
        # @return [Fixnum]
        attr_accessor :size
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attachment_id = args[:attachment_id] if args.key?(:attachment_id)
          @data = args[:data] if args.key?(:data)
          @size = args[:size] if args.key?(:size)
        end
      end
      
      # 
      class MessagePartHeader
        include Google::Apis::Core::Hashable
      
        # The name of the header before the : separator. For example, To.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The value of the header after the : separator. For example, someuser@example.
        # com.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # 
      class ModifyMessageRequest
        include Google::Apis::Core::Hashable
      
        # A list of IDs of labels to add to this message.
        # Corresponds to the JSON property `addLabelIds`
        # @return [Array<String>]
        attr_accessor :add_label_ids
      
        # A list IDs of labels to remove from this message.
        # Corresponds to the JSON property `removeLabelIds`
        # @return [Array<String>]
        attr_accessor :remove_label_ids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @add_label_ids = args[:add_label_ids] if args.key?(:add_label_ids)
          @remove_label_ids = args[:remove_label_ids] if args.key?(:remove_label_ids)
        end
      end
      
      # 
      class ModifyThreadRequest
        include Google::Apis::Core::Hashable
      
        # A list of IDs of labels to add to this thread.
        # Corresponds to the JSON property `addLabelIds`
        # @return [Array<String>]
        attr_accessor :add_label_ids
      
        # A list of IDs of labels to remove from this thread.
        # Corresponds to the JSON property `removeLabelIds`
        # @return [Array<String>]
        attr_accessor :remove_label_ids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @add_label_ids = args[:add_label_ids] if args.key?(:add_label_ids)
          @remove_label_ids = args[:remove_label_ids] if args.key?(:remove_label_ids)
        end
      end
      
      # POP settings for an account.
      class PopSettings
        include Google::Apis::Core::Hashable
      
        # The range of messages which are accessible via POP.
        # Corresponds to the JSON property `accessWindow`
        # @return [String]
        attr_accessor :access_window
      
        # The action that will be executed on a message after it has been fetched via
        # POP.
        # Corresponds to the JSON property `disposition`
        # @return [String]
        attr_accessor :disposition
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @access_window = args[:access_window] if args.key?(:access_window)
          @disposition = args[:disposition] if args.key?(:disposition)
        end
      end
      
      # Profile for a Gmail user.
      class Profile
        include Google::Apis::Core::Hashable
      
        # The user's email address.
        # Corresponds to the JSON property `emailAddress`
        # @return [String]
        attr_accessor :email_address
      
        # The ID of the mailbox's current history record.
        # Corresponds to the JSON property `historyId`
        # @return [Fixnum]
        attr_accessor :history_id
      
        # The total number of messages in the mailbox.
        # Corresponds to the JSON property `messagesTotal`
        # @return [Fixnum]
        attr_accessor :messages_total
      
        # The total number of threads in the mailbox.
        # Corresponds to the JSON property `threadsTotal`
        # @return [Fixnum]
        attr_accessor :threads_total
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @email_address = args[:email_address] if args.key?(:email_address)
          @history_id = args[:history_id] if args.key?(:history_id)
          @messages_total = args[:messages_total] if args.key?(:messages_total)
          @threads_total = args[:threads_total] if args.key?(:threads_total)
        end
      end
      
      # Settings associated with a send-as alias, which can be either the primary
      # login address associated with the account or a custom "from" address. Send-as
      # aliases correspond to the "Send Mail As" feature in the web interface.
      class SendAs
        include Google::Apis::Core::Hashable
      
        # A name that appears in the "From:" header for mail sent using this alias. For
        # custom "from" addresses, when this is empty, Gmail will populate the "From:"
        # header with the name that is used for the primary address associated with the
        # account. If the admin has disabled the ability for users to update their name
        # format, requests to update this field for the primary login will silently fail.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Whether this address is selected as the default "From:" address in situations
        # such as composing a new message or sending a vacation auto-reply. Every Gmail
        # account has exactly one default send-as address, so the only legal value that
        # clients may write to this field is true. Changing this from false to true for
        # an address will result in this field becoming false for the other previous
        # default address.
        # Corresponds to the JSON property `isDefault`
        # @return [Boolean]
        attr_accessor :is_default
        alias_method :is_default?, :is_default
      
        # Whether this address is the primary address used to login to the account.
        # Every Gmail account has exactly one primary address, and it cannot be deleted
        # from the collection of send-as aliases. This field is read-only.
        # Corresponds to the JSON property `isPrimary`
        # @return [Boolean]
        attr_accessor :is_primary
        alias_method :is_primary?, :is_primary
      
        # An optional email address that is included in a "Reply-To:" header for mail
        # sent using this alias. If this is empty, Gmail will not generate a "Reply-To:"
        # header.
        # Corresponds to the JSON property `replyToAddress`
        # @return [String]
        attr_accessor :reply_to_address
      
        # The email address that appears in the "From:" header for mail sent using this
        # alias. This is read-only for all operations except create.
        # Corresponds to the JSON property `sendAsEmail`
        # @return [String]
        attr_accessor :send_as_email
      
        # An optional HTML signature that is included in messages composed with this
        # alias in the Gmail web UI.
        # Corresponds to the JSON property `signature`
        # @return [String]
        attr_accessor :signature
      
        # Configuration for communication with an SMTP service.
        # Corresponds to the JSON property `smtpMsa`
        # @return [Google::Apis::GmailV1::SmtpMsa]
        attr_accessor :smtp_msa
      
        # Whether Gmail should  treat this address as an alias for the user's primary
        # email address. This setting only applies to custom "from" aliases.
        # Corresponds to the JSON property `treatAsAlias`
        # @return [Boolean]
        attr_accessor :treat_as_alias
        alias_method :treat_as_alias?, :treat_as_alias
      
        # Indicates whether this address has been verified for use as a send-as alias.
        # Read-only. This setting only applies to custom "from" aliases.
        # Corresponds to the JSON property `verificationStatus`
        # @return [String]
        attr_accessor :verification_status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_name = args[:display_name] if args.key?(:display_name)
          @is_default = args[:is_default] if args.key?(:is_default)
          @is_primary = args[:is_primary] if args.key?(:is_primary)
          @reply_to_address = args[:reply_to_address] if args.key?(:reply_to_address)
          @send_as_email = args[:send_as_email] if args.key?(:send_as_email)
          @signature = args[:signature] if args.key?(:signature)
          @smtp_msa = args[:smtp_msa] if args.key?(:smtp_msa)
          @treat_as_alias = args[:treat_as_alias] if args.key?(:treat_as_alias)
          @verification_status = args[:verification_status] if args.key?(:verification_status)
        end
      end
      
      # An S/MIME email config.
      class SmimeInfo
        include Google::Apis::Core::Hashable
      
        # Encrypted key password, when key is encrypted.
        # Corresponds to the JSON property `encryptedKeyPassword`
        # @return [String]
        attr_accessor :encrypted_key_password
      
        # When the certificate expires (in milliseconds since epoch).
        # Corresponds to the JSON property `expiration`
        # @return [Fixnum]
        attr_accessor :expiration
      
        # The immutable ID for the SmimeInfo.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Whether this SmimeInfo is the default one for this user's send-as address.
        # Corresponds to the JSON property `isDefault`
        # @return [Boolean]
        attr_accessor :is_default
        alias_method :is_default?, :is_default
      
        # The S/MIME certificate issuer's common name.
        # Corresponds to the JSON property `issuerCn`
        # @return [String]
        attr_accessor :issuer_cn
      
        # PEM formatted X509 concatenated certificate string (standard base64 encoding).
        # Format used for returning key, which includes public key as well as
        # certificate chain (not private key).
        # Corresponds to the JSON property `pem`
        # @return [String]
        attr_accessor :pem
      
        # PKCS#12 format containing a single private/public key pair and certificate
        # chain. This format is only accepted from client for creating a new SmimeInfo
        # and is never returned, because the private key is not intended to be exported.
        # PKCS#12 may be encrypted, in which case encryptedKeyPassword should be set
        # appropriately.
        # Corresponds to the JSON property `pkcs12`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :pkcs12
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @encrypted_key_password = args[:encrypted_key_password] if args.key?(:encrypted_key_password)
          @expiration = args[:expiration] if args.key?(:expiration)
          @id = args[:id] if args.key?(:id)
          @is_default = args[:is_default] if args.key?(:is_default)
          @issuer_cn = args[:issuer_cn] if args.key?(:issuer_cn)
          @pem = args[:pem] if args.key?(:pem)
          @pkcs12 = args[:pkcs12] if args.key?(:pkcs12)
        end
      end
      
      # Configuration for communication with an SMTP service.
      class SmtpMsa
        include Google::Apis::Core::Hashable
      
        # The hostname of the SMTP service. Required.
        # Corresponds to the JSON property `host`
        # @return [String]
        attr_accessor :host
      
        # The password that will be used for authentication with the SMTP service. This
        # is a write-only field that can be specified in requests to create or update
        # SendAs settings; it is never populated in responses.
        # Corresponds to the JSON property `password`
        # @return [String]
        attr_accessor :password
      
        # The port of the SMTP service. Required.
        # Corresponds to the JSON property `port`
        # @return [Fixnum]
        attr_accessor :port
      
        # The protocol that will be used to secure communication with the SMTP service.
        # Required.
        # Corresponds to the JSON property `securityMode`
        # @return [String]
        attr_accessor :security_mode
      
        # The username that will be used for authentication with the SMTP service. This
        # is a write-only field that can be specified in requests to create or update
        # SendAs settings; it is never populated in responses.
        # Corresponds to the JSON property `username`
        # @return [String]
        attr_accessor :username
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @host = args[:host] if args.key?(:host)
          @password = args[:password] if args.key?(:password)
          @port = args[:port] if args.key?(:port)
          @security_mode = args[:security_mode] if args.key?(:security_mode)
          @username = args[:username] if args.key?(:username)
        end
      end
      
      # A collection of messages representing a conversation.
      class Thread
        include Google::Apis::Core::Hashable
      
        # The ID of the last history record that modified this thread.
        # Corresponds to the JSON property `historyId`
        # @return [Fixnum]
        attr_accessor :history_id
      
        # The unique ID of the thread.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The list of messages in the thread.
        # Corresponds to the JSON property `messages`
        # @return [Array<Google::Apis::GmailV1::Message>]
        attr_accessor :messages
      
        # A short part of the message text.
        # Corresponds to the JSON property `snippet`
        # @return [String]
        attr_accessor :snippet
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @history_id = args[:history_id] if args.key?(:history_id)
          @id = args[:id] if args.key?(:id)
          @messages = args[:messages] if args.key?(:messages)
          @snippet = args[:snippet] if args.key?(:snippet)
        end
      end
      
      # Vacation auto-reply settings for an account. These settings correspond to the "
      # Vacation responder" feature in the web interface.
      class VacationSettings
        include Google::Apis::Core::Hashable
      
        # Flag that controls whether Gmail automatically replies to messages.
        # Corresponds to the JSON property `enableAutoReply`
        # @return [Boolean]
        attr_accessor :enable_auto_reply
        alias_method :enable_auto_reply?, :enable_auto_reply
      
        # An optional end time for sending auto-replies (epoch ms). When this is
        # specified, Gmail will automatically reply only to messages that it receives
        # before the end time. If both startTime and endTime are specified, startTime
        # must precede endTime.
        # Corresponds to the JSON property `endTime`
        # @return [Fixnum]
        attr_accessor :end_time
      
        # Response body in HTML format. Gmail will sanitize the HTML before storing it.
        # Corresponds to the JSON property `responseBodyHtml`
        # @return [String]
        attr_accessor :response_body_html
      
        # Response body in plain text format.
        # Corresponds to the JSON property `responseBodyPlainText`
        # @return [String]
        attr_accessor :response_body_plain_text
      
        # Optional text to prepend to the subject line in vacation responses. In order
        # to enable auto-replies, either the response subject or the response body must
        # be nonempty.
        # Corresponds to the JSON property `responseSubject`
        # @return [String]
        attr_accessor :response_subject
      
        # Flag that determines whether responses are sent to recipients who are not in
        # the user's list of contacts.
        # Corresponds to the JSON property `restrictToContacts`
        # @return [Boolean]
        attr_accessor :restrict_to_contacts
        alias_method :restrict_to_contacts?, :restrict_to_contacts
      
        # Flag that determines whether responses are sent to recipients who are outside
        # of the user's domain. This feature is only available for G Suite users.
        # Corresponds to the JSON property `restrictToDomain`
        # @return [Boolean]
        attr_accessor :restrict_to_domain
        alias_method :restrict_to_domain?, :restrict_to_domain
      
        # An optional start time for sending auto-replies (epoch ms). When this is
        # specified, Gmail will automatically reply only to messages that it receives
        # after the start time. If both startTime and endTime are specified, startTime
        # must precede endTime.
        # Corresponds to the JSON property `startTime`
        # @return [Fixnum]
        attr_accessor :start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enable_auto_reply = args[:enable_auto_reply] if args.key?(:enable_auto_reply)
          @end_time = args[:end_time] if args.key?(:end_time)
          @response_body_html = args[:response_body_html] if args.key?(:response_body_html)
          @response_body_plain_text = args[:response_body_plain_text] if args.key?(:response_body_plain_text)
          @response_subject = args[:response_subject] if args.key?(:response_subject)
          @restrict_to_contacts = args[:restrict_to_contacts] if args.key?(:restrict_to_contacts)
          @restrict_to_domain = args[:restrict_to_domain] if args.key?(:restrict_to_domain)
          @start_time = args[:start_time] if args.key?(:start_time)
        end
      end
      
      # Set up or update a new push notification watch on this user's mailbox.
      class WatchRequest
        include Google::Apis::Core::Hashable
      
        # Filtering behavior of labelIds list specified.
        # Corresponds to the JSON property `labelFilterAction`
        # @return [String]
        attr_accessor :label_filter_action
      
        # List of label_ids to restrict notifications about. By default, if unspecified,
        # all changes are pushed out. If specified then dictates which labels are
        # required for a push notification to be generated.
        # Corresponds to the JSON property `labelIds`
        # @return [Array<String>]
        attr_accessor :label_ids
      
        # A fully qualified Google Cloud Pub/Sub API topic name to publish the events to.
        # This topic name **must** already exist in Cloud Pub/Sub and you **must** have
        # already granted gmail "publish" permission on it. For example, "projects/my-
        # project-identifier/topics/my-topic-name" (using the Cloud Pub/Sub "v1" topic
        # naming format).
        # Note that the "my-project-identifier" portion must exactly match your Google
        # developer project id (the one executing this watch request).
        # Corresponds to the JSON property `topicName`
        # @return [String]
        attr_accessor :topic_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @label_filter_action = args[:label_filter_action] if args.key?(:label_filter_action)
          @label_ids = args[:label_ids] if args.key?(:label_ids)
          @topic_name = args[:topic_name] if args.key?(:topic_name)
        end
      end
      
      # Push notification watch response.
      class WatchResponse
        include Google::Apis::Core::Hashable
      
        # When Gmail will stop sending notifications for mailbox updates (epoch millis).
        # Call watch again before this time to renew the watch.
        # Corresponds to the JSON property `expiration`
        # @return [Fixnum]
        attr_accessor :expiration
      
        # The ID of the mailbox's current history record.
        # Corresponds to the JSON property `historyId`
        # @return [Fixnum]
        attr_accessor :history_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @expiration = args[:expiration] if args.key?(:expiration)
          @history_id = args[:history_id] if args.key?(:history_id)
        end
      end
    end
  end
end
