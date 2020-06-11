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
    module BigqueryV2
      
      class AggregateClassificationMetrics
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Argument
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ArimaCoefficients
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ArimaFittingMetrics
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ArimaModelInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ArimaOrder
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ArimaResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BigQueryModelTraining
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BigtableColumn
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BigtableColumnFamily
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BigtableOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BinaryClassificationMetrics
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BinaryConfusionMatrix
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BqmlIterationResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BqmlTrainingRun
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class TrainingOptions
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CategoricalValue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CategoryCount
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Cluster
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ClusterInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Clustering
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ClusteringMetrics
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfusionMatrix
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CsvOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DataSplitResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Dataset
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Access
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DatasetList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Dataset
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DatasetReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DestinationTableProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EncryptionConfiguration
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Entry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ErrorProto
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EvaluationMetrics
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExplainQueryStage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExplainQueryStep
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExternalDataConfiguration
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FeatureValue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetQueryResultsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetServiceAccountResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleSheetsOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HivePartitioningOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class IterationResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Job
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CancelJobResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JobConfiguration
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JobConfigurationExtract
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JobConfigurationLoad
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JobConfigurationQuery
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JobConfigurationTableCopy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JobList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Job
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JobReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JobStatistics
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class ReservationUsage
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JobStatistics2
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class ReservationUsage
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JobStatistics3
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JobStatistics4
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JobStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListModelsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListRoutinesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LocationMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MaterializedViewDefinition
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Model
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ModelDefinition
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class ModelOptions
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ModelReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MultiClassClassificationMetrics
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProjectList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Project
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProjectReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class QueryParameter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class QueryParameterType
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class StructType
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class QueryParameterValue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class QueryRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class QueryResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class QueryTimelineSample
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RangePartitioning
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Range
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegressionMetrics
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Routine
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RoutineReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Row
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ScriptStackFrame
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ScriptStatistics
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StandardSqlDataType
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StandardSqlField
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StandardSqlStructType
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Streamingbuffer
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Table
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TableCell
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InsertAllTableDataRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Row
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InsertAllTableDataResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class InsertError
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TableDataList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TableFieldSchema
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Categories
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TableList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Table
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class View
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TableReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TableRow
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TableSchema
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TimePartitioning
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TrainingOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TrainingRun
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserDefinedFunctionResource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ViewDefinition
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AggregateClassificationMetrics
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :accuracy, as: 'accuracy'
          property :f1_score, as: 'f1Score'
          property :log_loss, as: 'logLoss'
          property :precision, as: 'precision'
          property :recall, as: 'recall'
          property :roc_auc, as: 'rocAuc'
          property :threshold, as: 'threshold'
        end
      end
      
      class Argument
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :argument_kind, as: 'argumentKind'
          property :data_type, as: 'dataType', class: Google::Apis::BigqueryV2::StandardSqlDataType, decorator: Google::Apis::BigqueryV2::StandardSqlDataType::Representation
      
          property :mode, as: 'mode'
          property :name, as: 'name'
        end
      end
      
      class ArimaCoefficients
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :auto_regressive_coefficients, as: 'autoRegressiveCoefficients'
          property :intercept_coefficient, as: 'interceptCoefficient'
          collection :moving_average_coefficients, as: 'movingAverageCoefficients'
        end
      end
      
      class ArimaFittingMetrics
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :aic, as: 'aic'
          property :log_likelihood, as: 'logLikelihood'
          property :variance, as: 'variance'
        end
      end
      
      class ArimaModelInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :arima_coefficients, as: 'arimaCoefficients', class: Google::Apis::BigqueryV2::ArimaCoefficients, decorator: Google::Apis::BigqueryV2::ArimaCoefficients::Representation
      
          property :arima_fitting_metrics, as: 'arimaFittingMetrics', class: Google::Apis::BigqueryV2::ArimaFittingMetrics, decorator: Google::Apis::BigqueryV2::ArimaFittingMetrics::Representation
      
          property :non_seasonal_order, as: 'nonSeasonalOrder', class: Google::Apis::BigqueryV2::ArimaOrder, decorator: Google::Apis::BigqueryV2::ArimaOrder::Representation
      
        end
      end
      
      class ArimaOrder
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :d, :numeric_string => true, as: 'd'
          property :p, :numeric_string => true, as: 'p'
          property :q, :numeric_string => true, as: 'q'
        end
      end
      
      class ArimaResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :arima_model_info, as: 'arimaModelInfo', class: Google::Apis::BigqueryV2::ArimaModelInfo, decorator: Google::Apis::BigqueryV2::ArimaModelInfo::Representation
      
          collection :seasonal_periods, as: 'seasonalPeriods'
        end
      end
      
      class BigQueryModelTraining
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :current_iteration, as: 'currentIteration'
          property :expected_total_iterations, :numeric_string => true, as: 'expectedTotalIterations'
        end
      end
      
      class BigtableColumn
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :encoding, as: 'encoding'
          property :field_name, as: 'fieldName'
          property :only_read_latest, as: 'onlyReadLatest'
          property :qualifier_encoded, :base64 => true, as: 'qualifierEncoded'
          property :qualifier_string, as: 'qualifierString'
          property :type, as: 'type'
        end
      end
      
      class BigtableColumnFamily
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :columns, as: 'columns', class: Google::Apis::BigqueryV2::BigtableColumn, decorator: Google::Apis::BigqueryV2::BigtableColumn::Representation
      
          property :encoding, as: 'encoding'
          property :family_id, as: 'familyId'
          property :only_read_latest, as: 'onlyReadLatest'
          property :type, as: 'type'
        end
      end
      
      class BigtableOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :column_families, as: 'columnFamilies', class: Google::Apis::BigqueryV2::BigtableColumnFamily, decorator: Google::Apis::BigqueryV2::BigtableColumnFamily::Representation
      
          property :ignore_unspecified_column_families, as: 'ignoreUnspecifiedColumnFamilies'
          property :read_rowkey_as_string, as: 'readRowkeyAsString'
        end
      end
      
      class BinaryClassificationMetrics
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :aggregate_classification_metrics, as: 'aggregateClassificationMetrics', class: Google::Apis::BigqueryV2::AggregateClassificationMetrics, decorator: Google::Apis::BigqueryV2::AggregateClassificationMetrics::Representation
      
          collection :binary_confusion_matrix_list, as: 'binaryConfusionMatrixList', class: Google::Apis::BigqueryV2::BinaryConfusionMatrix, decorator: Google::Apis::BigqueryV2::BinaryConfusionMatrix::Representation
      
          property :negative_label, as: 'negativeLabel'
          property :positive_label, as: 'positiveLabel'
        end
      end
      
      class BinaryConfusionMatrix
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :accuracy, as: 'accuracy'
          property :f1_score, as: 'f1Score'
          property :false_negatives, :numeric_string => true, as: 'falseNegatives'
          property :false_positives, :numeric_string => true, as: 'falsePositives'
          property :positive_class_threshold, as: 'positiveClassThreshold'
          property :precision, as: 'precision'
          property :recall, as: 'recall'
          property :true_negatives, :numeric_string => true, as: 'trueNegatives'
          property :true_positives, :numeric_string => true, as: 'truePositives'
        end
      end
      
      class BqmlIterationResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :duration_ms, :numeric_string => true, as: 'durationMs'
          property :eval_loss, as: 'evalLoss'
          property :index, as: 'index'
          property :learn_rate, as: 'learnRate'
          property :training_loss, as: 'trainingLoss'
        end
      end
      
      class BqmlTrainingRun
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :iteration_results, as: 'iterationResults', class: Google::Apis::BigqueryV2::BqmlIterationResult, decorator: Google::Apis::BigqueryV2::BqmlIterationResult::Representation
      
          property :start_time, as: 'startTime', type: DateTime
      
          property :state, as: 'state'
          property :training_options, as: 'trainingOptions', class: Google::Apis::BigqueryV2::BqmlTrainingRun::TrainingOptions, decorator: Google::Apis::BigqueryV2::BqmlTrainingRun::TrainingOptions::Representation
      
        end
        
        class TrainingOptions
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :early_stop, as: 'earlyStop'
            property :l1_reg, as: 'l1Reg'
            property :l2_reg, as: 'l2Reg'
            property :learn_rate, as: 'learnRate'
            property :learn_rate_strategy, as: 'learnRateStrategy'
            property :line_search_init_learn_rate, as: 'lineSearchInitLearnRate'
            property :max_iteration, :numeric_string => true, as: 'maxIteration'
            property :min_rel_progress, as: 'minRelProgress'
            property :warm_start, as: 'warmStart'
          end
        end
      end
      
      class CategoricalValue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :category_counts, as: 'categoryCounts', class: Google::Apis::BigqueryV2::CategoryCount, decorator: Google::Apis::BigqueryV2::CategoryCount::Representation
      
        end
      end
      
      class CategoryCount
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :category, as: 'category'
          property :count, :numeric_string => true, as: 'count'
        end
      end
      
      class Cluster
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :centroid_id, :numeric_string => true, as: 'centroidId'
          property :count, :numeric_string => true, as: 'count'
          collection :feature_values, as: 'featureValues', class: Google::Apis::BigqueryV2::FeatureValue, decorator: Google::Apis::BigqueryV2::FeatureValue::Representation
      
        end
      end
      
      class ClusterInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :centroid_id, :numeric_string => true, as: 'centroidId'
          property :cluster_radius, as: 'clusterRadius'
          property :cluster_size, :numeric_string => true, as: 'clusterSize'
        end
      end
      
      class Clustering
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :fields, as: 'fields'
        end
      end
      
      class ClusteringMetrics
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :clusters, as: 'clusters', class: Google::Apis::BigqueryV2::Cluster, decorator: Google::Apis::BigqueryV2::Cluster::Representation
      
          property :davies_bouldin_index, as: 'daviesBouldinIndex'
          property :mean_squared_distance, as: 'meanSquaredDistance'
        end
      end
      
      class ConfusionMatrix
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :confidence_threshold, as: 'confidenceThreshold'
          collection :rows, as: 'rows', class: Google::Apis::BigqueryV2::Row, decorator: Google::Apis::BigqueryV2::Row::Representation
      
        end
      end
      
      class CsvOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :allow_jagged_rows, as: 'allowJaggedRows'
          property :allow_quoted_newlines, as: 'allowQuotedNewlines'
          property :encoding, as: 'encoding'
          property :field_delimiter, as: 'fieldDelimiter'
          property :quote, as: 'quote'
          property :skip_leading_rows, :numeric_string => true, as: 'skipLeadingRows'
        end
      end
      
      class DataSplitResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :evaluation_table, as: 'evaluationTable', class: Google::Apis::BigqueryV2::TableReference, decorator: Google::Apis::BigqueryV2::TableReference::Representation
      
          property :training_table, as: 'trainingTable', class: Google::Apis::BigqueryV2::TableReference, decorator: Google::Apis::BigqueryV2::TableReference::Representation
      
        end
      end
      
      class Dataset
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :access, as: 'access', class: Google::Apis::BigqueryV2::Dataset::Access, decorator: Google::Apis::BigqueryV2::Dataset::Access::Representation
      
          property :creation_time, :numeric_string => true, as: 'creationTime'
          property :dataset_reference, as: 'datasetReference', class: Google::Apis::BigqueryV2::DatasetReference, decorator: Google::Apis::BigqueryV2::DatasetReference::Representation
      
          property :default_encryption_configuration, as: 'defaultEncryptionConfiguration', class: Google::Apis::BigqueryV2::EncryptionConfiguration, decorator: Google::Apis::BigqueryV2::EncryptionConfiguration::Representation
      
          property :default_partition_expiration_ms, :numeric_string => true, as: 'defaultPartitionExpirationMs'
          property :default_table_expiration_ms, :numeric_string => true, as: 'defaultTableExpirationMs'
          property :description, as: 'description'
          property :etag, as: 'etag'
          property :friendly_name, as: 'friendlyName'
          property :id, as: 'id'
          property :kind, as: 'kind'
          hash :labels, as: 'labels'
          property :last_modified_time, :numeric_string => true, as: 'lastModifiedTime'
          property :location, as: 'location'
          property :self_link, as: 'selfLink'
        end
        
        class Access
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :domain, as: 'domain'
            property :group_by_email, as: 'groupByEmail'
            property :iam_member, as: 'iamMember'
            property :role, as: 'role'
            property :special_group, as: 'specialGroup'
            property :user_by_email, as: 'userByEmail'
            property :view, as: 'view', class: Google::Apis::BigqueryV2::TableReference, decorator: Google::Apis::BigqueryV2::TableReference::Representation
        
          end
        end
      end
      
      class DatasetList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :datasets, as: 'datasets', class: Google::Apis::BigqueryV2::DatasetList::Dataset, decorator: Google::Apis::BigqueryV2::DatasetList::Dataset::Representation
      
          property :etag, as: 'etag'
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
        
        class Dataset
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :dataset_reference, as: 'datasetReference', class: Google::Apis::BigqueryV2::DatasetReference, decorator: Google::Apis::BigqueryV2::DatasetReference::Representation
        
            property :friendly_name, as: 'friendlyName'
            property :id, as: 'id'
            property :kind, as: 'kind'
            hash :labels, as: 'labels'
            property :location, as: 'location'
          end
        end
      end
      
      class DatasetReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dataset_id, as: 'datasetId'
          property :project_id, as: 'projectId'
        end
      end
      
      class DestinationTableProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :friendly_name, as: 'friendlyName'
          hash :labels, as: 'labels'
        end
      end
      
      class EncryptionConfiguration
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kms_key_name, as: 'kmsKeyName'
        end
      end
      
      class Entry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :item_count, :numeric_string => true, as: 'itemCount'
          property :predicted_label, as: 'predictedLabel'
        end
      end
      
      class ErrorProto
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :debug_info, as: 'debugInfo'
          property :location, as: 'location'
          property :message, as: 'message'
          property :reason, as: 'reason'
        end
      end
      
      class EvaluationMetrics
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :binary_classification_metrics, as: 'binaryClassificationMetrics', class: Google::Apis::BigqueryV2::BinaryClassificationMetrics, decorator: Google::Apis::BigqueryV2::BinaryClassificationMetrics::Representation
      
          property :clustering_metrics, as: 'clusteringMetrics', class: Google::Apis::BigqueryV2::ClusteringMetrics, decorator: Google::Apis::BigqueryV2::ClusteringMetrics::Representation
      
          property :multi_class_classification_metrics, as: 'multiClassClassificationMetrics', class: Google::Apis::BigqueryV2::MultiClassClassificationMetrics, decorator: Google::Apis::BigqueryV2::MultiClassClassificationMetrics::Representation
      
          property :regression_metrics, as: 'regressionMetrics', class: Google::Apis::BigqueryV2::RegressionMetrics, decorator: Google::Apis::BigqueryV2::RegressionMetrics::Representation
      
        end
      end
      
      class ExplainQueryStage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :completed_parallel_inputs, :numeric_string => true, as: 'completedParallelInputs'
          property :compute_ms_avg, :numeric_string => true, as: 'computeMsAvg'
          property :compute_ms_max, :numeric_string => true, as: 'computeMsMax'
          property :compute_ratio_avg, as: 'computeRatioAvg'
          property :compute_ratio_max, as: 'computeRatioMax'
          property :end_ms, :numeric_string => true, as: 'endMs'
          property :id, :numeric_string => true, as: 'id'
          collection :input_stages, as: 'inputStages'
          property :name, as: 'name'
          property :parallel_inputs, :numeric_string => true, as: 'parallelInputs'
          property :read_ms_avg, :numeric_string => true, as: 'readMsAvg'
          property :read_ms_max, :numeric_string => true, as: 'readMsMax'
          property :read_ratio_avg, as: 'readRatioAvg'
          property :read_ratio_max, as: 'readRatioMax'
          property :records_read, :numeric_string => true, as: 'recordsRead'
          property :records_written, :numeric_string => true, as: 'recordsWritten'
          property :shuffle_output_bytes, :numeric_string => true, as: 'shuffleOutputBytes'
          property :shuffle_output_bytes_spilled, :numeric_string => true, as: 'shuffleOutputBytesSpilled'
          property :start_ms, :numeric_string => true, as: 'startMs'
          property :status, as: 'status'
          collection :steps, as: 'steps', class: Google::Apis::BigqueryV2::ExplainQueryStep, decorator: Google::Apis::BigqueryV2::ExplainQueryStep::Representation
      
          property :wait_ms_avg, :numeric_string => true, as: 'waitMsAvg'
          property :wait_ms_max, :numeric_string => true, as: 'waitMsMax'
          property :wait_ratio_avg, as: 'waitRatioAvg'
          property :wait_ratio_max, as: 'waitRatioMax'
          property :write_ms_avg, :numeric_string => true, as: 'writeMsAvg'
          property :write_ms_max, :numeric_string => true, as: 'writeMsMax'
          property :write_ratio_avg, as: 'writeRatioAvg'
          property :write_ratio_max, as: 'writeRatioMax'
        end
      end
      
      class ExplainQueryStep
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :substeps, as: 'substeps'
        end
      end
      
      class ExternalDataConfiguration
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :autodetect, as: 'autodetect'
          property :bigtable_options, as: 'bigtableOptions', class: Google::Apis::BigqueryV2::BigtableOptions, decorator: Google::Apis::BigqueryV2::BigtableOptions::Representation
      
          property :compression, as: 'compression'
          property :csv_options, as: 'csvOptions', class: Google::Apis::BigqueryV2::CsvOptions, decorator: Google::Apis::BigqueryV2::CsvOptions::Representation
      
          property :google_sheets_options, as: 'googleSheetsOptions', class: Google::Apis::BigqueryV2::GoogleSheetsOptions, decorator: Google::Apis::BigqueryV2::GoogleSheetsOptions::Representation
      
          property :hive_partitioning_mode, as: 'hivePartitioningMode'
          property :hive_partitioning_options, as: 'hivePartitioningOptions', class: Google::Apis::BigqueryV2::HivePartitioningOptions, decorator: Google::Apis::BigqueryV2::HivePartitioningOptions::Representation
      
          property :ignore_unknown_values, as: 'ignoreUnknownValues'
          property :max_bad_records, as: 'maxBadRecords'
          property :schema, as: 'schema', class: Google::Apis::BigqueryV2::TableSchema, decorator: Google::Apis::BigqueryV2::TableSchema::Representation
      
          property :source_format, as: 'sourceFormat'
          collection :source_uris, as: 'sourceUris'
        end
      end
      
      class FeatureValue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :categorical_value, as: 'categoricalValue', class: Google::Apis::BigqueryV2::CategoricalValue, decorator: Google::Apis::BigqueryV2::CategoricalValue::Representation
      
          property :feature_column, as: 'featureColumn'
          property :numerical_value, as: 'numericalValue'
        end
      end
      
      class GetQueryResultsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cache_hit, as: 'cacheHit'
          collection :errors, as: 'errors', class: Google::Apis::BigqueryV2::ErrorProto, decorator: Google::Apis::BigqueryV2::ErrorProto::Representation
      
          property :etag, as: 'etag'
          property :job_complete, as: 'jobComplete'
          property :job_reference, as: 'jobReference', class: Google::Apis::BigqueryV2::JobReference, decorator: Google::Apis::BigqueryV2::JobReference::Representation
      
          property :kind, as: 'kind'
          property :num_dml_affected_rows, :numeric_string => true, as: 'numDmlAffectedRows'
          property :page_token, as: 'pageToken'
          collection :rows, as: 'rows', class: Google::Apis::BigqueryV2::TableRow, decorator: Google::Apis::BigqueryV2::TableRow::Representation
      
          property :schema, as: 'schema', class: Google::Apis::BigqueryV2::TableSchema, decorator: Google::Apis::BigqueryV2::TableSchema::Representation
      
          property :total_bytes_processed, :numeric_string => true, as: 'totalBytesProcessed'
          property :total_rows, :numeric_string => true, as: 'totalRows'
        end
      end
      
      class GetServiceAccountResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :email, as: 'email'
          property :kind, as: 'kind'
        end
      end
      
      class GoogleSheetsOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :range, as: 'range'
          property :skip_leading_rows, :numeric_string => true, as: 'skipLeadingRows'
        end
      end
      
      class HivePartitioningOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :mode, as: 'mode'
          property :source_uri_prefix, as: 'sourceUriPrefix'
        end
      end
      
      class IterationResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :arima_result, as: 'arimaResult', class: Google::Apis::BigqueryV2::ArimaResult, decorator: Google::Apis::BigqueryV2::ArimaResult::Representation
      
          collection :cluster_infos, as: 'clusterInfos', class: Google::Apis::BigqueryV2::ClusterInfo, decorator: Google::Apis::BigqueryV2::ClusterInfo::Representation
      
          property :duration_ms, :numeric_string => true, as: 'durationMs'
          property :eval_loss, as: 'evalLoss'
          property :index, as: 'index'
          property :learn_rate, as: 'learnRate'
          property :training_loss, as: 'trainingLoss'
        end
      end
      
      class Job
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :configuration, as: 'configuration', class: Google::Apis::BigqueryV2::JobConfiguration, decorator: Google::Apis::BigqueryV2::JobConfiguration::Representation
      
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :job_reference, as: 'jobReference', class: Google::Apis::BigqueryV2::JobReference, decorator: Google::Apis::BigqueryV2::JobReference::Representation
      
          property :kind, as: 'kind'
          property :self_link, as: 'selfLink'
          property :statistics, as: 'statistics', class: Google::Apis::BigqueryV2::JobStatistics, decorator: Google::Apis::BigqueryV2::JobStatistics::Representation
      
          property :status, as: 'status', class: Google::Apis::BigqueryV2::JobStatus, decorator: Google::Apis::BigqueryV2::JobStatus::Representation
      
          property :user_email, as: 'user_email'
        end
      end
      
      class CancelJobResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :job, as: 'job', class: Google::Apis::BigqueryV2::Job, decorator: Google::Apis::BigqueryV2::Job::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class JobConfiguration
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :copy, as: 'copy', class: Google::Apis::BigqueryV2::JobConfigurationTableCopy, decorator: Google::Apis::BigqueryV2::JobConfigurationTableCopy::Representation
      
          property :dry_run, as: 'dryRun'
          property :extract, as: 'extract', class: Google::Apis::BigqueryV2::JobConfigurationExtract, decorator: Google::Apis::BigqueryV2::JobConfigurationExtract::Representation
      
          property :job_timeout_ms, :numeric_string => true, as: 'jobTimeoutMs'
          property :job_type, as: 'jobType'
          hash :labels, as: 'labels'
          property :load, as: 'load', class: Google::Apis::BigqueryV2::JobConfigurationLoad, decorator: Google::Apis::BigqueryV2::JobConfigurationLoad::Representation
      
          property :query, as: 'query', class: Google::Apis::BigqueryV2::JobConfigurationQuery, decorator: Google::Apis::BigqueryV2::JobConfigurationQuery::Representation
      
        end
      end
      
      class JobConfigurationExtract
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :compression, as: 'compression'
          property :destination_format, as: 'destinationFormat'
          property :destination_uri, as: 'destinationUri'
          collection :destination_uris, as: 'destinationUris'
          property :field_delimiter, as: 'fieldDelimiter'
          property :print_header, as: 'printHeader'
          property :source_model, as: 'sourceModel', class: Google::Apis::BigqueryV2::ModelReference, decorator: Google::Apis::BigqueryV2::ModelReference::Representation
      
          property :source_table, as: 'sourceTable', class: Google::Apis::BigqueryV2::TableReference, decorator: Google::Apis::BigqueryV2::TableReference::Representation
      
          property :use_avro_logical_types, as: 'useAvroLogicalTypes'
        end
      end
      
      class JobConfigurationLoad
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :allow_jagged_rows, as: 'allowJaggedRows'
          property :allow_quoted_newlines, as: 'allowQuotedNewlines'
          property :autodetect, as: 'autodetect'
          property :clustering, as: 'clustering', class: Google::Apis::BigqueryV2::Clustering, decorator: Google::Apis::BigqueryV2::Clustering::Representation
      
          property :create_disposition, as: 'createDisposition'
          property :destination_encryption_configuration, as: 'destinationEncryptionConfiguration', class: Google::Apis::BigqueryV2::EncryptionConfiguration, decorator: Google::Apis::BigqueryV2::EncryptionConfiguration::Representation
      
          property :destination_table, as: 'destinationTable', class: Google::Apis::BigqueryV2::TableReference, decorator: Google::Apis::BigqueryV2::TableReference::Representation
      
          property :destination_table_properties, as: 'destinationTableProperties', class: Google::Apis::BigqueryV2::DestinationTableProperties, decorator: Google::Apis::BigqueryV2::DestinationTableProperties::Representation
      
          property :encoding, as: 'encoding'
          property :field_delimiter, as: 'fieldDelimiter'
          property :hive_partitioning_mode, as: 'hivePartitioningMode'
          property :hive_partitioning_options, as: 'hivePartitioningOptions', class: Google::Apis::BigqueryV2::HivePartitioningOptions, decorator: Google::Apis::BigqueryV2::HivePartitioningOptions::Representation
      
          property :ignore_unknown_values, as: 'ignoreUnknownValues'
          property :max_bad_records, as: 'maxBadRecords'
          property :null_marker, as: 'nullMarker'
          collection :projection_fields, as: 'projectionFields'
          property :quote, as: 'quote'
          property :range_partitioning, as: 'rangePartitioning', class: Google::Apis::BigqueryV2::RangePartitioning, decorator: Google::Apis::BigqueryV2::RangePartitioning::Representation
      
          property :schema, as: 'schema', class: Google::Apis::BigqueryV2::TableSchema, decorator: Google::Apis::BigqueryV2::TableSchema::Representation
      
          property :schema_inline, as: 'schemaInline'
          property :schema_inline_format, as: 'schemaInlineFormat'
          collection :schema_update_options, as: 'schemaUpdateOptions'
          property :skip_leading_rows, as: 'skipLeadingRows'
          property :source_format, as: 'sourceFormat'
          collection :source_uris, as: 'sourceUris'
          property :time_partitioning, as: 'timePartitioning', class: Google::Apis::BigqueryV2::TimePartitioning, decorator: Google::Apis::BigqueryV2::TimePartitioning::Representation
      
          property :use_avro_logical_types, as: 'useAvroLogicalTypes'
          property :write_disposition, as: 'writeDisposition'
        end
      end
      
      class JobConfigurationQuery
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :allow_large_results, as: 'allowLargeResults'
          property :clustering, as: 'clustering', class: Google::Apis::BigqueryV2::Clustering, decorator: Google::Apis::BigqueryV2::Clustering::Representation
      
          property :create_disposition, as: 'createDisposition'
          property :default_dataset, as: 'defaultDataset', class: Google::Apis::BigqueryV2::DatasetReference, decorator: Google::Apis::BigqueryV2::DatasetReference::Representation
      
          property :destination_encryption_configuration, as: 'destinationEncryptionConfiguration', class: Google::Apis::BigqueryV2::EncryptionConfiguration, decorator: Google::Apis::BigqueryV2::EncryptionConfiguration::Representation
      
          property :destination_table, as: 'destinationTable', class: Google::Apis::BigqueryV2::TableReference, decorator: Google::Apis::BigqueryV2::TableReference::Representation
      
          property :flatten_results, as: 'flattenResults'
          property :maximum_billing_tier, as: 'maximumBillingTier'
          property :maximum_bytes_billed, :numeric_string => true, as: 'maximumBytesBilled'
          property :parameter_mode, as: 'parameterMode'
          property :preserve_nulls, as: 'preserveNulls'
          property :priority, as: 'priority'
          property :query, as: 'query'
          collection :query_parameters, as: 'queryParameters', class: Google::Apis::BigqueryV2::QueryParameter, decorator: Google::Apis::BigqueryV2::QueryParameter::Representation
      
          property :range_partitioning, as: 'rangePartitioning', class: Google::Apis::BigqueryV2::RangePartitioning, decorator: Google::Apis::BigqueryV2::RangePartitioning::Representation
      
          collection :schema_update_options, as: 'schemaUpdateOptions'
          hash :table_definitions, as: 'tableDefinitions', class: Google::Apis::BigqueryV2::ExternalDataConfiguration, decorator: Google::Apis::BigqueryV2::ExternalDataConfiguration::Representation
      
          property :time_partitioning, as: 'timePartitioning', class: Google::Apis::BigqueryV2::TimePartitioning, decorator: Google::Apis::BigqueryV2::TimePartitioning::Representation
      
          property :use_legacy_sql, as: 'useLegacySql'
          property :use_query_cache, as: 'useQueryCache'
          collection :user_defined_function_resources, as: 'userDefinedFunctionResources', class: Google::Apis::BigqueryV2::UserDefinedFunctionResource, decorator: Google::Apis::BigqueryV2::UserDefinedFunctionResource::Representation
      
          property :write_disposition, as: 'writeDisposition'
        end
      end
      
      class JobConfigurationTableCopy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_disposition, as: 'createDisposition'
          property :destination_encryption_configuration, as: 'destinationEncryptionConfiguration', class: Google::Apis::BigqueryV2::EncryptionConfiguration, decorator: Google::Apis::BigqueryV2::EncryptionConfiguration::Representation
      
          property :destination_table, as: 'destinationTable', class: Google::Apis::BigqueryV2::TableReference, decorator: Google::Apis::BigqueryV2::TableReference::Representation
      
          property :source_table, as: 'sourceTable', class: Google::Apis::BigqueryV2::TableReference, decorator: Google::Apis::BigqueryV2::TableReference::Representation
      
          collection :source_tables, as: 'sourceTables', class: Google::Apis::BigqueryV2::TableReference, decorator: Google::Apis::BigqueryV2::TableReference::Representation
      
          property :write_disposition, as: 'writeDisposition'
        end
      end
      
      class JobList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :jobs, as: 'jobs', class: Google::Apis::BigqueryV2::JobList::Job, decorator: Google::Apis::BigqueryV2::JobList::Job::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
        
        class Job
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :configuration, as: 'configuration', class: Google::Apis::BigqueryV2::JobConfiguration, decorator: Google::Apis::BigqueryV2::JobConfiguration::Representation
        
            property :error_result, as: 'errorResult', class: Google::Apis::BigqueryV2::ErrorProto, decorator: Google::Apis::BigqueryV2::ErrorProto::Representation
        
            property :id, as: 'id'
            property :job_reference, as: 'jobReference', class: Google::Apis::BigqueryV2::JobReference, decorator: Google::Apis::BigqueryV2::JobReference::Representation
        
            property :kind, as: 'kind'
            property :state, as: 'state'
            property :statistics, as: 'statistics', class: Google::Apis::BigqueryV2::JobStatistics, decorator: Google::Apis::BigqueryV2::JobStatistics::Representation
        
            property :status, as: 'status', class: Google::Apis::BigqueryV2::JobStatus, decorator: Google::Apis::BigqueryV2::JobStatus::Representation
        
            property :user_email, as: 'user_email'
          end
        end
      end
      
      class JobReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :job_id, as: 'jobId'
          property :location, as: 'location'
          property :project_id, as: 'projectId'
        end
      end
      
      class JobStatistics
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :completion_ratio, as: 'completionRatio'
          property :creation_time, :numeric_string => true, as: 'creationTime'
          property :end_time, :numeric_string => true, as: 'endTime'
          property :extract, as: 'extract', class: Google::Apis::BigqueryV2::JobStatistics4, decorator: Google::Apis::BigqueryV2::JobStatistics4::Representation
      
          property :load, as: 'load', class: Google::Apis::BigqueryV2::JobStatistics3, decorator: Google::Apis::BigqueryV2::JobStatistics3::Representation
      
          property :num_child_jobs, :numeric_string => true, as: 'numChildJobs'
          property :parent_job_id, as: 'parentJobId'
          property :query, as: 'query', class: Google::Apis::BigqueryV2::JobStatistics2, decorator: Google::Apis::BigqueryV2::JobStatistics2::Representation
      
          collection :quota_deferments, as: 'quotaDeferments'
          collection :reservation_usage, as: 'reservationUsage', class: Google::Apis::BigqueryV2::JobStatistics::ReservationUsage, decorator: Google::Apis::BigqueryV2::JobStatistics::ReservationUsage::Representation
      
          property :reservation_id, as: 'reservation_id'
          property :script_statistics, as: 'scriptStatistics', class: Google::Apis::BigqueryV2::ScriptStatistics, decorator: Google::Apis::BigqueryV2::ScriptStatistics::Representation
      
          property :start_time, :numeric_string => true, as: 'startTime'
          property :total_bytes_processed, :numeric_string => true, as: 'totalBytesProcessed'
          property :total_slot_ms, :numeric_string => true, as: 'totalSlotMs'
        end
        
        class ReservationUsage
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :name, as: 'name'
            property :slot_ms, :numeric_string => true, as: 'slotMs'
          end
        end
      end
      
      class JobStatistics2
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :billing_tier, as: 'billingTier'
          property :cache_hit, as: 'cacheHit'
          property :ddl_operation_performed, as: 'ddlOperationPerformed'
          property :ddl_target_routine, as: 'ddlTargetRoutine', class: Google::Apis::BigqueryV2::RoutineReference, decorator: Google::Apis::BigqueryV2::RoutineReference::Representation
      
          property :ddl_target_table, as: 'ddlTargetTable', class: Google::Apis::BigqueryV2::TableReference, decorator: Google::Apis::BigqueryV2::TableReference::Representation
      
          property :estimated_bytes_processed, :numeric_string => true, as: 'estimatedBytesProcessed'
          property :model_training, as: 'modelTraining', class: Google::Apis::BigqueryV2::BigQueryModelTraining, decorator: Google::Apis::BigqueryV2::BigQueryModelTraining::Representation
      
          property :model_training_current_iteration, as: 'modelTrainingCurrentIteration'
          property :model_training_expected_total_iteration, :numeric_string => true, as: 'modelTrainingExpectedTotalIteration'
          property :num_dml_affected_rows, :numeric_string => true, as: 'numDmlAffectedRows'
          collection :query_plan, as: 'queryPlan', class: Google::Apis::BigqueryV2::ExplainQueryStage, decorator: Google::Apis::BigqueryV2::ExplainQueryStage::Representation
      
          collection :referenced_routines, as: 'referencedRoutines', class: Google::Apis::BigqueryV2::RoutineReference, decorator: Google::Apis::BigqueryV2::RoutineReference::Representation
      
          collection :referenced_tables, as: 'referencedTables', class: Google::Apis::BigqueryV2::TableReference, decorator: Google::Apis::BigqueryV2::TableReference::Representation
      
          collection :reservation_usage, as: 'reservationUsage', class: Google::Apis::BigqueryV2::JobStatistics2::ReservationUsage, decorator: Google::Apis::BigqueryV2::JobStatistics2::ReservationUsage::Representation
      
          property :schema, as: 'schema', class: Google::Apis::BigqueryV2::TableSchema, decorator: Google::Apis::BigqueryV2::TableSchema::Representation
      
          property :statement_type, as: 'statementType'
          collection :timeline, as: 'timeline', class: Google::Apis::BigqueryV2::QueryTimelineSample, decorator: Google::Apis::BigqueryV2::QueryTimelineSample::Representation
      
          property :total_bytes_billed, :numeric_string => true, as: 'totalBytesBilled'
          property :total_bytes_processed, :numeric_string => true, as: 'totalBytesProcessed'
          property :total_bytes_processed_accuracy, as: 'totalBytesProcessedAccuracy'
          property :total_partitions_processed, :numeric_string => true, as: 'totalPartitionsProcessed'
          property :total_slot_ms, :numeric_string => true, as: 'totalSlotMs'
          collection :undeclared_query_parameters, as: 'undeclaredQueryParameters', class: Google::Apis::BigqueryV2::QueryParameter, decorator: Google::Apis::BigqueryV2::QueryParameter::Representation
      
        end
        
        class ReservationUsage
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :name, as: 'name'
            property :slot_ms, :numeric_string => true, as: 'slotMs'
          end
        end
      end
      
      class JobStatistics3
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bad_records, :numeric_string => true, as: 'badRecords'
          property :input_file_bytes, :numeric_string => true, as: 'inputFileBytes'
          property :input_files, :numeric_string => true, as: 'inputFiles'
          property :output_bytes, :numeric_string => true, as: 'outputBytes'
          property :output_rows, :numeric_string => true, as: 'outputRows'
        end
      end
      
      class JobStatistics4
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :destination_uri_file_counts, as: 'destinationUriFileCounts'
          property :input_bytes, :numeric_string => true, as: 'inputBytes'
        end
      end
      
      class JobStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :error_result, as: 'errorResult', class: Google::Apis::BigqueryV2::ErrorProto, decorator: Google::Apis::BigqueryV2::ErrorProto::Representation
      
          collection :errors, as: 'errors', class: Google::Apis::BigqueryV2::ErrorProto, decorator: Google::Apis::BigqueryV2::ErrorProto::Representation
      
          property :state, as: 'state'
        end
      end
      
      class ListModelsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :models, as: 'models', class: Google::Apis::BigqueryV2::Model, decorator: Google::Apis::BigqueryV2::Model::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListRoutinesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :routines, as: 'routines', class: Google::Apis::BigqueryV2::Routine, decorator: Google::Apis::BigqueryV2::Routine::Representation
      
        end
      end
      
      class LocationMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :legacy_location_id, as: 'legacyLocationId'
        end
      end
      
      class MaterializedViewDefinition
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :last_refresh_time, :numeric_string => true, as: 'lastRefreshTime'
          property :query, as: 'query'
        end
      end
      
      class Model
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_time, :numeric_string => true, as: 'creationTime'
          property :description, as: 'description'
          property :encryption_configuration, as: 'encryptionConfiguration', class: Google::Apis::BigqueryV2::EncryptionConfiguration, decorator: Google::Apis::BigqueryV2::EncryptionConfiguration::Representation
      
          property :etag, as: 'etag'
          property :expiration_time, :numeric_string => true, as: 'expirationTime'
          collection :feature_columns, as: 'featureColumns', class: Google::Apis::BigqueryV2::StandardSqlField, decorator: Google::Apis::BigqueryV2::StandardSqlField::Representation
      
          property :friendly_name, as: 'friendlyName'
          collection :label_columns, as: 'labelColumns', class: Google::Apis::BigqueryV2::StandardSqlField, decorator: Google::Apis::BigqueryV2::StandardSqlField::Representation
      
          hash :labels, as: 'labels'
          property :last_modified_time, :numeric_string => true, as: 'lastModifiedTime'
          property :location, as: 'location'
          property :model_reference, as: 'modelReference', class: Google::Apis::BigqueryV2::ModelReference, decorator: Google::Apis::BigqueryV2::ModelReference::Representation
      
          property :model_type, as: 'modelType'
          collection :training_runs, as: 'trainingRuns', class: Google::Apis::BigqueryV2::TrainingRun, decorator: Google::Apis::BigqueryV2::TrainingRun::Representation
      
        end
      end
      
      class ModelDefinition
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :model_options, as: 'modelOptions', class: Google::Apis::BigqueryV2::ModelDefinition::ModelOptions, decorator: Google::Apis::BigqueryV2::ModelDefinition::ModelOptions::Representation
      
          collection :training_runs, as: 'trainingRuns', class: Google::Apis::BigqueryV2::BqmlTrainingRun, decorator: Google::Apis::BigqueryV2::BqmlTrainingRun::Representation
      
        end
        
        class ModelOptions
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :labels, as: 'labels'
            property :loss_type, as: 'lossType'
            property :model_type, as: 'modelType'
          end
        end
      end
      
      class ModelReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dataset_id, as: 'datasetId'
          property :model_id, as: 'modelId'
          property :project_id, as: 'projectId'
        end
      end
      
      class MultiClassClassificationMetrics
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :aggregate_classification_metrics, as: 'aggregateClassificationMetrics', class: Google::Apis::BigqueryV2::AggregateClassificationMetrics, decorator: Google::Apis::BigqueryV2::AggregateClassificationMetrics::Representation
      
          collection :confusion_matrix_list, as: 'confusionMatrixList', class: Google::Apis::BigqueryV2::ConfusionMatrix, decorator: Google::Apis::BigqueryV2::ConfusionMatrix::Representation
      
        end
      end
      
      class ProjectList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :projects, as: 'projects', class: Google::Apis::BigqueryV2::ProjectList::Project, decorator: Google::Apis::BigqueryV2::ProjectList::Project::Representation
      
          property :total_items, as: 'totalItems'
        end
        
        class Project
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :friendly_name, as: 'friendlyName'
            property :id, as: 'id'
            property :kind, as: 'kind'
            property :numeric_id, :numeric_string => true, as: 'numericId'
            property :project_reference, as: 'projectReference', class: Google::Apis::BigqueryV2::ProjectReference, decorator: Google::Apis::BigqueryV2::ProjectReference::Representation
        
          end
        end
      end
      
      class ProjectReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :project_id, as: 'projectId'
        end
      end
      
      class QueryParameter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :parameter_type, as: 'parameterType', class: Google::Apis::BigqueryV2::QueryParameterType, decorator: Google::Apis::BigqueryV2::QueryParameterType::Representation
      
          property :parameter_value, as: 'parameterValue', class: Google::Apis::BigqueryV2::QueryParameterValue, decorator: Google::Apis::BigqueryV2::QueryParameterValue::Representation
      
        end
      end
      
      class QueryParameterType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :array_type, as: 'arrayType', class: Google::Apis::BigqueryV2::QueryParameterType, decorator: Google::Apis::BigqueryV2::QueryParameterType::Representation
      
          collection :struct_types, as: 'structTypes', class: Google::Apis::BigqueryV2::QueryParameterType::StructType, decorator: Google::Apis::BigqueryV2::QueryParameterType::StructType::Representation
      
          property :type, as: 'type'
        end
        
        class StructType
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :description, as: 'description'
            property :name, as: 'name'
            property :type, as: 'type', class: Google::Apis::BigqueryV2::QueryParameterType, decorator: Google::Apis::BigqueryV2::QueryParameterType::Representation
        
          end
        end
      end
      
      class QueryParameterValue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :array_values, as: 'arrayValues', class: Google::Apis::BigqueryV2::QueryParameterValue, decorator: Google::Apis::BigqueryV2::QueryParameterValue::Representation
      
          hash :struct_values, as: 'structValues', class: Google::Apis::BigqueryV2::QueryParameterValue, decorator: Google::Apis::BigqueryV2::QueryParameterValue::Representation
      
          property :value, as: 'value'
        end
      end
      
      class QueryRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :default_dataset, as: 'defaultDataset', class: Google::Apis::BigqueryV2::DatasetReference, decorator: Google::Apis::BigqueryV2::DatasetReference::Representation
      
          property :dry_run, as: 'dryRun'
          property :kind, as: 'kind'
          property :location, as: 'location'
          property :max_results, as: 'maxResults'
          property :parameter_mode, as: 'parameterMode'
          property :preserve_nulls, as: 'preserveNulls'
          property :query, as: 'query'
          collection :query_parameters, as: 'queryParameters', class: Google::Apis::BigqueryV2::QueryParameter, decorator: Google::Apis::BigqueryV2::QueryParameter::Representation
      
          property :timeout_ms, as: 'timeoutMs'
          property :use_legacy_sql, as: 'useLegacySql'
          property :use_query_cache, as: 'useQueryCache'
        end
      end
      
      class QueryResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cache_hit, as: 'cacheHit'
          collection :errors, as: 'errors', class: Google::Apis::BigqueryV2::ErrorProto, decorator: Google::Apis::BigqueryV2::ErrorProto::Representation
      
          property :job_complete, as: 'jobComplete'
          property :job_reference, as: 'jobReference', class: Google::Apis::BigqueryV2::JobReference, decorator: Google::Apis::BigqueryV2::JobReference::Representation
      
          property :kind, as: 'kind'
          property :num_dml_affected_rows, :numeric_string => true, as: 'numDmlAffectedRows'
          property :page_token, as: 'pageToken'
          collection :rows, as: 'rows', class: Google::Apis::BigqueryV2::TableRow, decorator: Google::Apis::BigqueryV2::TableRow::Representation
      
          property :schema, as: 'schema', class: Google::Apis::BigqueryV2::TableSchema, decorator: Google::Apis::BigqueryV2::TableSchema::Representation
      
          property :total_bytes_processed, :numeric_string => true, as: 'totalBytesProcessed'
          property :total_rows, :numeric_string => true, as: 'totalRows'
        end
      end
      
      class QueryTimelineSample
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :active_units, :numeric_string => true, as: 'activeUnits'
          property :completed_units, :numeric_string => true, as: 'completedUnits'
          property :elapsed_ms, :numeric_string => true, as: 'elapsedMs'
          property :pending_units, :numeric_string => true, as: 'pendingUnits'
          property :total_slot_ms, :numeric_string => true, as: 'totalSlotMs'
        end
      end
      
      class RangePartitioning
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :field, as: 'field'
          property :range, as: 'range', class: Google::Apis::BigqueryV2::RangePartitioning::Range, decorator: Google::Apis::BigqueryV2::RangePartitioning::Range::Representation
      
        end
        
        class Range
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :end, :numeric_string => true, as: 'end'
            property :interval, :numeric_string => true, as: 'interval'
            property :start, :numeric_string => true, as: 'start'
          end
        end
      end
      
      class RegressionMetrics
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :mean_absolute_error, as: 'meanAbsoluteError'
          property :mean_squared_error, as: 'meanSquaredError'
          property :mean_squared_log_error, as: 'meanSquaredLogError'
          property :median_absolute_error, as: 'medianAbsoluteError'
          property :r_squared, as: 'rSquared'
        end
      end
      
      class Routine
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :arguments, as: 'arguments', class: Google::Apis::BigqueryV2::Argument, decorator: Google::Apis::BigqueryV2::Argument::Representation
      
          property :creation_time, :numeric_string => true, as: 'creationTime'
          property :definition_body, as: 'definitionBody'
          property :description, as: 'description'
          property :etag, as: 'etag'
          collection :imported_libraries, as: 'importedLibraries'
          property :language, as: 'language'
          property :last_modified_time, :numeric_string => true, as: 'lastModifiedTime'
          property :return_type, as: 'returnType', class: Google::Apis::BigqueryV2::StandardSqlDataType, decorator: Google::Apis::BigqueryV2::StandardSqlDataType::Representation
      
          property :routine_reference, as: 'routineReference', class: Google::Apis::BigqueryV2::RoutineReference, decorator: Google::Apis::BigqueryV2::RoutineReference::Representation
      
          property :routine_type, as: 'routineType'
        end
      end
      
      class RoutineReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dataset_id, as: 'datasetId'
          property :project_id, as: 'projectId'
          property :routine_id, as: 'routineId'
        end
      end
      
      class Row
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :actual_label, as: 'actualLabel'
          collection :entries, as: 'entries', class: Google::Apis::BigqueryV2::Entry, decorator: Google::Apis::BigqueryV2::Entry::Representation
      
        end
      end
      
      class ScriptStackFrame
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_column, as: 'endColumn'
          property :end_line, as: 'endLine'
          property :procedure_id, as: 'procedureId'
          property :start_column, as: 'startColumn'
          property :start_line, as: 'startLine'
          property :text, as: 'text'
        end
      end
      
      class ScriptStatistics
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :evaluation_kind, as: 'evaluationKind'
          collection :stack_frames, as: 'stackFrames', class: Google::Apis::BigqueryV2::ScriptStackFrame, decorator: Google::Apis::BigqueryV2::ScriptStackFrame::Representation
      
        end
      end
      
      class StandardSqlDataType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :array_element_type, as: 'arrayElementType', class: Google::Apis::BigqueryV2::StandardSqlDataType, decorator: Google::Apis::BigqueryV2::StandardSqlDataType::Representation
      
          property :struct_type, as: 'structType', class: Google::Apis::BigqueryV2::StandardSqlStructType, decorator: Google::Apis::BigqueryV2::StandardSqlStructType::Representation
      
          property :type_kind, as: 'typeKind'
        end
      end
      
      class StandardSqlField
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :type, as: 'type', class: Google::Apis::BigqueryV2::StandardSqlDataType, decorator: Google::Apis::BigqueryV2::StandardSqlDataType::Representation
      
        end
      end
      
      class StandardSqlStructType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :fields, as: 'fields', class: Google::Apis::BigqueryV2::StandardSqlField, decorator: Google::Apis::BigqueryV2::StandardSqlField::Representation
      
        end
      end
      
      class Streamingbuffer
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :estimated_bytes, :numeric_string => true, as: 'estimatedBytes'
          property :estimated_rows, :numeric_string => true, as: 'estimatedRows'
          property :oldest_entry_time, :numeric_string => true, as: 'oldestEntryTime'
        end
      end
      
      class Table
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :clustering, as: 'clustering', class: Google::Apis::BigqueryV2::Clustering, decorator: Google::Apis::BigqueryV2::Clustering::Representation
      
          property :creation_time, :numeric_string => true, as: 'creationTime'
          property :description, as: 'description'
          property :encryption_configuration, as: 'encryptionConfiguration', class: Google::Apis::BigqueryV2::EncryptionConfiguration, decorator: Google::Apis::BigqueryV2::EncryptionConfiguration::Representation
      
          property :etag, as: 'etag'
          property :expiration_time, :numeric_string => true, as: 'expirationTime'
          property :external_data_configuration, as: 'externalDataConfiguration', class: Google::Apis::BigqueryV2::ExternalDataConfiguration, decorator: Google::Apis::BigqueryV2::ExternalDataConfiguration::Representation
      
          property :friendly_name, as: 'friendlyName'
          property :id, as: 'id'
          property :kind, as: 'kind'
          hash :labels, as: 'labels'
          property :last_modified_time, :numeric_string => true, as: 'lastModifiedTime'
          property :location, as: 'location'
          property :materialized_view, as: 'materializedView', class: Google::Apis::BigqueryV2::MaterializedViewDefinition, decorator: Google::Apis::BigqueryV2::MaterializedViewDefinition::Representation
      
          property :model, as: 'model', class: Google::Apis::BigqueryV2::ModelDefinition, decorator: Google::Apis::BigqueryV2::ModelDefinition::Representation
      
          property :num_bytes, :numeric_string => true, as: 'numBytes'
          property :num_long_term_bytes, :numeric_string => true, as: 'numLongTermBytes'
          property :num_physical_bytes, :numeric_string => true, as: 'numPhysicalBytes'
          property :num_rows, :numeric_string => true, as: 'numRows'
          property :range_partitioning, as: 'rangePartitioning', class: Google::Apis::BigqueryV2::RangePartitioning, decorator: Google::Apis::BigqueryV2::RangePartitioning::Representation
      
          property :require_partition_filter, as: 'requirePartitionFilter'
          property :schema, as: 'schema', class: Google::Apis::BigqueryV2::TableSchema, decorator: Google::Apis::BigqueryV2::TableSchema::Representation
      
          property :self_link, as: 'selfLink'
          property :streaming_buffer, as: 'streamingBuffer', class: Google::Apis::BigqueryV2::Streamingbuffer, decorator: Google::Apis::BigqueryV2::Streamingbuffer::Representation
      
          property :table_reference, as: 'tableReference', class: Google::Apis::BigqueryV2::TableReference, decorator: Google::Apis::BigqueryV2::TableReference::Representation
      
          property :time_partitioning, as: 'timePartitioning', class: Google::Apis::BigqueryV2::TimePartitioning, decorator: Google::Apis::BigqueryV2::TimePartitioning::Representation
      
          property :type, as: 'type'
          property :view, as: 'view', class: Google::Apis::BigqueryV2::ViewDefinition, decorator: Google::Apis::BigqueryV2::ViewDefinition::Representation
      
        end
      end
      
      class TableCell
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :v, as: 'v'
        end
      end
      
      class InsertAllTableDataRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ignore_unknown_values, as: 'ignoreUnknownValues'
          property :kind, as: 'kind'
          collection :rows, as: 'rows', class: Google::Apis::BigqueryV2::InsertAllTableDataRequest::Row, decorator: Google::Apis::BigqueryV2::InsertAllTableDataRequest::Row::Representation
      
          property :skip_invalid_rows, as: 'skipInvalidRows'
          property :template_suffix, as: 'templateSuffix'
        end
        
        class Row
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :insert_id, as: 'insertId'
            hash :json, as: 'json'
          end
        end
      end
      
      class InsertAllTableDataResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :insert_errors, as: 'insertErrors', class: Google::Apis::BigqueryV2::InsertAllTableDataResponse::InsertError, decorator: Google::Apis::BigqueryV2::InsertAllTableDataResponse::InsertError::Representation
      
          property :kind, as: 'kind'
        end
        
        class InsertError
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :errors, as: 'errors', class: Google::Apis::BigqueryV2::ErrorProto, decorator: Google::Apis::BigqueryV2::ErrorProto::Representation
        
            property :index, as: 'index'
          end
        end
      end
      
      class TableDataList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :kind, as: 'kind'
          property :page_token, as: 'pageToken'
          collection :rows, as: 'rows', class: Google::Apis::BigqueryV2::TableRow, decorator: Google::Apis::BigqueryV2::TableRow::Representation
      
          property :total_rows, :numeric_string => true, as: 'totalRows'
        end
      end
      
      class TableFieldSchema
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :categories, as: 'categories', class: Google::Apis::BigqueryV2::TableFieldSchema::Categories, decorator: Google::Apis::BigqueryV2::TableFieldSchema::Categories::Representation
      
          property :description, as: 'description'
          collection :fields, as: 'fields', class: Google::Apis::BigqueryV2::TableFieldSchema, decorator: Google::Apis::BigqueryV2::TableFieldSchema::Representation
      
          property :mode, as: 'mode'
          property :name, as: 'name'
          property :type, as: 'type'
        end
        
        class Categories
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :names, as: 'names'
          end
        end
      end
      
      class TableList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :tables, as: 'tables', class: Google::Apis::BigqueryV2::TableList::Table, decorator: Google::Apis::BigqueryV2::TableList::Table::Representation
      
          property :total_items, as: 'totalItems'
        end
        
        class Table
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :clustering, as: 'clustering', class: Google::Apis::BigqueryV2::Clustering, decorator: Google::Apis::BigqueryV2::Clustering::Representation
        
            property :creation_time, :numeric_string => true, as: 'creationTime'
            property :expiration_time, :numeric_string => true, as: 'expirationTime'
            property :friendly_name, as: 'friendlyName'
            property :id, as: 'id'
            property :kind, as: 'kind'
            hash :labels, as: 'labels'
            property :range_partitioning, as: 'rangePartitioning', class: Google::Apis::BigqueryV2::RangePartitioning, decorator: Google::Apis::BigqueryV2::RangePartitioning::Representation
        
            property :table_reference, as: 'tableReference', class: Google::Apis::BigqueryV2::TableReference, decorator: Google::Apis::BigqueryV2::TableReference::Representation
        
            property :time_partitioning, as: 'timePartitioning', class: Google::Apis::BigqueryV2::TimePartitioning, decorator: Google::Apis::BigqueryV2::TimePartitioning::Representation
        
            property :type, as: 'type'
            property :view, as: 'view', class: Google::Apis::BigqueryV2::TableList::Table::View, decorator: Google::Apis::BigqueryV2::TableList::Table::View::Representation
        
          end
          
          class View
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :use_legacy_sql, as: 'useLegacySql'
            end
          end
        end
      end
      
      class TableReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dataset_id, as: 'datasetId'
          property :project_id, as: 'projectId'
          property :table_id, as: 'tableId'
        end
      end
      
      class TableRow
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :f, as: 'f', class: Google::Apis::BigqueryV2::TableCell, decorator: Google::Apis::BigqueryV2::TableCell::Representation
      
        end
      end
      
      class TableSchema
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :fields, as: 'fields', class: Google::Apis::BigqueryV2::TableFieldSchema, decorator: Google::Apis::BigqueryV2::TableFieldSchema::Representation
      
        end
      end
      
      class TimePartitioning
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :expiration_ms, :numeric_string => true, as: 'expirationMs'
          property :field, as: 'field'
          property :require_partition_filter, as: 'requirePartitionFilter'
          property :type, as: 'type'
        end
      end
      
      class TrainingOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :data_split_column, as: 'dataSplitColumn'
          property :data_split_eval_fraction, as: 'dataSplitEvalFraction'
          property :data_split_method, as: 'dataSplitMethod'
          property :distance_type, as: 'distanceType'
          property :early_stop, as: 'earlyStop'
          property :initial_learn_rate, as: 'initialLearnRate'
          collection :input_label_columns, as: 'inputLabelColumns'
          property :kmeans_initialization_column, as: 'kmeansInitializationColumn'
          property :kmeans_initialization_method, as: 'kmeansInitializationMethod'
          property :l1_regularization, as: 'l1Regularization'
          property :l2_regularization, as: 'l2Regularization'
          hash :label_class_weights, as: 'labelClassWeights'
          property :learn_rate, as: 'learnRate'
          property :learn_rate_strategy, as: 'learnRateStrategy'
          property :loss_type, as: 'lossType'
          property :max_iterations, :numeric_string => true, as: 'maxIterations'
          property :min_relative_progress, as: 'minRelativeProgress'
          property :model_uri, as: 'modelUri'
          property :num_clusters, :numeric_string => true, as: 'numClusters'
          property :optimization_strategy, as: 'optimizationStrategy'
          property :warm_start, as: 'warmStart'
        end
      end
      
      class TrainingRun
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :data_split_result, as: 'dataSplitResult', class: Google::Apis::BigqueryV2::DataSplitResult, decorator: Google::Apis::BigqueryV2::DataSplitResult::Representation
      
          property :evaluation_metrics, as: 'evaluationMetrics', class: Google::Apis::BigqueryV2::EvaluationMetrics, decorator: Google::Apis::BigqueryV2::EvaluationMetrics::Representation
      
          collection :results, as: 'results', class: Google::Apis::BigqueryV2::IterationResult, decorator: Google::Apis::BigqueryV2::IterationResult::Representation
      
          property :start_time, as: 'startTime'
          property :training_options, as: 'trainingOptions', class: Google::Apis::BigqueryV2::TrainingOptions, decorator: Google::Apis::BigqueryV2::TrainingOptions::Representation
      
        end
      end
      
      class UserDefinedFunctionResource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :inline_code, as: 'inlineCode'
          property :resource_uri, as: 'resourceUri'
        end
      end
      
      class ViewDefinition
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :query, as: 'query'
          property :use_legacy_sql, as: 'useLegacySql'
          collection :user_defined_function_resources, as: 'userDefinedFunctionResources', class: Google::Apis::BigqueryV2::UserDefinedFunctionResource, decorator: Google::Apis::BigqueryV2::UserDefinedFunctionResource::Representation
      
        end
      end
    end
  end
end
