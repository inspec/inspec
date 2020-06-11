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
    module DatastoreV1beta1
      
      # Metadata common to all Datastore Admin operations.
      class GoogleDatastoreAdminV1CommonMetadata
        include Google::Apis::Core::Hashable
      
        # The time the operation ended, either successfully or otherwise.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # The client-assigned labels which were provided when the operation was
        # created. May also include additional labels.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # The type of the operation. Can be used as a filter in
        # ListOperationsRequest.
        # Corresponds to the JSON property `operationType`
        # @return [String]
        attr_accessor :operation_type
      
        # The time that work began on the operation.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # The current state of the Operation.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_time = args[:end_time] if args.key?(:end_time)
          @labels = args[:labels] if args.key?(:labels)
          @operation_type = args[:operation_type] if args.key?(:operation_type)
          @start_time = args[:start_time] if args.key?(:start_time)
          @state = args[:state] if args.key?(:state)
        end
      end
      
      # Identifies a subset of entities in a project. This is specified as
      # combinations of kinds and namespaces (either or both of which may be all, as
      # described in the following examples).
      # Example usage:
      # Entire project:
      # kinds=[], namespace_ids=[]
      # Kinds Foo and Bar in all namespaces:
      # kinds=['Foo', 'Bar'], namespace_ids=[]
      # Kinds Foo and Bar only in the default namespace:
      # kinds=['Foo', 'Bar'], namespace_ids=['']
      # Kinds Foo and Bar in both the default and Baz namespaces:
      # kinds=['Foo', 'Bar'], namespace_ids=['', 'Baz']
      # The entire Baz namespace:
      # kinds=[], namespace_ids=['Baz']
      class GoogleDatastoreAdminV1EntityFilter
        include Google::Apis::Core::Hashable
      
        # If empty, then this represents all kinds.
        # Corresponds to the JSON property `kinds`
        # @return [Array<String>]
        attr_accessor :kinds
      
        # An empty list represents all namespaces. This is the preferred
        # usage for projects that don't use namespaces.
        # An empty string element represents the default namespace. This should be
        # used if the project has data in non-default namespaces, but doesn't want to
        # include them.
        # Each namespace in this list must be unique.
        # Corresponds to the JSON property `namespaceIds`
        # @return [Array<String>]
        attr_accessor :namespace_ids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kinds = args[:kinds] if args.key?(:kinds)
          @namespace_ids = args[:namespace_ids] if args.key?(:namespace_ids)
        end
      end
      
      # Metadata for ExportEntities operations.
      class GoogleDatastoreAdminV1ExportEntitiesMetadata
        include Google::Apis::Core::Hashable
      
        # Metadata common to all Datastore Admin operations.
        # Corresponds to the JSON property `common`
        # @return [Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1CommonMetadata]
        attr_accessor :common
      
        # Identifies a subset of entities in a project. This is specified as
        # combinations of kinds and namespaces (either or both of which may be all, as
        # described in the following examples).
        # Example usage:
        # Entire project:
        # kinds=[], namespace_ids=[]
        # Kinds Foo and Bar in all namespaces:
        # kinds=['Foo', 'Bar'], namespace_ids=[]
        # Kinds Foo and Bar only in the default namespace:
        # kinds=['Foo', 'Bar'], namespace_ids=['']
        # Kinds Foo and Bar in both the default and Baz namespaces:
        # kinds=['Foo', 'Bar'], namespace_ids=['', 'Baz']
        # The entire Baz namespace:
        # kinds=[], namespace_ids=['Baz']
        # Corresponds to the JSON property `entityFilter`
        # @return [Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1EntityFilter]
        attr_accessor :entity_filter
      
        # Location for the export metadata and data files. This will be the same
        # value as the
        # google.datastore.admin.v1.ExportEntitiesRequest.output_url_prefix
        # field. The final output location is provided in
        # google.datastore.admin.v1.ExportEntitiesResponse.output_url.
        # Corresponds to the JSON property `outputUrlPrefix`
        # @return [String]
        attr_accessor :output_url_prefix
      
        # Measures the progress of a particular metric.
        # Corresponds to the JSON property `progressBytes`
        # @return [Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1Progress]
        attr_accessor :progress_bytes
      
        # Measures the progress of a particular metric.
        # Corresponds to the JSON property `progressEntities`
        # @return [Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1Progress]
        attr_accessor :progress_entities
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @common = args[:common] if args.key?(:common)
          @entity_filter = args[:entity_filter] if args.key?(:entity_filter)
          @output_url_prefix = args[:output_url_prefix] if args.key?(:output_url_prefix)
          @progress_bytes = args[:progress_bytes] if args.key?(:progress_bytes)
          @progress_entities = args[:progress_entities] if args.key?(:progress_entities)
        end
      end
      
      # The response for
      # google.datastore.admin.v1.DatastoreAdmin.ExportEntities.
      class GoogleDatastoreAdminV1ExportEntitiesResponse
        include Google::Apis::Core::Hashable
      
        # Location of the output metadata file. This can be used to begin an import
        # into Cloud Datastore (this project or another project). See
        # google.datastore.admin.v1.ImportEntitiesRequest.input_url.
        # Only present if the operation completed successfully.
        # Corresponds to the JSON property `outputUrl`
        # @return [String]
        attr_accessor :output_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @output_url = args[:output_url] if args.key?(:output_url)
        end
      end
      
      # Metadata for ImportEntities operations.
      class GoogleDatastoreAdminV1ImportEntitiesMetadata
        include Google::Apis::Core::Hashable
      
        # Metadata common to all Datastore Admin operations.
        # Corresponds to the JSON property `common`
        # @return [Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1CommonMetadata]
        attr_accessor :common
      
        # Identifies a subset of entities in a project. This is specified as
        # combinations of kinds and namespaces (either or both of which may be all, as
        # described in the following examples).
        # Example usage:
        # Entire project:
        # kinds=[], namespace_ids=[]
        # Kinds Foo and Bar in all namespaces:
        # kinds=['Foo', 'Bar'], namespace_ids=[]
        # Kinds Foo and Bar only in the default namespace:
        # kinds=['Foo', 'Bar'], namespace_ids=['']
        # Kinds Foo and Bar in both the default and Baz namespaces:
        # kinds=['Foo', 'Bar'], namespace_ids=['', 'Baz']
        # The entire Baz namespace:
        # kinds=[], namespace_ids=['Baz']
        # Corresponds to the JSON property `entityFilter`
        # @return [Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1EntityFilter]
        attr_accessor :entity_filter
      
        # The location of the import metadata file. This will be the same value as
        # the google.datastore.admin.v1.ExportEntitiesResponse.output_url field.
        # Corresponds to the JSON property `inputUrl`
        # @return [String]
        attr_accessor :input_url
      
        # Measures the progress of a particular metric.
        # Corresponds to the JSON property `progressBytes`
        # @return [Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1Progress]
        attr_accessor :progress_bytes
      
        # Measures the progress of a particular metric.
        # Corresponds to the JSON property `progressEntities`
        # @return [Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1Progress]
        attr_accessor :progress_entities
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @common = args[:common] if args.key?(:common)
          @entity_filter = args[:entity_filter] if args.key?(:entity_filter)
          @input_url = args[:input_url] if args.key?(:input_url)
          @progress_bytes = args[:progress_bytes] if args.key?(:progress_bytes)
          @progress_entities = args[:progress_entities] if args.key?(:progress_entities)
        end
      end
      
      # Metadata for Index operations.
      class GoogleDatastoreAdminV1IndexOperationMetadata
        include Google::Apis::Core::Hashable
      
        # Metadata common to all Datastore Admin operations.
        # Corresponds to the JSON property `common`
        # @return [Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1CommonMetadata]
        attr_accessor :common
      
        # The index resource ID that this operation is acting on.
        # Corresponds to the JSON property `indexId`
        # @return [String]
        attr_accessor :index_id
      
        # Measures the progress of a particular metric.
        # Corresponds to the JSON property `progressEntities`
        # @return [Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1Progress]
        attr_accessor :progress_entities
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @common = args[:common] if args.key?(:common)
          @index_id = args[:index_id] if args.key?(:index_id)
          @progress_entities = args[:progress_entities] if args.key?(:progress_entities)
        end
      end
      
      # Measures the progress of a particular metric.
      class GoogleDatastoreAdminV1Progress
        include Google::Apis::Core::Hashable
      
        # The amount of work that has been completed. Note that this may be greater
        # than work_estimated.
        # Corresponds to the JSON property `workCompleted`
        # @return [Fixnum]
        attr_accessor :work_completed
      
        # An estimate of how much work needs to be performed. May be zero if the
        # work estimate is unavailable.
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
      
      # Metadata common to all Datastore Admin operations.
      class GoogleDatastoreAdminV1beta1CommonMetadata
        include Google::Apis::Core::Hashable
      
        # The time the operation ended, either successfully or otherwise.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # The client-assigned labels which were provided when the operation was
        # created. May also include additional labels.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # The type of the operation. Can be used as a filter in
        # ListOperationsRequest.
        # Corresponds to the JSON property `operationType`
        # @return [String]
        attr_accessor :operation_type
      
        # The time that work began on the operation.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # The current state of the Operation.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_time = args[:end_time] if args.key?(:end_time)
          @labels = args[:labels] if args.key?(:labels)
          @operation_type = args[:operation_type] if args.key?(:operation_type)
          @start_time = args[:start_time] if args.key?(:start_time)
          @state = args[:state] if args.key?(:state)
        end
      end
      
      # Identifies a subset of entities in a project. This is specified as
      # combinations of kinds and namespaces (either or both of which may be all, as
      # described in the following examples).
      # Example usage:
      # Entire project:
      # kinds=[], namespace_ids=[]
      # Kinds Foo and Bar in all namespaces:
      # kinds=['Foo', 'Bar'], namespace_ids=[]
      # Kinds Foo and Bar only in the default namespace:
      # kinds=['Foo', 'Bar'], namespace_ids=['']
      # Kinds Foo and Bar in both the default and Baz namespaces:
      # kinds=['Foo', 'Bar'], namespace_ids=['', 'Baz']
      # The entire Baz namespace:
      # kinds=[], namespace_ids=['Baz']
      class GoogleDatastoreAdminV1beta1EntityFilter
        include Google::Apis::Core::Hashable
      
        # If empty, then this represents all kinds.
        # Corresponds to the JSON property `kinds`
        # @return [Array<String>]
        attr_accessor :kinds
      
        # An empty list represents all namespaces. This is the preferred
        # usage for projects that don't use namespaces.
        # An empty string element represents the default namespace. This should be
        # used if the project has data in non-default namespaces, but doesn't want to
        # include them.
        # Each namespace in this list must be unique.
        # Corresponds to the JSON property `namespaceIds`
        # @return [Array<String>]
        attr_accessor :namespace_ids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kinds = args[:kinds] if args.key?(:kinds)
          @namespace_ids = args[:namespace_ids] if args.key?(:namespace_ids)
        end
      end
      
      # Metadata for ExportEntities operations.
      class GoogleDatastoreAdminV1beta1ExportEntitiesMetadata
        include Google::Apis::Core::Hashable
      
        # Metadata common to all Datastore Admin operations.
        # Corresponds to the JSON property `common`
        # @return [Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1CommonMetadata]
        attr_accessor :common
      
        # Identifies a subset of entities in a project. This is specified as
        # combinations of kinds and namespaces (either or both of which may be all, as
        # described in the following examples).
        # Example usage:
        # Entire project:
        # kinds=[], namespace_ids=[]
        # Kinds Foo and Bar in all namespaces:
        # kinds=['Foo', 'Bar'], namespace_ids=[]
        # Kinds Foo and Bar only in the default namespace:
        # kinds=['Foo', 'Bar'], namespace_ids=['']
        # Kinds Foo and Bar in both the default and Baz namespaces:
        # kinds=['Foo', 'Bar'], namespace_ids=['', 'Baz']
        # The entire Baz namespace:
        # kinds=[], namespace_ids=['Baz']
        # Corresponds to the JSON property `entityFilter`
        # @return [Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1EntityFilter]
        attr_accessor :entity_filter
      
        # Location for the export metadata and data files. This will be the same
        # value as the
        # google.datastore.admin.v1beta1.ExportEntitiesRequest.output_url_prefix
        # field. The final output location is provided in
        # google.datastore.admin.v1beta1.ExportEntitiesResponse.output_url.
        # Corresponds to the JSON property `outputUrlPrefix`
        # @return [String]
        attr_accessor :output_url_prefix
      
        # Measures the progress of a particular metric.
        # Corresponds to the JSON property `progressBytes`
        # @return [Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1Progress]
        attr_accessor :progress_bytes
      
        # Measures the progress of a particular metric.
        # Corresponds to the JSON property `progressEntities`
        # @return [Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1Progress]
        attr_accessor :progress_entities
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @common = args[:common] if args.key?(:common)
          @entity_filter = args[:entity_filter] if args.key?(:entity_filter)
          @output_url_prefix = args[:output_url_prefix] if args.key?(:output_url_prefix)
          @progress_bytes = args[:progress_bytes] if args.key?(:progress_bytes)
          @progress_entities = args[:progress_entities] if args.key?(:progress_entities)
        end
      end
      
      # The request for
      # google.datastore.admin.v1beta1.DatastoreAdmin.ExportEntities.
      class GoogleDatastoreAdminV1beta1ExportEntitiesRequest
        include Google::Apis::Core::Hashable
      
        # Identifies a subset of entities in a project. This is specified as
        # combinations of kinds and namespaces (either or both of which may be all, as
        # described in the following examples).
        # Example usage:
        # Entire project:
        # kinds=[], namespace_ids=[]
        # Kinds Foo and Bar in all namespaces:
        # kinds=['Foo', 'Bar'], namespace_ids=[]
        # Kinds Foo and Bar only in the default namespace:
        # kinds=['Foo', 'Bar'], namespace_ids=['']
        # Kinds Foo and Bar in both the default and Baz namespaces:
        # kinds=['Foo', 'Bar'], namespace_ids=['', 'Baz']
        # The entire Baz namespace:
        # kinds=[], namespace_ids=['Baz']
        # Corresponds to the JSON property `entityFilter`
        # @return [Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1EntityFilter]
        attr_accessor :entity_filter
      
        # Client-assigned labels.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Location for the export metadata and data files.
        # The full resource URL of the external storage location. Currently, only
        # Google Cloud Storage is supported. So output_url_prefix should be of the
        # form: `gs://BUCKET_NAME[/NAMESPACE_PATH]`, where `BUCKET_NAME` is the
        # name of the Cloud Storage bucket and `NAMESPACE_PATH` is an optional Cloud
        # Storage namespace path (this is not a Cloud Datastore namespace). For more
        # information about Cloud Storage namespace paths, see
        # [Object name
        # considerations](https://cloud.google.com/storage/docs/naming#object-
        # considerations).
        # The resulting files will be nested deeper than the specified URL prefix.
        # The final output URL will be provided in the
        # google.datastore.admin.v1beta1.ExportEntitiesResponse.output_url
        # field. That value should be used for subsequent ImportEntities operations.
        # By nesting the data files deeper, the same Cloud Storage bucket can be used
        # in multiple ExportEntities operations without conflict.
        # Corresponds to the JSON property `outputUrlPrefix`
        # @return [String]
        attr_accessor :output_url_prefix
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entity_filter = args[:entity_filter] if args.key?(:entity_filter)
          @labels = args[:labels] if args.key?(:labels)
          @output_url_prefix = args[:output_url_prefix] if args.key?(:output_url_prefix)
        end
      end
      
      # The response for
      # google.datastore.admin.v1beta1.DatastoreAdmin.ExportEntities.
      class GoogleDatastoreAdminV1beta1ExportEntitiesResponse
        include Google::Apis::Core::Hashable
      
        # Location of the output metadata file. This can be used to begin an import
        # into Cloud Datastore (this project or another project). See
        # google.datastore.admin.v1beta1.ImportEntitiesRequest.input_url.
        # Only present if the operation completed successfully.
        # Corresponds to the JSON property `outputUrl`
        # @return [String]
        attr_accessor :output_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @output_url = args[:output_url] if args.key?(:output_url)
        end
      end
      
      # Metadata for ImportEntities operations.
      class GoogleDatastoreAdminV1beta1ImportEntitiesMetadata
        include Google::Apis::Core::Hashable
      
        # Metadata common to all Datastore Admin operations.
        # Corresponds to the JSON property `common`
        # @return [Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1CommonMetadata]
        attr_accessor :common
      
        # Identifies a subset of entities in a project. This is specified as
        # combinations of kinds and namespaces (either or both of which may be all, as
        # described in the following examples).
        # Example usage:
        # Entire project:
        # kinds=[], namespace_ids=[]
        # Kinds Foo and Bar in all namespaces:
        # kinds=['Foo', 'Bar'], namespace_ids=[]
        # Kinds Foo and Bar only in the default namespace:
        # kinds=['Foo', 'Bar'], namespace_ids=['']
        # Kinds Foo and Bar in both the default and Baz namespaces:
        # kinds=['Foo', 'Bar'], namespace_ids=['', 'Baz']
        # The entire Baz namespace:
        # kinds=[], namespace_ids=['Baz']
        # Corresponds to the JSON property `entityFilter`
        # @return [Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1EntityFilter]
        attr_accessor :entity_filter
      
        # The location of the import metadata file. This will be the same value as
        # the google.datastore.admin.v1beta1.ExportEntitiesResponse.output_url
        # field.
        # Corresponds to the JSON property `inputUrl`
        # @return [String]
        attr_accessor :input_url
      
        # Measures the progress of a particular metric.
        # Corresponds to the JSON property `progressBytes`
        # @return [Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1Progress]
        attr_accessor :progress_bytes
      
        # Measures the progress of a particular metric.
        # Corresponds to the JSON property `progressEntities`
        # @return [Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1Progress]
        attr_accessor :progress_entities
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @common = args[:common] if args.key?(:common)
          @entity_filter = args[:entity_filter] if args.key?(:entity_filter)
          @input_url = args[:input_url] if args.key?(:input_url)
          @progress_bytes = args[:progress_bytes] if args.key?(:progress_bytes)
          @progress_entities = args[:progress_entities] if args.key?(:progress_entities)
        end
      end
      
      # The request for
      # google.datastore.admin.v1beta1.DatastoreAdmin.ImportEntities.
      class GoogleDatastoreAdminV1beta1ImportEntitiesRequest
        include Google::Apis::Core::Hashable
      
        # Identifies a subset of entities in a project. This is specified as
        # combinations of kinds and namespaces (either or both of which may be all, as
        # described in the following examples).
        # Example usage:
        # Entire project:
        # kinds=[], namespace_ids=[]
        # Kinds Foo and Bar in all namespaces:
        # kinds=['Foo', 'Bar'], namespace_ids=[]
        # Kinds Foo and Bar only in the default namespace:
        # kinds=['Foo', 'Bar'], namespace_ids=['']
        # Kinds Foo and Bar in both the default and Baz namespaces:
        # kinds=['Foo', 'Bar'], namespace_ids=['', 'Baz']
        # The entire Baz namespace:
        # kinds=[], namespace_ids=['Baz']
        # Corresponds to the JSON property `entityFilter`
        # @return [Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1EntityFilter]
        attr_accessor :entity_filter
      
        # The full resource URL of the external storage location. Currently, only
        # Google Cloud Storage is supported. So input_url should be of the form:
        # `gs://BUCKET_NAME[/NAMESPACE_PATH]/OVERALL_EXPORT_METADATA_FILE`, where
        # `BUCKET_NAME` is the name of the Cloud Storage bucket, `NAMESPACE_PATH` is
        # an optional Cloud Storage namespace path (this is not a Cloud Datastore
        # namespace), and `OVERALL_EXPORT_METADATA_FILE` is the metadata file written
        # by the ExportEntities operation. For more information about Cloud Storage
        # namespace paths, see
        # [Object name
        # considerations](https://cloud.google.com/storage/docs/naming#object-
        # considerations).
        # For more information, see
        # google.datastore.admin.v1beta1.ExportEntitiesResponse.output_url.
        # Corresponds to the JSON property `inputUrl`
        # @return [String]
        attr_accessor :input_url
      
        # Client-assigned labels.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entity_filter = args[:entity_filter] if args.key?(:entity_filter)
          @input_url = args[:input_url] if args.key?(:input_url)
          @labels = args[:labels] if args.key?(:labels)
        end
      end
      
      # Measures the progress of a particular metric.
      class GoogleDatastoreAdminV1beta1Progress
        include Google::Apis::Core::Hashable
      
        # The amount of work that has been completed. Note that this may be greater
        # than work_estimated.
        # Corresponds to the JSON property `workCompleted`
        # @return [Fixnum]
        attr_accessor :work_completed
      
        # An estimate of how much work needs to be performed. May be zero if the
        # work estimate is unavailable.
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
        # @return [Google::Apis::DatastoreV1beta1::Status]
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
