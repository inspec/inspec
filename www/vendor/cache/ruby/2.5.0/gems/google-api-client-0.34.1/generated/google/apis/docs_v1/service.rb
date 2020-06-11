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
    module DocsV1
      # Google Docs API
      #
      # Reads and writes Google Docs documents.
      #
      # @example
      #    require 'google/apis/docs_v1'
      #
      #    Docs = Google::Apis::DocsV1 # Alias the module
      #    service = Docs::DocsService.new
      #
      # @see https://developers.google.com/docs/
      class DocsService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://docs.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Applies one or more updates to the document.
        # Each request is validated before
        # being applied. If any request is not valid, then the entire request will
        # fail and nothing will be applied.
        # Some requests have replies to
        # give you some information about how they are applied. Other requests do
        # not need to return information; these each return an empty reply.
        # The order of replies matches that of the requests.
        # For example, suppose you call batchUpdate with four updates, and only the
        # third one returns information. The response would have two empty replies,
        # the reply to the third request, and another empty reply, in that order.
        # Because other users may be editing the document, the document
        # might not exactly reflect your changes: your changes may
        # be altered with respect to collaborator changes. If there are no
        # collaborators, the document should reflect your changes. In any case,
        # the updates in your request are guaranteed to be applied together
        # atomically.
        # @param [String] document_id
        #   The ID of the document to update.
        # @param [Google::Apis::DocsV1::BatchUpdateDocumentRequest] batch_update_document_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DocsV1::BatchUpdateDocumentResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DocsV1::BatchUpdateDocumentResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_update_document(document_id, batch_update_document_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/documents/{documentId}:batchUpdate', options)
          command.request_representation = Google::Apis::DocsV1::BatchUpdateDocumentRequest::Representation
          command.request_object = batch_update_document_request_object
          command.response_representation = Google::Apis::DocsV1::BatchUpdateDocumentResponse::Representation
          command.response_class = Google::Apis::DocsV1::BatchUpdateDocumentResponse
          command.params['documentId'] = document_id unless document_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a blank document using the title given in the request. Other fields
        # in the request, including any provided content, are ignored.
        # Returns the created document.
        # @param [Google::Apis::DocsV1::Document] document_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DocsV1::Document] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DocsV1::Document]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_document(document_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/documents', options)
          command.request_representation = Google::Apis::DocsV1::Document::Representation
          command.request_object = document_object
          command.response_representation = Google::Apis::DocsV1::Document::Representation
          command.response_class = Google::Apis::DocsV1::Document
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the latest version of the specified document.
        # @param [String] document_id
        #   The ID of the document to retrieve.
        # @param [String] suggestions_view_mode
        #   The suggestions view mode to apply to the document. This allows viewing the
        #   document with all suggestions inline, accepted or rejected. If one is not
        #   specified, DEFAULT_FOR_CURRENT_ACCESS is
        #   used.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DocsV1::Document] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DocsV1::Document]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_document(document_id, suggestions_view_mode: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/documents/{documentId}', options)
          command.response_representation = Google::Apis::DocsV1::Document::Representation
          command.response_class = Google::Apis::DocsV1::Document
          command.params['documentId'] = document_id unless document_id.nil?
          command.query['suggestionsViewMode'] = suggestions_view_mode unless suggestions_view_mode.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end

        protected

        def apply_command_defaults(command)
          command.query['key'] = key unless key.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
        end
      end
    end
  end
end
