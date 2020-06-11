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
    module FirestoreV1beta1
      # Cloud Firestore API
      #
      # Accesses the NoSQL document database built for automatic scaling, high
      #  performance, and ease of application development.
      #
      # @example
      #    require 'google/apis/firestore_v1beta1'
      #
      #    Firestore = Google::Apis::FirestoreV1beta1 # Alias the module
      #    service = Firestore::FirestoreService.new
      #
      # @see https://cloud.google.com/firestore
      class FirestoreService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://firestore.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Exports a copy of all or a subset of documents from Google Cloud Firestore
        # to another storage system, such as Google Cloud Storage. Recent updates to
        # documents may not be reflected in the export. The export occurs in the
        # background and its progress can be monitored and managed via the
        # Operation resource that is created. The output of an export may only be
        # used once the associated operation is done. If an export operation is
        # cancelled before completion it may leave partial data behind in Google
        # Cloud Storage.
        # @param [String] name
        #   Database to export. Should be of the form:
        #   `projects/`project_id`/databases/`database_id``.
        # @param [Google::Apis::FirestoreV1beta1::GoogleFirestoreAdminV1beta1ExportDocumentsRequest] google_firestore_admin_v1beta1_export_documents_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirestoreV1beta1::GoogleLongrunningOperation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirestoreV1beta1::GoogleLongrunningOperation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def export_project_database_documents(name, google_firestore_admin_v1beta1_export_documents_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+name}:exportDocuments', options)
          command.request_representation = Google::Apis::FirestoreV1beta1::GoogleFirestoreAdminV1beta1ExportDocumentsRequest::Representation
          command.request_object = google_firestore_admin_v1beta1_export_documents_request_object
          command.response_representation = Google::Apis::FirestoreV1beta1::GoogleLongrunningOperation::Representation
          command.response_class = Google::Apis::FirestoreV1beta1::GoogleLongrunningOperation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Imports documents into Google Cloud Firestore. Existing documents with the
        # same name are overwritten. The import occurs in the background and its
        # progress can be monitored and managed via the Operation resource that is
        # created. If an ImportDocuments operation is cancelled, it is possible
        # that a subset of the data has already been imported to Cloud Firestore.
        # @param [String] name
        #   Database to import into. Should be of the form:
        #   `projects/`project_id`/databases/`database_id``.
        # @param [Google::Apis::FirestoreV1beta1::GoogleFirestoreAdminV1beta1ImportDocumentsRequest] google_firestore_admin_v1beta1_import_documents_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirestoreV1beta1::GoogleLongrunningOperation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirestoreV1beta1::GoogleLongrunningOperation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def import_project_database_documents(name, google_firestore_admin_v1beta1_import_documents_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+name}:importDocuments', options)
          command.request_representation = Google::Apis::FirestoreV1beta1::GoogleFirestoreAdminV1beta1ImportDocumentsRequest::Representation
          command.request_object = google_firestore_admin_v1beta1_import_documents_request_object
          command.response_representation = Google::Apis::FirestoreV1beta1::GoogleLongrunningOperation::Representation
          command.response_class = Google::Apis::FirestoreV1beta1::GoogleLongrunningOperation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets multiple documents.
        # Documents returned by this method are not guaranteed to be returned in the
        # same order that they were requested.
        # @param [String] database
        #   The database name. In the format:
        #   `projects/`project_id`/databases/`database_id``.
        # @param [Google::Apis::FirestoreV1beta1::BatchGetDocumentsRequest] batch_get_documents_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirestoreV1beta1::BatchGetDocumentsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirestoreV1beta1::BatchGetDocumentsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_get_documents(database, batch_get_documents_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+database}/documents:batchGet', options)
          command.request_representation = Google::Apis::FirestoreV1beta1::BatchGetDocumentsRequest::Representation
          command.request_object = batch_get_documents_request_object
          command.response_representation = Google::Apis::FirestoreV1beta1::BatchGetDocumentsResponse::Representation
          command.response_class = Google::Apis::FirestoreV1beta1::BatchGetDocumentsResponse
          command.params['database'] = database unless database.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Starts a new transaction.
        # @param [String] database
        #   The database name. In the format:
        #   `projects/`project_id`/databases/`database_id``.
        # @param [Google::Apis::FirestoreV1beta1::BeginTransactionRequest] begin_transaction_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirestoreV1beta1::BeginTransactionResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirestoreV1beta1::BeginTransactionResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def begin_document_transaction(database, begin_transaction_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+database}/documents:beginTransaction', options)
          command.request_representation = Google::Apis::FirestoreV1beta1::BeginTransactionRequest::Representation
          command.request_object = begin_transaction_request_object
          command.response_representation = Google::Apis::FirestoreV1beta1::BeginTransactionResponse::Representation
          command.response_class = Google::Apis::FirestoreV1beta1::BeginTransactionResponse
          command.params['database'] = database unless database.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Commits a transaction, while optionally updating documents.
        # @param [String] database
        #   The database name. In the format:
        #   `projects/`project_id`/databases/`database_id``.
        # @param [Google::Apis::FirestoreV1beta1::CommitRequest] commit_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirestoreV1beta1::CommitResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirestoreV1beta1::CommitResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def commit_document(database, commit_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+database}/documents:commit', options)
          command.request_representation = Google::Apis::FirestoreV1beta1::CommitRequest::Representation
          command.request_object = commit_request_object
          command.response_representation = Google::Apis::FirestoreV1beta1::CommitResponse::Representation
          command.response_class = Google::Apis::FirestoreV1beta1::CommitResponse
          command.params['database'] = database unless database.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new document.
        # @param [String] parent
        #   The parent resource. For example:
        #   `projects/`project_id`/databases/`database_id`/documents` or
        #   `projects/`project_id`/databases/`database_id`/documents/chatrooms/`
        #   chatroom_id``
        # @param [String] collection_id
        #   The collection ID, relative to `parent`, to list. For example: `chatrooms`.
        # @param [Google::Apis::FirestoreV1beta1::Document] document_object
        # @param [String] document_id
        #   The client-assigned document ID to use for this document.
        #   Optional. If not specified, an ID will be assigned by the service.
        # @param [Array<String>, String] mask_field_paths
        #   The list of field paths in the mask. See Document.fields for a field
        #   path syntax reference.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirestoreV1beta1::Document] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirestoreV1beta1::Document]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_database_document_document(parent, collection_id, document_object = nil, document_id: nil, mask_field_paths: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+parent}/{collectionId}', options)
          command.request_representation = Google::Apis::FirestoreV1beta1::Document::Representation
          command.request_object = document_object
          command.response_representation = Google::Apis::FirestoreV1beta1::Document::Representation
          command.response_class = Google::Apis::FirestoreV1beta1::Document
          command.params['parent'] = parent unless parent.nil?
          command.params['collectionId'] = collection_id unless collection_id.nil?
          command.query['documentId'] = document_id unless document_id.nil?
          command.query['mask.fieldPaths'] = mask_field_paths unless mask_field_paths.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a document.
        # @param [String] name
        #   The resource name of the Document to delete. In the format:
        #   `projects/`project_id`/databases/`database_id`/documents/`document_path``.
        # @param [Boolean] current_document_exists
        #   When set to `true`, the target document must exist.
        #   When set to `false`, the target document must not exist.
        # @param [String] current_document_update_time
        #   When set, the target document must exist and have been last updated at
        #   that time.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirestoreV1beta1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirestoreV1beta1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_database_document(name, current_document_exists: nil, current_document_update_time: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::FirestoreV1beta1::Empty::Representation
          command.response_class = Google::Apis::FirestoreV1beta1::Empty
          command.params['name'] = name unless name.nil?
          command.query['currentDocument.exists'] = current_document_exists unless current_document_exists.nil?
          command.query['currentDocument.updateTime'] = current_document_update_time unless current_document_update_time.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a single document.
        # @param [String] name
        #   The resource name of the Document to get. In the format:
        #   `projects/`project_id`/databases/`database_id`/documents/`document_path``.
        # @param [Array<String>, String] mask_field_paths
        #   The list of field paths in the mask. See Document.fields for a field
        #   path syntax reference.
        # @param [String] read_time
        #   Reads the version of the document at the given time.
        #   This may not be older than 60 seconds.
        # @param [String] transaction
        #   Reads the document in a transaction.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirestoreV1beta1::Document] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirestoreV1beta1::Document]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_database_document(name, mask_field_paths: nil, read_time: nil, transaction: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::FirestoreV1beta1::Document::Representation
          command.response_class = Google::Apis::FirestoreV1beta1::Document
          command.params['name'] = name unless name.nil?
          command.query['mask.fieldPaths'] = mask_field_paths unless mask_field_paths.nil?
          command.query['readTime'] = read_time unless read_time.nil?
          command.query['transaction'] = transaction unless transaction.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists documents.
        # @param [String] parent
        #   The parent resource name. In the format:
        #   `projects/`project_id`/databases/`database_id`/documents` or
        #   `projects/`project_id`/databases/`database_id`/documents/`document_path``.
        #   For example:
        #   `projects/my-project/databases/my-database/documents` or
        #   `projects/my-project/databases/my-database/documents/chatrooms/my-chatroom`
        # @param [String] collection_id
        #   The collection ID, relative to `parent`, to list. For example: `chatrooms`
        #   or `messages`.
        # @param [Array<String>, String] mask_field_paths
        #   The list of field paths in the mask. See Document.fields for a field
        #   path syntax reference.
        # @param [String] order_by
        #   The order to sort results by. For example: `priority desc, name`.
        # @param [Fixnum] page_size
        #   The maximum number of documents to return.
        # @param [String] page_token
        #   The `next_page_token` value returned from a previous List request, if any.
        # @param [String] read_time
        #   Reads documents as they were at the given time.
        #   This may not be older than 60 seconds.
        # @param [Boolean] show_missing
        #   If the list should show missing documents. A missing document is a
        #   document that does not exist but has sub-documents. These documents will
        #   be returned with a key but will not have fields, Document.create_time,
        #   or Document.update_time set.
        #   Requests with `show_missing` may not specify `where` or
        #   `order_by`.
        # @param [String] transaction
        #   Reads documents in a transaction.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirestoreV1beta1::ListDocumentsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirestoreV1beta1::ListDocumentsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_database_documents(parent, collection_id, mask_field_paths: nil, order_by: nil, page_size: nil, page_token: nil, read_time: nil, show_missing: nil, transaction: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+parent}/{collectionId}', options)
          command.response_representation = Google::Apis::FirestoreV1beta1::ListDocumentsResponse::Representation
          command.response_class = Google::Apis::FirestoreV1beta1::ListDocumentsResponse
          command.params['parent'] = parent unless parent.nil?
          command.params['collectionId'] = collection_id unless collection_id.nil?
          command.query['mask.fieldPaths'] = mask_field_paths unless mask_field_paths.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['readTime'] = read_time unless read_time.nil?
          command.query['showMissing'] = show_missing unless show_missing.nil?
          command.query['transaction'] = transaction unless transaction.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all the collection IDs underneath a document.
        # @param [String] parent
        #   The parent document. In the format:
        #   `projects/`project_id`/databases/`database_id`/documents/`document_path``.
        #   For example:
        #   `projects/my-project/databases/my-database/documents/chatrooms/my-chatroom`
        # @param [Google::Apis::FirestoreV1beta1::ListCollectionIdsRequest] list_collection_ids_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirestoreV1beta1::ListCollectionIdsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirestoreV1beta1::ListCollectionIdsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_database_document_collection_ids(parent, list_collection_ids_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+parent}:listCollectionIds', options)
          command.request_representation = Google::Apis::FirestoreV1beta1::ListCollectionIdsRequest::Representation
          command.request_object = list_collection_ids_request_object
          command.response_representation = Google::Apis::FirestoreV1beta1::ListCollectionIdsResponse::Representation
          command.response_class = Google::Apis::FirestoreV1beta1::ListCollectionIdsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Listens to changes.
        # @param [String] database
        #   The database name. In the format:
        #   `projects/`project_id`/databases/`database_id``.
        # @param [Google::Apis::FirestoreV1beta1::ListenRequest] listen_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirestoreV1beta1::ListenResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirestoreV1beta1::ListenResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def listen_document(database, listen_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+database}/documents:listen', options)
          command.request_representation = Google::Apis::FirestoreV1beta1::ListenRequest::Representation
          command.request_object = listen_request_object
          command.response_representation = Google::Apis::FirestoreV1beta1::ListenResponse::Representation
          command.response_class = Google::Apis::FirestoreV1beta1::ListenResponse
          command.params['database'] = database unless database.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates or inserts a document.
        # @param [String] name
        #   The resource name of the document, for example
        #   `projects/`project_id`/databases/`database_id`/documents/`document_path``.
        # @param [Google::Apis::FirestoreV1beta1::Document] document_object
        # @param [Boolean] current_document_exists
        #   When set to `true`, the target document must exist.
        #   When set to `false`, the target document must not exist.
        # @param [String] current_document_update_time
        #   When set, the target document must exist and have been last updated at
        #   that time.
        # @param [Array<String>, String] mask_field_paths
        #   The list of field paths in the mask. See Document.fields for a field
        #   path syntax reference.
        # @param [Array<String>, String] update_mask_field_paths
        #   The list of field paths in the mask. See Document.fields for a field
        #   path syntax reference.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirestoreV1beta1::Document] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirestoreV1beta1::Document]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_database_document(name, document_object = nil, current_document_exists: nil, current_document_update_time: nil, mask_field_paths: nil, update_mask_field_paths: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1beta1/{+name}', options)
          command.request_representation = Google::Apis::FirestoreV1beta1::Document::Representation
          command.request_object = document_object
          command.response_representation = Google::Apis::FirestoreV1beta1::Document::Representation
          command.response_class = Google::Apis::FirestoreV1beta1::Document
          command.params['name'] = name unless name.nil?
          command.query['currentDocument.exists'] = current_document_exists unless current_document_exists.nil?
          command.query['currentDocument.updateTime'] = current_document_update_time unless current_document_update_time.nil?
          command.query['mask.fieldPaths'] = mask_field_paths unless mask_field_paths.nil?
          command.query['updateMask.fieldPaths'] = update_mask_field_paths unless update_mask_field_paths.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rolls back a transaction.
        # @param [String] database
        #   The database name. In the format:
        #   `projects/`project_id`/databases/`database_id``.
        # @param [Google::Apis::FirestoreV1beta1::RollbackRequest] rollback_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirestoreV1beta1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirestoreV1beta1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def rollback_document(database, rollback_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+database}/documents:rollback', options)
          command.request_representation = Google::Apis::FirestoreV1beta1::RollbackRequest::Representation
          command.request_object = rollback_request_object
          command.response_representation = Google::Apis::FirestoreV1beta1::Empty::Representation
          command.response_class = Google::Apis::FirestoreV1beta1::Empty
          command.params['database'] = database unless database.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Runs a query.
        # @param [String] parent
        #   The parent resource name. In the format:
        #   `projects/`project_id`/databases/`database_id`/documents` or
        #   `projects/`project_id`/databases/`database_id`/documents/`document_path``.
        #   For example:
        #   `projects/my-project/databases/my-database/documents` or
        #   `projects/my-project/databases/my-database/documents/chatrooms/my-chatroom`
        # @param [Google::Apis::FirestoreV1beta1::RunQueryRequest] run_query_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirestoreV1beta1::RunQueryResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirestoreV1beta1::RunQueryResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def run_document_query(parent, run_query_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+parent}:runQuery', options)
          command.request_representation = Google::Apis::FirestoreV1beta1::RunQueryRequest::Representation
          command.request_object = run_query_request_object
          command.response_representation = Google::Apis::FirestoreV1beta1::RunQueryResponse::Representation
          command.response_class = Google::Apis::FirestoreV1beta1::RunQueryResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Streams batches of document updates and deletes, in order.
        # @param [String] database
        #   The database name. In the format:
        #   `projects/`project_id`/databases/`database_id``.
        #   This is only required in the first message.
        # @param [Google::Apis::FirestoreV1beta1::WriteRequest] write_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirestoreV1beta1::WriteResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirestoreV1beta1::WriteResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def write_document(database, write_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+database}/documents:write', options)
          command.request_representation = Google::Apis::FirestoreV1beta1::WriteRequest::Representation
          command.request_object = write_request_object
          command.response_representation = Google::Apis::FirestoreV1beta1::WriteResponse::Representation
          command.response_class = Google::Apis::FirestoreV1beta1::WriteResponse
          command.params['database'] = database unless database.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates the specified index.
        # A newly created index's initial state is `CREATING`. On completion of the
        # returned google.longrunning.Operation, the state will be `READY`.
        # If the index already exists, the call will return an `ALREADY_EXISTS`
        # status.
        # During creation, the process could result in an error, in which case the
        # index will move to the `ERROR` state. The process can be recovered by
        # fixing the data that caused the error, removing the index with
        # delete, then re-creating the index with
        # create.
        # Indexes with a single field cannot be created.
        # @param [String] parent
        #   The name of the database this index will apply to. For example:
        #   `projects/`project_id`/databases/`database_id``
        # @param [Google::Apis::FirestoreV1beta1::GoogleFirestoreAdminV1beta1Index] google_firestore_admin_v1beta1_index_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirestoreV1beta1::GoogleLongrunningOperation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirestoreV1beta1::GoogleLongrunningOperation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_database_index(parent, google_firestore_admin_v1beta1_index_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+parent}/indexes', options)
          command.request_representation = Google::Apis::FirestoreV1beta1::GoogleFirestoreAdminV1beta1Index::Representation
          command.request_object = google_firestore_admin_v1beta1_index_object
          command.response_representation = Google::Apis::FirestoreV1beta1::GoogleLongrunningOperation::Representation
          command.response_class = Google::Apis::FirestoreV1beta1::GoogleLongrunningOperation
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes an index.
        # @param [String] name
        #   The index name. For example:
        #   `projects/`project_id`/databases/`database_id`/indexes/`index_id``
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirestoreV1beta1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirestoreV1beta1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_database_index(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::FirestoreV1beta1::Empty::Representation
          command.response_class = Google::Apis::FirestoreV1beta1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets an index.
        # @param [String] name
        #   The name of the index. For example:
        #   `projects/`project_id`/databases/`database_id`/indexes/`index_id``
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirestoreV1beta1::GoogleFirestoreAdminV1beta1Index] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirestoreV1beta1::GoogleFirestoreAdminV1beta1Index]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_database_index(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::FirestoreV1beta1::GoogleFirestoreAdminV1beta1Index::Representation
          command.response_class = Google::Apis::FirestoreV1beta1::GoogleFirestoreAdminV1beta1Index
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the indexes that match the specified filters.
        # @param [String] parent
        #   The database name. For example:
        #   `projects/`project_id`/databases/`database_id``
        # @param [String] filter
        # @param [Fixnum] page_size
        #   The standard List page size.
        # @param [String] page_token
        #   The standard List page token.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirestoreV1beta1::GoogleFirestoreAdminV1beta1ListIndexesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirestoreV1beta1::GoogleFirestoreAdminV1beta1ListIndexesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_database_indexes(parent, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+parent}/indexes', options)
          command.response_representation = Google::Apis::FirestoreV1beta1::GoogleFirestoreAdminV1beta1ListIndexesResponse::Representation
          command.response_class = Google::Apis::FirestoreV1beta1::GoogleFirestoreAdminV1beta1ListIndexesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
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
