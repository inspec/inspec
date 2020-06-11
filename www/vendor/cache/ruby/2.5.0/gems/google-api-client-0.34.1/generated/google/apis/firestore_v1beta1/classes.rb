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
    module FirestoreV1beta1
      
      # An array value.
      class ArrayValue
        include Google::Apis::Core::Hashable
      
        # Values in the array.
        # Corresponds to the JSON property `values`
        # @return [Array<Google::Apis::FirestoreV1beta1::Value>]
        attr_accessor :values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @values = args[:values] if args.key?(:values)
        end
      end
      
      # The request for Firestore.BatchGetDocuments.
      class BatchGetDocumentsRequest
        include Google::Apis::Core::Hashable
      
        # The names of the documents to retrieve. In the format:
        # `projects/`project_id`/databases/`database_id`/documents/`document_path``.
        # The request will fail if any of the document is not a child resource of the
        # given `database`. Duplicate names will be elided.
        # Corresponds to the JSON property `documents`
        # @return [Array<String>]
        attr_accessor :documents
      
        # A set of field paths on a document.
        # Used to restrict a get or update operation on a document to a subset of its
        # fields.
        # This is different from standard field masks, as this is always scoped to a
        # Document, and takes in account the dynamic nature of Value.
        # Corresponds to the JSON property `mask`
        # @return [Google::Apis::FirestoreV1beta1::DocumentMask]
        attr_accessor :mask
      
        # Options for creating a new transaction.
        # Corresponds to the JSON property `newTransaction`
        # @return [Google::Apis::FirestoreV1beta1::TransactionOptions]
        attr_accessor :new_transaction
      
        # Reads documents as they were at the given time.
        # This may not be older than 60 seconds.
        # Corresponds to the JSON property `readTime`
        # @return [String]
        attr_accessor :read_time
      
        # Reads documents in a transaction.
        # Corresponds to the JSON property `transaction`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :transaction
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @documents = args[:documents] if args.key?(:documents)
          @mask = args[:mask] if args.key?(:mask)
          @new_transaction = args[:new_transaction] if args.key?(:new_transaction)
          @read_time = args[:read_time] if args.key?(:read_time)
          @transaction = args[:transaction] if args.key?(:transaction)
        end
      end
      
      # The streamed response for Firestore.BatchGetDocuments.
      class BatchGetDocumentsResponse
        include Google::Apis::Core::Hashable
      
        # A Firestore document.
        # Must not exceed 1 MiB - 4 bytes.
        # Corresponds to the JSON property `found`
        # @return [Google::Apis::FirestoreV1beta1::Document]
        attr_accessor :found
      
        # A document name that was requested but does not exist. In the format:
        # `projects/`project_id`/databases/`database_id`/documents/`document_path``.
        # Corresponds to the JSON property `missing`
        # @return [String]
        attr_accessor :missing
      
        # The time at which the document was read.
        # This may be monotically increasing, in this case the previous documents in
        # the result stream are guaranteed not to have changed between their
        # read_time and this one.
        # Corresponds to the JSON property `readTime`
        # @return [String]
        attr_accessor :read_time
      
        # The transaction that was started as part of this request.
        # Will only be set in the first response, and only if
        # BatchGetDocumentsRequest.new_transaction was set in the request.
        # Corresponds to the JSON property `transaction`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :transaction
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @found = args[:found] if args.key?(:found)
          @missing = args[:missing] if args.key?(:missing)
          @read_time = args[:read_time] if args.key?(:read_time)
          @transaction = args[:transaction] if args.key?(:transaction)
        end
      end
      
      # The request for Firestore.BeginTransaction.
      class BeginTransactionRequest
        include Google::Apis::Core::Hashable
      
        # Options for creating a new transaction.
        # Corresponds to the JSON property `options`
        # @return [Google::Apis::FirestoreV1beta1::TransactionOptions]
        attr_accessor :options
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @options = args[:options] if args.key?(:options)
        end
      end
      
      # The response for Firestore.BeginTransaction.
      class BeginTransactionResponse
        include Google::Apis::Core::Hashable
      
        # The transaction that was started.
        # Corresponds to the JSON property `transaction`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :transaction
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @transaction = args[:transaction] if args.key?(:transaction)
        end
      end
      
      # A selection of a collection, such as `messages as m1`.
      class CollectionSelector
        include Google::Apis::Core::Hashable
      
        # When false, selects only collections that are immediate children of
        # the `parent` specified in the containing `RunQueryRequest`.
        # When true, selects all descendant collections.
        # Corresponds to the JSON property `allDescendants`
        # @return [Boolean]
        attr_accessor :all_descendants
        alias_method :all_descendants?, :all_descendants
      
        # The collection ID.
        # When set, selects only collections with this ID.
        # Corresponds to the JSON property `collectionId`
        # @return [String]
        attr_accessor :collection_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @all_descendants = args[:all_descendants] if args.key?(:all_descendants)
          @collection_id = args[:collection_id] if args.key?(:collection_id)
        end
      end
      
      # The request for Firestore.Commit.
      class CommitRequest
        include Google::Apis::Core::Hashable
      
        # If set, applies all writes in this transaction, and commits it.
        # Corresponds to the JSON property `transaction`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :transaction
      
        # The writes to apply.
        # Always executed atomically and in order.
        # Corresponds to the JSON property `writes`
        # @return [Array<Google::Apis::FirestoreV1beta1::Write>]
        attr_accessor :writes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @transaction = args[:transaction] if args.key?(:transaction)
          @writes = args[:writes] if args.key?(:writes)
        end
      end
      
      # The response for Firestore.Commit.
      class CommitResponse
        include Google::Apis::Core::Hashable
      
        # The time at which the commit occurred.
        # Corresponds to the JSON property `commitTime`
        # @return [String]
        attr_accessor :commit_time
      
        # The result of applying the writes.
        # This i-th write result corresponds to the i-th write in the
        # request.
        # Corresponds to the JSON property `writeResults`
        # @return [Array<Google::Apis::FirestoreV1beta1::WriteResult>]
        attr_accessor :write_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @commit_time = args[:commit_time] if args.key?(:commit_time)
          @write_results = args[:write_results] if args.key?(:write_results)
        end
      end
      
      # A filter that merges multiple other filters using the given operator.
      class CompositeFilter
        include Google::Apis::Core::Hashable
      
        # The list of filters to combine.
        # Must contain at least one filter.
        # Corresponds to the JSON property `filters`
        # @return [Array<Google::Apis::FirestoreV1beta1::Filter>]
        attr_accessor :filters
      
        # The operator for combining multiple filters.
        # Corresponds to the JSON property `op`
        # @return [String]
        attr_accessor :op
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @filters = args[:filters] if args.key?(:filters)
          @op = args[:op] if args.key?(:op)
        end
      end
      
      # A position in a query result set.
      class Cursor
        include Google::Apis::Core::Hashable
      
        # If the position is just before or just after the given values, relative
        # to the sort order defined by the query.
        # Corresponds to the JSON property `before`
        # @return [Boolean]
        attr_accessor :before
        alias_method :before?, :before
      
        # The values that represent a position, in the order they appear in
        # the order by clause of a query.
        # Can contain fewer values than specified in the order by clause.
        # Corresponds to the JSON property `values`
        # @return [Array<Google::Apis::FirestoreV1beta1::Value>]
        attr_accessor :values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @before = args[:before] if args.key?(:before)
          @values = args[:values] if args.key?(:values)
        end
      end
      
      # A Firestore document.
      # Must not exceed 1 MiB - 4 bytes.
      class Document
        include Google::Apis::Core::Hashable
      
        # Output only. The time at which the document was created.
        # This value increases monotonically when a document is deleted then
        # recreated. It can also be compared to values from other documents and
        # the `read_time` of a query.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # The document's fields.
        # The map keys represent field names.
        # A simple field name contains only characters `a` to `z`, `A` to `Z`,
        # `0` to `9`, or `_`, and must not start with `0` to `9`. For example,
        # `foo_bar_17`.
        # Field names matching the regular expression `__.*__` are reserved. Reserved
        # field names are forbidden except in certain documented contexts. The map
        # keys, represented as UTF-8, must not exceed 1,500 bytes and cannot be
        # empty.
        # Field paths may be used in other contexts to refer to structured fields
        # defined here. For `map_value`, the field path is represented by the simple
        # or quoted field names of the containing fields, delimited by `.`. For
        # example, the structured field
        # `"foo" : ` map_value: ` "x&y" : ` string_value: "hello" ```` would be
        # represented by the field path `foo.x&y`.
        # Within a field path, a quoted field name starts and ends with `` ` `` and
        # may contain any character. Some characters, including `` ` ``, must be
        # escaped using a `\`. For example, `` `x&y` `` represents `x&y` and
        # `` `bak\`tik` `` represents `` bak`tik ``.
        # Corresponds to the JSON property `fields`
        # @return [Hash<String,Google::Apis::FirestoreV1beta1::Value>]
        attr_accessor :fields
      
        # The resource name of the document, for example
        # `projects/`project_id`/databases/`database_id`/documents/`document_path``.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Output only. The time at which the document was last changed.
        # This value is initially set to the `create_time` then increases
        # monotonically with each change to the document. It can also be
        # compared to values from other documents and the `read_time` of a query.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @fields = args[:fields] if args.key?(:fields)
          @name = args[:name] if args.key?(:name)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # A Document has changed.
      # May be the result of multiple writes, including deletes, that
      # ultimately resulted in a new value for the Document.
      # Multiple DocumentChange messages may be returned for the same logical
      # change, if multiple targets are affected.
      class DocumentChange
        include Google::Apis::Core::Hashable
      
        # A Firestore document.
        # Must not exceed 1 MiB - 4 bytes.
        # Corresponds to the JSON property `document`
        # @return [Google::Apis::FirestoreV1beta1::Document]
        attr_accessor :document
      
        # A set of target IDs for targets that no longer match this document.
        # Corresponds to the JSON property `removedTargetIds`
        # @return [Array<Fixnum>]
        attr_accessor :removed_target_ids
      
        # A set of target IDs of targets that match this document.
        # Corresponds to the JSON property `targetIds`
        # @return [Array<Fixnum>]
        attr_accessor :target_ids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @document = args[:document] if args.key?(:document)
          @removed_target_ids = args[:removed_target_ids] if args.key?(:removed_target_ids)
          @target_ids = args[:target_ids] if args.key?(:target_ids)
        end
      end
      
      # A Document has been deleted.
      # May be the result of multiple writes, including updates, the
      # last of which deleted the Document.
      # Multiple DocumentDelete messages may be returned for the same logical
      # delete, if multiple targets are affected.
      class DocumentDelete
        include Google::Apis::Core::Hashable
      
        # The resource name of the Document that was deleted.
        # Corresponds to the JSON property `document`
        # @return [String]
        attr_accessor :document
      
        # The read timestamp at which the delete was observed.
        # Greater or equal to the `commit_time` of the delete.
        # Corresponds to the JSON property `readTime`
        # @return [String]
        attr_accessor :read_time
      
        # A set of target IDs for targets that previously matched this entity.
        # Corresponds to the JSON property `removedTargetIds`
        # @return [Array<Fixnum>]
        attr_accessor :removed_target_ids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @document = args[:document] if args.key?(:document)
          @read_time = args[:read_time] if args.key?(:read_time)
          @removed_target_ids = args[:removed_target_ids] if args.key?(:removed_target_ids)
        end
      end
      
      # A set of field paths on a document.
      # Used to restrict a get or update operation on a document to a subset of its
      # fields.
      # This is different from standard field masks, as this is always scoped to a
      # Document, and takes in account the dynamic nature of Value.
      class DocumentMask
        include Google::Apis::Core::Hashable
      
        # The list of field paths in the mask. See Document.fields for a field
        # path syntax reference.
        # Corresponds to the JSON property `fieldPaths`
        # @return [Array<String>]
        attr_accessor :field_paths
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @field_paths = args[:field_paths] if args.key?(:field_paths)
        end
      end
      
      # A Document has been removed from the view of the targets.
      # Sent if the document is no longer relevant to a target and is out of view.
      # Can be sent instead of a DocumentDelete or a DocumentChange if the server
      # can not send the new value of the document.
      # Multiple DocumentRemove messages may be returned for the same logical
      # write or delete, if multiple targets are affected.
      class DocumentRemove
        include Google::Apis::Core::Hashable
      
        # The resource name of the Document that has gone out of view.
        # Corresponds to the JSON property `document`
        # @return [String]
        attr_accessor :document
      
        # The read timestamp at which the remove was observed.
        # Greater or equal to the `commit_time` of the change/delete/remove.
        # Corresponds to the JSON property `readTime`
        # @return [String]
        attr_accessor :read_time
      
        # A set of target IDs for targets that previously matched this document.
        # Corresponds to the JSON property `removedTargetIds`
        # @return [Array<Fixnum>]
        attr_accessor :removed_target_ids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @document = args[:document] if args.key?(:document)
          @read_time = args[:read_time] if args.key?(:read_time)
          @removed_target_ids = args[:removed_target_ids] if args.key?(:removed_target_ids)
        end
      end
      
      # A transformation of a document.
      class DocumentTransform
        include Google::Apis::Core::Hashable
      
        # The name of the document to transform.
        # Corresponds to the JSON property `document`
        # @return [String]
        attr_accessor :document
      
        # The list of transformations to apply to the fields of the document, in
        # order.
        # This must not be empty.
        # Corresponds to the JSON property `fieldTransforms`
        # @return [Array<Google::Apis::FirestoreV1beta1::FieldTransform>]
        attr_accessor :field_transforms
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @document = args[:document] if args.key?(:document)
          @field_transforms = args[:field_transforms] if args.key?(:field_transforms)
        end
      end
      
      # A target specified by a set of documents names.
      class DocumentsTarget
        include Google::Apis::Core::Hashable
      
        # The names of the documents to retrieve. In the format:
        # `projects/`project_id`/databases/`database_id`/documents/`document_path``.
        # The request will fail if any of the document is not a child resource of
        # the given `database`. Duplicate names will be elided.
        # Corresponds to the JSON property `documents`
        # @return [Array<String>]
        attr_accessor :documents
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @documents = args[:documents] if args.key?(:documents)
        end
      end
      
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
      
      # A digest of all the documents that match a given target.
      class ExistenceFilter
        include Google::Apis::Core::Hashable
      
        # The total count of documents that match target_id.
        # If different from the count of documents in the client that match, the
        # client must manually determine which documents no longer match the target.
        # Corresponds to the JSON property `count`
        # @return [Fixnum]
        attr_accessor :count
      
        # The target ID to which this filter applies.
        # Corresponds to the JSON property `targetId`
        # @return [Fixnum]
        attr_accessor :target_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @count = args[:count] if args.key?(:count)
          @target_id = args[:target_id] if args.key?(:target_id)
        end
      end
      
      # A filter on a specific field.
      class FieldFilter
        include Google::Apis::Core::Hashable
      
        # A reference to a field, such as `max(messages.time) as max_time`.
        # Corresponds to the JSON property `field`
        # @return [Google::Apis::FirestoreV1beta1::FieldReference]
        attr_accessor :field
      
        # The operator to filter by.
        # Corresponds to the JSON property `op`
        # @return [String]
        attr_accessor :op
      
        # A message that can hold any of the supported value types.
        # Corresponds to the JSON property `value`
        # @return [Google::Apis::FirestoreV1beta1::Value]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @field = args[:field] if args.key?(:field)
          @op = args[:op] if args.key?(:op)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # A reference to a field, such as `max(messages.time) as max_time`.
      class FieldReference
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `fieldPath`
        # @return [String]
        attr_accessor :field_path
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @field_path = args[:field_path] if args.key?(:field_path)
        end
      end
      
      # A transformation of a field of the document.
      class FieldTransform
        include Google::Apis::Core::Hashable
      
        # An array value.
        # Corresponds to the JSON property `appendMissingElements`
        # @return [Google::Apis::FirestoreV1beta1::ArrayValue]
        attr_accessor :append_missing_elements
      
        # The path of the field. See Document.fields for the field path syntax
        # reference.
        # Corresponds to the JSON property `fieldPath`
        # @return [String]
        attr_accessor :field_path
      
        # A message that can hold any of the supported value types.
        # Corresponds to the JSON property `increment`
        # @return [Google::Apis::FirestoreV1beta1::Value]
        attr_accessor :increment
      
        # A message that can hold any of the supported value types.
        # Corresponds to the JSON property `maximum`
        # @return [Google::Apis::FirestoreV1beta1::Value]
        attr_accessor :maximum
      
        # A message that can hold any of the supported value types.
        # Corresponds to the JSON property `minimum`
        # @return [Google::Apis::FirestoreV1beta1::Value]
        attr_accessor :minimum
      
        # An array value.
        # Corresponds to the JSON property `removeAllFromArray`
        # @return [Google::Apis::FirestoreV1beta1::ArrayValue]
        attr_accessor :remove_all_from_array
      
        # Sets the field to the given server value.
        # Corresponds to the JSON property `setToServerValue`
        # @return [String]
        attr_accessor :set_to_server_value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @append_missing_elements = args[:append_missing_elements] if args.key?(:append_missing_elements)
          @field_path = args[:field_path] if args.key?(:field_path)
          @increment = args[:increment] if args.key?(:increment)
          @maximum = args[:maximum] if args.key?(:maximum)
          @minimum = args[:minimum] if args.key?(:minimum)
          @remove_all_from_array = args[:remove_all_from_array] if args.key?(:remove_all_from_array)
          @set_to_server_value = args[:set_to_server_value] if args.key?(:set_to_server_value)
        end
      end
      
      # A filter.
      class Filter
        include Google::Apis::Core::Hashable
      
        # A filter that merges multiple other filters using the given operator.
        # Corresponds to the JSON property `compositeFilter`
        # @return [Google::Apis::FirestoreV1beta1::CompositeFilter]
        attr_accessor :composite_filter
      
        # A filter on a specific field.
        # Corresponds to the JSON property `fieldFilter`
        # @return [Google::Apis::FirestoreV1beta1::FieldFilter]
        attr_accessor :field_filter
      
        # A filter with a single operand.
        # Corresponds to the JSON property `unaryFilter`
        # @return [Google::Apis::FirestoreV1beta1::UnaryFilter]
        attr_accessor :unary_filter
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @composite_filter = args[:composite_filter] if args.key?(:composite_filter)
          @field_filter = args[:field_filter] if args.key?(:field_filter)
          @unary_filter = args[:unary_filter] if args.key?(:unary_filter)
        end
      end
      
      # Metadata for ExportDocuments operations.
      class GoogleFirestoreAdminV1beta1ExportDocumentsMetadata
        include Google::Apis::Core::Hashable
      
        # Which collection ids are being exported.
        # Corresponds to the JSON property `collectionIds`
        # @return [Array<String>]
        attr_accessor :collection_ids
      
        # The time the operation ended, either successfully or otherwise. Unset if
        # the operation is still active.
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
      
        # Measures the progress of a particular metric.
        # Corresponds to the JSON property `progressBytes`
        # @return [Google::Apis::FirestoreV1beta1::GoogleFirestoreAdminV1beta1Progress]
        attr_accessor :progress_bytes
      
        # Measures the progress of a particular metric.
        # Corresponds to the JSON property `progressDocuments`
        # @return [Google::Apis::FirestoreV1beta1::GoogleFirestoreAdminV1beta1Progress]
        attr_accessor :progress_documents
      
        # The time that work began on the operation.
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
      class GoogleFirestoreAdminV1beta1ExportDocumentsRequest
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
      class GoogleFirestoreAdminV1beta1ExportDocumentsResponse
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
      
      # Metadata for ImportDocuments operations.
      class GoogleFirestoreAdminV1beta1ImportDocumentsMetadata
        include Google::Apis::Core::Hashable
      
        # Which collection ids are being imported.
        # Corresponds to the JSON property `collectionIds`
        # @return [Array<String>]
        attr_accessor :collection_ids
      
        # The time the operation ended, either successfully or otherwise. Unset if
        # the operation is still active.
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
      
        # Measures the progress of a particular metric.
        # Corresponds to the JSON property `progressBytes`
        # @return [Google::Apis::FirestoreV1beta1::GoogleFirestoreAdminV1beta1Progress]
        attr_accessor :progress_bytes
      
        # Measures the progress of a particular metric.
        # Corresponds to the JSON property `progressDocuments`
        # @return [Google::Apis::FirestoreV1beta1::GoogleFirestoreAdminV1beta1Progress]
        attr_accessor :progress_documents
      
        # The time that work began on the operation.
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
      class GoogleFirestoreAdminV1beta1ImportDocumentsRequest
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
        # google.firestore.admin.v1beta1.ExportDocumentsResponse.output_uri_prefix.
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
      
      # An index definition.
      class GoogleFirestoreAdminV1beta1Index
        include Google::Apis::Core::Hashable
      
        # The collection ID to which this index applies. Required.
        # Corresponds to the JSON property `collectionId`
        # @return [String]
        attr_accessor :collection_id
      
        # The fields to index.
        # Corresponds to the JSON property `fields`
        # @return [Array<Google::Apis::FirestoreV1beta1::GoogleFirestoreAdminV1beta1IndexField>]
        attr_accessor :fields
      
        # The resource name of the index.
        # Output only.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The state of the index.
        # Output only.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @collection_id = args[:collection_id] if args.key?(:collection_id)
          @fields = args[:fields] if args.key?(:fields)
          @name = args[:name] if args.key?(:name)
          @state = args[:state] if args.key?(:state)
        end
      end
      
      # A field of an index.
      class GoogleFirestoreAdminV1beta1IndexField
        include Google::Apis::Core::Hashable
      
        # The path of the field. Must match the field path specification described
        # by google.firestore.v1beta1.Document.fields.
        # Special field path `__name__` may be used by itself or at the end of a
        # path. `__type__` may be used only at the end of path.
        # Corresponds to the JSON property `fieldPath`
        # @return [String]
        attr_accessor :field_path
      
        # The field's mode.
        # Corresponds to the JSON property `mode`
        # @return [String]
        attr_accessor :mode
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @field_path = args[:field_path] if args.key?(:field_path)
          @mode = args[:mode] if args.key?(:mode)
        end
      end
      
      # Metadata for index operations. This metadata populates
      # the metadata field of google.longrunning.Operation.
      class GoogleFirestoreAdminV1beta1IndexOperationMetadata
        include Google::Apis::Core::Hashable
      
        # True if the [google.longrunning.Operation] was cancelled. If the
        # cancellation is in progress, cancelled will be true but
        # google.longrunning.Operation.done will be false.
        # Corresponds to the JSON property `cancelled`
        # @return [Boolean]
        attr_accessor :cancelled
        alias_method :cancelled?, :cancelled
      
        # Measures the progress of a particular metric.
        # Corresponds to the JSON property `documentProgress`
        # @return [Google::Apis::FirestoreV1beta1::GoogleFirestoreAdminV1beta1Progress]
        attr_accessor :document_progress
      
        # The time the operation ended, either successfully or otherwise. Unset if
        # the operation is still active.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # The index resource that this operation is acting on. For example:
        # `projects/`project_id`/databases/`database_id`/indexes/`index_id``
        # Corresponds to the JSON property `index`
        # @return [String]
        attr_accessor :index
      
        # The type of index operation.
        # Corresponds to the JSON property `operationType`
        # @return [String]
        attr_accessor :operation_type
      
        # The time that work began on the operation.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cancelled = args[:cancelled] if args.key?(:cancelled)
          @document_progress = args[:document_progress] if args.key?(:document_progress)
          @end_time = args[:end_time] if args.key?(:end_time)
          @index = args[:index] if args.key?(:index)
          @operation_type = args[:operation_type] if args.key?(:operation_type)
          @start_time = args[:start_time] if args.key?(:start_time)
        end
      end
      
      # The response for FirestoreAdmin.ListIndexes.
      class GoogleFirestoreAdminV1beta1ListIndexesResponse
        include Google::Apis::Core::Hashable
      
        # The indexes.
        # Corresponds to the JSON property `indexes`
        # @return [Array<Google::Apis::FirestoreV1beta1::GoogleFirestoreAdminV1beta1Index>]
        attr_accessor :indexes
      
        # The standard List next-page token.
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
      
      # The metadata message for google.cloud.location.Location.metadata.
      class GoogleFirestoreAdminV1beta1LocationMetadata
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Measures the progress of a particular metric.
      class GoogleFirestoreAdminV1beta1Progress
        include Google::Apis::Core::Hashable
      
        # An estimate of how much work has been completed. Note that this may be
        # greater than `work_estimated`.
        # Corresponds to the JSON property `workCompleted`
        # @return [Fixnum]
        attr_accessor :work_completed
      
        # An estimate of how much work needs to be performed. Zero if the
        # work estimate is unavailable. May change as work progresses.
        # Corresponds to the JSON property `workEstimated`
        # @return [Fixnum]
        attr_accessor :work_estimated
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @work_completed = args[:work_completed] if args.key?(:work_completed)
          @work_estimated = args[:work_estimated] if args.key?(:work_estimated)
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
        # @return [Google::Apis::FirestoreV1beta1::Status]
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
      
      # An object representing a latitude/longitude pair. This is expressed as a pair
      # of doubles representing degrees latitude and degrees longitude. Unless
      # specified otherwise, this must conform to the
      # <a href="http://www.unoosa.org/pdf/icg/2012/template/WGS_84.pdf">WGS84
      # standard</a>. Values must be within normalized ranges.
      class LatLng
        include Google::Apis::Core::Hashable
      
        # The latitude in degrees. It must be in the range [-90.0, +90.0].
        # Corresponds to the JSON property `latitude`
        # @return [Float]
        attr_accessor :latitude
      
        # The longitude in degrees. It must be in the range [-180.0, +180.0].
        # Corresponds to the JSON property `longitude`
        # @return [Float]
        attr_accessor :longitude
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @latitude = args[:latitude] if args.key?(:latitude)
          @longitude = args[:longitude] if args.key?(:longitude)
        end
      end
      
      # The request for Firestore.ListCollectionIds.
      class ListCollectionIdsRequest
        include Google::Apis::Core::Hashable
      
        # The maximum number of results to return.
        # Corresponds to the JSON property `pageSize`
        # @return [Fixnum]
        attr_accessor :page_size
      
        # A page token. Must be a value from
        # ListCollectionIdsResponse.
        # Corresponds to the JSON property `pageToken`
        # @return [String]
        attr_accessor :page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @page_size = args[:page_size] if args.key?(:page_size)
          @page_token = args[:page_token] if args.key?(:page_token)
        end
      end
      
      # The response from Firestore.ListCollectionIds.
      class ListCollectionIdsResponse
        include Google::Apis::Core::Hashable
      
        # The collection ids.
        # Corresponds to the JSON property `collectionIds`
        # @return [Array<String>]
        attr_accessor :collection_ids
      
        # A page token that may be used to continue the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @collection_ids = args[:collection_ids] if args.key?(:collection_ids)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The response for Firestore.ListDocuments.
      class ListDocumentsResponse
        include Google::Apis::Core::Hashable
      
        # The Documents found.
        # Corresponds to the JSON property `documents`
        # @return [Array<Google::Apis::FirestoreV1beta1::Document>]
        attr_accessor :documents
      
        # The next page token.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @documents = args[:documents] if args.key?(:documents)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # A request for Firestore.Listen
      class ListenRequest
        include Google::Apis::Core::Hashable
      
        # A specification of a set of documents to listen to.
        # Corresponds to the JSON property `addTarget`
        # @return [Google::Apis::FirestoreV1beta1::Target]
        attr_accessor :add_target
      
        # Labels associated with this target change.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # The ID of a target to remove from this stream.
        # Corresponds to the JSON property `removeTarget`
        # @return [Fixnum]
        attr_accessor :remove_target
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @add_target = args[:add_target] if args.key?(:add_target)
          @labels = args[:labels] if args.key?(:labels)
          @remove_target = args[:remove_target] if args.key?(:remove_target)
        end
      end
      
      # The response for Firestore.Listen.
      class ListenResponse
        include Google::Apis::Core::Hashable
      
        # A Document has changed.
        # May be the result of multiple writes, including deletes, that
        # ultimately resulted in a new value for the Document.
        # Multiple DocumentChange messages may be returned for the same logical
        # change, if multiple targets are affected.
        # Corresponds to the JSON property `documentChange`
        # @return [Google::Apis::FirestoreV1beta1::DocumentChange]
        attr_accessor :document_change
      
        # A Document has been deleted.
        # May be the result of multiple writes, including updates, the
        # last of which deleted the Document.
        # Multiple DocumentDelete messages may be returned for the same logical
        # delete, if multiple targets are affected.
        # Corresponds to the JSON property `documentDelete`
        # @return [Google::Apis::FirestoreV1beta1::DocumentDelete]
        attr_accessor :document_delete
      
        # A Document has been removed from the view of the targets.
        # Sent if the document is no longer relevant to a target and is out of view.
        # Can be sent instead of a DocumentDelete or a DocumentChange if the server
        # can not send the new value of the document.
        # Multiple DocumentRemove messages may be returned for the same logical
        # write or delete, if multiple targets are affected.
        # Corresponds to the JSON property `documentRemove`
        # @return [Google::Apis::FirestoreV1beta1::DocumentRemove]
        attr_accessor :document_remove
      
        # A digest of all the documents that match a given target.
        # Corresponds to the JSON property `filter`
        # @return [Google::Apis::FirestoreV1beta1::ExistenceFilter]
        attr_accessor :filter
      
        # Targets being watched have changed.
        # Corresponds to the JSON property `targetChange`
        # @return [Google::Apis::FirestoreV1beta1::TargetChange]
        attr_accessor :target_change
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @document_change = args[:document_change] if args.key?(:document_change)
          @document_delete = args[:document_delete] if args.key?(:document_delete)
          @document_remove = args[:document_remove] if args.key?(:document_remove)
          @filter = args[:filter] if args.key?(:filter)
          @target_change = args[:target_change] if args.key?(:target_change)
        end
      end
      
      # A map value.
      class MapValue
        include Google::Apis::Core::Hashable
      
        # The map's fields.
        # The map keys represent field names. Field names matching the regular
        # expression `__.*__` are reserved. Reserved field names are forbidden except
        # in certain documented contexts. The map keys, represented as UTF-8, must
        # not exceed 1,500 bytes and cannot be empty.
        # Corresponds to the JSON property `fields`
        # @return [Hash<String,Google::Apis::FirestoreV1beta1::Value>]
        attr_accessor :fields
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @fields = args[:fields] if args.key?(:fields)
        end
      end
      
      # An order on a field.
      class Order
        include Google::Apis::Core::Hashable
      
        # The direction to order by. Defaults to `ASCENDING`.
        # Corresponds to the JSON property `direction`
        # @return [String]
        attr_accessor :direction
      
        # A reference to a field, such as `max(messages.time) as max_time`.
        # Corresponds to the JSON property `field`
        # @return [Google::Apis::FirestoreV1beta1::FieldReference]
        attr_accessor :field
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @direction = args[:direction] if args.key?(:direction)
          @field = args[:field] if args.key?(:field)
        end
      end
      
      # A precondition on a document, used for conditional operations.
      class Precondition
        include Google::Apis::Core::Hashable
      
        # When set to `true`, the target document must exist.
        # When set to `false`, the target document must not exist.
        # Corresponds to the JSON property `exists`
        # @return [Boolean]
        attr_accessor :exists
        alias_method :exists?, :exists
      
        # When set, the target document must exist and have been last updated at
        # that time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @exists = args[:exists] if args.key?(:exists)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # The projection of document's fields to return.
      class Projection
        include Google::Apis::Core::Hashable
      
        # The fields to return.
        # If empty, all fields are returned. To only return the name
        # of the document, use `['__name__']`.
        # Corresponds to the JSON property `fields`
        # @return [Array<Google::Apis::FirestoreV1beta1::FieldReference>]
        attr_accessor :fields
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @fields = args[:fields] if args.key?(:fields)
        end
      end
      
      # A target specified by a query.
      class QueryTarget
        include Google::Apis::Core::Hashable
      
        # The parent resource name. In the format:
        # `projects/`project_id`/databases/`database_id`/documents` or
        # `projects/`project_id`/databases/`database_id`/documents/`document_path``.
        # For example:
        # `projects/my-project/databases/my-database/documents` or
        # `projects/my-project/databases/my-database/documents/chatrooms/my-chatroom`
        # Corresponds to the JSON property `parent`
        # @return [String]
        attr_accessor :parent
      
        # A Firestore query.
        # Corresponds to the JSON property `structuredQuery`
        # @return [Google::Apis::FirestoreV1beta1::StructuredQuery]
        attr_accessor :structured_query
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @parent = args[:parent] if args.key?(:parent)
          @structured_query = args[:structured_query] if args.key?(:structured_query)
        end
      end
      
      # Options for a transaction that can only be used to read documents.
      class ReadOnly
        include Google::Apis::Core::Hashable
      
        # Reads documents at the given time.
        # This may not be older than 60 seconds.
        # Corresponds to the JSON property `readTime`
        # @return [String]
        attr_accessor :read_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @read_time = args[:read_time] if args.key?(:read_time)
        end
      end
      
      # Options for a transaction that can be used to read and write documents.
      class ReadWrite
        include Google::Apis::Core::Hashable
      
        # An optional transaction to retry.
        # Corresponds to the JSON property `retryTransaction`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :retry_transaction
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @retry_transaction = args[:retry_transaction] if args.key?(:retry_transaction)
        end
      end
      
      # The request for Firestore.Rollback.
      class RollbackRequest
        include Google::Apis::Core::Hashable
      
        # The transaction to roll back.
        # Corresponds to the JSON property `transaction`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :transaction
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @transaction = args[:transaction] if args.key?(:transaction)
        end
      end
      
      # The request for Firestore.RunQuery.
      class RunQueryRequest
        include Google::Apis::Core::Hashable
      
        # Options for creating a new transaction.
        # Corresponds to the JSON property `newTransaction`
        # @return [Google::Apis::FirestoreV1beta1::TransactionOptions]
        attr_accessor :new_transaction
      
        # Reads documents as they were at the given time.
        # This may not be older than 60 seconds.
        # Corresponds to the JSON property `readTime`
        # @return [String]
        attr_accessor :read_time
      
        # A Firestore query.
        # Corresponds to the JSON property `structuredQuery`
        # @return [Google::Apis::FirestoreV1beta1::StructuredQuery]
        attr_accessor :structured_query
      
        # Reads documents in a transaction.
        # Corresponds to the JSON property `transaction`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :transaction
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @new_transaction = args[:new_transaction] if args.key?(:new_transaction)
          @read_time = args[:read_time] if args.key?(:read_time)
          @structured_query = args[:structured_query] if args.key?(:structured_query)
          @transaction = args[:transaction] if args.key?(:transaction)
        end
      end
      
      # The response for Firestore.RunQuery.
      class RunQueryResponse
        include Google::Apis::Core::Hashable
      
        # A Firestore document.
        # Must not exceed 1 MiB - 4 bytes.
        # Corresponds to the JSON property `document`
        # @return [Google::Apis::FirestoreV1beta1::Document]
        attr_accessor :document
      
        # The time at which the document was read. This may be monotonically
        # increasing; in this case, the previous documents in the result stream are
        # guaranteed not to have changed between their `read_time` and this one.
        # If the query returns no results, a response with `read_time` and no
        # `document` will be sent, and this represents the time at which the query
        # was run.
        # Corresponds to the JSON property `readTime`
        # @return [String]
        attr_accessor :read_time
      
        # The number of results that have been skipped due to an offset between
        # the last response and the current response.
        # Corresponds to the JSON property `skippedResults`
        # @return [Fixnum]
        attr_accessor :skipped_results
      
        # The transaction that was started as part of this request.
        # Can only be set in the first response, and only if
        # RunQueryRequest.new_transaction was set in the request.
        # If set, no other fields will be set in this response.
        # Corresponds to the JSON property `transaction`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :transaction
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @document = args[:document] if args.key?(:document)
          @read_time = args[:read_time] if args.key?(:read_time)
          @skipped_results = args[:skipped_results] if args.key?(:skipped_results)
          @transaction = args[:transaction] if args.key?(:transaction)
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
      
      # A Firestore query.
      class StructuredQuery
        include Google::Apis::Core::Hashable
      
        # A position in a query result set.
        # Corresponds to the JSON property `endAt`
        # @return [Google::Apis::FirestoreV1beta1::Cursor]
        attr_accessor :end_at
      
        # The collections to query.
        # Corresponds to the JSON property `from`
        # @return [Array<Google::Apis::FirestoreV1beta1::CollectionSelector>]
        attr_accessor :from
      
        # The maximum number of results to return.
        # Applies after all other constraints.
        # Must be >= 0 if specified.
        # Corresponds to the JSON property `limit`
        # @return [Fixnum]
        attr_accessor :limit
      
        # The number of results to skip.
        # Applies before limit, but after all other constraints. Must be >= 0 if
        # specified.
        # Corresponds to the JSON property `offset`
        # @return [Fixnum]
        attr_accessor :offset
      
        # The order to apply to the query results.
        # Firestore guarantees a stable ordering through the following rules:
        # * Any field required to appear in `order_by`, that is not already
        # specified in `order_by`, is appended to the order in field name order
        # by default.
        # * If an order on `__name__` is not specified, it is appended by default.
        # Fields are appended with the same sort direction as the last order
        # specified, or 'ASCENDING' if no order was specified. For example:
        # * `SELECT * FROM Foo ORDER BY A` becomes
        # `SELECT * FROM Foo ORDER BY A, __name__`
        # * `SELECT * FROM Foo ORDER BY A DESC` becomes
        # `SELECT * FROM Foo ORDER BY A DESC, __name__ DESC`
        # * `SELECT * FROM Foo WHERE A > 1` becomes
        # `SELECT * FROM Foo WHERE A > 1 ORDER BY A, __name__`
        # Corresponds to the JSON property `orderBy`
        # @return [Array<Google::Apis::FirestoreV1beta1::Order>]
        attr_accessor :order_by
      
        # The projection of document's fields to return.
        # Corresponds to the JSON property `select`
        # @return [Google::Apis::FirestoreV1beta1::Projection]
        attr_accessor :select
      
        # A position in a query result set.
        # Corresponds to the JSON property `startAt`
        # @return [Google::Apis::FirestoreV1beta1::Cursor]
        attr_accessor :start_at
      
        # A filter.
        # Corresponds to the JSON property `where`
        # @return [Google::Apis::FirestoreV1beta1::Filter]
        attr_accessor :where
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_at = args[:end_at] if args.key?(:end_at)
          @from = args[:from] if args.key?(:from)
          @limit = args[:limit] if args.key?(:limit)
          @offset = args[:offset] if args.key?(:offset)
          @order_by = args[:order_by] if args.key?(:order_by)
          @select = args[:select] if args.key?(:select)
          @start_at = args[:start_at] if args.key?(:start_at)
          @where = args[:where] if args.key?(:where)
        end
      end
      
      # A specification of a set of documents to listen to.
      class Target
        include Google::Apis::Core::Hashable
      
        # A target specified by a set of documents names.
        # Corresponds to the JSON property `documents`
        # @return [Google::Apis::FirestoreV1beta1::DocumentsTarget]
        attr_accessor :documents
      
        # If the target should be removed once it is current and consistent.
        # Corresponds to the JSON property `once`
        # @return [Boolean]
        attr_accessor :once
        alias_method :once?, :once
      
        # A target specified by a query.
        # Corresponds to the JSON property `query`
        # @return [Google::Apis::FirestoreV1beta1::QueryTarget]
        attr_accessor :query
      
        # Start listening after a specific `read_time`.
        # The client must know the state of matching documents at this time.
        # Corresponds to the JSON property `readTime`
        # @return [String]
        attr_accessor :read_time
      
        # A resume token from a prior TargetChange for an identical target.
        # Using a resume token with a different target is unsupported and may fail.
        # Corresponds to the JSON property `resumeToken`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :resume_token
      
        # The target ID that identifies the target on the stream. Must be a positive
        # number and non-zero.
        # Corresponds to the JSON property `targetId`
        # @return [Fixnum]
        attr_accessor :target_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @documents = args[:documents] if args.key?(:documents)
          @once = args[:once] if args.key?(:once)
          @query = args[:query] if args.key?(:query)
          @read_time = args[:read_time] if args.key?(:read_time)
          @resume_token = args[:resume_token] if args.key?(:resume_token)
          @target_id = args[:target_id] if args.key?(:target_id)
        end
      end
      
      # Targets being watched have changed.
      class TargetChange
        include Google::Apis::Core::Hashable
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `cause`
        # @return [Google::Apis::FirestoreV1beta1::Status]
        attr_accessor :cause
      
        # The consistent `read_time` for the given `target_ids` (omitted when the
        # target_ids are not at a consistent snapshot).
        # The stream is guaranteed to send a `read_time` with `target_ids` empty
        # whenever the entire stream reaches a new consistent snapshot. ADD,
        # CURRENT, and RESET messages are guaranteed to (eventually) result in a
        # new consistent snapshot (while NO_CHANGE and REMOVE messages are not).
        # For a given stream, `read_time` is guaranteed to be monotonically
        # increasing.
        # Corresponds to the JSON property `readTime`
        # @return [String]
        attr_accessor :read_time
      
        # A token that can be used to resume the stream for the given `target_ids`,
        # or all targets if `target_ids` is empty.
        # Not set on every target change.
        # Corresponds to the JSON property `resumeToken`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :resume_token
      
        # The type of change that occurred.
        # Corresponds to the JSON property `targetChangeType`
        # @return [String]
        attr_accessor :target_change_type
      
        # The target IDs of targets that have changed.
        # If empty, the change applies to all targets.
        # The order of the target IDs is not defined.
        # Corresponds to the JSON property `targetIds`
        # @return [Array<Fixnum>]
        attr_accessor :target_ids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cause = args[:cause] if args.key?(:cause)
          @read_time = args[:read_time] if args.key?(:read_time)
          @resume_token = args[:resume_token] if args.key?(:resume_token)
          @target_change_type = args[:target_change_type] if args.key?(:target_change_type)
          @target_ids = args[:target_ids] if args.key?(:target_ids)
        end
      end
      
      # Options for creating a new transaction.
      class TransactionOptions
        include Google::Apis::Core::Hashable
      
        # Options for a transaction that can only be used to read documents.
        # Corresponds to the JSON property `readOnly`
        # @return [Google::Apis::FirestoreV1beta1::ReadOnly]
        attr_accessor :read_only
      
        # Options for a transaction that can be used to read and write documents.
        # Corresponds to the JSON property `readWrite`
        # @return [Google::Apis::FirestoreV1beta1::ReadWrite]
        attr_accessor :read_write
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @read_only = args[:read_only] if args.key?(:read_only)
          @read_write = args[:read_write] if args.key?(:read_write)
        end
      end
      
      # A filter with a single operand.
      class UnaryFilter
        include Google::Apis::Core::Hashable
      
        # A reference to a field, such as `max(messages.time) as max_time`.
        # Corresponds to the JSON property `field`
        # @return [Google::Apis::FirestoreV1beta1::FieldReference]
        attr_accessor :field
      
        # The unary operator to apply.
        # Corresponds to the JSON property `op`
        # @return [String]
        attr_accessor :op
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @field = args[:field] if args.key?(:field)
          @op = args[:op] if args.key?(:op)
        end
      end
      
      # A message that can hold any of the supported value types.
      class Value
        include Google::Apis::Core::Hashable
      
        # An array value.
        # Corresponds to the JSON property `arrayValue`
        # @return [Google::Apis::FirestoreV1beta1::ArrayValue]
        attr_accessor :array_value
      
        # A boolean value.
        # Corresponds to the JSON property `booleanValue`
        # @return [Boolean]
        attr_accessor :boolean_value
        alias_method :boolean_value?, :boolean_value
      
        # A bytes value.
        # Must not exceed 1 MiB - 89 bytes.
        # Only the first 1,500 bytes are considered by queries.
        # Corresponds to the JSON property `bytesValue`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :bytes_value
      
        # A double value.
        # Corresponds to the JSON property `doubleValue`
        # @return [Float]
        attr_accessor :double_value
      
        # An object representing a latitude/longitude pair. This is expressed as a pair
        # of doubles representing degrees latitude and degrees longitude. Unless
        # specified otherwise, this must conform to the
        # <a href="http://www.unoosa.org/pdf/icg/2012/template/WGS_84.pdf">WGS84
        # standard</a>. Values must be within normalized ranges.
        # Corresponds to the JSON property `geoPointValue`
        # @return [Google::Apis::FirestoreV1beta1::LatLng]
        attr_accessor :geo_point_value
      
        # An integer value.
        # Corresponds to the JSON property `integerValue`
        # @return [Fixnum]
        attr_accessor :integer_value
      
        # A map value.
        # Corresponds to the JSON property `mapValue`
        # @return [Google::Apis::FirestoreV1beta1::MapValue]
        attr_accessor :map_value
      
        # A null value.
        # Corresponds to the JSON property `nullValue`
        # @return [String]
        attr_accessor :null_value
      
        # A reference to a document. For example:
        # `projects/`project_id`/databases/`database_id`/documents/`document_path``.
        # Corresponds to the JSON property `referenceValue`
        # @return [String]
        attr_accessor :reference_value
      
        # A string value.
        # The string, represented as UTF-8, must not exceed 1 MiB - 89 bytes.
        # Only the first 1,500 bytes of the UTF-8 representation are considered by
        # queries.
        # Corresponds to the JSON property `stringValue`
        # @return [String]
        attr_accessor :string_value
      
        # A timestamp value.
        # Precise only to microseconds. When stored, any additional precision is
        # rounded down.
        # Corresponds to the JSON property `timestampValue`
        # @return [String]
        attr_accessor :timestamp_value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @array_value = args[:array_value] if args.key?(:array_value)
          @boolean_value = args[:boolean_value] if args.key?(:boolean_value)
          @bytes_value = args[:bytes_value] if args.key?(:bytes_value)
          @double_value = args[:double_value] if args.key?(:double_value)
          @geo_point_value = args[:geo_point_value] if args.key?(:geo_point_value)
          @integer_value = args[:integer_value] if args.key?(:integer_value)
          @map_value = args[:map_value] if args.key?(:map_value)
          @null_value = args[:null_value] if args.key?(:null_value)
          @reference_value = args[:reference_value] if args.key?(:reference_value)
          @string_value = args[:string_value] if args.key?(:string_value)
          @timestamp_value = args[:timestamp_value] if args.key?(:timestamp_value)
        end
      end
      
      # A write on a document.
      class Write
        include Google::Apis::Core::Hashable
      
        # A precondition on a document, used for conditional operations.
        # Corresponds to the JSON property `currentDocument`
        # @return [Google::Apis::FirestoreV1beta1::Precondition]
        attr_accessor :current_document
      
        # A document name to delete. In the format:
        # `projects/`project_id`/databases/`database_id`/documents/`document_path``.
        # Corresponds to the JSON property `delete`
        # @return [String]
        attr_accessor :delete
      
        # A transformation of a document.
        # Corresponds to the JSON property `transform`
        # @return [Google::Apis::FirestoreV1beta1::DocumentTransform]
        attr_accessor :transform
      
        # A Firestore document.
        # Must not exceed 1 MiB - 4 bytes.
        # Corresponds to the JSON property `update`
        # @return [Google::Apis::FirestoreV1beta1::Document]
        attr_accessor :update
      
        # A set of field paths on a document.
        # Used to restrict a get or update operation on a document to a subset of its
        # fields.
        # This is different from standard field masks, as this is always scoped to a
        # Document, and takes in account the dynamic nature of Value.
        # Corresponds to the JSON property `updateMask`
        # @return [Google::Apis::FirestoreV1beta1::DocumentMask]
        attr_accessor :update_mask
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @current_document = args[:current_document] if args.key?(:current_document)
          @delete = args[:delete] if args.key?(:delete)
          @transform = args[:transform] if args.key?(:transform)
          @update = args[:update] if args.key?(:update)
          @update_mask = args[:update_mask] if args.key?(:update_mask)
        end
      end
      
      # The request for Firestore.Write.
      # The first request creates a stream, or resumes an existing one from a token.
      # When creating a new stream, the server replies with a response containing
      # only an ID and a token, to use in the next request.
      # When resuming a stream, the server first streams any responses later than the
      # given token, then a response containing only an up-to-date token, to use in
      # the next request.
      class WriteRequest
        include Google::Apis::Core::Hashable
      
        # Labels associated with this write request.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # The ID of the write stream to resume.
        # This may only be set in the first message. When left empty, a new write
        # stream will be created.
        # Corresponds to the JSON property `streamId`
        # @return [String]
        attr_accessor :stream_id
      
        # A stream token that was previously sent by the server.
        # The client should set this field to the token from the most recent
        # WriteResponse it has received. This acknowledges that the client has
        # received responses up to this token. After sending this token, earlier
        # tokens may not be used anymore.
        # The server may close the stream if there are too many unacknowledged
        # responses.
        # Leave this field unset when creating a new stream. To resume a stream at
        # a specific point, set this field and the `stream_id` field.
        # Leave this field unset when creating a new stream.
        # Corresponds to the JSON property `streamToken`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :stream_token
      
        # The writes to apply.
        # Always executed atomically and in order.
        # This must be empty on the first request.
        # This may be empty on the last request.
        # This must not be empty on all other requests.
        # Corresponds to the JSON property `writes`
        # @return [Array<Google::Apis::FirestoreV1beta1::Write>]
        attr_accessor :writes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @labels = args[:labels] if args.key?(:labels)
          @stream_id = args[:stream_id] if args.key?(:stream_id)
          @stream_token = args[:stream_token] if args.key?(:stream_token)
          @writes = args[:writes] if args.key?(:writes)
        end
      end
      
      # The response for Firestore.Write.
      class WriteResponse
        include Google::Apis::Core::Hashable
      
        # The time at which the commit occurred.
        # Corresponds to the JSON property `commitTime`
        # @return [String]
        attr_accessor :commit_time
      
        # The ID of the stream.
        # Only set on the first message, when a new stream was created.
        # Corresponds to the JSON property `streamId`
        # @return [String]
        attr_accessor :stream_id
      
        # A token that represents the position of this response in the stream.
        # This can be used by a client to resume the stream at this point.
        # This field is always set.
        # Corresponds to the JSON property `streamToken`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :stream_token
      
        # The result of applying the writes.
        # This i-th write result corresponds to the i-th write in the
        # request.
        # Corresponds to the JSON property `writeResults`
        # @return [Array<Google::Apis::FirestoreV1beta1::WriteResult>]
        attr_accessor :write_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @commit_time = args[:commit_time] if args.key?(:commit_time)
          @stream_id = args[:stream_id] if args.key?(:stream_id)
          @stream_token = args[:stream_token] if args.key?(:stream_token)
          @write_results = args[:write_results] if args.key?(:write_results)
        end
      end
      
      # The result of applying a write.
      class WriteResult
        include Google::Apis::Core::Hashable
      
        # The results of applying each DocumentTransform.FieldTransform, in the
        # same order.
        # Corresponds to the JSON property `transformResults`
        # @return [Array<Google::Apis::FirestoreV1beta1::Value>]
        attr_accessor :transform_results
      
        # The last update time of the document after applying the write. Not set
        # after a `delete`.
        # If the write did not actually change the document, this will be the
        # previous update_time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @transform_results = args[:transform_results] if args.key?(:transform_results)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
    end
  end
end
