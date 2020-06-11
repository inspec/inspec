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
      
      class GooglePrivacyDlpV2Action
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2ActivateJobTriggerRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2AnalyzeDataSourceRiskDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2AuxiliaryTable
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2BigQueryField
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2BigQueryKey
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2BigQueryOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2BigQueryTable
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2BoundingBox
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2Bucket
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2BucketingConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2ByteContentItem
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2CancelDlpJobRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2CategoricalStatsConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2CategoricalStatsHistogramBucket
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2CategoricalStatsResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2CharacterMaskConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2CharsToIgnore
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2CloudStorageFileSet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2CloudStorageOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2CloudStoragePath
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2CloudStorageRegexFileSet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2Color
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2Condition
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2Conditions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2ContentItem
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2ContentLocation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2CreateDeidentifyTemplateRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2CreateDlpJobRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2CreateInspectTemplateRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2CreateJobTriggerRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2CreateStoredInfoTypeRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2CryptoDeterministicConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2CryptoHashConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2CryptoKey
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2CryptoReplaceFfxFpeConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2CustomInfoType
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2DatastoreKey
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2DatastoreOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2DateShiftConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2DateTime
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2DeidentifyConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2DeidentifyContentRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2DeidentifyContentResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2DeidentifyTemplate
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2DeltaPresenceEstimationConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2DeltaPresenceEstimationHistogramBucket
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2DeltaPresenceEstimationQuasiIdValues
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2DeltaPresenceEstimationResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2DetectionRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2Dictionary
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2DlpJob
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2DocumentLocation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2EntityId
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2Error
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2ExcludeInfoTypes
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2ExclusionRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2Expressions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2FieldId
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2FieldTransformation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2FileSet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2Finding
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2FindingLimits
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2FixedSizeBucketingConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2HotwordRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2ImageLocation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2ImageRedactionConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2InfoType
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2InfoTypeDescription
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2InfoTypeLimit
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2InfoTypeStats
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2InfoTypeTransformation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2InfoTypeTransformations
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2InspectConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2InspectContentRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2InspectContentResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2InspectDataSourceDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2InspectJobConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2InspectResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2InspectTemplate
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2InspectionRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2InspectionRuleSet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2JobNotificationEmails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2JobTrigger
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2KAnonymityConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2KAnonymityEquivalenceClass
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2KAnonymityHistogramBucket
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2KAnonymityResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2KMapEstimationConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2KMapEstimationHistogramBucket
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2KMapEstimationQuasiIdValues
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2KMapEstimationResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2Key
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2KindExpression
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2KmsWrappedCryptoKey
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2LDiversityConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2LDiversityEquivalenceClass
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2LDiversityHistogramBucket
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2LDiversityResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2LargeCustomDictionaryConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2LargeCustomDictionaryStats
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2LikelihoodAdjustment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2ListDeidentifyTemplatesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2ListDlpJobsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2ListInfoTypesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2ListInspectTemplatesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2ListJobTriggersResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2ListStoredInfoTypesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2Location
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2NumericalStatsConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2NumericalStatsResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2OutputStorageConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2PartitionId
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2PathElement
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2PrimitiveTransformation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2PrivacyMetric
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2Proximity
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2PublishFindingsToCloudDataCatalog
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2PublishSummaryToCscc
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2PublishToPubSub
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2PublishToStackdriver
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2QuasiId
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2QuasiIdField
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2QuasiIdentifierField
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2QuoteInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2Range
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2RecordCondition
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2RecordKey
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2RecordLocation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2RecordSuppression
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2RecordTransformations
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2RedactConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2RedactImageRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2RedactImageResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2Regex
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2ReidentifyContentRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2ReidentifyContentResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2ReplaceValueConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2ReplaceWithInfoTypeConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2RequestedOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2Result
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2RiskAnalysisJobConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2Row
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2SaveFindings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2Schedule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2StatisticalTable
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2StorageConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2StoredInfoType
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2StoredInfoTypeConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2StoredInfoTypeStats
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2StoredInfoTypeVersion
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2StoredType
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2SummaryResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2SurrogateType
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2Table
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2TableLocation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2TaggedField
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2TimePartConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2TimeZone
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2TimespanConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2TransformationOverview
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2TransformationSummary
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2TransientCryptoKey
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2Trigger
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2UnwrappedCryptoKey
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2UpdateDeidentifyTemplateRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2UpdateInspectTemplateRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2UpdateJobTriggerRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2UpdateStoredInfoTypeRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2Value
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2ValueFrequency
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2WordList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleProtobufEmpty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleRpcStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleTypeDate
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleTypeTimeOfDay
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePrivacyDlpV2Action
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :job_notification_emails, as: 'jobNotificationEmails', class: Google::Apis::DlpV2::GooglePrivacyDlpV2JobNotificationEmails, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2JobNotificationEmails::Representation
      
          property :pub_sub, as: 'pubSub', class: Google::Apis::DlpV2::GooglePrivacyDlpV2PublishToPubSub, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2PublishToPubSub::Representation
      
          property :publish_findings_to_cloud_data_catalog, as: 'publishFindingsToCloudDataCatalog', class: Google::Apis::DlpV2::GooglePrivacyDlpV2PublishFindingsToCloudDataCatalog, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2PublishFindingsToCloudDataCatalog::Representation
      
          property :publish_summary_to_cscc, as: 'publishSummaryToCscc', class: Google::Apis::DlpV2::GooglePrivacyDlpV2PublishSummaryToCscc, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2PublishSummaryToCscc::Representation
      
          property :publish_to_stackdriver, as: 'publishToStackdriver', class: Google::Apis::DlpV2::GooglePrivacyDlpV2PublishToStackdriver, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2PublishToStackdriver::Representation
      
          property :save_findings, as: 'saveFindings', class: Google::Apis::DlpV2::GooglePrivacyDlpV2SaveFindings, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2SaveFindings::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2ActivateJobTriggerRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class GooglePrivacyDlpV2AnalyzeDataSourceRiskDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :categorical_stats_result, as: 'categoricalStatsResult', class: Google::Apis::DlpV2::GooglePrivacyDlpV2CategoricalStatsResult, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2CategoricalStatsResult::Representation
      
          property :delta_presence_estimation_result, as: 'deltaPresenceEstimationResult', class: Google::Apis::DlpV2::GooglePrivacyDlpV2DeltaPresenceEstimationResult, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2DeltaPresenceEstimationResult::Representation
      
          property :k_anonymity_result, as: 'kAnonymityResult', class: Google::Apis::DlpV2::GooglePrivacyDlpV2KAnonymityResult, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2KAnonymityResult::Representation
      
          property :k_map_estimation_result, as: 'kMapEstimationResult', class: Google::Apis::DlpV2::GooglePrivacyDlpV2KMapEstimationResult, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2KMapEstimationResult::Representation
      
          property :l_diversity_result, as: 'lDiversityResult', class: Google::Apis::DlpV2::GooglePrivacyDlpV2LDiversityResult, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2LDiversityResult::Representation
      
          property :numerical_stats_result, as: 'numericalStatsResult', class: Google::Apis::DlpV2::GooglePrivacyDlpV2NumericalStatsResult, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2NumericalStatsResult::Representation
      
          property :requested_privacy_metric, as: 'requestedPrivacyMetric', class: Google::Apis::DlpV2::GooglePrivacyDlpV2PrivacyMetric, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2PrivacyMetric::Representation
      
          property :requested_source_table, as: 'requestedSourceTable', class: Google::Apis::DlpV2::GooglePrivacyDlpV2BigQueryTable, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2BigQueryTable::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2AuxiliaryTable
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :quasi_ids, as: 'quasiIds', class: Google::Apis::DlpV2::GooglePrivacyDlpV2QuasiIdField, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2QuasiIdField::Representation
      
          property :relative_frequency, as: 'relativeFrequency', class: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId::Representation
      
          property :table, as: 'table', class: Google::Apis::DlpV2::GooglePrivacyDlpV2BigQueryTable, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2BigQueryTable::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2BigQueryField
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :field, as: 'field', class: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId::Representation
      
          property :table, as: 'table', class: Google::Apis::DlpV2::GooglePrivacyDlpV2BigQueryTable, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2BigQueryTable::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2BigQueryKey
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :row_number, :numeric_string => true, as: 'rowNumber'
          property :table_reference, as: 'tableReference', class: Google::Apis::DlpV2::GooglePrivacyDlpV2BigQueryTable, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2BigQueryTable::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2BigQueryOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :excluded_fields, as: 'excludedFields', class: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId::Representation
      
          collection :identifying_fields, as: 'identifyingFields', class: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId::Representation
      
          property :rows_limit, :numeric_string => true, as: 'rowsLimit'
          property :rows_limit_percent, as: 'rowsLimitPercent'
          property :sample_method, as: 'sampleMethod'
          property :table_reference, as: 'tableReference', class: Google::Apis::DlpV2::GooglePrivacyDlpV2BigQueryTable, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2BigQueryTable::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2BigQueryTable
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dataset_id, as: 'datasetId'
          property :project_id, as: 'projectId'
          property :table_id, as: 'tableId'
        end
      end
      
      class GooglePrivacyDlpV2BoundingBox
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :height, as: 'height'
          property :left, as: 'left'
          property :top, as: 'top'
          property :width, as: 'width'
        end
      end
      
      class GooglePrivacyDlpV2Bucket
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :max, as: 'max', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Value, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Value::Representation
      
          property :min, as: 'min', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Value, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Value::Representation
      
          property :replacement_value, as: 'replacementValue', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Value, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Value::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2BucketingConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :buckets, as: 'buckets', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Bucket, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Bucket::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2ByteContentItem
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :data, :base64 => true, as: 'data'
          property :type, as: 'type'
        end
      end
      
      class GooglePrivacyDlpV2CancelDlpJobRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class GooglePrivacyDlpV2CategoricalStatsConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :field, as: 'field', class: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2CategoricalStatsHistogramBucket
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bucket_size, :numeric_string => true, as: 'bucketSize'
          property :bucket_value_count, :numeric_string => true, as: 'bucketValueCount'
          collection :bucket_values, as: 'bucketValues', class: Google::Apis::DlpV2::GooglePrivacyDlpV2ValueFrequency, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2ValueFrequency::Representation
      
          property :value_frequency_lower_bound, :numeric_string => true, as: 'valueFrequencyLowerBound'
          property :value_frequency_upper_bound, :numeric_string => true, as: 'valueFrequencyUpperBound'
        end
      end
      
      class GooglePrivacyDlpV2CategoricalStatsResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :value_frequency_histogram_buckets, as: 'valueFrequencyHistogramBuckets', class: Google::Apis::DlpV2::GooglePrivacyDlpV2CategoricalStatsHistogramBucket, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2CategoricalStatsHistogramBucket::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2CharacterMaskConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :characters_to_ignore, as: 'charactersToIgnore', class: Google::Apis::DlpV2::GooglePrivacyDlpV2CharsToIgnore, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2CharsToIgnore::Representation
      
          property :masking_character, as: 'maskingCharacter'
          property :number_to_mask, as: 'numberToMask'
          property :reverse_order, as: 'reverseOrder'
        end
      end
      
      class GooglePrivacyDlpV2CharsToIgnore
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :characters_to_skip, as: 'charactersToSkip'
          property :common_characters_to_ignore, as: 'commonCharactersToIgnore'
        end
      end
      
      class GooglePrivacyDlpV2CloudStorageFileSet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :url, as: 'url'
        end
      end
      
      class GooglePrivacyDlpV2CloudStorageOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bytes_limit_per_file, :numeric_string => true, as: 'bytesLimitPerFile'
          property :bytes_limit_per_file_percent, as: 'bytesLimitPerFilePercent'
          property :file_set, as: 'fileSet', class: Google::Apis::DlpV2::GooglePrivacyDlpV2FileSet, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2FileSet::Representation
      
          collection :file_types, as: 'fileTypes'
          property :files_limit_percent, as: 'filesLimitPercent'
          property :sample_method, as: 'sampleMethod'
        end
      end
      
      class GooglePrivacyDlpV2CloudStoragePath
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :path, as: 'path'
        end
      end
      
      class GooglePrivacyDlpV2CloudStorageRegexFileSet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bucket_name, as: 'bucketName'
          collection :exclude_regex, as: 'excludeRegex'
          collection :include_regex, as: 'includeRegex'
        end
      end
      
      class GooglePrivacyDlpV2Color
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :blue, as: 'blue'
          property :green, as: 'green'
          property :red, as: 'red'
        end
      end
      
      class GooglePrivacyDlpV2Condition
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :field, as: 'field', class: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId::Representation
      
          property :operator, as: 'operator'
          property :value, as: 'value', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Value, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Value::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2Conditions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :conditions, as: 'conditions', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Condition, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Condition::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2ContentItem
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :byte_item, as: 'byteItem', class: Google::Apis::DlpV2::GooglePrivacyDlpV2ByteContentItem, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2ByteContentItem::Representation
      
          property :table, as: 'table', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Table, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Table::Representation
      
          property :value, as: 'value'
        end
      end
      
      class GooglePrivacyDlpV2ContentLocation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :container_name, as: 'containerName'
          property :container_timestamp, as: 'containerTimestamp'
          property :container_version, as: 'containerVersion'
          property :document_location, as: 'documentLocation', class: Google::Apis::DlpV2::GooglePrivacyDlpV2DocumentLocation, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2DocumentLocation::Representation
      
          property :image_location, as: 'imageLocation', class: Google::Apis::DlpV2::GooglePrivacyDlpV2ImageLocation, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2ImageLocation::Representation
      
          property :record_location, as: 'recordLocation', class: Google::Apis::DlpV2::GooglePrivacyDlpV2RecordLocation, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2RecordLocation::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2CreateDeidentifyTemplateRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :deidentify_template, as: 'deidentifyTemplate', class: Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyTemplate, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyTemplate::Representation
      
          property :template_id, as: 'templateId'
        end
      end
      
      class GooglePrivacyDlpV2CreateDlpJobRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :inspect_job, as: 'inspectJob', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectJobConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectJobConfig::Representation
      
          property :job_id, as: 'jobId'
          property :risk_job, as: 'riskJob', class: Google::Apis::DlpV2::GooglePrivacyDlpV2RiskAnalysisJobConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2RiskAnalysisJobConfig::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2CreateInspectTemplateRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :inspect_template, as: 'inspectTemplate', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate::Representation
      
          property :template_id, as: 'templateId'
        end
      end
      
      class GooglePrivacyDlpV2CreateJobTriggerRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :job_trigger, as: 'jobTrigger', class: Google::Apis::DlpV2::GooglePrivacyDlpV2JobTrigger, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2JobTrigger::Representation
      
          property :trigger_id, as: 'triggerId'
        end
      end
      
      class GooglePrivacyDlpV2CreateStoredInfoTypeRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :config, as: 'config', class: Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoTypeConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoTypeConfig::Representation
      
          property :stored_info_type_id, as: 'storedInfoTypeId'
        end
      end
      
      class GooglePrivacyDlpV2CryptoDeterministicConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :context, as: 'context', class: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId::Representation
      
          property :crypto_key, as: 'cryptoKey', class: Google::Apis::DlpV2::GooglePrivacyDlpV2CryptoKey, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2CryptoKey::Representation
      
          property :surrogate_info_type, as: 'surrogateInfoType', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2CryptoHashConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :crypto_key, as: 'cryptoKey', class: Google::Apis::DlpV2::GooglePrivacyDlpV2CryptoKey, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2CryptoKey::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2CryptoKey
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kms_wrapped, as: 'kmsWrapped', class: Google::Apis::DlpV2::GooglePrivacyDlpV2KmsWrappedCryptoKey, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2KmsWrappedCryptoKey::Representation
      
          property :transient, as: 'transient', class: Google::Apis::DlpV2::GooglePrivacyDlpV2TransientCryptoKey, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2TransientCryptoKey::Representation
      
          property :unwrapped, as: 'unwrapped', class: Google::Apis::DlpV2::GooglePrivacyDlpV2UnwrappedCryptoKey, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2UnwrappedCryptoKey::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2CryptoReplaceFfxFpeConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :common_alphabet, as: 'commonAlphabet'
          property :context, as: 'context', class: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId::Representation
      
          property :crypto_key, as: 'cryptoKey', class: Google::Apis::DlpV2::GooglePrivacyDlpV2CryptoKey, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2CryptoKey::Representation
      
          property :custom_alphabet, as: 'customAlphabet'
          property :radix, as: 'radix'
          property :surrogate_info_type, as: 'surrogateInfoType', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2CustomInfoType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :detection_rules, as: 'detectionRules', class: Google::Apis::DlpV2::GooglePrivacyDlpV2DetectionRule, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2DetectionRule::Representation
      
          property :dictionary, as: 'dictionary', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Dictionary, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Dictionary::Representation
      
          property :exclusion_type, as: 'exclusionType'
          property :info_type, as: 'infoType', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType::Representation
      
          property :likelihood, as: 'likelihood'
          property :regex, as: 'regex', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Regex, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Regex::Representation
      
          property :stored_type, as: 'storedType', class: Google::Apis::DlpV2::GooglePrivacyDlpV2StoredType, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2StoredType::Representation
      
          property :surrogate_type, as: 'surrogateType', class: Google::Apis::DlpV2::GooglePrivacyDlpV2SurrogateType, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2SurrogateType::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2DatastoreKey
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :entity_key, as: 'entityKey', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Key, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Key::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2DatastoreOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind', class: Google::Apis::DlpV2::GooglePrivacyDlpV2KindExpression, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2KindExpression::Representation
      
          property :partition_id, as: 'partitionId', class: Google::Apis::DlpV2::GooglePrivacyDlpV2PartitionId, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2PartitionId::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2DateShiftConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :context, as: 'context', class: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId::Representation
      
          property :crypto_key, as: 'cryptoKey', class: Google::Apis::DlpV2::GooglePrivacyDlpV2CryptoKey, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2CryptoKey::Representation
      
          property :lower_bound_days, as: 'lowerBoundDays'
          property :upper_bound_days, as: 'upperBoundDays'
        end
      end
      
      class GooglePrivacyDlpV2DateTime
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :date, as: 'date', class: Google::Apis::DlpV2::GoogleTypeDate, decorator: Google::Apis::DlpV2::GoogleTypeDate::Representation
      
          property :day_of_week, as: 'dayOfWeek'
          property :time, as: 'time', class: Google::Apis::DlpV2::GoogleTypeTimeOfDay, decorator: Google::Apis::DlpV2::GoogleTypeTimeOfDay::Representation
      
          property :time_zone, as: 'timeZone', class: Google::Apis::DlpV2::GooglePrivacyDlpV2TimeZone, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2TimeZone::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2DeidentifyConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :info_type_transformations, as: 'infoTypeTransformations', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoTypeTransformations, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoTypeTransformations::Representation
      
          property :record_transformations, as: 'recordTransformations', class: Google::Apis::DlpV2::GooglePrivacyDlpV2RecordTransformations, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2RecordTransformations::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2DeidentifyContentRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :deidentify_config, as: 'deidentifyConfig', class: Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyConfig::Representation
      
          property :deidentify_template_name, as: 'deidentifyTemplateName'
          property :inspect_config, as: 'inspectConfig', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectConfig::Representation
      
          property :inspect_template_name, as: 'inspectTemplateName'
          property :item, as: 'item', class: Google::Apis::DlpV2::GooglePrivacyDlpV2ContentItem, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2ContentItem::Representation
      
          property :location, as: 'location'
        end
      end
      
      class GooglePrivacyDlpV2DeidentifyContentResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :item, as: 'item', class: Google::Apis::DlpV2::GooglePrivacyDlpV2ContentItem, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2ContentItem::Representation
      
          property :overview, as: 'overview', class: Google::Apis::DlpV2::GooglePrivacyDlpV2TransformationOverview, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2TransformationOverview::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2DeidentifyTemplate
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :deidentify_config, as: 'deidentifyConfig', class: Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyConfig::Representation
      
          property :description, as: 'description'
          property :display_name, as: 'displayName'
          property :name, as: 'name'
          property :update_time, as: 'updateTime'
        end
      end
      
      class GooglePrivacyDlpV2DeltaPresenceEstimationConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :auxiliary_tables, as: 'auxiliaryTables', class: Google::Apis::DlpV2::GooglePrivacyDlpV2StatisticalTable, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2StatisticalTable::Representation
      
          collection :quasi_ids, as: 'quasiIds', class: Google::Apis::DlpV2::GooglePrivacyDlpV2QuasiId, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2QuasiId::Representation
      
          property :region_code, as: 'regionCode'
        end
      end
      
      class GooglePrivacyDlpV2DeltaPresenceEstimationHistogramBucket
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bucket_size, :numeric_string => true, as: 'bucketSize'
          property :bucket_value_count, :numeric_string => true, as: 'bucketValueCount'
          collection :bucket_values, as: 'bucketValues', class: Google::Apis::DlpV2::GooglePrivacyDlpV2DeltaPresenceEstimationQuasiIdValues, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2DeltaPresenceEstimationQuasiIdValues::Representation
      
          property :max_probability, as: 'maxProbability'
          property :min_probability, as: 'minProbability'
        end
      end
      
      class GooglePrivacyDlpV2DeltaPresenceEstimationQuasiIdValues
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :estimated_probability, as: 'estimatedProbability'
          collection :quasi_ids_values, as: 'quasiIdsValues', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Value, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Value::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2DeltaPresenceEstimationResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :delta_presence_estimation_histogram, as: 'deltaPresenceEstimationHistogram', class: Google::Apis::DlpV2::GooglePrivacyDlpV2DeltaPresenceEstimationHistogramBucket, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2DeltaPresenceEstimationHistogramBucket::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2DetectionRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :hotword_rule, as: 'hotwordRule', class: Google::Apis::DlpV2::GooglePrivacyDlpV2HotwordRule, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2HotwordRule::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2Dictionary
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cloud_storage_path, as: 'cloudStoragePath', class: Google::Apis::DlpV2::GooglePrivacyDlpV2CloudStoragePath, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2CloudStoragePath::Representation
      
          property :word_list, as: 'wordList', class: Google::Apis::DlpV2::GooglePrivacyDlpV2WordList, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2WordList::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2DlpJob
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :end_time, as: 'endTime'
          collection :errors, as: 'errors', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Error, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Error::Representation
      
          property :inspect_details, as: 'inspectDetails', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectDataSourceDetails, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectDataSourceDetails::Representation
      
          property :job_trigger_name, as: 'jobTriggerName'
          property :name, as: 'name'
          property :risk_details, as: 'riskDetails', class: Google::Apis::DlpV2::GooglePrivacyDlpV2AnalyzeDataSourceRiskDetails, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2AnalyzeDataSourceRiskDetails::Representation
      
          property :start_time, as: 'startTime'
          property :state, as: 'state'
          property :type, as: 'type'
        end
      end
      
      class GooglePrivacyDlpV2DocumentLocation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :file_offset, :numeric_string => true, as: 'fileOffset'
        end
      end
      
      class GooglePrivacyDlpV2EntityId
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :field, as: 'field', class: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2Error
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :details, as: 'details', class: Google::Apis::DlpV2::GoogleRpcStatus, decorator: Google::Apis::DlpV2::GoogleRpcStatus::Representation
      
          collection :timestamps, as: 'timestamps'
        end
      end
      
      class GooglePrivacyDlpV2ExcludeInfoTypes
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :info_types, as: 'infoTypes', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2ExclusionRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dictionary, as: 'dictionary', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Dictionary, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Dictionary::Representation
      
          property :exclude_info_types, as: 'excludeInfoTypes', class: Google::Apis::DlpV2::GooglePrivacyDlpV2ExcludeInfoTypes, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2ExcludeInfoTypes::Representation
      
          property :matching_type, as: 'matchingType'
          property :regex, as: 'regex', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Regex, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Regex::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2Expressions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :conditions, as: 'conditions', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Conditions, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Conditions::Representation
      
          property :logical_operator, as: 'logicalOperator'
        end
      end
      
      class GooglePrivacyDlpV2FieldId
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
        end
      end
      
      class GooglePrivacyDlpV2FieldTransformation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :condition, as: 'condition', class: Google::Apis::DlpV2::GooglePrivacyDlpV2RecordCondition, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2RecordCondition::Representation
      
          collection :fields, as: 'fields', class: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId::Representation
      
          property :info_type_transformations, as: 'infoTypeTransformations', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoTypeTransformations, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoTypeTransformations::Representation
      
          property :primitive_transformation, as: 'primitiveTransformation', class: Google::Apis::DlpV2::GooglePrivacyDlpV2PrimitiveTransformation, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2PrimitiveTransformation::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2FileSet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :regex_file_set, as: 'regexFileSet', class: Google::Apis::DlpV2::GooglePrivacyDlpV2CloudStorageRegexFileSet, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2CloudStorageRegexFileSet::Representation
      
          property :url, as: 'url'
        end
      end
      
      class GooglePrivacyDlpV2Finding
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :info_type, as: 'infoType', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType::Representation
      
          property :likelihood, as: 'likelihood'
          property :location, as: 'location', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Location, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Location::Representation
      
          property :quote, as: 'quote'
          property :quote_info, as: 'quoteInfo', class: Google::Apis::DlpV2::GooglePrivacyDlpV2QuoteInfo, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2QuoteInfo::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2FindingLimits
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :max_findings_per_info_type, as: 'maxFindingsPerInfoType', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoTypeLimit, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoTypeLimit::Representation
      
          property :max_findings_per_item, as: 'maxFindingsPerItem'
          property :max_findings_per_request, as: 'maxFindingsPerRequest'
        end
      end
      
      class GooglePrivacyDlpV2FixedSizeBucketingConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bucket_size, as: 'bucketSize'
          property :lower_bound, as: 'lowerBound', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Value, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Value::Representation
      
          property :upper_bound, as: 'upperBound', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Value, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Value::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2HotwordRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :hotword_regex, as: 'hotwordRegex', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Regex, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Regex::Representation
      
          property :likelihood_adjustment, as: 'likelihoodAdjustment', class: Google::Apis::DlpV2::GooglePrivacyDlpV2LikelihoodAdjustment, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2LikelihoodAdjustment::Representation
      
          property :proximity, as: 'proximity', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Proximity, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Proximity::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2ImageLocation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :bounding_boxes, as: 'boundingBoxes', class: Google::Apis::DlpV2::GooglePrivacyDlpV2BoundingBox, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2BoundingBox::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2ImageRedactionConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :info_type, as: 'infoType', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType::Representation
      
          property :redact_all_text, as: 'redactAllText'
          property :redaction_color, as: 'redactionColor', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Color, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Color::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2InfoType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
        end
      end
      
      class GooglePrivacyDlpV2InfoTypeDescription
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :display_name, as: 'displayName'
          property :name, as: 'name'
          collection :supported_by, as: 'supportedBy'
        end
      end
      
      class GooglePrivacyDlpV2InfoTypeLimit
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :info_type, as: 'infoType', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType::Representation
      
          property :max_findings, as: 'maxFindings'
        end
      end
      
      class GooglePrivacyDlpV2InfoTypeStats
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :count, :numeric_string => true, as: 'count'
          property :info_type, as: 'infoType', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2InfoTypeTransformation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :info_types, as: 'infoTypes', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType::Representation
      
          property :primitive_transformation, as: 'primitiveTransformation', class: Google::Apis::DlpV2::GooglePrivacyDlpV2PrimitiveTransformation, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2PrimitiveTransformation::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2InfoTypeTransformations
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :transformations, as: 'transformations', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoTypeTransformation, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoTypeTransformation::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2InspectConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :content_options, as: 'contentOptions'
          collection :custom_info_types, as: 'customInfoTypes', class: Google::Apis::DlpV2::GooglePrivacyDlpV2CustomInfoType, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2CustomInfoType::Representation
      
          property :exclude_info_types, as: 'excludeInfoTypes'
          property :include_quote, as: 'includeQuote'
          collection :info_types, as: 'infoTypes', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType::Representation
      
          property :limits, as: 'limits', class: Google::Apis::DlpV2::GooglePrivacyDlpV2FindingLimits, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2FindingLimits::Representation
      
          property :min_likelihood, as: 'minLikelihood'
          collection :rule_set, as: 'ruleSet', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectionRuleSet, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectionRuleSet::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2InspectContentRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :inspect_config, as: 'inspectConfig', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectConfig::Representation
      
          property :inspect_template_name, as: 'inspectTemplateName'
          property :item, as: 'item', class: Google::Apis::DlpV2::GooglePrivacyDlpV2ContentItem, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2ContentItem::Representation
      
          property :location, as: 'location'
        end
      end
      
      class GooglePrivacyDlpV2InspectContentResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :result, as: 'result', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectResult, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectResult::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2InspectDataSourceDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :requested_options, as: 'requestedOptions', class: Google::Apis::DlpV2::GooglePrivacyDlpV2RequestedOptions, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2RequestedOptions::Representation
      
          property :result, as: 'result', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Result, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Result::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2InspectJobConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :actions, as: 'actions', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Action, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Action::Representation
      
          property :inspect_config, as: 'inspectConfig', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectConfig::Representation
      
          property :inspect_template_name, as: 'inspectTemplateName'
          property :storage_config, as: 'storageConfig', class: Google::Apis::DlpV2::GooglePrivacyDlpV2StorageConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2StorageConfig::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2InspectResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :findings, as: 'findings', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Finding, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Finding::Representation
      
          property :findings_truncated, as: 'findingsTruncated'
        end
      end
      
      class GooglePrivacyDlpV2InspectTemplate
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :description, as: 'description'
          property :display_name, as: 'displayName'
          property :inspect_config, as: 'inspectConfig', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectConfig::Representation
      
          property :name, as: 'name'
          property :update_time, as: 'updateTime'
        end
      end
      
      class GooglePrivacyDlpV2InspectionRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :exclusion_rule, as: 'exclusionRule', class: Google::Apis::DlpV2::GooglePrivacyDlpV2ExclusionRule, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2ExclusionRule::Representation
      
          property :hotword_rule, as: 'hotwordRule', class: Google::Apis::DlpV2::GooglePrivacyDlpV2HotwordRule, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2HotwordRule::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2InspectionRuleSet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :info_types, as: 'infoTypes', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType::Representation
      
          collection :rules, as: 'rules', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectionRule, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectionRule::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2JobNotificationEmails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class GooglePrivacyDlpV2JobTrigger
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :description, as: 'description'
          property :display_name, as: 'displayName'
          collection :errors, as: 'errors', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Error, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Error::Representation
      
          property :inspect_job, as: 'inspectJob', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectJobConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectJobConfig::Representation
      
          property :last_run_time, as: 'lastRunTime'
          property :name, as: 'name'
          property :status, as: 'status'
          collection :triggers, as: 'triggers', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Trigger, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Trigger::Representation
      
          property :update_time, as: 'updateTime'
        end
      end
      
      class GooglePrivacyDlpV2KAnonymityConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :entity_id, as: 'entityId', class: Google::Apis::DlpV2::GooglePrivacyDlpV2EntityId, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2EntityId::Representation
      
          collection :quasi_ids, as: 'quasiIds', class: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2KAnonymityEquivalenceClass
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :equivalence_class_size, :numeric_string => true, as: 'equivalenceClassSize'
          collection :quasi_ids_values, as: 'quasiIdsValues', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Value, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Value::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2KAnonymityHistogramBucket
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bucket_size, :numeric_string => true, as: 'bucketSize'
          property :bucket_value_count, :numeric_string => true, as: 'bucketValueCount'
          collection :bucket_values, as: 'bucketValues', class: Google::Apis::DlpV2::GooglePrivacyDlpV2KAnonymityEquivalenceClass, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2KAnonymityEquivalenceClass::Representation
      
          property :equivalence_class_size_lower_bound, :numeric_string => true, as: 'equivalenceClassSizeLowerBound'
          property :equivalence_class_size_upper_bound, :numeric_string => true, as: 'equivalenceClassSizeUpperBound'
        end
      end
      
      class GooglePrivacyDlpV2KAnonymityResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :equivalence_class_histogram_buckets, as: 'equivalenceClassHistogramBuckets', class: Google::Apis::DlpV2::GooglePrivacyDlpV2KAnonymityHistogramBucket, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2KAnonymityHistogramBucket::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2KMapEstimationConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :auxiliary_tables, as: 'auxiliaryTables', class: Google::Apis::DlpV2::GooglePrivacyDlpV2AuxiliaryTable, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2AuxiliaryTable::Representation
      
          collection :quasi_ids, as: 'quasiIds', class: Google::Apis::DlpV2::GooglePrivacyDlpV2TaggedField, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2TaggedField::Representation
      
          property :region_code, as: 'regionCode'
        end
      end
      
      class GooglePrivacyDlpV2KMapEstimationHistogramBucket
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bucket_size, :numeric_string => true, as: 'bucketSize'
          property :bucket_value_count, :numeric_string => true, as: 'bucketValueCount'
          collection :bucket_values, as: 'bucketValues', class: Google::Apis::DlpV2::GooglePrivacyDlpV2KMapEstimationQuasiIdValues, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2KMapEstimationQuasiIdValues::Representation
      
          property :max_anonymity, :numeric_string => true, as: 'maxAnonymity'
          property :min_anonymity, :numeric_string => true, as: 'minAnonymity'
        end
      end
      
      class GooglePrivacyDlpV2KMapEstimationQuasiIdValues
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :estimated_anonymity, :numeric_string => true, as: 'estimatedAnonymity'
          collection :quasi_ids_values, as: 'quasiIdsValues', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Value, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Value::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2KMapEstimationResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :k_map_estimation_histogram, as: 'kMapEstimationHistogram', class: Google::Apis::DlpV2::GooglePrivacyDlpV2KMapEstimationHistogramBucket, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2KMapEstimationHistogramBucket::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2Key
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :partition_id, as: 'partitionId', class: Google::Apis::DlpV2::GooglePrivacyDlpV2PartitionId, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2PartitionId::Representation
      
          collection :path, as: 'path', class: Google::Apis::DlpV2::GooglePrivacyDlpV2PathElement, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2PathElement::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2KindExpression
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
        end
      end
      
      class GooglePrivacyDlpV2KmsWrappedCryptoKey
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :crypto_key_name, as: 'cryptoKeyName'
          property :wrapped_key, :base64 => true, as: 'wrappedKey'
        end
      end
      
      class GooglePrivacyDlpV2LDiversityConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :quasi_ids, as: 'quasiIds', class: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId::Representation
      
          property :sensitive_attribute, as: 'sensitiveAttribute', class: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2LDiversityEquivalenceClass
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :equivalence_class_size, :numeric_string => true, as: 'equivalenceClassSize'
          property :num_distinct_sensitive_values, :numeric_string => true, as: 'numDistinctSensitiveValues'
          collection :quasi_ids_values, as: 'quasiIdsValues', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Value, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Value::Representation
      
          collection :top_sensitive_values, as: 'topSensitiveValues', class: Google::Apis::DlpV2::GooglePrivacyDlpV2ValueFrequency, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2ValueFrequency::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2LDiversityHistogramBucket
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bucket_size, :numeric_string => true, as: 'bucketSize'
          property :bucket_value_count, :numeric_string => true, as: 'bucketValueCount'
          collection :bucket_values, as: 'bucketValues', class: Google::Apis::DlpV2::GooglePrivacyDlpV2LDiversityEquivalenceClass, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2LDiversityEquivalenceClass::Representation
      
          property :sensitive_value_frequency_lower_bound, :numeric_string => true, as: 'sensitiveValueFrequencyLowerBound'
          property :sensitive_value_frequency_upper_bound, :numeric_string => true, as: 'sensitiveValueFrequencyUpperBound'
        end
      end
      
      class GooglePrivacyDlpV2LDiversityResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :sensitive_value_frequency_histogram_buckets, as: 'sensitiveValueFrequencyHistogramBuckets', class: Google::Apis::DlpV2::GooglePrivacyDlpV2LDiversityHistogramBucket, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2LDiversityHistogramBucket::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2LargeCustomDictionaryConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :big_query_field, as: 'bigQueryField', class: Google::Apis::DlpV2::GooglePrivacyDlpV2BigQueryField, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2BigQueryField::Representation
      
          property :cloud_storage_file_set, as: 'cloudStorageFileSet', class: Google::Apis::DlpV2::GooglePrivacyDlpV2CloudStorageFileSet, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2CloudStorageFileSet::Representation
      
          property :output_path, as: 'outputPath', class: Google::Apis::DlpV2::GooglePrivacyDlpV2CloudStoragePath, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2CloudStoragePath::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2LargeCustomDictionaryStats
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :approx_num_phrases, :numeric_string => true, as: 'approxNumPhrases'
        end
      end
      
      class GooglePrivacyDlpV2LikelihoodAdjustment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :fixed_likelihood, as: 'fixedLikelihood'
          property :relative_likelihood, as: 'relativeLikelihood'
        end
      end
      
      class GooglePrivacyDlpV2ListDeidentifyTemplatesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :deidentify_templates, as: 'deidentifyTemplates', class: Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyTemplate, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyTemplate::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class GooglePrivacyDlpV2ListDlpJobsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :jobs, as: 'jobs', class: Google::Apis::DlpV2::GooglePrivacyDlpV2DlpJob, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2DlpJob::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class GooglePrivacyDlpV2ListInfoTypesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :info_types, as: 'infoTypes', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoTypeDescription, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoTypeDescription::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2ListInspectTemplatesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :inspect_templates, as: 'inspectTemplates', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class GooglePrivacyDlpV2ListJobTriggersResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :job_triggers, as: 'jobTriggers', class: Google::Apis::DlpV2::GooglePrivacyDlpV2JobTrigger, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2JobTrigger::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class GooglePrivacyDlpV2ListStoredInfoTypesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :stored_info_types, as: 'storedInfoTypes', class: Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoType, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoType::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2Location
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :byte_range, as: 'byteRange', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Range, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Range::Representation
      
          property :codepoint_range, as: 'codepointRange', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Range, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Range::Representation
      
          collection :content_locations, as: 'contentLocations', class: Google::Apis::DlpV2::GooglePrivacyDlpV2ContentLocation, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2ContentLocation::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2NumericalStatsConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :field, as: 'field', class: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2NumericalStatsResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :max_value, as: 'maxValue', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Value, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Value::Representation
      
          property :min_value, as: 'minValue', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Value, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Value::Representation
      
          collection :quantile_values, as: 'quantileValues', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Value, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Value::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2OutputStorageConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :output_schema, as: 'outputSchema'
          property :table, as: 'table', class: Google::Apis::DlpV2::GooglePrivacyDlpV2BigQueryTable, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2BigQueryTable::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2PartitionId
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :namespace_id, as: 'namespaceId'
          property :project_id, as: 'projectId'
        end
      end
      
      class GooglePrivacyDlpV2PathElement
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
        end
      end
      
      class GooglePrivacyDlpV2PrimitiveTransformation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bucketing_config, as: 'bucketingConfig', class: Google::Apis::DlpV2::GooglePrivacyDlpV2BucketingConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2BucketingConfig::Representation
      
          property :character_mask_config, as: 'characterMaskConfig', class: Google::Apis::DlpV2::GooglePrivacyDlpV2CharacterMaskConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2CharacterMaskConfig::Representation
      
          property :crypto_deterministic_config, as: 'cryptoDeterministicConfig', class: Google::Apis::DlpV2::GooglePrivacyDlpV2CryptoDeterministicConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2CryptoDeterministicConfig::Representation
      
          property :crypto_hash_config, as: 'cryptoHashConfig', class: Google::Apis::DlpV2::GooglePrivacyDlpV2CryptoHashConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2CryptoHashConfig::Representation
      
          property :crypto_replace_ffx_fpe_config, as: 'cryptoReplaceFfxFpeConfig', class: Google::Apis::DlpV2::GooglePrivacyDlpV2CryptoReplaceFfxFpeConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2CryptoReplaceFfxFpeConfig::Representation
      
          property :date_shift_config, as: 'dateShiftConfig', class: Google::Apis::DlpV2::GooglePrivacyDlpV2DateShiftConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2DateShiftConfig::Representation
      
          property :fixed_size_bucketing_config, as: 'fixedSizeBucketingConfig', class: Google::Apis::DlpV2::GooglePrivacyDlpV2FixedSizeBucketingConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2FixedSizeBucketingConfig::Representation
      
          property :redact_config, as: 'redactConfig', class: Google::Apis::DlpV2::GooglePrivacyDlpV2RedactConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2RedactConfig::Representation
      
          property :replace_config, as: 'replaceConfig', class: Google::Apis::DlpV2::GooglePrivacyDlpV2ReplaceValueConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2ReplaceValueConfig::Representation
      
          property :replace_with_info_type_config, as: 'replaceWithInfoTypeConfig', class: Google::Apis::DlpV2::GooglePrivacyDlpV2ReplaceWithInfoTypeConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2ReplaceWithInfoTypeConfig::Representation
      
          property :time_part_config, as: 'timePartConfig', class: Google::Apis::DlpV2::GooglePrivacyDlpV2TimePartConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2TimePartConfig::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2PrivacyMetric
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :categorical_stats_config, as: 'categoricalStatsConfig', class: Google::Apis::DlpV2::GooglePrivacyDlpV2CategoricalStatsConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2CategoricalStatsConfig::Representation
      
          property :delta_presence_estimation_config, as: 'deltaPresenceEstimationConfig', class: Google::Apis::DlpV2::GooglePrivacyDlpV2DeltaPresenceEstimationConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2DeltaPresenceEstimationConfig::Representation
      
          property :k_anonymity_config, as: 'kAnonymityConfig', class: Google::Apis::DlpV2::GooglePrivacyDlpV2KAnonymityConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2KAnonymityConfig::Representation
      
          property :k_map_estimation_config, as: 'kMapEstimationConfig', class: Google::Apis::DlpV2::GooglePrivacyDlpV2KMapEstimationConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2KMapEstimationConfig::Representation
      
          property :l_diversity_config, as: 'lDiversityConfig', class: Google::Apis::DlpV2::GooglePrivacyDlpV2LDiversityConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2LDiversityConfig::Representation
      
          property :numerical_stats_config, as: 'numericalStatsConfig', class: Google::Apis::DlpV2::GooglePrivacyDlpV2NumericalStatsConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2NumericalStatsConfig::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2Proximity
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :window_after, as: 'windowAfter'
          property :window_before, as: 'windowBefore'
        end
      end
      
      class GooglePrivacyDlpV2PublishFindingsToCloudDataCatalog
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class GooglePrivacyDlpV2PublishSummaryToCscc
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class GooglePrivacyDlpV2PublishToPubSub
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :topic, as: 'topic'
        end
      end
      
      class GooglePrivacyDlpV2PublishToStackdriver
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class GooglePrivacyDlpV2QuasiId
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :custom_tag, as: 'customTag'
          property :field, as: 'field', class: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId::Representation
      
          property :inferred, as: 'inferred', class: Google::Apis::DlpV2::GoogleProtobufEmpty, decorator: Google::Apis::DlpV2::GoogleProtobufEmpty::Representation
      
          property :info_type, as: 'infoType', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2QuasiIdField
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :custom_tag, as: 'customTag'
          property :field, as: 'field', class: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2QuasiIdentifierField
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :custom_tag, as: 'customTag'
          property :field, as: 'field', class: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2QuoteInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :date_time, as: 'dateTime', class: Google::Apis::DlpV2::GooglePrivacyDlpV2DateTime, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2DateTime::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2Range
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end, :numeric_string => true, as: 'end'
          property :start, :numeric_string => true, as: 'start'
        end
      end
      
      class GooglePrivacyDlpV2RecordCondition
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :expressions, as: 'expressions', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Expressions, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Expressions::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2RecordKey
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :big_query_key, as: 'bigQueryKey', class: Google::Apis::DlpV2::GooglePrivacyDlpV2BigQueryKey, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2BigQueryKey::Representation
      
          property :datastore_key, as: 'datastoreKey', class: Google::Apis::DlpV2::GooglePrivacyDlpV2DatastoreKey, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2DatastoreKey::Representation
      
          collection :id_values, as: 'idValues'
        end
      end
      
      class GooglePrivacyDlpV2RecordLocation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :field_id, as: 'fieldId', class: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId::Representation
      
          property :record_key, as: 'recordKey', class: Google::Apis::DlpV2::GooglePrivacyDlpV2RecordKey, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2RecordKey::Representation
      
          property :table_location, as: 'tableLocation', class: Google::Apis::DlpV2::GooglePrivacyDlpV2TableLocation, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2TableLocation::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2RecordSuppression
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :condition, as: 'condition', class: Google::Apis::DlpV2::GooglePrivacyDlpV2RecordCondition, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2RecordCondition::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2RecordTransformations
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :field_transformations, as: 'fieldTransformations', class: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldTransformation, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldTransformation::Representation
      
          collection :record_suppressions, as: 'recordSuppressions', class: Google::Apis::DlpV2::GooglePrivacyDlpV2RecordSuppression, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2RecordSuppression::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2RedactConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class GooglePrivacyDlpV2RedactImageRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :byte_item, as: 'byteItem', class: Google::Apis::DlpV2::GooglePrivacyDlpV2ByteContentItem, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2ByteContentItem::Representation
      
          collection :image_redaction_configs, as: 'imageRedactionConfigs', class: Google::Apis::DlpV2::GooglePrivacyDlpV2ImageRedactionConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2ImageRedactionConfig::Representation
      
          property :include_findings, as: 'includeFindings'
          property :inspect_config, as: 'inspectConfig', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectConfig::Representation
      
          property :location, as: 'location'
        end
      end
      
      class GooglePrivacyDlpV2RedactImageResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :extracted_text, as: 'extractedText'
          property :inspect_result, as: 'inspectResult', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectResult, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectResult::Representation
      
          property :redacted_image, :base64 => true, as: 'redactedImage'
        end
      end
      
      class GooglePrivacyDlpV2Regex
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :group_indexes, as: 'groupIndexes'
          property :pattern, as: 'pattern'
        end
      end
      
      class GooglePrivacyDlpV2ReidentifyContentRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :inspect_config, as: 'inspectConfig', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectConfig::Representation
      
          property :inspect_template_name, as: 'inspectTemplateName'
          property :item, as: 'item', class: Google::Apis::DlpV2::GooglePrivacyDlpV2ContentItem, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2ContentItem::Representation
      
          property :location, as: 'location'
          property :reidentify_config, as: 'reidentifyConfig', class: Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyConfig::Representation
      
          property :reidentify_template_name, as: 'reidentifyTemplateName'
        end
      end
      
      class GooglePrivacyDlpV2ReidentifyContentResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :item, as: 'item', class: Google::Apis::DlpV2::GooglePrivacyDlpV2ContentItem, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2ContentItem::Representation
      
          property :overview, as: 'overview', class: Google::Apis::DlpV2::GooglePrivacyDlpV2TransformationOverview, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2TransformationOverview::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2ReplaceValueConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :new_value, as: 'newValue', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Value, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Value::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2ReplaceWithInfoTypeConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class GooglePrivacyDlpV2RequestedOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :job_config, as: 'jobConfig', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectJobConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectJobConfig::Representation
      
          property :snapshot_inspect_template, as: 'snapshotInspectTemplate', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2Result
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :info_type_stats, as: 'infoTypeStats', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoTypeStats, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoTypeStats::Representation
      
          property :processed_bytes, :numeric_string => true, as: 'processedBytes'
          property :total_estimated_bytes, :numeric_string => true, as: 'totalEstimatedBytes'
        end
      end
      
      class GooglePrivacyDlpV2RiskAnalysisJobConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :actions, as: 'actions', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Action, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Action::Representation
      
          property :privacy_metric, as: 'privacyMetric', class: Google::Apis::DlpV2::GooglePrivacyDlpV2PrivacyMetric, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2PrivacyMetric::Representation
      
          property :source_table, as: 'sourceTable', class: Google::Apis::DlpV2::GooglePrivacyDlpV2BigQueryTable, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2BigQueryTable::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2Row
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :values, as: 'values', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Value, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Value::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2SaveFindings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :output_config, as: 'outputConfig', class: Google::Apis::DlpV2::GooglePrivacyDlpV2OutputStorageConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2OutputStorageConfig::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2Schedule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :recurrence_period_duration, as: 'recurrencePeriodDuration'
        end
      end
      
      class GooglePrivacyDlpV2StatisticalTable
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :quasi_ids, as: 'quasiIds', class: Google::Apis::DlpV2::GooglePrivacyDlpV2QuasiIdentifierField, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2QuasiIdentifierField::Representation
      
          property :relative_frequency, as: 'relativeFrequency', class: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId::Representation
      
          property :table, as: 'table', class: Google::Apis::DlpV2::GooglePrivacyDlpV2BigQueryTable, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2BigQueryTable::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2StorageConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :big_query_options, as: 'bigQueryOptions', class: Google::Apis::DlpV2::GooglePrivacyDlpV2BigQueryOptions, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2BigQueryOptions::Representation
      
          property :cloud_storage_options, as: 'cloudStorageOptions', class: Google::Apis::DlpV2::GooglePrivacyDlpV2CloudStorageOptions, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2CloudStorageOptions::Representation
      
          property :datastore_options, as: 'datastoreOptions', class: Google::Apis::DlpV2::GooglePrivacyDlpV2DatastoreOptions, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2DatastoreOptions::Representation
      
          property :timespan_config, as: 'timespanConfig', class: Google::Apis::DlpV2::GooglePrivacyDlpV2TimespanConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2TimespanConfig::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2StoredInfoType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :current_version, as: 'currentVersion', class: Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoTypeVersion, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoTypeVersion::Representation
      
          property :name, as: 'name'
          collection :pending_versions, as: 'pendingVersions', class: Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoTypeVersion, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoTypeVersion::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2StoredInfoTypeConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :display_name, as: 'displayName'
          property :large_custom_dictionary, as: 'largeCustomDictionary', class: Google::Apis::DlpV2::GooglePrivacyDlpV2LargeCustomDictionaryConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2LargeCustomDictionaryConfig::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2StoredInfoTypeStats
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :large_custom_dictionary, as: 'largeCustomDictionary', class: Google::Apis::DlpV2::GooglePrivacyDlpV2LargeCustomDictionaryStats, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2LargeCustomDictionaryStats::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2StoredInfoTypeVersion
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :config, as: 'config', class: Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoTypeConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoTypeConfig::Representation
      
          property :create_time, as: 'createTime'
          collection :errors, as: 'errors', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Error, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Error::Representation
      
          property :state, as: 'state'
          property :stats, as: 'stats', class: Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoTypeStats, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoTypeStats::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2StoredType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :name, as: 'name'
        end
      end
      
      class GooglePrivacyDlpV2SummaryResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          property :count, :numeric_string => true, as: 'count'
          property :details, as: 'details'
        end
      end
      
      class GooglePrivacyDlpV2SurrogateType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class GooglePrivacyDlpV2Table
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :headers, as: 'headers', class: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId::Representation
      
          collection :rows, as: 'rows', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Row, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Row::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2TableLocation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :row_index, :numeric_string => true, as: 'rowIndex'
        end
      end
      
      class GooglePrivacyDlpV2TaggedField
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :custom_tag, as: 'customTag'
          property :field, as: 'field', class: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId::Representation
      
          property :inferred, as: 'inferred', class: Google::Apis::DlpV2::GoogleProtobufEmpty, decorator: Google::Apis::DlpV2::GoogleProtobufEmpty::Representation
      
          property :info_type, as: 'infoType', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2TimePartConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :part_to_extract, as: 'partToExtract'
        end
      end
      
      class GooglePrivacyDlpV2TimeZone
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :offset_minutes, as: 'offsetMinutes'
        end
      end
      
      class GooglePrivacyDlpV2TimespanConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :enable_auto_population_of_timespan_config, as: 'enableAutoPopulationOfTimespanConfig'
          property :end_time, as: 'endTime'
          property :start_time, as: 'startTime'
          property :timestamp_field, as: 'timestampField', class: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2TransformationOverview
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :transformation_summaries, as: 'transformationSummaries', class: Google::Apis::DlpV2::GooglePrivacyDlpV2TransformationSummary, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2TransformationSummary::Representation
      
          property :transformed_bytes, :numeric_string => true, as: 'transformedBytes'
        end
      end
      
      class GooglePrivacyDlpV2TransformationSummary
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :field, as: 'field', class: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldId::Representation
      
          collection :field_transformations, as: 'fieldTransformations', class: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldTransformation, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2FieldTransformation::Representation
      
          property :info_type, as: 'infoType', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InfoType::Representation
      
          property :record_suppress, as: 'recordSuppress', class: Google::Apis::DlpV2::GooglePrivacyDlpV2RecordSuppression, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2RecordSuppression::Representation
      
          collection :results, as: 'results', class: Google::Apis::DlpV2::GooglePrivacyDlpV2SummaryResult, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2SummaryResult::Representation
      
          property :transformation, as: 'transformation', class: Google::Apis::DlpV2::GooglePrivacyDlpV2PrimitiveTransformation, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2PrimitiveTransformation::Representation
      
          property :transformed_bytes, :numeric_string => true, as: 'transformedBytes'
        end
      end
      
      class GooglePrivacyDlpV2TransientCryptoKey
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
        end
      end
      
      class GooglePrivacyDlpV2Trigger
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :schedule, as: 'schedule', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Schedule, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Schedule::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2UnwrappedCryptoKey
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, :base64 => true, as: 'key'
        end
      end
      
      class GooglePrivacyDlpV2UpdateDeidentifyTemplateRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :deidentify_template, as: 'deidentifyTemplate', class: Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyTemplate, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyTemplate::Representation
      
          property :update_mask, as: 'updateMask'
        end
      end
      
      class GooglePrivacyDlpV2UpdateInspectTemplateRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :inspect_template, as: 'inspectTemplate', class: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate::Representation
      
          property :update_mask, as: 'updateMask'
        end
      end
      
      class GooglePrivacyDlpV2UpdateJobTriggerRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :job_trigger, as: 'jobTrigger', class: Google::Apis::DlpV2::GooglePrivacyDlpV2JobTrigger, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2JobTrigger::Representation
      
          property :update_mask, as: 'updateMask'
        end
      end
      
      class GooglePrivacyDlpV2UpdateStoredInfoTypeRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :config, as: 'config', class: Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoTypeConfig, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoTypeConfig::Representation
      
          property :update_mask, as: 'updateMask'
        end
      end
      
      class GooglePrivacyDlpV2Value
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :boolean_value, as: 'booleanValue'
          property :date_value, as: 'dateValue', class: Google::Apis::DlpV2::GoogleTypeDate, decorator: Google::Apis::DlpV2::GoogleTypeDate::Representation
      
          property :day_of_week_value, as: 'dayOfWeekValue'
          property :float_value, as: 'floatValue'
          property :integer_value, :numeric_string => true, as: 'integerValue'
          property :string_value, as: 'stringValue'
          property :time_value, as: 'timeValue', class: Google::Apis::DlpV2::GoogleTypeTimeOfDay, decorator: Google::Apis::DlpV2::GoogleTypeTimeOfDay::Representation
      
          property :timestamp_value, as: 'timestampValue'
        end
      end
      
      class GooglePrivacyDlpV2ValueFrequency
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :count, :numeric_string => true, as: 'count'
          property :value, as: 'value', class: Google::Apis::DlpV2::GooglePrivacyDlpV2Value, decorator: Google::Apis::DlpV2::GooglePrivacyDlpV2Value::Representation
      
        end
      end
      
      class GooglePrivacyDlpV2WordList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :words, as: 'words'
        end
      end
      
      class GoogleProtobufEmpty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class GoogleRpcStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          collection :details, as: 'details'
          property :message, as: 'message'
        end
      end
      
      class GoogleTypeDate
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :day, as: 'day'
          property :month, as: 'month'
          property :year, as: 'year'
        end
      end
      
      class GoogleTypeTimeOfDay
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :hours, as: 'hours'
          property :minutes, as: 'minutes'
          property :nanos, as: 'nanos'
          property :seconds, as: 'seconds'
        end
      end
    end
  end
end
