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
      
      class AutoForwarding
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchDeleteMessagesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchModifyMessagesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Delegate
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Draft
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Filter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FilterAction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FilterCriteria
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ForwardingAddress
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class History
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HistoryLabelAdded
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HistoryLabelRemoved
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HistoryMessageAdded
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HistoryMessageDeleted
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ImapSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Label
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LabelColor
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LanguageSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListDelegatesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListDraftsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListFiltersResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListForwardingAddressesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListHistoryResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListLabelsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListMessagesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListSendAsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListSmimeInfoResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListThreadsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Message
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MessagePart
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MessagePartBody
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MessagePartHeader
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ModifyMessageRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ModifyThreadRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PopSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Profile
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SendAs
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SmimeInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SmtpMsa
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Thread
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VacationSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WatchRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WatchResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AutoForwarding
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :disposition, as: 'disposition'
          property :email_address, as: 'emailAddress'
          property :enabled, as: 'enabled'
        end
      end
      
      class BatchDeleteMessagesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :ids, as: 'ids'
        end
      end
      
      class BatchModifyMessagesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :add_label_ids, as: 'addLabelIds'
          collection :ids, as: 'ids'
          collection :remove_label_ids, as: 'removeLabelIds'
        end
      end
      
      class Delegate
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :delegate_email, as: 'delegateEmail'
          property :verification_status, as: 'verificationStatus'
        end
      end
      
      class Draft
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :message, as: 'message', class: Google::Apis::GmailV1::Message, decorator: Google::Apis::GmailV1::Message::Representation
      
        end
      end
      
      class Filter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action, as: 'action', class: Google::Apis::GmailV1::FilterAction, decorator: Google::Apis::GmailV1::FilterAction::Representation
      
          property :criteria, as: 'criteria', class: Google::Apis::GmailV1::FilterCriteria, decorator: Google::Apis::GmailV1::FilterCriteria::Representation
      
          property :id, as: 'id'
        end
      end
      
      class FilterAction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :add_label_ids, as: 'addLabelIds'
          property :forward, as: 'forward'
          collection :remove_label_ids, as: 'removeLabelIds'
        end
      end
      
      class FilterCriteria
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :exclude_chats, as: 'excludeChats'
          property :from, as: 'from'
          property :has_attachment, as: 'hasAttachment'
          property :negated_query, as: 'negatedQuery'
          property :query, as: 'query'
          property :size, as: 'size'
          property :size_comparison, as: 'sizeComparison'
          property :subject, as: 'subject'
          property :to, as: 'to'
        end
      end
      
      class ForwardingAddress
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :forwarding_email, as: 'forwardingEmail'
          property :verification_status, as: 'verificationStatus'
        end
      end
      
      class History
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, :numeric_string => true, as: 'id'
          collection :labels_added, as: 'labelsAdded', class: Google::Apis::GmailV1::HistoryLabelAdded, decorator: Google::Apis::GmailV1::HistoryLabelAdded::Representation
      
          collection :labels_removed, as: 'labelsRemoved', class: Google::Apis::GmailV1::HistoryLabelRemoved, decorator: Google::Apis::GmailV1::HistoryLabelRemoved::Representation
      
          collection :messages, as: 'messages', class: Google::Apis::GmailV1::Message, decorator: Google::Apis::GmailV1::Message::Representation
      
          collection :messages_added, as: 'messagesAdded', class: Google::Apis::GmailV1::HistoryMessageAdded, decorator: Google::Apis::GmailV1::HistoryMessageAdded::Representation
      
          collection :messages_deleted, as: 'messagesDeleted', class: Google::Apis::GmailV1::HistoryMessageDeleted, decorator: Google::Apis::GmailV1::HistoryMessageDeleted::Representation
      
        end
      end
      
      class HistoryLabelAdded
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :label_ids, as: 'labelIds'
          property :message, as: 'message', class: Google::Apis::GmailV1::Message, decorator: Google::Apis::GmailV1::Message::Representation
      
        end
      end
      
      class HistoryLabelRemoved
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :label_ids, as: 'labelIds'
          property :message, as: 'message', class: Google::Apis::GmailV1::Message, decorator: Google::Apis::GmailV1::Message::Representation
      
        end
      end
      
      class HistoryMessageAdded
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :message, as: 'message', class: Google::Apis::GmailV1::Message, decorator: Google::Apis::GmailV1::Message::Representation
      
        end
      end
      
      class HistoryMessageDeleted
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :message, as: 'message', class: Google::Apis::GmailV1::Message, decorator: Google::Apis::GmailV1::Message::Representation
      
        end
      end
      
      class ImapSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :auto_expunge, as: 'autoExpunge'
          property :enabled, as: 'enabled'
          property :expunge_behavior, as: 'expungeBehavior'
          property :max_folder_size, as: 'maxFolderSize'
        end
      end
      
      class Label
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :color, as: 'color', class: Google::Apis::GmailV1::LabelColor, decorator: Google::Apis::GmailV1::LabelColor::Representation
      
          property :id, as: 'id'
          property :label_list_visibility, as: 'labelListVisibility'
          property :message_list_visibility, as: 'messageListVisibility'
          property :messages_total, as: 'messagesTotal'
          property :messages_unread, as: 'messagesUnread'
          property :name, as: 'name'
          property :threads_total, as: 'threadsTotal'
          property :threads_unread, as: 'threadsUnread'
          property :type, as: 'type'
        end
      end
      
      class LabelColor
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :background_color, as: 'backgroundColor'
          property :text_color, as: 'textColor'
        end
      end
      
      class LanguageSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_language, as: 'displayLanguage'
        end
      end
      
      class ListDelegatesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :delegates, as: 'delegates', class: Google::Apis::GmailV1::Delegate, decorator: Google::Apis::GmailV1::Delegate::Representation
      
        end
      end
      
      class ListDraftsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :drafts, as: 'drafts', class: Google::Apis::GmailV1::Draft, decorator: Google::Apis::GmailV1::Draft::Representation
      
          property :next_page_token, as: 'nextPageToken'
          property :result_size_estimate, as: 'resultSizeEstimate'
        end
      end
      
      class ListFiltersResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :filter, as: 'filter', class: Google::Apis::GmailV1::Filter, decorator: Google::Apis::GmailV1::Filter::Representation
      
        end
      end
      
      class ListForwardingAddressesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :forwarding_addresses, as: 'forwardingAddresses', class: Google::Apis::GmailV1::ForwardingAddress, decorator: Google::Apis::GmailV1::ForwardingAddress::Representation
      
        end
      end
      
      class ListHistoryResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :history, as: 'history', class: Google::Apis::GmailV1::History, decorator: Google::Apis::GmailV1::History::Representation
      
          property :history_id, :numeric_string => true, as: 'historyId'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListLabelsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :labels, as: 'labels', class: Google::Apis::GmailV1::Label, decorator: Google::Apis::GmailV1::Label::Representation
      
        end
      end
      
      class ListMessagesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :messages, as: 'messages', class: Google::Apis::GmailV1::Message, decorator: Google::Apis::GmailV1::Message::Representation
      
          property :next_page_token, as: 'nextPageToken'
          property :result_size_estimate, as: 'resultSizeEstimate'
        end
      end
      
      class ListSendAsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :send_as, as: 'sendAs', class: Google::Apis::GmailV1::SendAs, decorator: Google::Apis::GmailV1::SendAs::Representation
      
        end
      end
      
      class ListSmimeInfoResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :smime_info, as: 'smimeInfo', class: Google::Apis::GmailV1::SmimeInfo, decorator: Google::Apis::GmailV1::SmimeInfo::Representation
      
        end
      end
      
      class ListThreadsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          property :result_size_estimate, as: 'resultSizeEstimate'
          collection :threads, as: 'threads', class: Google::Apis::GmailV1::Thread, decorator: Google::Apis::GmailV1::Thread::Representation
      
        end
      end
      
      class Message
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :history_id, :numeric_string => true, as: 'historyId'
          property :id, as: 'id'
          property :internal_date, :numeric_string => true, as: 'internalDate'
          collection :label_ids, as: 'labelIds'
          property :payload, as: 'payload', class: Google::Apis::GmailV1::MessagePart, decorator: Google::Apis::GmailV1::MessagePart::Representation
      
          property :raw, :base64 => true, as: 'raw'
          property :size_estimate, as: 'sizeEstimate'
          property :snippet, as: 'snippet'
          property :thread_id, as: 'threadId'
        end
      end
      
      class MessagePart
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :body, as: 'body', class: Google::Apis::GmailV1::MessagePartBody, decorator: Google::Apis::GmailV1::MessagePartBody::Representation
      
          property :filename, as: 'filename'
          collection :headers, as: 'headers', class: Google::Apis::GmailV1::MessagePartHeader, decorator: Google::Apis::GmailV1::MessagePartHeader::Representation
      
          property :mime_type, as: 'mimeType'
          property :part_id, as: 'partId'
          collection :parts, as: 'parts', class: Google::Apis::GmailV1::MessagePart, decorator: Google::Apis::GmailV1::MessagePart::Representation
      
        end
      end
      
      class MessagePartBody
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :attachment_id, as: 'attachmentId'
          property :data, :base64 => true, as: 'data'
          property :size, as: 'size'
        end
      end
      
      class MessagePartHeader
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :value, as: 'value'
        end
      end
      
      class ModifyMessageRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :add_label_ids, as: 'addLabelIds'
          collection :remove_label_ids, as: 'removeLabelIds'
        end
      end
      
      class ModifyThreadRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :add_label_ids, as: 'addLabelIds'
          collection :remove_label_ids, as: 'removeLabelIds'
        end
      end
      
      class PopSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :access_window, as: 'accessWindow'
          property :disposition, as: 'disposition'
        end
      end
      
      class Profile
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :email_address, as: 'emailAddress'
          property :history_id, :numeric_string => true, as: 'historyId'
          property :messages_total, as: 'messagesTotal'
          property :threads_total, as: 'threadsTotal'
        end
      end
      
      class SendAs
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_name, as: 'displayName'
          property :is_default, as: 'isDefault'
          property :is_primary, as: 'isPrimary'
          property :reply_to_address, as: 'replyToAddress'
          property :send_as_email, as: 'sendAsEmail'
          property :signature, as: 'signature'
          property :smtp_msa, as: 'smtpMsa', class: Google::Apis::GmailV1::SmtpMsa, decorator: Google::Apis::GmailV1::SmtpMsa::Representation
      
          property :treat_as_alias, as: 'treatAsAlias'
          property :verification_status, as: 'verificationStatus'
        end
      end
      
      class SmimeInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :encrypted_key_password, as: 'encryptedKeyPassword'
          property :expiration, :numeric_string => true, as: 'expiration'
          property :id, as: 'id'
          property :is_default, as: 'isDefault'
          property :issuer_cn, as: 'issuerCn'
          property :pem, as: 'pem'
          property :pkcs12, :base64 => true, as: 'pkcs12'
        end
      end
      
      class SmtpMsa
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :host, as: 'host'
          property :password, as: 'password'
          property :port, as: 'port'
          property :security_mode, as: 'securityMode'
          property :username, as: 'username'
        end
      end
      
      class Thread
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :history_id, :numeric_string => true, as: 'historyId'
          property :id, as: 'id'
          collection :messages, as: 'messages', class: Google::Apis::GmailV1::Message, decorator: Google::Apis::GmailV1::Message::Representation
      
          property :snippet, as: 'snippet'
        end
      end
      
      class VacationSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :enable_auto_reply, as: 'enableAutoReply'
          property :end_time, :numeric_string => true, as: 'endTime'
          property :response_body_html, as: 'responseBodyHtml'
          property :response_body_plain_text, as: 'responseBodyPlainText'
          property :response_subject, as: 'responseSubject'
          property :restrict_to_contacts, as: 'restrictToContacts'
          property :restrict_to_domain, as: 'restrictToDomain'
          property :start_time, :numeric_string => true, as: 'startTime'
        end
      end
      
      class WatchRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :label_filter_action, as: 'labelFilterAction'
          collection :label_ids, as: 'labelIds'
          property :topic_name, as: 'topicName'
        end
      end
      
      class WatchResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :expiration, :numeric_string => true, as: 'expiration'
          property :history_id, :numeric_string => true, as: 'historyId'
        end
      end
    end
  end
end
