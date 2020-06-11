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
    module FirestoreV1beta2
      
      # A generic empty message that you can re-use to avoid defining duplicated
      # empty messages in your APIs. A typical example is to use it as the request
      # or the response type of an API method. For instance:
      # service Foo `
      # rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);
      # `
      # The JSON representation for `Empty` is empty JSON object ````.
      class Empty
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Metadata for google.longrunning.Operation results from
      # FirestoreAdmin.ExportDocuments.
      class GoogleFirestoreAdminV1beta2ExportDocumentsMetadata
        include Google::Apis::Core::Hashable
      
        # Which collection ids are being exported.
        # Corresponds to the JSON property `collectionIds`
        # @return [Array<String>]
        attr_accessor :collection_ids
      
        # The time this operation completed. Will be unset if operation still in
        # progress.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # The state of the export operation.
        # Corresponds to the JSON property `operationState`
        # @return [String]
        attr_accessor :operation_state
      
        # Where the entities are being exported to.
        # Corresponds to the JSON property `outputUriPrefix`
        # @return [String]
        attr_accessor :output_uri_prefix
      
        # Describes the progress of the operation.
        # Unit of work is generic and must be interpreted based on where Progress
        # is used.
        # Corresponds to the JSON property `progressBytes`
        # @return [Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Progress]
        attr_accessor :progress_bytes
      
        # Describes the progress of the operation.
        # Unit of work is generic and must be interpreted based on where Progress
        # is used.
        # Corresponds to the JSON property `progressDocuments`
        # @return [Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Progress]
        attr_accessor :progress_documents
      
        # The time this operation started.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @collection_ids = args[:collection_ids] if args.key?(:collection_ids)
          @end_time = args[:end_time] if args.key?(:end_time)
          @operation_state = args[:operation_state] if args.key?(:operation_state)
          @output_uri_prefix = args[:output_uri_prefix] if args.key?(:output_uri_prefix)
          @progress_bytes = args[:progress_bytes] if args.key?(:progress_bytes)
          @progress_documents = args[:progress_documents] if args.key?(:progress_documents)
          @start_time = args[:start_time] if args.key?(:start_time)
        end
      end
      
      # The request for FirestoreAdmin.ExportDocuments.
      class GoogleFirestoreAdminV1beta2ExportDocumentsRequest
        include Google::Apis::Core::Hashable
      
        # Which collection ids to export. Unspecified means all collections.
        # Corresponds to the JSON property `collectionIds`
        # @return [Array<String>]
        attr_accessor :collection_ids
      
        # The output URI. Currently only supports Google Cloud Storage URIs of the
        # form: `gs://BUCKET_NAME[/NAMESPACE_PATH]`, where `BUCKET_NAME` is the name
        # of the Google Cloud Storage bucket and `NAMESPACE_PATH` is an optional
        # Google Cloud Storage namespace path. When
        # choosing a name, be sure to consider Google Cloud Storage naming
        # guidelines: https://cloud.google.com/storage/docs/naming.
        # If the URI is a bucket (without a namespace path), a prefix will be
        # generated based on the start time.
        # Corresponds to the JSON property `outputUriPrefix`
        # @return [String]
        attr_accessor :output_uri_prefix
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @collection_ids = args[:collection_ids] if args.key?(:collection_ids)
          @output_uri_prefix = args[:output_uri_prefix] if args.key?(:output_uri_prefix)
        end
      end
      
      # Returned in the google.longrunning.Operation response field.
      class GoogleFirestoreAdminV1beta2ExportDocumentsResponse
        include Google::Apis::Core::Hashable
      
        # Location of the output files. This can be used to begin an import
        # into Cloud Firestore (this project or another project) after the operation
        # completes successfully.
        # Corresponds to the JSON property `outputUriPrefix`
        # @return [String]
        attr_accessor :output_uri_prefix
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @output_uri_prefix = args[:output_uri_prefix] if args.key?(:output_uri_prefix)
        end
      end
      
      # Represents a single field in the database.
      # Fields are grouped by their "Collection Group", which represent all
      # collections in the database with the same id.
      class GoogleFirestoreAdminV1beta2Field
        include Google::Apis::Core::Hashable
      
        # The index configuration for this field.
        # Corresponds to the JSON property `indexConfig`
        # @return [Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2IndexConfig]
        attr_accessor :index_config
      
        # A field name of the form
        # `projects/`project_id`/databases/`database_id`/collectionGroups/`collection_id`
        # /fields/`field_path``
        # A field path may be a simple field name, e.g. `address` or a path to fields
        # within map_value , e.g. `address.city`,
        # or a special field path. The only valid special field is `*`, which
        # represents any field.
        # Field paths may be quoted using ` (backtick). The only character that needs
        # to be escaped within a quoted field path is the backtick character itself,
        # escaped using a backslash. Special characters in field paths that
        # must be quoted include: `*`, `.`,
        # ``` (backtick), `[`, `]`, as well as any ascii symbolic characters.
        # Examples:
        # (Note: Comments here are written in markdown syntax, so there is an
        # additional layer of backticks to represent a code block)
        # `\`address.city\`` represents a field named `address.city`, not the map key
        # `city` in the field `address`.
        # `\`*\`` represents a field named `*`, not any field.
        # A special `Field` contains the default indexing settings for all fields.
        # This field's resource name is:
        # `projects/`project_id`/databases/`database_id`/collectionGroups/__default__/
        # fields/*`
        # Indexes defined on this `Field` will be applied to all fields which do not
        # have their own `Field` index configuration.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @index_config = args[:index_config] if args.key?(:index_config)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Metadata for google.longrunning.Operation results from
      # FirestoreAdmin.UpdateField.
      class GoogleFirestoreAdminV1beta2FieldOperationMetadata
        include Google::Apis::Core::Hashable
      
        # Describes the progress of the operation.
        # Unit of work is generic and must be interpreted based on where Progress
        # is used.
        # Corresponds to the JSON property `bytesProgress`
        # @return [Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Progress]
        attr_accessor :bytes_progress
      
        # Describes the progress of the operation.
        # Unit of work is generic and must be interpreted based on where Progress
        # is used.
        # Corresponds to the JSON property `documentProgress`
        # @return [Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Progress]
        attr_accessor :document_progress
      
        # The time this operation completed. Will be unset if operation still in
        # progress.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # The field resource that this operation is acting on. For example:
        # `projects/`project_id`/databases/`database_id`/collectionGroups/`collection_id`
        # /fields/`field_path``
        # Corresponds to the JSON property `field`
        # @return [String]
        attr_accessor :field
      
        # A list of IndexConfigDelta, which describe the intent of this
        # operation.
        # Corresponds to the JSON property `indexConfigDeltas`
        # @return [Array<Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2IndexConfigDelta>]
        attr_accessor :index_config_deltas
      
        # The time this operation started.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # The state of the operation.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bytes_progress = args[:bytes_progress] if args.key?(:bytes_progress)
          @document_progress = args[:document_progress] if args.key?(:document_progress)
          @end_time = args[:end_time] if args.key?(:end_time)
          @field = args[:field] if args.key?(:field)
          @index_config_deltas = args[:index_config_deltas] if args.key?(:index_config_deltas)
          @start_time = args[:start_time] if args.key?(:start_time)
          @state = args[:state] if args.key?(:state)
        end
      end
      
      # Metadata for google.longrunning.Operation results from
      # FirestoreAdmin.ImportDocuments.
      class GoogleFirestoreAdminV1beta2ImportDocumentsMetadata
        include Google::Apis::Core::Hashable
      
        # Which collection ids are being imported.
        # Corresponds to the JSON property `collectionIds`
        # @return [Array<String>]
        attr_accessor :collection_ids
      
        # The time this operation completed. Will be unset if operation still in
        # progress.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # The location of the documents being imported.
        # Corresponds to the JSON property `inputUriPrefix`
        # @return [String]
        attr_accessor :input_uri_prefix
      
        # The state of the import operation.
        # Corresponds to the JSON property `operationState`
        # @return [String]
        attr_accessor :operation_state
      
        # Describes the progress of the operation.
        # Unit of work is generic and must be interpreted based on where Progress
        # is used.
        # Corresponds to the JSON property `progressBytes`
        # @return [Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Progress]
        attr_accessor :progress_bytes
      
        # Describes the progress of the operation.
        # Unit of work is generic and must be interpreted based on where Progress
        # is used.
        # Corresponds to the JSON property `progressDocuments`
        # @return [Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Progress]
        attr_accessor :progress_documents
      
        # The time this operation started.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @collection_ids = args[:collection_ids] if args.key?(:collection_ids)
          @end_time = args[:end_time] if args.key?(:end_time)
          @input_uri_prefix = args[:input_uri_prefix] if args.key?(:input_uri_prefix)
          @operation_state = args[:operation_state] if args.key?(:operation_state)
          @progress_bytes = args[:progress_bytes] if args.key?(:progress_bytes)
          @progress_documents = args[:progress_documents] if args.key?(:progress_documents)
          @start_time = args[:start_time] if args.key?(:start_time)
        end
      end
      
      # The request for FirestoreAdmin.ImportDocuments.
      class GoogleFirestoreAdminV1beta2ImportDocumentsRequest
        include Google::Apis::Core::Hashable
      
        # Which collection ids to import. Unspecified means all collections included
        # in the import.
        # Corresponds to the JSON property `collectionIds`
        # @return [Array<String>]
        attr_accessor :collection_ids
      
        # Location of the exported files.
        # This must match the output_uri_prefix of an ExportDocumentsResponse from
        # an export that has completed successfully.
        # See:
        # google.firestore.admin.v1beta2.ExportDocumentsResponse.output_uri_prefix.
        # Corresponds to the JSON property `inputUriPrefix`
        # @return [String]
        attr_accessor :input_uri_prefix
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @collection_ids = args[:collection_ids] if args.key?(:collection_ids)
          @input_uri_prefix = args[:input_uri_prefix] if args.key?(:input_uri_prefix)
        end
      end
      
      # Cloud Firestore indexes enable simple and complex queries against
      # documents in a database.
      class GoogleFirestoreAdminV1beta2Index
        include Google::Apis::Core::Hashable
      
        # The fields supported by this index.
        # For composite indexes, this is always 2 or more fields.
        # The last field entry is always for the field path `__name__`. If, on
        # creation, `__name__` was not specified as the last field, it will be added
        # automatically with the same direction as that of the last field defined. If
        # the final field in a composite index is not directional, the `__name__`
        # will be ordered ASCENDING (unless explicitly specified).
        # For single field indexes, this will always be exactly one entry with a
        # field path equal to the field path of the associated field.
        # Corresponds to the JSON property `fields`
        # @return [Array<Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2IndexField>]
        attr_accessor :fields
      
        # Output only. A server defined name for this index.
        # The form of this name for composite indexes will be:
        # `projects/`project_id`/databases/`database_id`/collectionGroups/`collection_id`
        # /indexes/`composite_index_id``
        # For single field indexes, this field will be empty.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Indexes with a collection query scope specified allow queries
        # against a collection that is the child of a specific document, specified at
        # query time, and that has the same collection id.
        # Indexes with a collection group query scope specified allow queries against
        # all collections descended from a specific document, specified at query
        # time, and that have the same collection id as this index.
        # Corresponds to the JSON property `queryScope`
        # @return [String]
        attr_accessor :query_scope
      
        # Output only. The serving state of the index.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @fields = args[:fields] if args.key?(:fields)
          @name = args[:name] if args.key?(:name)
          @query_scope = args[:query_scope] if args.key?(:query_scope)
          @state = args[:state] if args.key?(:state)
        end
      end
      
      # The index configuration for this field.
      class GoogleFirestoreAdminV1beta2IndexConfig
        include Google::Apis::Core::Hashable
      
        # Output only. Specifies the resource name of the `Field` from which this field'
        # s
        # index configuration is set (when `uses_ancestor_config` is true),
        # or from which it *would* be set if this field had no index configuration
        # (when `uses_ancestor_config` is false).
        # Corresponds to the JSON property `ancestorField`
        # @return [String]
        attr_accessor :ancestor_field
      
        # The indexes supported for this field.
        # Corresponds to the JSON property `indexes`
        # @return [Array<Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Index>]
        attr_accessor :indexes
      
        # Output only
        # When true, the `Field`'s index configuration is in the process of being
        # reverted. Once complete, the index config will transition to the same
        # state as the field specified by `ancestor_field`, at which point
        # `uses_ancestor_config` will be `true` and `reverting` will be `false`.
        # Corresponds to the JSON property `reverting`
        # @return [Boolean]
        attr_accessor :reverting
        alias_method :reverting?, :reverting
      
        # Output only. When true, the `Field`'s index configuration is set from the
        # configuration specified by the `ancestor_field`.
        # When false, the `Field`'s index configuration is defined explicitly.
        # Corresponds to the JSON property `usesAncestorConfig`
        # @return [Boolean]
        attr_accessor :uses_ancestor_config
        alias_method :uses_ancestor_config?, :uses_ancestor_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ancestor_field = args[:ancestor_field] if args.key?(:ancestor_field)
          @indexes = args[:indexes] if args.key?(:indexes)
          @reverting = args[:reverting] if args.key?(:reverting)
          @uses_ancestor_config = args[:uses_ancestor_config] if args.key?(:uses_ancestor_config)
        end
      end
      
      # Information about an index configuration change.
      class GoogleFirestoreAdminV1beta2IndexConfigDelta
        include Google::Apis::Core::Hashable
      
        # Specifies how the index is changing.
        # Corresponds to the JSON property `changeType`
        # @return [String]
        attr_accessor :change_type
      
        # Cloud Firestore indexes enable simple and complex queries against
        # documents in a database.
        # Corresponds to the JSON property `index`
        # @return [Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Index]
        attr_accessor :index
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @change_type = args[:change_type] if args.key?(:change_type)
          @index = args[:index] if args.key?(:index)
        end
      end
      
      # A field in an index.
      # The field_path describes which field is indexed, the value_mode describes
      # how the field value is indexed.
      class GoogleFirestoreAdminV1beta2IndexField
        include Google::Apis::Core::Hashable
      
        # Indicates that this field supports operations on `array_value`s.
        # Corresponds to the JSON property `arrayConfig`
        # @return [String]
        attr_accessor :array_config
      
        # Can be __name__.
        # For single field indexes, this must match the name of the field or may
        # be omitted.
        # Corresponds to the JSON property `fieldPath`
        # @return [String]
        attr_accessor :field_path
      
        # Indicates that this field supports ordering by the specified order or
        # comparing using =, <, <=, >, >=.
        # Corresponds to the JSON property `order`
        # @return [String]
        attr_accessor :order
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @array_config = args[:array_config] if args.key?(:array_config)
          @field_path = args[:field_path] if args.key?(:field_path)
          @order = args[:order] if args.key?(:order)
        end
      end
      
      # Metadata for google.longrunning.Operation results from
      # FirestoreAdmin.CreateIndex.
      class GoogleFirestoreAdminV1beta2IndexOperationMetadata
        include Google::Apis::Core::Hashable
      
        # The time this operation completed. Will be unset if operation still in
        # progress.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # The index resource that this operation is acting on. For example:
        # `projects/`project_id`/databases/`database_id`/collectionGroups/`collection_id`
        # /indexes/`index_id``
        # Corresponds to the JSON property `index`
        # @return [String]
        attr_accessor :index
      
        # Describes the progress of the operation.
        # Unit of work is generic and must be interpreted based on where Progress
        # is used.
        # Corresponds to the JSON property `progressBytes`
        # @return [Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Progress]
        attr_accessor :progress_bytes
      
        # Describes the progress of the operation.
        # Unit of work is generic and must be interpreted based on where Progress
        # is used.
        # Corresponds to the JSON property `progressDocuments`
        # @return [Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Progress]
        attr_accessor :progress_documents
      
        # The time this operation started.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # The state of the operation.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_time = args[:end_time] if args.key?(:end_time)
          @index = args[:index] if args.key?(:index)
          @progress_bytes = args[:progress_bytes] if args.key?(:progress_bytes)
          @progress_documents = args[:progress_documents] if args.key?(:progress_documents)
          @start_time = args[:start_time] if args.key?(:start_time)
          @state = args[:state] if args.key?(:state)
        end
      end
      
      # The response for FirestoreAdmin.ListFields.
      class GoogleFirestoreAdminV1beta2ListFieldsResponse
        include Google::Apis::Core::Hashable
      
        # The requested fields.
        # Corresponds to the JSON property `fields`
        # @return [Array<Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Field>]
        attr_accessor :fields
      
        # A page token that may be used to request another page of results. If blank,
        # this is the last page.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @fields = args[:fields] if args.key?(:fields)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The response for FirestoreAdmin.ListIndexes.
      class GoogleFirestoreAdminV1beta2ListIndexesResponse
        include Google::Apis::Core::Hashable
      
        # The requested indexes.
        # Corresponds to the JSON property `indexes`
        # @return [Array<Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Index>]
        attr_accessor :indexes
      
        # A page token that may be used to request another page of results. If blank,
        # this is the last page.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @indexes = args[:indexes] if args.key?(:indexes)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Describes the progress of the operation.
      # Unit of work is generic and must be interpreted based on where Progress
      # is used.
      class GoogleFirestoreAdminV1beta2Progress
        include Google::Apis::Core::Hashable
      
        # The amount of work completed.
        # Corresponds to the JSON property `completedWork`
        # @return [Fixnum]
        attr_accessor :completed_work
      
        # The amount of work estimated.
        # Corresponds to the JSON property `estimatedWork`
        # @return [Fixnum]
        attr_accessor :estimated_work
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @completed_work = args[:completed_work] if args.key?(:completed_work)
          @estimated_work = args[:estimated_work] if args.key?(:estimated_work)
        end
      end
      
      # This resource represents a long-running operation that is the result of a
      # network API call.
      class GoogleLongrunningOperation
        include Google::Apis::Core::Hashable
      
        # If the value is `false`, it means the operation is still in progress.
        # If `true`, the operation is completed, and either `error` or `response` is
        # available.
        # Corresponds to the JSON property `done`
        # @return [Boolean]
        attr_accessor :done
        alias_method :done?, :done
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::FirestoreV1beta2::Status]
        attr_accessor :error
      
        # Service-specific metadata associated with the operation.  It typically
        # contains progress information and common metadata such as create time.
        # Some services might not provide such metadata.  Any method that returns a
        # long-running operation should document the metadata type, if any.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # The server-assigned name, which is only unique within the same service that
        # originally returns it. If you use the default HTTP mapping, the
        # `name` should be a resource name ending with `operations/`unique_id``.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The normal response of the operation in case of success.  If the original
        # method returns no data on success, such as `Delete`, the response is
        # `google.protobuf.Empty`.  If the original method is standard
        # `Get`/`Create`/`Update`, the response should be the resource.  For other
        # methods, the response should have the type `XxxResponse`, where `Xxx`
        # is the original method name.  For example, if the original method name
        # is `TakeSnapshot()`, the inferred response type is
        # `TakeSnapshotResponse`.
        # Corresponds to the JSON property `response`
        # @return [Hash<String,Object>]
        attr_accessor :response
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @done = args[:done] if args.key?(:done)
          @error = args[:error] if args.key?(:error)
          @metadata = args[:metadata] if args.key?(:metadata)
          @name = args[:name] if args.key?(:name)
          @response = args[:response] if args.key?(:response)
        end
      end
      
      # The `Status` type defines a logical error model that is suitable for
      # different programming environments, including REST APIs and RPC APIs. It is
      # used by [gRPC](https://github.com/grpc). Each `Status` message contains
      # three pieces of data: error code, error message, and error details.
      # You can find out more about this error model and how to work with it in the
      # [API Design Guide](https://cloud.google.com/apis/design/errors).
      class Status
        include Google::Apis::Core::Hashable
      
        # The status code, which should be an enum value of google.rpc.Code.
        # Corresponds to the JSON property `code`
        # @return [Fixnum]
        attr_accessor :code
      
        # A list of messages that carry the error details.  There is a common set of
        # message types for APIs to use.
        # Corresponds to the JSON property `details`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :details
      
        # A developer-facing error message, which should be in English. Any
        # user-facing error message should be localized and sent in the
        # google.rpc.Status.details field, or localized by the client.
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @details = args[:details] if args.key?(:details)
          @message = args[:message] if args.key?(:message)
        end
      end
    end
  end
end
