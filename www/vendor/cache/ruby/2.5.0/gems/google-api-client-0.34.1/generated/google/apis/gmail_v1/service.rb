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

require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module GmailV1
      # Gmail API
      #
      # Access Gmail mailboxes including sending user email.
      #
      # @example
      #    require 'google/apis/gmail_v1'
      #
      #    Gmail = Google::Apis::GmailV1 # Alias the module
      #    service = Gmail::GmailService.new
      #
      # @see https://developers.google.com/gmail/api/
      class GmailService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  An opaque string that represents a user for quota purposes. Must not exceed 40
        #  characters.
        attr_accessor :quota_user

        # @return [String]
        #  Deprecated. Please use quotaUser instead.
        attr_accessor :user_ip

        def initialize
          super('https://www.googleapis.com/', 'gmail/v1/users/')
          @batch_path = 'batch/gmail/v1'
        end
        
        # Gets the current user's Gmail profile.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::Profile] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::Profile]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_user_profile(user_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{userId}/profile', options)
          command.response_representation = Google::Apis::GmailV1::Profile::Representation
          command.response_class = Google::Apis::GmailV1::Profile
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Stop receiving push notifications for the given user mailbox.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def stop_user(user_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{userId}/stop', options)
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Set up or update a push notification watch on the given user mailbox.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [Google::Apis::GmailV1::WatchRequest] watch_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::WatchResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::WatchResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def watch_user(user_id, watch_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{userId}/watch', options)
          command.request_representation = Google::Apis::GmailV1::WatchRequest::Representation
          command.request_object = watch_request_object
          command.response_representation = Google::Apis::GmailV1::WatchResponse::Representation
          command.response_class = Google::Apis::GmailV1::WatchResponse
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new draft with the DRAFT label.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [Google::Apis::GmailV1::Draft] draft_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [IO, String] upload_source
        #   IO stream or filename containing content to upload
        # @param [String] content_type
        #   Content type of the uploaded content.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::Draft] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::Draft]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_user_draft(user_id, draft_object = nil, fields: nil, quota_user: nil, user_ip: nil, upload_source: nil, content_type: nil, options: nil, &block)
          if upload_source.nil?
            command = make_simple_command(:post, '{userId}/drafts', options)
          else
            command = make_upload_command(:post, '{userId}/drafts', options)
            command.upload_source = upload_source
            command.upload_content_type = content_type
          end
          command.request_representation = Google::Apis::GmailV1::Draft::Representation
          command.request_object = draft_object
          command.response_representation = Google::Apis::GmailV1::Draft::Representation
          command.response_class = Google::Apis::GmailV1::Draft
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Immediately and permanently deletes the specified draft. Does not simply trash
        # it.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [String] id
        #   The ID of the draft to delete.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_user_draft(user_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, '{userId}/drafts/{id}', options)
          command.params['userId'] = user_id unless user_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the specified draft.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [String] id
        #   The ID of the draft to retrieve.
        # @param [String] format
        #   The format to return the draft in.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::Draft] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::Draft]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_user_draft(user_id, id, format: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{userId}/drafts/{id}', options)
          command.response_representation = Google::Apis::GmailV1::Draft::Representation
          command.response_class = Google::Apis::GmailV1::Draft
          command.params['userId'] = user_id unless user_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['format'] = format unless format.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the drafts in the user's mailbox.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [Boolean] include_spam_trash
        #   Include drafts from SPAM and TRASH in the results.
        # @param [Fixnum] max_results
        #   Maximum number of drafts to return.
        # @param [String] page_token
        #   Page token to retrieve a specific page of results in the list.
        # @param [String] q
        #   Only return draft messages matching the specified query. Supports the same
        #   query format as the Gmail search box. For example, "from:someuser@example.com
        #   rfc822msgid: is:unread".
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::ListDraftsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::ListDraftsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_user_drafts(user_id, include_spam_trash: nil, max_results: nil, page_token: nil, q: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{userId}/drafts', options)
          command.response_representation = Google::Apis::GmailV1::ListDraftsResponse::Representation
          command.response_class = Google::Apis::GmailV1::ListDraftsResponse
          command.params['userId'] = user_id unless user_id.nil?
          command.query['includeSpamTrash'] = include_spam_trash unless include_spam_trash.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['q'] = q unless q.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sends the specified, existing draft to the recipients in the To, Cc, and Bcc
        # headers.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [Google::Apis::GmailV1::Draft] draft_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [IO, String] upload_source
        #   IO stream or filename containing content to upload
        # @param [String] content_type
        #   Content type of the uploaded content.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::Message] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::Message]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def send_user_draft(user_id, draft_object = nil, fields: nil, quota_user: nil, user_ip: nil, upload_source: nil, content_type: nil, options: nil, &block)
          if upload_source.nil?
            command = make_simple_command(:post, '{userId}/drafts/send', options)
          else
            command = make_upload_command(:post, '{userId}/drafts/send', options)
            command.upload_source = upload_source
            command.upload_content_type = content_type
          end
          command.request_representation = Google::Apis::GmailV1::Draft::Representation
          command.request_object = draft_object
          command.response_representation = Google::Apis::GmailV1::Message::Representation
          command.response_class = Google::Apis::GmailV1::Message
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Replaces a draft's content.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [String] id
        #   The ID of the draft to update.
        # @param [Google::Apis::GmailV1::Draft] draft_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [IO, String] upload_source
        #   IO stream or filename containing content to upload
        # @param [String] content_type
        #   Content type of the uploaded content.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::Draft] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::Draft]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_user_draft(user_id, id, draft_object = nil, fields: nil, quota_user: nil, user_ip: nil, upload_source: nil, content_type: nil, options: nil, &block)
          if upload_source.nil?
            command = make_simple_command(:put, '{userId}/drafts/{id}', options)
          else
            command = make_upload_command(:put, '{userId}/drafts/{id}', options)
            command.upload_source = upload_source
            command.upload_content_type = content_type
          end
          command.request_representation = Google::Apis::GmailV1::Draft::Representation
          command.request_object = draft_object
          command.response_representation = Google::Apis::GmailV1::Draft::Representation
          command.response_class = Google::Apis::GmailV1::Draft
          command.params['userId'] = user_id unless user_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the history of all changes to the given mailbox. History results are
        # returned in chronological order (increasing historyId).
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [Array<String>, String] history_types
        #   History types to be returned by the function
        # @param [String] label_id
        #   Only return messages with a label matching the ID.
        # @param [Fixnum] max_results
        #   The maximum number of history records to return.
        # @param [String] page_token
        #   Page token to retrieve a specific page of results in the list.
        # @param [Fixnum] start_history_id
        #   Required. Returns history records after the specified startHistoryId. The
        #   supplied startHistoryId should be obtained from the historyId of a message,
        #   thread, or previous list response. History IDs increase chronologically but
        #   are not contiguous with random gaps in between valid IDs. Supplying an invalid
        #   or out of date startHistoryId typically returns an HTTP 404 error code. A
        #   historyId is typically valid for at least a week, but in some rare
        #   circumstances may be valid for only a few hours. If you receive an HTTP 404
        #   error response, your application should perform a full sync. If you receive no
        #   nextPageToken in the response, there are no updates to retrieve and you can
        #   store the returned historyId for a future request.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::ListHistoryResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::ListHistoryResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_user_histories(user_id, history_types: nil, label_id: nil, max_results: nil, page_token: nil, start_history_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{userId}/history', options)
          command.response_representation = Google::Apis::GmailV1::ListHistoryResponse::Representation
          command.response_class = Google::Apis::GmailV1::ListHistoryResponse
          command.params['userId'] = user_id unless user_id.nil?
          command.query['historyTypes'] = history_types unless history_types.nil?
          command.query['labelId'] = label_id unless label_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['startHistoryId'] = start_history_id unless start_history_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new label.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [Google::Apis::GmailV1::Label] label_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::Label] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::Label]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_user_label(user_id, label_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{userId}/labels', options)
          command.request_representation = Google::Apis::GmailV1::Label::Representation
          command.request_object = label_object
          command.response_representation = Google::Apis::GmailV1::Label::Representation
          command.response_class = Google::Apis::GmailV1::Label
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Immediately and permanently deletes the specified label and removes it from
        # any messages and threads that it is applied to.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [String] id
        #   The ID of the label to delete.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_user_label(user_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, '{userId}/labels/{id}', options)
          command.params['userId'] = user_id unless user_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the specified label.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [String] id
        #   The ID of the label to retrieve.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::Label] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::Label]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_user_label(user_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{userId}/labels/{id}', options)
          command.response_representation = Google::Apis::GmailV1::Label::Representation
          command.response_class = Google::Apis::GmailV1::Label
          command.params['userId'] = user_id unless user_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all labels in the user's mailbox.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::ListLabelsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::ListLabelsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_user_labels(user_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{userId}/labels', options)
          command.response_representation = Google::Apis::GmailV1::ListLabelsResponse::Representation
          command.response_class = Google::Apis::GmailV1::ListLabelsResponse
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the specified label. This method supports patch semantics.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [String] id
        #   The ID of the label to update.
        # @param [Google::Apis::GmailV1::Label] label_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::Label] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::Label]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_user_label(user_id, id, label_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, '{userId}/labels/{id}', options)
          command.request_representation = Google::Apis::GmailV1::Label::Representation
          command.request_object = label_object
          command.response_representation = Google::Apis::GmailV1::Label::Representation
          command.response_class = Google::Apis::GmailV1::Label
          command.params['userId'] = user_id unless user_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the specified label.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [String] id
        #   The ID of the label to update.
        # @param [Google::Apis::GmailV1::Label] label_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::Label] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::Label]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_user_label(user_id, id, label_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, '{userId}/labels/{id}', options)
          command.request_representation = Google::Apis::GmailV1::Label::Representation
          command.request_object = label_object
          command.response_representation = Google::Apis::GmailV1::Label::Representation
          command.response_class = Google::Apis::GmailV1::Label
          command.params['userId'] = user_id unless user_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes many messages by message ID. Provides no guarantees that messages were
        # not already deleted or even existed at all.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [Google::Apis::GmailV1::BatchDeleteMessagesRequest] batch_delete_messages_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_delete_messages(user_id, batch_delete_messages_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{userId}/messages/batchDelete', options)
          command.request_representation = Google::Apis::GmailV1::BatchDeleteMessagesRequest::Representation
          command.request_object = batch_delete_messages_request_object
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Modifies the labels on the specified messages.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [Google::Apis::GmailV1::BatchModifyMessagesRequest] batch_modify_messages_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_modify_messages(user_id, batch_modify_messages_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{userId}/messages/batchModify', options)
          command.request_representation = Google::Apis::GmailV1::BatchModifyMessagesRequest::Representation
          command.request_object = batch_modify_messages_request_object
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Immediately and permanently deletes the specified message. This operation
        # cannot be undone. Prefer messages.trash instead.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [String] id
        #   The ID of the message to delete.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_user_message(user_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, '{userId}/messages/{id}', options)
          command.params['userId'] = user_id unless user_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the specified message.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [String] id
        #   The ID of the message to retrieve.
        # @param [String] format
        #   The format to return the message in.
        # @param [Array<String>, String] metadata_headers
        #   When given and format is METADATA, only include headers specified.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::Message] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::Message]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_user_message(user_id, id, format: nil, metadata_headers: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{userId}/messages/{id}', options)
          command.response_representation = Google::Apis::GmailV1::Message::Representation
          command.response_class = Google::Apis::GmailV1::Message
          command.params['userId'] = user_id unless user_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['format'] = format unless format.nil?
          command.query['metadataHeaders'] = metadata_headers unless metadata_headers.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Imports a message into only this user's mailbox, with standard email delivery
        # scanning and classification similar to receiving via SMTP. Does not send a
        # message.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [Google::Apis::GmailV1::Message] message_object
        # @param [Boolean] deleted
        #   Mark the email as permanently deleted (not TRASH) and only visible in Google
        #   Vault to a Vault administrator. Only used for G Suite accounts.
        # @param [String] internal_date_source
        #   Source for Gmail's internal date of the message.
        # @param [Boolean] never_mark_spam
        #   Ignore the Gmail spam classifier decision and never mark this email as SPAM in
        #   the mailbox.
        # @param [Boolean] process_for_calendar
        #   Process calendar invites in the email and add any extracted meetings to the
        #   Google Calendar for this user.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [IO, String] upload_source
        #   IO stream or filename containing content to upload
        # @param [String] content_type
        #   Content type of the uploaded content.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::Message] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::Message]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def import_user_message(user_id, message_object = nil, deleted: nil, internal_date_source: nil, never_mark_spam: nil, process_for_calendar: nil, fields: nil, quota_user: nil, user_ip: nil, upload_source: nil, content_type: nil, options: nil, &block)
          if upload_source.nil?
            command = make_simple_command(:post, '{userId}/messages/import', options)
          else
            command = make_upload_command(:post, '{userId}/messages/import', options)
            command.upload_source = upload_source
            command.upload_content_type = content_type
          end
          command.request_representation = Google::Apis::GmailV1::Message::Representation
          command.request_object = message_object
          command.response_representation = Google::Apis::GmailV1::Message::Representation
          command.response_class = Google::Apis::GmailV1::Message
          command.params['userId'] = user_id unless user_id.nil?
          command.query['deleted'] = deleted unless deleted.nil?
          command.query['internalDateSource'] = internal_date_source unless internal_date_source.nil?
          command.query['neverMarkSpam'] = never_mark_spam unless never_mark_spam.nil?
          command.query['processForCalendar'] = process_for_calendar unless process_for_calendar.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Directly inserts a message into only this user's mailbox similar to IMAP
        # APPEND, bypassing most scanning and classification. Does not send a message.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [Google::Apis::GmailV1::Message] message_object
        # @param [Boolean] deleted
        #   Mark the email as permanently deleted (not TRASH) and only visible in Google
        #   Vault to a Vault administrator. Only used for G Suite accounts.
        # @param [String] internal_date_source
        #   Source for Gmail's internal date of the message.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [IO, String] upload_source
        #   IO stream or filename containing content to upload
        # @param [String] content_type
        #   Content type of the uploaded content.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::Message] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::Message]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_user_message(user_id, message_object = nil, deleted: nil, internal_date_source: nil, fields: nil, quota_user: nil, user_ip: nil, upload_source: nil, content_type: nil, options: nil, &block)
          if upload_source.nil?
            command = make_simple_command(:post, '{userId}/messages', options)
          else
            command = make_upload_command(:post, '{userId}/messages', options)
            command.upload_source = upload_source
            command.upload_content_type = content_type
          end
          command.request_representation = Google::Apis::GmailV1::Message::Representation
          command.request_object = message_object
          command.response_representation = Google::Apis::GmailV1::Message::Representation
          command.response_class = Google::Apis::GmailV1::Message
          command.params['userId'] = user_id unless user_id.nil?
          command.query['deleted'] = deleted unless deleted.nil?
          command.query['internalDateSource'] = internal_date_source unless internal_date_source.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the messages in the user's mailbox.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [Boolean] include_spam_trash
        #   Include messages from SPAM and TRASH in the results.
        # @param [Array<String>, String] label_ids
        #   Only return messages with labels that match all of the specified label IDs.
        # @param [Fixnum] max_results
        #   Maximum number of messages to return.
        # @param [String] page_token
        #   Page token to retrieve a specific page of results in the list.
        # @param [String] q
        #   Only return messages matching the specified query. Supports the same query
        #   format as the Gmail search box. For example, "from:someuser@example.com
        #   rfc822msgid:<somemsgid@example.com> is:unread". Parameter cannot be used when
        #   accessing the api using the gmail.metadata scope.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::ListMessagesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::ListMessagesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_user_messages(user_id, include_spam_trash: nil, label_ids: nil, max_results: nil, page_token: nil, q: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{userId}/messages', options)
          command.response_representation = Google::Apis::GmailV1::ListMessagesResponse::Representation
          command.response_class = Google::Apis::GmailV1::ListMessagesResponse
          command.params['userId'] = user_id unless user_id.nil?
          command.query['includeSpamTrash'] = include_spam_trash unless include_spam_trash.nil?
          command.query['labelIds'] = label_ids unless label_ids.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['q'] = q unless q.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Modifies the labels on the specified message.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [String] id
        #   The ID of the message to modify.
        # @param [Google::Apis::GmailV1::ModifyMessageRequest] modify_message_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::Message] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::Message]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def modify_message(user_id, id, modify_message_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{userId}/messages/{id}/modify', options)
          command.request_representation = Google::Apis::GmailV1::ModifyMessageRequest::Representation
          command.request_object = modify_message_request_object
          command.response_representation = Google::Apis::GmailV1::Message::Representation
          command.response_class = Google::Apis::GmailV1::Message
          command.params['userId'] = user_id unless user_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sends the specified message to the recipients in the To, Cc, and Bcc headers.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [Google::Apis::GmailV1::Message] message_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [IO, String] upload_source
        #   IO stream or filename containing content to upload
        # @param [String] content_type
        #   Content type of the uploaded content.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::Message] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::Message]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def send_user_message(user_id, message_object = nil, fields: nil, quota_user: nil, user_ip: nil, upload_source: nil, content_type: nil, options: nil, &block)
          if upload_source.nil?
            command = make_simple_command(:post, '{userId}/messages/send', options)
          else
            command = make_upload_command(:post, '{userId}/messages/send', options)
            command.upload_source = upload_source
            command.upload_content_type = content_type
          end
          command.request_representation = Google::Apis::GmailV1::Message::Representation
          command.request_object = message_object
          command.response_representation = Google::Apis::GmailV1::Message::Representation
          command.response_class = Google::Apis::GmailV1::Message
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Moves the specified message to the trash.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [String] id
        #   The ID of the message to Trash.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::Message] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::Message]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def trash_user_message(user_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{userId}/messages/{id}/trash', options)
          command.response_representation = Google::Apis::GmailV1::Message::Representation
          command.response_class = Google::Apis::GmailV1::Message
          command.params['userId'] = user_id unless user_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Removes the specified message from the trash.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [String] id
        #   The ID of the message to remove from Trash.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::Message] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::Message]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def untrash_user_message(user_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{userId}/messages/{id}/untrash', options)
          command.response_representation = Google::Apis::GmailV1::Message::Representation
          command.response_class = Google::Apis::GmailV1::Message
          command.params['userId'] = user_id unless user_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the specified message attachment.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [String] message_id
        #   The ID of the message containing the attachment.
        # @param [String] id
        #   The ID of the attachment.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::MessagePartBody] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::MessagePartBody]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_user_message_attachment(user_id, message_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{userId}/messages/{messageId}/attachments/{id}', options)
          command.response_representation = Google::Apis::GmailV1::MessagePartBody::Representation
          command.response_class = Google::Apis::GmailV1::MessagePartBody
          command.params['userId'] = user_id unless user_id.nil?
          command.params['messageId'] = message_id unless message_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the auto-forwarding setting for the specified account.
        # @param [String] user_id
        #   User's email address. The special value "me" can be used to indicate the
        #   authenticated user.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::AutoForwarding] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::AutoForwarding]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_user_setting_auto_forwarding(user_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{userId}/settings/autoForwarding', options)
          command.response_representation = Google::Apis::GmailV1::AutoForwarding::Representation
          command.response_class = Google::Apis::GmailV1::AutoForwarding
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets IMAP settings.
        # @param [String] user_id
        #   User's email address. The special value "me" can be used to indicate the
        #   authenticated user.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::ImapSettings] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::ImapSettings]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_user_setting_imap(user_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{userId}/settings/imap', options)
          command.response_representation = Google::Apis::GmailV1::ImapSettings::Representation
          command.response_class = Google::Apis::GmailV1::ImapSettings
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets language settings.
        # @param [String] user_id
        #   User's email address. The special value "me" can be used to indicate the
        #   authenticated user.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::LanguageSettings] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::LanguageSettings]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_user_setting_language(user_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{userId}/settings/language', options)
          command.response_representation = Google::Apis::GmailV1::LanguageSettings::Representation
          command.response_class = Google::Apis::GmailV1::LanguageSettings
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets POP settings.
        # @param [String] user_id
        #   User's email address. The special value "me" can be used to indicate the
        #   authenticated user.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::PopSettings] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::PopSettings]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_user_setting_pop(user_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{userId}/settings/pop', options)
          command.response_representation = Google::Apis::GmailV1::PopSettings::Representation
          command.response_class = Google::Apis::GmailV1::PopSettings
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets vacation responder settings.
        # @param [String] user_id
        #   User's email address. The special value "me" can be used to indicate the
        #   authenticated user.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::VacationSettings] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::VacationSettings]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_user_setting_vacation(user_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{userId}/settings/vacation', options)
          command.response_representation = Google::Apis::GmailV1::VacationSettings::Representation
          command.response_class = Google::Apis::GmailV1::VacationSettings
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the auto-forwarding setting for the specified account. A verified
        # forwarding address must be specified when auto-forwarding is enabled.
        # This method is only available to service account clients that have been
        # delegated domain-wide authority.
        # @param [String] user_id
        #   User's email address. The special value "me" can be used to indicate the
        #   authenticated user.
        # @param [Google::Apis::GmailV1::AutoForwarding] auto_forwarding_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::AutoForwarding] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::AutoForwarding]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_user_setting_auto_forwarding(user_id, auto_forwarding_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, '{userId}/settings/autoForwarding', options)
          command.request_representation = Google::Apis::GmailV1::AutoForwarding::Representation
          command.request_object = auto_forwarding_object
          command.response_representation = Google::Apis::GmailV1::AutoForwarding::Representation
          command.response_class = Google::Apis::GmailV1::AutoForwarding
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates IMAP settings.
        # @param [String] user_id
        #   User's email address. The special value "me" can be used to indicate the
        #   authenticated user.
        # @param [Google::Apis::GmailV1::ImapSettings] imap_settings_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::ImapSettings] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::ImapSettings]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_user_setting_imap(user_id, imap_settings_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, '{userId}/settings/imap', options)
          command.request_representation = Google::Apis::GmailV1::ImapSettings::Representation
          command.request_object = imap_settings_object
          command.response_representation = Google::Apis::GmailV1::ImapSettings::Representation
          command.response_class = Google::Apis::GmailV1::ImapSettings
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates language settings.
        # If successful, the return object contains the displayLanguage that was saved
        # for the user, which may differ from the value passed into the request. This is
        # because the requested displayLanguage may not be directly supported by Gmail
        # but have a close variant that is, and so the variant may be chosen and saved
        # instead.
        # @param [String] user_id
        #   User's email address. The special value "me" can be used to indicate the
        #   authenticated user.
        # @param [Google::Apis::GmailV1::LanguageSettings] language_settings_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::LanguageSettings] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::LanguageSettings]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_user_setting_language(user_id, language_settings_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, '{userId}/settings/language', options)
          command.request_representation = Google::Apis::GmailV1::LanguageSettings::Representation
          command.request_object = language_settings_object
          command.response_representation = Google::Apis::GmailV1::LanguageSettings::Representation
          command.response_class = Google::Apis::GmailV1::LanguageSettings
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates POP settings.
        # @param [String] user_id
        #   User's email address. The special value "me" can be used to indicate the
        #   authenticated user.
        # @param [Google::Apis::GmailV1::PopSettings] pop_settings_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::PopSettings] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::PopSettings]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_user_setting_pop(user_id, pop_settings_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, '{userId}/settings/pop', options)
          command.request_representation = Google::Apis::GmailV1::PopSettings::Representation
          command.request_object = pop_settings_object
          command.response_representation = Google::Apis::GmailV1::PopSettings::Representation
          command.response_class = Google::Apis::GmailV1::PopSettings
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates vacation responder settings.
        # @param [String] user_id
        #   User's email address. The special value "me" can be used to indicate the
        #   authenticated user.
        # @param [Google::Apis::GmailV1::VacationSettings] vacation_settings_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::VacationSettings] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::VacationSettings]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_user_setting_vacation(user_id, vacation_settings_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, '{userId}/settings/vacation', options)
          command.request_representation = Google::Apis::GmailV1::VacationSettings::Representation
          command.request_object = vacation_settings_object
          command.response_representation = Google::Apis::GmailV1::VacationSettings::Representation
          command.response_class = Google::Apis::GmailV1::VacationSettings
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Adds a delegate with its verification status set directly to accepted, without
        # sending any verification email. The delegate user must be a member of the same
        # G Suite organization as the delegator user.
        # Gmail imposes limtations on the number of delegates and delegators each user
        # in a G Suite organization can have. These limits depend on your organization,
        # but in general each user can have up to 25 delegates and up to 10 delegators.
        # Note that a delegate user must be referred to by their primary email address,
        # and not an email alias.
        # Also note that when a new delegate is created, there may be up to a one minute
        # delay before the new delegate is available for use.
        # This method is only available to service account clients that have been
        # delegated domain-wide authority.
        # @param [String] user_id
        #   User's email address. The special value "me" can be used to indicate the
        #   authenticated user.
        # @param [Google::Apis::GmailV1::Delegate] delegate_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::Delegate] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::Delegate]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_user_setting_delegate(user_id, delegate_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{userId}/settings/delegates', options)
          command.request_representation = Google::Apis::GmailV1::Delegate::Representation
          command.request_object = delegate_object
          command.response_representation = Google::Apis::GmailV1::Delegate::Representation
          command.response_class = Google::Apis::GmailV1::Delegate
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Removes the specified delegate (which can be of any verification status), and
        # revokes any verification that may have been required for using it.
        # Note that a delegate user must be referred to by their primary email address,
        # and not an email alias.
        # This method is only available to service account clients that have been
        # delegated domain-wide authority.
        # @param [String] user_id
        #   User's email address. The special value "me" can be used to indicate the
        #   authenticated user.
        # @param [String] delegate_email
        #   The email address of the user to be removed as a delegate.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_user_setting_delegate(user_id, delegate_email, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, '{userId}/settings/delegates/{delegateEmail}', options)
          command.params['userId'] = user_id unless user_id.nil?
          command.params['delegateEmail'] = delegate_email unless delegate_email.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the specified delegate.
        # Note that a delegate user must be referred to by their primary email address,
        # and not an email alias.
        # This method is only available to service account clients that have been
        # delegated domain-wide authority.
        # @param [String] user_id
        #   User's email address. The special value "me" can be used to indicate the
        #   authenticated user.
        # @param [String] delegate_email
        #   The email address of the user whose delegate relationship is to be retrieved.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::Delegate] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::Delegate]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_user_setting_delegate(user_id, delegate_email, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{userId}/settings/delegates/{delegateEmail}', options)
          command.response_representation = Google::Apis::GmailV1::Delegate::Representation
          command.response_class = Google::Apis::GmailV1::Delegate
          command.params['userId'] = user_id unless user_id.nil?
          command.params['delegateEmail'] = delegate_email unless delegate_email.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the delegates for the specified account.
        # This method is only available to service account clients that have been
        # delegated domain-wide authority.
        # @param [String] user_id
        #   User's email address. The special value "me" can be used to indicate the
        #   authenticated user.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::ListDelegatesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::ListDelegatesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_user_setting_delegates(user_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{userId}/settings/delegates', options)
          command.response_representation = Google::Apis::GmailV1::ListDelegatesResponse::Representation
          command.response_class = Google::Apis::GmailV1::ListDelegatesResponse
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a filter.
        # @param [String] user_id
        #   User's email address. The special value "me" can be used to indicate the
        #   authenticated user.
        # @param [Google::Apis::GmailV1::Filter] filter_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::Filter] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::Filter]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_user_setting_filter(user_id, filter_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{userId}/settings/filters', options)
          command.request_representation = Google::Apis::GmailV1::Filter::Representation
          command.request_object = filter_object
          command.response_representation = Google::Apis::GmailV1::Filter::Representation
          command.response_class = Google::Apis::GmailV1::Filter
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a filter.
        # @param [String] user_id
        #   User's email address. The special value "me" can be used to indicate the
        #   authenticated user.
        # @param [String] id
        #   The ID of the filter to be deleted.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_user_setting_filter(user_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, '{userId}/settings/filters/{id}', options)
          command.params['userId'] = user_id unless user_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a filter.
        # @param [String] user_id
        #   User's email address. The special value "me" can be used to indicate the
        #   authenticated user.
        # @param [String] id
        #   The ID of the filter to be fetched.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::Filter] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::Filter]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_user_setting_filter(user_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{userId}/settings/filters/{id}', options)
          command.response_representation = Google::Apis::GmailV1::Filter::Representation
          command.response_class = Google::Apis::GmailV1::Filter
          command.params['userId'] = user_id unless user_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the message filters of a Gmail user.
        # @param [String] user_id
        #   User's email address. The special value "me" can be used to indicate the
        #   authenticated user.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::ListFiltersResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::ListFiltersResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_user_setting_filters(user_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{userId}/settings/filters', options)
          command.response_representation = Google::Apis::GmailV1::ListFiltersResponse::Representation
          command.response_class = Google::Apis::GmailV1::ListFiltersResponse
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a forwarding address. If ownership verification is required, a message
        # will be sent to the recipient and the resource's verification status will be
        # set to pending; otherwise, the resource will be created with verification
        # status set to accepted.
        # This method is only available to service account clients that have been
        # delegated domain-wide authority.
        # @param [String] user_id
        #   User's email address. The special value "me" can be used to indicate the
        #   authenticated user.
        # @param [Google::Apis::GmailV1::ForwardingAddress] forwarding_address_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::ForwardingAddress] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::ForwardingAddress]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_user_setting_forwarding_address(user_id, forwarding_address_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{userId}/settings/forwardingAddresses', options)
          command.request_representation = Google::Apis::GmailV1::ForwardingAddress::Representation
          command.request_object = forwarding_address_object
          command.response_representation = Google::Apis::GmailV1::ForwardingAddress::Representation
          command.response_class = Google::Apis::GmailV1::ForwardingAddress
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the specified forwarding address and revokes any verification that may
        # have been required.
        # This method is only available to service account clients that have been
        # delegated domain-wide authority.
        # @param [String] user_id
        #   User's email address. The special value "me" can be used to indicate the
        #   authenticated user.
        # @param [String] forwarding_email
        #   The forwarding address to be deleted.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_user_setting_forwarding_address(user_id, forwarding_email, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, '{userId}/settings/forwardingAddresses/{forwardingEmail}', options)
          command.params['userId'] = user_id unless user_id.nil?
          command.params['forwardingEmail'] = forwarding_email unless forwarding_email.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the specified forwarding address.
        # @param [String] user_id
        #   User's email address. The special value "me" can be used to indicate the
        #   authenticated user.
        # @param [String] forwarding_email
        #   The forwarding address to be retrieved.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::ForwardingAddress] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::ForwardingAddress]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_user_setting_forwarding_address(user_id, forwarding_email, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{userId}/settings/forwardingAddresses/{forwardingEmail}', options)
          command.response_representation = Google::Apis::GmailV1::ForwardingAddress::Representation
          command.response_class = Google::Apis::GmailV1::ForwardingAddress
          command.params['userId'] = user_id unless user_id.nil?
          command.params['forwardingEmail'] = forwarding_email unless forwarding_email.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the forwarding addresses for the specified account.
        # @param [String] user_id
        #   User's email address. The special value "me" can be used to indicate the
        #   authenticated user.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::ListForwardingAddressesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::ListForwardingAddressesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_user_setting_forwarding_addresses(user_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{userId}/settings/forwardingAddresses', options)
          command.response_representation = Google::Apis::GmailV1::ListForwardingAddressesResponse::Representation
          command.response_class = Google::Apis::GmailV1::ListForwardingAddressesResponse
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a custom "from" send-as alias. If an SMTP MSA is specified, Gmail will
        # attempt to connect to the SMTP service to validate the configuration before
        # creating the alias. If ownership verification is required for the alias, a
        # message will be sent to the email address and the resource's verification
        # status will be set to pending; otherwise, the resource will be created with
        # verification status set to accepted. If a signature is provided, Gmail will
        # sanitize the HTML before saving it with the alias.
        # This method is only available to service account clients that have been
        # delegated domain-wide authority.
        # @param [String] user_id
        #   User's email address. The special value "me" can be used to indicate the
        #   authenticated user.
        # @param [Google::Apis::GmailV1::SendAs] send_as_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::SendAs] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::SendAs]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_user_setting_send_as(user_id, send_as_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{userId}/settings/sendAs', options)
          command.request_representation = Google::Apis::GmailV1::SendAs::Representation
          command.request_object = send_as_object
          command.response_representation = Google::Apis::GmailV1::SendAs::Representation
          command.response_class = Google::Apis::GmailV1::SendAs
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the specified send-as alias. Revokes any verification that may have
        # been required for using it.
        # This method is only available to service account clients that have been
        # delegated domain-wide authority.
        # @param [String] user_id
        #   User's email address. The special value "me" can be used to indicate the
        #   authenticated user.
        # @param [String] send_as_email
        #   The send-as alias to be deleted.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_user_setting_send_as(user_id, send_as_email, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, '{userId}/settings/sendAs/{sendAsEmail}', options)
          command.params['userId'] = user_id unless user_id.nil?
          command.params['sendAsEmail'] = send_as_email unless send_as_email.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the specified send-as alias. Fails with an HTTP 404 error if the
        # specified address is not a member of the collection.
        # @param [String] user_id
        #   User's email address. The special value "me" can be used to indicate the
        #   authenticated user.
        # @param [String] send_as_email
        #   The send-as alias to be retrieved.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::SendAs] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::SendAs]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_user_setting_send_as(user_id, send_as_email, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{userId}/settings/sendAs/{sendAsEmail}', options)
          command.response_representation = Google::Apis::GmailV1::SendAs::Representation
          command.response_class = Google::Apis::GmailV1::SendAs
          command.params['userId'] = user_id unless user_id.nil?
          command.params['sendAsEmail'] = send_as_email unless send_as_email.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the send-as aliases for the specified account. The result includes the
        # primary send-as address associated with the account as well as any custom "
        # from" aliases.
        # @param [String] user_id
        #   User's email address. The special value "me" can be used to indicate the
        #   authenticated user.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::ListSendAsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::ListSendAsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_user_setting_send_as(user_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{userId}/settings/sendAs', options)
          command.response_representation = Google::Apis::GmailV1::ListSendAsResponse::Representation
          command.response_class = Google::Apis::GmailV1::ListSendAsResponse
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a send-as alias. If a signature is provided, Gmail will sanitize the
        # HTML before saving it with the alias.
        # Addresses other than the primary address for the account can only be updated
        # by service account clients that have been delegated domain-wide authority.
        # This method supports patch semantics.
        # @param [String] user_id
        #   User's email address. The special value "me" can be used to indicate the
        #   authenticated user.
        # @param [String] send_as_email
        #   The send-as alias to be updated.
        # @param [Google::Apis::GmailV1::SendAs] send_as_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::SendAs] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::SendAs]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_user_setting_send_as(user_id, send_as_email, send_as_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, '{userId}/settings/sendAs/{sendAsEmail}', options)
          command.request_representation = Google::Apis::GmailV1::SendAs::Representation
          command.request_object = send_as_object
          command.response_representation = Google::Apis::GmailV1::SendAs::Representation
          command.response_class = Google::Apis::GmailV1::SendAs
          command.params['userId'] = user_id unless user_id.nil?
          command.params['sendAsEmail'] = send_as_email unless send_as_email.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a send-as alias. If a signature is provided, Gmail will sanitize the
        # HTML before saving it with the alias.
        # Addresses other than the primary address for the account can only be updated
        # by service account clients that have been delegated domain-wide authority.
        # @param [String] user_id
        #   User's email address. The special value "me" can be used to indicate the
        #   authenticated user.
        # @param [String] send_as_email
        #   The send-as alias to be updated.
        # @param [Google::Apis::GmailV1::SendAs] send_as_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::SendAs] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::SendAs]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_user_setting_send_as(user_id, send_as_email, send_as_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, '{userId}/settings/sendAs/{sendAsEmail}', options)
          command.request_representation = Google::Apis::GmailV1::SendAs::Representation
          command.request_object = send_as_object
          command.response_representation = Google::Apis::GmailV1::SendAs::Representation
          command.response_class = Google::Apis::GmailV1::SendAs
          command.params['userId'] = user_id unless user_id.nil?
          command.params['sendAsEmail'] = send_as_email unless send_as_email.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sends a verification email to the specified send-as alias address. The
        # verification status must be pending.
        # This method is only available to service account clients that have been
        # delegated domain-wide authority.
        # @param [String] user_id
        #   User's email address. The special value "me" can be used to indicate the
        #   authenticated user.
        # @param [String] send_as_email
        #   The send-as alias to be verified.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def verify_user_setting_send_as(user_id, send_as_email, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{userId}/settings/sendAs/{sendAsEmail}/verify', options)
          command.params['userId'] = user_id unless user_id.nil?
          command.params['sendAsEmail'] = send_as_email unless send_as_email.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the specified S/MIME config for the specified send-as alias.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [String] send_as_email
        #   The email address that appears in the "From:" header for mail sent using this
        #   alias.
        # @param [String] id
        #   The immutable ID for the SmimeInfo.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_user_setting_send_a_smime_info(user_id, send_as_email, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, '{userId}/settings/sendAs/{sendAsEmail}/smimeInfo/{id}', options)
          command.params['userId'] = user_id unless user_id.nil?
          command.params['sendAsEmail'] = send_as_email unless send_as_email.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the specified S/MIME config for the specified send-as alias.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [String] send_as_email
        #   The email address that appears in the "From:" header for mail sent using this
        #   alias.
        # @param [String] id
        #   The immutable ID for the SmimeInfo.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::SmimeInfo] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::SmimeInfo]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_user_setting_send_a_smime_info(user_id, send_as_email, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{userId}/settings/sendAs/{sendAsEmail}/smimeInfo/{id}', options)
          command.response_representation = Google::Apis::GmailV1::SmimeInfo::Representation
          command.response_class = Google::Apis::GmailV1::SmimeInfo
          command.params['userId'] = user_id unless user_id.nil?
          command.params['sendAsEmail'] = send_as_email unless send_as_email.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Insert (upload) the given S/MIME config for the specified send-as alias. Note
        # that pkcs12 format is required for the key.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [String] send_as_email
        #   The email address that appears in the "From:" header for mail sent using this
        #   alias.
        # @param [Google::Apis::GmailV1::SmimeInfo] smime_info_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::SmimeInfo] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::SmimeInfo]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_user_setting_send_a_smime_info(user_id, send_as_email, smime_info_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{userId}/settings/sendAs/{sendAsEmail}/smimeInfo', options)
          command.request_representation = Google::Apis::GmailV1::SmimeInfo::Representation
          command.request_object = smime_info_object
          command.response_representation = Google::Apis::GmailV1::SmimeInfo::Representation
          command.response_class = Google::Apis::GmailV1::SmimeInfo
          command.params['userId'] = user_id unless user_id.nil?
          command.params['sendAsEmail'] = send_as_email unless send_as_email.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists S/MIME configs for the specified send-as alias.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [String] send_as_email
        #   The email address that appears in the "From:" header for mail sent using this
        #   alias.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::ListSmimeInfoResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::ListSmimeInfoResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_user_setting_send_a_smime_infos(user_id, send_as_email, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{userId}/settings/sendAs/{sendAsEmail}/smimeInfo', options)
          command.response_representation = Google::Apis::GmailV1::ListSmimeInfoResponse::Representation
          command.response_class = Google::Apis::GmailV1::ListSmimeInfoResponse
          command.params['userId'] = user_id unless user_id.nil?
          command.params['sendAsEmail'] = send_as_email unless send_as_email.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets the default S/MIME config for the specified send-as alias.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [String] send_as_email
        #   The email address that appears in the "From:" header for mail sent using this
        #   alias.
        # @param [String] id
        #   The immutable ID for the SmimeInfo.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def set_user_setting_send_a_smime_info_default(user_id, send_as_email, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{userId}/settings/sendAs/{sendAsEmail}/smimeInfo/{id}/setDefault', options)
          command.params['userId'] = user_id unless user_id.nil?
          command.params['sendAsEmail'] = send_as_email unless send_as_email.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Immediately and permanently deletes the specified thread. This operation
        # cannot be undone. Prefer threads.trash instead.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [String] id
        #   ID of the Thread to delete.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_user_thread(user_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, '{userId}/threads/{id}', options)
          command.params['userId'] = user_id unless user_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the specified thread.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [String] id
        #   The ID of the thread to retrieve.
        # @param [String] format
        #   The format to return the messages in.
        # @param [Array<String>, String] metadata_headers
        #   When given and format is METADATA, only include headers specified.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::Thread] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::Thread]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_user_thread(user_id, id, format: nil, metadata_headers: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{userId}/threads/{id}', options)
          command.response_representation = Google::Apis::GmailV1::Thread::Representation
          command.response_class = Google::Apis::GmailV1::Thread
          command.params['userId'] = user_id unless user_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['format'] = format unless format.nil?
          command.query['metadataHeaders'] = metadata_headers unless metadata_headers.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the threads in the user's mailbox.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [Boolean] include_spam_trash
        #   Include threads from SPAM and TRASH in the results.
        # @param [Array<String>, String] label_ids
        #   Only return threads with labels that match all of the specified label IDs.
        # @param [Fixnum] max_results
        #   Maximum number of threads to return.
        # @param [String] page_token
        #   Page token to retrieve a specific page of results in the list.
        # @param [String] q
        #   Only return threads matching the specified query. Supports the same query
        #   format as the Gmail search box. For example, "from:someuser@example.com
        #   rfc822msgid: is:unread". Parameter cannot be used when accessing the api using
        #   the gmail.metadata scope.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::ListThreadsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::ListThreadsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_user_threads(user_id, include_spam_trash: nil, label_ids: nil, max_results: nil, page_token: nil, q: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{userId}/threads', options)
          command.response_representation = Google::Apis::GmailV1::ListThreadsResponse::Representation
          command.response_class = Google::Apis::GmailV1::ListThreadsResponse
          command.params['userId'] = user_id unless user_id.nil?
          command.query['includeSpamTrash'] = include_spam_trash unless include_spam_trash.nil?
          command.query['labelIds'] = label_ids unless label_ids.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['q'] = q unless q.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Modifies the labels applied to the thread. This applies to all messages in the
        # thread.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [String] id
        #   The ID of the thread to modify.
        # @param [Google::Apis::GmailV1::ModifyThreadRequest] modify_thread_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::Thread] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::Thread]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def modify_thread(user_id, id, modify_thread_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{userId}/threads/{id}/modify', options)
          command.request_representation = Google::Apis::GmailV1::ModifyThreadRequest::Representation
          command.request_object = modify_thread_request_object
          command.response_representation = Google::Apis::GmailV1::Thread::Representation
          command.response_class = Google::Apis::GmailV1::Thread
          command.params['userId'] = user_id unless user_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Moves the specified thread to the trash.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [String] id
        #   The ID of the thread to Trash.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::Thread] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::Thread]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def trash_user_thread(user_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{userId}/threads/{id}/trash', options)
          command.response_representation = Google::Apis::GmailV1::Thread::Representation
          command.response_class = Google::Apis::GmailV1::Thread
          command.params['userId'] = user_id unless user_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Removes the specified thread from the trash.
        # @param [String] user_id
        #   The user's email address. The special value me can be used to indicate the
        #   authenticated user.
        # @param [String] id
        #   The ID of the thread to remove from Trash.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::GmailV1::Thread] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::GmailV1::Thread]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def untrash_user_thread(user_id, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{userId}/threads/{id}/untrash', options)
          command.response_representation = Google::Apis::GmailV1::Thread::Representation
          command.response_class = Google::Apis::GmailV1::Thread
          command.params['userId'] = user_id unless user_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end

        protected

        def apply_command_defaults(command)
          command.query['key'] = key unless key.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
        end
      end
    end
  end
end
