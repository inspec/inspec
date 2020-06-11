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
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleFirestoreAdminV1beta2ExportDocumentsMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleFirestoreAdminV1beta2ExportDocumentsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleFirestoreAdminV1beta2ExportDocumentsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleFirestoreAdminV1beta2Field
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleFirestoreAdminV1beta2FieldOperationMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleFirestoreAdminV1beta2ImportDocumentsMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleFirestoreAdminV1beta2ImportDocumentsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleFirestoreAdminV1beta2Index
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleFirestoreAdminV1beta2IndexConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleFirestoreAdminV1beta2IndexConfigDelta
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleFirestoreAdminV1beta2IndexField
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleFirestoreAdminV1beta2IndexOperationMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleFirestoreAdminV1beta2ListFieldsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleFirestoreAdminV1beta2ListIndexesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleFirestoreAdminV1beta2Progress
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleLongrunningOperation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Status
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class GoogleFirestoreAdminV1beta2ExportDocumentsMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :collection_ids, as: 'collectionIds'
          property :end_time, as: 'endTime'
          property :operation_state, as: 'operationState'
          property :output_uri_prefix, as: 'outputUriPrefix'
          property :progress_bytes, as: 'progressBytes', class: Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Progress, decorator: Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Progress::Representation
      
          property :progress_documents, as: 'progressDocuments', class: Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Progress, decorator: Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Progress::Representation
      
          property :start_time, as: 'startTime'
        end
      end
      
      class GoogleFirestoreAdminV1beta2ExportDocumentsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :collection_ids, as: 'collectionIds'
          property :output_uri_prefix, as: 'outputUriPrefix'
        end
      end
      
      class GoogleFirestoreAdminV1beta2ExportDocumentsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :output_uri_prefix, as: 'outputUriPrefix'
        end
      end
      
      class GoogleFirestoreAdminV1beta2Field
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :index_config, as: 'indexConfig', class: Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2IndexConfig, decorator: Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2IndexConfig::Representation
      
          property :name, as: 'name'
        end
      end
      
      class GoogleFirestoreAdminV1beta2FieldOperationMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bytes_progress, as: 'bytesProgress', class: Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Progress, decorator: Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Progress::Representation
      
          property :document_progress, as: 'documentProgress', class: Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Progress, decorator: Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Progress::Representation
      
          property :end_time, as: 'endTime'
          property :field, as: 'field'
          collection :index_config_deltas, as: 'indexConfigDeltas', class: Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2IndexConfigDelta, decorator: Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2IndexConfigDelta::Representation
      
          property :start_time, as: 'startTime'
          property :state, as: 'state'
        end
      end
      
      class GoogleFirestoreAdminV1beta2ImportDocumentsMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :collection_ids, as: 'collectionIds'
          property :end_time, as: 'endTime'
          property :input_uri_prefix, as: 'inputUriPrefix'
          property :operation_state, as: 'operationState'
          property :progress_bytes, as: 'progressBytes', class: Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Progress, decorator: Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Progress::Representation
      
          property :progress_documents, as: 'progressDocuments', class: Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Progress, decorator: Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Progress::Representation
      
          property :start_time, as: 'startTime'
        end
      end
      
      class GoogleFirestoreAdminV1beta2ImportDocumentsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :collection_ids, as: 'collectionIds'
          property :input_uri_prefix, as: 'inputUriPrefix'
        end
      end
      
      class GoogleFirestoreAdminV1beta2Index
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :fields, as: 'fields', class: Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2IndexField, decorator: Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2IndexField::Representation
      
          property :name, as: 'name'
          property :query_scope, as: 'queryScope'
          property :state, as: 'state'
        end
      end
      
      class GoogleFirestoreAdminV1beta2IndexConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ancestor_field, as: 'ancestorField'
          collection :indexes, as: 'indexes', class: Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Index, decorator: Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Index::Representation
      
          property :reverting, as: 'reverting'
          property :uses_ancestor_config, as: 'usesAncestorConfig'
        end
      end
      
      class GoogleFirestoreAdminV1beta2IndexConfigDelta
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :change_type, as: 'changeType'
          property :index, as: 'index', class: Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Index, decorator: Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Index::Representation
      
        end
      end
      
      class GoogleFirestoreAdminV1beta2IndexField
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :array_config, as: 'arrayConfig'
          property :field_path, as: 'fieldPath'
          property :order, as: 'order'
        end
      end
      
      class GoogleFirestoreAdminV1beta2IndexOperationMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_time, as: 'endTime'
          property :index, as: 'index'
          property :progress_bytes, as: 'progressBytes', class: Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Progress, decorator: Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Progress::Representation
      
          property :progress_documents, as: 'progressDocuments', class: Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Progress, decorator: Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Progress::Representation
      
          property :start_time, as: 'startTime'
          property :state, as: 'state'
        end
      end
      
      class GoogleFirestoreAdminV1beta2ListFieldsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :fields, as: 'fields', class: Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Field, decorator: Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Field::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class GoogleFirestoreAdminV1beta2ListIndexesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :indexes, as: 'indexes', class: Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Index, decorator: Google::Apis::FirestoreV1beta2::GoogleFirestoreAdminV1beta2Index::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class GoogleFirestoreAdminV1beta2Progress
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :completed_work, :numeric_string => true, as: 'completedWork'
          property :estimated_work, :numeric_string => true, as: 'estimatedWork'
        end
      end
      
      class GoogleLongrunningOperation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :done, as: 'done'
          property :error, as: 'error', class: Google::Apis::FirestoreV1beta2::Status, decorator: Google::Apis::FirestoreV1beta2::Status::Representation
      
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
          hash :response, as: 'response'
        end
      end
      
      class Status
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          collection :details, as: 'details'
          property :message, as: 'message'
        end
      end
    end
  end
end
