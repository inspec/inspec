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
      
      # Aggregate metrics for classification/classifier models. For multi-class
      # models, the metrics are either macro-averaged or micro-averaged. When
      # macro-averaged, the metrics are calculated for each label and then an
      # unweighted average is taken of those values. When micro-averaged, the
      # metric is calculated globally by counting the total number of correctly
      # predicted rows.
      class AggregateClassificationMetrics
        include Google::Apis::Core::Hashable
      
        # Accuracy is the fraction of predictions given the correct label. For
        # multiclass this is a micro-averaged metric.
        # Corresponds to the JSON property `accuracy`
        # @return [Float]
        attr_accessor :accuracy
      
        # The F1 score is an average of recall and precision. For multiclass
        # this is a macro-averaged metric.
        # Corresponds to the JSON property `f1Score`
        # @return [Float]
        attr_accessor :f1_score
      
        # Logarithmic Loss. For multiclass this is a macro-averaged metric.
        # Corresponds to the JSON property `logLoss`
        # @return [Float]
        attr_accessor :log_loss
      
        # Precision is the fraction of actual positive predictions that had
        # positive actual labels. For multiclass this is a macro-averaged
        # metric treating each class as a binary classifier.
        # Corresponds to the JSON property `precision`
        # @return [Float]
        attr_accessor :precision
      
        # Recall is the fraction of actual positive labels that were given a
        # positive prediction. For multiclass this is a macro-averaged metric.
        # Corresponds to the JSON property `recall`
        # @return [Float]
        attr_accessor :recall
      
        # Area Under a ROC Curve. For multiclass this is a macro-averaged
        # metric.
        # Corresponds to the JSON property `rocAuc`
        # @return [Float]
        attr_accessor :roc_auc
      
        # Threshold at which the metrics are computed. For binary
        # classification models this is the positive class threshold.
        # For multi-class classfication models this is the confidence
        # threshold.
        # Corresponds to the JSON property `threshold`
        # @return [Float]
        attr_accessor :threshold
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @accuracy = args[:accuracy] if args.key?(:accuracy)
          @f1_score = args[:f1_score] if args.key?(:f1_score)
          @log_loss = args[:log_loss] if args.key?(:log_loss)
          @precision = args[:precision] if args.key?(:precision)
          @recall = args[:recall] if args.key?(:recall)
          @roc_auc = args[:roc_auc] if args.key?(:roc_auc)
          @threshold = args[:threshold] if args.key?(:threshold)
        end
      end
      
      # Input/output argument of a function or a stored procedure.
      class Argument
        include Google::Apis::Core::Hashable
      
        # Optional. Defaults to FIXED_TYPE.
        # Corresponds to the JSON property `argumentKind`
        # @return [String]
        attr_accessor :argument_kind
      
        # The type of a variable, e.g., a function argument.
        # Examples:
        # INT64: `type_kind="INT64"`
        # ARRAY<STRING>: `type_kind="ARRAY", array_element_type="STRING"`
        # STRUCT<x STRING, y ARRAY<DATE>>:
        # `type_kind="STRUCT",
        # struct_type=`fields=[
        # `name="x", type=`type_kind="STRING"``,
        # `name="y", type=`type_kind="ARRAY", array_element_type="DATE"``
        # ]``
        # Corresponds to the JSON property `dataType`
        # @return [Google::Apis::BigqueryV2::StandardSqlDataType]
        attr_accessor :data_type
      
        # Optional. Specifies whether the argument is input or output.
        # Can be set for procedures only.
        # Corresponds to the JSON property `mode`
        # @return [String]
        attr_accessor :mode
      
        # Optional. The name of this argument. Can be absent for function return
        # argument.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @argument_kind = args[:argument_kind] if args.key?(:argument_kind)
          @data_type = args[:data_type] if args.key?(:data_type)
          @mode = args[:mode] if args.key?(:mode)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Arima coefficients.
      class ArimaCoefficients
        include Google::Apis::Core::Hashable
      
        # Auto-regressive coefficients, an array of double.
        # Corresponds to the JSON property `autoRegressiveCoefficients`
        # @return [Array<Float>]
        attr_accessor :auto_regressive_coefficients
      
        # Intercept coefficient, just a double not an array.
        # Corresponds to the JSON property `interceptCoefficient`
        # @return [Float]
        attr_accessor :intercept_coefficient
      
        # Moving-average coefficients, an array of double.
        # Corresponds to the JSON property `movingAverageCoefficients`
        # @return [Array<Float>]
        attr_accessor :moving_average_coefficients
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @auto_regressive_coefficients = args[:auto_regressive_coefficients] if args.key?(:auto_regressive_coefficients)
          @intercept_coefficient = args[:intercept_coefficient] if args.key?(:intercept_coefficient)
          @moving_average_coefficients = args[:moving_average_coefficients] if args.key?(:moving_average_coefficients)
        end
      end
      
      # ARIMA model fitting metrics.
      class ArimaFittingMetrics
        include Google::Apis::Core::Hashable
      
        # AIC
        # Corresponds to the JSON property `aic`
        # @return [Float]
        attr_accessor :aic
      
        # log-likelihood
        # Corresponds to the JSON property `logLikelihood`
        # @return [Float]
        attr_accessor :log_likelihood
      
        # variance.
        # Corresponds to the JSON property `variance`
        # @return [Float]
        attr_accessor :variance
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @aic = args[:aic] if args.key?(:aic)
          @log_likelihood = args[:log_likelihood] if args.key?(:log_likelihood)
          @variance = args[:variance] if args.key?(:variance)
        end
      end
      
      # Arima model information.
      class ArimaModelInfo
        include Google::Apis::Core::Hashable
      
        # Arima coefficients.
        # Corresponds to the JSON property `arimaCoefficients`
        # @return [Google::Apis::BigqueryV2::ArimaCoefficients]
        attr_accessor :arima_coefficients
      
        # ARIMA model fitting metrics.
        # Corresponds to the JSON property `arimaFittingMetrics`
        # @return [Google::Apis::BigqueryV2::ArimaFittingMetrics]
        attr_accessor :arima_fitting_metrics
      
        # Arima order, can be used for both non-seasonal and seasonal parts.
        # Corresponds to the JSON property `nonSeasonalOrder`
        # @return [Google::Apis::BigqueryV2::ArimaOrder]
        attr_accessor :non_seasonal_order
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @arima_coefficients = args[:arima_coefficients] if args.key?(:arima_coefficients)
          @arima_fitting_metrics = args[:arima_fitting_metrics] if args.key?(:arima_fitting_metrics)
          @non_seasonal_order = args[:non_seasonal_order] if args.key?(:non_seasonal_order)
        end
      end
      
      # Arima order, can be used for both non-seasonal and seasonal parts.
      class ArimaOrder
        include Google::Apis::Core::Hashable
      
        # Order of the differencing part.
        # Corresponds to the JSON property `d`
        # @return [Fixnum]
        attr_accessor :d
      
        # Order of the autoregressive part.
        # Corresponds to the JSON property `p`
        # @return [Fixnum]
        attr_accessor :p
      
        # Order of the moving-average part.
        # Corresponds to the JSON property `q`
        # @return [Fixnum]
        attr_accessor :q
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @d = args[:d] if args.key?(:d)
          @p = args[:p] if args.key?(:p)
          @q = args[:q] if args.key?(:q)
        end
      end
      
      # (Auto-)arima fitting result. Wrap everything in ArimaResult for easier
      # refactoring if we want to use model-specific iteration results.
      class ArimaResult
        include Google::Apis::Core::Hashable
      
        # This message is repeated because there are multiple arima models
        # fitted in auto-arima. For non-auto-arima model, its size is one.
        # Corresponds to the JSON property `arimaModelInfo`
        # @return [Array<Google::Apis::BigqueryV2::ArimaModelInfo>]
        attr_accessor :arima_model_info
      
        # Seasonal periods. Repeated because multiple periods are supported for
        # one time series.
        # Corresponds to the JSON property `seasonalPeriods`
        # @return [Array<String>]
        attr_accessor :seasonal_periods
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @arima_model_info = args[:arima_model_info] if args.key?(:arima_model_info)
          @seasonal_periods = args[:seasonal_periods] if args.key?(:seasonal_periods)
        end
      end
      
      # 
      class BigQueryModelTraining
        include Google::Apis::Core::Hashable
      
        # [Output-only, Beta] Index of current ML training iteration. Updated during
        # create model query job to show job progress.
        # Corresponds to the JSON property `currentIteration`
        # @return [Fixnum]
        attr_accessor :current_iteration
      
        # [Output-only, Beta] Expected number of iterations for the create model query
        # job specified as num_iterations in the input query. The actual total number of
        # iterations may be less than this number due to early stop.
        # Corresponds to the JSON property `expectedTotalIterations`
        # @return [Fixnum]
        attr_accessor :expected_total_iterations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @current_iteration = args[:current_iteration] if args.key?(:current_iteration)
          @expected_total_iterations = args[:expected_total_iterations] if args.key?(:expected_total_iterations)
        end
      end
      
      # 
      class BigtableColumn
        include Google::Apis::Core::Hashable
      
        # [Optional] The encoding of the values when the type is not STRING. Acceptable
        # encoding values are: TEXT - indicates values are alphanumeric text strings.
        # BINARY - indicates values are encoded using HBase Bytes.toBytes family of
        # functions. 'encoding' can also be set at the column family level. However, the
        # setting at this level takes precedence if 'encoding' is set at both levels.
        # Corresponds to the JSON property `encoding`
        # @return [String]
        attr_accessor :encoding
      
        # [Optional] If the qualifier is not a valid BigQuery field identifier i.e. does
        # not match [a-zA-Z][a-zA-Z0-9_]*, a valid identifier must be provided as the
        # column field name and is used as field name in queries.
        # Corresponds to the JSON property `fieldName`
        # @return [String]
        attr_accessor :field_name
      
        # [Optional] If this is set, only the latest version of value in this column are
        # exposed. 'onlyReadLatest' can also be set at the column family level. However,
        # the setting at this level takes precedence if 'onlyReadLatest' is set at both
        # levels.
        # Corresponds to the JSON property `onlyReadLatest`
        # @return [Boolean]
        attr_accessor :only_read_latest
        alias_method :only_read_latest?, :only_read_latest
      
        # [Required] Qualifier of the column. Columns in the parent column family that
        # has this exact qualifier are exposed as . field. If the qualifier is valid UTF-
        # 8 string, it can be specified in the qualifier_string field. Otherwise, a base-
        # 64 encoded value must be set to qualifier_encoded. The column field name is
        # the same as the column qualifier. However, if the qualifier is not a valid
        # BigQuery field identifier i.e. does not match [a-zA-Z][a-zA-Z0-9_]*, a valid
        # identifier must be provided as field_name.
        # Corresponds to the JSON property `qualifierEncoded`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :qualifier_encoded
      
        # 
        # Corresponds to the JSON property `qualifierString`
        # @return [String]
        attr_accessor :qualifier_string
      
        # [Optional] The type to convert the value in cells of this column. The values
        # are expected to be encoded using HBase Bytes.toBytes function when using the
        # BINARY encoding value. Following BigQuery types are allowed (case-sensitive) -
        # BYTES STRING INTEGER FLOAT BOOLEAN Default type is BYTES. 'type' can also be
        # set at the column family level. However, the setting at this level takes
        # precedence if 'type' is set at both levels.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @encoding = args[:encoding] if args.key?(:encoding)
          @field_name = args[:field_name] if args.key?(:field_name)
          @only_read_latest = args[:only_read_latest] if args.key?(:only_read_latest)
          @qualifier_encoded = args[:qualifier_encoded] if args.key?(:qualifier_encoded)
          @qualifier_string = args[:qualifier_string] if args.key?(:qualifier_string)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # 
      class BigtableColumnFamily
        include Google::Apis::Core::Hashable
      
        # [Optional] Lists of columns that should be exposed as individual fields as
        # opposed to a list of (column name, value) pairs. All columns whose qualifier
        # matches a qualifier in this list can be accessed as .. Other columns can be
        # accessed as a list through .Column field.
        # Corresponds to the JSON property `columns`
        # @return [Array<Google::Apis::BigqueryV2::BigtableColumn>]
        attr_accessor :columns
      
        # [Optional] The encoding of the values when the type is not STRING. Acceptable
        # encoding values are: TEXT - indicates values are alphanumeric text strings.
        # BINARY - indicates values are encoded using HBase Bytes.toBytes family of
        # functions. This can be overridden for a specific column by listing that column
        # in 'columns' and specifying an encoding for it.
        # Corresponds to the JSON property `encoding`
        # @return [String]
        attr_accessor :encoding
      
        # Identifier of the column family.
        # Corresponds to the JSON property `familyId`
        # @return [String]
        attr_accessor :family_id
      
        # [Optional] If this is set only the latest version of value are exposed for all
        # columns in this column family. This can be overridden for a specific column by
        # listing that column in 'columns' and specifying a different setting for that
        # column.
        # Corresponds to the JSON property `onlyReadLatest`
        # @return [Boolean]
        attr_accessor :only_read_latest
        alias_method :only_read_latest?, :only_read_latest
      
        # [Optional] The type to convert the value in cells of this column family. The
        # values are expected to be encoded using HBase Bytes.toBytes function when
        # using the BINARY encoding value. Following BigQuery types are allowed (case-
        # sensitive) - BYTES STRING INTEGER FLOAT BOOLEAN Default type is BYTES. This
        # can be overridden for a specific column by listing that column in 'columns'
        # and specifying a type for it.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @columns = args[:columns] if args.key?(:columns)
          @encoding = args[:encoding] if args.key?(:encoding)
          @family_id = args[:family_id] if args.key?(:family_id)
          @only_read_latest = args[:only_read_latest] if args.key?(:only_read_latest)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # 
      class BigtableOptions
        include Google::Apis::Core::Hashable
      
        # [Optional] List of column families to expose in the table schema along with
        # their types. This list restricts the column families that can be referenced in
        # queries and specifies their value types. You can use this list to do type
        # conversions - see the 'type' field for more details. If you leave this list
        # empty, all column families are present in the table schema and their values
        # are read as BYTES. During a query only the column families referenced in that
        # query are read from Bigtable.
        # Corresponds to the JSON property `columnFamilies`
        # @return [Array<Google::Apis::BigqueryV2::BigtableColumnFamily>]
        attr_accessor :column_families
      
        # [Optional] If field is true, then the column families that are not specified
        # in columnFamilies list are not exposed in the table schema. Otherwise, they
        # are read with BYTES type values. The default value is false.
        # Corresponds to the JSON property `ignoreUnspecifiedColumnFamilies`
        # @return [Boolean]
        attr_accessor :ignore_unspecified_column_families
        alias_method :ignore_unspecified_column_families?, :ignore_unspecified_column_families
      
        # [Optional] If field is true, then the rowkey column families will be read and
        # converted to string. Otherwise they are read with BYTES type values and users
        # need to manually cast them with CAST if necessary. The default value is false.
        # Corresponds to the JSON property `readRowkeyAsString`
        # @return [Boolean]
        attr_accessor :read_rowkey_as_string
        alias_method :read_rowkey_as_string?, :read_rowkey_as_string
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @column_families = args[:column_families] if args.key?(:column_families)
          @ignore_unspecified_column_families = args[:ignore_unspecified_column_families] if args.key?(:ignore_unspecified_column_families)
          @read_rowkey_as_string = args[:read_rowkey_as_string] if args.key?(:read_rowkey_as_string)
        end
      end
      
      # Evaluation metrics for binary classification/classifier models.
      class BinaryClassificationMetrics
        include Google::Apis::Core::Hashable
      
        # Aggregate metrics for classification/classifier models. For multi-class
        # models, the metrics are either macro-averaged or micro-averaged. When
        # macro-averaged, the metrics are calculated for each label and then an
        # unweighted average is taken of those values. When micro-averaged, the
        # metric is calculated globally by counting the total number of correctly
        # predicted rows.
        # Corresponds to the JSON property `aggregateClassificationMetrics`
        # @return [Google::Apis::BigqueryV2::AggregateClassificationMetrics]
        attr_accessor :aggregate_classification_metrics
      
        # Binary confusion matrix at multiple thresholds.
        # Corresponds to the JSON property `binaryConfusionMatrixList`
        # @return [Array<Google::Apis::BigqueryV2::BinaryConfusionMatrix>]
        attr_accessor :binary_confusion_matrix_list
      
        # Label representing the negative class.
        # Corresponds to the JSON property `negativeLabel`
        # @return [String]
        attr_accessor :negative_label
      
        # Label representing the positive class.
        # Corresponds to the JSON property `positiveLabel`
        # @return [String]
        attr_accessor :positive_label
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @aggregate_classification_metrics = args[:aggregate_classification_metrics] if args.key?(:aggregate_classification_metrics)
          @binary_confusion_matrix_list = args[:binary_confusion_matrix_list] if args.key?(:binary_confusion_matrix_list)
          @negative_label = args[:negative_label] if args.key?(:negative_label)
          @positive_label = args[:positive_label] if args.key?(:positive_label)
        end
      end
      
      # Confusion matrix for binary classification models.
      class BinaryConfusionMatrix
        include Google::Apis::Core::Hashable
      
        # The fraction of predictions given the correct label.
        # Corresponds to the JSON property `accuracy`
        # @return [Float]
        attr_accessor :accuracy
      
        # The equally weighted average of recall and precision.
        # Corresponds to the JSON property `f1Score`
        # @return [Float]
        attr_accessor :f1_score
      
        # Number of false samples predicted as false.
        # Corresponds to the JSON property `falseNegatives`
        # @return [Fixnum]
        attr_accessor :false_negatives
      
        # Number of false samples predicted as true.
        # Corresponds to the JSON property `falsePositives`
        # @return [Fixnum]
        attr_accessor :false_positives
      
        # Threshold value used when computing each of the following metric.
        # Corresponds to the JSON property `positiveClassThreshold`
        # @return [Float]
        attr_accessor :positive_class_threshold
      
        # The fraction of actual positive predictions that had positive actual
        # labels.
        # Corresponds to the JSON property `precision`
        # @return [Float]
        attr_accessor :precision
      
        # The fraction of actual positive labels that were given a positive
        # prediction.
        # Corresponds to the JSON property `recall`
        # @return [Float]
        attr_accessor :recall
      
        # Number of true samples predicted as false.
        # Corresponds to the JSON property `trueNegatives`
        # @return [Fixnum]
        attr_accessor :true_negatives
      
        # Number of true samples predicted as true.
        # Corresponds to the JSON property `truePositives`
        # @return [Fixnum]
        attr_accessor :true_positives
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @accuracy = args[:accuracy] if args.key?(:accuracy)
          @f1_score = args[:f1_score] if args.key?(:f1_score)
          @false_negatives = args[:false_negatives] if args.key?(:false_negatives)
          @false_positives = args[:false_positives] if args.key?(:false_positives)
          @positive_class_threshold = args[:positive_class_threshold] if args.key?(:positive_class_threshold)
          @precision = args[:precision] if args.key?(:precision)
          @recall = args[:recall] if args.key?(:recall)
          @true_negatives = args[:true_negatives] if args.key?(:true_negatives)
          @true_positives = args[:true_positives] if args.key?(:true_positives)
        end
      end
      
      # 
      class BqmlIterationResult
        include Google::Apis::Core::Hashable
      
        # [Output-only, Beta] Time taken to run the training iteration in milliseconds.
        # Corresponds to the JSON property `durationMs`
        # @return [Fixnum]
        attr_accessor :duration_ms
      
        # [Output-only, Beta] Eval loss computed on the eval data at the end of the
        # iteration. The eval loss is used for early stopping to avoid overfitting. No
        # eval loss if eval_split_method option is specified as no_split or auto_split
        # with input data size less than 500 rows.
        # Corresponds to the JSON property `evalLoss`
        # @return [Float]
        attr_accessor :eval_loss
      
        # [Output-only, Beta] Index of the ML training iteration, starting from zero for
        # each training run.
        # Corresponds to the JSON property `index`
        # @return [Fixnum]
        attr_accessor :index
      
        # [Output-only, Beta] Learning rate used for this iteration, it varies for
        # different training iterations if learn_rate_strategy option is not constant.
        # Corresponds to the JSON property `learnRate`
        # @return [Float]
        attr_accessor :learn_rate
      
        # [Output-only, Beta] Training loss computed on the training data at the end of
        # the iteration. The training loss function is defined by model type.
        # Corresponds to the JSON property `trainingLoss`
        # @return [Float]
        attr_accessor :training_loss
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @duration_ms = args[:duration_ms] if args.key?(:duration_ms)
          @eval_loss = args[:eval_loss] if args.key?(:eval_loss)
          @index = args[:index] if args.key?(:index)
          @learn_rate = args[:learn_rate] if args.key?(:learn_rate)
          @training_loss = args[:training_loss] if args.key?(:training_loss)
        end
      end
      
      # 
      class BqmlTrainingRun
        include Google::Apis::Core::Hashable
      
        # [Output-only, Beta] List of each iteration results.
        # Corresponds to the JSON property `iterationResults`
        # @return [Array<Google::Apis::BigqueryV2::BqmlIterationResult>]
        attr_accessor :iteration_results
      
        # [Output-only, Beta] Training run start time in milliseconds since the epoch.
        # Corresponds to the JSON property `startTime`
        # @return [DateTime]
        attr_accessor :start_time
      
        # [Output-only, Beta] Different state applicable for a training run. IN PROGRESS:
        # Training run is in progress. FAILED: Training run ended due to a non-
        # retryable failure. SUCCEEDED: Training run successfully completed. CANCELLED:
        # Training run cancelled by the user.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # [Output-only, Beta] Training options used by this training run. These options
        # are mutable for subsequent training runs. Default values are explicitly stored
        # for options not specified in the input query of the first training run. For
        # subsequent training runs, any option not explicitly specified in the input
        # query will be copied from the previous training run.
        # Corresponds to the JSON property `trainingOptions`
        # @return [Google::Apis::BigqueryV2::BqmlTrainingRun::TrainingOptions]
        attr_accessor :training_options
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @iteration_results = args[:iteration_results] if args.key?(:iteration_results)
          @start_time = args[:start_time] if args.key?(:start_time)
          @state = args[:state] if args.key?(:state)
          @training_options = args[:training_options] if args.key?(:training_options)
        end
        
        # [Output-only, Beta] Training options used by this training run. These options
        # are mutable for subsequent training runs. Default values are explicitly stored
        # for options not specified in the input query of the first training run. For
        # subsequent training runs, any option not explicitly specified in the input
        # query will be copied from the previous training run.
        class TrainingOptions
          include Google::Apis::Core::Hashable
        
          # 
          # Corresponds to the JSON property `earlyStop`
          # @return [Boolean]
          attr_accessor :early_stop
          alias_method :early_stop?, :early_stop
        
          # 
          # Corresponds to the JSON property `l1Reg`
          # @return [Float]
          attr_accessor :l1_reg
        
          # 
          # Corresponds to the JSON property `l2Reg`
          # @return [Float]
          attr_accessor :l2_reg
        
          # 
          # Corresponds to the JSON property `learnRate`
          # @return [Float]
          attr_accessor :learn_rate
        
          # 
          # Corresponds to the JSON property `learnRateStrategy`
          # @return [String]
          attr_accessor :learn_rate_strategy
        
          # 
          # Corresponds to the JSON property `lineSearchInitLearnRate`
          # @return [Float]
          attr_accessor :line_search_init_learn_rate
        
          # 
          # Corresponds to the JSON property `maxIteration`
          # @return [Fixnum]
          attr_accessor :max_iteration
        
          # 
          # Corresponds to the JSON property `minRelProgress`
          # @return [Float]
          attr_accessor :min_rel_progress
        
          # 
          # Corresponds to the JSON property `warmStart`
          # @return [Boolean]
          attr_accessor :warm_start
          alias_method :warm_start?, :warm_start
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @early_stop = args[:early_stop] if args.key?(:early_stop)
            @l1_reg = args[:l1_reg] if args.key?(:l1_reg)
            @l2_reg = args[:l2_reg] if args.key?(:l2_reg)
            @learn_rate = args[:learn_rate] if args.key?(:learn_rate)
            @learn_rate_strategy = args[:learn_rate_strategy] if args.key?(:learn_rate_strategy)
            @line_search_init_learn_rate = args[:line_search_init_learn_rate] if args.key?(:line_search_init_learn_rate)
            @max_iteration = args[:max_iteration] if args.key?(:max_iteration)
            @min_rel_progress = args[:min_rel_progress] if args.key?(:min_rel_progress)
            @warm_start = args[:warm_start] if args.key?(:warm_start)
          end
        end
      end
      
      # Representative value of a categorical feature.
      class CategoricalValue
        include Google::Apis::Core::Hashable
      
        # Counts of all categories for the categorical feature. If there are
        # more than ten categories, we return top ten (by count) and return
        # one more CategoryCount with category "_OTHER_" and count as
        # aggregate counts of remaining categories.
        # Corresponds to the JSON property `categoryCounts`
        # @return [Array<Google::Apis::BigqueryV2::CategoryCount>]
        attr_accessor :category_counts
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @category_counts = args[:category_counts] if args.key?(:category_counts)
        end
      end
      
      # Represents the count of a single category within the cluster.
      class CategoryCount
        include Google::Apis::Core::Hashable
      
        # The name of category.
        # Corresponds to the JSON property `category`
        # @return [String]
        attr_accessor :category
      
        # The count of training samples matching the category within the
        # cluster.
        # Corresponds to the JSON property `count`
        # @return [Fixnum]
        attr_accessor :count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @category = args[:category] if args.key?(:category)
          @count = args[:count] if args.key?(:count)
        end
      end
      
      # Message containing the information about one cluster.
      class Cluster
        include Google::Apis::Core::Hashable
      
        # Centroid id.
        # Corresponds to the JSON property `centroidId`
        # @return [Fixnum]
        attr_accessor :centroid_id
      
        # Count of training data rows that were assigned to this cluster.
        # Corresponds to the JSON property `count`
        # @return [Fixnum]
        attr_accessor :count
      
        # Values of highly variant features for this cluster.
        # Corresponds to the JSON property `featureValues`
        # @return [Array<Google::Apis::BigqueryV2::FeatureValue>]
        attr_accessor :feature_values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @centroid_id = args[:centroid_id] if args.key?(:centroid_id)
          @count = args[:count] if args.key?(:count)
          @feature_values = args[:feature_values] if args.key?(:feature_values)
        end
      end
      
      # Information about a single cluster for clustering model.
      class ClusterInfo
        include Google::Apis::Core::Hashable
      
        # Centroid id.
        # Corresponds to the JSON property `centroidId`
        # @return [Fixnum]
        attr_accessor :centroid_id
      
        # Cluster radius, the average distance from centroid
        # to each point assigned to the cluster.
        # Corresponds to the JSON property `clusterRadius`
        # @return [Float]
        attr_accessor :cluster_radius
      
        # Cluster size, the total number of points assigned to the cluster.
        # Corresponds to the JSON property `clusterSize`
        # @return [Fixnum]
        attr_accessor :cluster_size
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @centroid_id = args[:centroid_id] if args.key?(:centroid_id)
          @cluster_radius = args[:cluster_radius] if args.key?(:cluster_radius)
          @cluster_size = args[:cluster_size] if args.key?(:cluster_size)
        end
      end
      
      # 
      class Clustering
        include Google::Apis::Core::Hashable
      
        # [Repeated] One or more fields on which data should be clustered. Only top-
        # level, non-repeated, simple-type fields are supported. When you cluster a
        # table using multiple columns, the order of columns you specify is important.
        # The order of the specified columns determines the sort order of the data.
        # Corresponds to the JSON property `fields`
        # @return [Array<String>]
        attr_accessor :fields
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @fields = args[:fields] if args.key?(:fields)
        end
      end
      
      # Evaluation metrics for clustering models.
      class ClusteringMetrics
        include Google::Apis::Core::Hashable
      
        # [Beta] Information for all clusters.
        # Corresponds to the JSON property `clusters`
        # @return [Array<Google::Apis::BigqueryV2::Cluster>]
        attr_accessor :clusters
      
        # Davies-Bouldin index.
        # Corresponds to the JSON property `daviesBouldinIndex`
        # @return [Float]
        attr_accessor :davies_bouldin_index
      
        # Mean of squared distances between each sample to its cluster centroid.
        # Corresponds to the JSON property `meanSquaredDistance`
        # @return [Float]
        attr_accessor :mean_squared_distance
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @clusters = args[:clusters] if args.key?(:clusters)
          @davies_bouldin_index = args[:davies_bouldin_index] if args.key?(:davies_bouldin_index)
          @mean_squared_distance = args[:mean_squared_distance] if args.key?(:mean_squared_distance)
        end
      end
      
      # Confusion matrix for multi-class classification models.
      class ConfusionMatrix
        include Google::Apis::Core::Hashable
      
        # Confidence threshold used when computing the entries of the
        # confusion matrix.
        # Corresponds to the JSON property `confidenceThreshold`
        # @return [Float]
        attr_accessor :confidence_threshold
      
        # One row per actual label.
        # Corresponds to the JSON property `rows`
        # @return [Array<Google::Apis::BigqueryV2::Row>]
        attr_accessor :rows
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence_threshold = args[:confidence_threshold] if args.key?(:confidence_threshold)
          @rows = args[:rows] if args.key?(:rows)
        end
      end
      
      # 
      class CsvOptions
        include Google::Apis::Core::Hashable
      
        # [Optional] Indicates if BigQuery should accept rows that are missing trailing
        # optional columns. If true, BigQuery treats missing trailing columns as null
        # values. If false, records with missing trailing columns are treated as bad
        # records, and if there are too many bad records, an invalid error is returned
        # in the job result. The default value is false.
        # Corresponds to the JSON property `allowJaggedRows`
        # @return [Boolean]
        attr_accessor :allow_jagged_rows
        alias_method :allow_jagged_rows?, :allow_jagged_rows
      
        # [Optional] Indicates if BigQuery should allow quoted data sections that
        # contain newline characters in a CSV file. The default value is false.
        # Corresponds to the JSON property `allowQuotedNewlines`
        # @return [Boolean]
        attr_accessor :allow_quoted_newlines
        alias_method :allow_quoted_newlines?, :allow_quoted_newlines
      
        # [Optional] The character encoding of the data. The supported values are UTF-8
        # or ISO-8859-1. The default value is UTF-8. BigQuery decodes the data after the
        # raw, binary data has been split using the values of the quote and
        # fieldDelimiter properties.
        # Corresponds to the JSON property `encoding`
        # @return [String]
        attr_accessor :encoding
      
        # [Optional] The separator for fields in a CSV file. BigQuery converts the
        # string to ISO-8859-1 encoding, and then uses the first byte of the encoded
        # string to split the data in its raw, binary state. BigQuery also supports the
        # escape sequence "\t" to specify a tab separator. The default value is a comma (
        # ',').
        # Corresponds to the JSON property `fieldDelimiter`
        # @return [String]
        attr_accessor :field_delimiter
      
        # [Optional] The value that is used to quote data sections in a CSV file.
        # BigQuery converts the string to ISO-8859-1 encoding, and then uses the first
        # byte of the encoded string to split the data in its raw, binary state. The
        # default value is a double-quote ('"'). If your data does not contain quoted
        # sections, set the property value to an empty string. If your data contains
        # quoted newline characters, you must also set the allowQuotedNewlines property
        # to true.
        # Corresponds to the JSON property `quote`
        # @return [String]
        attr_accessor :quote
      
        # [Optional] The number of rows at the top of a CSV file that BigQuery will skip
        # when reading the data. The default value is 0. This property is useful if you
        # have header rows in the file that should be skipped. When autodetect is on,
        # the behavior is the following: * skipLeadingRows unspecified - Autodetect
        # tries to detect headers in the first row. If they are not detected, the row is
        # read as data. Otherwise data is read starting from the second row. *
        # skipLeadingRows is 0 - Instructs autodetect that there are no headers and data
        # should be read starting from the first row. * skipLeadingRows = N > 0 -
        # Autodetect skips N-1 rows and tries to detect headers in row N. If headers are
        # not detected, row N is just skipped. Otherwise row N is used to extract column
        # names for the detected schema.
        # Corresponds to the JSON property `skipLeadingRows`
        # @return [Fixnum]
        attr_accessor :skip_leading_rows
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @allow_jagged_rows = args[:allow_jagged_rows] if args.key?(:allow_jagged_rows)
          @allow_quoted_newlines = args[:allow_quoted_newlines] if args.key?(:allow_quoted_newlines)
          @encoding = args[:encoding] if args.key?(:encoding)
          @field_delimiter = args[:field_delimiter] if args.key?(:field_delimiter)
          @quote = args[:quote] if args.key?(:quote)
          @skip_leading_rows = args[:skip_leading_rows] if args.key?(:skip_leading_rows)
        end
      end
      
      # Data split result. This contains references to the training and evaluation
      # data tables that were used to train the model.
      class DataSplitResult
        include Google::Apis::Core::Hashable
      
        # Table reference of the evaluation data after split.
        # Corresponds to the JSON property `evaluationTable`
        # @return [Google::Apis::BigqueryV2::TableReference]
        attr_accessor :evaluation_table
      
        # Table reference of the training data after split.
        # Corresponds to the JSON property `trainingTable`
        # @return [Google::Apis::BigqueryV2::TableReference]
        attr_accessor :training_table
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @evaluation_table = args[:evaluation_table] if args.key?(:evaluation_table)
          @training_table = args[:training_table] if args.key?(:training_table)
        end
      end
      
      # 
      class Dataset
        include Google::Apis::Core::Hashable
      
        # [Optional] An array of objects that define dataset access for one or more
        # entities. You can set this property when inserting or updating a dataset in
        # order to control who is allowed to access the data. If unspecified at dataset
        # creation time, BigQuery adds default dataset access for the following entities:
        # access.specialGroup: projectReaders; access.role: READER; access.specialGroup:
        # projectWriters; access.role: WRITER; access.specialGroup: projectOwners;
        # access.role: OWNER; access.userByEmail: [dataset creator email]; access.role:
        # OWNER;
        # Corresponds to the JSON property `access`
        # @return [Array<Google::Apis::BigqueryV2::Dataset::Access>]
        attr_accessor :access
      
        # [Output-only] The time when this dataset was created, in milliseconds since
        # the epoch.
        # Corresponds to the JSON property `creationTime`
        # @return [Fixnum]
        attr_accessor :creation_time
      
        # [Required] A reference that identifies the dataset.
        # Corresponds to the JSON property `datasetReference`
        # @return [Google::Apis::BigqueryV2::DatasetReference]
        attr_accessor :dataset_reference
      
        # 
        # Corresponds to the JSON property `defaultEncryptionConfiguration`
        # @return [Google::Apis::BigqueryV2::EncryptionConfiguration]
        attr_accessor :default_encryption_configuration
      
        # [Optional] The default partition expiration for all partitioned tables in the
        # dataset, in milliseconds. Once this property is set, all newly-created
        # partitioned tables in the dataset will have an expirationMs property in the
        # timePartitioning settings set to this value, and changing the value will only
        # affect new tables, not existing ones. The storage in a partition will have an
        # expiration time of its partition time plus this value. Setting this property
        # overrides the use of defaultTableExpirationMs for partitioned tables: only one
        # of defaultTableExpirationMs and defaultPartitionExpirationMs will be used for
        # any new partitioned table. If you provide an explicit timePartitioning.
        # expirationMs when creating or updating a partitioned table, that value takes
        # precedence over the default partition expiration time indicated by this
        # property.
        # Corresponds to the JSON property `defaultPartitionExpirationMs`
        # @return [Fixnum]
        attr_accessor :default_partition_expiration_ms
      
        # [Optional] The default lifetime of all tables in the dataset, in milliseconds.
        # The minimum value is 3600000 milliseconds (one hour). Once this property is
        # set, all newly-created tables in the dataset will have an expirationTime
        # property set to the creation time plus the value in this property, and
        # changing the value will only affect new tables, not existing ones. When the
        # expirationTime for a given table is reached, that table will be deleted
        # automatically. If a table's expirationTime is modified or removed before the
        # table expires, or if you provide an explicit expirationTime when creating a
        # table, that value takes precedence over the default expiration time indicated
        # by this property.
        # Corresponds to the JSON property `defaultTableExpirationMs`
        # @return [Fixnum]
        attr_accessor :default_table_expiration_ms
      
        # [Optional] A user-friendly description of the dataset.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # [Output-only] A hash of the resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # [Optional] A descriptive name for the dataset.
        # Corresponds to the JSON property `friendlyName`
        # @return [String]
        attr_accessor :friendly_name
      
        # [Output-only] The fully-qualified unique name of the dataset in the format
        # projectId:datasetId. The dataset name without the project name is given in the
        # datasetId field. When creating a new dataset, leave this field blank, and
        # instead specify the datasetId field.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # [Output-only] The resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The labels associated with this dataset. You can use these to organize and
        # group your datasets. You can set this property when inserting or updating a
        # dataset. See Creating and Updating Dataset Labels for more information.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # [Output-only] The date when this dataset or any of its tables was last
        # modified, in milliseconds since the epoch.
        # Corresponds to the JSON property `lastModifiedTime`
        # @return [Fixnum]
        attr_accessor :last_modified_time
      
        # The geographic location where the dataset should reside. The default value is
        # US. See details at https://cloud.google.com/bigquery/docs/locations.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # [Output-only] A URL that can be used to access the resource again. You can use
        # this URL in Get or Update requests to the resource.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @access = args[:access] if args.key?(:access)
          @creation_time = args[:creation_time] if args.key?(:creation_time)
          @dataset_reference = args[:dataset_reference] if args.key?(:dataset_reference)
          @default_encryption_configuration = args[:default_encryption_configuration] if args.key?(:default_encryption_configuration)
          @default_partition_expiration_ms = args[:default_partition_expiration_ms] if args.key?(:default_partition_expiration_ms)
          @default_table_expiration_ms = args[:default_table_expiration_ms] if args.key?(:default_table_expiration_ms)
          @description = args[:description] if args.key?(:description)
          @etag = args[:etag] if args.key?(:etag)
          @friendly_name = args[:friendly_name] if args.key?(:friendly_name)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @labels = args[:labels] if args.key?(:labels)
          @last_modified_time = args[:last_modified_time] if args.key?(:last_modified_time)
          @location = args[:location] if args.key?(:location)
          @self_link = args[:self_link] if args.key?(:self_link)
        end
        
        # 
        class Access
          include Google::Apis::Core::Hashable
        
          # [Pick one] A domain to grant access to. Any users signed in with the domain
          # specified will be granted the specified access. Example: "example.com". Maps
          # to IAM policy member "domain:DOMAIN".
          # Corresponds to the JSON property `domain`
          # @return [String]
          attr_accessor :domain
        
          # [Pick one] An email address of a Google Group to grant access to. Maps to IAM
          # policy member "group:GROUP".
          # Corresponds to the JSON property `groupByEmail`
          # @return [String]
          attr_accessor :group_by_email
        
          # [Pick one] Some other type of member that appears in the IAM Policy but isn't
          # a user, group, domain, or special group.
          # Corresponds to the JSON property `iamMember`
          # @return [String]
          attr_accessor :iam_member
        
          # [Required] An IAM role ID that should be granted to the user, group, or domain
          # specified in this access entry. The following legacy mappings will be applied:
          # OWNER  roles/bigquery.dataOwner WRITER  roles/bigquery.dataEditor READER
          # roles/bigquery.dataViewer This field will accept any of the above formats, but
          # will return only the legacy format. For example, if you set this field to "
          # roles/bigquery.dataOwner", it will be returned back as "OWNER".
          # Corresponds to the JSON property `role`
          # @return [String]
          attr_accessor :role
        
          # [Pick one] A special group to grant access to. Possible values include:
          # projectOwners: Owners of the enclosing project. projectReaders: Readers of the
          # enclosing project. projectWriters: Writers of the enclosing project.
          # allAuthenticatedUsers: All authenticated BigQuery users. Maps to similarly-
          # named IAM members.
          # Corresponds to the JSON property `specialGroup`
          # @return [String]
          attr_accessor :special_group
        
          # [Pick one] An email address of a user to grant access to. For example: fred@
          # example.com. Maps to IAM policy member "user:EMAIL" or "serviceAccount:EMAIL".
          # Corresponds to the JSON property `userByEmail`
          # @return [String]
          attr_accessor :user_by_email
        
          # [Pick one] A view from a different dataset to grant access to. Queries
          # executed against that view will have read access to tables in this dataset.
          # The role field is not required when this field is set. If that view is updated
          # by any user, access to the view needs to be granted again via an update
          # operation.
          # Corresponds to the JSON property `view`
          # @return [Google::Apis::BigqueryV2::TableReference]
          attr_accessor :view
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @domain = args[:domain] if args.key?(:domain)
            @group_by_email = args[:group_by_email] if args.key?(:group_by_email)
            @iam_member = args[:iam_member] if args.key?(:iam_member)
            @role = args[:role] if args.key?(:role)
            @special_group = args[:special_group] if args.key?(:special_group)
            @user_by_email = args[:user_by_email] if args.key?(:user_by_email)
            @view = args[:view] if args.key?(:view)
          end
        end
      end
      
      # 
      class DatasetList
        include Google::Apis::Core::Hashable
      
        # An array of the dataset resources in the project. Each resource contains basic
        # information. For full information about a particular dataset resource, use the
        # Datasets: get method. This property is omitted when there are no datasets in
        # the project.
        # Corresponds to the JSON property `datasets`
        # @return [Array<Google::Apis::BigqueryV2::DatasetList::Dataset>]
        attr_accessor :datasets
      
        # A hash value of the results page. You can use this property to determine if
        # the page has changed since the last request.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The list type. This property always returns the value "bigquery#datasetList".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # A token that can be used to request the next results page. This property is
        # omitted on the final results page.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @datasets = args[:datasets] if args.key?(:datasets)
          @etag = args[:etag] if args.key?(:etag)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
        
        # 
        class Dataset
          include Google::Apis::Core::Hashable
        
          # The dataset reference. Use this property to access specific parts of the
          # dataset's ID, such as project ID or dataset ID.
          # Corresponds to the JSON property `datasetReference`
          # @return [Google::Apis::BigqueryV2::DatasetReference]
          attr_accessor :dataset_reference
        
          # A descriptive name for the dataset, if one exists.
          # Corresponds to the JSON property `friendlyName`
          # @return [String]
          attr_accessor :friendly_name
        
          # The fully-qualified, unique, opaque ID of the dataset.
          # Corresponds to the JSON property `id`
          # @return [String]
          attr_accessor :id
        
          # The resource type. This property always returns the value "bigquery#dataset".
          # Corresponds to the JSON property `kind`
          # @return [String]
          attr_accessor :kind
        
          # The labels associated with this dataset. You can use these to organize and
          # group your datasets.
          # Corresponds to the JSON property `labels`
          # @return [Hash<String,String>]
          attr_accessor :labels
        
          # The geographic location where the data resides.
          # Corresponds to the JSON property `location`
          # @return [String]
          attr_accessor :location
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @dataset_reference = args[:dataset_reference] if args.key?(:dataset_reference)
            @friendly_name = args[:friendly_name] if args.key?(:friendly_name)
            @id = args[:id] if args.key?(:id)
            @kind = args[:kind] if args.key?(:kind)
            @labels = args[:labels] if args.key?(:labels)
            @location = args[:location] if args.key?(:location)
          end
        end
      end
      
      # 
      class DatasetReference
        include Google::Apis::Core::Hashable
      
        # [Required] A unique ID for this dataset, without the project name. The ID must
        # contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). The
        # maximum length is 1,024 characters.
        # Corresponds to the JSON property `datasetId`
        # @return [String]
        attr_accessor :dataset_id
      
        # [Optional] The ID of the project containing this dataset.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dataset_id = args[:dataset_id] if args.key?(:dataset_id)
          @project_id = args[:project_id] if args.key?(:project_id)
        end
      end
      
      # 
      class DestinationTableProperties
        include Google::Apis::Core::Hashable
      
        # [Optional] The description for the destination table. This will only be used
        # if the destination table is newly created. If the table already exists and a
        # value different than the current description is provided, the job will fail.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # [Optional] The friendly name for the destination table. This will only be used
        # if the destination table is newly created. If the table already exists and a
        # value different than the current friendly name is provided, the job will fail.
        # Corresponds to the JSON property `friendlyName`
        # @return [String]
        attr_accessor :friendly_name
      
        # [Optional] The labels associated with this table. You can use these to
        # organize and group your tables. This will only be used if the destination
        # table is newly created. If the table already exists and labels are different
        # than the current labels are provided, the job will fail.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @friendly_name = args[:friendly_name] if args.key?(:friendly_name)
          @labels = args[:labels] if args.key?(:labels)
        end
      end
      
      # 
      class EncryptionConfiguration
        include Google::Apis::Core::Hashable
      
        # [Optional] Describes the Cloud KMS encryption key that will be used to protect
        # destination BigQuery table. The BigQuery Service Account associated with your
        # project requires access to this encryption key.
        # Corresponds to the JSON property `kmsKeyName`
        # @return [String]
        attr_accessor :kms_key_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kms_key_name = args[:kms_key_name] if args.key?(:kms_key_name)
        end
      end
      
      # A single entry in the confusion matrix.
      class Entry
        include Google::Apis::Core::Hashable
      
        # Number of items being predicted as this label.
        # Corresponds to the JSON property `itemCount`
        # @return [Fixnum]
        attr_accessor :item_count
      
        # The predicted label. For confidence_threshold > 0, we will
        # also add an entry indicating the number of items under the
        # confidence threshold.
        # Corresponds to the JSON property `predictedLabel`
        # @return [String]
        attr_accessor :predicted_label
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @item_count = args[:item_count] if args.key?(:item_count)
          @predicted_label = args[:predicted_label] if args.key?(:predicted_label)
        end
      end
      
      # 
      class ErrorProto
        include Google::Apis::Core::Hashable
      
        # Debugging information. This property is internal to Google and should not be
        # used.
        # Corresponds to the JSON property `debugInfo`
        # @return [String]
        attr_accessor :debug_info
      
        # Specifies where the error occurred, if present.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # A human-readable description of the error.
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        # A short error code that summarizes the error.
        # Corresponds to the JSON property `reason`
        # @return [String]
        attr_accessor :reason
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @debug_info = args[:debug_info] if args.key?(:debug_info)
          @location = args[:location] if args.key?(:location)
          @message = args[:message] if args.key?(:message)
          @reason = args[:reason] if args.key?(:reason)
        end
      end
      
      # Evaluation metrics of a model. These are either computed on all training
      # data or just the eval data based on whether eval data was used during
      # training. These are not present for imported models.
      class EvaluationMetrics
        include Google::Apis::Core::Hashable
      
        # Evaluation metrics for binary classification/classifier models.
        # Corresponds to the JSON property `binaryClassificationMetrics`
        # @return [Google::Apis::BigqueryV2::BinaryClassificationMetrics]
        attr_accessor :binary_classification_metrics
      
        # Evaluation metrics for clustering models.
        # Corresponds to the JSON property `clusteringMetrics`
        # @return [Google::Apis::BigqueryV2::ClusteringMetrics]
        attr_accessor :clustering_metrics
      
        # Evaluation metrics for multi-class classification/classifier models.
        # Corresponds to the JSON property `multiClassClassificationMetrics`
        # @return [Google::Apis::BigqueryV2::MultiClassClassificationMetrics]
        attr_accessor :multi_class_classification_metrics
      
        # Evaluation metrics for regression and explicit feedback type matrix
        # factorization models.
        # Corresponds to the JSON property `regressionMetrics`
        # @return [Google::Apis::BigqueryV2::RegressionMetrics]
        attr_accessor :regression_metrics
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @binary_classification_metrics = args[:binary_classification_metrics] if args.key?(:binary_classification_metrics)
          @clustering_metrics = args[:clustering_metrics] if args.key?(:clustering_metrics)
          @multi_class_classification_metrics = args[:multi_class_classification_metrics] if args.key?(:multi_class_classification_metrics)
          @regression_metrics = args[:regression_metrics] if args.key?(:regression_metrics)
        end
      end
      
      # 
      class ExplainQueryStage
        include Google::Apis::Core::Hashable
      
        # Number of parallel input segments completed.
        # Corresponds to the JSON property `completedParallelInputs`
        # @return [Fixnum]
        attr_accessor :completed_parallel_inputs
      
        # Milliseconds the average shard spent on CPU-bound tasks.
        # Corresponds to the JSON property `computeMsAvg`
        # @return [Fixnum]
        attr_accessor :compute_ms_avg
      
        # Milliseconds the slowest shard spent on CPU-bound tasks.
        # Corresponds to the JSON property `computeMsMax`
        # @return [Fixnum]
        attr_accessor :compute_ms_max
      
        # Relative amount of time the average shard spent on CPU-bound tasks.
        # Corresponds to the JSON property `computeRatioAvg`
        # @return [Float]
        attr_accessor :compute_ratio_avg
      
        # Relative amount of time the slowest shard spent on CPU-bound tasks.
        # Corresponds to the JSON property `computeRatioMax`
        # @return [Float]
        attr_accessor :compute_ratio_max
      
        # Stage end time represented as milliseconds since epoch.
        # Corresponds to the JSON property `endMs`
        # @return [Fixnum]
        attr_accessor :end_ms
      
        # Unique ID for stage within plan.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # IDs for stages that are inputs to this stage.
        # Corresponds to the JSON property `inputStages`
        # @return [Array<Fixnum>]
        attr_accessor :input_stages
      
        # Human-readable name for stage.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Number of parallel input segments to be processed.
        # Corresponds to the JSON property `parallelInputs`
        # @return [Fixnum]
        attr_accessor :parallel_inputs
      
        # Milliseconds the average shard spent reading input.
        # Corresponds to the JSON property `readMsAvg`
        # @return [Fixnum]
        attr_accessor :read_ms_avg
      
        # Milliseconds the slowest shard spent reading input.
        # Corresponds to the JSON property `readMsMax`
        # @return [Fixnum]
        attr_accessor :read_ms_max
      
        # Relative amount of time the average shard spent reading input.
        # Corresponds to the JSON property `readRatioAvg`
        # @return [Float]
        attr_accessor :read_ratio_avg
      
        # Relative amount of time the slowest shard spent reading input.
        # Corresponds to the JSON property `readRatioMax`
        # @return [Float]
        attr_accessor :read_ratio_max
      
        # Number of records read into the stage.
        # Corresponds to the JSON property `recordsRead`
        # @return [Fixnum]
        attr_accessor :records_read
      
        # Number of records written by the stage.
        # Corresponds to the JSON property `recordsWritten`
        # @return [Fixnum]
        attr_accessor :records_written
      
        # Total number of bytes written to shuffle.
        # Corresponds to the JSON property `shuffleOutputBytes`
        # @return [Fixnum]
        attr_accessor :shuffle_output_bytes
      
        # Total number of bytes written to shuffle and spilled to disk.
        # Corresponds to the JSON property `shuffleOutputBytesSpilled`
        # @return [Fixnum]
        attr_accessor :shuffle_output_bytes_spilled
      
        # Stage start time represented as milliseconds since epoch.
        # Corresponds to the JSON property `startMs`
        # @return [Fixnum]
        attr_accessor :start_ms
      
        # Current status for the stage.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # List of operations within the stage in dependency order (approximately
        # chronological).
        # Corresponds to the JSON property `steps`
        # @return [Array<Google::Apis::BigqueryV2::ExplainQueryStep>]
        attr_accessor :steps
      
        # Milliseconds the average shard spent waiting to be scheduled.
        # Corresponds to the JSON property `waitMsAvg`
        # @return [Fixnum]
        attr_accessor :wait_ms_avg
      
        # Milliseconds the slowest shard spent waiting to be scheduled.
        # Corresponds to the JSON property `waitMsMax`
        # @return [Fixnum]
        attr_accessor :wait_ms_max
      
        # Relative amount of time the average shard spent waiting to be scheduled.
        # Corresponds to the JSON property `waitRatioAvg`
        # @return [Float]
        attr_accessor :wait_ratio_avg
      
        # Relative amount of time the slowest shard spent waiting to be scheduled.
        # Corresponds to the JSON property `waitRatioMax`
        # @return [Float]
        attr_accessor :wait_ratio_max
      
        # Milliseconds the average shard spent on writing output.
        # Corresponds to the JSON property `writeMsAvg`
        # @return [Fixnum]
        attr_accessor :write_ms_avg
      
        # Milliseconds the slowest shard spent on writing output.
        # Corresponds to the JSON property `writeMsMax`
        # @return [Fixnum]
        attr_accessor :write_ms_max
      
        # Relative amount of time the average shard spent on writing output.
        # Corresponds to the JSON property `writeRatioAvg`
        # @return [Float]
        attr_accessor :write_ratio_avg
      
        # Relative amount of time the slowest shard spent on writing output.
        # Corresponds to the JSON property `writeRatioMax`
        # @return [Float]
        attr_accessor :write_ratio_max
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @completed_parallel_inputs = args[:completed_parallel_inputs] if args.key?(:completed_parallel_inputs)
          @compute_ms_avg = args[:compute_ms_avg] if args.key?(:compute_ms_avg)
          @compute_ms_max = args[:compute_ms_max] if args.key?(:compute_ms_max)
          @compute_ratio_avg = args[:compute_ratio_avg] if args.key?(:compute_ratio_avg)
          @compute_ratio_max = args[:compute_ratio_max] if args.key?(:compute_ratio_max)
          @end_ms = args[:end_ms] if args.key?(:end_ms)
          @id = args[:id] if args.key?(:id)
          @input_stages = args[:input_stages] if args.key?(:input_stages)
          @name = args[:name] if args.key?(:name)
          @parallel_inputs = args[:parallel_inputs] if args.key?(:parallel_inputs)
          @read_ms_avg = args[:read_ms_avg] if args.key?(:read_ms_avg)
          @read_ms_max = args[:read_ms_max] if args.key?(:read_ms_max)
          @read_ratio_avg = args[:read_ratio_avg] if args.key?(:read_ratio_avg)
          @read_ratio_max = args[:read_ratio_max] if args.key?(:read_ratio_max)
          @records_read = args[:records_read] if args.key?(:records_read)
          @records_written = args[:records_written] if args.key?(:records_written)
          @shuffle_output_bytes = args[:shuffle_output_bytes] if args.key?(:shuffle_output_bytes)
          @shuffle_output_bytes_spilled = args[:shuffle_output_bytes_spilled] if args.key?(:shuffle_output_bytes_spilled)
          @start_ms = args[:start_ms] if args.key?(:start_ms)
          @status = args[:status] if args.key?(:status)
          @steps = args[:steps] if args.key?(:steps)
          @wait_ms_avg = args[:wait_ms_avg] if args.key?(:wait_ms_avg)
          @wait_ms_max = args[:wait_ms_max] if args.key?(:wait_ms_max)
          @wait_ratio_avg = args[:wait_ratio_avg] if args.key?(:wait_ratio_avg)
          @wait_ratio_max = args[:wait_ratio_max] if args.key?(:wait_ratio_max)
          @write_ms_avg = args[:write_ms_avg] if args.key?(:write_ms_avg)
          @write_ms_max = args[:write_ms_max] if args.key?(:write_ms_max)
          @write_ratio_avg = args[:write_ratio_avg] if args.key?(:write_ratio_avg)
          @write_ratio_max = args[:write_ratio_max] if args.key?(:write_ratio_max)
        end
      end
      
      # 
      class ExplainQueryStep
        include Google::Apis::Core::Hashable
      
        # Machine-readable operation type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Human-readable stage descriptions.
        # Corresponds to the JSON property `substeps`
        # @return [Array<String>]
        attr_accessor :substeps
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @substeps = args[:substeps] if args.key?(:substeps)
        end
      end
      
      # 
      class ExternalDataConfiguration
        include Google::Apis::Core::Hashable
      
        # Try to detect schema and format options automatically. Any option specified
        # explicitly will be honored.
        # Corresponds to the JSON property `autodetect`
        # @return [Boolean]
        attr_accessor :autodetect
        alias_method :autodetect?, :autodetect
      
        # [Optional] Additional options if sourceFormat is set to BIGTABLE.
        # Corresponds to the JSON property `bigtableOptions`
        # @return [Google::Apis::BigqueryV2::BigtableOptions]
        attr_accessor :bigtable_options
      
        # [Optional] The compression type of the data source. Possible values include
        # GZIP and NONE. The default value is NONE. This setting is ignored for Google
        # Cloud Bigtable, Google Cloud Datastore backups and Avro formats.
        # Corresponds to the JSON property `compression`
        # @return [String]
        attr_accessor :compression
      
        # Additional properties to set if sourceFormat is set to CSV.
        # Corresponds to the JSON property `csvOptions`
        # @return [Google::Apis::BigqueryV2::CsvOptions]
        attr_accessor :csv_options
      
        # [Optional] Additional options if sourceFormat is set to GOOGLE_SHEETS.
        # Corresponds to the JSON property `googleSheetsOptions`
        # @return [Google::Apis::BigqueryV2::GoogleSheetsOptions]
        attr_accessor :google_sheets_options
      
        # [Optional, Trusted Tester] Deprecated, do not use. Please set
        # hivePartitioningOptions instead.
        # Corresponds to the JSON property `hivePartitioningMode`
        # @return [String]
        attr_accessor :hive_partitioning_mode
      
        # [Optional, Trusted Tester] Options to configure hive partitioning support.
        # Corresponds to the JSON property `hivePartitioningOptions`
        # @return [Google::Apis::BigqueryV2::HivePartitioningOptions]
        attr_accessor :hive_partitioning_options
      
        # [Optional] Indicates if BigQuery should allow extra values that are not
        # represented in the table schema. If true, the extra values are ignored. If
        # false, records with extra columns are treated as bad records, and if there are
        # too many bad records, an invalid error is returned in the job result. The
        # default value is false. The sourceFormat property determines what BigQuery
        # treats as an extra value: CSV: Trailing columns JSON: Named values that don't
        # match any column names Google Cloud Bigtable: This setting is ignored. Google
        # Cloud Datastore backups: This setting is ignored. Avro: This setting is
        # ignored.
        # Corresponds to the JSON property `ignoreUnknownValues`
        # @return [Boolean]
        attr_accessor :ignore_unknown_values
        alias_method :ignore_unknown_values?, :ignore_unknown_values
      
        # [Optional] The maximum number of bad records that BigQuery can ignore when
        # reading data. If the number of bad records exceeds this value, an invalid
        # error is returned in the job result. This is only valid for CSV, JSON, and
        # Google Sheets. The default value is 0, which requires that all records are
        # valid. This setting is ignored for Google Cloud Bigtable, Google Cloud
        # Datastore backups and Avro formats.
        # Corresponds to the JSON property `maxBadRecords`
        # @return [Fixnum]
        attr_accessor :max_bad_records
      
        # [Optional] The schema for the data. Schema is required for CSV and JSON
        # formats. Schema is disallowed for Google Cloud Bigtable, Cloud Datastore
        # backups, and Avro formats.
        # Corresponds to the JSON property `schema`
        # @return [Google::Apis::BigqueryV2::TableSchema]
        attr_accessor :schema
      
        # [Required] The data format. For CSV files, specify "CSV". For Google sheets,
        # specify "GOOGLE_SHEETS". For newline-delimited JSON, specify "
        # NEWLINE_DELIMITED_JSON". For Avro files, specify "AVRO". For Google Cloud
        # Datastore backups, specify "DATASTORE_BACKUP". [Beta] For Google Cloud
        # Bigtable, specify "BIGTABLE".
        # Corresponds to the JSON property `sourceFormat`
        # @return [String]
        attr_accessor :source_format
      
        # [Required] The fully-qualified URIs that point to your data in Google Cloud.
        # For Google Cloud Storage URIs: Each URI can contain one '*' wildcard character
        # and it must come after the 'bucket' name. Size limits related to load jobs
        # apply to external data sources. For Google Cloud Bigtable URIs: Exactly one
        # URI can be specified and it has be a fully specified and valid HTTPS URL for a
        # Google Cloud Bigtable table. For Google Cloud Datastore backups, exactly one
        # URI can be specified. Also, the '*' wildcard character is not allowed.
        # Corresponds to the JSON property `sourceUris`
        # @return [Array<String>]
        attr_accessor :source_uris
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @autodetect = args[:autodetect] if args.key?(:autodetect)
          @bigtable_options = args[:bigtable_options] if args.key?(:bigtable_options)
          @compression = args[:compression] if args.key?(:compression)
          @csv_options = args[:csv_options] if args.key?(:csv_options)
          @google_sheets_options = args[:google_sheets_options] if args.key?(:google_sheets_options)
          @hive_partitioning_mode = args[:hive_partitioning_mode] if args.key?(:hive_partitioning_mode)
          @hive_partitioning_options = args[:hive_partitioning_options] if args.key?(:hive_partitioning_options)
          @ignore_unknown_values = args[:ignore_unknown_values] if args.key?(:ignore_unknown_values)
          @max_bad_records = args[:max_bad_records] if args.key?(:max_bad_records)
          @schema = args[:schema] if args.key?(:schema)
          @source_format = args[:source_format] if args.key?(:source_format)
          @source_uris = args[:source_uris] if args.key?(:source_uris)
        end
      end
      
      # Representative value of a single feature within the cluster.
      class FeatureValue
        include Google::Apis::Core::Hashable
      
        # Representative value of a categorical feature.
        # Corresponds to the JSON property `categoricalValue`
        # @return [Google::Apis::BigqueryV2::CategoricalValue]
        attr_accessor :categorical_value
      
        # The feature column name.
        # Corresponds to the JSON property `featureColumn`
        # @return [String]
        attr_accessor :feature_column
      
        # The numerical feature value. This is the centroid value for this
        # feature.
        # Corresponds to the JSON property `numericalValue`
        # @return [Float]
        attr_accessor :numerical_value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @categorical_value = args[:categorical_value] if args.key?(:categorical_value)
          @feature_column = args[:feature_column] if args.key?(:feature_column)
          @numerical_value = args[:numerical_value] if args.key?(:numerical_value)
        end
      end
      
      # 
      class GetQueryResultsResponse
        include Google::Apis::Core::Hashable
      
        # Whether the query result was fetched from the query cache.
        # Corresponds to the JSON property `cacheHit`
        # @return [Boolean]
        attr_accessor :cache_hit
        alias_method :cache_hit?, :cache_hit
      
        # [Output-only] The first errors or warnings encountered during the running of
        # the job. The final message includes the number of errors that caused the
        # process to stop. Errors here do not necessarily mean that the job has
        # completed or was unsuccessful.
        # Corresponds to the JSON property `errors`
        # @return [Array<Google::Apis::BigqueryV2::ErrorProto>]
        attr_accessor :errors
      
        # A hash of this response.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Whether the query has completed or not. If rows or totalRows are present, this
        # will always be true. If this is false, totalRows will not be available.
        # Corresponds to the JSON property `jobComplete`
        # @return [Boolean]
        attr_accessor :job_complete
        alias_method :job_complete?, :job_complete
      
        # Reference to the BigQuery Job that was created to run the query. This field
        # will be present even if the original request timed out, in which case
        # GetQueryResults can be used to read the results once the query has completed.
        # Since this API only returns the first page of results, subsequent pages can be
        # fetched via the same mechanism (GetQueryResults).
        # Corresponds to the JSON property `jobReference`
        # @return [Google::Apis::BigqueryV2::JobReference]
        attr_accessor :job_reference
      
        # The resource type of the response.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # [Output-only] The number of rows affected by a DML statement. Present only for
        # DML statements INSERT, UPDATE or DELETE.
        # Corresponds to the JSON property `numDmlAffectedRows`
        # @return [Fixnum]
        attr_accessor :num_dml_affected_rows
      
        # A token used for paging results.
        # Corresponds to the JSON property `pageToken`
        # @return [String]
        attr_accessor :page_token
      
        # An object with as many results as can be contained within the maximum
        # permitted reply size. To get any additional rows, you can call GetQueryResults
        # and specify the jobReference returned above. Present only when the query
        # completes successfully.
        # Corresponds to the JSON property `rows`
        # @return [Array<Google::Apis::BigqueryV2::TableRow>]
        attr_accessor :rows
      
        # The schema of the results. Present only when the query completes successfully.
        # Corresponds to the JSON property `schema`
        # @return [Google::Apis::BigqueryV2::TableSchema]
        attr_accessor :schema
      
        # The total number of bytes processed for this query.
        # Corresponds to the JSON property `totalBytesProcessed`
        # @return [Fixnum]
        attr_accessor :total_bytes_processed
      
        # The total number of rows in the complete query result set, which can be more
        # than the number of rows in this single page of results. Present only when the
        # query completes successfully.
        # Corresponds to the JSON property `totalRows`
        # @return [Fixnum]
        attr_accessor :total_rows
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cache_hit = args[:cache_hit] if args.key?(:cache_hit)
          @errors = args[:errors] if args.key?(:errors)
          @etag = args[:etag] if args.key?(:etag)
          @job_complete = args[:job_complete] if args.key?(:job_complete)
          @job_reference = args[:job_reference] if args.key?(:job_reference)
          @kind = args[:kind] if args.key?(:kind)
          @num_dml_affected_rows = args[:num_dml_affected_rows] if args.key?(:num_dml_affected_rows)
          @page_token = args[:page_token] if args.key?(:page_token)
          @rows = args[:rows] if args.key?(:rows)
          @schema = args[:schema] if args.key?(:schema)
          @total_bytes_processed = args[:total_bytes_processed] if args.key?(:total_bytes_processed)
          @total_rows = args[:total_rows] if args.key?(:total_rows)
        end
      end
      
      # 
      class GetServiceAccountResponse
        include Google::Apis::Core::Hashable
      
        # The service account email address.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # The resource type of the response.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @email = args[:email] if args.key?(:email)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # 
      class GoogleSheetsOptions
        include Google::Apis::Core::Hashable
      
        # [Optional] Range of a sheet to query from. Only used when non-empty. Typical
        # format: sheet_name!top_left_cell_id:bottom_right_cell_id For example: sheet1!
        # A1:B20
        # Corresponds to the JSON property `range`
        # @return [String]
        attr_accessor :range
      
        # [Optional] The number of rows at the top of a sheet that BigQuery will skip
        # when reading the data. The default value is 0. This property is useful if you
        # have header rows that should be skipped. When autodetect is on, behavior is
        # the following: * skipLeadingRows unspecified - Autodetect tries to detect
        # headers in the first row. If they are not detected, the row is read as data.
        # Otherwise data is read starting from the second row. * skipLeadingRows is 0 -
        # Instructs autodetect that there are no headers and data should be read
        # starting from the first row. * skipLeadingRows = N > 0 - Autodetect skips N-1
        # rows and tries to detect headers in row N. If headers are not detected, row N
        # is just skipped. Otherwise row N is used to extract column names for the
        # detected schema.
        # Corresponds to the JSON property `skipLeadingRows`
        # @return [Fixnum]
        attr_accessor :skip_leading_rows
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @range = args[:range] if args.key?(:range)
          @skip_leading_rows = args[:skip_leading_rows] if args.key?(:skip_leading_rows)
        end
      end
      
      # 
      class HivePartitioningOptions
        include Google::Apis::Core::Hashable
      
        # [Optional, Trusted Tester] When set, what mode of hive partitioning to use
        # when reading data. Two modes are supported. (1) AUTO: automatically infer
        # partition key name(s) and type(s). (2) STRINGS: automatically infer partition
        # key name(s). All types are interpreted as strings. Not all storage formats
        # support hive partitioning. Requesting hive partitioning on an unsupported
        # format will lead to an error. Currently supported types include: AVRO, CSV,
        # JSON, ORC and Parquet.
        # Corresponds to the JSON property `mode`
        # @return [String]
        attr_accessor :mode
      
        # [Optional, Trusted Tester] When hive partition detection is requested, a
        # common prefix for all source uris should be supplied. The prefix must end
        # immediately before the partition key encoding begins. For example, consider
        # files following this data layout. gs://bucket/path_to_table/dt=2019-01-01/
        # country=BR/id=7/file.avro gs://bucket/path_to_table/dt=2018-12-31/country=CA/
        # id=3/file.avro When hive partitioning is requested with either AUTO or STRINGS
        # detection, the common prefix can be either of gs://bucket/path_to_table or gs:/
        # /bucket/path_to_table/ (trailing slash does not matter).
        # Corresponds to the JSON property `sourceUriPrefix`
        # @return [String]
        attr_accessor :source_uri_prefix
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @mode = args[:mode] if args.key?(:mode)
          @source_uri_prefix = args[:source_uri_prefix] if args.key?(:source_uri_prefix)
        end
      end
      
      # Information about a single iteration of the training run.
      class IterationResult
        include Google::Apis::Core::Hashable
      
        # (Auto-)arima fitting result. Wrap everything in ArimaResult for easier
        # refactoring if we want to use model-specific iteration results.
        # Corresponds to the JSON property `arimaResult`
        # @return [Google::Apis::BigqueryV2::ArimaResult]
        attr_accessor :arima_result
      
        # Information about top clusters for clustering models.
        # Corresponds to the JSON property `clusterInfos`
        # @return [Array<Google::Apis::BigqueryV2::ClusterInfo>]
        attr_accessor :cluster_infos
      
        # Time taken to run the iteration in milliseconds.
        # Corresponds to the JSON property `durationMs`
        # @return [Fixnum]
        attr_accessor :duration_ms
      
        # Loss computed on the eval data at the end of iteration.
        # Corresponds to the JSON property `evalLoss`
        # @return [Float]
        attr_accessor :eval_loss
      
        # Index of the iteration, 0 based.
        # Corresponds to the JSON property `index`
        # @return [Fixnum]
        attr_accessor :index
      
        # Learn rate used for this iteration.
        # Corresponds to the JSON property `learnRate`
        # @return [Float]
        attr_accessor :learn_rate
      
        # Loss computed on the training data at the end of iteration.
        # Corresponds to the JSON property `trainingLoss`
        # @return [Float]
        attr_accessor :training_loss
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @arima_result = args[:arima_result] if args.key?(:arima_result)
          @cluster_infos = args[:cluster_infos] if args.key?(:cluster_infos)
          @duration_ms = args[:duration_ms] if args.key?(:duration_ms)
          @eval_loss = args[:eval_loss] if args.key?(:eval_loss)
          @index = args[:index] if args.key?(:index)
          @learn_rate = args[:learn_rate] if args.key?(:learn_rate)
          @training_loss = args[:training_loss] if args.key?(:training_loss)
        end
      end
      
      # 
      class Job
        include Google::Apis::Core::Hashable
      
        # [Required] Describes the job configuration.
        # Corresponds to the JSON property `configuration`
        # @return [Google::Apis::BigqueryV2::JobConfiguration]
        attr_accessor :configuration
      
        # [Output-only] A hash of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # [Output-only] Opaque ID field of the job
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # [Optional] Reference describing the unique-per-user name of the job.
        # Corresponds to the JSON property `jobReference`
        # @return [Google::Apis::BigqueryV2::JobReference]
        attr_accessor :job_reference
      
        # [Output-only] The type of the resource.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # [Output-only] A URL that can be used to access this resource again.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # [Output-only] Information about the job, including starting time and ending
        # time of the job.
        # Corresponds to the JSON property `statistics`
        # @return [Google::Apis::BigqueryV2::JobStatistics]
        attr_accessor :statistics
      
        # [Output-only] The status of this job. Examine this value when polling an
        # asynchronous job to see if the job is complete.
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::BigqueryV2::JobStatus]
        attr_accessor :status
      
        # [Output-only] Email address of the user who ran the job.
        # Corresponds to the JSON property `user_email`
        # @return [String]
        attr_accessor :user_email
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @configuration = args[:configuration] if args.key?(:configuration)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @job_reference = args[:job_reference] if args.key?(:job_reference)
          @kind = args[:kind] if args.key?(:kind)
          @self_link = args[:self_link] if args.key?(:self_link)
          @statistics = args[:statistics] if args.key?(:statistics)
          @status = args[:status] if args.key?(:status)
          @user_email = args[:user_email] if args.key?(:user_email)
        end
      end
      
      # 
      class CancelJobResponse
        include Google::Apis::Core::Hashable
      
        # The final state of the job.
        # Corresponds to the JSON property `job`
        # @return [Google::Apis::BigqueryV2::Job]
        attr_accessor :job
      
        # The resource type of the response.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @job = args[:job] if args.key?(:job)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # 
      class JobConfiguration
        include Google::Apis::Core::Hashable
      
        # [Pick one] Copies a table.
        # Corresponds to the JSON property `copy`
        # @return [Google::Apis::BigqueryV2::JobConfigurationTableCopy]
        attr_accessor :copy
      
        # [Optional] If set, don't actually run this job. A valid query will return a
        # mostly empty response with some processing statistics, while an invalid query
        # will return the same error it would if it wasn't a dry run. Behavior of non-
        # query jobs is undefined.
        # Corresponds to the JSON property `dryRun`
        # @return [Boolean]
        attr_accessor :dry_run
        alias_method :dry_run?, :dry_run
      
        # [Pick one] Configures an extract job.
        # Corresponds to the JSON property `extract`
        # @return [Google::Apis::BigqueryV2::JobConfigurationExtract]
        attr_accessor :extract
      
        # [Optional] Job timeout in milliseconds. If this time limit is exceeded,
        # BigQuery may attempt to terminate the job.
        # Corresponds to the JSON property `jobTimeoutMs`
        # @return [Fixnum]
        attr_accessor :job_timeout_ms
      
        # [Output-only] The type of the job. Can be QUERY, LOAD, EXTRACT, COPY or
        # UNKNOWN.
        # Corresponds to the JSON property `jobType`
        # @return [String]
        attr_accessor :job_type
      
        # The labels associated with this job. You can use these to organize and group
        # your jobs. Label keys and values can be no longer than 63 characters, can only
        # contain lowercase letters, numeric characters, underscores and dashes.
        # International characters are allowed. Label values are optional. Label keys
        # must start with a letter and each label in the list must have a different key.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # [Pick one] Configures a load job.
        # Corresponds to the JSON property `load`
        # @return [Google::Apis::BigqueryV2::JobConfigurationLoad]
        attr_accessor :load
      
        # [Pick one] Configures a query job.
        # Corresponds to the JSON property `query`
        # @return [Google::Apis::BigqueryV2::JobConfigurationQuery]
        attr_accessor :query
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @copy = args[:copy] if args.key?(:copy)
          @dry_run = args[:dry_run] if args.key?(:dry_run)
          @extract = args[:extract] if args.key?(:extract)
          @job_timeout_ms = args[:job_timeout_ms] if args.key?(:job_timeout_ms)
          @job_type = args[:job_type] if args.key?(:job_type)
          @labels = args[:labels] if args.key?(:labels)
          @load = args[:load] if args.key?(:load)
          @query = args[:query] if args.key?(:query)
        end
      end
      
      # 
      class JobConfigurationExtract
        include Google::Apis::Core::Hashable
      
        # [Optional] The compression type to use for exported files. Possible values
        # include GZIP, DEFLATE, SNAPPY, and NONE. The default value is NONE. DEFLATE
        # and SNAPPY are only supported for Avro.
        # Corresponds to the JSON property `compression`
        # @return [String]
        attr_accessor :compression
      
        # [Optional] The exported file format. Possible values include CSV,
        # NEWLINE_DELIMITED_JSON and AVRO. The default value is CSV. Tables with nested
        # or repeated fields cannot be exported as CSV.
        # Corresponds to the JSON property `destinationFormat`
        # @return [String]
        attr_accessor :destination_format
      
        # [Pick one] DEPRECATED: Use destinationUris instead, passing only one URI as
        # necessary. The fully-qualified Google Cloud Storage URI where the extracted
        # table should be written.
        # Corresponds to the JSON property `destinationUri`
        # @return [String]
        attr_accessor :destination_uri
      
        # [Pick one] A list of fully-qualified Google Cloud Storage URIs where the
        # extracted table should be written.
        # Corresponds to the JSON property `destinationUris`
        # @return [Array<String>]
        attr_accessor :destination_uris
      
        # [Optional] Delimiter to use between fields in the exported data. Default is ','
        # Corresponds to the JSON property `fieldDelimiter`
        # @return [String]
        attr_accessor :field_delimiter
      
        # [Optional] Whether to print out a header row in the results. Default is true.
        # Corresponds to the JSON property `printHeader`
        # @return [Boolean]
        attr_accessor :print_header
        alias_method :print_header?, :print_header
      
        # A reference to the model being exported.
        # Corresponds to the JSON property `sourceModel`
        # @return [Google::Apis::BigqueryV2::ModelReference]
        attr_accessor :source_model
      
        # A reference to the table being exported.
        # Corresponds to the JSON property `sourceTable`
        # @return [Google::Apis::BigqueryV2::TableReference]
        attr_accessor :source_table
      
        # [Optional] If destinationFormat is set to "AVRO", this flag indicates whether
        # to enable extracting applicable column types (such as TIMESTAMP) to their
        # corresponding AVRO logical types (timestamp-micros), instead of only using
        # their raw types (avro-long).
        # Corresponds to the JSON property `useAvroLogicalTypes`
        # @return [Boolean]
        attr_accessor :use_avro_logical_types
        alias_method :use_avro_logical_types?, :use_avro_logical_types
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @compression = args[:compression] if args.key?(:compression)
          @destination_format = args[:destination_format] if args.key?(:destination_format)
          @destination_uri = args[:destination_uri] if args.key?(:destination_uri)
          @destination_uris = args[:destination_uris] if args.key?(:destination_uris)
          @field_delimiter = args[:field_delimiter] if args.key?(:field_delimiter)
          @print_header = args[:print_header] if args.key?(:print_header)
          @source_model = args[:source_model] if args.key?(:source_model)
          @source_table = args[:source_table] if args.key?(:source_table)
          @use_avro_logical_types = args[:use_avro_logical_types] if args.key?(:use_avro_logical_types)
        end
      end
      
      # 
      class JobConfigurationLoad
        include Google::Apis::Core::Hashable
      
        # [Optional] Accept rows that are missing trailing optional columns. The missing
        # values are treated as nulls. If false, records with missing trailing columns
        # are treated as bad records, and if there are too many bad records, an invalid
        # error is returned in the job result. The default value is false. Only
        # applicable to CSV, ignored for other formats.
        # Corresponds to the JSON property `allowJaggedRows`
        # @return [Boolean]
        attr_accessor :allow_jagged_rows
        alias_method :allow_jagged_rows?, :allow_jagged_rows
      
        # Indicates if BigQuery should allow quoted data sections that contain newline
        # characters in a CSV file. The default value is false.
        # Corresponds to the JSON property `allowQuotedNewlines`
        # @return [Boolean]
        attr_accessor :allow_quoted_newlines
        alias_method :allow_quoted_newlines?, :allow_quoted_newlines
      
        # [Optional] Indicates if we should automatically infer the options and schema
        # for CSV and JSON sources.
        # Corresponds to the JSON property `autodetect`
        # @return [Boolean]
        attr_accessor :autodetect
        alias_method :autodetect?, :autodetect
      
        # [Beta] Clustering specification for the destination table. Must be specified
        # with time-based partitioning, data in the table will be first partitioned and
        # subsequently clustered.
        # Corresponds to the JSON property `clustering`
        # @return [Google::Apis::BigqueryV2::Clustering]
        attr_accessor :clustering
      
        # [Optional] Specifies whether the job is allowed to create new tables. The
        # following values are supported: CREATE_IF_NEEDED: If the table does not exist,
        # BigQuery creates the table. CREATE_NEVER: The table must already exist. If it
        # does not, a 'notFound' error is returned in the job result. The default value
        # is CREATE_IF_NEEDED. Creation, truncation and append actions occur as one
        # atomic update upon job completion.
        # Corresponds to the JSON property `createDisposition`
        # @return [String]
        attr_accessor :create_disposition
      
        # Custom encryption configuration (e.g., Cloud KMS keys).
        # Corresponds to the JSON property `destinationEncryptionConfiguration`
        # @return [Google::Apis::BigqueryV2::EncryptionConfiguration]
        attr_accessor :destination_encryption_configuration
      
        # [Required] The destination table to load the data into.
        # Corresponds to the JSON property `destinationTable`
        # @return [Google::Apis::BigqueryV2::TableReference]
        attr_accessor :destination_table
      
        # [Beta] [Optional] Properties with which to create the destination table if it
        # is new.
        # Corresponds to the JSON property `destinationTableProperties`
        # @return [Google::Apis::BigqueryV2::DestinationTableProperties]
        attr_accessor :destination_table_properties
      
        # [Optional] The character encoding of the data. The supported values are UTF-8
        # or ISO-8859-1. The default value is UTF-8. BigQuery decodes the data after the
        # raw, binary data has been split using the values of the quote and
        # fieldDelimiter properties.
        # Corresponds to the JSON property `encoding`
        # @return [String]
        attr_accessor :encoding
      
        # [Optional] The separator for fields in a CSV file. The separator can be any
        # ISO-8859-1 single-byte character. To use a character in the range 128-255, you
        # must encode the character as UTF8. BigQuery converts the string to ISO-8859-1
        # encoding, and then uses the first byte of the encoded string to split the data
        # in its raw, binary state. BigQuery also supports the escape sequence "\t" to
        # specify a tab separator. The default value is a comma (',').
        # Corresponds to the JSON property `fieldDelimiter`
        # @return [String]
        attr_accessor :field_delimiter
      
        # [Optional, Trusted Tester] Deprecated, do not use. Please set
        # hivePartitioningOptions instead.
        # Corresponds to the JSON property `hivePartitioningMode`
        # @return [String]
        attr_accessor :hive_partitioning_mode
      
        # [Optional, Trusted Tester] Options to configure hive partitioning support.
        # Corresponds to the JSON property `hivePartitioningOptions`
        # @return [Google::Apis::BigqueryV2::HivePartitioningOptions]
        attr_accessor :hive_partitioning_options
      
        # [Optional] Indicates if BigQuery should allow extra values that are not
        # represented in the table schema. If true, the extra values are ignored. If
        # false, records with extra columns are treated as bad records, and if there are
        # too many bad records, an invalid error is returned in the job result. The
        # default value is false. The sourceFormat property determines what BigQuery
        # treats as an extra value: CSV: Trailing columns JSON: Named values that don't
        # match any column names
        # Corresponds to the JSON property `ignoreUnknownValues`
        # @return [Boolean]
        attr_accessor :ignore_unknown_values
        alias_method :ignore_unknown_values?, :ignore_unknown_values
      
        # [Optional] The maximum number of bad records that BigQuery can ignore when
        # running the job. If the number of bad records exceeds this value, an invalid
        # error is returned in the job result. This is only valid for CSV and JSON. The
        # default value is 0, which requires that all records are valid.
        # Corresponds to the JSON property `maxBadRecords`
        # @return [Fixnum]
        attr_accessor :max_bad_records
      
        # [Optional] Specifies a string that represents a null value in a CSV file. For
        # example, if you specify "\N", BigQuery interprets "\N" as a null value when
        # loading a CSV file. The default value is the empty string. If you set this
        # property to a custom value, BigQuery throws an error if an empty string is
        # present for all data types except for STRING and BYTE. For STRING and BYTE
        # columns, BigQuery interprets the empty string as an empty value.
        # Corresponds to the JSON property `nullMarker`
        # @return [String]
        attr_accessor :null_marker
      
        # If sourceFormat is set to "DATASTORE_BACKUP", indicates which entity
        # properties to load into BigQuery from a Cloud Datastore backup. Property names
        # are case sensitive and must be top-level properties. If no properties are
        # specified, BigQuery loads all properties. If any named property isn't found in
        # the Cloud Datastore backup, an invalid error is returned in the job result.
        # Corresponds to the JSON property `projectionFields`
        # @return [Array<String>]
        attr_accessor :projection_fields
      
        # [Optional] The value that is used to quote data sections in a CSV file.
        # BigQuery converts the string to ISO-8859-1 encoding, and then uses the first
        # byte of the encoded string to split the data in its raw, binary state. The
        # default value is a double-quote ('"'). If your data does not contain quoted
        # sections, set the property value to an empty string. If your data contains
        # quoted newline characters, you must also set the allowQuotedNewlines property
        # to true.
        # Corresponds to the JSON property `quote`
        # @return [String]
        attr_accessor :quote
      
        # [TrustedTester] Range partitioning specification for this table. Only one of
        # timePartitioning and rangePartitioning should be specified.
        # Corresponds to the JSON property `rangePartitioning`
        # @return [Google::Apis::BigqueryV2::RangePartitioning]
        attr_accessor :range_partitioning
      
        # [Optional] The schema for the destination table. The schema can be omitted if
        # the destination table already exists, or if you're loading data from Google
        # Cloud Datastore.
        # Corresponds to the JSON property `schema`
        # @return [Google::Apis::BigqueryV2::TableSchema]
        attr_accessor :schema
      
        # [Deprecated] The inline schema. For CSV schemas, specify as "Field1:Type1[,
        # Field2:Type2]*". For example, "foo:STRING, bar:INTEGER, baz:FLOAT".
        # Corresponds to the JSON property `schemaInline`
        # @return [String]
        attr_accessor :schema_inline
      
        # [Deprecated] The format of the schemaInline property.
        # Corresponds to the JSON property `schemaInlineFormat`
        # @return [String]
        attr_accessor :schema_inline_format
      
        # Allows the schema of the destination table to be updated as a side effect of
        # the load job if a schema is autodetected or supplied in the job configuration.
        # Schema update options are supported in two cases: when writeDisposition is
        # WRITE_APPEND; when writeDisposition is WRITE_TRUNCATE and the destination
        # table is a partition of a table, specified by partition decorators. For normal
        # tables, WRITE_TRUNCATE will always overwrite the schema. One or more of the
        # following values are specified: ALLOW_FIELD_ADDITION: allow adding a nullable
        # field to the schema. ALLOW_FIELD_RELAXATION: allow relaxing a required field
        # in the original schema to nullable.
        # Corresponds to the JSON property `schemaUpdateOptions`
        # @return [Array<String>]
        attr_accessor :schema_update_options
      
        # [Optional] The number of rows at the top of a CSV file that BigQuery will skip
        # when loading the data. The default value is 0. This property is useful if you
        # have header rows in the file that should be skipped.
        # Corresponds to the JSON property `skipLeadingRows`
        # @return [Fixnum]
        attr_accessor :skip_leading_rows
      
        # [Optional] The format of the data files. For CSV files, specify "CSV". For
        # datastore backups, specify "DATASTORE_BACKUP". For newline-delimited JSON,
        # specify "NEWLINE_DELIMITED_JSON". For Avro, specify "AVRO". For parquet,
        # specify "PARQUET". For orc, specify "ORC". The default value is CSV.
        # Corresponds to the JSON property `sourceFormat`
        # @return [String]
        attr_accessor :source_format
      
        # [Required] The fully-qualified URIs that point to your data in Google Cloud.
        # For Google Cloud Storage URIs: Each URI can contain one '*' wildcard character
        # and it must come after the 'bucket' name. Size limits related to load jobs
        # apply to external data sources. For Google Cloud Bigtable URIs: Exactly one
        # URI can be specified and it has be a fully specified and valid HTTPS URL for a
        # Google Cloud Bigtable table. For Google Cloud Datastore backups: Exactly one
        # URI can be specified. Also, the '*' wildcard character is not allowed.
        # Corresponds to the JSON property `sourceUris`
        # @return [Array<String>]
        attr_accessor :source_uris
      
        # Time-based partitioning specification for the destination table. Only one of
        # timePartitioning and rangePartitioning should be specified.
        # Corresponds to the JSON property `timePartitioning`
        # @return [Google::Apis::BigqueryV2::TimePartitioning]
        attr_accessor :time_partitioning
      
        # [Optional] If sourceFormat is set to "AVRO", indicates whether to enable
        # interpreting logical types into their corresponding types (ie. TIMESTAMP),
        # instead of only using their raw types (ie. INTEGER).
        # Corresponds to the JSON property `useAvroLogicalTypes`
        # @return [Boolean]
        attr_accessor :use_avro_logical_types
        alias_method :use_avro_logical_types?, :use_avro_logical_types
      
        # [Optional] Specifies the action that occurs if the destination table already
        # exists. The following values are supported: WRITE_TRUNCATE: If the table
        # already exists, BigQuery overwrites the table data. WRITE_APPEND: If the table
        # already exists, BigQuery appends the data to the table. WRITE_EMPTY: If the
        # table already exists and contains data, a 'duplicate' error is returned in the
        # job result. The default value is WRITE_APPEND. Each action is atomic and only
        # occurs if BigQuery is able to complete the job successfully. Creation,
        # truncation and append actions occur as one atomic update upon job completion.
        # Corresponds to the JSON property `writeDisposition`
        # @return [String]
        attr_accessor :write_disposition
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @allow_jagged_rows = args[:allow_jagged_rows] if args.key?(:allow_jagged_rows)
          @allow_quoted_newlines = args[:allow_quoted_newlines] if args.key?(:allow_quoted_newlines)
          @autodetect = args[:autodetect] if args.key?(:autodetect)
          @clustering = args[:clustering] if args.key?(:clustering)
          @create_disposition = args[:create_disposition] if args.key?(:create_disposition)
          @destination_encryption_configuration = args[:destination_encryption_configuration] if args.key?(:destination_encryption_configuration)
          @destination_table = args[:destination_table] if args.key?(:destination_table)
          @destination_table_properties = args[:destination_table_properties] if args.key?(:destination_table_properties)
          @encoding = args[:encoding] if args.key?(:encoding)
          @field_delimiter = args[:field_delimiter] if args.key?(:field_delimiter)
          @hive_partitioning_mode = args[:hive_partitioning_mode] if args.key?(:hive_partitioning_mode)
          @hive_partitioning_options = args[:hive_partitioning_options] if args.key?(:hive_partitioning_options)
          @ignore_unknown_values = args[:ignore_unknown_values] if args.key?(:ignore_unknown_values)
          @max_bad_records = args[:max_bad_records] if args.key?(:max_bad_records)
          @null_marker = args[:null_marker] if args.key?(:null_marker)
          @projection_fields = args[:projection_fields] if args.key?(:projection_fields)
          @quote = args[:quote] if args.key?(:quote)
          @range_partitioning = args[:range_partitioning] if args.key?(:range_partitioning)
          @schema = args[:schema] if args.key?(:schema)
          @schema_inline = args[:schema_inline] if args.key?(:schema_inline)
          @schema_inline_format = args[:schema_inline_format] if args.key?(:schema_inline_format)
          @schema_update_options = args[:schema_update_options] if args.key?(:schema_update_options)
          @skip_leading_rows = args[:skip_leading_rows] if args.key?(:skip_leading_rows)
          @source_format = args[:source_format] if args.key?(:source_format)
          @source_uris = args[:source_uris] if args.key?(:source_uris)
          @time_partitioning = args[:time_partitioning] if args.key?(:time_partitioning)
          @use_avro_logical_types = args[:use_avro_logical_types] if args.key?(:use_avro_logical_types)
          @write_disposition = args[:write_disposition] if args.key?(:write_disposition)
        end
      end
      
      # 
      class JobConfigurationQuery
        include Google::Apis::Core::Hashable
      
        # [Optional] If true and query uses legacy SQL dialect, allows the query to
        # produce arbitrarily large result tables at a slight cost in performance.
        # Requires destinationTable to be set. For standard SQL queries, this flag is
        # ignored and large results are always allowed. However, you must still set
        # destinationTable when result size exceeds the allowed maximum response size.
        # Corresponds to the JSON property `allowLargeResults`
        # @return [Boolean]
        attr_accessor :allow_large_results
        alias_method :allow_large_results?, :allow_large_results
      
        # [Beta] Clustering specification for the destination table. Must be specified
        # with time-based partitioning, data in the table will be first partitioned and
        # subsequently clustered.
        # Corresponds to the JSON property `clustering`
        # @return [Google::Apis::BigqueryV2::Clustering]
        attr_accessor :clustering
      
        # [Optional] Specifies whether the job is allowed to create new tables. The
        # following values are supported: CREATE_IF_NEEDED: If the table does not exist,
        # BigQuery creates the table. CREATE_NEVER: The table must already exist. If it
        # does not, a 'notFound' error is returned in the job result. The default value
        # is CREATE_IF_NEEDED. Creation, truncation and append actions occur as one
        # atomic update upon job completion.
        # Corresponds to the JSON property `createDisposition`
        # @return [String]
        attr_accessor :create_disposition
      
        # [Optional] Specifies the default dataset to use for unqualified table names in
        # the query. Note that this does not alter behavior of unqualified dataset names.
        # Corresponds to the JSON property `defaultDataset`
        # @return [Google::Apis::BigqueryV2::DatasetReference]
        attr_accessor :default_dataset
      
        # Custom encryption configuration (e.g., Cloud KMS keys).
        # Corresponds to the JSON property `destinationEncryptionConfiguration`
        # @return [Google::Apis::BigqueryV2::EncryptionConfiguration]
        attr_accessor :destination_encryption_configuration
      
        # [Optional] Describes the table where the query results should be stored. If
        # not present, a new table will be created to store the results. This property
        # must be set for large results that exceed the maximum response size.
        # Corresponds to the JSON property `destinationTable`
        # @return [Google::Apis::BigqueryV2::TableReference]
        attr_accessor :destination_table
      
        # [Optional] If true and query uses legacy SQL dialect, flattens all nested and
        # repeated fields in the query results. allowLargeResults must be true if this
        # is set to false. For standard SQL queries, this flag is ignored and results
        # are never flattened.
        # Corresponds to the JSON property `flattenResults`
        # @return [Boolean]
        attr_accessor :flatten_results
        alias_method :flatten_results?, :flatten_results
      
        # [Optional] Limits the billing tier for this job. Queries that have resource
        # usage beyond this tier will fail (without incurring a charge). If unspecified,
        # this will be set to your project default.
        # Corresponds to the JSON property `maximumBillingTier`
        # @return [Fixnum]
        attr_accessor :maximum_billing_tier
      
        # [Optional] Limits the bytes billed for this job. Queries that will have bytes
        # billed beyond this limit will fail (without incurring a charge). If
        # unspecified, this will be set to your project default.
        # Corresponds to the JSON property `maximumBytesBilled`
        # @return [Fixnum]
        attr_accessor :maximum_bytes_billed
      
        # Standard SQL only. Set to POSITIONAL to use positional (?) query parameters or
        # to NAMED to use named (@myparam) query parameters in this query.
        # Corresponds to the JSON property `parameterMode`
        # @return [String]
        attr_accessor :parameter_mode
      
        # [Deprecated] This property is deprecated.
        # Corresponds to the JSON property `preserveNulls`
        # @return [Boolean]
        attr_accessor :preserve_nulls
        alias_method :preserve_nulls?, :preserve_nulls
      
        # [Optional] Specifies a priority for the query. Possible values include
        # INTERACTIVE and BATCH. The default value is INTERACTIVE.
        # Corresponds to the JSON property `priority`
        # @return [String]
        attr_accessor :priority
      
        # [Required] SQL query text to execute. The useLegacySql field can be used to
        # indicate whether the query uses legacy SQL or standard SQL.
        # Corresponds to the JSON property `query`
        # @return [String]
        attr_accessor :query
      
        # Query parameters for standard SQL queries.
        # Corresponds to the JSON property `queryParameters`
        # @return [Array<Google::Apis::BigqueryV2::QueryParameter>]
        attr_accessor :query_parameters
      
        # [TrustedTester] Range partitioning specification for this table. Only one of
        # timePartitioning and rangePartitioning should be specified.
        # Corresponds to the JSON property `rangePartitioning`
        # @return [Google::Apis::BigqueryV2::RangePartitioning]
        attr_accessor :range_partitioning
      
        # Allows the schema of the destination table to be updated as a side effect of
        # the query job. Schema update options are supported in two cases: when
        # writeDisposition is WRITE_APPEND; when writeDisposition is WRITE_TRUNCATE and
        # the destination table is a partition of a table, specified by partition
        # decorators. For normal tables, WRITE_TRUNCATE will always overwrite the schema.
        # One or more of the following values are specified: ALLOW_FIELD_ADDITION:
        # allow adding a nullable field to the schema. ALLOW_FIELD_RELAXATION: allow
        # relaxing a required field in the original schema to nullable.
        # Corresponds to the JSON property `schemaUpdateOptions`
        # @return [Array<String>]
        attr_accessor :schema_update_options
      
        # [Optional] If querying an external data source outside of BigQuery, describes
        # the data format, location and other properties of the data source. By defining
        # these properties, the data source can then be queried as if it were a standard
        # BigQuery table.
        # Corresponds to the JSON property `tableDefinitions`
        # @return [Hash<String,Google::Apis::BigqueryV2::ExternalDataConfiguration>]
        attr_accessor :table_definitions
      
        # Time-based partitioning specification for the destination table. Only one of
        # timePartitioning and rangePartitioning should be specified.
        # Corresponds to the JSON property `timePartitioning`
        # @return [Google::Apis::BigqueryV2::TimePartitioning]
        attr_accessor :time_partitioning
      
        # Specifies whether to use BigQuery's legacy SQL dialect for this query. The
        # default value is true. If set to false, the query will use BigQuery's standard
        # SQL: https://cloud.google.com/bigquery/sql-reference/ When useLegacySql is set
        # to false, the value of flattenResults is ignored; query will be run as if
        # flattenResults is false.
        # Corresponds to the JSON property `useLegacySql`
        # @return [Boolean]
        attr_accessor :use_legacy_sql
        alias_method :use_legacy_sql?, :use_legacy_sql
      
        # [Optional] Whether to look for the result in the query cache. The query cache
        # is a best-effort cache that will be flushed whenever tables in the query are
        # modified. Moreover, the query cache is only available when a query does not
        # have a destination table specified. The default value is true.
        # Corresponds to the JSON property `useQueryCache`
        # @return [Boolean]
        attr_accessor :use_query_cache
        alias_method :use_query_cache?, :use_query_cache
      
        # Describes user-defined function resources used in the query.
        # Corresponds to the JSON property `userDefinedFunctionResources`
        # @return [Array<Google::Apis::BigqueryV2::UserDefinedFunctionResource>]
        attr_accessor :user_defined_function_resources
      
        # [Optional] Specifies the action that occurs if the destination table already
        # exists. The following values are supported: WRITE_TRUNCATE: If the table
        # already exists, BigQuery overwrites the table data and uses the schema from
        # the query result. WRITE_APPEND: If the table already exists, BigQuery appends
        # the data to the table. WRITE_EMPTY: If the table already exists and contains
        # data, a 'duplicate' error is returned in the job result. The default value is
        # WRITE_EMPTY. Each action is atomic and only occurs if BigQuery is able to
        # complete the job successfully. Creation, truncation and append actions occur
        # as one atomic update upon job completion.
        # Corresponds to the JSON property `writeDisposition`
        # @return [String]
        attr_accessor :write_disposition
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @allow_large_results = args[:allow_large_results] if args.key?(:allow_large_results)
          @clustering = args[:clustering] if args.key?(:clustering)
          @create_disposition = args[:create_disposition] if args.key?(:create_disposition)
          @default_dataset = args[:default_dataset] if args.key?(:default_dataset)
          @destination_encryption_configuration = args[:destination_encryption_configuration] if args.key?(:destination_encryption_configuration)
          @destination_table = args[:destination_table] if args.key?(:destination_table)
          @flatten_results = args[:flatten_results] if args.key?(:flatten_results)
          @maximum_billing_tier = args[:maximum_billing_tier] if args.key?(:maximum_billing_tier)
          @maximum_bytes_billed = args[:maximum_bytes_billed] if args.key?(:maximum_bytes_billed)
          @parameter_mode = args[:parameter_mode] if args.key?(:parameter_mode)
          @preserve_nulls = args[:preserve_nulls] if args.key?(:preserve_nulls)
          @priority = args[:priority] if args.key?(:priority)
          @query = args[:query] if args.key?(:query)
          @query_parameters = args[:query_parameters] if args.key?(:query_parameters)
          @range_partitioning = args[:range_partitioning] if args.key?(:range_partitioning)
          @schema_update_options = args[:schema_update_options] if args.key?(:schema_update_options)
          @table_definitions = args[:table_definitions] if args.key?(:table_definitions)
          @time_partitioning = args[:time_partitioning] if args.key?(:time_partitioning)
          @use_legacy_sql = args[:use_legacy_sql] if args.key?(:use_legacy_sql)
          @use_query_cache = args[:use_query_cache] if args.key?(:use_query_cache)
          @user_defined_function_resources = args[:user_defined_function_resources] if args.key?(:user_defined_function_resources)
          @write_disposition = args[:write_disposition] if args.key?(:write_disposition)
        end
      end
      
      # 
      class JobConfigurationTableCopy
        include Google::Apis::Core::Hashable
      
        # [Optional] Specifies whether the job is allowed to create new tables. The
        # following values are supported: CREATE_IF_NEEDED: If the table does not exist,
        # BigQuery creates the table. CREATE_NEVER: The table must already exist. If it
        # does not, a 'notFound' error is returned in the job result. The default value
        # is CREATE_IF_NEEDED. Creation, truncation and append actions occur as one
        # atomic update upon job completion.
        # Corresponds to the JSON property `createDisposition`
        # @return [String]
        attr_accessor :create_disposition
      
        # Custom encryption configuration (e.g., Cloud KMS keys).
        # Corresponds to the JSON property `destinationEncryptionConfiguration`
        # @return [Google::Apis::BigqueryV2::EncryptionConfiguration]
        attr_accessor :destination_encryption_configuration
      
        # [Required] The destination table
        # Corresponds to the JSON property `destinationTable`
        # @return [Google::Apis::BigqueryV2::TableReference]
        attr_accessor :destination_table
      
        # [Pick one] Source table to copy.
        # Corresponds to the JSON property `sourceTable`
        # @return [Google::Apis::BigqueryV2::TableReference]
        attr_accessor :source_table
      
        # [Pick one] Source tables to copy.
        # Corresponds to the JSON property `sourceTables`
        # @return [Array<Google::Apis::BigqueryV2::TableReference>]
        attr_accessor :source_tables
      
        # [Optional] Specifies the action that occurs if the destination table already
        # exists. The following values are supported: WRITE_TRUNCATE: If the table
        # already exists, BigQuery overwrites the table data. WRITE_APPEND: If the table
        # already exists, BigQuery appends the data to the table. WRITE_EMPTY: If the
        # table already exists and contains data, a 'duplicate' error is returned in the
        # job result. The default value is WRITE_EMPTY. Each action is atomic and only
        # occurs if BigQuery is able to complete the job successfully. Creation,
        # truncation and append actions occur as one atomic update upon job completion.
        # Corresponds to the JSON property `writeDisposition`
        # @return [String]
        attr_accessor :write_disposition
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_disposition = args[:create_disposition] if args.key?(:create_disposition)
          @destination_encryption_configuration = args[:destination_encryption_configuration] if args.key?(:destination_encryption_configuration)
          @destination_table = args[:destination_table] if args.key?(:destination_table)
          @source_table = args[:source_table] if args.key?(:source_table)
          @source_tables = args[:source_tables] if args.key?(:source_tables)
          @write_disposition = args[:write_disposition] if args.key?(:write_disposition)
        end
      end
      
      # 
      class JobList
        include Google::Apis::Core::Hashable
      
        # A hash of this page of results.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # List of jobs that were requested.
        # Corresponds to the JSON property `jobs`
        # @return [Array<Google::Apis::BigqueryV2::JobList::Job>]
        attr_accessor :jobs
      
        # The resource type of the response.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # A token to request the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @jobs = args[:jobs] if args.key?(:jobs)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
        
        # 
        class Job
          include Google::Apis::Core::Hashable
        
          # [Full-projection-only] Specifies the job configuration.
          # Corresponds to the JSON property `configuration`
          # @return [Google::Apis::BigqueryV2::JobConfiguration]
          attr_accessor :configuration
        
          # A result object that will be present only if the job has failed.
          # Corresponds to the JSON property `errorResult`
          # @return [Google::Apis::BigqueryV2::ErrorProto]
          attr_accessor :error_result
        
          # Unique opaque ID of the job.
          # Corresponds to the JSON property `id`
          # @return [String]
          attr_accessor :id
        
          # Job reference uniquely identifying the job.
          # Corresponds to the JSON property `jobReference`
          # @return [Google::Apis::BigqueryV2::JobReference]
          attr_accessor :job_reference
        
          # The resource type.
          # Corresponds to the JSON property `kind`
          # @return [String]
          attr_accessor :kind
        
          # Running state of the job. When the state is DONE, errorResult can be checked
          # to determine whether the job succeeded or failed.
          # Corresponds to the JSON property `state`
          # @return [String]
          attr_accessor :state
        
          # [Output-only] Information about the job, including starting time and ending
          # time of the job.
          # Corresponds to the JSON property `statistics`
          # @return [Google::Apis::BigqueryV2::JobStatistics]
          attr_accessor :statistics
        
          # [Full-projection-only] Describes the state of the job.
          # Corresponds to the JSON property `status`
          # @return [Google::Apis::BigqueryV2::JobStatus]
          attr_accessor :status
        
          # [Full-projection-only] Email address of the user who ran the job.
          # Corresponds to the JSON property `user_email`
          # @return [String]
          attr_accessor :user_email
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @configuration = args[:configuration] if args.key?(:configuration)
            @error_result = args[:error_result] if args.key?(:error_result)
            @id = args[:id] if args.key?(:id)
            @job_reference = args[:job_reference] if args.key?(:job_reference)
            @kind = args[:kind] if args.key?(:kind)
            @state = args[:state] if args.key?(:state)
            @statistics = args[:statistics] if args.key?(:statistics)
            @status = args[:status] if args.key?(:status)
            @user_email = args[:user_email] if args.key?(:user_email)
          end
        end
      end
      
      # 
      class JobReference
        include Google::Apis::Core::Hashable
      
        # [Required] The ID of the job. The ID must contain only letters (a-z, A-Z),
        # numbers (0-9), underscores (_), or dashes (-). The maximum length is 1,024
        # characters.
        # Corresponds to the JSON property `jobId`
        # @return [String]
        attr_accessor :job_id
      
        # The geographic location of the job. See details at https://cloud.google.com/
        # bigquery/docs/locations#specifying_your_location.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # [Required] The ID of the project containing this job.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @job_id = args[:job_id] if args.key?(:job_id)
          @location = args[:location] if args.key?(:location)
          @project_id = args[:project_id] if args.key?(:project_id)
        end
      end
      
      # 
      class JobStatistics
        include Google::Apis::Core::Hashable
      
        # [TrustedTester] [Output-only] Job progress (0.0 -> 1.0) for LOAD and EXTRACT
        # jobs.
        # Corresponds to the JSON property `completionRatio`
        # @return [Float]
        attr_accessor :completion_ratio
      
        # [Output-only] Creation time of this job, in milliseconds since the epoch. This
        # field will be present on all jobs.
        # Corresponds to the JSON property `creationTime`
        # @return [Fixnum]
        attr_accessor :creation_time
      
        # [Output-only] End time of this job, in milliseconds since the epoch. This
        # field will be present whenever a job is in the DONE state.
        # Corresponds to the JSON property `endTime`
        # @return [Fixnum]
        attr_accessor :end_time
      
        # [Output-only] Statistics for an extract job.
        # Corresponds to the JSON property `extract`
        # @return [Google::Apis::BigqueryV2::JobStatistics4]
        attr_accessor :extract
      
        # [Output-only] Statistics for a load job.
        # Corresponds to the JSON property `load`
        # @return [Google::Apis::BigqueryV2::JobStatistics3]
        attr_accessor :load
      
        # [Output-only] Number of child jobs executed.
        # Corresponds to the JSON property `numChildJobs`
        # @return [Fixnum]
        attr_accessor :num_child_jobs
      
        # [Output-only] If this is a child job, the id of the parent.
        # Corresponds to the JSON property `parentJobId`
        # @return [String]
        attr_accessor :parent_job_id
      
        # [Output-only] Statistics for a query job.
        # Corresponds to the JSON property `query`
        # @return [Google::Apis::BigqueryV2::JobStatistics2]
        attr_accessor :query
      
        # [Output-only] Quotas which delayed this job's start time.
        # Corresponds to the JSON property `quotaDeferments`
        # @return [Array<String>]
        attr_accessor :quota_deferments
      
        # [Output-only] Job resource usage breakdown by reservation.
        # Corresponds to the JSON property `reservationUsage`
        # @return [Array<Google::Apis::BigqueryV2::JobStatistics::ReservationUsage>]
        attr_accessor :reservation_usage
      
        # [Output-only] Name of the primary reservation assigned to this job. Note that
        # this could be different than reservations reported in the reservation usage
        # field if parent reservations were used to execute this job.
        # Corresponds to the JSON property `reservation_id`
        # @return [String]
        attr_accessor :reservation_id
      
        # [Output-only] Statistics for a child job of a script.
        # Corresponds to the JSON property `scriptStatistics`
        # @return [Google::Apis::BigqueryV2::ScriptStatistics]
        attr_accessor :script_statistics
      
        # [Output-only] Start time of this job, in milliseconds since the epoch. This
        # field will be present when the job transitions from the PENDING state to
        # either RUNNING or DONE.
        # Corresponds to the JSON property `startTime`
        # @return [Fixnum]
        attr_accessor :start_time
      
        # [Output-only] [Deprecated] Use the bytes processed in the query statistics
        # instead.
        # Corresponds to the JSON property `totalBytesProcessed`
        # @return [Fixnum]
        attr_accessor :total_bytes_processed
      
        # [Output-only] Slot-milliseconds for the job.
        # Corresponds to the JSON property `totalSlotMs`
        # @return [Fixnum]
        attr_accessor :total_slot_ms
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @completion_ratio = args[:completion_ratio] if args.key?(:completion_ratio)
          @creation_time = args[:creation_time] if args.key?(:creation_time)
          @end_time = args[:end_time] if args.key?(:end_time)
          @extract = args[:extract] if args.key?(:extract)
          @load = args[:load] if args.key?(:load)
          @num_child_jobs = args[:num_child_jobs] if args.key?(:num_child_jobs)
          @parent_job_id = args[:parent_job_id] if args.key?(:parent_job_id)
          @query = args[:query] if args.key?(:query)
          @quota_deferments = args[:quota_deferments] if args.key?(:quota_deferments)
          @reservation_usage = args[:reservation_usage] if args.key?(:reservation_usage)
          @reservation_id = args[:reservation_id] if args.key?(:reservation_id)
          @script_statistics = args[:script_statistics] if args.key?(:script_statistics)
          @start_time = args[:start_time] if args.key?(:start_time)
          @total_bytes_processed = args[:total_bytes_processed] if args.key?(:total_bytes_processed)
          @total_slot_ms = args[:total_slot_ms] if args.key?(:total_slot_ms)
        end
        
        # 
        class ReservationUsage
          include Google::Apis::Core::Hashable
        
          # [Output-only] Reservation name or "unreserved" for on-demand resources usage.
          # Corresponds to the JSON property `name`
          # @return [String]
          attr_accessor :name
        
          # [Output-only] Slot-milliseconds the job spent in the given reservation.
          # Corresponds to the JSON property `slotMs`
          # @return [Fixnum]
          attr_accessor :slot_ms
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @name = args[:name] if args.key?(:name)
            @slot_ms = args[:slot_ms] if args.key?(:slot_ms)
          end
        end
      end
      
      # 
      class JobStatistics2
        include Google::Apis::Core::Hashable
      
        # [Output-only] Billing tier for the job.
        # Corresponds to the JSON property `billingTier`
        # @return [Fixnum]
        attr_accessor :billing_tier
      
        # [Output-only] Whether the query result was fetched from the query cache.
        # Corresponds to the JSON property `cacheHit`
        # @return [Boolean]
        attr_accessor :cache_hit
        alias_method :cache_hit?, :cache_hit
      
        # The DDL operation performed, possibly dependent on the pre-existence of the
        # DDL target. Possible values (new values might be added in the future): "CREATE"
        # : The query created the DDL target. "SKIP": No-op. Example cases: the query is
        # CREATE TABLE IF NOT EXISTS while the table already exists, or the query is
        # DROP TABLE IF EXISTS while the table does not exist. "REPLACE": The query
        # replaced the DDL target. Example case: the query is CREATE OR REPLACE TABLE,
        # and the table already exists. "DROP": The query deleted the DDL target.
        # Corresponds to the JSON property `ddlOperationPerformed`
        # @return [String]
        attr_accessor :ddl_operation_performed
      
        # The DDL target routine. Present only for CREATE/DROP FUNCTION/PROCEDURE
        # queries.
        # Corresponds to the JSON property `ddlTargetRoutine`
        # @return [Google::Apis::BigqueryV2::RoutineReference]
        attr_accessor :ddl_target_routine
      
        # The DDL target table. Present only for CREATE/DROP TABLE/VIEW queries.
        # Corresponds to the JSON property `ddlTargetTable`
        # @return [Google::Apis::BigqueryV2::TableReference]
        attr_accessor :ddl_target_table
      
        # [Output-only] The original estimate of bytes processed for the job.
        # Corresponds to the JSON property `estimatedBytesProcessed`
        # @return [Fixnum]
        attr_accessor :estimated_bytes_processed
      
        # [Output-only, Beta] Information about create model query job progress.
        # Corresponds to the JSON property `modelTraining`
        # @return [Google::Apis::BigqueryV2::BigQueryModelTraining]
        attr_accessor :model_training
      
        # [Output-only, Beta] Deprecated; do not use.
        # Corresponds to the JSON property `modelTrainingCurrentIteration`
        # @return [Fixnum]
        attr_accessor :model_training_current_iteration
      
        # [Output-only, Beta] Deprecated; do not use.
        # Corresponds to the JSON property `modelTrainingExpectedTotalIteration`
        # @return [Fixnum]
        attr_accessor :model_training_expected_total_iteration
      
        # [Output-only] The number of rows affected by a DML statement. Present only for
        # DML statements INSERT, UPDATE or DELETE.
        # Corresponds to the JSON property `numDmlAffectedRows`
        # @return [Fixnum]
        attr_accessor :num_dml_affected_rows
      
        # [Output-only] Describes execution plan for the query.
        # Corresponds to the JSON property `queryPlan`
        # @return [Array<Google::Apis::BigqueryV2::ExplainQueryStage>]
        attr_accessor :query_plan
      
        # [Output-only] Referenced routines (persistent user-defined functions and
        # stored procedures) for the job.
        # Corresponds to the JSON property `referencedRoutines`
        # @return [Array<Google::Apis::BigqueryV2::RoutineReference>]
        attr_accessor :referenced_routines
      
        # [Output-only] Referenced tables for the job. Queries that reference more than
        # 50 tables will not have a complete list.
        # Corresponds to the JSON property `referencedTables`
        # @return [Array<Google::Apis::BigqueryV2::TableReference>]
        attr_accessor :referenced_tables
      
        # [Output-only] Job resource usage breakdown by reservation.
        # Corresponds to the JSON property `reservationUsage`
        # @return [Array<Google::Apis::BigqueryV2::JobStatistics2::ReservationUsage>]
        attr_accessor :reservation_usage
      
        # [Output-only] The schema of the results. Present only for successful dry run
        # of non-legacy SQL queries.
        # Corresponds to the JSON property `schema`
        # @return [Google::Apis::BigqueryV2::TableSchema]
        attr_accessor :schema
      
        # The type of query statement, if valid. Possible values (new values might be
        # added in the future): "SELECT": SELECT query. "INSERT": INSERT query; see
        # https://cloud.google.com/bigquery/docs/reference/standard-sql/data-
        # manipulation-language. "UPDATE": UPDATE query; see https://cloud.google.com/
        # bigquery/docs/reference/standard-sql/data-manipulation-language. "DELETE":
        # DELETE query; see https://cloud.google.com/bigquery/docs/reference/standard-
        # sql/data-manipulation-language. "MERGE": MERGE query; see https://cloud.google.
        # com/bigquery/docs/reference/standard-sql/data-manipulation-language. "
        # ALTER_TABLE": ALTER TABLE query. "ALTER_VIEW": ALTER VIEW query. "ASSERT":
        # ASSERT condition AS 'description'. "CREATE_FUNCTION": CREATE FUNCTION query. "
        # CREATE_MODEL": CREATE [OR REPLACE] MODEL ... AS SELECT ... . "CREATE_PROCEDURE"
        # : CREATE PROCEDURE query. "CREATE_TABLE": CREATE [OR REPLACE] TABLE without AS
        # SELECT. "CREATE_TABLE_AS_SELECT": CREATE [OR REPLACE] TABLE ... AS SELECT ... .
        # "CREATE_VIEW": CREATE [OR REPLACE] VIEW ... AS SELECT ... . "DROP_FUNCTION" :
        # DROP FUNCTION query. "DROP_PROCEDURE": DROP PROCEDURE query. "DROP_TABLE":
        # DROP TABLE query. "DROP_VIEW": DROP VIEW query.
        # Corresponds to the JSON property `statementType`
        # @return [String]
        attr_accessor :statement_type
      
        # [Output-only] [Beta] Describes a timeline of job execution.
        # Corresponds to the JSON property `timeline`
        # @return [Array<Google::Apis::BigqueryV2::QueryTimelineSample>]
        attr_accessor :timeline
      
        # [Output-only] Total bytes billed for the job.
        # Corresponds to the JSON property `totalBytesBilled`
        # @return [Fixnum]
        attr_accessor :total_bytes_billed
      
        # [Output-only] Total bytes processed for the job.
        # Corresponds to the JSON property `totalBytesProcessed`
        # @return [Fixnum]
        attr_accessor :total_bytes_processed
      
        # [Output-only] For dry-run jobs, totalBytesProcessed is an estimate and this
        # field specifies the accuracy of the estimate. Possible values can be: UNKNOWN:
        # accuracy of the estimate is unknown. PRECISE: estimate is precise. LOWER_BOUND:
        # estimate is lower bound of what the query would cost. UPPER_BOUND: estimate
        # is upper bound of what the query would cost.
        # Corresponds to the JSON property `totalBytesProcessedAccuracy`
        # @return [String]
        attr_accessor :total_bytes_processed_accuracy
      
        # [Output-only] Total number of partitions processed from all partitioned tables
        # referenced in the job.
        # Corresponds to the JSON property `totalPartitionsProcessed`
        # @return [Fixnum]
        attr_accessor :total_partitions_processed
      
        # [Output-only] Slot-milliseconds for the job.
        # Corresponds to the JSON property `totalSlotMs`
        # @return [Fixnum]
        attr_accessor :total_slot_ms
      
        # Standard SQL only: list of undeclared query parameters detected during a dry
        # run validation.
        # Corresponds to the JSON property `undeclaredQueryParameters`
        # @return [Array<Google::Apis::BigqueryV2::QueryParameter>]
        attr_accessor :undeclared_query_parameters
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @billing_tier = args[:billing_tier] if args.key?(:billing_tier)
          @cache_hit = args[:cache_hit] if args.key?(:cache_hit)
          @ddl_operation_performed = args[:ddl_operation_performed] if args.key?(:ddl_operation_performed)
          @ddl_target_routine = args[:ddl_target_routine] if args.key?(:ddl_target_routine)
          @ddl_target_table = args[:ddl_target_table] if args.key?(:ddl_target_table)
          @estimated_bytes_processed = args[:estimated_bytes_processed] if args.key?(:estimated_bytes_processed)
          @model_training = args[:model_training] if args.key?(:model_training)
          @model_training_current_iteration = args[:model_training_current_iteration] if args.key?(:model_training_current_iteration)
          @model_training_expected_total_iteration = args[:model_training_expected_total_iteration] if args.key?(:model_training_expected_total_iteration)
          @num_dml_affected_rows = args[:num_dml_affected_rows] if args.key?(:num_dml_affected_rows)
          @query_plan = args[:query_plan] if args.key?(:query_plan)
          @referenced_routines = args[:referenced_routines] if args.key?(:referenced_routines)
          @referenced_tables = args[:referenced_tables] if args.key?(:referenced_tables)
          @reservation_usage = args[:reservation_usage] if args.key?(:reservation_usage)
          @schema = args[:schema] if args.key?(:schema)
          @statement_type = args[:statement_type] if args.key?(:statement_type)
          @timeline = args[:timeline] if args.key?(:timeline)
          @total_bytes_billed = args[:total_bytes_billed] if args.key?(:total_bytes_billed)
          @total_bytes_processed = args[:total_bytes_processed] if args.key?(:total_bytes_processed)
          @total_bytes_processed_accuracy = args[:total_bytes_processed_accuracy] if args.key?(:total_bytes_processed_accuracy)
          @total_partitions_processed = args[:total_partitions_processed] if args.key?(:total_partitions_processed)
          @total_slot_ms = args[:total_slot_ms] if args.key?(:total_slot_ms)
          @undeclared_query_parameters = args[:undeclared_query_parameters] if args.key?(:undeclared_query_parameters)
        end
        
        # 
        class ReservationUsage
          include Google::Apis::Core::Hashable
        
          # [Output-only] Reservation name or "unreserved" for on-demand resources usage.
          # Corresponds to the JSON property `name`
          # @return [String]
          attr_accessor :name
        
          # [Output-only] Slot-milliseconds the job spent in the given reservation.
          # Corresponds to the JSON property `slotMs`
          # @return [Fixnum]
          attr_accessor :slot_ms
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @name = args[:name] if args.key?(:name)
            @slot_ms = args[:slot_ms] if args.key?(:slot_ms)
          end
        end
      end
      
      # 
      class JobStatistics3
        include Google::Apis::Core::Hashable
      
        # [Output-only] The number of bad records encountered. Note that if the job has
        # failed because of more bad records encountered than the maximum allowed in the
        # load job configuration, then this number can be less than the total number of
        # bad records present in the input data.
        # Corresponds to the JSON property `badRecords`
        # @return [Fixnum]
        attr_accessor :bad_records
      
        # [Output-only] Number of bytes of source data in a load job.
        # Corresponds to the JSON property `inputFileBytes`
        # @return [Fixnum]
        attr_accessor :input_file_bytes
      
        # [Output-only] Number of source files in a load job.
        # Corresponds to the JSON property `inputFiles`
        # @return [Fixnum]
        attr_accessor :input_files
      
        # [Output-only] Size of the loaded data in bytes. Note that while a load job is
        # in the running state, this value may change.
        # Corresponds to the JSON property `outputBytes`
        # @return [Fixnum]
        attr_accessor :output_bytes
      
        # [Output-only] Number of rows imported in a load job. Note that while an import
        # job is in the running state, this value may change.
        # Corresponds to the JSON property `outputRows`
        # @return [Fixnum]
        attr_accessor :output_rows
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bad_records = args[:bad_records] if args.key?(:bad_records)
          @input_file_bytes = args[:input_file_bytes] if args.key?(:input_file_bytes)
          @input_files = args[:input_files] if args.key?(:input_files)
          @output_bytes = args[:output_bytes] if args.key?(:output_bytes)
          @output_rows = args[:output_rows] if args.key?(:output_rows)
        end
      end
      
      # 
      class JobStatistics4
        include Google::Apis::Core::Hashable
      
        # [Output-only] Number of files per destination URI or URI pattern specified in
        # the extract configuration. These values will be in the same order as the URIs
        # specified in the 'destinationUris' field.
        # Corresponds to the JSON property `destinationUriFileCounts`
        # @return [Array<Fixnum>]
        attr_accessor :destination_uri_file_counts
      
        # [Output-only] Number of user bytes extracted into the result. This is the byte
        # count as computed by BigQuery for billing purposes.
        # Corresponds to the JSON property `inputBytes`
        # @return [Fixnum]
        attr_accessor :input_bytes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @destination_uri_file_counts = args[:destination_uri_file_counts] if args.key?(:destination_uri_file_counts)
          @input_bytes = args[:input_bytes] if args.key?(:input_bytes)
        end
      end
      
      # 
      class JobStatus
        include Google::Apis::Core::Hashable
      
        # [Output-only] Final error result of the job. If present, indicates that the
        # job has completed and was unsuccessful.
        # Corresponds to the JSON property `errorResult`
        # @return [Google::Apis::BigqueryV2::ErrorProto]
        attr_accessor :error_result
      
        # [Output-only] The first errors encountered during the running of the job. The
        # final message includes the number of errors that caused the process to stop.
        # Errors here do not necessarily mean that the job has completed or was
        # unsuccessful.
        # Corresponds to the JSON property `errors`
        # @return [Array<Google::Apis::BigqueryV2::ErrorProto>]
        attr_accessor :errors
      
        # [Output-only] Running state of the job.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_result = args[:error_result] if args.key?(:error_result)
          @errors = args[:errors] if args.key?(:errors)
          @state = args[:state] if args.key?(:state)
        end
      end
      
      # 
      class ListModelsResponse
        include Google::Apis::Core::Hashable
      
        # Models in the requested dataset. Only the following fields are populated:
        # model_reference, model_type, creation_time, last_modified_time and
        # labels.
        # Corresponds to the JSON property `models`
        # @return [Array<Google::Apis::BigqueryV2::Model>]
        attr_accessor :models
      
        # A token to request the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @models = args[:models] if args.key?(:models)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # 
      class ListRoutinesResponse
        include Google::Apis::Core::Hashable
      
        # A token to request the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Routines in the requested dataset. Only the following fields are populated:
        # etag, project_id, dataset_id, routine_id, routine_type, creation_time,
        # last_modified_time, language.
        # Corresponds to the JSON property `routines`
        # @return [Array<Google::Apis::BigqueryV2::Routine>]
        attr_accessor :routines
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @routines = args[:routines] if args.key?(:routines)
        end
      end
      
      # BigQuery-specific metadata about a location. This will be set on
      # google.cloud.location.Location.metadata in Cloud Location API
      # responses.
      class LocationMetadata
        include Google::Apis::Core::Hashable
      
        # The legacy BigQuery location ID, e.g. “EU” for the “europe” location.
        # This is for any API consumers that need the legacy “US” and “EU” locations.
        # Corresponds to the JSON property `legacyLocationId`
        # @return [String]
        attr_accessor :legacy_location_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @legacy_location_id = args[:legacy_location_id] if args.key?(:legacy_location_id)
        end
      end
      
      # 
      class MaterializedViewDefinition
        include Google::Apis::Core::Hashable
      
        # [Output-only] [TrustedTester] The time when this materialized view was last
        # modified, in milliseconds since the epoch.
        # Corresponds to the JSON property `lastRefreshTime`
        # @return [Fixnum]
        attr_accessor :last_refresh_time
      
        # [Required] A query whose result is persisted.
        # Corresponds to the JSON property `query`
        # @return [String]
        attr_accessor :query
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @last_refresh_time = args[:last_refresh_time] if args.key?(:last_refresh_time)
          @query = args[:query] if args.key?(:query)
        end
      end
      
      # 
      class Model
        include Google::Apis::Core::Hashable
      
        # Output only. The time when this model was created, in millisecs since the
        # epoch.
        # Corresponds to the JSON property `creationTime`
        # @return [Fixnum]
        attr_accessor :creation_time
      
        # Optional. A user-friendly description of this model.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Custom encryption configuration (e.g., Cloud KMS keys). This shows the
        # encryption configuration of the model data while stored in BigQuery
        # storage.
        # Corresponds to the JSON property `encryptionConfiguration`
        # @return [Google::Apis::BigqueryV2::EncryptionConfiguration]
        attr_accessor :encryption_configuration
      
        # Output only. A hash of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Optional. The time when this model expires, in milliseconds since the epoch.
        # If not present, the model will persist indefinitely. Expired models
        # will be deleted and their storage reclaimed.  The defaultTableExpirationMs
        # property of the encapsulating dataset can be used to set a default
        # expirationTime on newly created models.
        # Corresponds to the JSON property `expirationTime`
        # @return [Fixnum]
        attr_accessor :expiration_time
      
        # Output only. Input feature columns that were used to train this model.
        # Corresponds to the JSON property `featureColumns`
        # @return [Array<Google::Apis::BigqueryV2::StandardSqlField>]
        attr_accessor :feature_columns
      
        # Optional. A descriptive name for this model.
        # Corresponds to the JSON property `friendlyName`
        # @return [String]
        attr_accessor :friendly_name
      
        # Output only. Label columns that were used to train this model.
        # The output of the model will have a "predicted_" prefix to these columns.
        # Corresponds to the JSON property `labelColumns`
        # @return [Array<Google::Apis::BigqueryV2::StandardSqlField>]
        attr_accessor :label_columns
      
        # The labels associated with this model. You can use these to organize
        # and group your models. Label keys and values can be no longer
        # than 63 characters, can only contain lowercase letters, numeric
        # characters, underscores and dashes. International characters are allowed.
        # Label values are optional. Label keys must start with a letter and each
        # label in the list must have a different key.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Output only. The time when this model was last modified, in millisecs since
        # the epoch.
        # Corresponds to the JSON property `lastModifiedTime`
        # @return [Fixnum]
        attr_accessor :last_modified_time
      
        # Output only. The geographic location where the model resides. This value
        # is inherited from the dataset.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # Required. Unique identifier for this model.
        # Corresponds to the JSON property `modelReference`
        # @return [Google::Apis::BigqueryV2::ModelReference]
        attr_accessor :model_reference
      
        # Output only. Type of the model resource.
        # Corresponds to the JSON property `modelType`
        # @return [String]
        attr_accessor :model_type
      
        # Output only. Information for all training runs in increasing order of
        # start_time.
        # Corresponds to the JSON property `trainingRuns`
        # @return [Array<Google::Apis::BigqueryV2::TrainingRun>]
        attr_accessor :training_runs
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @creation_time = args[:creation_time] if args.key?(:creation_time)
          @description = args[:description] if args.key?(:description)
          @encryption_configuration = args[:encryption_configuration] if args.key?(:encryption_configuration)
          @etag = args[:etag] if args.key?(:etag)
          @expiration_time = args[:expiration_time] if args.key?(:expiration_time)
          @feature_columns = args[:feature_columns] if args.key?(:feature_columns)
          @friendly_name = args[:friendly_name] if args.key?(:friendly_name)
          @label_columns = args[:label_columns] if args.key?(:label_columns)
          @labels = args[:labels] if args.key?(:labels)
          @last_modified_time = args[:last_modified_time] if args.key?(:last_modified_time)
          @location = args[:location] if args.key?(:location)
          @model_reference = args[:model_reference] if args.key?(:model_reference)
          @model_type = args[:model_type] if args.key?(:model_type)
          @training_runs = args[:training_runs] if args.key?(:training_runs)
        end
      end
      
      # 
      class ModelDefinition
        include Google::Apis::Core::Hashable
      
        # [Output-only, Beta] Model options used for the first training run. These
        # options are immutable for subsequent training runs. Default values are used
        # for any options not specified in the input query.
        # Corresponds to the JSON property `modelOptions`
        # @return [Google::Apis::BigqueryV2::ModelDefinition::ModelOptions]
        attr_accessor :model_options
      
        # [Output-only, Beta] Information about ml training runs, each training run
        # comprises of multiple iterations and there may be multiple training runs for
        # the model if warm start is used or if a user decides to continue a previously
        # cancelled query.
        # Corresponds to the JSON property `trainingRuns`
        # @return [Array<Google::Apis::BigqueryV2::BqmlTrainingRun>]
        attr_accessor :training_runs
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @model_options = args[:model_options] if args.key?(:model_options)
          @training_runs = args[:training_runs] if args.key?(:training_runs)
        end
        
        # [Output-only, Beta] Model options used for the first training run. These
        # options are immutable for subsequent training runs. Default values are used
        # for any options not specified in the input query.
        class ModelOptions
          include Google::Apis::Core::Hashable
        
          # 
          # Corresponds to the JSON property `labels`
          # @return [Array<String>]
          attr_accessor :labels
        
          # 
          # Corresponds to the JSON property `lossType`
          # @return [String]
          attr_accessor :loss_type
        
          # 
          # Corresponds to the JSON property `modelType`
          # @return [String]
          attr_accessor :model_type
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @labels = args[:labels] if args.key?(:labels)
            @loss_type = args[:loss_type] if args.key?(:loss_type)
            @model_type = args[:model_type] if args.key?(:model_type)
          end
        end
      end
      
      # 
      class ModelReference
        include Google::Apis::Core::Hashable
      
        # [Required] The ID of the dataset containing this model.
        # Corresponds to the JSON property `datasetId`
        # @return [String]
        attr_accessor :dataset_id
      
        # [Required] The ID of the model. The ID must contain only letters (a-z, A-Z),
        # numbers (0-9), or underscores (_). The maximum length is 1,024 characters.
        # Corresponds to the JSON property `modelId`
        # @return [String]
        attr_accessor :model_id
      
        # [Required] The ID of the project containing this model.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dataset_id = args[:dataset_id] if args.key?(:dataset_id)
          @model_id = args[:model_id] if args.key?(:model_id)
          @project_id = args[:project_id] if args.key?(:project_id)
        end
      end
      
      # Evaluation metrics for multi-class classification/classifier models.
      class MultiClassClassificationMetrics
        include Google::Apis::Core::Hashable
      
        # Aggregate metrics for classification/classifier models. For multi-class
        # models, the metrics are either macro-averaged or micro-averaged. When
        # macro-averaged, the metrics are calculated for each label and then an
        # unweighted average is taken of those values. When micro-averaged, the
        # metric is calculated globally by counting the total number of correctly
        # predicted rows.
        # Corresponds to the JSON property `aggregateClassificationMetrics`
        # @return [Google::Apis::BigqueryV2::AggregateClassificationMetrics]
        attr_accessor :aggregate_classification_metrics
      
        # Confusion matrix at different thresholds.
        # Corresponds to the JSON property `confusionMatrixList`
        # @return [Array<Google::Apis::BigqueryV2::ConfusionMatrix>]
        attr_accessor :confusion_matrix_list
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @aggregate_classification_metrics = args[:aggregate_classification_metrics] if args.key?(:aggregate_classification_metrics)
          @confusion_matrix_list = args[:confusion_matrix_list] if args.key?(:confusion_matrix_list)
        end
      end
      
      # 
      class ProjectList
        include Google::Apis::Core::Hashable
      
        # A hash of the page of results
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The type of list.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # A token to request the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Projects to which you have at least READ access.
        # Corresponds to the JSON property `projects`
        # @return [Array<Google::Apis::BigqueryV2::ProjectList::Project>]
        attr_accessor :projects
      
        # The total number of projects in the list.
        # Corresponds to the JSON property `totalItems`
        # @return [Fixnum]
        attr_accessor :total_items
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @projects = args[:projects] if args.key?(:projects)
          @total_items = args[:total_items] if args.key?(:total_items)
        end
        
        # 
        class Project
          include Google::Apis::Core::Hashable
        
          # A descriptive name for this project.
          # Corresponds to the JSON property `friendlyName`
          # @return [String]
          attr_accessor :friendly_name
        
          # An opaque ID of this project.
          # Corresponds to the JSON property `id`
          # @return [String]
          attr_accessor :id
        
          # The resource type.
          # Corresponds to the JSON property `kind`
          # @return [String]
          attr_accessor :kind
        
          # The numeric ID of this project.
          # Corresponds to the JSON property `numericId`
          # @return [Fixnum]
          attr_accessor :numeric_id
        
          # A unique reference to this project.
          # Corresponds to the JSON property `projectReference`
          # @return [Google::Apis::BigqueryV2::ProjectReference]
          attr_accessor :project_reference
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @friendly_name = args[:friendly_name] if args.key?(:friendly_name)
            @id = args[:id] if args.key?(:id)
            @kind = args[:kind] if args.key?(:kind)
            @numeric_id = args[:numeric_id] if args.key?(:numeric_id)
            @project_reference = args[:project_reference] if args.key?(:project_reference)
          end
        end
      end
      
      # 
      class ProjectReference
        include Google::Apis::Core::Hashable
      
        # [Required] ID of the project. Can be either the numeric ID or the assigned ID
        # of the project.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @project_id = args[:project_id] if args.key?(:project_id)
        end
      end
      
      # 
      class QueryParameter
        include Google::Apis::Core::Hashable
      
        # [Optional] If unset, this is a positional parameter. Otherwise, should be
        # unique within a query.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # [Required] The type of this parameter.
        # Corresponds to the JSON property `parameterType`
        # @return [Google::Apis::BigqueryV2::QueryParameterType]
        attr_accessor :parameter_type
      
        # [Required] The value of this parameter.
        # Corresponds to the JSON property `parameterValue`
        # @return [Google::Apis::BigqueryV2::QueryParameterValue]
        attr_accessor :parameter_value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @parameter_type = args[:parameter_type] if args.key?(:parameter_type)
          @parameter_value = args[:parameter_value] if args.key?(:parameter_value)
        end
      end
      
      # 
      class QueryParameterType
        include Google::Apis::Core::Hashable
      
        # [Optional] The type of the array's elements, if this is an array.
        # Corresponds to the JSON property `arrayType`
        # @return [Google::Apis::BigqueryV2::QueryParameterType]
        attr_accessor :array_type
      
        # [Optional] The types of the fields of this struct, in order, if this is a
        # struct.
        # Corresponds to the JSON property `structTypes`
        # @return [Array<Google::Apis::BigqueryV2::QueryParameterType::StructType>]
        attr_accessor :struct_types
      
        # [Required] The top level type of this field.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @array_type = args[:array_type] if args.key?(:array_type)
          @struct_types = args[:struct_types] if args.key?(:struct_types)
          @type = args[:type] if args.key?(:type)
        end
        
        # 
        class StructType
          include Google::Apis::Core::Hashable
        
          # [Optional] Human-oriented description of the field.
          # Corresponds to the JSON property `description`
          # @return [String]
          attr_accessor :description
        
          # [Optional] The name of this field.
          # Corresponds to the JSON property `name`
          # @return [String]
          attr_accessor :name
        
          # [Required] The type of this field.
          # Corresponds to the JSON property `type`
          # @return [Google::Apis::BigqueryV2::QueryParameterType]
          attr_accessor :type
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @description = args[:description] if args.key?(:description)
            @name = args[:name] if args.key?(:name)
            @type = args[:type] if args.key?(:type)
          end
        end
      end
      
      # 
      class QueryParameterValue
        include Google::Apis::Core::Hashable
      
        # [Optional] The array values, if this is an array type.
        # Corresponds to the JSON property `arrayValues`
        # @return [Array<Google::Apis::BigqueryV2::QueryParameterValue>]
        attr_accessor :array_values
      
        # [Optional] The struct field values, in order of the struct type's declaration.
        # Corresponds to the JSON property `structValues`
        # @return [Hash<String,Google::Apis::BigqueryV2::QueryParameterValue>]
        attr_accessor :struct_values
      
        # [Optional] The value of this value, if a simple scalar type.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @array_values = args[:array_values] if args.key?(:array_values)
          @struct_values = args[:struct_values] if args.key?(:struct_values)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # 
      class QueryRequest
        include Google::Apis::Core::Hashable
      
        # [Optional] Specifies the default datasetId and projectId to assume for any
        # unqualified table names in the query. If not set, all table names in the query
        # string must be qualified in the format 'datasetId.tableId'.
        # Corresponds to the JSON property `defaultDataset`
        # @return [Google::Apis::BigqueryV2::DatasetReference]
        attr_accessor :default_dataset
      
        # [Optional] If set to true, BigQuery doesn't run the job. Instead, if the query
        # is valid, BigQuery returns statistics about the job such as how many bytes
        # would be processed. If the query is invalid, an error returns. The default
        # value is false.
        # Corresponds to the JSON property `dryRun`
        # @return [Boolean]
        attr_accessor :dry_run
        alias_method :dry_run?, :dry_run
      
        # The resource type of the request.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The geographic location where the job should run. See details at https://cloud.
        # google.com/bigquery/docs/locations#specifying_your_location.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # [Optional] The maximum number of rows of data to return per page of results.
        # Setting this flag to a small value such as 1000 and then paging through
        # results might improve reliability when the query result set is large. In
        # addition to this limit, responses are also limited to 10 MB. By default, there
        # is no maximum row count, and only the byte limit applies.
        # Corresponds to the JSON property `maxResults`
        # @return [Fixnum]
        attr_accessor :max_results
      
        # Standard SQL only. Set to POSITIONAL to use positional (?) query parameters or
        # to NAMED to use named (@myparam) query parameters in this query.
        # Corresponds to the JSON property `parameterMode`
        # @return [String]
        attr_accessor :parameter_mode
      
        # [Deprecated] This property is deprecated.
        # Corresponds to the JSON property `preserveNulls`
        # @return [Boolean]
        attr_accessor :preserve_nulls
        alias_method :preserve_nulls?, :preserve_nulls
      
        # [Required] A query string, following the BigQuery query syntax, of the query
        # to execute. Example: "SELECT count(f1) FROM [myProjectId:myDatasetId.myTableId]
        # ".
        # Corresponds to the JSON property `query`
        # @return [String]
        attr_accessor :query
      
        # Query parameters for Standard SQL queries.
        # Corresponds to the JSON property `queryParameters`
        # @return [Array<Google::Apis::BigqueryV2::QueryParameter>]
        attr_accessor :query_parameters
      
        # [Optional] How long to wait for the query to complete, in milliseconds, before
        # the request times out and returns. Note that this is only a timeout for the
        # request, not the query. If the query takes longer to run than the timeout
        # value, the call returns without any results and with the 'jobComplete' flag
        # set to false. You can call GetQueryResults() to wait for the query to complete
        # and read the results. The default value is 10000 milliseconds (10 seconds).
        # Corresponds to the JSON property `timeoutMs`
        # @return [Fixnum]
        attr_accessor :timeout_ms
      
        # Specifies whether to use BigQuery's legacy SQL dialect for this query. The
        # default value is true. If set to false, the query will use BigQuery's standard
        # SQL: https://cloud.google.com/bigquery/sql-reference/ When useLegacySql is set
        # to false, the value of flattenResults is ignored; query will be run as if
        # flattenResults is false.
        # Corresponds to the JSON property `useLegacySql`
        # @return [Boolean]
        attr_accessor :use_legacy_sql
        alias_method :use_legacy_sql?, :use_legacy_sql
      
        # [Optional] Whether to look for the result in the query cache. The query cache
        # is a best-effort cache that will be flushed whenever tables in the query are
        # modified. The default value is true.
        # Corresponds to the JSON property `useQueryCache`
        # @return [Boolean]
        attr_accessor :use_query_cache
        alias_method :use_query_cache?, :use_query_cache
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @default_dataset = args[:default_dataset] if args.key?(:default_dataset)
          @dry_run = args[:dry_run] if args.key?(:dry_run)
          @kind = args[:kind] if args.key?(:kind)
          @location = args[:location] if args.key?(:location)
          @max_results = args[:max_results] if args.key?(:max_results)
          @parameter_mode = args[:parameter_mode] if args.key?(:parameter_mode)
          @preserve_nulls = args[:preserve_nulls] if args.key?(:preserve_nulls)
          @query = args[:query] if args.key?(:query)
          @query_parameters = args[:query_parameters] if args.key?(:query_parameters)
          @timeout_ms = args[:timeout_ms] if args.key?(:timeout_ms)
          @use_legacy_sql = args[:use_legacy_sql] if args.key?(:use_legacy_sql)
          @use_query_cache = args[:use_query_cache] if args.key?(:use_query_cache)
        end
      end
      
      # 
      class QueryResponse
        include Google::Apis::Core::Hashable
      
        # Whether the query result was fetched from the query cache.
        # Corresponds to the JSON property `cacheHit`
        # @return [Boolean]
        attr_accessor :cache_hit
        alias_method :cache_hit?, :cache_hit
      
        # [Output-only] The first errors or warnings encountered during the running of
        # the job. The final message includes the number of errors that caused the
        # process to stop. Errors here do not necessarily mean that the job has
        # completed or was unsuccessful.
        # Corresponds to the JSON property `errors`
        # @return [Array<Google::Apis::BigqueryV2::ErrorProto>]
        attr_accessor :errors
      
        # Whether the query has completed or not. If rows or totalRows are present, this
        # will always be true. If this is false, totalRows will not be available.
        # Corresponds to the JSON property `jobComplete`
        # @return [Boolean]
        attr_accessor :job_complete
        alias_method :job_complete?, :job_complete
      
        # Reference to the Job that was created to run the query. This field will be
        # present even if the original request timed out, in which case GetQueryResults
        # can be used to read the results once the query has completed. Since this API
        # only returns the first page of results, subsequent pages can be fetched via
        # the same mechanism (GetQueryResults).
        # Corresponds to the JSON property `jobReference`
        # @return [Google::Apis::BigqueryV2::JobReference]
        attr_accessor :job_reference
      
        # The resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # [Output-only] The number of rows affected by a DML statement. Present only for
        # DML statements INSERT, UPDATE or DELETE.
        # Corresponds to the JSON property `numDmlAffectedRows`
        # @return [Fixnum]
        attr_accessor :num_dml_affected_rows
      
        # A token used for paging results.
        # Corresponds to the JSON property `pageToken`
        # @return [String]
        attr_accessor :page_token
      
        # An object with as many results as can be contained within the maximum
        # permitted reply size. To get any additional rows, you can call GetQueryResults
        # and specify the jobReference returned above.
        # Corresponds to the JSON property `rows`
        # @return [Array<Google::Apis::BigqueryV2::TableRow>]
        attr_accessor :rows
      
        # The schema of the results. Present only when the query completes successfully.
        # Corresponds to the JSON property `schema`
        # @return [Google::Apis::BigqueryV2::TableSchema]
        attr_accessor :schema
      
        # The total number of bytes processed for this query. If this query was a dry
        # run, this is the number of bytes that would be processed if the query were run.
        # Corresponds to the JSON property `totalBytesProcessed`
        # @return [Fixnum]
        attr_accessor :total_bytes_processed
      
        # The total number of rows in the complete query result set, which can be more
        # than the number of rows in this single page of results.
        # Corresponds to the JSON property `totalRows`
        # @return [Fixnum]
        attr_accessor :total_rows
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cache_hit = args[:cache_hit] if args.key?(:cache_hit)
          @errors = args[:errors] if args.key?(:errors)
          @job_complete = args[:job_complete] if args.key?(:job_complete)
          @job_reference = args[:job_reference] if args.key?(:job_reference)
          @kind = args[:kind] if args.key?(:kind)
          @num_dml_affected_rows = args[:num_dml_affected_rows] if args.key?(:num_dml_affected_rows)
          @page_token = args[:page_token] if args.key?(:page_token)
          @rows = args[:rows] if args.key?(:rows)
          @schema = args[:schema] if args.key?(:schema)
          @total_bytes_processed = args[:total_bytes_processed] if args.key?(:total_bytes_processed)
          @total_rows = args[:total_rows] if args.key?(:total_rows)
        end
      end
      
      # 
      class QueryTimelineSample
        include Google::Apis::Core::Hashable
      
        # Total number of units currently being processed by workers. This does not
        # correspond directly to slot usage. This is the largest value observed since
        # the last sample.
        # Corresponds to the JSON property `activeUnits`
        # @return [Fixnum]
        attr_accessor :active_units
      
        # Total parallel units of work completed by this query.
        # Corresponds to the JSON property `completedUnits`
        # @return [Fixnum]
        attr_accessor :completed_units
      
        # Milliseconds elapsed since the start of query execution.
        # Corresponds to the JSON property `elapsedMs`
        # @return [Fixnum]
        attr_accessor :elapsed_ms
      
        # Total parallel units of work remaining for the active stages.
        # Corresponds to the JSON property `pendingUnits`
        # @return [Fixnum]
        attr_accessor :pending_units
      
        # Cumulative slot-ms consumed by the query.
        # Corresponds to the JSON property `totalSlotMs`
        # @return [Fixnum]
        attr_accessor :total_slot_ms
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @active_units = args[:active_units] if args.key?(:active_units)
          @completed_units = args[:completed_units] if args.key?(:completed_units)
          @elapsed_ms = args[:elapsed_ms] if args.key?(:elapsed_ms)
          @pending_units = args[:pending_units] if args.key?(:pending_units)
          @total_slot_ms = args[:total_slot_ms] if args.key?(:total_slot_ms)
        end
      end
      
      # 
      class RangePartitioning
        include Google::Apis::Core::Hashable
      
        # [TrustedTester] [Required] The table is partitioned by this field. The field
        # must be a top-level NULLABLE/REQUIRED field. The only supported type is
        # INTEGER/INT64.
        # Corresponds to the JSON property `field`
        # @return [String]
        attr_accessor :field
      
        # [TrustedTester] [Required] Defines the ranges for range partitioning.
        # Corresponds to the JSON property `range`
        # @return [Google::Apis::BigqueryV2::RangePartitioning::Range]
        attr_accessor :range
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @field = args[:field] if args.key?(:field)
          @range = args[:range] if args.key?(:range)
        end
        
        # [TrustedTester] [Required] Defines the ranges for range partitioning.
        class Range
          include Google::Apis::Core::Hashable
        
          # [TrustedTester] [Required] The end of range partitioning, exclusive.
          # Corresponds to the JSON property `end`
          # @return [Fixnum]
          attr_accessor :end
        
          # [TrustedTester] [Required] The width of each interval.
          # Corresponds to the JSON property `interval`
          # @return [Fixnum]
          attr_accessor :interval
        
          # [TrustedTester] [Required] The start of range partitioning, inclusive.
          # Corresponds to the JSON property `start`
          # @return [Fixnum]
          attr_accessor :start
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @end = args[:end] if args.key?(:end)
            @interval = args[:interval] if args.key?(:interval)
            @start = args[:start] if args.key?(:start)
          end
        end
      end
      
      # Evaluation metrics for regression and explicit feedback type matrix
      # factorization models.
      class RegressionMetrics
        include Google::Apis::Core::Hashable
      
        # Mean absolute error.
        # Corresponds to the JSON property `meanAbsoluteError`
        # @return [Float]
        attr_accessor :mean_absolute_error
      
        # Mean squared error.
        # Corresponds to the JSON property `meanSquaredError`
        # @return [Float]
        attr_accessor :mean_squared_error
      
        # Mean squared log error.
        # Corresponds to the JSON property `meanSquaredLogError`
        # @return [Float]
        attr_accessor :mean_squared_log_error
      
        # Median absolute error.
        # Corresponds to the JSON property `medianAbsoluteError`
        # @return [Float]
        attr_accessor :median_absolute_error
      
        # R^2 score.
        # Corresponds to the JSON property `rSquared`
        # @return [Float]
        attr_accessor :r_squared
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @mean_absolute_error = args[:mean_absolute_error] if args.key?(:mean_absolute_error)
          @mean_squared_error = args[:mean_squared_error] if args.key?(:mean_squared_error)
          @mean_squared_log_error = args[:mean_squared_log_error] if args.key?(:mean_squared_log_error)
          @median_absolute_error = args[:median_absolute_error] if args.key?(:median_absolute_error)
          @r_squared = args[:r_squared] if args.key?(:r_squared)
        end
      end
      
      # A user-defined function or a stored procedure.
      class Routine
        include Google::Apis::Core::Hashable
      
        # Optional.
        # Corresponds to the JSON property `arguments`
        # @return [Array<Google::Apis::BigqueryV2::Argument>]
        attr_accessor :arguments
      
        # Output only. The time when this routine was created, in milliseconds since
        # the epoch.
        # Corresponds to the JSON property `creationTime`
        # @return [Fixnum]
        attr_accessor :creation_time
      
        # Required. The body of the routine.
        # For functions, this is the expression in the AS clause.
        # If language=SQL, it is the substring inside (but excluding) the
        # parentheses. For example, for the function created with the following
        # statement:
        # `CREATE FUNCTION JoinLines(x string, y string) as (concat(x, "\n", y))`
        # The definition_body is `concat(x, "\n", y)` (\n is not replaced with
        # linebreak).
        # If language=JAVASCRIPT, it is the evaluated string in the AS clause.
        # For example, for the function created with the following statement:
        # `CREATE FUNCTION f() RETURNS STRING LANGUAGE js AS 'return "\n";\n'`
        # The definition_body is
        # `return "\n";\n`
        # Note that both \n are replaced with linebreaks.
        # Corresponds to the JSON property `definitionBody`
        # @return [String]
        attr_accessor :definition_body
      
        # Optional. [Experimental] The description of the routine if defined.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Output only. A hash of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Optional. If language = "JAVASCRIPT", this field stores the path of the
        # imported JAVASCRIPT libraries.
        # Corresponds to the JSON property `importedLibraries`
        # @return [Array<String>]
        attr_accessor :imported_libraries
      
        # Optional. Defaults to "SQL".
        # Corresponds to the JSON property `language`
        # @return [String]
        attr_accessor :language
      
        # Output only. The time when this routine was last modified, in milliseconds
        # since the epoch.
        # Corresponds to the JSON property `lastModifiedTime`
        # @return [Fixnum]
        attr_accessor :last_modified_time
      
        # The type of a variable, e.g., a function argument.
        # Examples:
        # INT64: `type_kind="INT64"`
        # ARRAY<STRING>: `type_kind="ARRAY", array_element_type="STRING"`
        # STRUCT<x STRING, y ARRAY<DATE>>:
        # `type_kind="STRUCT",
        # struct_type=`fields=[
        # `name="x", type=`type_kind="STRING"``,
        # `name="y", type=`type_kind="ARRAY", array_element_type="DATE"``
        # ]``
        # Corresponds to the JSON property `returnType`
        # @return [Google::Apis::BigqueryV2::StandardSqlDataType]
        attr_accessor :return_type
      
        # Required. Reference describing the ID of this routine.
        # Corresponds to the JSON property `routineReference`
        # @return [Google::Apis::BigqueryV2::RoutineReference]
        attr_accessor :routine_reference
      
        # Required. The type of routine.
        # Corresponds to the JSON property `routineType`
        # @return [String]
        attr_accessor :routine_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @arguments = args[:arguments] if args.key?(:arguments)
          @creation_time = args[:creation_time] if args.key?(:creation_time)
          @definition_body = args[:definition_body] if args.key?(:definition_body)
          @description = args[:description] if args.key?(:description)
          @etag = args[:etag] if args.key?(:etag)
          @imported_libraries = args[:imported_libraries] if args.key?(:imported_libraries)
          @language = args[:language] if args.key?(:language)
          @last_modified_time = args[:last_modified_time] if args.key?(:last_modified_time)
          @return_type = args[:return_type] if args.key?(:return_type)
          @routine_reference = args[:routine_reference] if args.key?(:routine_reference)
          @routine_type = args[:routine_type] if args.key?(:routine_type)
        end
      end
      
      # 
      class RoutineReference
        include Google::Apis::Core::Hashable
      
        # [Required] The ID of the dataset containing this routine.
        # Corresponds to the JSON property `datasetId`
        # @return [String]
        attr_accessor :dataset_id
      
        # [Required] The ID of the project containing this routine.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # [Required] The ID of the routine. The ID must contain only letters (a-z, A-Z),
        # numbers (0-9), or underscores (_). The maximum length is 256 characters.
        # Corresponds to the JSON property `routineId`
        # @return [String]
        attr_accessor :routine_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dataset_id = args[:dataset_id] if args.key?(:dataset_id)
          @project_id = args[:project_id] if args.key?(:project_id)
          @routine_id = args[:routine_id] if args.key?(:routine_id)
        end
      end
      
      # A single row in the confusion matrix.
      class Row
        include Google::Apis::Core::Hashable
      
        # The original label of this row.
        # Corresponds to the JSON property `actualLabel`
        # @return [String]
        attr_accessor :actual_label
      
        # Info describing predicted label distribution.
        # Corresponds to the JSON property `entries`
        # @return [Array<Google::Apis::BigqueryV2::Entry>]
        attr_accessor :entries
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @actual_label = args[:actual_label] if args.key?(:actual_label)
          @entries = args[:entries] if args.key?(:entries)
        end
      end
      
      # 
      class ScriptStackFrame
        include Google::Apis::Core::Hashable
      
        # [Output-only] One-based end column.
        # Corresponds to the JSON property `endColumn`
        # @return [Fixnum]
        attr_accessor :end_column
      
        # [Output-only] One-based end line.
        # Corresponds to the JSON property `endLine`
        # @return [Fixnum]
        attr_accessor :end_line
      
        # [Output-only] Name of the active procedure, empty if in a top-level script.
        # Corresponds to the JSON property `procedureId`
        # @return [String]
        attr_accessor :procedure_id
      
        # [Output-only] One-based start column.
        # Corresponds to the JSON property `startColumn`
        # @return [Fixnum]
        attr_accessor :start_column
      
        # [Output-only] One-based start line.
        # Corresponds to the JSON property `startLine`
        # @return [Fixnum]
        attr_accessor :start_line
      
        # [Output-only] Text of the current statement/expression.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_column = args[:end_column] if args.key?(:end_column)
          @end_line = args[:end_line] if args.key?(:end_line)
          @procedure_id = args[:procedure_id] if args.key?(:procedure_id)
          @start_column = args[:start_column] if args.key?(:start_column)
          @start_line = args[:start_line] if args.key?(:start_line)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # 
      class ScriptStatistics
        include Google::Apis::Core::Hashable
      
        # [Output-only] Whether this child job was a statement or expression.
        # Corresponds to the JSON property `evaluationKind`
        # @return [String]
        attr_accessor :evaluation_kind
      
        # Stack trace showing the line/column/procedure name of each frame on the stack
        # at the point where the current evaluation happened. The leaf frame is first,
        # the primary script is last. Never empty.
        # Corresponds to the JSON property `stackFrames`
        # @return [Array<Google::Apis::BigqueryV2::ScriptStackFrame>]
        attr_accessor :stack_frames
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @evaluation_kind = args[:evaluation_kind] if args.key?(:evaluation_kind)
          @stack_frames = args[:stack_frames] if args.key?(:stack_frames)
        end
      end
      
      # The type of a variable, e.g., a function argument.
      # Examples:
      # INT64: `type_kind="INT64"`
      # ARRAY<STRING>: `type_kind="ARRAY", array_element_type="STRING"`
      # STRUCT<x STRING, y ARRAY<DATE>>:
      # `type_kind="STRUCT",
      # struct_type=`fields=[
      # `name="x", type=`type_kind="STRING"``,
      # `name="y", type=`type_kind="ARRAY", array_element_type="DATE"``
      # ]``
      class StandardSqlDataType
        include Google::Apis::Core::Hashable
      
        # The type of a variable, e.g., a function argument.
        # Examples:
        # INT64: `type_kind="INT64"`
        # ARRAY<STRING>: `type_kind="ARRAY", array_element_type="STRING"`
        # STRUCT<x STRING, y ARRAY<DATE>>:
        # `type_kind="STRUCT",
        # struct_type=`fields=[
        # `name="x", type=`type_kind="STRING"``,
        # `name="y", type=`type_kind="ARRAY", array_element_type="DATE"``
        # ]``
        # Corresponds to the JSON property `arrayElementType`
        # @return [Google::Apis::BigqueryV2::StandardSqlDataType]
        attr_accessor :array_element_type
      
        # The fields of this struct, in order, if type_kind = "STRUCT".
        # Corresponds to the JSON property `structType`
        # @return [Google::Apis::BigqueryV2::StandardSqlStructType]
        attr_accessor :struct_type
      
        # Required. The top level type of this field.
        # Can be any standard SQL data type (e.g., "INT64", "DATE", "ARRAY").
        # Corresponds to the JSON property `typeKind`
        # @return [String]
        attr_accessor :type_kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @array_element_type = args[:array_element_type] if args.key?(:array_element_type)
          @struct_type = args[:struct_type] if args.key?(:struct_type)
          @type_kind = args[:type_kind] if args.key?(:type_kind)
        end
      end
      
      # A field or a column.
      class StandardSqlField
        include Google::Apis::Core::Hashable
      
        # Optional. The name of this field. Can be absent for struct fields.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The type of a variable, e.g., a function argument.
        # Examples:
        # INT64: `type_kind="INT64"`
        # ARRAY<STRING>: `type_kind="ARRAY", array_element_type="STRING"`
        # STRUCT<x STRING, y ARRAY<DATE>>:
        # `type_kind="STRUCT",
        # struct_type=`fields=[
        # `name="x", type=`type_kind="STRING"``,
        # `name="y", type=`type_kind="ARRAY", array_element_type="DATE"``
        # ]``
        # Corresponds to the JSON property `type`
        # @return [Google::Apis::BigqueryV2::StandardSqlDataType]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # 
      class StandardSqlStructType
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `fields`
        # @return [Array<Google::Apis::BigqueryV2::StandardSqlField>]
        attr_accessor :fields
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @fields = args[:fields] if args.key?(:fields)
        end
      end
      
      # 
      class Streamingbuffer
        include Google::Apis::Core::Hashable
      
        # [Output-only] A lower-bound estimate of the number of bytes currently in the
        # streaming buffer.
        # Corresponds to the JSON property `estimatedBytes`
        # @return [Fixnum]
        attr_accessor :estimated_bytes
      
        # [Output-only] A lower-bound estimate of the number of rows currently in the
        # streaming buffer.
        # Corresponds to the JSON property `estimatedRows`
        # @return [Fixnum]
        attr_accessor :estimated_rows
      
        # [Output-only] Contains the timestamp of the oldest entry in the streaming
        # buffer, in milliseconds since the epoch, if the streaming buffer is available.
        # Corresponds to the JSON property `oldestEntryTime`
        # @return [Fixnum]
        attr_accessor :oldest_entry_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @estimated_bytes = args[:estimated_bytes] if args.key?(:estimated_bytes)
          @estimated_rows = args[:estimated_rows] if args.key?(:estimated_rows)
          @oldest_entry_time = args[:oldest_entry_time] if args.key?(:oldest_entry_time)
        end
      end
      
      # 
      class Table
        include Google::Apis::Core::Hashable
      
        # [Beta] Clustering specification for the table. Must be specified with
        # partitioning, data in the table will be first partitioned and subsequently
        # clustered.
        # Corresponds to the JSON property `clustering`
        # @return [Google::Apis::BigqueryV2::Clustering]
        attr_accessor :clustering
      
        # [Output-only] The time when this table was created, in milliseconds since the
        # epoch.
        # Corresponds to the JSON property `creationTime`
        # @return [Fixnum]
        attr_accessor :creation_time
      
        # [Optional] A user-friendly description of this table.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Custom encryption configuration (e.g., Cloud KMS keys).
        # Corresponds to the JSON property `encryptionConfiguration`
        # @return [Google::Apis::BigqueryV2::EncryptionConfiguration]
        attr_accessor :encryption_configuration
      
        # [Output-only] A hash of the table metadata. Used to ensure there were no
        # concurrent modifications to the resource when attempting an update. Not
        # guaranteed to change when the table contents or the fields numRows, numBytes,
        # numLongTermBytes or lastModifiedTime change.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # [Optional] The time when this table expires, in milliseconds since the epoch.
        # If not present, the table will persist indefinitely. Expired tables will be
        # deleted and their storage reclaimed. The defaultTableExpirationMs property of
        # the encapsulating dataset can be used to set a default expirationTime on newly
        # created tables.
        # Corresponds to the JSON property `expirationTime`
        # @return [Fixnum]
        attr_accessor :expiration_time
      
        # [Optional] Describes the data format, location, and other properties of a
        # table stored outside of BigQuery. By defining these properties, the data
        # source can then be queried as if it were a standard BigQuery table.
        # Corresponds to the JSON property `externalDataConfiguration`
        # @return [Google::Apis::BigqueryV2::ExternalDataConfiguration]
        attr_accessor :external_data_configuration
      
        # [Optional] A descriptive name for this table.
        # Corresponds to the JSON property `friendlyName`
        # @return [String]
        attr_accessor :friendly_name
      
        # [Output-only] An opaque ID uniquely identifying the table.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # [Output-only] The type of the resource.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The labels associated with this table. You can use these to organize and group
        # your tables. Label keys and values can be no longer than 63 characters, can
        # only contain lowercase letters, numeric characters, underscores and dashes.
        # International characters are allowed. Label values are optional. Label keys
        # must start with a letter and each label in the list must have a different key.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # [Output-only] The time when this table was last modified, in milliseconds
        # since the epoch.
        # Corresponds to the JSON property `lastModifiedTime`
        # @return [Fixnum]
        attr_accessor :last_modified_time
      
        # [Output-only] The geographic location where the table resides. This value is
        # inherited from the dataset.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # [Optional] Materialized view definition.
        # Corresponds to the JSON property `materializedView`
        # @return [Google::Apis::BigqueryV2::MaterializedViewDefinition]
        attr_accessor :materialized_view
      
        # [Output-only, Beta] Present iff this table represents a ML model. Describes
        # the training information for the model, and it is required to run 'PREDICT'
        # queries.
        # Corresponds to the JSON property `model`
        # @return [Google::Apis::BigqueryV2::ModelDefinition]
        attr_accessor :model
      
        # [Output-only] The size of this table in bytes, excluding any data in the
        # streaming buffer.
        # Corresponds to the JSON property `numBytes`
        # @return [Fixnum]
        attr_accessor :num_bytes
      
        # [Output-only] The number of bytes in the table that are considered "long-term
        # storage".
        # Corresponds to the JSON property `numLongTermBytes`
        # @return [Fixnum]
        attr_accessor :num_long_term_bytes
      
        # [Output-only] [TrustedTester] The physical size of this table in bytes,
        # excluding any data in the streaming buffer. This includes compression and
        # storage used for time travel.
        # Corresponds to the JSON property `numPhysicalBytes`
        # @return [Fixnum]
        attr_accessor :num_physical_bytes
      
        # [Output-only] The number of rows of data in this table, excluding any data in
        # the streaming buffer.
        # Corresponds to the JSON property `numRows`
        # @return [Fixnum]
        attr_accessor :num_rows
      
        # [TrustedTester] Range partitioning specification for this table. Only one of
        # timePartitioning and rangePartitioning should be specified.
        # Corresponds to the JSON property `rangePartitioning`
        # @return [Google::Apis::BigqueryV2::RangePartitioning]
        attr_accessor :range_partitioning
      
        # [Beta] [Optional] If set to true, queries over this table require a partition
        # filter that can be used for partition elimination to be specified.
        # Corresponds to the JSON property `requirePartitionFilter`
        # @return [Boolean]
        attr_accessor :require_partition_filter
        alias_method :require_partition_filter?, :require_partition_filter
      
        # [Optional] Describes the schema of this table.
        # Corresponds to the JSON property `schema`
        # @return [Google::Apis::BigqueryV2::TableSchema]
        attr_accessor :schema
      
        # [Output-only] A URL that can be used to access this resource again.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # [Output-only] Contains information regarding this table's streaming buffer, if
        # one is present. This field will be absent if the table is not being streamed
        # to or if there is no data in the streaming buffer.
        # Corresponds to the JSON property `streamingBuffer`
        # @return [Google::Apis::BigqueryV2::Streamingbuffer]
        attr_accessor :streaming_buffer
      
        # [Required] Reference describing the ID of this table.
        # Corresponds to the JSON property `tableReference`
        # @return [Google::Apis::BigqueryV2::TableReference]
        attr_accessor :table_reference
      
        # Time-based partitioning specification for this table. Only one of
        # timePartitioning and rangePartitioning should be specified.
        # Corresponds to the JSON property `timePartitioning`
        # @return [Google::Apis::BigqueryV2::TimePartitioning]
        attr_accessor :time_partitioning
      
        # [Output-only] Describes the table type. The following values are supported:
        # TABLE: A normal BigQuery table. VIEW: A virtual table defined by a SQL query. [
        # TrustedTester] MATERIALIZED_VIEW: SQL query whose result is persisted.
        # EXTERNAL: A table that references data stored in an external storage system,
        # such as Google Cloud Storage. The default value is TABLE.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # [Optional] The view definition.
        # Corresponds to the JSON property `view`
        # @return [Google::Apis::BigqueryV2::ViewDefinition]
        attr_accessor :view
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @clustering = args[:clustering] if args.key?(:clustering)
          @creation_time = args[:creation_time] if args.key?(:creation_time)
          @description = args[:description] if args.key?(:description)
          @encryption_configuration = args[:encryption_configuration] if args.key?(:encryption_configuration)
          @etag = args[:etag] if args.key?(:etag)
          @expiration_time = args[:expiration_time] if args.key?(:expiration_time)
          @external_data_configuration = args[:external_data_configuration] if args.key?(:external_data_configuration)
          @friendly_name = args[:friendly_name] if args.key?(:friendly_name)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @labels = args[:labels] if args.key?(:labels)
          @last_modified_time = args[:last_modified_time] if args.key?(:last_modified_time)
          @location = args[:location] if args.key?(:location)
          @materialized_view = args[:materialized_view] if args.key?(:materialized_view)
          @model = args[:model] if args.key?(:model)
          @num_bytes = args[:num_bytes] if args.key?(:num_bytes)
          @num_long_term_bytes = args[:num_long_term_bytes] if args.key?(:num_long_term_bytes)
          @num_physical_bytes = args[:num_physical_bytes] if args.key?(:num_physical_bytes)
          @num_rows = args[:num_rows] if args.key?(:num_rows)
          @range_partitioning = args[:range_partitioning] if args.key?(:range_partitioning)
          @require_partition_filter = args[:require_partition_filter] if args.key?(:require_partition_filter)
          @schema = args[:schema] if args.key?(:schema)
          @self_link = args[:self_link] if args.key?(:self_link)
          @streaming_buffer = args[:streaming_buffer] if args.key?(:streaming_buffer)
          @table_reference = args[:table_reference] if args.key?(:table_reference)
          @time_partitioning = args[:time_partitioning] if args.key?(:time_partitioning)
          @type = args[:type] if args.key?(:type)
          @view = args[:view] if args.key?(:view)
        end
      end
      
      # 
      class TableCell
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `v`
        # @return [Object]
        attr_accessor :v
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @v = args[:v] if args.key?(:v)
        end
      end
      
      # 
      class InsertAllTableDataRequest
        include Google::Apis::Core::Hashable
      
        # [Optional] Accept rows that contain values that do not match the schema. The
        # unknown values are ignored. Default is false, which treats unknown values as
        # errors.
        # Corresponds to the JSON property `ignoreUnknownValues`
        # @return [Boolean]
        attr_accessor :ignore_unknown_values
        alias_method :ignore_unknown_values?, :ignore_unknown_values
      
        # The resource type of the response.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The rows to insert.
        # Corresponds to the JSON property `rows`
        # @return [Array<Google::Apis::BigqueryV2::InsertAllTableDataRequest::Row>]
        attr_accessor :rows
      
        # [Optional] Insert all valid rows of a request, even if invalid rows exist. The
        # default value is false, which causes the entire request to fail if any invalid
        # rows exist.
        # Corresponds to the JSON property `skipInvalidRows`
        # @return [Boolean]
        attr_accessor :skip_invalid_rows
        alias_method :skip_invalid_rows?, :skip_invalid_rows
      
        # If specified, treats the destination table as a base template, and inserts the
        # rows into an instance table named "`destination``templateSuffix`". BigQuery
        # will manage creation of the instance table, using the schema of the base
        # template table. See https://cloud.google.com/bigquery/streaming-data-into-
        # bigquery#template-tables for considerations when working with templates tables.
        # Corresponds to the JSON property `templateSuffix`
        # @return [String]
        attr_accessor :template_suffix
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ignore_unknown_values = args[:ignore_unknown_values] if args.key?(:ignore_unknown_values)
          @kind = args[:kind] if args.key?(:kind)
          @rows = args[:rows] if args.key?(:rows)
          @skip_invalid_rows = args[:skip_invalid_rows] if args.key?(:skip_invalid_rows)
          @template_suffix = args[:template_suffix] if args.key?(:template_suffix)
        end
        
        # 
        class Row
          include Google::Apis::Core::Hashable
        
          # [Optional] A unique ID for each row. BigQuery uses this property to detect
          # duplicate insertion requests on a best-effort basis.
          # Corresponds to the JSON property `insertId`
          # @return [String]
          attr_accessor :insert_id
        
          # Represents a single JSON object.
          # Corresponds to the JSON property `json`
          # @return [Hash<String,Object>]
          attr_accessor :json
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @insert_id = args[:insert_id] if args.key?(:insert_id)
            @json = args[:json] if args.key?(:json)
          end
        end
      end
      
      # 
      class InsertAllTableDataResponse
        include Google::Apis::Core::Hashable
      
        # An array of errors for rows that were not inserted.
        # Corresponds to the JSON property `insertErrors`
        # @return [Array<Google::Apis::BigqueryV2::InsertAllTableDataResponse::InsertError>]
        attr_accessor :insert_errors
      
        # The resource type of the response.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @insert_errors = args[:insert_errors] if args.key?(:insert_errors)
          @kind = args[:kind] if args.key?(:kind)
        end
        
        # 
        class InsertError
          include Google::Apis::Core::Hashable
        
          # Error information for the row indicated by the index property.
          # Corresponds to the JSON property `errors`
          # @return [Array<Google::Apis::BigqueryV2::ErrorProto>]
          attr_accessor :errors
        
          # The index of the row that error applies to.
          # Corresponds to the JSON property `index`
          # @return [Fixnum]
          attr_accessor :index
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @errors = args[:errors] if args.key?(:errors)
            @index = args[:index] if args.key?(:index)
          end
        end
      end
      
      # 
      class TableDataList
        include Google::Apis::Core::Hashable
      
        # A hash of this page of results.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The resource type of the response.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # A token used for paging results. Providing this token instead of the
        # startIndex parameter can help you retrieve stable results when an underlying
        # table is changing.
        # Corresponds to the JSON property `pageToken`
        # @return [String]
        attr_accessor :page_token
      
        # Rows of results.
        # Corresponds to the JSON property `rows`
        # @return [Array<Google::Apis::BigqueryV2::TableRow>]
        attr_accessor :rows
      
        # The total number of rows in the complete table.
        # Corresponds to the JSON property `totalRows`
        # @return [Fixnum]
        attr_accessor :total_rows
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @kind = args[:kind] if args.key?(:kind)
          @page_token = args[:page_token] if args.key?(:page_token)
          @rows = args[:rows] if args.key?(:rows)
          @total_rows = args[:total_rows] if args.key?(:total_rows)
        end
      end
      
      # 
      class TableFieldSchema
        include Google::Apis::Core::Hashable
      
        # [Optional] The categories attached to this field, used for field-level access
        # control.
        # Corresponds to the JSON property `categories`
        # @return [Google::Apis::BigqueryV2::TableFieldSchema::Categories]
        attr_accessor :categories
      
        # [Optional] The field description. The maximum length is 1,024 characters.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # [Optional] Describes the nested schema fields if the type property is set to
        # RECORD.
        # Corresponds to the JSON property `fields`
        # @return [Array<Google::Apis::BigqueryV2::TableFieldSchema>]
        attr_accessor :fields
      
        # [Optional] The field mode. Possible values include NULLABLE, REQUIRED and
        # REPEATED. The default value is NULLABLE.
        # Corresponds to the JSON property `mode`
        # @return [String]
        attr_accessor :mode
      
        # [Required] The field name. The name must contain only letters (a-z, A-Z),
        # numbers (0-9), or underscores (_), and must start with a letter or underscore.
        # The maximum length is 128 characters.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # [Required] The field data type. Possible values include STRING, BYTES, INTEGER,
        # INT64 (same as INTEGER), FLOAT, FLOAT64 (same as FLOAT), BOOLEAN, BOOL (same
        # as BOOLEAN), TIMESTAMP, DATE, TIME, DATETIME, RECORD (where RECORD indicates
        # that the field contains a nested schema) or STRUCT (same as RECORD).
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @categories = args[:categories] if args.key?(:categories)
          @description = args[:description] if args.key?(:description)
          @fields = args[:fields] if args.key?(:fields)
          @mode = args[:mode] if args.key?(:mode)
          @name = args[:name] if args.key?(:name)
          @type = args[:type] if args.key?(:type)
        end
        
        # [Optional] The categories attached to this field, used for field-level access
        # control.
        class Categories
          include Google::Apis::Core::Hashable
        
          # A list of category resource names. For example, "projects/1/taxonomies/2/
          # categories/3". At most 5 categories are allowed.
          # Corresponds to the JSON property `names`
          # @return [Array<String>]
          attr_accessor :names
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @names = args[:names] if args.key?(:names)
          end
        end
      end
      
      # 
      class TableList
        include Google::Apis::Core::Hashable
      
        # A hash of this page of results.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The type of list.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # A token to request the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Tables in the requested dataset.
        # Corresponds to the JSON property `tables`
        # @return [Array<Google::Apis::BigqueryV2::TableList::Table>]
        attr_accessor :tables
      
        # The total number of tables in the dataset.
        # Corresponds to the JSON property `totalItems`
        # @return [Fixnum]
        attr_accessor :total_items
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @tables = args[:tables] if args.key?(:tables)
          @total_items = args[:total_items] if args.key?(:total_items)
        end
        
        # 
        class Table
          include Google::Apis::Core::Hashable
        
          # [Beta] Clustering specification for this table, if configured.
          # Corresponds to the JSON property `clustering`
          # @return [Google::Apis::BigqueryV2::Clustering]
          attr_accessor :clustering
        
          # The time when this table was created, in milliseconds since the epoch.
          # Corresponds to the JSON property `creationTime`
          # @return [Fixnum]
          attr_accessor :creation_time
        
          # [Optional] The time when this table expires, in milliseconds since the epoch.
          # If not present, the table will persist indefinitely. Expired tables will be
          # deleted and their storage reclaimed.
          # Corresponds to the JSON property `expirationTime`
          # @return [Fixnum]
          attr_accessor :expiration_time
        
          # The user-friendly name for this table.
          # Corresponds to the JSON property `friendlyName`
          # @return [String]
          attr_accessor :friendly_name
        
          # An opaque ID of the table
          # Corresponds to the JSON property `id`
          # @return [String]
          attr_accessor :id
        
          # The resource type.
          # Corresponds to the JSON property `kind`
          # @return [String]
          attr_accessor :kind
        
          # The labels associated with this table. You can use these to organize and group
          # your tables.
          # Corresponds to the JSON property `labels`
          # @return [Hash<String,String>]
          attr_accessor :labels
        
          # The range partitioning specification for this table, if configured.
          # Corresponds to the JSON property `rangePartitioning`
          # @return [Google::Apis::BigqueryV2::RangePartitioning]
          attr_accessor :range_partitioning
        
          # A reference uniquely identifying the table.
          # Corresponds to the JSON property `tableReference`
          # @return [Google::Apis::BigqueryV2::TableReference]
          attr_accessor :table_reference
        
          # The time-based partitioning specification for this table, if configured.
          # Corresponds to the JSON property `timePartitioning`
          # @return [Google::Apis::BigqueryV2::TimePartitioning]
          attr_accessor :time_partitioning
        
          # The type of table. Possible values are: TABLE, VIEW.
          # Corresponds to the JSON property `type`
          # @return [String]
          attr_accessor :type
        
          # Additional details for a view.
          # Corresponds to the JSON property `view`
          # @return [Google::Apis::BigqueryV2::TableList::Table::View]
          attr_accessor :view
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @clustering = args[:clustering] if args.key?(:clustering)
            @creation_time = args[:creation_time] if args.key?(:creation_time)
            @expiration_time = args[:expiration_time] if args.key?(:expiration_time)
            @friendly_name = args[:friendly_name] if args.key?(:friendly_name)
            @id = args[:id] if args.key?(:id)
            @kind = args[:kind] if args.key?(:kind)
            @labels = args[:labels] if args.key?(:labels)
            @range_partitioning = args[:range_partitioning] if args.key?(:range_partitioning)
            @table_reference = args[:table_reference] if args.key?(:table_reference)
            @time_partitioning = args[:time_partitioning] if args.key?(:time_partitioning)
            @type = args[:type] if args.key?(:type)
            @view = args[:view] if args.key?(:view)
          end
          
          # Additional details for a view.
          class View
            include Google::Apis::Core::Hashable
          
            # True if view is defined in legacy SQL dialect, false if in standard SQL.
            # Corresponds to the JSON property `useLegacySql`
            # @return [Boolean]
            attr_accessor :use_legacy_sql
            alias_method :use_legacy_sql?, :use_legacy_sql
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @use_legacy_sql = args[:use_legacy_sql] if args.key?(:use_legacy_sql)
            end
          end
        end
      end
      
      # 
      class TableReference
        include Google::Apis::Core::Hashable
      
        # [Required] The ID of the dataset containing this table.
        # Corresponds to the JSON property `datasetId`
        # @return [String]
        attr_accessor :dataset_id
      
        # [Required] The ID of the project containing this table.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # [Required] The ID of the table. The ID must contain only letters (a-z, A-Z),
        # numbers (0-9), or underscores (_). The maximum length is 1,024 characters.
        # Corresponds to the JSON property `tableId`
        # @return [String]
        attr_accessor :table_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dataset_id = args[:dataset_id] if args.key?(:dataset_id)
          @project_id = args[:project_id] if args.key?(:project_id)
          @table_id = args[:table_id] if args.key?(:table_id)
        end
      end
      
      # 
      class TableRow
        include Google::Apis::Core::Hashable
      
        # Represents a single row in the result set, consisting of one or more fields.
        # Corresponds to the JSON property `f`
        # @return [Array<Google::Apis::BigqueryV2::TableCell>]
        attr_accessor :f
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @f = args[:f] if args.key?(:f)
        end
      end
      
      # 
      class TableSchema
        include Google::Apis::Core::Hashable
      
        # Describes the fields in a table.
        # Corresponds to the JSON property `fields`
        # @return [Array<Google::Apis::BigqueryV2::TableFieldSchema>]
        attr_accessor :fields
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @fields = args[:fields] if args.key?(:fields)
        end
      end
      
      # 
      class TimePartitioning
        include Google::Apis::Core::Hashable
      
        # [Optional] Number of milliseconds for which to keep the storage for partitions
        # in the table. The storage in a partition will have an expiration time of its
        # partition time plus this value.
        # Corresponds to the JSON property `expirationMs`
        # @return [Fixnum]
        attr_accessor :expiration_ms
      
        # [Beta] [Optional] If not set, the table is partitioned by pseudo column,
        # referenced via either '_PARTITIONTIME' as TIMESTAMP type, or '_PARTITIONDATE'
        # as DATE type. If field is specified, the table is instead partitioned by this
        # field. The field must be a top-level TIMESTAMP or DATE field. Its mode must be
        # NULLABLE or REQUIRED.
        # Corresponds to the JSON property `field`
        # @return [String]
        attr_accessor :field
      
        # 
        # Corresponds to the JSON property `requirePartitionFilter`
        # @return [Boolean]
        attr_accessor :require_partition_filter
        alias_method :require_partition_filter?, :require_partition_filter
      
        # [Required] The only type supported is DAY, which will generate one partition
        # per day.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @expiration_ms = args[:expiration_ms] if args.key?(:expiration_ms)
          @field = args[:field] if args.key?(:field)
          @require_partition_filter = args[:require_partition_filter] if args.key?(:require_partition_filter)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # 
      class TrainingOptions
        include Google::Apis::Core::Hashable
      
        # The column to split data with. This column won't be used as a
        # feature.
        # 1. When data_split_method is CUSTOM, the corresponding column should
        # be boolean. The rows with true value tag are eval data, and the false
        # are training data.
        # 2. When data_split_method is SEQ, the first DATA_SPLIT_EVAL_FRACTION
        # rows (from smallest to largest) in the corresponding column are used
        # as training data, and the rest are eval data. It respects the order
        # in Orderable data types:
        # https://cloud.google.com/bigquery/docs/reference/standard-sql/data-types#data-
        # type-properties
        # Corresponds to the JSON property `dataSplitColumn`
        # @return [String]
        attr_accessor :data_split_column
      
        # The fraction of evaluation data over the whole input data. The rest
        # of data will be used as training data. The format should be double.
        # Accurate to two decimal places.
        # Default value is 0.2.
        # Corresponds to the JSON property `dataSplitEvalFraction`
        # @return [Float]
        attr_accessor :data_split_eval_fraction
      
        # The data split type for training and evaluation, e.g. RANDOM.
        # Corresponds to the JSON property `dataSplitMethod`
        # @return [String]
        attr_accessor :data_split_method
      
        # Distance type for clustering models.
        # Corresponds to the JSON property `distanceType`
        # @return [String]
        attr_accessor :distance_type
      
        # Whether to stop early when the loss doesn't improve significantly
        # any more (compared to min_relative_progress). Used only for iterative
        # training algorithms.
        # Corresponds to the JSON property `earlyStop`
        # @return [Boolean]
        attr_accessor :early_stop
        alias_method :early_stop?, :early_stop
      
        # Specifies the initial learning rate for the line search learn rate
        # strategy.
        # Corresponds to the JSON property `initialLearnRate`
        # @return [Float]
        attr_accessor :initial_learn_rate
      
        # Name of input label columns in training data.
        # Corresponds to the JSON property `inputLabelColumns`
        # @return [Array<String>]
        attr_accessor :input_label_columns
      
        # The column used to provide the initial centroids for kmeans algorithm
        # when kmeans_initialization_method is CUSTOM.
        # Corresponds to the JSON property `kmeansInitializationColumn`
        # @return [String]
        attr_accessor :kmeans_initialization_column
      
        # The method used to initialize the centroids for kmeans algorithm.
        # Corresponds to the JSON property `kmeansInitializationMethod`
        # @return [String]
        attr_accessor :kmeans_initialization_method
      
        # L1 regularization coefficient.
        # Corresponds to the JSON property `l1Regularization`
        # @return [Float]
        attr_accessor :l1_regularization
      
        # L2 regularization coefficient.
        # Corresponds to the JSON property `l2Regularization`
        # @return [Float]
        attr_accessor :l2_regularization
      
        # Weights associated with each label class, for rebalancing the
        # training data. Only applicable for classification models.
        # Corresponds to the JSON property `labelClassWeights`
        # @return [Hash<String,Float>]
        attr_accessor :label_class_weights
      
        # Learning rate in training. Used only for iterative training algorithms.
        # Corresponds to the JSON property `learnRate`
        # @return [Float]
        attr_accessor :learn_rate
      
        # The strategy to determine learn rate for the current iteration.
        # Corresponds to the JSON property `learnRateStrategy`
        # @return [String]
        attr_accessor :learn_rate_strategy
      
        # Type of loss function used during training run.
        # Corresponds to the JSON property `lossType`
        # @return [String]
        attr_accessor :loss_type
      
        # The maximum number of iterations in training. Used only for iterative
        # training algorithms.
        # Corresponds to the JSON property `maxIterations`
        # @return [Fixnum]
        attr_accessor :max_iterations
      
        # When early_stop is true, stops training when accuracy improvement is
        # less than 'min_relative_progress'. Used only for iterative training
        # algorithms.
        # Corresponds to the JSON property `minRelativeProgress`
        # @return [Float]
        attr_accessor :min_relative_progress
      
        # [Beta] Google Cloud Storage URI from which the model was imported. Only
        # applicable for imported models.
        # Corresponds to the JSON property `modelUri`
        # @return [String]
        attr_accessor :model_uri
      
        # Number of clusters for clustering models.
        # Corresponds to the JSON property `numClusters`
        # @return [Fixnum]
        attr_accessor :num_clusters
      
        # Optimization strategy for training linear regression models.
        # Corresponds to the JSON property `optimizationStrategy`
        # @return [String]
        attr_accessor :optimization_strategy
      
        # Whether to train a model from the last checkpoint.
        # Corresponds to the JSON property `warmStart`
        # @return [Boolean]
        attr_accessor :warm_start
        alias_method :warm_start?, :warm_start
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data_split_column = args[:data_split_column] if args.key?(:data_split_column)
          @data_split_eval_fraction = args[:data_split_eval_fraction] if args.key?(:data_split_eval_fraction)
          @data_split_method = args[:data_split_method] if args.key?(:data_split_method)
          @distance_type = args[:distance_type] if args.key?(:distance_type)
          @early_stop = args[:early_stop] if args.key?(:early_stop)
          @initial_learn_rate = args[:initial_learn_rate] if args.key?(:initial_learn_rate)
          @input_label_columns = args[:input_label_columns] if args.key?(:input_label_columns)
          @kmeans_initialization_column = args[:kmeans_initialization_column] if args.key?(:kmeans_initialization_column)
          @kmeans_initialization_method = args[:kmeans_initialization_method] if args.key?(:kmeans_initialization_method)
          @l1_regularization = args[:l1_regularization] if args.key?(:l1_regularization)
          @l2_regularization = args[:l2_regularization] if args.key?(:l2_regularization)
          @label_class_weights = args[:label_class_weights] if args.key?(:label_class_weights)
          @learn_rate = args[:learn_rate] if args.key?(:learn_rate)
          @learn_rate_strategy = args[:learn_rate_strategy] if args.key?(:learn_rate_strategy)
          @loss_type = args[:loss_type] if args.key?(:loss_type)
          @max_iterations = args[:max_iterations] if args.key?(:max_iterations)
          @min_relative_progress = args[:min_relative_progress] if args.key?(:min_relative_progress)
          @model_uri = args[:model_uri] if args.key?(:model_uri)
          @num_clusters = args[:num_clusters] if args.key?(:num_clusters)
          @optimization_strategy = args[:optimization_strategy] if args.key?(:optimization_strategy)
          @warm_start = args[:warm_start] if args.key?(:warm_start)
        end
      end
      
      # Information about a single training query run for the model.
      class TrainingRun
        include Google::Apis::Core::Hashable
      
        # Data split result. This contains references to the training and evaluation
        # data tables that were used to train the model.
        # Corresponds to the JSON property `dataSplitResult`
        # @return [Google::Apis::BigqueryV2::DataSplitResult]
        attr_accessor :data_split_result
      
        # Evaluation metrics of a model. These are either computed on all training
        # data or just the eval data based on whether eval data was used during
        # training. These are not present for imported models.
        # Corresponds to the JSON property `evaluationMetrics`
        # @return [Google::Apis::BigqueryV2::EvaluationMetrics]
        attr_accessor :evaluation_metrics
      
        # Output of each iteration run, results.size() <= max_iterations.
        # Corresponds to the JSON property `results`
        # @return [Array<Google::Apis::BigqueryV2::IterationResult>]
        attr_accessor :results
      
        # The start time of this training run.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # Options that were used for this training run, includes
        # user specified and default options that were used.
        # Corresponds to the JSON property `trainingOptions`
        # @return [Google::Apis::BigqueryV2::TrainingOptions]
        attr_accessor :training_options
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data_split_result = args[:data_split_result] if args.key?(:data_split_result)
          @evaluation_metrics = args[:evaluation_metrics] if args.key?(:evaluation_metrics)
          @results = args[:results] if args.key?(:results)
          @start_time = args[:start_time] if args.key?(:start_time)
          @training_options = args[:training_options] if args.key?(:training_options)
        end
      end
      
      # 
      class UserDefinedFunctionResource
        include Google::Apis::Core::Hashable
      
        # [Pick one] An inline resource that contains code for a user-defined function (
        # UDF). Providing a inline code resource is equivalent to providing a URI for a
        # file containing the same code.
        # Corresponds to the JSON property `inlineCode`
        # @return [String]
        attr_accessor :inline_code
      
        # [Pick one] A code resource to load from a Google Cloud Storage URI (gs://
        # bucket/path).
        # Corresponds to the JSON property `resourceUri`
        # @return [String]
        attr_accessor :resource_uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @inline_code = args[:inline_code] if args.key?(:inline_code)
          @resource_uri = args[:resource_uri] if args.key?(:resource_uri)
        end
      end
      
      # 
      class ViewDefinition
        include Google::Apis::Core::Hashable
      
        # [Required] A query that BigQuery executes when the view is referenced.
        # Corresponds to the JSON property `query`
        # @return [String]
        attr_accessor :query
      
        # Specifies whether to use BigQuery's legacy SQL for this view. The default
        # value is true. If set to false, the view will use BigQuery's standard SQL:
        # https://cloud.google.com/bigquery/sql-reference/ Queries and views that
        # reference this view must use the same flag value.
        # Corresponds to the JSON property `useLegacySql`
        # @return [Boolean]
        attr_accessor :use_legacy_sql
        alias_method :use_legacy_sql?, :use_legacy_sql
      
        # Describes user-defined function resources used in the query.
        # Corresponds to the JSON property `userDefinedFunctionResources`
        # @return [Array<Google::Apis::BigqueryV2::UserDefinedFunctionResource>]
        attr_accessor :user_defined_function_resources
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @query = args[:query] if args.key?(:query)
          @use_legacy_sql = args[:use_legacy_sql] if args.key?(:use_legacy_sql)
          @user_defined_function_resources = args[:user_defined_function_resources] if args.key?(:user_defined_function_resources)
        end
      end
    end
  end
end
