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
    module SpannerV1
      
      class BatchCreateSessionsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchCreateSessionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BeginTransactionRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Binding
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ChildLink
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
      
      class CreateDatabaseMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateDatabaseRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateInstanceMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateInstanceRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateSessionRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Database
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Delete
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExecuteBatchDmlRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExecuteBatchDmlResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExecuteSqlRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Expr
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Field
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetDatabaseDdlResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetIamPolicyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetPolicyOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Instance
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class KeyRange
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class KeySet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListDatabasesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListInstanceConfigsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListInstancesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListOperationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListSessionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Mutation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Operation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PartialResultSet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Partition
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PartitionOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PartitionQueryRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PartitionReadRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PartitionResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PartitionedDml
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PlanNode
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Policy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class QueryPlan
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReadOnly
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReadRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReadWrite
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReplicaInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResultSet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResultSetMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResultSetStats
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RollbackRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Session
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SetIamPolicyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ShortRepresentation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Statement
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Status
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StructType
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TestIamPermissionsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TestIamPermissionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Transaction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TransactionOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TransactionSelector
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Type
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateDatabaseDdlMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateDatabaseDdlRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateInstanceMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateInstanceRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Write
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchCreateSessionsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :session_count, as: 'sessionCount'
          property :session_template, as: 'sessionTemplate', class: Google::Apis::SpannerV1::Session, decorator: Google::Apis::SpannerV1::Session::Representation
      
        end
      end
      
      class BatchCreateSessionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :session, as: 'session', class: Google::Apis::SpannerV1::Session, decorator: Google::Apis::SpannerV1::Session::Representation
      
        end
      end
      
      class BeginTransactionRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :options, as: 'options', class: Google::Apis::SpannerV1::TransactionOptions, decorator: Google::Apis::SpannerV1::TransactionOptions::Representation
      
        end
      end
      
      class Binding
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :condition, as: 'condition', class: Google::Apis::SpannerV1::Expr, decorator: Google::Apis::SpannerV1::Expr::Representation
      
          collection :members, as: 'members'
          property :role, as: 'role'
        end
      end
      
      class ChildLink
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :child_index, as: 'childIndex'
          property :type, as: 'type'
          property :variable, as: 'variable'
        end
      end
      
      class CommitRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :mutations, as: 'mutations', class: Google::Apis::SpannerV1::Mutation, decorator: Google::Apis::SpannerV1::Mutation::Representation
      
          property :single_use_transaction, as: 'singleUseTransaction', class: Google::Apis::SpannerV1::TransactionOptions, decorator: Google::Apis::SpannerV1::TransactionOptions::Representation
      
          property :transaction_id, :base64 => true, as: 'transactionId'
        end
      end
      
      class CommitResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :commit_timestamp, as: 'commitTimestamp'
        end
      end
      
      class CreateDatabaseMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :database, as: 'database'
        end
      end
      
      class CreateDatabaseRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_statement, as: 'createStatement'
          collection :extra_statements, as: 'extraStatements'
        end
      end
      
      class CreateInstanceMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cancel_time, as: 'cancelTime'
          property :end_time, as: 'endTime'
          property :instance, as: 'instance', class: Google::Apis::SpannerV1::Instance, decorator: Google::Apis::SpannerV1::Instance::Representation
      
          property :start_time, as: 'startTime'
        end
      end
      
      class CreateInstanceRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :instance, as: 'instance', class: Google::Apis::SpannerV1::Instance, decorator: Google::Apis::SpannerV1::Instance::Representation
      
          property :instance_id, as: 'instanceId'
        end
      end
      
      class CreateSessionRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :session, as: 'session', class: Google::Apis::SpannerV1::Session, decorator: Google::Apis::SpannerV1::Session::Representation
      
        end
      end
      
      class Database
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :state, as: 'state'
        end
      end
      
      class Delete
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key_set, as: 'keySet', class: Google::Apis::SpannerV1::KeySet, decorator: Google::Apis::SpannerV1::KeySet::Representation
      
          property :table, as: 'table'
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class ExecuteBatchDmlRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :seqno, :numeric_string => true, as: 'seqno'
          collection :statements, as: 'statements', class: Google::Apis::SpannerV1::Statement, decorator: Google::Apis::SpannerV1::Statement::Representation
      
          property :transaction, as: 'transaction', class: Google::Apis::SpannerV1::TransactionSelector, decorator: Google::Apis::SpannerV1::TransactionSelector::Representation
      
        end
      end
      
      class ExecuteBatchDmlResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :result_sets, as: 'resultSets', class: Google::Apis::SpannerV1::ResultSet, decorator: Google::Apis::SpannerV1::ResultSet::Representation
      
          property :status, as: 'status', class: Google::Apis::SpannerV1::Status, decorator: Google::Apis::SpannerV1::Status::Representation
      
        end
      end
      
      class ExecuteSqlRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :param_types, as: 'paramTypes', class: Google::Apis::SpannerV1::Type, decorator: Google::Apis::SpannerV1::Type::Representation
      
          hash :params, as: 'params'
          property :partition_token, :base64 => true, as: 'partitionToken'
          property :query_mode, as: 'queryMode'
          property :resume_token, :base64 => true, as: 'resumeToken'
          property :seqno, :numeric_string => true, as: 'seqno'
          property :sql, as: 'sql'
          property :transaction, as: 'transaction', class: Google::Apis::SpannerV1::TransactionSelector, decorator: Google::Apis::SpannerV1::TransactionSelector::Representation
      
        end
      end
      
      class Expr
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :expression, as: 'expression'
          property :location, as: 'location'
          property :title, as: 'title'
        end
      end
      
      class Field
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :type, as: 'type', class: Google::Apis::SpannerV1::Type, decorator: Google::Apis::SpannerV1::Type::Representation
      
        end
      end
      
      class GetDatabaseDdlResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :statements, as: 'statements'
        end
      end
      
      class GetIamPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :options, as: 'options', class: Google::Apis::SpannerV1::GetPolicyOptions, decorator: Google::Apis::SpannerV1::GetPolicyOptions::Representation
      
        end
      end
      
      class GetPolicyOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :requested_policy_version, as: 'requestedPolicyVersion'
        end
      end
      
      class Instance
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :config, as: 'config'
          property :display_name, as: 'displayName'
          hash :labels, as: 'labels'
          property :name, as: 'name'
          property :node_count, as: 'nodeCount'
          property :state, as: 'state'
        end
      end
      
      class InstanceConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_name, as: 'displayName'
          property :name, as: 'name'
          collection :replicas, as: 'replicas', class: Google::Apis::SpannerV1::ReplicaInfo, decorator: Google::Apis::SpannerV1::ReplicaInfo::Representation
      
        end
      end
      
      class KeyRange
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :end_closed, as: 'endClosed'
          collection :end_open, as: 'endOpen'
          collection :start_closed, as: 'startClosed'
          collection :start_open, as: 'startOpen'
        end
      end
      
      class KeySet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :all, as: 'all'
          collection :keys, as: 'keys', :class => Array do
        include Representable::JSON::Collection
        items
      end
      
          collection :ranges, as: 'ranges', class: Google::Apis::SpannerV1::KeyRange, decorator: Google::Apis::SpannerV1::KeyRange::Representation
      
        end
      end
      
      class ListDatabasesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :databases, as: 'databases', class: Google::Apis::SpannerV1::Database, decorator: Google::Apis::SpannerV1::Database::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListInstanceConfigsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instance_configs, as: 'instanceConfigs', class: Google::Apis::SpannerV1::InstanceConfig, decorator: Google::Apis::SpannerV1::InstanceConfig::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListInstancesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instances, as: 'instances', class: Google::Apis::SpannerV1::Instance, decorator: Google::Apis::SpannerV1::Instance::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListOperationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :operations, as: 'operations', class: Google::Apis::SpannerV1::Operation, decorator: Google::Apis::SpannerV1::Operation::Representation
      
        end
      end
      
      class ListSessionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :sessions, as: 'sessions', class: Google::Apis::SpannerV1::Session, decorator: Google::Apis::SpannerV1::Session::Representation
      
        end
      end
      
      class Mutation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :delete, as: 'delete', class: Google::Apis::SpannerV1::Delete, decorator: Google::Apis::SpannerV1::Delete::Representation
      
          property :insert, as: 'insert', class: Google::Apis::SpannerV1::Write, decorator: Google::Apis::SpannerV1::Write::Representation
      
          property :insert_or_update, as: 'insertOrUpdate', class: Google::Apis::SpannerV1::Write, decorator: Google::Apis::SpannerV1::Write::Representation
      
          property :replace, as: 'replace', class: Google::Apis::SpannerV1::Write, decorator: Google::Apis::SpannerV1::Write::Representation
      
          property :update, as: 'update', class: Google::Apis::SpannerV1::Write, decorator: Google::Apis::SpannerV1::Write::Representation
      
        end
      end
      
      class Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :done, as: 'done'
          property :error, as: 'error', class: Google::Apis::SpannerV1::Status, decorator: Google::Apis::SpannerV1::Status::Representation
      
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
          hash :response, as: 'response'
        end
      end
      
      class PartialResultSet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :chunked_value, as: 'chunkedValue'
          property :metadata, as: 'metadata', class: Google::Apis::SpannerV1::ResultSetMetadata, decorator: Google::Apis::SpannerV1::ResultSetMetadata::Representation
      
          property :resume_token, :base64 => true, as: 'resumeToken'
          property :stats, as: 'stats', class: Google::Apis::SpannerV1::ResultSetStats, decorator: Google::Apis::SpannerV1::ResultSetStats::Representation
      
          collection :values, as: 'values'
        end
      end
      
      class Partition
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :partition_token, :base64 => true, as: 'partitionToken'
        end
      end
      
      class PartitionOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :max_partitions, :numeric_string => true, as: 'maxPartitions'
          property :partition_size_bytes, :numeric_string => true, as: 'partitionSizeBytes'
        end
      end
      
      class PartitionQueryRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :param_types, as: 'paramTypes', class: Google::Apis::SpannerV1::Type, decorator: Google::Apis::SpannerV1::Type::Representation
      
          hash :params, as: 'params'
          property :partition_options, as: 'partitionOptions', class: Google::Apis::SpannerV1::PartitionOptions, decorator: Google::Apis::SpannerV1::PartitionOptions::Representation
      
          property :sql, as: 'sql'
          property :transaction, as: 'transaction', class: Google::Apis::SpannerV1::TransactionSelector, decorator: Google::Apis::SpannerV1::TransactionSelector::Representation
      
        end
      end
      
      class PartitionReadRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :columns, as: 'columns'
          property :index, as: 'index'
          property :key_set, as: 'keySet', class: Google::Apis::SpannerV1::KeySet, decorator: Google::Apis::SpannerV1::KeySet::Representation
      
          property :partition_options, as: 'partitionOptions', class: Google::Apis::SpannerV1::PartitionOptions, decorator: Google::Apis::SpannerV1::PartitionOptions::Representation
      
          property :table, as: 'table'
          property :transaction, as: 'transaction', class: Google::Apis::SpannerV1::TransactionSelector, decorator: Google::Apis::SpannerV1::TransactionSelector::Representation
      
        end
      end
      
      class PartitionResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :partitions, as: 'partitions', class: Google::Apis::SpannerV1::Partition, decorator: Google::Apis::SpannerV1::Partition::Representation
      
          property :transaction, as: 'transaction', class: Google::Apis::SpannerV1::Transaction, decorator: Google::Apis::SpannerV1::Transaction::Representation
      
        end
      end
      
      class PartitionedDml
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class PlanNode
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :child_links, as: 'childLinks', class: Google::Apis::SpannerV1::ChildLink, decorator: Google::Apis::SpannerV1::ChildLink::Representation
      
          property :display_name, as: 'displayName'
          hash :execution_stats, as: 'executionStats'
          property :index, as: 'index'
          property :kind, as: 'kind'
          hash :metadata, as: 'metadata'
          property :short_representation, as: 'shortRepresentation', class: Google::Apis::SpannerV1::ShortRepresentation, decorator: Google::Apis::SpannerV1::ShortRepresentation::Representation
      
        end
      end
      
      class Policy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :bindings, as: 'bindings', class: Google::Apis::SpannerV1::Binding, decorator: Google::Apis::SpannerV1::Binding::Representation
      
          property :etag, :base64 => true, as: 'etag'
          property :version, as: 'version'
        end
      end
      
      class QueryPlan
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :plan_nodes, as: 'planNodes', class: Google::Apis::SpannerV1::PlanNode, decorator: Google::Apis::SpannerV1::PlanNode::Representation
      
        end
      end
      
      class ReadOnly
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :exact_staleness, as: 'exactStaleness'
          property :max_staleness, as: 'maxStaleness'
          property :min_read_timestamp, as: 'minReadTimestamp'
          property :read_timestamp, as: 'readTimestamp'
          property :return_read_timestamp, as: 'returnReadTimestamp'
          property :strong, as: 'strong'
        end
      end
      
      class ReadRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :columns, as: 'columns'
          property :index, as: 'index'
          property :key_set, as: 'keySet', class: Google::Apis::SpannerV1::KeySet, decorator: Google::Apis::SpannerV1::KeySet::Representation
      
          property :limit, :numeric_string => true, as: 'limit'
          property :partition_token, :base64 => true, as: 'partitionToken'
          property :resume_token, :base64 => true, as: 'resumeToken'
          property :table, as: 'table'
          property :transaction, as: 'transaction', class: Google::Apis::SpannerV1::TransactionSelector, decorator: Google::Apis::SpannerV1::TransactionSelector::Representation
      
        end
      end
      
      class ReadWrite
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class ReplicaInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :default_leader_location, as: 'defaultLeaderLocation'
          property :location, as: 'location'
          property :type, as: 'type'
        end
      end
      
      class ResultSet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :metadata, as: 'metadata', class: Google::Apis::SpannerV1::ResultSetMetadata, decorator: Google::Apis::SpannerV1::ResultSetMetadata::Representation
      
          collection :rows, as: 'rows', :class => Array do
        include Representable::JSON::Collection
        items
      end
      
          property :stats, as: 'stats', class: Google::Apis::SpannerV1::ResultSetStats, decorator: Google::Apis::SpannerV1::ResultSetStats::Representation
      
        end
      end
      
      class ResultSetMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :row_type, as: 'rowType', class: Google::Apis::SpannerV1::StructType, decorator: Google::Apis::SpannerV1::StructType::Representation
      
          property :transaction, as: 'transaction', class: Google::Apis::SpannerV1::Transaction, decorator: Google::Apis::SpannerV1::Transaction::Representation
      
        end
      end
      
      class ResultSetStats
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :query_plan, as: 'queryPlan', class: Google::Apis::SpannerV1::QueryPlan, decorator: Google::Apis::SpannerV1::QueryPlan::Representation
      
          hash :query_stats, as: 'queryStats'
          property :row_count_exact, :numeric_string => true, as: 'rowCountExact'
          property :row_count_lower_bound, :numeric_string => true, as: 'rowCountLowerBound'
        end
      end
      
      class RollbackRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :transaction_id, :base64 => true, as: 'transactionId'
        end
      end
      
      class Session
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :approximate_last_use_time, as: 'approximateLastUseTime'
          property :create_time, as: 'createTime'
          hash :labels, as: 'labels'
          property :name, as: 'name'
        end
      end
      
      class SetIamPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :policy, as: 'policy', class: Google::Apis::SpannerV1::Policy, decorator: Google::Apis::SpannerV1::Policy::Representation
      
        end
      end
      
      class ShortRepresentation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          hash :subqueries, as: 'subqueries'
        end
      end
      
      class Statement
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :param_types, as: 'paramTypes', class: Google::Apis::SpannerV1::Type, decorator: Google::Apis::SpannerV1::Type::Representation
      
          hash :params, as: 'params'
          property :sql, as: 'sql'
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
      
      class StructType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :fields, as: 'fields', class: Google::Apis::SpannerV1::Field, decorator: Google::Apis::SpannerV1::Field::Representation
      
        end
      end
      
      class TestIamPermissionsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :permissions, as: 'permissions'
        end
      end
      
      class TestIamPermissionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :permissions, as: 'permissions'
        end
      end
      
      class Transaction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, :base64 => true, as: 'id'
          property :read_timestamp, as: 'readTimestamp'
        end
      end
      
      class TransactionOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :partitioned_dml, as: 'partitionedDml', class: Google::Apis::SpannerV1::PartitionedDml, decorator: Google::Apis::SpannerV1::PartitionedDml::Representation
      
          property :read_only, as: 'readOnly', class: Google::Apis::SpannerV1::ReadOnly, decorator: Google::Apis::SpannerV1::ReadOnly::Representation
      
          property :read_write, as: 'readWrite', class: Google::Apis::SpannerV1::ReadWrite, decorator: Google::Apis::SpannerV1::ReadWrite::Representation
      
        end
      end
      
      class TransactionSelector
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :begin, as: 'begin', class: Google::Apis::SpannerV1::TransactionOptions, decorator: Google::Apis::SpannerV1::TransactionOptions::Representation
      
          property :id, :base64 => true, as: 'id'
          property :single_use, as: 'singleUse', class: Google::Apis::SpannerV1::TransactionOptions, decorator: Google::Apis::SpannerV1::TransactionOptions::Representation
      
        end
      end
      
      class Type
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :array_element_type, as: 'arrayElementType', class: Google::Apis::SpannerV1::Type, decorator: Google::Apis::SpannerV1::Type::Representation
      
          property :code, as: 'code'
          property :struct_type, as: 'structType', class: Google::Apis::SpannerV1::StructType, decorator: Google::Apis::SpannerV1::StructType::Representation
      
        end
      end
      
      class UpdateDatabaseDdlMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :commit_timestamps, as: 'commitTimestamps'
          property :database, as: 'database'
          collection :statements, as: 'statements'
        end
      end
      
      class UpdateDatabaseDdlRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :operation_id, as: 'operationId'
          collection :statements, as: 'statements'
        end
      end
      
      class UpdateInstanceMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cancel_time, as: 'cancelTime'
          property :end_time, as: 'endTime'
          property :instance, as: 'instance', class: Google::Apis::SpannerV1::Instance, decorator: Google::Apis::SpannerV1::Instance::Representation
      
          property :start_time, as: 'startTime'
        end
      end
      
      class UpdateInstanceRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :field_mask, as: 'fieldMask'
          property :instance, as: 'instance', class: Google::Apis::SpannerV1::Instance, decorator: Google::Apis::SpannerV1::Instance::Representation
      
        end
      end
      
      class Write
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :columns, as: 'columns'
          property :table, as: 'table'
          collection :values, as: 'values', :class => Array do
        include Representable::JSON::Collection
        items
      end
      
        end
      end
    end
  end
end
