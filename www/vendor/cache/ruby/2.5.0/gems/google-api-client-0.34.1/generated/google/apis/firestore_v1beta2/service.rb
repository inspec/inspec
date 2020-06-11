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
    module FirestoreV1beta2
      # Cloud Firestore API
      #
      # Accesses the NoSQL document database built for automatic scaling, high
      #  performance, and ease of application development.
      #
      # @example
      #    require 'google/apis/firestore_v1beta2'
      #
      #    Firestore = Google::Apis::FirestoreV1beta2 # Alias the module
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
        # @param [Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2ExportDocumentsRequest] google_firestore_admin_v1beta2_export_documents_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirestoreV1beta2::GoogleLongrunningOperation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirestoreV1beta2::GoogleLongrunningOperation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def export_project_database_documents(name, google_firestore_admin_v1beta2_export_documents_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta2/{+name}:exportDocuments', options)
          command.request_representation = Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2ExportDocumentsRequest::Representation
          command.request_object = google_firestore_admin_v1beta2_export_documents_request_object
          command.response_representation = Google::Apis::FirestoreV1beta2::GoogleLongrunningOperation::Representation
          command.response_class = Google::Apis::FirestoreV1beta2::GoogleLongrunningOperation
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
        # @param [Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2ImportDocumentsRequest] google_firestore_admin_v1beta2_import_documents_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirestoreV1beta2::GoogleLongrunningOperation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirestoreV1beta2::GoogleLongrunningOperation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def import_project_database_documents(name, google_firestore_admin_v1beta2_import_documents_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta2/{+name}:importDocuments', options)
          command.request_representation = Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2ImportDocumentsRequest::Representation
          command.request_object = google_firestore_admin_v1beta2_import_documents_request_object
          command.response_representation = Google::Apis::FirestoreV1beta2::GoogleLongrunningOperation::Representation
          command.response_class = Google::Apis::FirestoreV1beta2::GoogleLongrunningOperation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the metadata and configuration for a Field.
        # @param [String] name
        #   A name of the form
        #   `projects/`project_id`/databases/`database_id`/collectionGroups/`collection_id`
        #   /fields/`field_id``
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Field] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Field]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_database_collection_group_field(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta2/{+name}', options)
          command.response_representation = Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Field::Representation
          command.response_class = Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Field
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the field configuration and metadata for this database.
        # Currently, FirestoreAdmin.ListFields only supports listing fields
        # that have been explicitly overridden. To issue this query, call
        # FirestoreAdmin.ListFields with the filter set to
        # `indexConfig.usesAncestorConfig:false`.
        # @param [String] parent
        #   A parent name of the form
        #   `projects/`project_id`/databases/`database_id`/collectionGroups/`collection_id`
        #   `
        # @param [String] filter
        #   The filter to apply to list results. Currently,
        #   FirestoreAdmin.ListFields only supports listing fields
        #   that have been explicitly overridden. To issue this query, call
        #   FirestoreAdmin.ListFields with the filter set to
        #   `indexConfig.usesAncestorConfig:false`.
        # @param [Fixnum] page_size
        #   The number of results to return.
        # @param [String] page_token
        #   A page token, returned from a previous call to
        #   FirestoreAdmin.ListFields, that may be used to get the next
        #   page of results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2ListFieldsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2ListFieldsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_database_collection_group_fields(parent, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta2/{+parent}/fields', options)
          command.response_representation = Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2ListFieldsResponse::Representation
          command.response_class = Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2ListFieldsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a field configuration. Currently, field updates apply only to
        # single field index configuration. However, calls to
        # FirestoreAdmin.UpdateField should provide a field mask to avoid
        # changing any configuration that the caller isn't aware of. The field mask
        # should be specified as: `` paths: "index_config" ``.
        # This call returns a google.longrunning.Operation which may be used to
        # track the status of the field update. The metadata for
        # the operation will be the type FieldOperationMetadata.
        # To configure the default field settings for the database, use
        # the special `Field` with resource name:
        # `projects/`project_id`/databases/`database_id`/collectionGroups/__default__/
        # fields/*`.
        # @param [String] name
        #   A field name of the form
        #   `projects/`project_id`/databases/`database_id`/collectionGroups/`collection_id`
        #   /fields/`field_path``
        #   A field path may be a simple field name, e.g. `address` or a path to fields
        #   within map_value , e.g. `address.city`,
        #   or a special field path. The only valid special field is `*`, which
        #   represents any field.
        #   Field paths may be quoted using ` (backtick). The only character that needs
        #   to be escaped within a quoted field path is the backtick character itself,
        #   escaped using a backslash. Special characters in field paths that
        #   must be quoted include: `*`, `.`,
        #   ``` (backtick), `[`, `]`, as well as any ascii symbolic characters.
        #   Examples:
        #   (Note: Comments here are written in markdown syntax, so there is an
        #   additional layer of backticks to represent a code block)
        #   `\`address.city\`` represents a field named `address.city`, not the map key
        #   `city` in the field `address`.
        #   `\`*\`` represents a field named `*`, not any field.
        #   A special `Field` contains the default indexing settings for all fields.
        #   This field's resource name is:
        #   `projects/`project_id`/databases/`database_id`/collectionGroups/__default__/
        #   fields/*`
        #   Indexes defined on this `Field` will be applied to all fields which do not
        #   have their own `Field` index configuration.
        # @param [Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Field] google_firestore_admin_v1beta2_field_object
        # @param [String] update_mask
        #   A mask, relative to the field. If specified, only configuration specified
        #   by this field_mask will be updated in the field.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirestoreV1beta2::GoogleLongrunningOperation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirestoreV1beta2::GoogleLongrunningOperation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_database_collection_group_field(name, google_firestore_admin_v1beta2_field_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1beta2/{+name}', options)
          command.request_representation = Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Field::Representation
          command.request_object = google_firestore_admin_v1beta2_field_object
          command.response_representation = Google::Apis::FirestoreV1beta2::GoogleLongrunningOperation::Representation
          command.response_class = Google::Apis::FirestoreV1beta2::GoogleLongrunningOperation
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a composite index. This returns a google.longrunning.Operation
        # which may be used to track the status of the creation. The metadata for
        # the operation will be the type IndexOperationMetadata.
        # @param [String] parent
        #   A parent name of the form
        #   `projects/`project_id`/databases/`database_id`/collectionGroups/`collection_id`
        #   `
        # @param [Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Index] google_firestore_admin_v1beta2_index_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirestoreV1beta2::GoogleLongrunningOperation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirestoreV1beta2::GoogleLongrunningOperation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_database_collection_group_index(parent, google_firestore_admin_v1beta2_index_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta2/{+parent}/indexes', options)
          command.request_representation = Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Index::Representation
          command.request_object = google_firestore_admin_v1beta2_index_object
          command.response_representation = Google::Apis::FirestoreV1beta2::GoogleLongrunningOperation::Representation
          command.response_class = Google::Apis::FirestoreV1beta2::GoogleLongrunningOperation
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a composite index.
        # @param [String] name
        #   A name of the form
        #   `projects/`project_id`/databases/`database_id`/collectionGroups/`collection_id`
        #   /indexes/`index_id``
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirestoreV1beta2::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirestoreV1beta2::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_database_collection_group_index(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1beta2/{+name}', options)
          command.response_representation = Google::Apis::FirestoreV1beta2::Empty::Representation
          command.response_class = Google::Apis::FirestoreV1beta2::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a composite index.
        # @param [String] name
        #   A name of the form
        #   `projects/`project_id`/databases/`database_id`/collectionGroups/`collection_id`
        #   /indexes/`index_id``
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Index] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Index]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_database_collection_group_index(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta2/{+name}', options)
          command.response_representation = Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Index::Representation
          command.response_class = Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Index
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists composite indexes.
        # @param [String] parent
        #   A parent name of the form
        #   `projects/`project_id`/databases/`database_id`/collectionGroups/`collection_id`
        #   `
        # @param [String] filter
        #   The filter to apply to list results.
        # @param [Fixnum] page_size
        #   The number of results to return.
        # @param [String] page_token
        #   A page token, returned from a previous call to
        #   FirestoreAdmin.ListIndexes, that may be used to get the next
        #   page of results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2ListIndexesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2ListIndexesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_database_collection_group_indexes(parent, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta2/{+parent}/indexes', options)
          command.response_representation = Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2ListIndexesResponse::Representation
          command.response_class = Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2ListIndexesResponse
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
