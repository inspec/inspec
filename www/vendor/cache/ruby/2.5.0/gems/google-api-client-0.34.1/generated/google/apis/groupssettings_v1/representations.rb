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
      
      class Groups
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Groups
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :allow_external_members, as: 'allowExternalMembers'
          property :allow_google_communication, as: 'allowGoogleCommunication'
          property :allow_web_posting, as: 'allowWebPosting'
          property :archive_only, as: 'archiveOnly'
          property :custom_footer_text, as: 'customFooterText'
          property :custom_reply_to, as: 'customReplyTo'
          property :custom_roles_enabled_for_settings_to_be_merged, as: 'customRolesEnabledForSettingsToBeMerged'
          property :default_message_deny_notification_text, as: 'defaultMessageDenyNotificationText'
          property :description, as: 'description'
          property :email, as: 'email'
          property :enable_collaborative_inbox, as: 'enableCollaborativeInbox'
          property :favorite_replies_on_top, as: 'favoriteRepliesOnTop'
          property :include_custom_footer, as: 'includeCustomFooter'
          property :include_in_global_address_list, as: 'includeInGlobalAddressList'
          property :is_archived, as: 'isArchived'
          property :kind, as: 'kind'
          property :max_message_bytes, as: 'maxMessageBytes'
          property :members_can_post_as_the_group, as: 'membersCanPostAsTheGroup'
          property :message_display_font, as: 'messageDisplayFont'
          property :message_moderation_level, as: 'messageModerationLevel'
          property :name, as: 'name'
          property :primary_language, as: 'primaryLanguage'
          property :reply_to, as: 'replyTo'
          property :send_message_deny_notification, as: 'sendMessageDenyNotification'
          property :show_in_group_directory, as: 'showInGroupDirectory'
          property :spam_moderation_level, as: 'spamModerationLevel'
          property :who_can_add, as: 'whoCanAdd'
          property :who_can_add_references, as: 'whoCanAddReferences'
          property :who_can_approve_members, as: 'whoCanApproveMembers'
          property :who_can_approve_messages, as: 'whoCanApproveMessages'
          property :who_can_assign_topics, as: 'whoCanAssignTopics'
          property :who_can_assist_content, as: 'whoCanAssistContent'
          property :who_can_ban_users, as: 'whoCanBanUsers'
          property :who_can_contact_owner, as: 'whoCanContactOwner'
          property :who_can_delete_any_post, as: 'whoCanDeleteAnyPost'
          property :who_can_delete_topics, as: 'whoCanDeleteTopics'
          property :who_can_discover_group, as: 'whoCanDiscoverGroup'
          property :who_can_enter_free_form_tags, as: 'whoCanEnterFreeFormTags'
          property :who_can_hide_abuse, as: 'whoCanHideAbuse'
          property :who_can_invite, as: 'whoCanInvite'
          property :who_can_join, as: 'whoCanJoin'
          property :who_can_leave_group, as: 'whoCanLeaveGroup'
          property :who_can_lock_topics, as: 'whoCanLockTopics'
          property :who_can_make_topics_sticky, as: 'whoCanMakeTopicsSticky'
          property :who_can_mark_duplicate, as: 'whoCanMarkDuplicate'
          property :who_can_mark_favorite_reply_on_any_topic, as: 'whoCanMarkFavoriteReplyOnAnyTopic'
          property :who_can_mark_favorite_reply_on_own_topic, as: 'whoCanMarkFavoriteReplyOnOwnTopic'
          property :who_can_mark_no_response_needed, as: 'whoCanMarkNoResponseNeeded'
          property :who_can_moderate_content, as: 'whoCanModerateContent'
          property :who_can_moderate_members, as: 'whoCanModerateMembers'
          property :who_can_modify_members, as: 'whoCanModifyMembers'
          property :who_can_modify_tags_and_categories, as: 'whoCanModifyTagsAndCategories'
          property :who_can_move_topics_in, as: 'whoCanMoveTopicsIn'
          property :who_can_move_topics_out, as: 'whoCanMoveTopicsOut'
          property :who_can_post_announcements, as: 'whoCanPostAnnouncements'
          property :who_can_post_message, as: 'whoCanPostMessage'
          property :who_can_take_topics, as: 'whoCanTakeTopics'
          property :who_can_unassign_topic, as: 'whoCanUnassignTopic'
          property :who_can_unmark_favorite_reply_on_any_topic, as: 'whoCanUnmarkFavoriteReplyOnAnyTopic'
          property :who_can_view_group, as: 'whoCanViewGroup'
          property :who_can_view_membership, as: 'whoCanViewMembership'
        end
      end
    end
  end
end
