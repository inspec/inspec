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
      
      class GoogleDatastoreAdminV1CommonMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDatastoreAdminV1EntityFilter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDatastoreAdminV1ExportEntitiesMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDatastoreAdminV1ExportEntitiesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDatastoreAdminV1ImportEntitiesMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDatastoreAdminV1IndexOperationMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDatastoreAdminV1Progress
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDatastoreAdminV1beta1CommonMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDatastoreAdminV1beta1EntityFilter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDatastoreAdminV1beta1ExportEntitiesMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDatastoreAdminV1beta1ExportEntitiesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDatastoreAdminV1beta1ExportEntitiesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDatastoreAdminV1beta1ImportEntitiesMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDatastoreAdminV1beta1ImportEntitiesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDatastoreAdminV1beta1Progress
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
      
      class GoogleDatastoreAdminV1CommonMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_time, as: 'endTime'
          hash :labels, as: 'labels'
          property :operation_type, as: 'operationType'
          property :start_time, as: 'startTime'
          property :state, as: 'state'
        end
      end
      
      class GoogleDatastoreAdminV1EntityFilter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :kinds, as: 'kinds'
          collection :namespace_ids, as: 'namespaceIds'
        end
      end
      
      class GoogleDatastoreAdminV1ExportEntitiesMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :common, as: 'common', class: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1CommonMetadata, decorator: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1CommonMetadata::Representation
      
          property :entity_filter, as: 'entityFilter', class: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1EntityFilter, decorator: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1EntityFilter::Representation
      
          property :output_url_prefix, as: 'outputUrlPrefix'
          property :progress_bytes, as: 'progressBytes', class: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1Progress, decorator: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1Progress::Representation
      
          property :progress_entities, as: 'progressEntities', class: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1Progress, decorator: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1Progress::Representation
      
        end
      end
      
      class GoogleDatastoreAdminV1ExportEntitiesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :output_url, as: 'outputUrl'
        end
      end
      
      class GoogleDatastoreAdminV1ImportEntitiesMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :common, as: 'common', class: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1CommonMetadata, decorator: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1CommonMetadata::Representation
      
          property :entity_filter, as: 'entityFilter', class: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1EntityFilter, decorator: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1EntityFilter::Representation
      
          property :input_url, as: 'inputUrl'
          property :progress_bytes, as: 'progressBytes', class: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1Progress, decorator: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1Progress::Representation
      
          property :progress_entities, as: 'progressEntities', class: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1Progress, decorator: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1Progress::Representation
      
        end
      end
      
      class GoogleDatastoreAdminV1IndexOperationMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :common, as: 'common', class: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1CommonMetadata, decorator: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1CommonMetadata::Representation
      
          property :index_id, as: 'indexId'
          property :progress_entities, as: 'progressEntities', class: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1Progress, decorator: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1Progress::Representation
      
        end
      end
      
      class GoogleDatastoreAdminV1Progress
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :work_completed, :numeric_string => true, as: 'workCompleted'
          property :work_estimated, :numeric_string => true, as: 'workEstimated'
        end
      end
      
      class GoogleDatastoreAdminV1beta1CommonMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_time, as: 'endTime'
          hash :labels, as: 'labels'
          property :operation_type, as: 'operationType'
          property :start_time, as: 'startTime'
          property :state, as: 'state'
        end
      end
      
      class GoogleDatastoreAdminV1beta1EntityFilter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :kinds, as: 'kinds'
          collection :namespace_ids, as: 'namespaceIds'
        end
      end
      
      class GoogleDatastoreAdminV1beta1ExportEntitiesMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :common, as: 'common', class: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1CommonMetadata, decorator: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1CommonMetadata::Representation
      
          property :entity_filter, as: 'entityFilter', class: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1EntityFilter, decorator: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1EntityFilter::Representation
      
          property :output_url_prefix, as: 'outputUrlPrefix'
          property :progress_bytes, as: 'progressBytes', class: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1Progress, decorator: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1Progress::Representation
      
          property :progress_entities, as: 'progressEntities', class: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1Progress, decorator: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1Progress::Representation
      
        end
      end
      
      class GoogleDatastoreAdminV1beta1ExportEntitiesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :entity_filter, as: 'entityFilter', class: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1EntityFilter, decorator: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1EntityFilter::Representation
      
          hash :labels, as: 'labels'
          property :output_url_prefix, as: 'outputUrlPrefix'
        end
      end
      
      class GoogleDatastoreAdminV1beta1ExportEntitiesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :output_url, as: 'outputUrl'
        end
      end
      
      class GoogleDatastoreAdminV1beta1ImportEntitiesMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :common, as: 'common', class: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1CommonMetadata, decorator: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1CommonMetadata::Representation
      
          property :entity_filter, as: 'entityFilter', class: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1EntityFilter, decorator: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1EntityFilter::Representation
      
          property :input_url, as: 'inputUrl'
          property :progress_bytes, as: 'progressBytes', class: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1Progress, decorator: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1Progress::Representation
      
          property :progress_entities, as: 'progressEntities', class: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1Progress, decorator: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1Progress::Representation
      
        end
      end
      
      class GoogleDatastoreAdminV1beta1ImportEntitiesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :entity_filter, as: 'entityFilter', class: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1EntityFilter, decorator: Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1EntityFilter::Representation
      
          property :input_url, as: 'inputUrl'
          hash :labels, as: 'labels'
        end
      end
      
      class GoogleDatastoreAdminV1beta1Progress
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :work_completed, :numeric_string => true, as: 'workCompleted'
          property :work_estimated, :numeric_string => true, as: 'workEstimated'
        end
      end
      
      class GoogleLongrunningOperation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :done, as: 'done'
          property :error, as: 'error', class: Google::Apis::DatastoreV1beta1::Status, decorator: Google::Apis::DatastoreV1beta1::Status::Representation
      
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
