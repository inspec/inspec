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
    module GroupssettingsV1
      
      # JSON template for Group resource
      class Groups
        include Google::Apis::Core::Hashable
      
        # Identifies whether members external to your organization can join the group.
        # Possible values are:
        # - true: G Suite users external to your organization can become members of this
        # group.
        # - false: Users not belonging to the organization are not allowed to become
        # members of this group.
        # Corresponds to the JSON property `allowExternalMembers`
        # @return [String]
        attr_accessor :allow_external_members
      
        # Deprecated. Allows Google to contact administrator of the group.
        # - true: Allow Google to contact managers of this group. Occasionally Google
        # may send updates on the latest features, ask for input on new features, or ask
        # for permission to highlight your group.
        # - false: Google can not contact managers of this group.
        # Corresponds to the JSON property `allowGoogleCommunication`
        # @return [String]
        attr_accessor :allow_google_communication
      
        # Allows posting from web. Possible values are:
        # - true: Allows any member to post to the group forum.
        # - false: Members only use Gmail to communicate with the group.
        # Corresponds to the JSON property `allowWebPosting`
        # @return [String]
        attr_accessor :allow_web_posting
      
        # Allows the group to be archived only. Possible values are:
        # - true: Group is archived and the group is inactive. New messages to this
        # group are rejected. The older archived messages are browseable and searchable.
        # 
        # - If true, the whoCanPostMessage property is set to NONE_CAN_POST.
        # - If reverted from true to false, whoCanPostMessages is set to
        # ALL_MANAGERS_CAN_POST.
        # - false: The group is active and can receive messages.
        # - When false, updating whoCanPostMessage to NONE_CAN_POST, results in an error.
        # Corresponds to the JSON property `archiveOnly`
        # @return [String]
        attr_accessor :archive_only
      
        # Set the content of custom footer text. The maximum number of characters is 1,
        # 000.
        # Corresponds to the JSON property `customFooterText`
        # @return [String]
        attr_accessor :custom_footer_text
      
        # An email address used when replying to a message if the replyTo property is
        # set to REPLY_TO_CUSTOM. This address is defined by an account administrator.
        # - When the group's ReplyTo property is set to REPLY_TO_CUSTOM, the
        # customReplyTo property holds a custom email address used when replying to a
        # message.
        # - If the group's ReplyTo property is set to REPLY_TO_CUSTOM, the customReplyTo
        # property must have a text value or an error is returned.
        # Corresponds to the JSON property `customReplyTo`
        # @return [String]
        attr_accessor :custom_reply_to
      
        # Specifies whether the group has a custom role that's included in one of the
        # settings being merged. This field is read-only and update/patch requests to it
        # are ignored. Possible values are:
        # - true
        # - false
        # Corresponds to the JSON property `customRolesEnabledForSettingsToBeMerged`
        # @return [String]
        attr_accessor :custom_roles_enabled_for_settings_to_be_merged
      
        # When a message is rejected, this is text for the rejection notification sent
        # to the message's author. By default, this property is empty and has no value
        # in the API's response body. The maximum notification text size is 10,000
        # characters. Note: Requires sendMessageDenyNotification property to be true.
        # Corresponds to the JSON property `defaultMessageDenyNotificationText`
        # @return [String]
        attr_accessor :default_message_deny_notification_text
      
        # Description of the group. This property value may be an empty string if no
        # group description has been entered. If entered, the maximum group description
        # is no more than 300 characters.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The group's email address. This property can be updated using the Directory
        # API. Note: Only a group owner can change a group's email address. A group
        # manager can't do this.
        # When you change your group's address using the Directory API or the control
        # panel, you are changing the address your subscribers use to send email and the
        # web address people use to access your group. People can't reach your group by
        # visiting the old address.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # Specifies whether a collaborative inbox will remain turned on for the group.
        # Possible values are:
        # - true
        # - false
        # Corresponds to the JSON property `enableCollaborativeInbox`
        # @return [String]
        attr_accessor :enable_collaborative_inbox
      
        # Indicates if favorite replies should be displayed above other replies.
        # - true: Favorite replies will be displayed above other replies.
        # - false: Favorite replies will not be displayed above other replies.
        # Corresponds to the JSON property `favoriteRepliesOnTop`
        # @return [String]
        attr_accessor :favorite_replies_on_top
      
        # Whether to include custom footer. Possible values are:
        # - true
        # - false
        # Corresponds to the JSON property `includeCustomFooter`
        # @return [String]
        attr_accessor :include_custom_footer
      
        # Enables the group to be included in the Global Address List. For more
        # information, see the help center. Possible values are:
        # - true: Group is included in the Global Address List.
        # - false: Group is not included in the Global Address List.
        # Corresponds to the JSON property `includeInGlobalAddressList`
        # @return [String]
        attr_accessor :include_in_global_address_list
      
        # Allows the Group contents to be archived. Possible values are:
        # - true: Archive messages sent to the group.
        # - false: Do not keep an archive of messages sent to this group. If false,
        # previously archived messages remain in the archive.
        # Corresponds to the JSON property `isArchived`
        # @return [String]
        attr_accessor :is_archived
      
        # The type of the resource. It is always groupsSettings#groups.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Deprecated. The maximum size of a message is 25Mb.
        # Corresponds to the JSON property `maxMessageBytes`
        # @return [Fixnum]
        attr_accessor :max_message_bytes
      
        # Enables members to post messages as the group. Possible values are:
        # - true: Group member can post messages using the group's email address instead
        # of their own email address. Message appear to originate from the group itself.
        # Note: When true, any message moderation settings on individual users or new
        # members do not apply to posts made on behalf of the group.
        # - false: Members can not post in behalf of the group's email address.
        # Corresponds to the JSON property `membersCanPostAsTheGroup`
        # @return [String]
        attr_accessor :members_can_post_as_the_group
      
        # Deprecated. The default message display font always has a value of "
        # DEFAULT_FONT".
        # Corresponds to the JSON property `messageDisplayFont`
        # @return [String]
        attr_accessor :message_display_font
      
        # Moderation level of incoming messages. Possible values are:
        # - MODERATE_ALL_MESSAGES: All messages are sent to the group owner's email
        # address for approval. If approved, the message is sent to the group.
        # - MODERATE_NON_MEMBERS: All messages from non group members are sent to the
        # group owner's email address for approval. If approved, the message is sent to
        # the group.
        # - MODERATE_NEW_MEMBERS: All messages from new members are sent to the group
        # owner's email address for approval. If approved, the message is sent to the
        # group.
        # - MODERATE_NONE: No moderator approval is required. Messages are delivered
        # directly to the group. Note: When the whoCanPostMessage is set to
        # ANYONE_CAN_POST, we recommend the messageModerationLevel be set to
        # MODERATE_NON_MEMBERS to protect the group from possible spam.
        # When memberCanPostAsTheGroup is true, any message moderation settings on
        # individual users or new members will not apply to posts made on behalf of the
        # group.
        # Corresponds to the JSON property `messageModerationLevel`
        # @return [String]
        attr_accessor :message_moderation_level
      
        # Name of the group, which has a maximum size of 75 characters.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The primary language for group. For a group's primary language use the
        # language tags from the G Suite languages found at G Suite Email Settings API
        # Email Language Tags.
        # Corresponds to the JSON property `primaryLanguage`
        # @return [String]
        attr_accessor :primary_language
      
        # Specifies who should the default reply go to. Possible values are:
        # - REPLY_TO_CUSTOM: For replies to messages, use the group's custom email
        # address.
        # When the group's ReplyTo property is set to REPLY_TO_CUSTOM, the customReplyTo
        # property holds the custom email address used when replying to a message. If
        # the group's ReplyTo property is set to REPLY_TO_CUSTOM, the customReplyTo
        # property must have a value. Otherwise an error is returned.
        # 
        # - REPLY_TO_SENDER: The reply sent to author of message.
        # - REPLY_TO_LIST: This reply message is sent to the group.
        # - REPLY_TO_OWNER: The reply is sent to the owner(s) of the group. This does
        # not include the group's managers.
        # - REPLY_TO_IGNORE: Group users individually decide where the message reply is
        # sent.
        # - REPLY_TO_MANAGERS: This reply message is sent to the group's managers, which
        # includes all managers and the group owner.
        # Corresponds to the JSON property `replyTo`
        # @return [String]
        attr_accessor :reply_to
      
        # Allows a member to be notified if the member's message to the group is denied
        # by the group owner. Possible values are:
        # - true: When a message is rejected, send the deny message notification to the
        # message author.
        # The defaultMessageDenyNotificationText property is dependent on the
        # sendMessageDenyNotification property being true.
        # 
        # - false: When a message is rejected, no notification is sent.
        # Corresponds to the JSON property `sendMessageDenyNotification`
        # @return [String]
        attr_accessor :send_message_deny_notification
      
        # Deprecated. This is merged into the new whoCanDiscoverGroup setting. Allows
        # the group to be visible in the Groups Directory. Possible values are:
        # - true: All groups in the account are listed in the Groups directory.
        # - false: All groups in the account are not listed in the directory.
        # Corresponds to the JSON property `showInGroupDirectory`
        # @return [String]
        attr_accessor :show_in_group_directory
      
        # Specifies moderation levels for messages detected as spam. Possible values are:
        # 
        # - ALLOW: Post the message to the group.
        # - MODERATE: Send the message to the moderation queue. This is the default.
        # - SILENTLY_MODERATE: Send the message to the moderation queue, but do not send
        # notification to moderators.
        # - REJECT: Immediately reject the message.
        # Corresponds to the JSON property `spamModerationLevel`
        # @return [String]
        attr_accessor :spam_moderation_level
      
        # Deprecated. This is merged into the new whoCanModerateMembers setting.
        # Permissions to add members. Possible values are:
        # - ALL_MEMBERS_CAN_ADD: Managers and members can directly add new members.
        # - ALL_MANAGERS_CAN_ADD: Only managers can directly add new members. this
        # includes the group's owner.
        # - ALL_OWNERS_CAN_ADD: Only owners can directly add new members.
        # - NONE_CAN_ADD: No one can directly add new members.
        # Corresponds to the JSON property `whoCanAdd`
        # @return [String]
        attr_accessor :who_can_add
      
        # Deprecated. This functionality is no longer supported in the Google Groups UI.
        # The value is always "NONE".
        # Corresponds to the JSON property `whoCanAddReferences`
        # @return [String]
        attr_accessor :who_can_add_references
      
        # Specifies who can approve members who ask to join groups. This permission will
        # be deprecated once it is merged into the new whoCanModerateMembers setting.
        # Possible values are:
        # - ALL_MEMBERS_CAN_APPROVE
        # - ALL_MANAGERS_CAN_APPROVE
        # - ALL_OWNERS_CAN_APPROVE
        # - NONE_CAN_APPROVE
        # Corresponds to the JSON property `whoCanApproveMembers`
        # @return [String]
        attr_accessor :who_can_approve_members
      
        # Deprecated. This is merged into the new whoCanModerateContent setting.
        # Specifies who can approve pending messages in the moderation queue. Possible
        # values are:
        # - ALL_MEMBERS
        # - OWNERS_AND_MANAGERS
        # - OWNERS_ONLY
        # - NONE
        # Corresponds to the JSON property `whoCanApproveMessages`
        # @return [String]
        attr_accessor :who_can_approve_messages
      
        # Deprecated. This is merged into the new whoCanAssistContent setting.
        # Permission to assign topics in a forum to another user. Possible values are:
        # - ALL_MEMBERS
        # - OWNERS_AND_MANAGERS
        # - MANAGERS_ONLY
        # - OWNERS_ONLY
        # - NONE
        # Corresponds to the JSON property `whoCanAssignTopics`
        # @return [String]
        attr_accessor :who_can_assign_topics
      
        # Specifies who can moderate metadata. Possible values are:
        # - ALL_MEMBERS
        # - OWNERS_AND_MANAGERS
        # - MANAGERS_ONLY
        # - OWNERS_ONLY
        # - NONE
        # Corresponds to the JSON property `whoCanAssistContent`
        # @return [String]
        attr_accessor :who_can_assist_content
      
        # Specifies who can deny membership to users. This permission will be deprecated
        # once it is merged into the new whoCanModerateMembers setting. Possible values
        # are:
        # - ALL_MEMBERS
        # - OWNERS_AND_MANAGERS
        # - OWNERS_ONLY
        # - NONE
        # Corresponds to the JSON property `whoCanBanUsers`
        # @return [String]
        attr_accessor :who_can_ban_users
      
        # Permission to contact owner of the group via web UI. Possible values are:
        # - ALL_IN_DOMAIN_CAN_CONTACT
        # - ALL_MANAGERS_CAN_CONTACT
        # - ALL_MEMBERS_CAN_CONTACT
        # - ANYONE_CAN_CONTACT
        # Corresponds to the JSON property `whoCanContactOwner`
        # @return [String]
        attr_accessor :who_can_contact_owner
      
        # Deprecated. This is merged into the new whoCanModerateContent setting.
        # Specifies who can delete replies to topics. (Authors can always delete their
        # own posts). Possible values are:
        # - ALL_MEMBERS
        # - OWNERS_AND_MANAGERS
        # - OWNERS_ONLY
        # - NONE
        # Corresponds to the JSON property `whoCanDeleteAnyPost`
        # @return [String]
        attr_accessor :who_can_delete_any_post
      
        # Deprecated. This is merged into the new whoCanModerateContent setting.
        # Specifies who can delete topics. Possible values are:
        # - ALL_MEMBERS
        # - OWNERS_AND_MANAGERS
        # - OWNERS_ONLY
        # - NONE
        # Corresponds to the JSON property `whoCanDeleteTopics`
        # @return [String]
        attr_accessor :who_can_delete_topics
      
        # Specifies the set of users for whom this group is discoverable. Possible
        # values are:
        # - ANYONE_CAN_DISCOVER
        # - ALL_IN_DOMAIN_CAN_DISCOVER
        # - ALL_MEMBERS_CAN_DISCOVER
        # Corresponds to the JSON property `whoCanDiscoverGroup`
        # @return [String]
        attr_accessor :who_can_discover_group
      
        # Deprecated. This is merged into the new whoCanAssistContent setting.
        # Permission to enter free form tags for topics in a forum. Possible values are:
        # 
        # - ALL_MEMBERS
        # - OWNERS_AND_MANAGERS
        # - MANAGERS_ONLY
        # - OWNERS_ONLY
        # - NONE
        # Corresponds to the JSON property `whoCanEnterFreeFormTags`
        # @return [String]
        attr_accessor :who_can_enter_free_form_tags
      
        # Deprecated. This is merged into the new whoCanModerateContent setting.
        # Specifies who can hide posts by reporting them as abuse. Possible values are:
        # - ALL_MEMBERS
        # - OWNERS_AND_MANAGERS
        # - OWNERS_ONLY
        # - NONE
        # Corresponds to the JSON property `whoCanHideAbuse`
        # @return [String]
        attr_accessor :who_can_hide_abuse
      
        # Deprecated. This is merged into the new whoCanModerateMembers setting.
        # Permissions to invite new members. Possible values are:
        # - ALL_MEMBERS_CAN_INVITE: Managers and members can invite a new member
        # candidate.
        # - ALL_MANAGERS_CAN_INVITE: Only managers can invite a new member. This
        # includes the group's owner.
        # - ALL_OWNERS_CAN_INVITE: Only owners can invite a new member.
        # - NONE_CAN_INVITE: No one can invite a new member candidate.
        # Corresponds to the JSON property `whoCanInvite`
        # @return [String]
        attr_accessor :who_can_invite
      
        # Permission to join group. Possible values are:
        # - ANYONE_CAN_JOIN: Anyone in the account domain can join. This includes
        # accounts with multiple domains.
        # - ALL_IN_DOMAIN_CAN_JOIN: Any Internet user who is outside your domain can
        # access your Google Groups service and view the list of groups in your Groups
        # directory. Warning: Group owners can add external addresses, outside of the
        # domain to their groups. They can also allow people outside your domain to join
        # their groups. If you later disable this option, any external addresses already
        # added to users' groups remain in those groups.
        # - INVITED_CAN_JOIN: Candidates for membership can be invited to join.
        # - CAN_REQUEST_TO_JOIN: Non members can request an invitation to join.
        # Corresponds to the JSON property `whoCanJoin`
        # @return [String]
        attr_accessor :who_can_join
      
        # Permission to leave the group. Possible values are:
        # - ALL_MANAGERS_CAN_LEAVE
        # - ALL_MEMBERS_CAN_LEAVE
        # - NONE_CAN_LEAVE
        # Corresponds to the JSON property `whoCanLeaveGroup`
        # @return [String]
        attr_accessor :who_can_leave_group
      
        # Deprecated. This is merged into the new whoCanModerateContent setting.
        # Specifies who can prevent users from posting replies to topics. Possible
        # values are:
        # - ALL_MEMBERS
        # - OWNERS_AND_MANAGERS
        # - OWNERS_ONLY
        # - NONE
        # Corresponds to the JSON property `whoCanLockTopics`
        # @return [String]
        attr_accessor :who_can_lock_topics
      
        # Deprecated. This is merged into the new whoCanModerateContent setting.
        # Specifies who can make topics appear at the top of the topic list. Possible
        # values are:
        # - ALL_MEMBERS
        # - OWNERS_AND_MANAGERS
        # - OWNERS_ONLY
        # - NONE
        # Corresponds to the JSON property `whoCanMakeTopicsSticky`
        # @return [String]
        attr_accessor :who_can_make_topics_sticky
      
        # Deprecated. This is merged into the new whoCanAssistContent setting.
        # Permission to mark a topic as a duplicate of another topic. Possible values
        # are:
        # - ALL_MEMBERS
        # - OWNERS_AND_MANAGERS
        # - MANAGERS_ONLY
        # - OWNERS_ONLY
        # - NONE
        # Corresponds to the JSON property `whoCanMarkDuplicate`
        # @return [String]
        attr_accessor :who_can_mark_duplicate
      
        # Deprecated. This is merged into the new whoCanAssistContent setting.
        # Permission to mark any other user's post as a favorite reply. Possible values
        # are:
        # - ALL_MEMBERS
        # - OWNERS_AND_MANAGERS
        # - MANAGERS_ONLY
        # - OWNERS_ONLY
        # - NONE
        # Corresponds to the JSON property `whoCanMarkFavoriteReplyOnAnyTopic`
        # @return [String]
        attr_accessor :who_can_mark_favorite_reply_on_any_topic
      
        # Deprecated. This is merged into the new whoCanAssistContent setting.
        # Permission to mark a post for a topic they started as a favorite reply.
        # Possible values are:
        # - ALL_MEMBERS
        # - OWNERS_AND_MANAGERS
        # - MANAGERS_ONLY
        # - OWNERS_ONLY
        # - NONE
        # Corresponds to the JSON property `whoCanMarkFavoriteReplyOnOwnTopic`
        # @return [String]
        attr_accessor :who_can_mark_favorite_reply_on_own_topic
      
        # Deprecated. This is merged into the new whoCanAssistContent setting.
        # Permission to mark a topic as not needing a response. Possible values are:
        # - ALL_MEMBERS
        # - OWNERS_AND_MANAGERS
        # - MANAGERS_ONLY
        # - OWNERS_ONLY
        # - NONE
        # Corresponds to the JSON property `whoCanMarkNoResponseNeeded`
        # @return [String]
        attr_accessor :who_can_mark_no_response_needed
      
        # Specifies who can moderate content. Possible values are:
        # - ALL_MEMBERS
        # - OWNERS_AND_MANAGERS
        # - OWNERS_ONLY
        # - NONE
        # Corresponds to the JSON property `whoCanModerateContent`
        # @return [String]
        attr_accessor :who_can_moderate_content
      
        # Specifies who can manage members. Possible values are:
        # - ALL_MEMBERS
        # - OWNERS_AND_MANAGERS
        # - OWNERS_ONLY
        # - NONE
        # Corresponds to the JSON property `whoCanModerateMembers`
        # @return [String]
        attr_accessor :who_can_moderate_members
      
        # Deprecated. This is merged into the new whoCanModerateMembers setting.
        # Specifies who can change group members' roles. Possible values are:
        # - ALL_MEMBERS
        # - OWNERS_AND_MANAGERS
        # - OWNERS_ONLY
        # - NONE
        # Corresponds to the JSON property `whoCanModifyMembers`
        # @return [String]
        attr_accessor :who_can_modify_members
      
        # Deprecated. This is merged into the new whoCanAssistContent setting.
        # Permission to change tags and categories. Possible values are:
        # - ALL_MEMBERS
        # - OWNERS_AND_MANAGERS
        # - MANAGERS_ONLY
        # - OWNERS_ONLY
        # - NONE
        # Corresponds to the JSON property `whoCanModifyTagsAndCategories`
        # @return [String]
        attr_accessor :who_can_modify_tags_and_categories
      
        # Deprecated. This is merged into the new whoCanModerateContent setting.
        # Specifies who can move topics into the group or forum. Possible values are:
        # - ALL_MEMBERS
        # - OWNERS_AND_MANAGERS
        # - OWNERS_ONLY
        # - NONE
        # Corresponds to the JSON property `whoCanMoveTopicsIn`
        # @return [String]
        attr_accessor :who_can_move_topics_in
      
        # Deprecated. This is merged into the new whoCanModerateContent setting.
        # Specifies who can move topics out of the group or forum. Possible values are:
        # - ALL_MEMBERS
        # - OWNERS_AND_MANAGERS
        # - OWNERS_ONLY
        # - NONE
        # Corresponds to the JSON property `whoCanMoveTopicsOut`
        # @return [String]
        attr_accessor :who_can_move_topics_out
      
        # Deprecated. This is merged into the new whoCanModerateContent setting.
        # Specifies who can post announcements, a special topic type. Possible values
        # are:
        # - ALL_MEMBERS
        # - OWNERS_AND_MANAGERS
        # - OWNERS_ONLY
        # - NONE
        # Corresponds to the JSON property `whoCanPostAnnouncements`
        # @return [String]
        attr_accessor :who_can_post_announcements
      
        # Permissions to post messages. Possible values are:
        # - NONE_CAN_POST: The group is disabled and archived. No one can post a message
        # to this group.
        # - When archiveOnly is false, updating whoCanPostMessage to NONE_CAN_POST,
        # results in an error.
        # - If archiveOnly is reverted from true to false, whoCanPostMessages is set to
        # ALL_MANAGERS_CAN_POST.
        # - ALL_MANAGERS_CAN_POST: Managers, including group owners, can post messages.
        # - ALL_MEMBERS_CAN_POST: Any group member can post a message.
        # - ALL_OWNERS_CAN_POST: Only group owners can post a message.
        # - ALL_IN_DOMAIN_CAN_POST: Anyone in the account can post a message.
        # - ANYONE_CAN_POST: Any Internet user who outside your account can access your
        # Google Groups service and post a message. Note: When whoCanPostMessage is set
        # to ANYONE_CAN_POST, we recommend the messageModerationLevel be set to
        # MODERATE_NON_MEMBERS to protect the group from possible spam.
        # Corresponds to the JSON property `whoCanPostMessage`
        # @return [String]
        attr_accessor :who_can_post_message
      
        # Deprecated. This is merged into the new whoCanAssistContent setting.
        # Permission to take topics in a forum. Possible values are:
        # - ALL_MEMBERS
        # - OWNERS_AND_MANAGERS
        # - MANAGERS_ONLY
        # - OWNERS_ONLY
        # - NONE
        # Corresponds to the JSON property `whoCanTakeTopics`
        # @return [String]
        attr_accessor :who_can_take_topics
      
        # Deprecated. This is merged into the new whoCanAssistContent setting.
        # Permission to unassign any topic in a forum. Possible values are:
        # - ALL_MEMBERS
        # - OWNERS_AND_MANAGERS
        # - MANAGERS_ONLY
        # - OWNERS_ONLY
        # - NONE
        # Corresponds to the JSON property `whoCanUnassignTopic`
        # @return [String]
        attr_accessor :who_can_unassign_topic
      
        # Deprecated. This is merged into the new whoCanAssistContent setting.
        # Permission to unmark any post from a favorite reply. Possible values are:
        # - ALL_MEMBERS
        # - OWNERS_AND_MANAGERS
        # - MANAGERS_ONLY
        # - OWNERS_ONLY
        # - NONE
        # Corresponds to the JSON property `whoCanUnmarkFavoriteReplyOnAnyTopic`
        # @return [String]
        attr_accessor :who_can_unmark_favorite_reply_on_any_topic
      
        # Permissions to view group messages. Possible values are:
        # - ANYONE_CAN_VIEW: Any Internet user can view the group's messages.
        # - ALL_IN_DOMAIN_CAN_VIEW: Anyone in your account can view this group's
        # messages.
        # - ALL_MEMBERS_CAN_VIEW: All group members can view the group's messages.
        # - ALL_MANAGERS_CAN_VIEW: Any group manager can view this group's messages.
        # Corresponds to the JSON property `whoCanViewGroup`
        # @return [String]
        attr_accessor :who_can_view_group
      
        # Permissions to view membership. Possible values are:
        # - ALL_IN_DOMAIN_CAN_VIEW: Anyone in the account can view the group members
        # list.
        # If a group already has external members, those members can still send email to
        # this group.
        # 
        # - ALL_MEMBERS_CAN_VIEW: The group members can view the group members list.
        # - ALL_MANAGERS_CAN_VIEW: The group managers can view group members list.
        # Corresponds to the JSON property `whoCanViewMembership`
        # @return [String]
        attr_accessor :who_can_view_membership
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @allow_external_members = args[:allow_external_members] if args.key?(:allow_external_members)
          @allow_google_communication = args[:allow_google_communication] if args.key?(:allow_google_communication)
          @allow_web_posting = args[:allow_web_posting] if args.key?(:allow_web_posting)
          @archive_only = args[:archive_only] if args.key?(:archive_only)
          @custom_footer_text = args[:custom_footer_text] if args.key?(:custom_footer_text)
          @custom_reply_to = args[:custom_reply_to] if args.key?(:custom_reply_to)
          @custom_roles_enabled_for_settings_to_be_merged = args[:custom_roles_enabled_for_settings_to_be_merged] if args.key?(:custom_roles_enabled_for_settings_to_be_merged)
          @default_message_deny_notification_text = args[:default_message_deny_notification_text] if args.key?(:default_message_deny_notification_text)
          @description = args[:description] if args.key?(:description)
          @email = args[:email] if args.key?(:email)
          @enable_collaborative_inbox = args[:enable_collaborative_inbox] if args.key?(:enable_collaborative_inbox)
          @favorite_replies_on_top = args[:favorite_replies_on_top] if args.key?(:favorite_replies_on_top)
          @include_custom_footer = args[:include_custom_footer] if args.key?(:include_custom_footer)
          @include_in_global_address_list = args[:include_in_global_address_list] if args.key?(:include_in_global_address_list)
          @is_archived = args[:is_archived] if args.key?(:is_archived)
          @kind = args[:kind] if args.key?(:kind)
          @max_message_bytes = args[:max_message_bytes] if args.key?(:max_message_bytes)
          @members_can_post_as_the_group = args[:members_can_post_as_the_group] if args.key?(:members_can_post_as_the_group)
          @message_display_font = args[:message_display_font] if args.key?(:message_display_font)
          @message_moderation_level = args[:message_moderation_level] if args.key?(:message_moderation_level)
          @name = args[:name] if args.key?(:name)
          @primary_language = args[:primary_language] if args.key?(:primary_language)
          @reply_to = args[:reply_to] if args.key?(:reply_to)
          @send_message_deny_notification = args[:send_message_deny_notification] if args.key?(:send_message_deny_notification)
          @show_in_group_directory = args[:show_in_group_directory] if args.key?(:show_in_group_directory)
          @spam_moderation_level = args[:spam_moderation_level] if args.key?(:spam_moderation_level)
          @who_can_add = args[:who_can_add] if args.key?(:who_can_add)
          @who_can_add_references = args[:who_can_add_references] if args.key?(:who_can_add_references)
          @who_can_approve_members = args[:who_can_approve_members] if args.key?(:who_can_approve_members)
          @who_can_approve_messages = args[:who_can_approve_messages] if args.key?(:who_can_approve_messages)
          @who_can_assign_topics = args[:who_can_assign_topics] if args.key?(:who_can_assign_topics)
          @who_can_assist_content = args[:who_can_assist_content] if args.key?(:who_can_assist_content)
          @who_can_ban_users = args[:who_can_ban_users] if args.key?(:who_can_ban_users)
          @who_can_contact_owner = args[:who_can_contact_owner] if args.key?(:who_can_contact_owner)
          @who_can_delete_any_post = args[:who_can_delete_any_post] if args.key?(:who_can_delete_any_post)
          @who_can_delete_topics = args[:who_can_delete_topics] if args.key?(:who_can_delete_topics)
          @who_can_discover_group = args[:who_can_discover_group] if args.key?(:who_can_discover_group)
          @who_can_enter_free_form_tags = args[:who_can_enter_free_form_tags] if args.key?(:who_can_enter_free_form_tags)
          @who_can_hide_abuse = args[:who_can_hide_abuse] if args.key?(:who_can_hide_abuse)
          @who_can_invite = args[:who_can_invite] if args.key?(:who_can_invite)
          @who_can_join = args[:who_can_join] if args.key?(:who_can_join)
          @who_can_leave_group = args[:who_can_leave_group] if args.key?(:who_can_leave_group)
          @who_can_lock_topics = args[:who_can_lock_topics] if args.key?(:who_can_lock_topics)
          @who_can_make_topics_sticky = args[:who_can_make_topics_sticky] if args.key?(:who_can_make_topics_sticky)
          @who_can_mark_duplicate = args[:who_can_mark_duplicate] if args.key?(:who_can_mark_duplicate)
          @who_can_mark_favorite_reply_on_any_topic = args[:who_can_mark_favorite_reply_on_any_topic] if args.key?(:who_can_mark_favorite_reply_on_any_topic)
          @who_can_mark_favorite_reply_on_own_topic = args[:who_can_mark_favorite_reply_on_own_topic] if args.key?(:who_can_mark_favorite_reply_on_own_topic)
          @who_can_mark_no_response_needed = args[:who_can_mark_no_response_needed] if args.key?(:who_can_mark_no_response_needed)
          @who_can_moderate_content = args[:who_can_moderate_content] if args.key?(:who_can_moderate_content)
          @who_can_moderate_members = args[:who_can_moderate_members] if args.key?(:who_can_moderate_members)
          @who_can_modify_members = args[:who_can_modify_members] if args.key?(:who_can_modify_members)
          @who_can_modify_tags_and_categories = args[:who_can_modify_tags_and_categories] if args.key?(:who_can_modify_tags_and_categories)
          @who_can_move_topics_in = args[:who_can_move_topics_in] if args.key?(:who_can_move_topics_in)
          @who_can_move_topics_out = args[:who_can_move_topics_out] if args.key?(:who_can_move_topics_out)
          @who_can_post_announcements = args[:who_can_post_announcements] if args.key?(:who_can_post_announcements)
          @who_can_post_message = args[:who_can_post_message] if args.key?(:who_can_post_message)
          @who_can_take_topics = args[:who_can_take_topics] if args.key?(:who_can_take_topics)
          @who_can_unassign_topic = args[:who_can_unassign_topic] if args.key?(:who_can_unassign_topic)
          @who_can_unmark_favorite_reply_on_any_topic = args[:who_can_unmark_favorite_reply_on_any_topic] if args.key?(:who_can_unmark_favorite_reply_on_any_topic)
          @who_can_view_group = args[:who_can_view_group] if args.key?(:who_can_view_group)
          @who_can_view_membership = args[:who_can_view_membership] if args.key?(:who_can_view_membership)
        end
      end
    end
  end
end
