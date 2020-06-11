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
    module DlpV2
      
      # A task to execute on the completion of a job.
      # See https://cloud.google.com/dlp/docs/concepts-actions to learn more.
      class GooglePrivacyDlpV2Action
        include Google::Apis::Core::Hashable
      
        # Enable email notification to project owners and editors on jobs's
        # completion/failure.
        # Corresponds to the JSON property `jobNotificationEmails`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2JobNotificationEmails]
        attr_accessor :job_notification_emails
      
        # Publish a message into given Pub/Sub topic when DlpJob has completed. The
        # message contains a single field, `DlpJobName`, which is equal to the
        # finished job's
        # [`DlpJob.name`](/dlp/docs/reference/rest/v2/projects.dlpJobs#DlpJob).
        # Compatible with: Inspect, Risk
        # Corresponds to the JSON property `pubSub`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2PublishToPubSub]
        attr_accessor :pub_sub
      
        # Publish findings of a DlpJob to Cloud Data Catalog. Labels summarizing the
        # results of the DlpJob will be applied to the entry for the resource scanned
        # in Cloud Data Catalog. Any labels previously written by another DlpJob will
        # be deleted. InfoType naming patterns are strictly enforced when using this
        # feature. Note that the findings will be persisted in Cloud Data Catalog
        # storage and are governed by Data Catalog service-specific policy, see
        # https://cloud.google.com/terms/service-terms
        # Only a single instance of this action can be specified and only allowed if
        # all resources being scanned are BigQuery tables.
        # Compatible with: Inspect
        # Corresponds to the JSON property `publishFindingsToCloudDataCatalog`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2PublishFindingsToCloudDataCatalog]
        attr_accessor :publish_findings_to_cloud_data_catalog
      
        # Publish the result summary of a DlpJob to the Cloud Security
        # Command Center (CSCC Alpha).
        # This action is only available for projects which are parts of
        # an organization and whitelisted for the alpha Cloud Security Command
        # Center.
        # The action will publish count of finding instances and their info types.
        # The summary of findings will be persisted in CSCC and are governed by CSCC
        # service-specific policy, see https://cloud.google.com/terms/service-terms
        # Only a single instance of this action can be specified.
        # Compatible with: Inspect
        # Corresponds to the JSON property `publishSummaryToCscc`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2PublishSummaryToCscc]
        attr_accessor :publish_summary_to_cscc
      
        # Enable Stackdriver metric dlp.googleapis.com/finding_count. This
        # will publish a metric to stack driver on each infotype requested and
        # how many findings were found for it. CustomDetectors will be bucketed
        # as 'Custom' under the Stackdriver label 'info_type'.
        # Corresponds to the JSON property `publishToStackdriver`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2PublishToStackdriver]
        attr_accessor :publish_to_stackdriver
      
        # If set, the detailed findings will be persisted to the specified
        # OutputStorageConfig. Only a single instance of this action can be
        # specified.
        # Compatible with: Inspect, Risk
        # Corresponds to the JSON property `saveFindings`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2SaveFindings]
        attr_accessor :save_findings
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @job_notification_emails = args[:job_notification_emails] if args.key?(:job_notification_emails)
          @pub_sub = args[:pub_sub] if args.key?(:pub_sub)
          @publish_findings_to_cloud_data_catalog = args[:publish_findings_to_cloud_data_catalog] if args.key?(:publish_findings_to_cloud_data_catalog)
          @publish_summary_to_cscc = args[:publish_summary_to_cscc] if args.key?(:publish_summary_to_cscc)
          @publish_to_stackdriver = args[:publish_to_stackdriver] if args.key?(:publish_to_stackdriver)
          @save_findings = args[:save_findings] if args.key?(:save_findings)
        end
      end
      
      # Request message for ActivateJobTrigger.
      class GooglePrivacyDlpV2ActivateJobTriggerRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Result of a risk analysis operation request.
      class GooglePrivacyDlpV2AnalyzeDataSourceRiskDetails
        include Google::Apis::Core::Hashable
      
        # Result of the categorical stats computation.
        # Corresponds to the JSON property `categoricalStatsResult`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2CategoricalStatsResult]
        attr_accessor :categorical_stats_result
      
        # Result of the δ-presence computation. Note that these results are an
        # estimation, not exact values.
        # Corresponds to the JSON property `deltaPresenceEstimationResult`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2DeltaPresenceEstimationResult]
        attr_accessor :delta_presence_estimation_result
      
        # Result of the k-anonymity computation.
        # Corresponds to the JSON property `kAnonymityResult`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2KAnonymityResult]
        attr_accessor :k_anonymity_result
      
        # Result of the reidentifiability analysis. Note that these results are an
        # estimation, not exact values.
        # Corresponds to the JSON property `kMapEstimationResult`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2KMapEstimationResult]
        attr_accessor :k_map_estimation_result
      
        # Result of the l-diversity computation.
        # Corresponds to the JSON property `lDiversityResult`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2LDiversityResult]
        attr_accessor :l_diversity_result
      
        # Result of the numerical stats computation.
        # Corresponds to the JSON property `numericalStatsResult`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2NumericalStatsResult]
        attr_accessor :numerical_stats_result
      
        # Privacy metric to compute for reidentification risk analysis.
        # Corresponds to the JSON property `requestedPrivacyMetric`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2PrivacyMetric]
        attr_accessor :requested_privacy_metric
      
        # Message defining the location of a BigQuery table. A table is uniquely
        # identified  by its project_id, dataset_id, and table_name. Within a query
        # a table is often referenced with a string in the format of:
        # `<project_id>:<dataset_id>.<table_id>` or
        # `<project_id>.<dataset_id>.<table_id>`.
        # Corresponds to the JSON property `requestedSourceTable`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2BigQueryTable]
        attr_accessor :requested_source_table
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @categorical_stats_result = args[:categorical_stats_result] if args.key?(:categorical_stats_result)
          @delta_presence_estimation_result = args[:delta_presence_estimation_result] if args.key?(:delta_presence_estimation_result)
          @k_anonymity_result = args[:k_anonymity_result] if args.key?(:k_anonymity_result)
          @k_map_estimation_result = args[:k_map_estimation_result] if args.key?(:k_map_estimation_result)
          @l_diversity_result = args[:l_diversity_result] if args.key?(:l_diversity_result)
          @numerical_stats_result = args[:numerical_stats_result] if args.key?(:numerical_stats_result)
          @requested_privacy_metric = args[:requested_privacy_metric] if args.key?(:requested_privacy_metric)
          @requested_source_table = args[:requested_source_table] if args.key?(:requested_source_table)
        end
      end
      
      # An auxiliary table contains statistical information on the relative
      # frequency of different quasi-identifiers values. It has one or several
      # quasi-identifiers columns, and one column that indicates the relative
      # frequency of each quasi-identifier tuple.
      # If a tuple is present in the data but not in the auxiliary table, the
      # corresponding relative frequency is assumed to be zero (and thus, the
      # tuple is highly reidentifiable).
      class GooglePrivacyDlpV2AuxiliaryTable
        include Google::Apis::Core::Hashable
      
        # Quasi-identifier columns. [required]
        # Corresponds to the JSON property `quasiIds`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2QuasiIdField>]
        attr_accessor :quasi_ids
      
        # General identifier of a data field in a storage service.
        # Corresponds to the JSON property `relativeFrequency`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId]
        attr_accessor :relative_frequency
      
        # Message defining the location of a BigQuery table. A table is uniquely
        # identified  by its project_id, dataset_id, and table_name. Within a query
        # a table is often referenced with a string in the format of:
        # `<project_id>:<dataset_id>.<table_id>` or
        # `<project_id>.<dataset_id>.<table_id>`.
        # Corresponds to the JSON property `table`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2BigQueryTable]
        attr_accessor :table
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @quasi_ids = args[:quasi_ids] if args.key?(:quasi_ids)
          @relative_frequency = args[:relative_frequency] if args.key?(:relative_frequency)
          @table = args[:table] if args.key?(:table)
        end
      end
      
      # Message defining a field of a BigQuery table.
      class GooglePrivacyDlpV2BigQueryField
        include Google::Apis::Core::Hashable
      
        # General identifier of a data field in a storage service.
        # Corresponds to the JSON property `field`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId]
        attr_accessor :field
      
        # Message defining the location of a BigQuery table. A table is uniquely
        # identified  by its project_id, dataset_id, and table_name. Within a query
        # a table is often referenced with a string in the format of:
        # `<project_id>:<dataset_id>.<table_id>` or
        # `<project_id>.<dataset_id>.<table_id>`.
        # Corresponds to the JSON property `table`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2BigQueryTable]
        attr_accessor :table
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @field = args[:field] if args.key?(:field)
          @table = args[:table] if args.key?(:table)
        end
      end
      
      # Row key for identifying a record in BigQuery table.
      class GooglePrivacyDlpV2BigQueryKey
        include Google::Apis::Core::Hashable
      
        # Absolute number of the row from the beginning of the table at the time
        # of scanning.
        # Corresponds to the JSON property `rowNumber`
        # @return [Fixnum]
        attr_accessor :row_number
      
        # Message defining the location of a BigQuery table. A table is uniquely
        # identified  by its project_id, dataset_id, and table_name. Within a query
        # a table is often referenced with a string in the format of:
        # `<project_id>:<dataset_id>.<table_id>` or
        # `<project_id>.<dataset_id>.<table_id>`.
        # Corresponds to the JSON property `tableReference`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2BigQueryTable]
        attr_accessor :table_reference
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @row_number = args[:row_number] if args.key?(:row_number)
          @table_reference = args[:table_reference] if args.key?(:table_reference)
        end
      end
      
      # Options defining BigQuery table and row identifiers.
      class GooglePrivacyDlpV2BigQueryOptions
        include Google::Apis::Core::Hashable
      
        # References to fields excluded from scanning. This allows you to skip
        # inspection of entire columns which you know have no findings.
        # Corresponds to the JSON property `excludedFields`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId>]
        attr_accessor :excluded_fields
      
        # References to fields uniquely identifying rows within the table.
        # Nested fields in the format, like `person.birthdate.year`, are allowed.
        # Corresponds to the JSON property `identifyingFields`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId>]
        attr_accessor :identifying_fields
      
        # Max number of rows to scan. If the table has more rows than this value, the
        # rest of the rows are omitted. If not set, or if set to 0, all rows will be
        # scanned. Only one of rows_limit and rows_limit_percent can be specified.
        # Cannot be used in conjunction with TimespanConfig.
        # Corresponds to the JSON property `rowsLimit`
        # @return [Fixnum]
        attr_accessor :rows_limit
      
        # Max percentage of rows to scan. The rest are omitted. The number of rows
        # scanned is rounded down. Must be between 0 and 100, inclusively. Both 0 and
        # 100 means no limit. Defaults to 0. Only one of rows_limit and
        # rows_limit_percent can be specified. Cannot be used in conjunction with
        # TimespanConfig.
        # Corresponds to the JSON property `rowsLimitPercent`
        # @return [Fixnum]
        attr_accessor :rows_limit_percent
      
        # 
        # Corresponds to the JSON property `sampleMethod`
        # @return [String]
        attr_accessor :sample_method
      
        # Message defining the location of a BigQuery table. A table is uniquely
        # identified  by its project_id, dataset_id, and table_name. Within a query
        # a table is often referenced with a string in the format of:
        # `<project_id>:<dataset_id>.<table_id>` or
        # `<project_id>.<dataset_id>.<table_id>`.
        # Corresponds to the JSON property `tableReference`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2BigQueryTable]
        attr_accessor :table_reference
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @excluded_fields = args[:excluded_fields] if args.key?(:excluded_fields)
          @identifying_fields = args[:identifying_fields] if args.key?(:identifying_fields)
          @rows_limit = args[:rows_limit] if args.key?(:rows_limit)
          @rows_limit_percent = args[:rows_limit_percent] if args.key?(:rows_limit_percent)
          @sample_method = args[:sample_method] if args.key?(:sample_method)
          @table_reference = args[:table_reference] if args.key?(:table_reference)
        end
      end
      
      # Message defining the location of a BigQuery table. A table is uniquely
      # identified  by its project_id, dataset_id, and table_name. Within a query
      # a table is often referenced with a string in the format of:
      # `<project_id>:<dataset_id>.<table_id>` or
      # `<project_id>.<dataset_id>.<table_id>`.
      class GooglePrivacyDlpV2BigQueryTable
        include Google::Apis::Core::Hashable
      
        # Dataset ID of the table.
        # Corresponds to the JSON property `datasetId`
        # @return [String]
        attr_accessor :dataset_id
      
        # The Google Cloud Platform project ID of the project containing the table.
        # If omitted, project ID is inferred from the API call.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Name of the table.
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
      
      # Bounding box encompassing detected text within an image.
      class GooglePrivacyDlpV2BoundingBox
        include Google::Apis::Core::Hashable
      
        # Height of the bounding box in pixels.
        # Corresponds to the JSON property `height`
        # @return [Fixnum]
        attr_accessor :height
      
        # Left coordinate of the bounding box. (0,0) is upper left.
        # Corresponds to the JSON property `left`
        # @return [Fixnum]
        attr_accessor :left
      
        # Top coordinate of the bounding box. (0,0) is upper left.
        # Corresponds to the JSON property `top`
        # @return [Fixnum]
        attr_accessor :top
      
        # Width of the bounding box in pixels.
        # Corresponds to the JSON property `width`
        # @return [Fixnum]
        attr_accessor :width
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @height = args[:height] if args.key?(:height)
          @left = args[:left] if args.key?(:left)
          @top = args[:top] if args.key?(:top)
          @width = args[:width] if args.key?(:width)
        end
      end
      
      # Bucket is represented as a range, along with replacement values.
      class GooglePrivacyDlpV2Bucket
        include Google::Apis::Core::Hashable
      
        # Set of primitive values supported by the system.
        # Note that for the purposes of inspection or transformation, the number
        # of bytes considered to comprise a 'Value' is based on its representation
        # as a UTF-8 encoded string. For example, if 'integer_value' is set to
        # 123456789, the number of bytes would be counted as 9, even though an
        # int64 only holds up to 8 bytes of data.
        # Corresponds to the JSON property `max`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2Value]
        attr_accessor :max
      
        # Set of primitive values supported by the system.
        # Note that for the purposes of inspection or transformation, the number
        # of bytes considered to comprise a 'Value' is based on its representation
        # as a UTF-8 encoded string. For example, if 'integer_value' is set to
        # 123456789, the number of bytes would be counted as 9, even though an
        # int64 only holds up to 8 bytes of data.
        # Corresponds to the JSON property `min`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2Value]
        attr_accessor :min
      
        # Set of primitive values supported by the system.
        # Note that for the purposes of inspection or transformation, the number
        # of bytes considered to comprise a 'Value' is based on its representation
        # as a UTF-8 encoded string. For example, if 'integer_value' is set to
        # 123456789, the number of bytes would be counted as 9, even though an
        # int64 only holds up to 8 bytes of data.
        # Corresponds to the JSON property `replacementValue`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2Value]
        attr_accessor :replacement_value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @max = args[:max] if args.key?(:max)
          @min = args[:min] if args.key?(:min)
          @replacement_value = args[:replacement_value] if args.key?(:replacement_value)
        end
      end
      
      # Generalization function that buckets values based on ranges. The ranges and
      # replacement values are dynamically provided by the user for custom behavior,
      # such as 1-30 -> LOW 31-65 -> MEDIUM 66-100 -> HIGH
      # This can be used on
      # data of type: number, long, string, timestamp.
      # If the bound `Value` type differs from the type of data being transformed, we
      # will first attempt converting the type of the data to be transformed to match
      # the type of the bound before comparing.
      # See https://cloud.google.com/dlp/docs/concepts-bucketing to learn more.
      class GooglePrivacyDlpV2BucketingConfig
        include Google::Apis::Core::Hashable
      
        # Set of buckets. Ranges must be non-overlapping.
        # Corresponds to the JSON property `buckets`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2Bucket>]
        attr_accessor :buckets
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @buckets = args[:buckets] if args.key?(:buckets)
        end
      end
      
      # Container for bytes to inspect or redact.
      class GooglePrivacyDlpV2ByteContentItem
        include Google::Apis::Core::Hashable
      
        # Content data to inspect or redact.
        # Corresponds to the JSON property `data`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :data
      
        # The type of data stored in the bytes string. Default will be TEXT_UTF8.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data = args[:data] if args.key?(:data)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # The request message for canceling a DLP job.
      class GooglePrivacyDlpV2CancelDlpJobRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Compute numerical stats over an individual column, including
      # number of distinct values and value count distribution.
      class GooglePrivacyDlpV2CategoricalStatsConfig
        include Google::Apis::Core::Hashable
      
        # General identifier of a data field in a storage service.
        # Corresponds to the JSON property `field`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId]
        attr_accessor :field
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @field = args[:field] if args.key?(:field)
        end
      end
      
      # 
      class GooglePrivacyDlpV2CategoricalStatsHistogramBucket
        include Google::Apis::Core::Hashable
      
        # Total number of values in this bucket.
        # Corresponds to the JSON property `bucketSize`
        # @return [Fixnum]
        attr_accessor :bucket_size
      
        # Total number of distinct values in this bucket.
        # Corresponds to the JSON property `bucketValueCount`
        # @return [Fixnum]
        attr_accessor :bucket_value_count
      
        # Sample of value frequencies in this bucket. The total number of
        # values returned per bucket is capped at 20.
        # Corresponds to the JSON property `bucketValues`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2ValueFrequency>]
        attr_accessor :bucket_values
      
        # Lower bound on the value frequency of the values in this bucket.
        # Corresponds to the JSON property `valueFrequencyLowerBound`
        # @return [Fixnum]
        attr_accessor :value_frequency_lower_bound
      
        # Upper bound on the value frequency of the values in this bucket.
        # Corresponds to the JSON property `valueFrequencyUpperBound`
        # @return [Fixnum]
        attr_accessor :value_frequency_upper_bound
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bucket_size = args[:bucket_size] if args.key?(:bucket_size)
          @bucket_value_count = args[:bucket_value_count] if args.key?(:bucket_value_count)
          @bucket_values = args[:bucket_values] if args.key?(:bucket_values)
          @value_frequency_lower_bound = args[:value_frequency_lower_bound] if args.key?(:value_frequency_lower_bound)
          @value_frequency_upper_bound = args[:value_frequency_upper_bound] if args.key?(:value_frequency_upper_bound)
        end
      end
      
      # Result of the categorical stats computation.
      class GooglePrivacyDlpV2CategoricalStatsResult
        include Google::Apis::Core::Hashable
      
        # Histogram of value frequencies in the column.
        # Corresponds to the JSON property `valueFrequencyHistogramBuckets`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2CategoricalStatsHistogramBucket>]
        attr_accessor :value_frequency_histogram_buckets
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @value_frequency_histogram_buckets = args[:value_frequency_histogram_buckets] if args.key?(:value_frequency_histogram_buckets)
        end
      end
      
      # Partially mask a string by replacing a given number of characters with a
      # fixed character. Masking can start from the beginning or end of the string.
      # This can be used on data of any type (numbers, longs, and so on) and when
      # de-identifying structured data we'll attempt to preserve the original data's
      # type. (This allows you to take a long like 123 and modify it to a string like
      # **3.
      class GooglePrivacyDlpV2CharacterMaskConfig
        include Google::Apis::Core::Hashable
      
        # When masking a string, items in this list will be skipped when replacing
        # characters. For example, if the input string is `555-555-5555` and you
        # instruct Cloud DLP to skip `-` and mask 5 characters with `*`, Cloud DLP
        # returns `***-**5-5555`.
        # Corresponds to the JSON property `charactersToIgnore`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2CharsToIgnore>]
        attr_accessor :characters_to_ignore
      
        # Character to use to mask the sensitive values&mdash;for example, `*` for an
        # alphabetic string such as a name, or `0` for a numeric string such as ZIP
        # code or credit card number. This string must have a length of 1. If not
        # supplied, this value defaults to `*` for strings, and `0` for digits.
        # Corresponds to the JSON property `maskingCharacter`
        # @return [String]
        attr_accessor :masking_character
      
        # Number of characters to mask. If not set, all matching chars will be
        # masked. Skipped characters do not count towards this tally.
        # Corresponds to the JSON property `numberToMask`
        # @return [Fixnum]
        attr_accessor :number_to_mask
      
        # Mask characters in reverse order. For example, if `masking_character` is
        # `0`, `number_to_mask` is `14`, and `reverse_order` is `false`, then the
        # input string `1234-5678-9012-3456` is masked as `00000000000000-3456`.
        # If `masking_character` is `*`, `number_to_mask` is `3`, and `reverse_order`
        # is `true`, then the string `12345` is masked as `12***`.
        # Corresponds to the JSON property `reverseOrder`
        # @return [Boolean]
        attr_accessor :reverse_order
        alias_method :reverse_order?, :reverse_order
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @characters_to_ignore = args[:characters_to_ignore] if args.key?(:characters_to_ignore)
          @masking_character = args[:masking_character] if args.key?(:masking_character)
          @number_to_mask = args[:number_to_mask] if args.key?(:number_to_mask)
          @reverse_order = args[:reverse_order] if args.key?(:reverse_order)
        end
      end
      
      # Characters to skip when doing deidentification of a value. These will be left
      # alone and skipped.
      class GooglePrivacyDlpV2CharsToIgnore
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `charactersToSkip`
        # @return [String]
        attr_accessor :characters_to_skip
      
        # 
        # Corresponds to the JSON property `commonCharactersToIgnore`
        # @return [String]
        attr_accessor :common_characters_to_ignore
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @characters_to_skip = args[:characters_to_skip] if args.key?(:characters_to_skip)
          @common_characters_to_ignore = args[:common_characters_to_ignore] if args.key?(:common_characters_to_ignore)
        end
      end
      
      # Message representing a set of files in Cloud Storage.
      class GooglePrivacyDlpV2CloudStorageFileSet
        include Google::Apis::Core::Hashable
      
        # The url, in the format `gs://<bucket>/<path>`. Trailing wildcard in the
        # path is allowed.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # Options defining a file or a set of files within a Google Cloud Storage
      # bucket.
      class GooglePrivacyDlpV2CloudStorageOptions
        include Google::Apis::Core::Hashable
      
        # Max number of bytes to scan from a file. If a scanned file's size is bigger
        # than this value then the rest of the bytes are omitted. Only one
        # of bytes_limit_per_file and bytes_limit_per_file_percent can be specified.
        # Corresponds to the JSON property `bytesLimitPerFile`
        # @return [Fixnum]
        attr_accessor :bytes_limit_per_file
      
        # Max percentage of bytes to scan from a file. The rest are omitted. The
        # number of bytes scanned is rounded down. Must be between 0 and 100,
        # inclusively. Both 0 and 100 means no limit. Defaults to 0. Only one
        # of bytes_limit_per_file and bytes_limit_per_file_percent can be specified.
        # Corresponds to the JSON property `bytesLimitPerFilePercent`
        # @return [Fixnum]
        attr_accessor :bytes_limit_per_file_percent
      
        # Set of files to scan.
        # Corresponds to the JSON property `fileSet`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2FileSet]
        attr_accessor :file_set
      
        # List of file type groups to include in the scan.
        # If empty, all files are scanned and available data format processors
        # are applied. In addition, the binary content of the selected files
        # is always scanned as well.
        # Corresponds to the JSON property `fileTypes`
        # @return [Array<String>]
        attr_accessor :file_types
      
        # Limits the number of files to scan to this percentage of the input FileSet.
        # Number of files scanned is rounded down. Must be between 0 and 100,
        # inclusively. Both 0 and 100 means no limit. Defaults to 0.
        # Corresponds to the JSON property `filesLimitPercent`
        # @return [Fixnum]
        attr_accessor :files_limit_percent
      
        # 
        # Corresponds to the JSON property `sampleMethod`
        # @return [String]
        attr_accessor :sample_method
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bytes_limit_per_file = args[:bytes_limit_per_file] if args.key?(:bytes_limit_per_file)
          @bytes_limit_per_file_percent = args[:bytes_limit_per_file_percent] if args.key?(:bytes_limit_per_file_percent)
          @file_set = args[:file_set] if args.key?(:file_set)
          @file_types = args[:file_types] if args.key?(:file_types)
          @files_limit_percent = args[:files_limit_percent] if args.key?(:files_limit_percent)
          @sample_method = args[:sample_method] if args.key?(:sample_method)
        end
      end
      
      # Message representing a single file or path in Cloud Storage.
      class GooglePrivacyDlpV2CloudStoragePath
        include Google::Apis::Core::Hashable
      
        # A url representing a file or path (no wildcards) in Cloud Storage.
        # Example: gs://[BUCKET_NAME]/dictionary.txt
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @path = args[:path] if args.key?(:path)
        end
      end
      
      # Message representing a set of files in a Cloud Storage bucket. Regular
      # expressions are used to allow fine-grained control over which files in the
      # bucket to include.
      # Included files are those that match at least one item in `include_regex` and
      # do not match any items in `exclude_regex`. Note that a file that matches
      # items from both lists will _not_ be included. For a match to occur, the
      # entire file path (i.e., everything in the url after the bucket name) must
      # match the regular expression.
      # For example, given the input ``bucket_name: "mybucket", include_regex:
      # ["directory1/.*"], exclude_regex:
      # ["directory1/excluded.*"]``:
      # * `gs://mybucket/directory1/myfile` will be included
      # * `gs://mybucket/directory1/directory2/myfile` will be included (`.*` matches
      # across `/`)
      # * `gs://mybucket/directory0/directory1/myfile` will _not_ be included (the
      # full path doesn't match any items in `include_regex`)
      # * `gs://mybucket/directory1/excludedfile` will _not_ be included (the path
      # matches an item in `exclude_regex`)
      # If `include_regex` is left empty, it will match all files by default
      # (this is equivalent to setting `include_regex: [".*"]`).
      # Some other common use cases:
      # * ``bucket_name: "mybucket", exclude_regex: [".*\.pdf"]`` will include all
      # files in `mybucket` except for .pdf files
      # * ``bucket_name: "mybucket", include_regex: ["directory/[^/]+"]`` will
      # include all files directly under `gs://mybucket/directory/`, without matching
      # across `/`
      class GooglePrivacyDlpV2CloudStorageRegexFileSet
        include Google::Apis::Core::Hashable
      
        # The name of a Cloud Storage bucket. Required.
        # Corresponds to the JSON property `bucketName`
        # @return [String]
        attr_accessor :bucket_name
      
        # A list of regular expressions matching file paths to exclude. All files in
        # the bucket that match at least one of these regular expressions will be
        # excluded from the scan.
        # Regular expressions use RE2
        # [syntax](https://github.com/google/re2/wiki/Syntax); a guide can be found
        # under the google/re2 repository on GitHub.
        # Corresponds to the JSON property `excludeRegex`
        # @return [Array<String>]
        attr_accessor :exclude_regex
      
        # A list of regular expressions matching file paths to include. All files in
        # the bucket that match at least one of these regular expressions will be
        # included in the set of files, except for those that also match an item in
        # `exclude_regex`. Leaving this field empty will match all files by default
        # (this is equivalent to including `.*` in the list).
        # Regular expressions use RE2
        # [syntax](https://github.com/google/re2/wiki/Syntax); a guide can be found
        # under the google/re2 repository on GitHub.
        # Corresponds to the JSON property `includeRegex`
        # @return [Array<String>]
        attr_accessor :include_regex
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bucket_name = args[:bucket_name] if args.key?(:bucket_name)
          @exclude_regex = args[:exclude_regex] if args.key?(:exclude_regex)
          @include_regex = args[:include_regex] if args.key?(:include_regex)
        end
      end
      
      # Represents a color in the RGB color space.
      class GooglePrivacyDlpV2Color
        include Google::Apis::Core::Hashable
      
        # The amount of blue in the color as a value in the interval [0, 1].
        # Corresponds to the JSON property `blue`
        # @return [Float]
        attr_accessor :blue
      
        # The amount of green in the color as a value in the interval [0, 1].
        # Corresponds to the JSON property `green`
        # @return [Float]
        attr_accessor :green
      
        # The amount of red in the color as a value in the interval [0, 1].
        # Corresponds to the JSON property `red`
        # @return [Float]
        attr_accessor :red
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @blue = args[:blue] if args.key?(:blue)
          @green = args[:green] if args.key?(:green)
          @red = args[:red] if args.key?(:red)
        end
      end
      
      # The field type of `value` and `field` do not need to match to be
      # considered equal, but not all comparisons are possible.
      # EQUAL_TO and NOT_EQUAL_TO attempt to compare even with incompatible types,
      # but all other comparisons are invalid with incompatible types.
      # A `value` of type:
      # - `string` can be compared against all other types
      # - `boolean` can only be compared against other booleans
      # - `integer` can be compared against doubles or a string if the string value
      # can be parsed as an integer.
      # - `double` can be compared against integers or a string if the string can
      # be parsed as a double.
      # - `Timestamp` can be compared against strings in RFC 3339 date string
      # format.
      # - `TimeOfDay` can be compared against timestamps and strings in the format
      # of 'HH:mm:ss'.
      # If we fail to compare do to type mismatch, a warning will be given and
      # the condition will evaluate to false.
      class GooglePrivacyDlpV2Condition
        include Google::Apis::Core::Hashable
      
        # General identifier of a data field in a storage service.
        # Corresponds to the JSON property `field`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId]
        attr_accessor :field
      
        # Operator used to compare the field or infoType to the value. [required]
        # Corresponds to the JSON property `operator`
        # @return [String]
        attr_accessor :operator
      
        # Set of primitive values supported by the system.
        # Note that for the purposes of inspection or transformation, the number
        # of bytes considered to comprise a 'Value' is based on its representation
        # as a UTF-8 encoded string. For example, if 'integer_value' is set to
        # 123456789, the number of bytes would be counted as 9, even though an
        # int64 only holds up to 8 bytes of data.
        # Corresponds to the JSON property `value`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2Value]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @field = args[:field] if args.key?(:field)
          @operator = args[:operator] if args.key?(:operator)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # A collection of conditions.
      class GooglePrivacyDlpV2Conditions
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `conditions`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2Condition>]
        attr_accessor :conditions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @conditions = args[:conditions] if args.key?(:conditions)
        end
      end
      
      # Container structure for the content to inspect.
      class GooglePrivacyDlpV2ContentItem
        include Google::Apis::Core::Hashable
      
        # Container for bytes to inspect or redact.
        # Corresponds to the JSON property `byteItem`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2ByteContentItem]
        attr_accessor :byte_item
      
        # Structured content to inspect. Up to 50,000 `Value`s per request allowed.
        # See https://cloud.google.com/dlp/docs/inspecting-text#inspecting_a_table to
        # learn more.
        # Corresponds to the JSON property `table`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2Table]
        attr_accessor :table
      
        # String data to inspect or redact.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @byte_item = args[:byte_item] if args.key?(:byte_item)
          @table = args[:table] if args.key?(:table)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Findings container location data.
      class GooglePrivacyDlpV2ContentLocation
        include Google::Apis::Core::Hashable
      
        # Name of the container where the finding is located.
        # The top level name is the source file name or table name. Names of some
        # common storage containers are formatted as follows:
        # * BigQuery tables:  `<project_id>:<dataset_id>.<table_id>`
        # * Cloud Storage files: `gs://<bucket>/<path>`
        # * Datastore namespace: <namespace>
        # Nested names could be absent if the embedded object has no string
        # identifier (for an example an image contained within a document).
        # Corresponds to the JSON property `containerName`
        # @return [String]
        attr_accessor :container_name
      
        # Findings container modification timestamp, if applicable.
        # For Google Cloud Storage contains last file modification timestamp.
        # For BigQuery table contains last_modified_time property.
        # For Datastore - not populated.
        # Corresponds to the JSON property `containerTimestamp`
        # @return [String]
        attr_accessor :container_timestamp
      
        # Findings container version, if available
        # ("generation" for Google Cloud Storage).
        # Corresponds to the JSON property `containerVersion`
        # @return [String]
        attr_accessor :container_version
      
        # Location of a finding within a document.
        # Corresponds to the JSON property `documentLocation`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2DocumentLocation]
        attr_accessor :document_location
      
        # Location of the finding within an image.
        # Corresponds to the JSON property `imageLocation`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2ImageLocation]
        attr_accessor :image_location
      
        # Location of a finding within a row or record.
        # Corresponds to the JSON property `recordLocation`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2RecordLocation]
        attr_accessor :record_location
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @container_name = args[:container_name] if args.key?(:container_name)
          @container_timestamp = args[:container_timestamp] if args.key?(:container_timestamp)
          @container_version = args[:container_version] if args.key?(:container_version)
          @document_location = args[:document_location] if args.key?(:document_location)
          @image_location = args[:image_location] if args.key?(:image_location)
          @record_location = args[:record_location] if args.key?(:record_location)
        end
      end
      
      # Request message for CreateDeidentifyTemplate.
      class GooglePrivacyDlpV2CreateDeidentifyTemplateRequest
        include Google::Apis::Core::Hashable
      
        # The DeidentifyTemplates contains instructions on how to deidentify content.
        # See https://cloud.google.com/dlp/docs/concepts-templates to learn more.
        # Corresponds to the JSON property `deidentifyTemplate`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyTemplate]
        attr_accessor :deidentify_template
      
        # The template id can contain uppercase and lowercase letters,
        # numbers, and hyphens; that is, it must match the regular
        # expression: `[a-zA-Z\\d-_]+`. The maximum length is 100
        # characters. Can be empty to allow the system to generate one.
        # Corresponds to the JSON property `templateId`
        # @return [String]
        attr_accessor :template_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @deidentify_template = args[:deidentify_template] if args.key?(:deidentify_template)
          @template_id = args[:template_id] if args.key?(:template_id)
        end
      end
      
      # Request message for CreateDlpJobRequest. Used to initiate long running
      # jobs such as calculating risk metrics or inspecting Google Cloud
      # Storage.
      class GooglePrivacyDlpV2CreateDlpJobRequest
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `inspectJob`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InspectJobConfig]
        attr_accessor :inspect_job
      
        # The job id can contain uppercase and lowercase letters,
        # numbers, and hyphens; that is, it must match the regular
        # expression: `[a-zA-Z\\d-_]+`. The maximum length is 100
        # characters. Can be empty to allow the system to generate one.
        # Corresponds to the JSON property `jobId`
        # @return [String]
        attr_accessor :job_id
      
        # Configuration for a risk analysis job. See
        # https://cloud.google.com/dlp/docs/concepts-risk-analysis to learn more.
        # Corresponds to the JSON property `riskJob`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2RiskAnalysisJobConfig]
        attr_accessor :risk_job
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @inspect_job = args[:inspect_job] if args.key?(:inspect_job)
          @job_id = args[:job_id] if args.key?(:job_id)
          @risk_job = args[:risk_job] if args.key?(:risk_job)
        end
      end
      
      # Request message for CreateInspectTemplate.
      class GooglePrivacyDlpV2CreateInspectTemplateRequest
        include Google::Apis::Core::Hashable
      
        # The inspectTemplate contains a configuration (set of types of sensitive data
        # to be detected) to be used anywhere you otherwise would normally specify
        # InspectConfig. See https://cloud.google.com/dlp/docs/concepts-templates
        # to learn more.
        # Corresponds to the JSON property `inspectTemplate`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate]
        attr_accessor :inspect_template
      
        # The template id can contain uppercase and lowercase letters,
        # numbers, and hyphens; that is, it must match the regular
        # expression: `[a-zA-Z\\d-_]+`. The maximum length is 100
        # characters. Can be empty to allow the system to generate one.
        # Corresponds to the JSON property `templateId`
        # @return [String]
        attr_accessor :template_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @inspect_template = args[:inspect_template] if args.key?(:inspect_template)
          @template_id = args[:template_id] if args.key?(:template_id)
        end
      end
      
      # Request message for CreateJobTrigger.
      class GooglePrivacyDlpV2CreateJobTriggerRequest
        include Google::Apis::Core::Hashable
      
        # Contains a configuration to make dlp api calls on a repeating basis.
        # See https://cloud.google.com/dlp/docs/concepts-job-triggers to learn more.
        # Corresponds to the JSON property `jobTrigger`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2JobTrigger]
        attr_accessor :job_trigger
      
        # The trigger id can contain uppercase and lowercase letters,
        # numbers, and hyphens; that is, it must match the regular
        # expression: `[a-zA-Z\\d-_]+`. The maximum length is 100
        # characters. Can be empty to allow the system to generate one.
        # Corresponds to the JSON property `triggerId`
        # @return [String]
        attr_accessor :trigger_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @job_trigger = args[:job_trigger] if args.key?(:job_trigger)
          @trigger_id = args[:trigger_id] if args.key?(:trigger_id)
        end
      end
      
      # Request message for CreateStoredInfoType.
      class GooglePrivacyDlpV2CreateStoredInfoTypeRequest
        include Google::Apis::Core::Hashable
      
        # Configuration for a StoredInfoType.
        # Corresponds to the JSON property `config`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoTypeConfig]
        attr_accessor :config
      
        # The storedInfoType ID can contain uppercase and lowercase letters,
        # numbers, and hyphens; that is, it must match the regular
        # expression: `[a-zA-Z\\d-_]+`. The maximum length is 100
        # characters. Can be empty to allow the system to generate one.
        # Corresponds to the JSON property `storedInfoTypeId`
        # @return [String]
        attr_accessor :stored_info_type_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @config = args[:config] if args.key?(:config)
          @stored_info_type_id = args[:stored_info_type_id] if args.key?(:stored_info_type_id)
        end
      end
      
      # Pseudonymization method that generates deterministic encryption for the given
      # input. Outputs a base64 encoded representation of the encrypted output.
      # Uses AES-SIV based on the RFC https://tools.ietf.org/html/rfc5297.
      class GooglePrivacyDlpV2CryptoDeterministicConfig
        include Google::Apis::Core::Hashable
      
        # General identifier of a data field in a storage service.
        # Corresponds to the JSON property `context`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId]
        attr_accessor :context
      
        # This is a data encryption key (DEK) (as opposed to
        # a key encryption key (KEK) stored by KMS).
        # When using KMS to wrap/unwrap DEKs, be sure to set an appropriate
        # IAM policy on the KMS CryptoKey (KEK) to ensure an attacker cannot
        # unwrap the data crypto key.
        # Corresponds to the JSON property `cryptoKey`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2CryptoKey]
        attr_accessor :crypto_key
      
        # Type of information detected by the API.
        # Corresponds to the JSON property `surrogateInfoType`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType]
        attr_accessor :surrogate_info_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @context = args[:context] if args.key?(:context)
          @crypto_key = args[:crypto_key] if args.key?(:crypto_key)
          @surrogate_info_type = args[:surrogate_info_type] if args.key?(:surrogate_info_type)
        end
      end
      
      # Pseudonymization method that generates surrogates via cryptographic hashing.
      # Uses SHA-256.
      # The key size must be either 32 or 64 bytes.
      # Outputs a base64 encoded representation of the hashed output
      # (for example, L7k0BHmF1ha5U3NfGykjro4xWi1MPVQPjhMAZbSV9mM=).
      # Currently, only string and integer values can be hashed.
      # See https://cloud.google.com/dlp/docs/pseudonymization to learn more.
      class GooglePrivacyDlpV2CryptoHashConfig
        include Google::Apis::Core::Hashable
      
        # This is a data encryption key (DEK) (as opposed to
        # a key encryption key (KEK) stored by KMS).
        # When using KMS to wrap/unwrap DEKs, be sure to set an appropriate
        # IAM policy on the KMS CryptoKey (KEK) to ensure an attacker cannot
        # unwrap the data crypto key.
        # Corresponds to the JSON property `cryptoKey`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2CryptoKey]
        attr_accessor :crypto_key
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @crypto_key = args[:crypto_key] if args.key?(:crypto_key)
        end
      end
      
      # This is a data encryption key (DEK) (as opposed to
      # a key encryption key (KEK) stored by KMS).
      # When using KMS to wrap/unwrap DEKs, be sure to set an appropriate
      # IAM policy on the KMS CryptoKey (KEK) to ensure an attacker cannot
      # unwrap the data crypto key.
      class GooglePrivacyDlpV2CryptoKey
        include Google::Apis::Core::Hashable
      
        # Include to use an existing data crypto key wrapped by KMS.
        # The wrapped key must be a 128/192/256 bit key.
        # Authorization requires the following IAM permissions when sending a request
        # to perform a crypto transformation using a kms-wrapped crypto key:
        # dlp.kms.encrypt
        # Corresponds to the JSON property `kmsWrapped`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2KmsWrappedCryptoKey]
        attr_accessor :kms_wrapped
      
        # Use this to have a random data crypto key generated.
        # It will be discarded after the request finishes.
        # Corresponds to the JSON property `transient`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2TransientCryptoKey]
        attr_accessor :transient
      
        # Using raw keys is prone to security risks due to accidentally
        # leaking the key. Choose another type of key if possible.
        # Corresponds to the JSON property `unwrapped`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2UnwrappedCryptoKey]
        attr_accessor :unwrapped
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kms_wrapped = args[:kms_wrapped] if args.key?(:kms_wrapped)
          @transient = args[:transient] if args.key?(:transient)
          @unwrapped = args[:unwrapped] if args.key?(:unwrapped)
        end
      end
      
      # Replaces an identifier with a surrogate using Format Preserving Encryption
      # (FPE) with the FFX mode of operation; however when used in the
      # `ReidentifyContent` API method, it serves the opposite function by reversing
      # the surrogate back into the original identifier. The identifier must be
      # encoded as ASCII. For a given crypto key and context, the same identifier
      # will be replaced with the same surrogate. Identifiers must be at least two
      # characters long. In the case that the identifier is the empty string, it will
      # be skipped. See https://cloud.google.com/dlp/docs/pseudonymization to learn
      # more.
      # Note: We recommend using  CryptoDeterministicConfig for all use cases which
      # do not require preserving the input alphabet space and size, plus warrant
      # referential integrity.
      class GooglePrivacyDlpV2CryptoReplaceFfxFpeConfig
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `commonAlphabet`
        # @return [String]
        attr_accessor :common_alphabet
      
        # General identifier of a data field in a storage service.
        # Corresponds to the JSON property `context`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId]
        attr_accessor :context
      
        # This is a data encryption key (DEK) (as opposed to
        # a key encryption key (KEK) stored by KMS).
        # When using KMS to wrap/unwrap DEKs, be sure to set an appropriate
        # IAM policy on the KMS CryptoKey (KEK) to ensure an attacker cannot
        # unwrap the data crypto key.
        # Corresponds to the JSON property `cryptoKey`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2CryptoKey]
        attr_accessor :crypto_key
      
        # This is supported by mapping these to the alphanumeric characters
        # that the FFX mode natively supports. This happens before/after
        # encryption/decryption.
        # Each character listed must appear only once.
        # Number of characters must be in the range [2, 62].
        # This must be encoded as ASCII.
        # The order of characters does not matter.
        # Corresponds to the JSON property `customAlphabet`
        # @return [String]
        attr_accessor :custom_alphabet
      
        # The native way to select the alphabet. Must be in the range [2, 62].
        # Corresponds to the JSON property `radix`
        # @return [Fixnum]
        attr_accessor :radix
      
        # Type of information detected by the API.
        # Corresponds to the JSON property `surrogateInfoType`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType]
        attr_accessor :surrogate_info_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @common_alphabet = args[:common_alphabet] if args.key?(:common_alphabet)
          @context = args[:context] if args.key?(:context)
          @crypto_key = args[:crypto_key] if args.key?(:crypto_key)
          @custom_alphabet = args[:custom_alphabet] if args.key?(:custom_alphabet)
          @radix = args[:radix] if args.key?(:radix)
          @surrogate_info_type = args[:surrogate_info_type] if args.key?(:surrogate_info_type)
        end
      end
      
      # Custom information type provided by the user. Used to find domain-specific
      # sensitive information configurable to the data in question.
      class GooglePrivacyDlpV2CustomInfoType
        include Google::Apis::Core::Hashable
      
        # Set of detection rules to apply to all findings of this CustomInfoType.
        # Rules are applied in order that they are specified. Not supported for the
        # `surrogate_type` CustomInfoType.
        # Corresponds to the JSON property `detectionRules`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2DetectionRule>]
        attr_accessor :detection_rules
      
        # Custom information type based on a dictionary of words or phrases. This can
        # be used to match sensitive information specific to the data, such as a list
        # of employee IDs or job titles.
        # Dictionary words are case-insensitive and all characters other than letters
        # and digits in the unicode [Basic Multilingual
        # Plane](https://en.wikipedia.org/wiki/Plane_%28Unicode%29#
        # Basic_Multilingual_Plane)
        # will be replaced with whitespace when scanning for matches, so the
        # dictionary phrase "Sam Johnson" will match all three phrases "sam johnson",
        # "Sam, Johnson", and "Sam (Johnson)". Additionally, the characters
        # surrounding any match must be of a different type than the adjacent
        # characters within the word, so letters must be next to non-letters and
        # digits next to non-digits. For example, the dictionary word "jen" will
        # match the first three letters of the text "jen123" but will return no
        # matches for "jennifer".
        # Dictionary words containing a large number of characters that are not
        # letters or digits may result in unexpected findings because such characters
        # are treated as whitespace. The
        # [limits](https://cloud.google.com/dlp/limits) page contains details about
        # the size limits of dictionaries. For dictionaries that do not fit within
        # these constraints, consider using `LargeCustomDictionaryConfig` in the
        # `StoredInfoType` API.
        # Corresponds to the JSON property `dictionary`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2Dictionary]
        attr_accessor :dictionary
      
        # If set to EXCLUSION_TYPE_EXCLUDE this infoType will not cause a finding
        # to be returned. It still can be used for rules matching.
        # Corresponds to the JSON property `exclusionType`
        # @return [String]
        attr_accessor :exclusion_type
      
        # Type of information detected by the API.
        # Corresponds to the JSON property `infoType`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType]
        attr_accessor :info_type
      
        # Likelihood to return for this CustomInfoType. This base value can be
        # altered by a detection rule if the finding meets the criteria specified by
        # the rule. Defaults to `VERY_LIKELY` if not specified.
        # Corresponds to the JSON property `likelihood`
        # @return [String]
        attr_accessor :likelihood
      
        # Message defining a custom regular expression.
        # Corresponds to the JSON property `regex`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2Regex]
        attr_accessor :regex
      
        # A reference to a StoredInfoType to use with scanning.
        # Corresponds to the JSON property `storedType`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2StoredType]
        attr_accessor :stored_type
      
        # Message for detecting output from deidentification transformations
        # such as
        # [`CryptoReplaceFfxFpeConfig`](/dlp/docs/reference/rest/v2/organizations.
        # deidentifyTemplates#cryptoreplaceffxfpeconfig).
        # These types of transformations are
        # those that perform pseudonymization, thereby producing a "surrogate" as
        # output. This should be used in conjunction with a field on the
        # transformation such as `surrogate_info_type`. This CustomInfoType does
        # not support the use of `detection_rules`.
        # Corresponds to the JSON property `surrogateType`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2SurrogateType]
        attr_accessor :surrogate_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @detection_rules = args[:detection_rules] if args.key?(:detection_rules)
          @dictionary = args[:dictionary] if args.key?(:dictionary)
          @exclusion_type = args[:exclusion_type] if args.key?(:exclusion_type)
          @info_type = args[:info_type] if args.key?(:info_type)
          @likelihood = args[:likelihood] if args.key?(:likelihood)
          @regex = args[:regex] if args.key?(:regex)
          @stored_type = args[:stored_type] if args.key?(:stored_type)
          @surrogate_type = args[:surrogate_type] if args.key?(:surrogate_type)
        end
      end
      
      # Record key for a finding in Cloud Datastore.
      class GooglePrivacyDlpV2DatastoreKey
        include Google::Apis::Core::Hashable
      
        # A unique identifier for a Datastore entity.
        # If a key's partition ID or any of its path kinds or names are
        # reserved/read-only, the key is reserved/read-only.
        # A reserved/read-only key is forbidden in certain documented contexts.
        # Corresponds to the JSON property `entityKey`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2Key]
        attr_accessor :entity_key
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entity_key = args[:entity_key] if args.key?(:entity_key)
        end
      end
      
      # Options defining a data set within Google Cloud Datastore.
      class GooglePrivacyDlpV2DatastoreOptions
        include Google::Apis::Core::Hashable
      
        # A representation of a Datastore kind.
        # Corresponds to the JSON property `kind`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2KindExpression]
        attr_accessor :kind
      
        # Datastore partition ID.
        # A partition ID identifies a grouping of entities. The grouping is always
        # by project and namespace, however the namespace ID may be empty.
        # A partition ID contains several dimensions:
        # project ID and namespace ID.
        # Corresponds to the JSON property `partitionId`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2PartitionId]
        attr_accessor :partition_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @partition_id = args[:partition_id] if args.key?(:partition_id)
        end
      end
      
      # Shifts dates by random number of days, with option to be consistent for the
      # same context. See https://cloud.google.com/dlp/docs/concepts-date-shifting
      # to learn more.
      class GooglePrivacyDlpV2DateShiftConfig
        include Google::Apis::Core::Hashable
      
        # General identifier of a data field in a storage service.
        # Corresponds to the JSON property `context`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId]
        attr_accessor :context
      
        # This is a data encryption key (DEK) (as opposed to
        # a key encryption key (KEK) stored by KMS).
        # When using KMS to wrap/unwrap DEKs, be sure to set an appropriate
        # IAM policy on the KMS CryptoKey (KEK) to ensure an attacker cannot
        # unwrap the data crypto key.
        # Corresponds to the JSON property `cryptoKey`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2CryptoKey]
        attr_accessor :crypto_key
      
        # For example, -5 means shift date to at most 5 days back in the past.
        # [Required]
        # Corresponds to the JSON property `lowerBoundDays`
        # @return [Fixnum]
        attr_accessor :lower_bound_days
      
        # Range of shift in days. Actual shift will be selected at random within this
        # range (inclusive ends). Negative means shift to earlier in time. Must not
        # be more than 365250 days (1000 years) each direction.
        # For example, 3 means shift date to at most 3 days into the future.
        # [Required]
        # Corresponds to the JSON property `upperBoundDays`
        # @return [Fixnum]
        attr_accessor :upper_bound_days
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @context = args[:context] if args.key?(:context)
          @crypto_key = args[:crypto_key] if args.key?(:crypto_key)
          @lower_bound_days = args[:lower_bound_days] if args.key?(:lower_bound_days)
          @upper_bound_days = args[:upper_bound_days] if args.key?(:upper_bound_days)
        end
      end
      
      # Message for a date time object.
      # e.g. 2018-01-01, 5th August.
      class GooglePrivacyDlpV2DateTime
        include Google::Apis::Core::Hashable
      
        # Represents a whole or partial calendar date, e.g. a birthday. The time of day
        # and time zone are either specified elsewhere or are not significant. The date
        # is relative to the Proleptic Gregorian Calendar. This can represent:
        # * A full date, with non-zero year, month and day values
        # * A month and day value, with a zero year, e.g. an anniversary
        # * A year on its own, with zero month and day values
        # * A year and month value, with a zero day, e.g. a credit card expiration date
        # Related types are google.type.TimeOfDay and `google.protobuf.Timestamp`.
        # Corresponds to the JSON property `date`
        # @return [Google::Apis::DlpV2::GoogleTypeDate]
        attr_accessor :date
      
        # 
        # Corresponds to the JSON property `dayOfWeek`
        # @return [String]
        attr_accessor :day_of_week
      
        # Represents a time of day. The date and time zone are either not significant
        # or are specified elsewhere. An API may choose to allow leap seconds. Related
        # types are google.type.Date and `google.protobuf.Timestamp`.
        # Corresponds to the JSON property `time`
        # @return [Google::Apis::DlpV2::GoogleTypeTimeOfDay]
        attr_accessor :time
      
        # 
        # Corresponds to the JSON property `timeZone`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2TimeZone]
        attr_accessor :time_zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @date = args[:date] if args.key?(:date)
          @day_of_week = args[:day_of_week] if args.key?(:day_of_week)
          @time = args[:time] if args.key?(:time)
          @time_zone = args[:time_zone] if args.key?(:time_zone)
        end
      end
      
      # The configuration that controls how the data will change.
      class GooglePrivacyDlpV2DeidentifyConfig
        include Google::Apis::Core::Hashable
      
        # A type of transformation that will scan unstructured text and
        # apply various `PrimitiveTransformation`s to each finding, where the
        # transformation is applied to only values that were identified as a specific
        # info_type.
        # Corresponds to the JSON property `infoTypeTransformations`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InfoTypeTransformations]
        attr_accessor :info_type_transformations
      
        # A type of transformation that is applied over structured data such as a
        # table.
        # Corresponds to the JSON property `recordTransformations`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2RecordTransformations]
        attr_accessor :record_transformations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @info_type_transformations = args[:info_type_transformations] if args.key?(:info_type_transformations)
          @record_transformations = args[:record_transformations] if args.key?(:record_transformations)
        end
      end
      
      # Request to de-identify a list of items.
      class GooglePrivacyDlpV2DeidentifyContentRequest
        include Google::Apis::Core::Hashable
      
        # The configuration that controls how the data will change.
        # Corresponds to the JSON property `deidentifyConfig`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyConfig]
        attr_accessor :deidentify_config
      
        # Optional template to use. Any configuration directly specified in
        # deidentify_config will override those set in the template. Singular fields
        # that are set in this request will replace their corresponding fields in the
        # template. Repeated fields are appended. Singular sub-messages and groups
        # are recursively merged.
        # Corresponds to the JSON property `deidentifyTemplateName`
        # @return [String]
        attr_accessor :deidentify_template_name
      
        # Configuration description of the scanning process.
        # When used with redactContent only info_types and min_likelihood are currently
        # used.
        # Corresponds to the JSON property `inspectConfig`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InspectConfig]
        attr_accessor :inspect_config
      
        # Optional template to use. Any configuration directly specified in
        # inspect_config will override those set in the template. Singular fields
        # that are set in this request will replace their corresponding fields in the
        # template. Repeated fields are appended. Singular sub-messages and groups
        # are recursively merged.
        # Corresponds to the JSON property `inspectTemplateName`
        # @return [String]
        attr_accessor :inspect_template_name
      
        # Container structure for the content to inspect.
        # Corresponds to the JSON property `item`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2ContentItem]
        attr_accessor :item
      
        # The geographic location to process de-identification. Reserved for future
        # extensions.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @deidentify_config = args[:deidentify_config] if args.key?(:deidentify_config)
          @deidentify_template_name = args[:deidentify_template_name] if args.key?(:deidentify_template_name)
          @inspect_config = args[:inspect_config] if args.key?(:inspect_config)
          @inspect_template_name = args[:inspect_template_name] if args.key?(:inspect_template_name)
          @item = args[:item] if args.key?(:item)
          @location = args[:location] if args.key?(:location)
        end
      end
      
      # Results of de-identifying a ContentItem.
      class GooglePrivacyDlpV2DeidentifyContentResponse
        include Google::Apis::Core::Hashable
      
        # Container structure for the content to inspect.
        # Corresponds to the JSON property `item`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2ContentItem]
        attr_accessor :item
      
        # Overview of the modifications that occurred.
        # Corresponds to the JSON property `overview`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2TransformationOverview]
        attr_accessor :overview
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @item = args[:item] if args.key?(:item)
          @overview = args[:overview] if args.key?(:overview)
        end
      end
      
      # The DeidentifyTemplates contains instructions on how to deidentify content.
      # See https://cloud.google.com/dlp/docs/concepts-templates to learn more.
      class GooglePrivacyDlpV2DeidentifyTemplate
        include Google::Apis::Core::Hashable
      
        # The creation timestamp of a inspectTemplate, output only field.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # The configuration that controls how the data will change.
        # Corresponds to the JSON property `deidentifyConfig`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyConfig]
        attr_accessor :deidentify_config
      
        # Short description (max 256 chars).
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Display name (max 256 chars).
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The template name. Output only.
        # The template will have one of the following formats:
        # `projects/PROJECT_ID/deidentifyTemplates/TEMPLATE_ID` OR
        # `organizations/ORGANIZATION_ID/deidentifyTemplates/TEMPLATE_ID`
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The last update timestamp of a inspectTemplate, output only field.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @deidentify_config = args[:deidentify_config] if args.key?(:deidentify_config)
          @description = args[:description] if args.key?(:description)
          @display_name = args[:display_name] if args.key?(:display_name)
          @name = args[:name] if args.key?(:name)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # δ-presence metric, used to estimate how likely it is for an attacker to
      # figure out that one given individual appears in a de-identified dataset.
      # Similarly to the k-map metric, we cannot compute δ-presence exactly without
      # knowing the attack dataset, so we use a statistical model instead.
      class GooglePrivacyDlpV2DeltaPresenceEstimationConfig
        include Google::Apis::Core::Hashable
      
        # Several auxiliary tables can be used in the analysis. Each custom_tag
        # used to tag a quasi-identifiers field must appear in exactly one
        # field of one auxiliary table.
        # Corresponds to the JSON property `auxiliaryTables`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2StatisticalTable>]
        attr_accessor :auxiliary_tables
      
        # Fields considered to be quasi-identifiers. No two fields can have the
        # same tag. [required]
        # Corresponds to the JSON property `quasiIds`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2QuasiId>]
        attr_accessor :quasi_ids
      
        # ISO 3166-1 alpha-2 region code to use in the statistical modeling.
        # Required if no column is tagged with a region-specific InfoType (like
        # US_ZIP_5) or a region code.
        # Corresponds to the JSON property `regionCode`
        # @return [String]
        attr_accessor :region_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @auxiliary_tables = args[:auxiliary_tables] if args.key?(:auxiliary_tables)
          @quasi_ids = args[:quasi_ids] if args.key?(:quasi_ids)
          @region_code = args[:region_code] if args.key?(:region_code)
        end
      end
      
      # A DeltaPresenceEstimationHistogramBucket message with the following
      # values:
      # min_probability: 0.1
      # max_probability: 0.2
      # frequency: 42
      # means that there are 42 records for which δ is in [0.1, 0.2). An
      # important particular case is when min_probability = max_probability = 1:
      # then, every individual who shares this quasi-identifier combination is in
      # the dataset.
      class GooglePrivacyDlpV2DeltaPresenceEstimationHistogramBucket
        include Google::Apis::Core::Hashable
      
        # Number of records within these probability bounds.
        # Corresponds to the JSON property `bucketSize`
        # @return [Fixnum]
        attr_accessor :bucket_size
      
        # Total number of distinct quasi-identifier tuple values in this bucket.
        # Corresponds to the JSON property `bucketValueCount`
        # @return [Fixnum]
        attr_accessor :bucket_value_count
      
        # Sample of quasi-identifier tuple values in this bucket. The total
        # number of classes returned per bucket is capped at 20.
        # Corresponds to the JSON property `bucketValues`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2DeltaPresenceEstimationQuasiIdValues>]
        attr_accessor :bucket_values
      
        # Always greater than or equal to min_probability.
        # Corresponds to the JSON property `maxProbability`
        # @return [Float]
        attr_accessor :max_probability
      
        # Between 0 and 1.
        # Corresponds to the JSON property `minProbability`
        # @return [Float]
        attr_accessor :min_probability
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bucket_size = args[:bucket_size] if args.key?(:bucket_size)
          @bucket_value_count = args[:bucket_value_count] if args.key?(:bucket_value_count)
          @bucket_values = args[:bucket_values] if args.key?(:bucket_values)
          @max_probability = args[:max_probability] if args.key?(:max_probability)
          @min_probability = args[:min_probability] if args.key?(:min_probability)
        end
      end
      
      # A tuple of values for the quasi-identifier columns.
      class GooglePrivacyDlpV2DeltaPresenceEstimationQuasiIdValues
        include Google::Apis::Core::Hashable
      
        # The estimated probability that a given individual sharing these
        # quasi-identifier values is in the dataset. This value, typically called
        # δ, is the ratio between the number of records in the dataset with these
        # quasi-identifier values, and the total number of individuals (inside
        # *and* outside the dataset) with these quasi-identifier values.
        # For example, if there are 15 individuals in the dataset who share the
        # same quasi-identifier values, and an estimated 100 people in the entire
        # population with these values, then δ is 0.15.
        # Corresponds to the JSON property `estimatedProbability`
        # @return [Float]
        attr_accessor :estimated_probability
      
        # The quasi-identifier values.
        # Corresponds to the JSON property `quasiIdsValues`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2Value>]
        attr_accessor :quasi_ids_values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @estimated_probability = args[:estimated_probability] if args.key?(:estimated_probability)
          @quasi_ids_values = args[:quasi_ids_values] if args.key?(:quasi_ids_values)
        end
      end
      
      # Result of the δ-presence computation. Note that these results are an
      # estimation, not exact values.
      class GooglePrivacyDlpV2DeltaPresenceEstimationResult
        include Google::Apis::Core::Hashable
      
        # The intervals [min_probability, max_probability) do not overlap. If a
        # value doesn't correspond to any such interval, the associated frequency
        # is zero. For example, the following records:
        # `min_probability: 0, max_probability: 0.1, frequency: 17`
        # `min_probability: 0.2, max_probability: 0.3, frequency: 42`
        # `min_probability: 0.3, max_probability: 0.4, frequency: 99`
        # mean that there are no record with an estimated probability in [0.1, 0.2)
        # nor larger or equal to 0.4.
        # Corresponds to the JSON property `deltaPresenceEstimationHistogram`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2DeltaPresenceEstimationHistogramBucket>]
        attr_accessor :delta_presence_estimation_histogram
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @delta_presence_estimation_histogram = args[:delta_presence_estimation_histogram] if args.key?(:delta_presence_estimation_histogram)
        end
      end
      
      # Deprecated; use `InspectionRuleSet` instead. Rule for modifying a
      # `CustomInfoType` to alter behavior under certain circumstances, depending
      # on the specific details of the rule. Not supported for the `surrogate_type`
      # custom infoType.
      class GooglePrivacyDlpV2DetectionRule
        include Google::Apis::Core::Hashable
      
        # The rule that adjusts the likelihood of findings within a certain
        # proximity of hotwords.
        # Corresponds to the JSON property `hotwordRule`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2HotwordRule]
        attr_accessor :hotword_rule
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @hotword_rule = args[:hotword_rule] if args.key?(:hotword_rule)
        end
      end
      
      # Custom information type based on a dictionary of words or phrases. This can
      # be used to match sensitive information specific to the data, such as a list
      # of employee IDs or job titles.
      # Dictionary words are case-insensitive and all characters other than letters
      # and digits in the unicode [Basic Multilingual
      # Plane](https://en.wikipedia.org/wiki/Plane_%28Unicode%29#
      # Basic_Multilingual_Plane)
      # will be replaced with whitespace when scanning for matches, so the
      # dictionary phrase "Sam Johnson" will match all three phrases "sam johnson",
      # "Sam, Johnson", and "Sam (Johnson)". Additionally, the characters
      # surrounding any match must be of a different type than the adjacent
      # characters within the word, so letters must be next to non-letters and
      # digits next to non-digits. For example, the dictionary word "jen" will
      # match the first three letters of the text "jen123" but will return no
      # matches for "jennifer".
      # Dictionary words containing a large number of characters that are not
      # letters or digits may result in unexpected findings because such characters
      # are treated as whitespace. The
      # [limits](https://cloud.google.com/dlp/limits) page contains details about
      # the size limits of dictionaries. For dictionaries that do not fit within
      # these constraints, consider using `LargeCustomDictionaryConfig` in the
      # `StoredInfoType` API.
      class GooglePrivacyDlpV2Dictionary
        include Google::Apis::Core::Hashable
      
        # Message representing a single file or path in Cloud Storage.
        # Corresponds to the JSON property `cloudStoragePath`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2CloudStoragePath]
        attr_accessor :cloud_storage_path
      
        # Message defining a list of words or phrases to search for in the data.
        # Corresponds to the JSON property `wordList`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2WordList]
        attr_accessor :word_list
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cloud_storage_path = args[:cloud_storage_path] if args.key?(:cloud_storage_path)
          @word_list = args[:word_list] if args.key?(:word_list)
        end
      end
      
      # Combines all of the information about a DLP job.
      class GooglePrivacyDlpV2DlpJob
        include Google::Apis::Core::Hashable
      
        # Time when the job was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Time when the job finished.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # A stream of errors encountered running the job.
        # Corresponds to the JSON property `errors`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2Error>]
        attr_accessor :errors
      
        # The results of an inspect DataSource job.
        # Corresponds to the JSON property `inspectDetails`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InspectDataSourceDetails]
        attr_accessor :inspect_details
      
        # If created by a job trigger, the resource name of the trigger that
        # instantiated the job.
        # Corresponds to the JSON property `jobTriggerName`
        # @return [String]
        attr_accessor :job_trigger_name
      
        # The server-assigned name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Result of a risk analysis operation request.
        # Corresponds to the JSON property `riskDetails`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2AnalyzeDataSourceRiskDetails]
        attr_accessor :risk_details
      
        # Time when the job started.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # State of a job.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # The type of job.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @end_time = args[:end_time] if args.key?(:end_time)
          @errors = args[:errors] if args.key?(:errors)
          @inspect_details = args[:inspect_details] if args.key?(:inspect_details)
          @job_trigger_name = args[:job_trigger_name] if args.key?(:job_trigger_name)
          @name = args[:name] if args.key?(:name)
          @risk_details = args[:risk_details] if args.key?(:risk_details)
          @start_time = args[:start_time] if args.key?(:start_time)
          @state = args[:state] if args.key?(:state)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Location of a finding within a document.
      class GooglePrivacyDlpV2DocumentLocation
        include Google::Apis::Core::Hashable
      
        # Offset of the line, from the beginning of the file, where the finding
        # is located.
        # Corresponds to the JSON property `fileOffset`
        # @return [Fixnum]
        attr_accessor :file_offset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @file_offset = args[:file_offset] if args.key?(:file_offset)
        end
      end
      
      # An entity in a dataset is a field or set of fields that correspond to a
      # single person. For example, in medical records the `EntityId` might be a
      # patient identifier, or for financial records it might be an account
      # identifier. This message is used when generalizations or analysis must take
      # into account that multiple rows correspond to the same entity.
      class GooglePrivacyDlpV2EntityId
        include Google::Apis::Core::Hashable
      
        # General identifier of a data field in a storage service.
        # Corresponds to the JSON property `field`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId]
        attr_accessor :field
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @field = args[:field] if args.key?(:field)
        end
      end
      
      # Details information about an error encountered during job execution or
      # the results of an unsuccessful activation of the JobTrigger.
      # Output only field.
      class GooglePrivacyDlpV2Error
        include Google::Apis::Core::Hashable
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `details`
        # @return [Google::Apis::DlpV2::GoogleRpcStatus]
        attr_accessor :details
      
        # The times the error occurred.
        # Corresponds to the JSON property `timestamps`
        # @return [Array<String>]
        attr_accessor :timestamps
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @details = args[:details] if args.key?(:details)
          @timestamps = args[:timestamps] if args.key?(:timestamps)
        end
      end
      
      # List of exclude infoTypes.
      class GooglePrivacyDlpV2ExcludeInfoTypes
        include Google::Apis::Core::Hashable
      
        # InfoType list in ExclusionRule rule drops a finding when it overlaps or
        # contained within with a finding of an infoType from this list. For
        # example, for `InspectionRuleSet.info_types` containing "PHONE_NUMBER"` and
        # `exclusion_rule` containing `exclude_info_types.info_types` with
        # "EMAIL_ADDRESS" the phone number findings are dropped if they overlap
        # with EMAIL_ADDRESS finding.
        # That leads to "555-222-2222@example.org" to generate only a single
        # finding, namely email address.
        # Corresponds to the JSON property `infoTypes`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType>]
        attr_accessor :info_types
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @info_types = args[:info_types] if args.key?(:info_types)
        end
      end
      
      # The rule that specifies conditions when findings of infoTypes specified in
      # `InspectionRuleSet` are removed from results.
      class GooglePrivacyDlpV2ExclusionRule
        include Google::Apis::Core::Hashable
      
        # Custom information type based on a dictionary of words or phrases. This can
        # be used to match sensitive information specific to the data, such as a list
        # of employee IDs or job titles.
        # Dictionary words are case-insensitive and all characters other than letters
        # and digits in the unicode [Basic Multilingual
        # Plane](https://en.wikipedia.org/wiki/Plane_%28Unicode%29#
        # Basic_Multilingual_Plane)
        # will be replaced with whitespace when scanning for matches, so the
        # dictionary phrase "Sam Johnson" will match all three phrases "sam johnson",
        # "Sam, Johnson", and "Sam (Johnson)". Additionally, the characters
        # surrounding any match must be of a different type than the adjacent
        # characters within the word, so letters must be next to non-letters and
        # digits next to non-digits. For example, the dictionary word "jen" will
        # match the first three letters of the text "jen123" but will return no
        # matches for "jennifer".
        # Dictionary words containing a large number of characters that are not
        # letters or digits may result in unexpected findings because such characters
        # are treated as whitespace. The
        # [limits](https://cloud.google.com/dlp/limits) page contains details about
        # the size limits of dictionaries. For dictionaries that do not fit within
        # these constraints, consider using `LargeCustomDictionaryConfig` in the
        # `StoredInfoType` API.
        # Corresponds to the JSON property `dictionary`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2Dictionary]
        attr_accessor :dictionary
      
        # List of exclude infoTypes.
        # Corresponds to the JSON property `excludeInfoTypes`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2ExcludeInfoTypes]
        attr_accessor :exclude_info_types
      
        # How the rule is applied, see MatchingType documentation for details.
        # Corresponds to the JSON property `matchingType`
        # @return [String]
        attr_accessor :matching_type
      
        # Message defining a custom regular expression.
        # Corresponds to the JSON property `regex`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2Regex]
        attr_accessor :regex
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dictionary = args[:dictionary] if args.key?(:dictionary)
          @exclude_info_types = args[:exclude_info_types] if args.key?(:exclude_info_types)
          @matching_type = args[:matching_type] if args.key?(:matching_type)
          @regex = args[:regex] if args.key?(:regex)
        end
      end
      
      # An expression, consisting or an operator and conditions.
      class GooglePrivacyDlpV2Expressions
        include Google::Apis::Core::Hashable
      
        # A collection of conditions.
        # Corresponds to the JSON property `conditions`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2Conditions]
        attr_accessor :conditions
      
        # The operator to apply to the result of conditions. Default and currently
        # only supported value is `AND`.
        # Corresponds to the JSON property `logicalOperator`
        # @return [String]
        attr_accessor :logical_operator
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @conditions = args[:conditions] if args.key?(:conditions)
          @logical_operator = args[:logical_operator] if args.key?(:logical_operator)
        end
      end
      
      # General identifier of a data field in a storage service.
      class GooglePrivacyDlpV2FieldId
        include Google::Apis::Core::Hashable
      
        # Name describing the field.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # The transformation to apply to the field.
      class GooglePrivacyDlpV2FieldTransformation
        include Google::Apis::Core::Hashable
      
        # A condition for determining whether a transformation should be applied to
        # a field.
        # Corresponds to the JSON property `condition`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2RecordCondition]
        attr_accessor :condition
      
        # Input field(s) to apply the transformation to. [required]
        # Corresponds to the JSON property `fields`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId>]
        attr_accessor :fields
      
        # A type of transformation that will scan unstructured text and
        # apply various `PrimitiveTransformation`s to each finding, where the
        # transformation is applied to only values that were identified as a specific
        # info_type.
        # Corresponds to the JSON property `infoTypeTransformations`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InfoTypeTransformations]
        attr_accessor :info_type_transformations
      
        # A rule for transforming a value.
        # Corresponds to the JSON property `primitiveTransformation`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2PrimitiveTransformation]
        attr_accessor :primitive_transformation
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @condition = args[:condition] if args.key?(:condition)
          @fields = args[:fields] if args.key?(:fields)
          @info_type_transformations = args[:info_type_transformations] if args.key?(:info_type_transformations)
          @primitive_transformation = args[:primitive_transformation] if args.key?(:primitive_transformation)
        end
      end
      
      # Set of files to scan.
      class GooglePrivacyDlpV2FileSet
        include Google::Apis::Core::Hashable
      
        # Message representing a set of files in a Cloud Storage bucket. Regular
        # expressions are used to allow fine-grained control over which files in the
        # bucket to include.
        # Included files are those that match at least one item in `include_regex` and
        # do not match any items in `exclude_regex`. Note that a file that matches
        # items from both lists will _not_ be included. For a match to occur, the
        # entire file path (i.e., everything in the url after the bucket name) must
        # match the regular expression.
        # For example, given the input ``bucket_name: "mybucket", include_regex:
        # ["directory1/.*"], exclude_regex:
        # ["directory1/excluded.*"]``:
        # * `gs://mybucket/directory1/myfile` will be included
        # * `gs://mybucket/directory1/directory2/myfile` will be included (`.*` matches
        # across `/`)
        # * `gs://mybucket/directory0/directory1/myfile` will _not_ be included (the
        # full path doesn't match any items in `include_regex`)
        # * `gs://mybucket/directory1/excludedfile` will _not_ be included (the path
        # matches an item in `exclude_regex`)
        # If `include_regex` is left empty, it will match all files by default
        # (this is equivalent to setting `include_regex: [".*"]`).
        # Some other common use cases:
        # * ``bucket_name: "mybucket", exclude_regex: [".*\.pdf"]`` will include all
        # files in `mybucket` except for .pdf files
        # * ``bucket_name: "mybucket", include_regex: ["directory/[^/]+"]`` will
        # include all files directly under `gs://mybucket/directory/`, without matching
        # across `/`
        # Corresponds to the JSON property `regexFileSet`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2CloudStorageRegexFileSet]
        attr_accessor :regex_file_set
      
        # The Cloud Storage url of the file(s) to scan, in the format
        # `gs://<bucket>/<path>`. Trailing wildcard in the path is allowed.
        # If the url ends in a trailing slash, the bucket or directory represented
        # by the url will be scanned non-recursively (content in sub-directories
        # will not be scanned). This means that `gs://mybucket/` is equivalent to
        # `gs://mybucket/*`, and `gs://mybucket/directory/` is equivalent to
        # `gs://mybucket/directory/*`.
        # Exactly one of `url` or `regex_file_set` must be set.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @regex_file_set = args[:regex_file_set] if args.key?(:regex_file_set)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # Represents a piece of potentially sensitive content.
      class GooglePrivacyDlpV2Finding
        include Google::Apis::Core::Hashable
      
        # Timestamp when finding was detected.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Type of information detected by the API.
        # Corresponds to the JSON property `infoType`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType]
        attr_accessor :info_type
      
        # Confidence of how likely it is that the `info_type` is correct.
        # Corresponds to the JSON property `likelihood`
        # @return [String]
        attr_accessor :likelihood
      
        # Specifies the location of the finding.
        # Corresponds to the JSON property `location`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2Location]
        attr_accessor :location
      
        # The content that was found. Even if the content is not textual, it
        # may be converted to a textual representation here.
        # Provided if `include_quote` is true and the finding is
        # less than or equal to 4096 bytes long. If the finding exceeds 4096 bytes
        # in length, the quote may be omitted.
        # Corresponds to the JSON property `quote`
        # @return [String]
        attr_accessor :quote
      
        # Message for infoType-dependent details parsed from quote.
        # Corresponds to the JSON property `quoteInfo`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2QuoteInfo]
        attr_accessor :quote_info
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @info_type = args[:info_type] if args.key?(:info_type)
          @likelihood = args[:likelihood] if args.key?(:likelihood)
          @location = args[:location] if args.key?(:location)
          @quote = args[:quote] if args.key?(:quote)
          @quote_info = args[:quote_info] if args.key?(:quote_info)
        end
      end
      
      # 
      class GooglePrivacyDlpV2FindingLimits
        include Google::Apis::Core::Hashable
      
        # Configuration of findings limit given for specified infoTypes.
        # Corresponds to the JSON property `maxFindingsPerInfoType`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2InfoTypeLimit>]
        attr_accessor :max_findings_per_info_type
      
        # Max number of findings that will be returned for each item scanned.
        # When set within `InspectDataSourceRequest`,
        # the maximum returned is 2000 regardless if this is set higher.
        # When set within `InspectContentRequest`, this field is ignored.
        # Corresponds to the JSON property `maxFindingsPerItem`
        # @return [Fixnum]
        attr_accessor :max_findings_per_item
      
        # Max number of findings that will be returned per request/job.
        # When set within `InspectContentRequest`, the maximum returned is 2000
        # regardless if this is set higher.
        # Corresponds to the JSON property `maxFindingsPerRequest`
        # @return [Fixnum]
        attr_accessor :max_findings_per_request
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @max_findings_per_info_type = args[:max_findings_per_info_type] if args.key?(:max_findings_per_info_type)
          @max_findings_per_item = args[:max_findings_per_item] if args.key?(:max_findings_per_item)
          @max_findings_per_request = args[:max_findings_per_request] if args.key?(:max_findings_per_request)
        end
      end
      
      # Buckets values based on fixed size ranges. The
      # Bucketing transformation can provide all of this functionality,
      # but requires more configuration. This message is provided as a convenience to
      # the user for simple bucketing strategies.
      # The transformed value will be a hyphenated string of
      # <lower_bound>-<upper_bound>, i.e if lower_bound = 10 and upper_bound = 20
      # all values that are within this bucket will be replaced with "10-20".
      # This can be used on data of type: double, long.
      # If the bound Value type differs from the type of data
      # being transformed, we will first attempt converting the type of the data to
      # be transformed to match the type of the bound before comparing.
      # See https://cloud.google.com/dlp/docs/concepts-bucketing to learn more.
      class GooglePrivacyDlpV2FixedSizeBucketingConfig
        include Google::Apis::Core::Hashable
      
        # Size of each bucket (except for minimum and maximum buckets). So if
        # `lower_bound` = 10, `upper_bound` = 89, and `bucket_size` = 10, then the
        # following buckets would be used: -10, 10-20, 20-30, 30-40, 40-50, 50-60,
        # 60-70, 70-80, 80-89, 89+. Precision up to 2 decimals works. [Required].
        # Corresponds to the JSON property `bucketSize`
        # @return [Float]
        attr_accessor :bucket_size
      
        # Set of primitive values supported by the system.
        # Note that for the purposes of inspection or transformation, the number
        # of bytes considered to comprise a 'Value' is based on its representation
        # as a UTF-8 encoded string. For example, if 'integer_value' is set to
        # 123456789, the number of bytes would be counted as 9, even though an
        # int64 only holds up to 8 bytes of data.
        # Corresponds to the JSON property `lowerBound`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2Value]
        attr_accessor :lower_bound
      
        # Set of primitive values supported by the system.
        # Note that for the purposes of inspection or transformation, the number
        # of bytes considered to comprise a 'Value' is based on its representation
        # as a UTF-8 encoded string. For example, if 'integer_value' is set to
        # 123456789, the number of bytes would be counted as 9, even though an
        # int64 only holds up to 8 bytes of data.
        # Corresponds to the JSON property `upperBound`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2Value]
        attr_accessor :upper_bound
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bucket_size = args[:bucket_size] if args.key?(:bucket_size)
          @lower_bound = args[:lower_bound] if args.key?(:lower_bound)
          @upper_bound = args[:upper_bound] if args.key?(:upper_bound)
        end
      end
      
      # The rule that adjusts the likelihood of findings within a certain
      # proximity of hotwords.
      class GooglePrivacyDlpV2HotwordRule
        include Google::Apis::Core::Hashable
      
        # Message defining a custom regular expression.
        # Corresponds to the JSON property `hotwordRegex`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2Regex]
        attr_accessor :hotword_regex
      
        # Message for specifying an adjustment to the likelihood of a finding as
        # part of a detection rule.
        # Corresponds to the JSON property `likelihoodAdjustment`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2LikelihoodAdjustment]
        attr_accessor :likelihood_adjustment
      
        # Message for specifying a window around a finding to apply a detection
        # rule.
        # Corresponds to the JSON property `proximity`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2Proximity]
        attr_accessor :proximity
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @hotword_regex = args[:hotword_regex] if args.key?(:hotword_regex)
          @likelihood_adjustment = args[:likelihood_adjustment] if args.key?(:likelihood_adjustment)
          @proximity = args[:proximity] if args.key?(:proximity)
        end
      end
      
      # Location of the finding within an image.
      class GooglePrivacyDlpV2ImageLocation
        include Google::Apis::Core::Hashable
      
        # Bounding boxes locating the pixels within the image containing the finding.
        # Corresponds to the JSON property `boundingBoxes`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2BoundingBox>]
        attr_accessor :bounding_boxes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_boxes = args[:bounding_boxes] if args.key?(:bounding_boxes)
        end
      end
      
      # Configuration for determining how redaction of images should occur.
      class GooglePrivacyDlpV2ImageRedactionConfig
        include Google::Apis::Core::Hashable
      
        # Type of information detected by the API.
        # Corresponds to the JSON property `infoType`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType]
        attr_accessor :info_type
      
        # If true, all text found in the image, regardless whether it matches an
        # info_type, is redacted. Only one should be provided.
        # Corresponds to the JSON property `redactAllText`
        # @return [Boolean]
        attr_accessor :redact_all_text
        alias_method :redact_all_text?, :redact_all_text
      
        # Represents a color in the RGB color space.
        # Corresponds to the JSON property `redactionColor`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2Color]
        attr_accessor :redaction_color
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @info_type = args[:info_type] if args.key?(:info_type)
          @redact_all_text = args[:redact_all_text] if args.key?(:redact_all_text)
          @redaction_color = args[:redaction_color] if args.key?(:redaction_color)
        end
      end
      
      # Type of information detected by the API.
      class GooglePrivacyDlpV2InfoType
        include Google::Apis::Core::Hashable
      
        # Name of the information type. Either a name of your choosing when
        # creating a CustomInfoType, or one of the names listed
        # at https://cloud.google.com/dlp/docs/infotypes-reference when specifying
        # a built-in type. InfoType names should conform to the pattern
        # [a-zA-Z0-9_]`1,64`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # InfoType description.
      class GooglePrivacyDlpV2InfoTypeDescription
        include Google::Apis::Core::Hashable
      
        # Description of the infotype. Translated when language is provided in the
        # request.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Human readable form of the infoType name.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Internal name of the infoType.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Which parts of the API supports this InfoType.
        # Corresponds to the JSON property `supportedBy`
        # @return [Array<String>]
        attr_accessor :supported_by
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @display_name = args[:display_name] if args.key?(:display_name)
          @name = args[:name] if args.key?(:name)
          @supported_by = args[:supported_by] if args.key?(:supported_by)
        end
      end
      
      # Max findings configuration per infoType, per content item or long
      # running DlpJob.
      class GooglePrivacyDlpV2InfoTypeLimit
        include Google::Apis::Core::Hashable
      
        # Type of information detected by the API.
        # Corresponds to the JSON property `infoType`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType]
        attr_accessor :info_type
      
        # Max findings limit for the given infoType.
        # Corresponds to the JSON property `maxFindings`
        # @return [Fixnum]
        attr_accessor :max_findings
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @info_type = args[:info_type] if args.key?(:info_type)
          @max_findings = args[:max_findings] if args.key?(:max_findings)
        end
      end
      
      # Statistics regarding a specific InfoType.
      class GooglePrivacyDlpV2InfoTypeStats
        include Google::Apis::Core::Hashable
      
        # Number of findings for this infoType.
        # Corresponds to the JSON property `count`
        # @return [Fixnum]
        attr_accessor :count
      
        # Type of information detected by the API.
        # Corresponds to the JSON property `infoType`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType]
        attr_accessor :info_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @count = args[:count] if args.key?(:count)
          @info_type = args[:info_type] if args.key?(:info_type)
        end
      end
      
      # A transformation to apply to text that is identified as a specific
      # info_type.
      class GooglePrivacyDlpV2InfoTypeTransformation
        include Google::Apis::Core::Hashable
      
        # InfoTypes to apply the transformation to. An empty list will cause
        # this transformation to apply to all findings that correspond to
        # infoTypes that were requested in `InspectConfig`.
        # Corresponds to the JSON property `infoTypes`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType>]
        attr_accessor :info_types
      
        # A rule for transforming a value.
        # Corresponds to the JSON property `primitiveTransformation`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2PrimitiveTransformation]
        attr_accessor :primitive_transformation
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @info_types = args[:info_types] if args.key?(:info_types)
          @primitive_transformation = args[:primitive_transformation] if args.key?(:primitive_transformation)
        end
      end
      
      # A type of transformation that will scan unstructured text and
      # apply various `PrimitiveTransformation`s to each finding, where the
      # transformation is applied to only values that were identified as a specific
      # info_type.
      class GooglePrivacyDlpV2InfoTypeTransformations
        include Google::Apis::Core::Hashable
      
        # Transformation for each infoType. Cannot specify more than one
        # for a given infoType. [required]
        # Corresponds to the JSON property `transformations`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2InfoTypeTransformation>]
        attr_accessor :transformations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @transformations = args[:transformations] if args.key?(:transformations)
        end
      end
      
      # Configuration description of the scanning process.
      # When used with redactContent only info_types and min_likelihood are currently
      # used.
      class GooglePrivacyDlpV2InspectConfig
        include Google::Apis::Core::Hashable
      
        # List of options defining data content to scan.
        # If empty, text, images, and other content will be included.
        # Corresponds to the JSON property `contentOptions`
        # @return [Array<String>]
        attr_accessor :content_options
      
        # CustomInfoTypes provided by the user. See
        # https://cloud.google.com/dlp/docs/creating-custom-infotypes to learn more.
        # Corresponds to the JSON property `customInfoTypes`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2CustomInfoType>]
        attr_accessor :custom_info_types
      
        # When true, excludes type information of the findings.
        # Corresponds to the JSON property `excludeInfoTypes`
        # @return [Boolean]
        attr_accessor :exclude_info_types
        alias_method :exclude_info_types?, :exclude_info_types
      
        # When true, a contextual quote from the data that triggered a finding is
        # included in the response; see Finding.quote.
        # Corresponds to the JSON property `includeQuote`
        # @return [Boolean]
        attr_accessor :include_quote
        alias_method :include_quote?, :include_quote
      
        # Restricts what info_types to look for. The values must correspond to
        # InfoType values returned by ListInfoTypes or listed at
        # https://cloud.google.com/dlp/docs/infotypes-reference.
        # When no InfoTypes or CustomInfoTypes are specified in a request, the
        # system may automatically choose what detectors to run. By default this may
        # be all types, but may change over time as detectors are updated.
        # If you need precise control and predictability as to what detectors are
        # run you should specify specific InfoTypes listed in the reference,
        # otherwise a default list will be used, which may change over time.
        # Corresponds to the JSON property `infoTypes`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType>]
        attr_accessor :info_types
      
        # 
        # Corresponds to the JSON property `limits`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2FindingLimits]
        attr_accessor :limits
      
        # Only returns findings equal or above this threshold. The default is
        # POSSIBLE.
        # See https://cloud.google.com/dlp/docs/likelihood to learn more.
        # Corresponds to the JSON property `minLikelihood`
        # @return [String]
        attr_accessor :min_likelihood
      
        # Set of rules to apply to the findings for this InspectConfig.
        # Exclusion rules, contained in the set are executed in the end, other
        # rules are executed in the order they are specified for each info type.
        # Corresponds to the JSON property `ruleSet`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2InspectionRuleSet>]
        attr_accessor :rule_set
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content_options = args[:content_options] if args.key?(:content_options)
          @custom_info_types = args[:custom_info_types] if args.key?(:custom_info_types)
          @exclude_info_types = args[:exclude_info_types] if args.key?(:exclude_info_types)
          @include_quote = args[:include_quote] if args.key?(:include_quote)
          @info_types = args[:info_types] if args.key?(:info_types)
          @limits = args[:limits] if args.key?(:limits)
          @min_likelihood = args[:min_likelihood] if args.key?(:min_likelihood)
          @rule_set = args[:rule_set] if args.key?(:rule_set)
        end
      end
      
      # Request to search for potentially sensitive info in a ContentItem.
      class GooglePrivacyDlpV2InspectContentRequest
        include Google::Apis::Core::Hashable
      
        # Configuration description of the scanning process.
        # When used with redactContent only info_types and min_likelihood are currently
        # used.
        # Corresponds to the JSON property `inspectConfig`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InspectConfig]
        attr_accessor :inspect_config
      
        # Optional template to use. Any configuration directly specified in
        # inspect_config will override those set in the template. Singular fields
        # that are set in this request will replace their corresponding fields in the
        # template. Repeated fields are appended. Singular sub-messages and groups
        # are recursively merged.
        # Corresponds to the JSON property `inspectTemplateName`
        # @return [String]
        attr_accessor :inspect_template_name
      
        # Container structure for the content to inspect.
        # Corresponds to the JSON property `item`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2ContentItem]
        attr_accessor :item
      
        # The geographic location to process content inspection. Reserved for future
        # extensions.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @inspect_config = args[:inspect_config] if args.key?(:inspect_config)
          @inspect_template_name = args[:inspect_template_name] if args.key?(:inspect_template_name)
          @item = args[:item] if args.key?(:item)
          @location = args[:location] if args.key?(:location)
        end
      end
      
      # Results of inspecting an item.
      class GooglePrivacyDlpV2InspectContentResponse
        include Google::Apis::Core::Hashable
      
        # All the findings for a single scanned item.
        # Corresponds to the JSON property `result`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InspectResult]
        attr_accessor :result
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @result = args[:result] if args.key?(:result)
        end
      end
      
      # The results of an inspect DataSource job.
      class GooglePrivacyDlpV2InspectDataSourceDetails
        include Google::Apis::Core::Hashable
      
        # The configuration used for this job.
        # Corresponds to the JSON property `requestedOptions`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2RequestedOptions]
        attr_accessor :requested_options
      
        # All result fields mentioned below are updated while the job is processing.
        # Corresponds to the JSON property `result`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2Result]
        attr_accessor :result
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @requested_options = args[:requested_options] if args.key?(:requested_options)
          @result = args[:result] if args.key?(:result)
        end
      end
      
      # 
      class GooglePrivacyDlpV2InspectJobConfig
        include Google::Apis::Core::Hashable
      
        # Actions to execute at the completion of the job.
        # Corresponds to the JSON property `actions`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2Action>]
        attr_accessor :actions
      
        # Configuration description of the scanning process.
        # When used with redactContent only info_types and min_likelihood are currently
        # used.
        # Corresponds to the JSON property `inspectConfig`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InspectConfig]
        attr_accessor :inspect_config
      
        # If provided, will be used as the default for all values in InspectConfig.
        # `inspect_config` will be merged into the values persisted as part of the
        # template.
        # Corresponds to the JSON property `inspectTemplateName`
        # @return [String]
        attr_accessor :inspect_template_name
      
        # Shared message indicating Cloud storage type.
        # Corresponds to the JSON property `storageConfig`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2StorageConfig]
        attr_accessor :storage_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @actions = args[:actions] if args.key?(:actions)
          @inspect_config = args[:inspect_config] if args.key?(:inspect_config)
          @inspect_template_name = args[:inspect_template_name] if args.key?(:inspect_template_name)
          @storage_config = args[:storage_config] if args.key?(:storage_config)
        end
      end
      
      # All the findings for a single scanned item.
      class GooglePrivacyDlpV2InspectResult
        include Google::Apis::Core::Hashable
      
        # List of findings for an item.
        # Corresponds to the JSON property `findings`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2Finding>]
        attr_accessor :findings
      
        # If true, then this item might have more findings than were returned,
        # and the findings returned are an arbitrary subset of all findings.
        # The findings list might be truncated because the input items were too
        # large, or because the server reached the maximum amount of resources
        # allowed for a single API call. For best results, divide the input into
        # smaller batches.
        # Corresponds to the JSON property `findingsTruncated`
        # @return [Boolean]
        attr_accessor :findings_truncated
        alias_method :findings_truncated?, :findings_truncated
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @findings = args[:findings] if args.key?(:findings)
          @findings_truncated = args[:findings_truncated] if args.key?(:findings_truncated)
        end
      end
      
      # The inspectTemplate contains a configuration (set of types of sensitive data
      # to be detected) to be used anywhere you otherwise would normally specify
      # InspectConfig. See https://cloud.google.com/dlp/docs/concepts-templates
      # to learn more.
      class GooglePrivacyDlpV2InspectTemplate
        include Google::Apis::Core::Hashable
      
        # The creation timestamp of a inspectTemplate, output only field.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Short description (max 256 chars).
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Display name (max 256 chars).
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Configuration description of the scanning process.
        # When used with redactContent only info_types and min_likelihood are currently
        # used.
        # Corresponds to the JSON property `inspectConfig`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InspectConfig]
        attr_accessor :inspect_config
      
        # The template name. Output only.
        # The template will have one of the following formats:
        # `projects/PROJECT_ID/inspectTemplates/TEMPLATE_ID` OR
        # `organizations/ORGANIZATION_ID/inspectTemplates/TEMPLATE_ID`
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The last update timestamp of a inspectTemplate, output only field.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @description = args[:description] if args.key?(:description)
          @display_name = args[:display_name] if args.key?(:display_name)
          @inspect_config = args[:inspect_config] if args.key?(:inspect_config)
          @name = args[:name] if args.key?(:name)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # A single inspection rule to be applied to infoTypes, specified in
      # `InspectionRuleSet`.
      class GooglePrivacyDlpV2InspectionRule
        include Google::Apis::Core::Hashable
      
        # The rule that specifies conditions when findings of infoTypes specified in
        # `InspectionRuleSet` are removed from results.
        # Corresponds to the JSON property `exclusionRule`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2ExclusionRule]
        attr_accessor :exclusion_rule
      
        # The rule that adjusts the likelihood of findings within a certain
        # proximity of hotwords.
        # Corresponds to the JSON property `hotwordRule`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2HotwordRule]
        attr_accessor :hotword_rule
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @exclusion_rule = args[:exclusion_rule] if args.key?(:exclusion_rule)
          @hotword_rule = args[:hotword_rule] if args.key?(:hotword_rule)
        end
      end
      
      # Rule set for modifying a set of infoTypes to alter behavior under certain
      # circumstances, depending on the specific details of the rules within the set.
      class GooglePrivacyDlpV2InspectionRuleSet
        include Google::Apis::Core::Hashable
      
        # List of infoTypes this rule set is applied to.
        # Corresponds to the JSON property `infoTypes`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType>]
        attr_accessor :info_types
      
        # Set of rules to be applied to infoTypes. The rules are applied in order.
        # Corresponds to the JSON property `rules`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2InspectionRule>]
        attr_accessor :rules
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @info_types = args[:info_types] if args.key?(:info_types)
          @rules = args[:rules] if args.key?(:rules)
        end
      end
      
      # Enable email notification to project owners and editors on jobs's
      # completion/failure.
      class GooglePrivacyDlpV2JobNotificationEmails
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Contains a configuration to make dlp api calls on a repeating basis.
      # See https://cloud.google.com/dlp/docs/concepts-job-triggers to learn more.
      class GooglePrivacyDlpV2JobTrigger
        include Google::Apis::Core::Hashable
      
        # The creation timestamp of a triggeredJob, output only field.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # User provided description (max 256 chars)
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Display name (max 100 chars)
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # A stream of errors encountered when the trigger was activated. Repeated
        # errors may result in the JobTrigger automatically being paused.
        # Will return the last 100 errors. Whenever the JobTrigger is modified
        # this list will be cleared. Output only field.
        # Corresponds to the JSON property `errors`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2Error>]
        attr_accessor :errors
      
        # 
        # Corresponds to the JSON property `inspectJob`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InspectJobConfig]
        attr_accessor :inspect_job
      
        # The timestamp of the last time this trigger executed, output only field.
        # Corresponds to the JSON property `lastRunTime`
        # @return [String]
        attr_accessor :last_run_time
      
        # Unique resource name for the triggeredJob, assigned by the service when the
        # triggeredJob is created, for example
        # `projects/dlp-test-project/jobTriggers/53234423`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # A status for this trigger. [required]
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # A list of triggers which will be OR'ed together. Only one in the list
        # needs to trigger for a job to be started. The list may contain only
        # a single Schedule trigger and must have at least one object.
        # Corresponds to the JSON property `triggers`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2Trigger>]
        attr_accessor :triggers
      
        # The last update timestamp of a triggeredJob, output only field.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @description = args[:description] if args.key?(:description)
          @display_name = args[:display_name] if args.key?(:display_name)
          @errors = args[:errors] if args.key?(:errors)
          @inspect_job = args[:inspect_job] if args.key?(:inspect_job)
          @last_run_time = args[:last_run_time] if args.key?(:last_run_time)
          @name = args[:name] if args.key?(:name)
          @status = args[:status] if args.key?(:status)
          @triggers = args[:triggers] if args.key?(:triggers)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # k-anonymity metric, used for analysis of reidentification risk.
      class GooglePrivacyDlpV2KAnonymityConfig
        include Google::Apis::Core::Hashable
      
        # An entity in a dataset is a field or set of fields that correspond to a
        # single person. For example, in medical records the `EntityId` might be a
        # patient identifier, or for financial records it might be an account
        # identifier. This message is used when generalizations or analysis must take
        # into account that multiple rows correspond to the same entity.
        # Corresponds to the JSON property `entityId`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2EntityId]
        attr_accessor :entity_id
      
        # Set of fields to compute k-anonymity over. When multiple fields are
        # specified, they are considered a single composite key. Structs and
        # repeated data types are not supported; however, nested fields are
        # supported so long as they are not structs themselves or nested within
        # a repeated field.
        # Corresponds to the JSON property `quasiIds`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId>]
        attr_accessor :quasi_ids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entity_id = args[:entity_id] if args.key?(:entity_id)
          @quasi_ids = args[:quasi_ids] if args.key?(:quasi_ids)
        end
      end
      
      # The set of columns' values that share the same ldiversity value
      class GooglePrivacyDlpV2KAnonymityEquivalenceClass
        include Google::Apis::Core::Hashable
      
        # Size of the equivalence class, for example number of rows with the
        # above set of values.
        # Corresponds to the JSON property `equivalenceClassSize`
        # @return [Fixnum]
        attr_accessor :equivalence_class_size
      
        # Set of values defining the equivalence class. One value per
        # quasi-identifier column in the original KAnonymity metric message.
        # The order is always the same as the original request.
        # Corresponds to the JSON property `quasiIdsValues`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2Value>]
        attr_accessor :quasi_ids_values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @equivalence_class_size = args[:equivalence_class_size] if args.key?(:equivalence_class_size)
          @quasi_ids_values = args[:quasi_ids_values] if args.key?(:quasi_ids_values)
        end
      end
      
      # 
      class GooglePrivacyDlpV2KAnonymityHistogramBucket
        include Google::Apis::Core::Hashable
      
        # Total number of equivalence classes in this bucket.
        # Corresponds to the JSON property `bucketSize`
        # @return [Fixnum]
        attr_accessor :bucket_size
      
        # Total number of distinct equivalence classes in this bucket.
        # Corresponds to the JSON property `bucketValueCount`
        # @return [Fixnum]
        attr_accessor :bucket_value_count
      
        # Sample of equivalence classes in this bucket. The total number of
        # classes returned per bucket is capped at 20.
        # Corresponds to the JSON property `bucketValues`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2KAnonymityEquivalenceClass>]
        attr_accessor :bucket_values
      
        # Lower bound on the size of the equivalence classes in this bucket.
        # Corresponds to the JSON property `equivalenceClassSizeLowerBound`
        # @return [Fixnum]
        attr_accessor :equivalence_class_size_lower_bound
      
        # Upper bound on the size of the equivalence classes in this bucket.
        # Corresponds to the JSON property `equivalenceClassSizeUpperBound`
        # @return [Fixnum]
        attr_accessor :equivalence_class_size_upper_bound
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bucket_size = args[:bucket_size] if args.key?(:bucket_size)
          @bucket_value_count = args[:bucket_value_count] if args.key?(:bucket_value_count)
          @bucket_values = args[:bucket_values] if args.key?(:bucket_values)
          @equivalence_class_size_lower_bound = args[:equivalence_class_size_lower_bound] if args.key?(:equivalence_class_size_lower_bound)
          @equivalence_class_size_upper_bound = args[:equivalence_class_size_upper_bound] if args.key?(:equivalence_class_size_upper_bound)
        end
      end
      
      # Result of the k-anonymity computation.
      class GooglePrivacyDlpV2KAnonymityResult
        include Google::Apis::Core::Hashable
      
        # Histogram of k-anonymity equivalence classes.
        # Corresponds to the JSON property `equivalenceClassHistogramBuckets`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2KAnonymityHistogramBucket>]
        attr_accessor :equivalence_class_histogram_buckets
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @equivalence_class_histogram_buckets = args[:equivalence_class_histogram_buckets] if args.key?(:equivalence_class_histogram_buckets)
        end
      end
      
      # Reidentifiability metric. This corresponds to a risk model similar to what
      # is called "journalist risk" in the literature, except the attack dataset is
      # statistically modeled instead of being perfectly known. This can be done
      # using publicly available data (like the US Census), or using a custom
      # statistical model (indicated as one or several BigQuery tables), or by
      # extrapolating from the distribution of values in the input dataset.
      # A column with a semantic tag attached.
      class GooglePrivacyDlpV2KMapEstimationConfig
        include Google::Apis::Core::Hashable
      
        # Several auxiliary tables can be used in the analysis. Each custom_tag
        # used to tag a quasi-identifiers column must appear in exactly one column
        # of one auxiliary table.
        # Corresponds to the JSON property `auxiliaryTables`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2AuxiliaryTable>]
        attr_accessor :auxiliary_tables
      
        # Fields considered to be quasi-identifiers. No two columns can have the
        # same tag. [required]
        # Corresponds to the JSON property `quasiIds`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2TaggedField>]
        attr_accessor :quasi_ids
      
        # ISO 3166-1 alpha-2 region code to use in the statistical modeling.
        # Required if no column is tagged with a region-specific InfoType (like
        # US_ZIP_5) or a region code.
        # Corresponds to the JSON property `regionCode`
        # @return [String]
        attr_accessor :region_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @auxiliary_tables = args[:auxiliary_tables] if args.key?(:auxiliary_tables)
          @quasi_ids = args[:quasi_ids] if args.key?(:quasi_ids)
          @region_code = args[:region_code] if args.key?(:region_code)
        end
      end
      
      # A KMapEstimationHistogramBucket message with the following values:
      # min_anonymity: 3
      # max_anonymity: 5
      # frequency: 42
      # means that there are 42 records whose quasi-identifier values correspond
      # to 3, 4 or 5 people in the overlying population. An important particular
      # case is when min_anonymity = max_anonymity = 1: the frequency field then
      # corresponds to the number of uniquely identifiable records.
      class GooglePrivacyDlpV2KMapEstimationHistogramBucket
        include Google::Apis::Core::Hashable
      
        # Number of records within these anonymity bounds.
        # Corresponds to the JSON property `bucketSize`
        # @return [Fixnum]
        attr_accessor :bucket_size
      
        # Total number of distinct quasi-identifier tuple values in this bucket.
        # Corresponds to the JSON property `bucketValueCount`
        # @return [Fixnum]
        attr_accessor :bucket_value_count
      
        # Sample of quasi-identifier tuple values in this bucket. The total
        # number of classes returned per bucket is capped at 20.
        # Corresponds to the JSON property `bucketValues`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2KMapEstimationQuasiIdValues>]
        attr_accessor :bucket_values
      
        # Always greater than or equal to min_anonymity.
        # Corresponds to the JSON property `maxAnonymity`
        # @return [Fixnum]
        attr_accessor :max_anonymity
      
        # Always positive.
        # Corresponds to the JSON property `minAnonymity`
        # @return [Fixnum]
        attr_accessor :min_anonymity
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bucket_size = args[:bucket_size] if args.key?(:bucket_size)
          @bucket_value_count = args[:bucket_value_count] if args.key?(:bucket_value_count)
          @bucket_values = args[:bucket_values] if args.key?(:bucket_values)
          @max_anonymity = args[:max_anonymity] if args.key?(:max_anonymity)
          @min_anonymity = args[:min_anonymity] if args.key?(:min_anonymity)
        end
      end
      
      # A tuple of values for the quasi-identifier columns.
      class GooglePrivacyDlpV2KMapEstimationQuasiIdValues
        include Google::Apis::Core::Hashable
      
        # The estimated anonymity for these quasi-identifier values.
        # Corresponds to the JSON property `estimatedAnonymity`
        # @return [Fixnum]
        attr_accessor :estimated_anonymity
      
        # The quasi-identifier values.
        # Corresponds to the JSON property `quasiIdsValues`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2Value>]
        attr_accessor :quasi_ids_values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @estimated_anonymity = args[:estimated_anonymity] if args.key?(:estimated_anonymity)
          @quasi_ids_values = args[:quasi_ids_values] if args.key?(:quasi_ids_values)
        end
      end
      
      # Result of the reidentifiability analysis. Note that these results are an
      # estimation, not exact values.
      class GooglePrivacyDlpV2KMapEstimationResult
        include Google::Apis::Core::Hashable
      
        # The intervals [min_anonymity, max_anonymity] do not overlap. If a value
        # doesn't correspond to any such interval, the associated frequency is
        # zero. For example, the following records:
        # `min_anonymity: 1, max_anonymity: 1, frequency: 17`
        # `min_anonymity: 2, max_anonymity: 3, frequency: 42`
        # `min_anonymity: 5, max_anonymity: 10, frequency: 99`
        # mean that there are no record with an estimated anonymity of 4, 5, or
        # larger than 10.
        # Corresponds to the JSON property `kMapEstimationHistogram`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2KMapEstimationHistogramBucket>]
        attr_accessor :k_map_estimation_histogram
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @k_map_estimation_histogram = args[:k_map_estimation_histogram] if args.key?(:k_map_estimation_histogram)
        end
      end
      
      # A unique identifier for a Datastore entity.
      # If a key's partition ID or any of its path kinds or names are
      # reserved/read-only, the key is reserved/read-only.
      # A reserved/read-only key is forbidden in certain documented contexts.
      class GooglePrivacyDlpV2Key
        include Google::Apis::Core::Hashable
      
        # Datastore partition ID.
        # A partition ID identifies a grouping of entities. The grouping is always
        # by project and namespace, however the namespace ID may be empty.
        # A partition ID contains several dimensions:
        # project ID and namespace ID.
        # Corresponds to the JSON property `partitionId`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2PartitionId]
        attr_accessor :partition_id
      
        # The entity path.
        # An entity path consists of one or more elements composed of a kind and a
        # string or numerical identifier, which identify entities. The first
        # element identifies a _root entity_, the second element identifies
        # a _child_ of the root entity, the third element identifies a child of the
        # second entity, and so forth. The entities identified by all prefixes of
        # the path are called the element's _ancestors_.
        # A path can never be empty, and a path can have at most 100 elements.
        # Corresponds to the JSON property `path`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2PathElement>]
        attr_accessor :path
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @partition_id = args[:partition_id] if args.key?(:partition_id)
          @path = args[:path] if args.key?(:path)
        end
      end
      
      # A representation of a Datastore kind.
      class GooglePrivacyDlpV2KindExpression
        include Google::Apis::Core::Hashable
      
        # The name of the kind.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Include to use an existing data crypto key wrapped by KMS.
      # The wrapped key must be a 128/192/256 bit key.
      # Authorization requires the following IAM permissions when sending a request
      # to perform a crypto transformation using a kms-wrapped crypto key:
      # dlp.kms.encrypt
      class GooglePrivacyDlpV2KmsWrappedCryptoKey
        include Google::Apis::Core::Hashable
      
        # The resource name of the KMS CryptoKey to use for unwrapping. [required]
        # Corresponds to the JSON property `cryptoKeyName`
        # @return [String]
        attr_accessor :crypto_key_name
      
        # The wrapped data crypto key. [required]
        # Corresponds to the JSON property `wrappedKey`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :wrapped_key
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @crypto_key_name = args[:crypto_key_name] if args.key?(:crypto_key_name)
          @wrapped_key = args[:wrapped_key] if args.key?(:wrapped_key)
        end
      end
      
      # l-diversity metric, used for analysis of reidentification risk.
      class GooglePrivacyDlpV2LDiversityConfig
        include Google::Apis::Core::Hashable
      
        # Set of quasi-identifiers indicating how equivalence classes are
        # defined for the l-diversity computation. When multiple fields are
        # specified, they are considered a single composite key.
        # Corresponds to the JSON property `quasiIds`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId>]
        attr_accessor :quasi_ids
      
        # General identifier of a data field in a storage service.
        # Corresponds to the JSON property `sensitiveAttribute`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId]
        attr_accessor :sensitive_attribute
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @quasi_ids = args[:quasi_ids] if args.key?(:quasi_ids)
          @sensitive_attribute = args[:sensitive_attribute] if args.key?(:sensitive_attribute)
        end
      end
      
      # The set of columns' values that share the same ldiversity value.
      class GooglePrivacyDlpV2LDiversityEquivalenceClass
        include Google::Apis::Core::Hashable
      
        # Size of the k-anonymity equivalence class.
        # Corresponds to the JSON property `equivalenceClassSize`
        # @return [Fixnum]
        attr_accessor :equivalence_class_size
      
        # Number of distinct sensitive values in this equivalence class.
        # Corresponds to the JSON property `numDistinctSensitiveValues`
        # @return [Fixnum]
        attr_accessor :num_distinct_sensitive_values
      
        # Quasi-identifier values defining the k-anonymity equivalence
        # class. The order is always the same as the original request.
        # Corresponds to the JSON property `quasiIdsValues`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2Value>]
        attr_accessor :quasi_ids_values
      
        # Estimated frequencies of top sensitive values.
        # Corresponds to the JSON property `topSensitiveValues`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2ValueFrequency>]
        attr_accessor :top_sensitive_values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @equivalence_class_size = args[:equivalence_class_size] if args.key?(:equivalence_class_size)
          @num_distinct_sensitive_values = args[:num_distinct_sensitive_values] if args.key?(:num_distinct_sensitive_values)
          @quasi_ids_values = args[:quasi_ids_values] if args.key?(:quasi_ids_values)
          @top_sensitive_values = args[:top_sensitive_values] if args.key?(:top_sensitive_values)
        end
      end
      
      # 
      class GooglePrivacyDlpV2LDiversityHistogramBucket
        include Google::Apis::Core::Hashable
      
        # Total number of equivalence classes in this bucket.
        # Corresponds to the JSON property `bucketSize`
        # @return [Fixnum]
        attr_accessor :bucket_size
      
        # Total number of distinct equivalence classes in this bucket.
        # Corresponds to the JSON property `bucketValueCount`
        # @return [Fixnum]
        attr_accessor :bucket_value_count
      
        # Sample of equivalence classes in this bucket. The total number of
        # classes returned per bucket is capped at 20.
        # Corresponds to the JSON property `bucketValues`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2LDiversityEquivalenceClass>]
        attr_accessor :bucket_values
      
        # Lower bound on the sensitive value frequencies of the equivalence
        # classes in this bucket.
        # Corresponds to the JSON property `sensitiveValueFrequencyLowerBound`
        # @return [Fixnum]
        attr_accessor :sensitive_value_frequency_lower_bound
      
        # Upper bound on the sensitive value frequencies of the equivalence
        # classes in this bucket.
        # Corresponds to the JSON property `sensitiveValueFrequencyUpperBound`
        # @return [Fixnum]
        attr_accessor :sensitive_value_frequency_upper_bound
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bucket_size = args[:bucket_size] if args.key?(:bucket_size)
          @bucket_value_count = args[:bucket_value_count] if args.key?(:bucket_value_count)
          @bucket_values = args[:bucket_values] if args.key?(:bucket_values)
          @sensitive_value_frequency_lower_bound = args[:sensitive_value_frequency_lower_bound] if args.key?(:sensitive_value_frequency_lower_bound)
          @sensitive_value_frequency_upper_bound = args[:sensitive_value_frequency_upper_bound] if args.key?(:sensitive_value_frequency_upper_bound)
        end
      end
      
      # Result of the l-diversity computation.
      class GooglePrivacyDlpV2LDiversityResult
        include Google::Apis::Core::Hashable
      
        # Histogram of l-diversity equivalence class sensitive value frequencies.
        # Corresponds to the JSON property `sensitiveValueFrequencyHistogramBuckets`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2LDiversityHistogramBucket>]
        attr_accessor :sensitive_value_frequency_histogram_buckets
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @sensitive_value_frequency_histogram_buckets = args[:sensitive_value_frequency_histogram_buckets] if args.key?(:sensitive_value_frequency_histogram_buckets)
        end
      end
      
      # Configuration for a custom dictionary created from a data source of any size
      # up to the maximum size defined in the
      # [limits](https://cloud.google.com/dlp/limits) page. The artifacts of
      # dictionary creation are stored in the specified Google Cloud Storage
      # location. Consider using `CustomInfoType.Dictionary` for smaller dictionaries
      # that satisfy the size requirements.
      class GooglePrivacyDlpV2LargeCustomDictionaryConfig
        include Google::Apis::Core::Hashable
      
        # Message defining a field of a BigQuery table.
        # Corresponds to the JSON property `bigQueryField`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2BigQueryField]
        attr_accessor :big_query_field
      
        # Message representing a set of files in Cloud Storage.
        # Corresponds to the JSON property `cloudStorageFileSet`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2CloudStorageFileSet]
        attr_accessor :cloud_storage_file_set
      
        # Message representing a single file or path in Cloud Storage.
        # Corresponds to the JSON property `outputPath`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2CloudStoragePath]
        attr_accessor :output_path
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @big_query_field = args[:big_query_field] if args.key?(:big_query_field)
          @cloud_storage_file_set = args[:cloud_storage_file_set] if args.key?(:cloud_storage_file_set)
          @output_path = args[:output_path] if args.key?(:output_path)
        end
      end
      
      # Summary statistics of a custom dictionary.
      class GooglePrivacyDlpV2LargeCustomDictionaryStats
        include Google::Apis::Core::Hashable
      
        # Approximate number of distinct phrases in the dictionary.
        # Corresponds to the JSON property `approxNumPhrases`
        # @return [Fixnum]
        attr_accessor :approx_num_phrases
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @approx_num_phrases = args[:approx_num_phrases] if args.key?(:approx_num_phrases)
        end
      end
      
      # Message for specifying an adjustment to the likelihood of a finding as
      # part of a detection rule.
      class GooglePrivacyDlpV2LikelihoodAdjustment
        include Google::Apis::Core::Hashable
      
        # Set the likelihood of a finding to a fixed value.
        # Corresponds to the JSON property `fixedLikelihood`
        # @return [String]
        attr_accessor :fixed_likelihood
      
        # Increase or decrease the likelihood by the specified number of
        # levels. For example, if a finding would be `POSSIBLE` without the
        # detection rule and `relative_likelihood` is 1, then it is upgraded to
        # `LIKELY`, while a value of -1 would downgrade it to `UNLIKELY`.
        # Likelihood may never drop below `VERY_UNLIKELY` or exceed
        # `VERY_LIKELY`, so applying an adjustment of 1 followed by an
        # adjustment of -1 when base likelihood is `VERY_LIKELY` will result in
        # a final likelihood of `LIKELY`.
        # Corresponds to the JSON property `relativeLikelihood`
        # @return [Fixnum]
        attr_accessor :relative_likelihood
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @fixed_likelihood = args[:fixed_likelihood] if args.key?(:fixed_likelihood)
          @relative_likelihood = args[:relative_likelihood] if args.key?(:relative_likelihood)
        end
      end
      
      # Response message for ListDeidentifyTemplates.
      class GooglePrivacyDlpV2ListDeidentifyTemplatesResponse
        include Google::Apis::Core::Hashable
      
        # List of deidentify templates, up to page_size in
        # ListDeidentifyTemplatesRequest.
        # Corresponds to the JSON property `deidentifyTemplates`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyTemplate>]
        attr_accessor :deidentify_templates
      
        # If the next page is available then the next page token to be used
        # in following ListDeidentifyTemplates request.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @deidentify_templates = args[:deidentify_templates] if args.key?(:deidentify_templates)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The response message for listing DLP jobs.
      class GooglePrivacyDlpV2ListDlpJobsResponse
        include Google::Apis::Core::Hashable
      
        # A list of DlpJobs that matches the specified filter in the request.
        # Corresponds to the JSON property `jobs`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2DlpJob>]
        attr_accessor :jobs
      
        # The standard List next-page token.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @jobs = args[:jobs] if args.key?(:jobs)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response to the ListInfoTypes request.
      class GooglePrivacyDlpV2ListInfoTypesResponse
        include Google::Apis::Core::Hashable
      
        # Set of sensitive infoTypes.
        # Corresponds to the JSON property `infoTypes`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2InfoTypeDescription>]
        attr_accessor :info_types
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @info_types = args[:info_types] if args.key?(:info_types)
        end
      end
      
      # Response message for ListInspectTemplates.
      class GooglePrivacyDlpV2ListInspectTemplatesResponse
        include Google::Apis::Core::Hashable
      
        # List of inspectTemplates, up to page_size in ListInspectTemplatesRequest.
        # Corresponds to the JSON property `inspectTemplates`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate>]
        attr_accessor :inspect_templates
      
        # If the next page is available then the next page token to be used
        # in following ListInspectTemplates request.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @inspect_templates = args[:inspect_templates] if args.key?(:inspect_templates)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response message for ListJobTriggers.
      class GooglePrivacyDlpV2ListJobTriggersResponse
        include Google::Apis::Core::Hashable
      
        # List of triggeredJobs, up to page_size in ListJobTriggersRequest.
        # Corresponds to the JSON property `jobTriggers`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2JobTrigger>]
        attr_accessor :job_triggers
      
        # If the next page is available then the next page token to be used
        # in following ListJobTriggers request.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @job_triggers = args[:job_triggers] if args.key?(:job_triggers)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response message for ListStoredInfoTypes.
      class GooglePrivacyDlpV2ListStoredInfoTypesResponse
        include Google::Apis::Core::Hashable
      
        # If the next page is available then the next page token to be used
        # in following ListStoredInfoTypes request.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # List of storedInfoTypes, up to page_size in ListStoredInfoTypesRequest.
        # Corresponds to the JSON property `storedInfoTypes`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoType>]
        attr_accessor :stored_info_types
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @stored_info_types = args[:stored_info_types] if args.key?(:stored_info_types)
        end
      end
      
      # Specifies the location of the finding.
      class GooglePrivacyDlpV2Location
        include Google::Apis::Core::Hashable
      
        # Generic half-open interval [start, end)
        # Corresponds to the JSON property `byteRange`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2Range]
        attr_accessor :byte_range
      
        # Generic half-open interval [start, end)
        # Corresponds to the JSON property `codepointRange`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2Range]
        attr_accessor :codepoint_range
      
        # List of nested objects pointing to the precise location of the finding
        # within the file or record.
        # Corresponds to the JSON property `contentLocations`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2ContentLocation>]
        attr_accessor :content_locations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @byte_range = args[:byte_range] if args.key?(:byte_range)
          @codepoint_range = args[:codepoint_range] if args.key?(:codepoint_range)
          @content_locations = args[:content_locations] if args.key?(:content_locations)
        end
      end
      
      # Compute numerical stats over an individual column, including
      # min, max, and quantiles.
      class GooglePrivacyDlpV2NumericalStatsConfig
        include Google::Apis::Core::Hashable
      
        # General identifier of a data field in a storage service.
        # Corresponds to the JSON property `field`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId]
        attr_accessor :field
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @field = args[:field] if args.key?(:field)
        end
      end
      
      # Result of the numerical stats computation.
      class GooglePrivacyDlpV2NumericalStatsResult
        include Google::Apis::Core::Hashable
      
        # Set of primitive values supported by the system.
        # Note that for the purposes of inspection or transformation, the number
        # of bytes considered to comprise a 'Value' is based on its representation
        # as a UTF-8 encoded string. For example, if 'integer_value' is set to
        # 123456789, the number of bytes would be counted as 9, even though an
        # int64 only holds up to 8 bytes of data.
        # Corresponds to the JSON property `maxValue`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2Value]
        attr_accessor :max_value
      
        # Set of primitive values supported by the system.
        # Note that for the purposes of inspection or transformation, the number
        # of bytes considered to comprise a 'Value' is based on its representation
        # as a UTF-8 encoded string. For example, if 'integer_value' is set to
        # 123456789, the number of bytes would be counted as 9, even though an
        # int64 only holds up to 8 bytes of data.
        # Corresponds to the JSON property `minValue`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2Value]
        attr_accessor :min_value
      
        # List of 99 values that partition the set of field values into 100 equal
        # sized buckets.
        # Corresponds to the JSON property `quantileValues`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2Value>]
        attr_accessor :quantile_values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @max_value = args[:max_value] if args.key?(:max_value)
          @min_value = args[:min_value] if args.key?(:min_value)
          @quantile_values = args[:quantile_values] if args.key?(:quantile_values)
        end
      end
      
      # Cloud repository for storing output.
      class GooglePrivacyDlpV2OutputStorageConfig
        include Google::Apis::Core::Hashable
      
        # Schema used for writing the findings for Inspect jobs. This field is only
        # used for Inspect and must be unspecified for Risk jobs. Columns are derived
        # from the `Finding` object. If appending to an existing table, any columns
        # from the predefined schema that are missing will be added. No columns in
        # the existing table will be deleted.
        # If unspecified, then all available columns will be used for a new table or
        # an (existing) table with no schema, and no changes will be made to an
        # existing table that has a schema.
        # Corresponds to the JSON property `outputSchema`
        # @return [String]
        attr_accessor :output_schema
      
        # Message defining the location of a BigQuery table. A table is uniquely
        # identified  by its project_id, dataset_id, and table_name. Within a query
        # a table is often referenced with a string in the format of:
        # `<project_id>:<dataset_id>.<table_id>` or
        # `<project_id>.<dataset_id>.<table_id>`.
        # Corresponds to the JSON property `table`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2BigQueryTable]
        attr_accessor :table
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @output_schema = args[:output_schema] if args.key?(:output_schema)
          @table = args[:table] if args.key?(:table)
        end
      end
      
      # Datastore partition ID.
      # A partition ID identifies a grouping of entities. The grouping is always
      # by project and namespace, however the namespace ID may be empty.
      # A partition ID contains several dimensions:
      # project ID and namespace ID.
      class GooglePrivacyDlpV2PartitionId
        include Google::Apis::Core::Hashable
      
        # If not empty, the ID of the namespace to which the entities belong.
        # Corresponds to the JSON property `namespaceId`
        # @return [String]
        attr_accessor :namespace_id
      
        # The ID of the project to which the entities belong.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @namespace_id = args[:namespace_id] if args.key?(:namespace_id)
          @project_id = args[:project_id] if args.key?(:project_id)
        end
      end
      
      # A (kind, ID/name) pair used to construct a key path.
      # If either name or ID is set, the element is complete.
      # If neither is set, the element is incomplete.
      class GooglePrivacyDlpV2PathElement
        include Google::Apis::Core::Hashable
      
        # The auto-allocated ID of the entity.
        # Never equal to zero. Values less than zero are discouraged and may not
        # be supported in the future.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # The kind of the entity.
        # A kind matching regex `__.*__` is reserved/read-only.
        # A kind must not contain more than 1500 bytes when UTF-8 encoded.
        # Cannot be `""`.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The name of the entity.
        # A name matching regex `__.*__` is reserved/read-only.
        # A name must not be more than 1500 bytes when UTF-8 encoded.
        # Cannot be `""`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # A rule for transforming a value.
      class GooglePrivacyDlpV2PrimitiveTransformation
        include Google::Apis::Core::Hashable
      
        # Generalization function that buckets values based on ranges. The ranges and
        # replacement values are dynamically provided by the user for custom behavior,
        # such as 1-30 -> LOW 31-65 -> MEDIUM 66-100 -> HIGH
        # This can be used on
        # data of type: number, long, string, timestamp.
        # If the bound `Value` type differs from the type of data being transformed, we
        # will first attempt converting the type of the data to be transformed to match
        # the type of the bound before comparing.
        # See https://cloud.google.com/dlp/docs/concepts-bucketing to learn more.
        # Corresponds to the JSON property `bucketingConfig`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2BucketingConfig]
        attr_accessor :bucketing_config
      
        # Partially mask a string by replacing a given number of characters with a
        # fixed character. Masking can start from the beginning or end of the string.
        # This can be used on data of any type (numbers, longs, and so on) and when
        # de-identifying structured data we'll attempt to preserve the original data's
        # type. (This allows you to take a long like 123 and modify it to a string like
        # **3.
        # Corresponds to the JSON property `characterMaskConfig`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2CharacterMaskConfig]
        attr_accessor :character_mask_config
      
        # Pseudonymization method that generates deterministic encryption for the given
        # input. Outputs a base64 encoded representation of the encrypted output.
        # Uses AES-SIV based on the RFC https://tools.ietf.org/html/rfc5297.
        # Corresponds to the JSON property `cryptoDeterministicConfig`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2CryptoDeterministicConfig]
        attr_accessor :crypto_deterministic_config
      
        # Pseudonymization method that generates surrogates via cryptographic hashing.
        # Uses SHA-256.
        # The key size must be either 32 or 64 bytes.
        # Outputs a base64 encoded representation of the hashed output
        # (for example, L7k0BHmF1ha5U3NfGykjro4xWi1MPVQPjhMAZbSV9mM=).
        # Currently, only string and integer values can be hashed.
        # See https://cloud.google.com/dlp/docs/pseudonymization to learn more.
        # Corresponds to the JSON property `cryptoHashConfig`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2CryptoHashConfig]
        attr_accessor :crypto_hash_config
      
        # Replaces an identifier with a surrogate using Format Preserving Encryption
        # (FPE) with the FFX mode of operation; however when used in the
        # `ReidentifyContent` API method, it serves the opposite function by reversing
        # the surrogate back into the original identifier. The identifier must be
        # encoded as ASCII. For a given crypto key and context, the same identifier
        # will be replaced with the same surrogate. Identifiers must be at least two
        # characters long. In the case that the identifier is the empty string, it will
        # be skipped. See https://cloud.google.com/dlp/docs/pseudonymization to learn
        # more.
        # Note: We recommend using  CryptoDeterministicConfig for all use cases which
        # do not require preserving the input alphabet space and size, plus warrant
        # referential integrity.
        # Corresponds to the JSON property `cryptoReplaceFfxFpeConfig`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2CryptoReplaceFfxFpeConfig]
        attr_accessor :crypto_replace_ffx_fpe_config
      
        # Shifts dates by random number of days, with option to be consistent for the
        # same context. See https://cloud.google.com/dlp/docs/concepts-date-shifting
        # to learn more.
        # Corresponds to the JSON property `dateShiftConfig`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2DateShiftConfig]
        attr_accessor :date_shift_config
      
        # Buckets values based on fixed size ranges. The
        # Bucketing transformation can provide all of this functionality,
        # but requires more configuration. This message is provided as a convenience to
        # the user for simple bucketing strategies.
        # The transformed value will be a hyphenated string of
        # <lower_bound>-<upper_bound>, i.e if lower_bound = 10 and upper_bound = 20
        # all values that are within this bucket will be replaced with "10-20".
        # This can be used on data of type: double, long.
        # If the bound Value type differs from the type of data
        # being transformed, we will first attempt converting the type of the data to
        # be transformed to match the type of the bound before comparing.
        # See https://cloud.google.com/dlp/docs/concepts-bucketing to learn more.
        # Corresponds to the JSON property `fixedSizeBucketingConfig`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2FixedSizeBucketingConfig]
        attr_accessor :fixed_size_bucketing_config
      
        # Redact a given value. For example, if used with an `InfoTypeTransformation`
        # transforming PHONE_NUMBER, and input 'My phone number is 206-555-0123', the
        # output would be 'My phone number is '.
        # Corresponds to the JSON property `redactConfig`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2RedactConfig]
        attr_accessor :redact_config
      
        # Replace each input value with a given `Value`.
        # Corresponds to the JSON property `replaceConfig`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2ReplaceValueConfig]
        attr_accessor :replace_config
      
        # Replace each matching finding with the name of the info_type.
        # Corresponds to the JSON property `replaceWithInfoTypeConfig`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2ReplaceWithInfoTypeConfig]
        attr_accessor :replace_with_info_type_config
      
        # For use with `Date`, `Timestamp`, and `TimeOfDay`, extract or preserve a
        # portion of the value.
        # Corresponds to the JSON property `timePartConfig`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2TimePartConfig]
        attr_accessor :time_part_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bucketing_config = args[:bucketing_config] if args.key?(:bucketing_config)
          @character_mask_config = args[:character_mask_config] if args.key?(:character_mask_config)
          @crypto_deterministic_config = args[:crypto_deterministic_config] if args.key?(:crypto_deterministic_config)
          @crypto_hash_config = args[:crypto_hash_config] if args.key?(:crypto_hash_config)
          @crypto_replace_ffx_fpe_config = args[:crypto_replace_ffx_fpe_config] if args.key?(:crypto_replace_ffx_fpe_config)
          @date_shift_config = args[:date_shift_config] if args.key?(:date_shift_config)
          @fixed_size_bucketing_config = args[:fixed_size_bucketing_config] if args.key?(:fixed_size_bucketing_config)
          @redact_config = args[:redact_config] if args.key?(:redact_config)
          @replace_config = args[:replace_config] if args.key?(:replace_config)
          @replace_with_info_type_config = args[:replace_with_info_type_config] if args.key?(:replace_with_info_type_config)
          @time_part_config = args[:time_part_config] if args.key?(:time_part_config)
        end
      end
      
      # Privacy metric to compute for reidentification risk analysis.
      class GooglePrivacyDlpV2PrivacyMetric
        include Google::Apis::Core::Hashable
      
        # Compute numerical stats over an individual column, including
        # number of distinct values and value count distribution.
        # Corresponds to the JSON property `categoricalStatsConfig`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2CategoricalStatsConfig]
        attr_accessor :categorical_stats_config
      
        # δ-presence metric, used to estimate how likely it is for an attacker to
        # figure out that one given individual appears in a de-identified dataset.
        # Similarly to the k-map metric, we cannot compute δ-presence exactly without
        # knowing the attack dataset, so we use a statistical model instead.
        # Corresponds to the JSON property `deltaPresenceEstimationConfig`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2DeltaPresenceEstimationConfig]
        attr_accessor :delta_presence_estimation_config
      
        # k-anonymity metric, used for analysis of reidentification risk.
        # Corresponds to the JSON property `kAnonymityConfig`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2KAnonymityConfig]
        attr_accessor :k_anonymity_config
      
        # Reidentifiability metric. This corresponds to a risk model similar to what
        # is called "journalist risk" in the literature, except the attack dataset is
        # statistically modeled instead of being perfectly known. This can be done
        # using publicly available data (like the US Census), or using a custom
        # statistical model (indicated as one or several BigQuery tables), or by
        # extrapolating from the distribution of values in the input dataset.
        # A column with a semantic tag attached.
        # Corresponds to the JSON property `kMapEstimationConfig`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2KMapEstimationConfig]
        attr_accessor :k_map_estimation_config
      
        # l-diversity metric, used for analysis of reidentification risk.
        # Corresponds to the JSON property `lDiversityConfig`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2LDiversityConfig]
        attr_accessor :l_diversity_config
      
        # Compute numerical stats over an individual column, including
        # min, max, and quantiles.
        # Corresponds to the JSON property `numericalStatsConfig`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2NumericalStatsConfig]
        attr_accessor :numerical_stats_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @categorical_stats_config = args[:categorical_stats_config] if args.key?(:categorical_stats_config)
          @delta_presence_estimation_config = args[:delta_presence_estimation_config] if args.key?(:delta_presence_estimation_config)
          @k_anonymity_config = args[:k_anonymity_config] if args.key?(:k_anonymity_config)
          @k_map_estimation_config = args[:k_map_estimation_config] if args.key?(:k_map_estimation_config)
          @l_diversity_config = args[:l_diversity_config] if args.key?(:l_diversity_config)
          @numerical_stats_config = args[:numerical_stats_config] if args.key?(:numerical_stats_config)
        end
      end
      
      # Message for specifying a window around a finding to apply a detection
      # rule.
      class GooglePrivacyDlpV2Proximity
        include Google::Apis::Core::Hashable
      
        # Number of characters after the finding to consider.
        # Corresponds to the JSON property `windowAfter`
        # @return [Fixnum]
        attr_accessor :window_after
      
        # Number of characters before the finding to consider.
        # Corresponds to the JSON property `windowBefore`
        # @return [Fixnum]
        attr_accessor :window_before
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @window_after = args[:window_after] if args.key?(:window_after)
          @window_before = args[:window_before] if args.key?(:window_before)
        end
      end
      
      # Publish findings of a DlpJob to Cloud Data Catalog. Labels summarizing the
      # results of the DlpJob will be applied to the entry for the resource scanned
      # in Cloud Data Catalog. Any labels previously written by another DlpJob will
      # be deleted. InfoType naming patterns are strictly enforced when using this
      # feature. Note that the findings will be persisted in Cloud Data Catalog
      # storage and are governed by Data Catalog service-specific policy, see
      # https://cloud.google.com/terms/service-terms
      # Only a single instance of this action can be specified and only allowed if
      # all resources being scanned are BigQuery tables.
      # Compatible with: Inspect
      class GooglePrivacyDlpV2PublishFindingsToCloudDataCatalog
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Publish the result summary of a DlpJob to the Cloud Security
      # Command Center (CSCC Alpha).
      # This action is only available for projects which are parts of
      # an organization and whitelisted for the alpha Cloud Security Command
      # Center.
      # The action will publish count of finding instances and their info types.
      # The summary of findings will be persisted in CSCC and are governed by CSCC
      # service-specific policy, see https://cloud.google.com/terms/service-terms
      # Only a single instance of this action can be specified.
      # Compatible with: Inspect
      class GooglePrivacyDlpV2PublishSummaryToCscc
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Publish a message into given Pub/Sub topic when DlpJob has completed. The
      # message contains a single field, `DlpJobName`, which is equal to the
      # finished job's
      # [`DlpJob.name`](/dlp/docs/reference/rest/v2/projects.dlpJobs#DlpJob).
      # Compatible with: Inspect, Risk
      class GooglePrivacyDlpV2PublishToPubSub
        include Google::Apis::Core::Hashable
      
        # Cloud Pub/Sub topic to send notifications to. The topic must have given
        # publishing access rights to the DLP API service account executing
        # the long running DlpJob sending the notifications.
        # Format is projects/`project`/topics/`topic`.
        # Corresponds to the JSON property `topic`
        # @return [String]
        attr_accessor :topic
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @topic = args[:topic] if args.key?(:topic)
        end
      end
      
      # Enable Stackdriver metric dlp.googleapis.com/finding_count. This
      # will publish a metric to stack driver on each infotype requested and
      # how many findings were found for it. CustomDetectors will be bucketed
      # as 'Custom' under the Stackdriver label 'info_type'.
      class GooglePrivacyDlpV2PublishToStackdriver
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # A column with a semantic tag attached.
      class GooglePrivacyDlpV2QuasiId
        include Google::Apis::Core::Hashable
      
        # A column can be tagged with a custom tag. In this case, the user must
        # indicate an auxiliary table that contains statistical information on
        # the possible values of this column (below).
        # Corresponds to the JSON property `customTag`
        # @return [String]
        attr_accessor :custom_tag
      
        # General identifier of a data field in a storage service.
        # Corresponds to the JSON property `field`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId]
        attr_accessor :field
      
        # A generic empty message that you can re-use to avoid defining duplicated
        # empty messages in your APIs. A typical example is to use it as the request
        # or the response type of an API method. For instance:
        # service Foo `
        # rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);
        # `
        # The JSON representation for `Empty` is empty JSON object ````.
        # Corresponds to the JSON property `inferred`
        # @return [Google::Apis::DlpV2::GoogleProtobufEmpty]
        attr_accessor :inferred
      
        # Type of information detected by the API.
        # Corresponds to the JSON property `infoType`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType]
        attr_accessor :info_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @custom_tag = args[:custom_tag] if args.key?(:custom_tag)
          @field = args[:field] if args.key?(:field)
          @inferred = args[:inferred] if args.key?(:inferred)
          @info_type = args[:info_type] if args.key?(:info_type)
        end
      end
      
      # A quasi-identifier column has a custom_tag, used to know which column
      # in the data corresponds to which column in the statistical model.
      class GooglePrivacyDlpV2QuasiIdField
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `customTag`
        # @return [String]
        attr_accessor :custom_tag
      
        # General identifier of a data field in a storage service.
        # Corresponds to the JSON property `field`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId]
        attr_accessor :field
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @custom_tag = args[:custom_tag] if args.key?(:custom_tag)
          @field = args[:field] if args.key?(:field)
        end
      end
      
      # A quasi-identifier column has a custom_tag, used to know which column
      # in the data corresponds to which column in the statistical model.
      class GooglePrivacyDlpV2QuasiIdentifierField
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `customTag`
        # @return [String]
        attr_accessor :custom_tag
      
        # General identifier of a data field in a storage service.
        # Corresponds to the JSON property `field`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId]
        attr_accessor :field
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @custom_tag = args[:custom_tag] if args.key?(:custom_tag)
          @field = args[:field] if args.key?(:field)
        end
      end
      
      # Message for infoType-dependent details parsed from quote.
      class GooglePrivacyDlpV2QuoteInfo
        include Google::Apis::Core::Hashable
      
        # Message for a date time object.
        # e.g. 2018-01-01, 5th August.
        # Corresponds to the JSON property `dateTime`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2DateTime]
        attr_accessor :date_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @date_time = args[:date_time] if args.key?(:date_time)
        end
      end
      
      # Generic half-open interval [start, end)
      class GooglePrivacyDlpV2Range
        include Google::Apis::Core::Hashable
      
        # Index of the last character of the range (exclusive).
        # Corresponds to the JSON property `end`
        # @return [Fixnum]
        attr_accessor :end
      
        # Index of the first character of the range (inclusive).
        # Corresponds to the JSON property `start`
        # @return [Fixnum]
        attr_accessor :start
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end = args[:end] if args.key?(:end)
          @start = args[:start] if args.key?(:start)
        end
      end
      
      # A condition for determining whether a transformation should be applied to
      # a field.
      class GooglePrivacyDlpV2RecordCondition
        include Google::Apis::Core::Hashable
      
        # An expression, consisting or an operator and conditions.
        # Corresponds to the JSON property `expressions`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2Expressions]
        attr_accessor :expressions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @expressions = args[:expressions] if args.key?(:expressions)
        end
      end
      
      # Message for a unique key indicating a record that contains a finding.
      class GooglePrivacyDlpV2RecordKey
        include Google::Apis::Core::Hashable
      
        # Row key for identifying a record in BigQuery table.
        # Corresponds to the JSON property `bigQueryKey`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2BigQueryKey]
        attr_accessor :big_query_key
      
        # Record key for a finding in Cloud Datastore.
        # Corresponds to the JSON property `datastoreKey`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2DatastoreKey]
        attr_accessor :datastore_key
      
        # Values of identifying columns in the given row. Order of values matches
        # the order of field identifiers specified in the scanning request.
        # Corresponds to the JSON property `idValues`
        # @return [Array<String>]
        attr_accessor :id_values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @big_query_key = args[:big_query_key] if args.key?(:big_query_key)
          @datastore_key = args[:datastore_key] if args.key?(:datastore_key)
          @id_values = args[:id_values] if args.key?(:id_values)
        end
      end
      
      # Location of a finding within a row or record.
      class GooglePrivacyDlpV2RecordLocation
        include Google::Apis::Core::Hashable
      
        # General identifier of a data field in a storage service.
        # Corresponds to the JSON property `fieldId`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId]
        attr_accessor :field_id
      
        # Message for a unique key indicating a record that contains a finding.
        # Corresponds to the JSON property `recordKey`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2RecordKey]
        attr_accessor :record_key
      
        # Location of a finding within a table.
        # Corresponds to the JSON property `tableLocation`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2TableLocation]
        attr_accessor :table_location
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @field_id = args[:field_id] if args.key?(:field_id)
          @record_key = args[:record_key] if args.key?(:record_key)
          @table_location = args[:table_location] if args.key?(:table_location)
        end
      end
      
      # Configuration to suppress records whose suppression conditions evaluate to
      # true.
      class GooglePrivacyDlpV2RecordSuppression
        include Google::Apis::Core::Hashable
      
        # A condition for determining whether a transformation should be applied to
        # a field.
        # Corresponds to the JSON property `condition`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2RecordCondition]
        attr_accessor :condition
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @condition = args[:condition] if args.key?(:condition)
        end
      end
      
      # A type of transformation that is applied over structured data such as a
      # table.
      class GooglePrivacyDlpV2RecordTransformations
        include Google::Apis::Core::Hashable
      
        # Transform the record by applying various field transformations.
        # Corresponds to the JSON property `fieldTransformations`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2FieldTransformation>]
        attr_accessor :field_transformations
      
        # Configuration defining which records get suppressed entirely. Records that
        # match any suppression rule are omitted from the output [optional].
        # Corresponds to the JSON property `recordSuppressions`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2RecordSuppression>]
        attr_accessor :record_suppressions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @field_transformations = args[:field_transformations] if args.key?(:field_transformations)
          @record_suppressions = args[:record_suppressions] if args.key?(:record_suppressions)
        end
      end
      
      # Redact a given value. For example, if used with an `InfoTypeTransformation`
      # transforming PHONE_NUMBER, and input 'My phone number is 206-555-0123', the
      # output would be 'My phone number is '.
      class GooglePrivacyDlpV2RedactConfig
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Request to search for potentially sensitive info in an image and redact it
      # by covering it with a colored rectangle.
      class GooglePrivacyDlpV2RedactImageRequest
        include Google::Apis::Core::Hashable
      
        # Container for bytes to inspect or redact.
        # Corresponds to the JSON property `byteItem`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2ByteContentItem]
        attr_accessor :byte_item
      
        # The configuration for specifying what content to redact from images.
        # Corresponds to the JSON property `imageRedactionConfigs`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2ImageRedactionConfig>]
        attr_accessor :image_redaction_configs
      
        # Whether the response should include findings along with the redacted
        # image.
        # Corresponds to the JSON property `includeFindings`
        # @return [Boolean]
        attr_accessor :include_findings
        alias_method :include_findings?, :include_findings
      
        # Configuration description of the scanning process.
        # When used with redactContent only info_types and min_likelihood are currently
        # used.
        # Corresponds to the JSON property `inspectConfig`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InspectConfig]
        attr_accessor :inspect_config
      
        # The geographic location to process the request. Reserved for future
        # extensions.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @byte_item = args[:byte_item] if args.key?(:byte_item)
          @image_redaction_configs = args[:image_redaction_configs] if args.key?(:image_redaction_configs)
          @include_findings = args[:include_findings] if args.key?(:include_findings)
          @inspect_config = args[:inspect_config] if args.key?(:inspect_config)
          @location = args[:location] if args.key?(:location)
        end
      end
      
      # Results of redacting an image.
      class GooglePrivacyDlpV2RedactImageResponse
        include Google::Apis::Core::Hashable
      
        # If an image was being inspected and the InspectConfig's include_quote was
        # set to true, then this field will include all text, if any, that was found
        # in the image.
        # Corresponds to the JSON property `extractedText`
        # @return [String]
        attr_accessor :extracted_text
      
        # All the findings for a single scanned item.
        # Corresponds to the JSON property `inspectResult`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InspectResult]
        attr_accessor :inspect_result
      
        # The redacted image. The type will be the same as the original image.
        # Corresponds to the JSON property `redactedImage`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :redacted_image
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @extracted_text = args[:extracted_text] if args.key?(:extracted_text)
          @inspect_result = args[:inspect_result] if args.key?(:inspect_result)
          @redacted_image = args[:redacted_image] if args.key?(:redacted_image)
        end
      end
      
      # Message defining a custom regular expression.
      class GooglePrivacyDlpV2Regex
        include Google::Apis::Core::Hashable
      
        # The index of the submatch to extract as findings. When not
        # specified, the entire match is returned. No more than 3 may be included.
        # Corresponds to the JSON property `groupIndexes`
        # @return [Array<Fixnum>]
        attr_accessor :group_indexes
      
        # Pattern defining the regular expression. Its syntax
        # (https://github.com/google/re2/wiki/Syntax) can be found under the
        # google/re2 repository on GitHub.
        # Corresponds to the JSON property `pattern`
        # @return [String]
        attr_accessor :pattern
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @group_indexes = args[:group_indexes] if args.key?(:group_indexes)
          @pattern = args[:pattern] if args.key?(:pattern)
        end
      end
      
      # Request to re-identify an item.
      class GooglePrivacyDlpV2ReidentifyContentRequest
        include Google::Apis::Core::Hashable
      
        # Configuration description of the scanning process.
        # When used with redactContent only info_types and min_likelihood are currently
        # used.
        # Corresponds to the JSON property `inspectConfig`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InspectConfig]
        attr_accessor :inspect_config
      
        # Optional template to use. Any configuration directly specified in
        # `inspect_config` will override those set in the template. Singular fields
        # that are set in this request will replace their corresponding fields in the
        # template. Repeated fields are appended. Singular sub-messages and groups
        # are recursively merged.
        # Corresponds to the JSON property `inspectTemplateName`
        # @return [String]
        attr_accessor :inspect_template_name
      
        # Container structure for the content to inspect.
        # Corresponds to the JSON property `item`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2ContentItem]
        attr_accessor :item
      
        # The geographic location to process content reidentification.  Reserved for
        # future extensions.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # The configuration that controls how the data will change.
        # Corresponds to the JSON property `reidentifyConfig`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyConfig]
        attr_accessor :reidentify_config
      
        # Optional template to use. References an instance of `DeidentifyTemplate`.
        # Any configuration directly specified in `reidentify_config` or
        # `inspect_config` will override those set in the template. Singular fields
        # that are set in this request will replace their corresponding fields in the
        # template. Repeated fields are appended. Singular sub-messages and groups
        # are recursively merged.
        # Corresponds to the JSON property `reidentifyTemplateName`
        # @return [String]
        attr_accessor :reidentify_template_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @inspect_config = args[:inspect_config] if args.key?(:inspect_config)
          @inspect_template_name = args[:inspect_template_name] if args.key?(:inspect_template_name)
          @item = args[:item] if args.key?(:item)
          @location = args[:location] if args.key?(:location)
          @reidentify_config = args[:reidentify_config] if args.key?(:reidentify_config)
          @reidentify_template_name = args[:reidentify_template_name] if args.key?(:reidentify_template_name)
        end
      end
      
      # Results of re-identifying a item.
      class GooglePrivacyDlpV2ReidentifyContentResponse
        include Google::Apis::Core::Hashable
      
        # Container structure for the content to inspect.
        # Corresponds to the JSON property `item`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2ContentItem]
        attr_accessor :item
      
        # Overview of the modifications that occurred.
        # Corresponds to the JSON property `overview`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2TransformationOverview]
        attr_accessor :overview
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @item = args[:item] if args.key?(:item)
          @overview = args[:overview] if args.key?(:overview)
        end
      end
      
      # Replace each input value with a given `Value`.
      class GooglePrivacyDlpV2ReplaceValueConfig
        include Google::Apis::Core::Hashable
      
        # Set of primitive values supported by the system.
        # Note that for the purposes of inspection or transformation, the number
        # of bytes considered to comprise a 'Value' is based on its representation
        # as a UTF-8 encoded string. For example, if 'integer_value' is set to
        # 123456789, the number of bytes would be counted as 9, even though an
        # int64 only holds up to 8 bytes of data.
        # Corresponds to the JSON property `newValue`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2Value]
        attr_accessor :new_value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @new_value = args[:new_value] if args.key?(:new_value)
        end
      end
      
      # Replace each matching finding with the name of the info_type.
      class GooglePrivacyDlpV2ReplaceWithInfoTypeConfig
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # 
      class GooglePrivacyDlpV2RequestedOptions
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `jobConfig`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InspectJobConfig]
        attr_accessor :job_config
      
        # The inspectTemplate contains a configuration (set of types of sensitive data
        # to be detected) to be used anywhere you otherwise would normally specify
        # InspectConfig. See https://cloud.google.com/dlp/docs/concepts-templates
        # to learn more.
        # Corresponds to the JSON property `snapshotInspectTemplate`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate]
        attr_accessor :snapshot_inspect_template
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @job_config = args[:job_config] if args.key?(:job_config)
          @snapshot_inspect_template = args[:snapshot_inspect_template] if args.key?(:snapshot_inspect_template)
        end
      end
      
      # All result fields mentioned below are updated while the job is processing.
      class GooglePrivacyDlpV2Result
        include Google::Apis::Core::Hashable
      
        # Statistics of how many instances of each info type were found during
        # inspect job.
        # Corresponds to the JSON property `infoTypeStats`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2InfoTypeStats>]
        attr_accessor :info_type_stats
      
        # Total size in bytes that were processed.
        # Corresponds to the JSON property `processedBytes`
        # @return [Fixnum]
        attr_accessor :processed_bytes
      
        # Estimate of the number of bytes to process.
        # Corresponds to the JSON property `totalEstimatedBytes`
        # @return [Fixnum]
        attr_accessor :total_estimated_bytes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @info_type_stats = args[:info_type_stats] if args.key?(:info_type_stats)
          @processed_bytes = args[:processed_bytes] if args.key?(:processed_bytes)
          @total_estimated_bytes = args[:total_estimated_bytes] if args.key?(:total_estimated_bytes)
        end
      end
      
      # Configuration for a risk analysis job. See
      # https://cloud.google.com/dlp/docs/concepts-risk-analysis to learn more.
      class GooglePrivacyDlpV2RiskAnalysisJobConfig
        include Google::Apis::Core::Hashable
      
        # Actions to execute at the completion of the job. Are executed in the order
        # provided.
        # Corresponds to the JSON property `actions`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2Action>]
        attr_accessor :actions
      
        # Privacy metric to compute for reidentification risk analysis.
        # Corresponds to the JSON property `privacyMetric`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2PrivacyMetric]
        attr_accessor :privacy_metric
      
        # Message defining the location of a BigQuery table. A table is uniquely
        # identified  by its project_id, dataset_id, and table_name. Within a query
        # a table is often referenced with a string in the format of:
        # `<project_id>:<dataset_id>.<table_id>` or
        # `<project_id>.<dataset_id>.<table_id>`.
        # Corresponds to the JSON property `sourceTable`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2BigQueryTable]
        attr_accessor :source_table
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @actions = args[:actions] if args.key?(:actions)
          @privacy_metric = args[:privacy_metric] if args.key?(:privacy_metric)
          @source_table = args[:source_table] if args.key?(:source_table)
        end
      end
      
      # 
      class GooglePrivacyDlpV2Row
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `values`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2Value>]
        attr_accessor :values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @values = args[:values] if args.key?(:values)
        end
      end
      
      # If set, the detailed findings will be persisted to the specified
      # OutputStorageConfig. Only a single instance of this action can be
      # specified.
      # Compatible with: Inspect, Risk
      class GooglePrivacyDlpV2SaveFindings
        include Google::Apis::Core::Hashable
      
        # Cloud repository for storing output.
        # Corresponds to the JSON property `outputConfig`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2OutputStorageConfig]
        attr_accessor :output_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @output_config = args[:output_config] if args.key?(:output_config)
        end
      end
      
      # Schedule for triggeredJobs.
      class GooglePrivacyDlpV2Schedule
        include Google::Apis::Core::Hashable
      
        # With this option a job is started a regular periodic basis. For
        # example: every day (86400 seconds).
        # A scheduled start time will be skipped if the previous
        # execution has not ended when its scheduled time occurs.
        # This value must be set to a time duration greater than or equal
        # to 1 day and can be no longer than 60 days.
        # Corresponds to the JSON property `recurrencePeriodDuration`
        # @return [String]
        attr_accessor :recurrence_period_duration
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @recurrence_period_duration = args[:recurrence_period_duration] if args.key?(:recurrence_period_duration)
        end
      end
      
      # An auxiliary table containing statistical information on the relative
      # frequency of different quasi-identifiers values. It has one or several
      # quasi-identifiers columns, and one column that indicates the relative
      # frequency of each quasi-identifier tuple.
      # If a tuple is present in the data but not in the auxiliary table, the
      # corresponding relative frequency is assumed to be zero (and thus, the
      # tuple is highly reidentifiable).
      class GooglePrivacyDlpV2StatisticalTable
        include Google::Apis::Core::Hashable
      
        # Quasi-identifier columns. [required]
        # Corresponds to the JSON property `quasiIds`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2QuasiIdentifierField>]
        attr_accessor :quasi_ids
      
        # General identifier of a data field in a storage service.
        # Corresponds to the JSON property `relativeFrequency`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId]
        attr_accessor :relative_frequency
      
        # Message defining the location of a BigQuery table. A table is uniquely
        # identified  by its project_id, dataset_id, and table_name. Within a query
        # a table is often referenced with a string in the format of:
        # `<project_id>:<dataset_id>.<table_id>` or
        # `<project_id>.<dataset_id>.<table_id>`.
        # Corresponds to the JSON property `table`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2BigQueryTable]
        attr_accessor :table
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @quasi_ids = args[:quasi_ids] if args.key?(:quasi_ids)
          @relative_frequency = args[:relative_frequency] if args.key?(:relative_frequency)
          @table = args[:table] if args.key?(:table)
        end
      end
      
      # Shared message indicating Cloud storage type.
      class GooglePrivacyDlpV2StorageConfig
        include Google::Apis::Core::Hashable
      
        # Options defining BigQuery table and row identifiers.
        # Corresponds to the JSON property `bigQueryOptions`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2BigQueryOptions]
        attr_accessor :big_query_options
      
        # Options defining a file or a set of files within a Google Cloud Storage
        # bucket.
        # Corresponds to the JSON property `cloudStorageOptions`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2CloudStorageOptions]
        attr_accessor :cloud_storage_options
      
        # Options defining a data set within Google Cloud Datastore.
        # Corresponds to the JSON property `datastoreOptions`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2DatastoreOptions]
        attr_accessor :datastore_options
      
        # Configuration of the timespan of the items to include in scanning.
        # Currently only supported when inspecting Google Cloud Storage and BigQuery.
        # Corresponds to the JSON property `timespanConfig`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2TimespanConfig]
        attr_accessor :timespan_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @big_query_options = args[:big_query_options] if args.key?(:big_query_options)
          @cloud_storage_options = args[:cloud_storage_options] if args.key?(:cloud_storage_options)
          @datastore_options = args[:datastore_options] if args.key?(:datastore_options)
          @timespan_config = args[:timespan_config] if args.key?(:timespan_config)
        end
      end
      
      # StoredInfoType resource message that contains information about the current
      # version and any pending updates.
      class GooglePrivacyDlpV2StoredInfoType
        include Google::Apis::Core::Hashable
      
        # Version of a StoredInfoType, including the configuration used to build it,
        # create timestamp, and current state.
        # Corresponds to the JSON property `currentVersion`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoTypeVersion]
        attr_accessor :current_version
      
        # Resource name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Pending versions of the stored info type. Empty if no versions are
        # pending.
        # Corresponds to the JSON property `pendingVersions`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoTypeVersion>]
        attr_accessor :pending_versions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @current_version = args[:current_version] if args.key?(:current_version)
          @name = args[:name] if args.key?(:name)
          @pending_versions = args[:pending_versions] if args.key?(:pending_versions)
        end
      end
      
      # Configuration for a StoredInfoType.
      class GooglePrivacyDlpV2StoredInfoTypeConfig
        include Google::Apis::Core::Hashable
      
        # Description of the StoredInfoType (max 256 characters).
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Display name of the StoredInfoType (max 256 characters).
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Configuration for a custom dictionary created from a data source of any size
        # up to the maximum size defined in the
        # [limits](https://cloud.google.com/dlp/limits) page. The artifacts of
        # dictionary creation are stored in the specified Google Cloud Storage
        # location. Consider using `CustomInfoType.Dictionary` for smaller dictionaries
        # that satisfy the size requirements.
        # Corresponds to the JSON property `largeCustomDictionary`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2LargeCustomDictionaryConfig]
        attr_accessor :large_custom_dictionary
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @display_name = args[:display_name] if args.key?(:display_name)
          @large_custom_dictionary = args[:large_custom_dictionary] if args.key?(:large_custom_dictionary)
        end
      end
      
      # Statistics for a StoredInfoType.
      class GooglePrivacyDlpV2StoredInfoTypeStats
        include Google::Apis::Core::Hashable
      
        # Summary statistics of a custom dictionary.
        # Corresponds to the JSON property `largeCustomDictionary`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2LargeCustomDictionaryStats]
        attr_accessor :large_custom_dictionary
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @large_custom_dictionary = args[:large_custom_dictionary] if args.key?(:large_custom_dictionary)
        end
      end
      
      # Version of a StoredInfoType, including the configuration used to build it,
      # create timestamp, and current state.
      class GooglePrivacyDlpV2StoredInfoTypeVersion
        include Google::Apis::Core::Hashable
      
        # Configuration for a StoredInfoType.
        # Corresponds to the JSON property `config`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoTypeConfig]
        attr_accessor :config
      
        # Create timestamp of the version. Read-only, determined by the system
        # when the version is created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Errors that occurred when creating this storedInfoType version, or
        # anomalies detected in the storedInfoType data that render it unusable. Only
        # the five most recent errors will be displayed, with the most recent error
        # appearing first.
        # <p>For example, some of the data for stored custom dictionaries is put in
        # the user's Google Cloud Storage bucket, and if this data is modified or
        # deleted by the user or another system, the dictionary becomes invalid.
        # <p>If any errors occur, fix the problem indicated by the error message and
        # use the UpdateStoredInfoType API method to create another version of the
        # storedInfoType to continue using it, reusing the same `config` if it was
        # not the source of the error.
        # Corresponds to the JSON property `errors`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2Error>]
        attr_accessor :errors
      
        # Stored info type version state. Read-only, updated by the system
        # during dictionary creation.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Statistics for a StoredInfoType.
        # Corresponds to the JSON property `stats`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoTypeStats]
        attr_accessor :stats
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @config = args[:config] if args.key?(:config)
          @create_time = args[:create_time] if args.key?(:create_time)
          @errors = args[:errors] if args.key?(:errors)
          @state = args[:state] if args.key?(:state)
          @stats = args[:stats] if args.key?(:stats)
        end
      end
      
      # A reference to a StoredInfoType to use with scanning.
      class GooglePrivacyDlpV2StoredType
        include Google::Apis::Core::Hashable
      
        # Timestamp indicating when the version of the `StoredInfoType` used for
        # inspection was created. Output-only field, populated by the system.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Resource name of the requested `StoredInfoType`, for example
        # `organizations/433245324/storedInfoTypes/432452342` or
        # `projects/project-id/storedInfoTypes/432452342`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # A collection that informs the user the number of times a particular
      # `TransformationResultCode` and error details occurred.
      class GooglePrivacyDlpV2SummaryResult
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `code`
        # @return [String]
        attr_accessor :code
      
        # 
        # Corresponds to the JSON property `count`
        # @return [Fixnum]
        attr_accessor :count
      
        # A place for warnings or errors to show up if a transformation didn't
        # work as expected.
        # Corresponds to the JSON property `details`
        # @return [String]
        attr_accessor :details
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @count = args[:count] if args.key?(:count)
          @details = args[:details] if args.key?(:details)
        end
      end
      
      # Message for detecting output from deidentification transformations
      # such as
      # [`CryptoReplaceFfxFpeConfig`](/dlp/docs/reference/rest/v2/organizations.
      # deidentifyTemplates#cryptoreplaceffxfpeconfig).
      # These types of transformations are
      # those that perform pseudonymization, thereby producing a "surrogate" as
      # output. This should be used in conjunction with a field on the
      # transformation such as `surrogate_info_type`. This CustomInfoType does
      # not support the use of `detection_rules`.
      class GooglePrivacyDlpV2SurrogateType
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Structured content to inspect. Up to 50,000 `Value`s per request allowed.
      # See https://cloud.google.com/dlp/docs/inspecting-text#inspecting_a_table to
      # learn more.
      class GooglePrivacyDlpV2Table
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `headers`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId>]
        attr_accessor :headers
      
        # 
        # Corresponds to the JSON property `rows`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2Row>]
        attr_accessor :rows
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @headers = args[:headers] if args.key?(:headers)
          @rows = args[:rows] if args.key?(:rows)
        end
      end
      
      # Location of a finding within a table.
      class GooglePrivacyDlpV2TableLocation
        include Google::Apis::Core::Hashable
      
        # The zero-based index of the row where the finding is located.
        # Corresponds to the JSON property `rowIndex`
        # @return [Fixnum]
        attr_accessor :row_index
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @row_index = args[:row_index] if args.key?(:row_index)
        end
      end
      
      # 
      class GooglePrivacyDlpV2TaggedField
        include Google::Apis::Core::Hashable
      
        # A column can be tagged with a custom tag. In this case, the user must
        # indicate an auxiliary table that contains statistical information on
        # the possible values of this column (below).
        # Corresponds to the JSON property `customTag`
        # @return [String]
        attr_accessor :custom_tag
      
        # General identifier of a data field in a storage service.
        # Corresponds to the JSON property `field`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId]
        attr_accessor :field
      
        # A generic empty message that you can re-use to avoid defining duplicated
        # empty messages in your APIs. A typical example is to use it as the request
        # or the response type of an API method. For instance:
        # service Foo `
        # rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);
        # `
        # The JSON representation for `Empty` is empty JSON object ````.
        # Corresponds to the JSON property `inferred`
        # @return [Google::Apis::DlpV2::GoogleProtobufEmpty]
        attr_accessor :inferred
      
        # Type of information detected by the API.
        # Corresponds to the JSON property `infoType`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType]
        attr_accessor :info_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @custom_tag = args[:custom_tag] if args.key?(:custom_tag)
          @field = args[:field] if args.key?(:field)
          @inferred = args[:inferred] if args.key?(:inferred)
          @info_type = args[:info_type] if args.key?(:info_type)
        end
      end
      
      # For use with `Date`, `Timestamp`, and `TimeOfDay`, extract or preserve a
      # portion of the value.
      class GooglePrivacyDlpV2TimePartConfig
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `partToExtract`
        # @return [String]
        attr_accessor :part_to_extract
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @part_to_extract = args[:part_to_extract] if args.key?(:part_to_extract)
        end
      end
      
      # 
      class GooglePrivacyDlpV2TimeZone
        include Google::Apis::Core::Hashable
      
        # Set only if the offset can be determined. Positive for time ahead of UTC.
        # E.g. For "UTC-9", this value is -540.
        # Corresponds to the JSON property `offsetMinutes`
        # @return [Fixnum]
        attr_accessor :offset_minutes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @offset_minutes = args[:offset_minutes] if args.key?(:offset_minutes)
        end
      end
      
      # Configuration of the timespan of the items to include in scanning.
      # Currently only supported when inspecting Google Cloud Storage and BigQuery.
      class GooglePrivacyDlpV2TimespanConfig
        include Google::Apis::Core::Hashable
      
        # When the job is started by a JobTrigger we will automatically figure out
        # a valid start_time to avoid scanning files that have not been modified
        # since the last time the JobTrigger executed. This will be based on the
        # time of the execution of the last run of the JobTrigger.
        # Corresponds to the JSON property `enableAutoPopulationOfTimespanConfig`
        # @return [Boolean]
        attr_accessor :enable_auto_population_of_timespan_config
        alias_method :enable_auto_population_of_timespan_config?, :enable_auto_population_of_timespan_config
      
        # Exclude files or rows newer than this value.
        # If set to zero, no upper time limit is applied.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Exclude files or rows older than this value.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # General identifier of a data field in a storage service.
        # Corresponds to the JSON property `timestampField`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId]
        attr_accessor :timestamp_field
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enable_auto_population_of_timespan_config = args[:enable_auto_population_of_timespan_config] if args.key?(:enable_auto_population_of_timespan_config)
          @end_time = args[:end_time] if args.key?(:end_time)
          @start_time = args[:start_time] if args.key?(:start_time)
          @timestamp_field = args[:timestamp_field] if args.key?(:timestamp_field)
        end
      end
      
      # Overview of the modifications that occurred.
      class GooglePrivacyDlpV2TransformationOverview
        include Google::Apis::Core::Hashable
      
        # Transformations applied to the dataset.
        # Corresponds to the JSON property `transformationSummaries`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2TransformationSummary>]
        attr_accessor :transformation_summaries
      
        # Total size in bytes that were transformed in some way.
        # Corresponds to the JSON property `transformedBytes`
        # @return [Fixnum]
        attr_accessor :transformed_bytes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @transformation_summaries = args[:transformation_summaries] if args.key?(:transformation_summaries)
          @transformed_bytes = args[:transformed_bytes] if args.key?(:transformed_bytes)
        end
      end
      
      # Summary of a single transformation.
      # Only one of 'transformation', 'field_transformation', or 'record_suppress'
      # will be set.
      class GooglePrivacyDlpV2TransformationSummary
        include Google::Apis::Core::Hashable
      
        # General identifier of a data field in a storage service.
        # Corresponds to the JSON property `field`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId]
        attr_accessor :field
      
        # The field transformation that was applied.
        # If multiple field transformations are requested for a single field,
        # this list will contain all of them; otherwise, only one is supplied.
        # Corresponds to the JSON property `fieldTransformations`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2FieldTransformation>]
        attr_accessor :field_transformations
      
        # Type of information detected by the API.
        # Corresponds to the JSON property `infoType`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType]
        attr_accessor :info_type
      
        # Configuration to suppress records whose suppression conditions evaluate to
        # true.
        # Corresponds to the JSON property `recordSuppress`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2RecordSuppression]
        attr_accessor :record_suppress
      
        # 
        # Corresponds to the JSON property `results`
        # @return [Array<Google::Apis::DlpV2::GooglePrivacyDlpV2SummaryResult>]
        attr_accessor :results
      
        # A rule for transforming a value.
        # Corresponds to the JSON property `transformation`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2PrimitiveTransformation]
        attr_accessor :transformation
      
        # Total size in bytes that were transformed in some way.
        # Corresponds to the JSON property `transformedBytes`
        # @return [Fixnum]
        attr_accessor :transformed_bytes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @field = args[:field] if args.key?(:field)
          @field_transformations = args[:field_transformations] if args.key?(:field_transformations)
          @info_type = args[:info_type] if args.key?(:info_type)
          @record_suppress = args[:record_suppress] if args.key?(:record_suppress)
          @results = args[:results] if args.key?(:results)
          @transformation = args[:transformation] if args.key?(:transformation)
          @transformed_bytes = args[:transformed_bytes] if args.key?(:transformed_bytes)
        end
      end
      
      # Use this to have a random data crypto key generated.
      # It will be discarded after the request finishes.
      class GooglePrivacyDlpV2TransientCryptoKey
        include Google::Apis::Core::Hashable
      
        # Name of the key. [required]
        # This is an arbitrary string used to differentiate different keys.
        # A unique key is generated per name: two separate `TransientCryptoKey`
        # protos share the same generated key if their names are the same.
        # When the data crypto key is generated, this name is not used in any way
        # (repeating the api call will result in a different key being generated).
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # What event needs to occur for a new job to be started.
      class GooglePrivacyDlpV2Trigger
        include Google::Apis::Core::Hashable
      
        # Schedule for triggeredJobs.
        # Corresponds to the JSON property `schedule`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2Schedule]
        attr_accessor :schedule
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @schedule = args[:schedule] if args.key?(:schedule)
        end
      end
      
      # Using raw keys is prone to security risks due to accidentally
      # leaking the key. Choose another type of key if possible.
      class GooglePrivacyDlpV2UnwrappedCryptoKey
        include Google::Apis::Core::Hashable
      
        # A 128/192/256 bit key. [required]
        # Corresponds to the JSON property `key`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :key
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @key = args[:key] if args.key?(:key)
        end
      end
      
      # Request message for UpdateDeidentifyTemplate.
      class GooglePrivacyDlpV2UpdateDeidentifyTemplateRequest
        include Google::Apis::Core::Hashable
      
        # The DeidentifyTemplates contains instructions on how to deidentify content.
        # See https://cloud.google.com/dlp/docs/concepts-templates to learn more.
        # Corresponds to the JSON property `deidentifyTemplate`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyTemplate]
        attr_accessor :deidentify_template
      
        # Mask to control which fields get updated.
        # Corresponds to the JSON property `updateMask`
        # @return [String]
        attr_accessor :update_mask
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @deidentify_template = args[:deidentify_template] if args.key?(:deidentify_template)
          @update_mask = args[:update_mask] if args.key?(:update_mask)
        end
      end
      
      # Request message for UpdateInspectTemplate.
      class GooglePrivacyDlpV2UpdateInspectTemplateRequest
        include Google::Apis::Core::Hashable
      
        # The inspectTemplate contains a configuration (set of types of sensitive data
        # to be detected) to be used anywhere you otherwise would normally specify
        # InspectConfig. See https://cloud.google.com/dlp/docs/concepts-templates
        # to learn more.
        # Corresponds to the JSON property `inspectTemplate`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate]
        attr_accessor :inspect_template
      
        # Mask to control which fields get updated.
        # Corresponds to the JSON property `updateMask`
        # @return [String]
        attr_accessor :update_mask
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @inspect_template = args[:inspect_template] if args.key?(:inspect_template)
          @update_mask = args[:update_mask] if args.key?(:update_mask)
        end
      end
      
      # Request message for UpdateJobTrigger.
      class GooglePrivacyDlpV2UpdateJobTriggerRequest
        include Google::Apis::Core::Hashable
      
        # Contains a configuration to make dlp api calls on a repeating basis.
        # See https://cloud.google.com/dlp/docs/concepts-job-triggers to learn more.
        # Corresponds to the JSON property `jobTrigger`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2JobTrigger]
        attr_accessor :job_trigger
      
        # Mask to control which fields get updated.
        # Corresponds to the JSON property `updateMask`
        # @return [String]
        attr_accessor :update_mask
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @job_trigger = args[:job_trigger] if args.key?(:job_trigger)
          @update_mask = args[:update_mask] if args.key?(:update_mask)
        end
      end
      
      # Request message for UpdateStoredInfoType.
      class GooglePrivacyDlpV2UpdateStoredInfoTypeRequest
        include Google::Apis::Core::Hashable
      
        # Configuration for a StoredInfoType.
        # Corresponds to the JSON property `config`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoTypeConfig]
        attr_accessor :config
      
        # Mask to control which fields get updated.
        # Corresponds to the JSON property `updateMask`
        # @return [String]
        attr_accessor :update_mask
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @config = args[:config] if args.key?(:config)
          @update_mask = args[:update_mask] if args.key?(:update_mask)
        end
      end
      
      # Set of primitive values supported by the system.
      # Note that for the purposes of inspection or transformation, the number
      # of bytes considered to comprise a 'Value' is based on its representation
      # as a UTF-8 encoded string. For example, if 'integer_value' is set to
      # 123456789, the number of bytes would be counted as 9, even though an
      # int64 only holds up to 8 bytes of data.
      class GooglePrivacyDlpV2Value
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `booleanValue`
        # @return [Boolean]
        attr_accessor :boolean_value
        alias_method :boolean_value?, :boolean_value
      
        # Represents a whole or partial calendar date, e.g. a birthday. The time of day
        # and time zone are either specified elsewhere or are not significant. The date
        # is relative to the Proleptic Gregorian Calendar. This can represent:
        # * A full date, with non-zero year, month and day values
        # * A month and day value, with a zero year, e.g. an anniversary
        # * A year on its own, with zero month and day values
        # * A year and month value, with a zero day, e.g. a credit card expiration date
        # Related types are google.type.TimeOfDay and `google.protobuf.Timestamp`.
        # Corresponds to the JSON property `dateValue`
        # @return [Google::Apis::DlpV2::GoogleTypeDate]
        attr_accessor :date_value
      
        # 
        # Corresponds to the JSON property `dayOfWeekValue`
        # @return [String]
        attr_accessor :day_of_week_value
      
        # 
        # Corresponds to the JSON property `floatValue`
        # @return [Float]
        attr_accessor :float_value
      
        # 
        # Corresponds to the JSON property `integerValue`
        # @return [Fixnum]
        attr_accessor :integer_value
      
        # 
        # Corresponds to the JSON property `stringValue`
        # @return [String]
        attr_accessor :string_value
      
        # Represents a time of day. The date and time zone are either not significant
        # or are specified elsewhere. An API may choose to allow leap seconds. Related
        # types are google.type.Date and `google.protobuf.Timestamp`.
        # Corresponds to the JSON property `timeValue`
        # @return [Google::Apis::DlpV2::GoogleTypeTimeOfDay]
        attr_accessor :time_value
      
        # 
        # Corresponds to the JSON property `timestampValue`
        # @return [String]
        attr_accessor :timestamp_value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @boolean_value = args[:boolean_value] if args.key?(:boolean_value)
          @date_value = args[:date_value] if args.key?(:date_value)
          @day_of_week_value = args[:day_of_week_value] if args.key?(:day_of_week_value)
          @float_value = args[:float_value] if args.key?(:float_value)
          @integer_value = args[:integer_value] if args.key?(:integer_value)
          @string_value = args[:string_value] if args.key?(:string_value)
          @time_value = args[:time_value] if args.key?(:time_value)
          @timestamp_value = args[:timestamp_value] if args.key?(:timestamp_value)
        end
      end
      
      # A value of a field, including its frequency.
      class GooglePrivacyDlpV2ValueFrequency
        include Google::Apis::Core::Hashable
      
        # How many times the value is contained in the field.
        # Corresponds to the JSON property `count`
        # @return [Fixnum]
        attr_accessor :count
      
        # Set of primitive values supported by the system.
        # Note that for the purposes of inspection or transformation, the number
        # of bytes considered to comprise a 'Value' is based on its representation
        # as a UTF-8 encoded string. For example, if 'integer_value' is set to
        # 123456789, the number of bytes would be counted as 9, even though an
        # int64 only holds up to 8 bytes of data.
        # Corresponds to the JSON property `value`
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2Value]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @count = args[:count] if args.key?(:count)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Message defining a list of words or phrases to search for in the data.
      class GooglePrivacyDlpV2WordList
        include Google::Apis::Core::Hashable
      
        # Words or phrases defining the dictionary. The dictionary must contain
        # at least one phrase and every phrase must contain at least 2 characters
        # that are letters or digits. [required]
        # Corresponds to the JSON property `words`
        # @return [Array<String>]
        attr_accessor :words
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @words = args[:words] if args.key?(:words)
        end
      end
      
      # A generic empty message that you can re-use to avoid defining duplicated
      # empty messages in your APIs. A typical example is to use it as the request
      # or the response type of an API method. For instance:
      # service Foo `
      # rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);
      # `
      # The JSON representation for `Empty` is empty JSON object ````.
      class GoogleProtobufEmpty
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # The `Status` type defines a logical error model that is suitable for
      # different programming environments, including REST APIs and RPC APIs. It is
      # used by [gRPC](https://github.com/grpc). Each `Status` message contains
      # three pieces of data: error code, error message, and error details.
      # You can find out more about this error model and how to work with it in the
      # [API Design Guide](https://cloud.google.com/apis/design/errors).
      class GoogleRpcStatus
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
      
      # Represents a whole or partial calendar date, e.g. a birthday. The time of day
      # and time zone are either specified elsewhere or are not significant. The date
      # is relative to the Proleptic Gregorian Calendar. This can represent:
      # * A full date, with non-zero year, month and day values
      # * A month and day value, with a zero year, e.g. an anniversary
      # * A year on its own, with zero month and day values
      # * A year and month value, with a zero day, e.g. a credit card expiration date
      # Related types are google.type.TimeOfDay and `google.protobuf.Timestamp`.
      class GoogleTypeDate
        include Google::Apis::Core::Hashable
      
        # Day of month. Must be from 1 to 31 and valid for the year and month, or 0
        # if specifying a year by itself or a year and month where the day is not
        # significant.
        # Corresponds to the JSON property `day`
        # @return [Fixnum]
        attr_accessor :day
      
        # Month of year. Must be from 1 to 12, or 0 if specifying a year without a
        # month and day.
        # Corresponds to the JSON property `month`
        # @return [Fixnum]
        attr_accessor :month
      
        # Year of date. Must be from 1 to 9999, or 0 if specifying a date without
        # a year.
        # Corresponds to the JSON property `year`
        # @return [Fixnum]
        attr_accessor :year
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @day = args[:day] if args.key?(:day)
          @month = args[:month] if args.key?(:month)
          @year = args[:year] if args.key?(:year)
        end
      end
      
      # Represents a time of day. The date and time zone are either not significant
      # or are specified elsewhere. An API may choose to allow leap seconds. Related
      # types are google.type.Date and `google.protobuf.Timestamp`.
      class GoogleTypeTimeOfDay
        include Google::Apis::Core::Hashable
      
        # Hours of day in 24 hour format. Should be from 0 to 23. An API may choose
        # to allow the value "24:00:00" for scenarios like business closing time.
        # Corresponds to the JSON property `hours`
        # @return [Fixnum]
        attr_accessor :hours
      
        # Minutes of hour of day. Must be from 0 to 59.
        # Corresponds to the JSON property `minutes`
        # @return [Fixnum]
        attr_accessor :minutes
      
        # Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999.
        # Corresponds to the JSON property `nanos`
        # @return [Fixnum]
        attr_accessor :nanos
      
        # Seconds of minutes of the time. Must normally be from 0 to 59. An API may
        # allow the value 60 if it allows leap-seconds.
        # Corresponds to the JSON property `seconds`
        # @return [Fixnum]
        attr_accessor :seconds
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @hours = args[:hours] if args.key?(:hours)
          @minutes = args[:minutes] if args.key?(:minutes)
          @nanos = args[:nanos] if args.key?(:nanos)
          @seconds = args[:seconds] if args.key?(:seconds)
        end
      end
    end
  end
end
