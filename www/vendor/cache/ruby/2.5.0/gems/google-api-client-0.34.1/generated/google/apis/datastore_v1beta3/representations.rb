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
    module DatastoreV1beta3
      
      class AllocateIdsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AllocateIdsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ArrayValue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BeginTransactionRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BeginTransactionResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CommitRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CommitResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CompositeFilter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Entity
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EntityResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Filter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
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
      
      class GoogleDatastoreAdminV1beta1ExportEntitiesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDatastoreAdminV1beta1ImportEntitiesMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDatastoreAdminV1beta1Progress
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GqlQuery
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GqlQueryParameter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Key
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class KindExpression
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LatLng
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LookupRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LookupResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Mutation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MutationResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PartitionId
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PathElement
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Projection
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PropertyFilter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PropertyOrder
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PropertyReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Query
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class QueryResultBatch
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReadOnly
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReadOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReadWrite
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReserveIdsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReserveIdsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RollbackRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RollbackResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RunQueryRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RunQueryResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TransactionOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Value
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AllocateIdsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :keys, as: 'keys', class: Google::Apis::DatastoreV1beta3::Key, decorator: Google::Apis::DatastoreV1beta3::Key::Representation
      
        end
      end
      
      class AllocateIdsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :keys, as: 'keys', class: Google::Apis::DatastoreV1beta3::Key, decorator: Google::Apis::DatastoreV1beta3::Key::Representation
      
        end
      end
      
      class ArrayValue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :values, as: 'values', class: Google::Apis::DatastoreV1beta3::Value, decorator: Google::Apis::DatastoreV1beta3::Value::Representation
      
        end
      end
      
      class BeginTransactionRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :transaction_options, as: 'transactionOptions', class: Google::Apis::DatastoreV1beta3::TransactionOptions, decorator: Google::Apis::DatastoreV1beta3::TransactionOptions::Representation
      
        end
      end
      
      class BeginTransactionResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :transaction, :base64 => true, as: 'transaction'
        end
      end
      
      class CommitRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :mode, as: 'mode'
          collection :mutations, as: 'mutations', class: Google::Apis::DatastoreV1beta3::Mutation, decorator: Google::Apis::DatastoreV1beta3::Mutation::Representation
      
          property :transaction, :base64 => true, as: 'transaction'
        end
      end
      
      class CommitResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :index_updates, as: 'indexUpdates'
          collection :mutation_results, as: 'mutationResults', class: Google::Apis::DatastoreV1beta3::MutationResult, decorator: Google::Apis::DatastoreV1beta3::MutationResult::Representation
      
        end
      end
      
      class CompositeFilter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :filters, as: 'filters', class: Google::Apis::DatastoreV1beta3::Filter, decorator: Google::Apis::DatastoreV1beta3::Filter::Representation
      
          property :op, as: 'op'
        end
      end
      
      class Entity
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key', class: Google::Apis::DatastoreV1beta3::Key, decorator: Google::Apis::DatastoreV1beta3::Key::Representation
      
          hash :properties, as: 'properties', class: Google::Apis::DatastoreV1beta3::Value, decorator: Google::Apis::DatastoreV1beta3::Value::Representation
      
        end
      end
      
      class EntityResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cursor, :base64 => true, as: 'cursor'
          property :entity, as: 'entity', class: Google::Apis::DatastoreV1beta3::Entity, decorator: Google::Apis::DatastoreV1beta3::Entity::Representation
      
          property :version, :numeric_string => true, as: 'version'
        end
      end
      
      class Filter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :composite_filter, as: 'compositeFilter', class: Google::Apis::DatastoreV1beta3::CompositeFilter, decorator: Google::Apis::DatastoreV1beta3::CompositeFilter::Representation
      
          property :property_filter, as: 'propertyFilter', class: Google::Apis::DatastoreV1beta3::PropertyFilter, decorator: Google::Apis::DatastoreV1beta3::PropertyFilter::Representation
      
        end
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
          property :common, as: 'common', class: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1CommonMetadata, decorator: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1CommonMetadata::Representation
      
          property :entity_filter, as: 'entityFilter', class: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1EntityFilter, decorator: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1EntityFilter::Representation
      
          property :output_url_prefix, as: 'outputUrlPrefix'
          property :progress_bytes, as: 'progressBytes', class: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1Progress, decorator: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1Progress::Representation
      
          property :progress_entities, as: 'progressEntities', class: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1Progress, decorator: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1Progress::Representation
      
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
          property :common, as: 'common', class: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1CommonMetadata, decorator: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1CommonMetadata::Representation
      
          property :entity_filter, as: 'entityFilter', class: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1EntityFilter, decorator: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1EntityFilter::Representation
      
          property :input_url, as: 'inputUrl'
          property :progress_bytes, as: 'progressBytes', class: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1Progress, decorator: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1Progress::Representation
      
          property :progress_entities, as: 'progressEntities', class: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1Progress, decorator: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1Progress::Representation
      
        end
      end
      
      class GoogleDatastoreAdminV1IndexOperationMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :common, as: 'common', class: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1CommonMetadata, decorator: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1CommonMetadata::Representation
      
          property :index_id, as: 'indexId'
          property :progress_entities, as: 'progressEntities', class: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1Progress, decorator: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1Progress::Representation
      
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
          property :common, as: 'common', class: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1beta1CommonMetadata, decorator: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1beta1CommonMetadata::Representation
      
          property :entity_filter, as: 'entityFilter', class: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1beta1EntityFilter, decorator: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1beta1EntityFilter::Representation
      
          property :output_url_prefix, as: 'outputUrlPrefix'
          property :progress_bytes, as: 'progressBytes', class: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1beta1Progress, decorator: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1beta1Progress::Representation
      
          property :progress_entities, as: 'progressEntities', class: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1beta1Progress, decorator: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1beta1Progress::Representation
      
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
          property :common, as: 'common', class: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1beta1CommonMetadata, decorator: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1beta1CommonMetadata::Representation
      
          property :entity_filter, as: 'entityFilter', class: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1beta1EntityFilter, decorator: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1beta1EntityFilter::Representation
      
          property :input_url, as: 'inputUrl'
          property :progress_bytes, as: 'progressBytes', class: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1beta1Progress, decorator: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1beta1Progress::Representation
      
          property :progress_entities, as: 'progressEntities', class: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1beta1Progress, decorator: Google::Apis::DatastoreV1beta3::GoogleDatastoreAdminV1beta1Progress::Representation
      
        end
      end
      
      class GoogleDatastoreAdminV1beta1Progress
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :work_completed, :numeric_string => true, as: 'workCompleted'
          property :work_estimated, :numeric_string => true, as: 'workEstimated'
        end
      end
      
      class GqlQuery
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :allow_literals, as: 'allowLiterals'
          hash :named_bindings, as: 'namedBindings', class: Google::Apis::DatastoreV1beta3::GqlQueryParameter, decorator: Google::Apis::DatastoreV1beta3::GqlQueryParameter::Representation
      
          collection :positional_bindings, as: 'positionalBindings', class: Google::Apis::DatastoreV1beta3::GqlQueryParameter, decorator: Google::Apis::DatastoreV1beta3::GqlQueryParameter::Representation
      
          property :query_string, as: 'queryString'
        end
      end
      
      class GqlQueryParameter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cursor, :base64 => true, as: 'cursor'
          property :value, as: 'value', class: Google::Apis::DatastoreV1beta3::Value, decorator: Google::Apis::DatastoreV1beta3::Value::Representation
      
        end
      end
      
      class Key
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :partition_id, as: 'partitionId', class: Google::Apis::DatastoreV1beta3::PartitionId, decorator: Google::Apis::DatastoreV1beta3::PartitionId::Representation
      
          collection :path, as: 'path', class: Google::Apis::DatastoreV1beta3::PathElement, decorator: Google::Apis::DatastoreV1beta3::PathElement::Representation
      
        end
      end
      
      class KindExpression
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
        end
      end
      
      class LatLng
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :latitude, as: 'latitude'
          property :longitude, as: 'longitude'
        end
      end
      
      class LookupRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :keys, as: 'keys', class: Google::Apis::DatastoreV1beta3::Key, decorator: Google::Apis::DatastoreV1beta3::Key::Representation
      
          property :read_options, as: 'readOptions', class: Google::Apis::DatastoreV1beta3::ReadOptions, decorator: Google::Apis::DatastoreV1beta3::ReadOptions::Representation
      
        end
      end
      
      class LookupResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :deferred, as: 'deferred', class: Google::Apis::DatastoreV1beta3::Key, decorator: Google::Apis::DatastoreV1beta3::Key::Representation
      
          collection :found, as: 'found', class: Google::Apis::DatastoreV1beta3::EntityResult, decorator: Google::Apis::DatastoreV1beta3::EntityResult::Representation
      
          collection :missing, as: 'missing', class: Google::Apis::DatastoreV1beta3::EntityResult, decorator: Google::Apis::DatastoreV1beta3::EntityResult::Representation
      
        end
      end
      
      class Mutation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :base_version, :numeric_string => true, as: 'baseVersion'
          property :delete, as: 'delete', class: Google::Apis::DatastoreV1beta3::Key, decorator: Google::Apis::DatastoreV1beta3::Key::Representation
      
          property :insert, as: 'insert', class: Google::Apis::DatastoreV1beta3::Entity, decorator: Google::Apis::DatastoreV1beta3::Entity::Representation
      
          property :update, as: 'update', class: Google::Apis::DatastoreV1beta3::Entity, decorator: Google::Apis::DatastoreV1beta3::Entity::Representation
      
          property :upsert, as: 'upsert', class: Google::Apis::DatastoreV1beta3::Entity, decorator: Google::Apis::DatastoreV1beta3::Entity::Representation
      
        end
      end
      
      class MutationResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :conflict_detected, as: 'conflictDetected'
          property :key, as: 'key', class: Google::Apis::DatastoreV1beta3::Key, decorator: Google::Apis::DatastoreV1beta3::Key::Representation
      
          property :version, :numeric_string => true, as: 'version'
        end
      end
      
      class PartitionId
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :namespace_id, as: 'namespaceId'
          property :project_id, as: 'projectId'
        end
      end
      
      class PathElement
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
        end
      end
      
      class Projection
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :property, as: 'property', class: Google::Apis::DatastoreV1beta3::PropertyReference, decorator: Google::Apis::DatastoreV1beta3::PropertyReference::Representation
      
        end
      end
      
      class PropertyFilter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :op, as: 'op'
          property :property, as: 'property', class: Google::Apis::DatastoreV1beta3::PropertyReference, decorator: Google::Apis::DatastoreV1beta3::PropertyReference::Representation
      
          property :value, as: 'value', class: Google::Apis::DatastoreV1beta3::Value, decorator: Google::Apis::DatastoreV1beta3::Value::Representation
      
        end
      end
      
      class PropertyOrder
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :direction, as: 'direction'
          property :property, as: 'property', class: Google::Apis::DatastoreV1beta3::PropertyReference, decorator: Google::Apis::DatastoreV1beta3::PropertyReference::Representation
      
        end
      end
      
      class PropertyReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
        end
      end
      
      class Query
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :distinct_on, as: 'distinctOn', class: Google::Apis::DatastoreV1beta3::PropertyReference, decorator: Google::Apis::DatastoreV1beta3::PropertyReference::Representation
      
          property :end_cursor, :base64 => true, as: 'endCursor'
          property :filter, as: 'filter', class: Google::Apis::DatastoreV1beta3::Filter, decorator: Google::Apis::DatastoreV1beta3::Filter::Representation
      
          collection :kind, as: 'kind', class: Google::Apis::DatastoreV1beta3::KindExpression, decorator: Google::Apis::DatastoreV1beta3::KindExpression::Representation
      
          property :limit, as: 'limit'
          property :offset, as: 'offset'
          collection :order, as: 'order', class: Google::Apis::DatastoreV1beta3::PropertyOrder, decorator: Google::Apis::DatastoreV1beta3::PropertyOrder::Representation
      
          collection :projection, as: 'projection', class: Google::Apis::DatastoreV1beta3::Projection, decorator: Google::Apis::DatastoreV1beta3::Projection::Representation
      
          property :start_cursor, :base64 => true, as: 'startCursor'
        end
      end
      
      class QueryResultBatch
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_cursor, :base64 => true, as: 'endCursor'
          property :entity_result_type, as: 'entityResultType'
          collection :entity_results, as: 'entityResults', class: Google::Apis::DatastoreV1beta3::EntityResult, decorator: Google::Apis::DatastoreV1beta3::EntityResult::Representation
      
          property :more_results, as: 'moreResults'
          property :skipped_cursor, :base64 => true, as: 'skippedCursor'
          property :skipped_results, as: 'skippedResults'
          property :snapshot_version, :numeric_string => true, as: 'snapshotVersion'
        end
      end
      
      class ReadOnly
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class ReadOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :read_consistency, as: 'readConsistency'
          property :transaction, :base64 => true, as: 'transaction'
        end
      end
      
      class ReadWrite
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :previous_transaction, :base64 => true, as: 'previousTransaction'
        end
      end
      
      class ReserveIdsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :database_id, as: 'databaseId'
          collection :keys, as: 'keys', class: Google::Apis::DatastoreV1beta3::Key, decorator: Google::Apis::DatastoreV1beta3::Key::Representation
      
        end
      end
      
      class ReserveIdsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class RollbackRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :transaction, :base64 => true, as: 'transaction'
        end
      end
      
      class RollbackResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class RunQueryRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :gql_query, as: 'gqlQuery', class: Google::Apis::DatastoreV1beta3::GqlQuery, decorator: Google::Apis::DatastoreV1beta3::GqlQuery::Representation
      
          property :partition_id, as: 'partitionId', class: Google::Apis::DatastoreV1beta3::PartitionId, decorator: Google::Apis::DatastoreV1beta3::PartitionId::Representation
      
          property :query, as: 'query', class: Google::Apis::DatastoreV1beta3::Query, decorator: Google::Apis::DatastoreV1beta3::Query::Representation
      
          property :read_options, as: 'readOptions', class: Google::Apis::DatastoreV1beta3::ReadOptions, decorator: Google::Apis::DatastoreV1beta3::ReadOptions::Representation
      
        end
      end
      
      class RunQueryResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :batch, as: 'batch', class: Google::Apis::DatastoreV1beta3::QueryResultBatch, decorator: Google::Apis::DatastoreV1beta3::QueryResultBatch::Representation
      
          property :query, as: 'query', class: Google::Apis::DatastoreV1beta3::Query, decorator: Google::Apis::DatastoreV1beta3::Query::Representation
      
        end
      end
      
      class TransactionOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :read_only, as: 'readOnly', class: Google::Apis::DatastoreV1beta3::ReadOnly, decorator: Google::Apis::DatastoreV1beta3::ReadOnly::Representation
      
          property :read_write, as: 'readWrite', class: Google::Apis::DatastoreV1beta3::ReadWrite, decorator: Google::Apis::DatastoreV1beta3::ReadWrite::Representation
      
        end
      end
      
      class Value
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :array_value, as: 'arrayValue', class: Google::Apis::DatastoreV1beta3::ArrayValue, decorator: Google::Apis::DatastoreV1beta3::ArrayValue::Representation
      
          property :blob_value, :base64 => true, as: 'blobValue'
          property :boolean_value, as: 'booleanValue'
          property :double_value, as: 'doubleValue'
          property :entity_value, as: 'entityValue', class: Google::Apis::DatastoreV1beta3::Entity, decorator: Google::Apis::DatastoreV1beta3::Entity::Representation
      
          property :exclude_from_indexes, as: 'excludeFromIndexes'
          property :geo_point_value, as: 'geoPointValue', class: Google::Apis::DatastoreV1beta3::LatLng, decorator: Google::Apis::DatastoreV1beta3::LatLng::Representation
      
          property :integer_value, :numeric_string => true, as: 'integerValue'
          property :key_value, as: 'keyValue', class: Google::Apis::DatastoreV1beta3::Key, decorator: Google::Apis::DatastoreV1beta3::Key::Representation
      
          property :meaning, as: 'meaning'
          property :null_value, as: 'nullValue'
          property :string_value, as: 'stringValue'
          property :timestamp_value, as: 'timestampValue'
        end
      end
    end
  end
end
