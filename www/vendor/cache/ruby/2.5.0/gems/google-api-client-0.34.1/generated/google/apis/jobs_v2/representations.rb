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
    module JobsV2
      
      class BatchDeleteJobsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BucketRange
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BucketizedCount
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CommuteInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CommutePreference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Company
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CompanyInfoSource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CompensationEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CompensationFilter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CompensationHistogramRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CompensationHistogramResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CompensationInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CompensationRange
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CompleteQueryResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CompletionResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateJobRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomAttribute
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomAttributeHistogramRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomAttributeHistogramResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomField
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomFieldFilter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Date
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeleteJobsByFilterRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeviceInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExtendedCompensationFilter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExtendedCompensationInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExtendedCompensationInfoCompensationEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExtendedCompensationInfoCompensationRange
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExtendedCompensationInfoDecimal
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Filter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetHistogramRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetHistogramResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HistogramFacets
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HistogramResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HistogramResults
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Job
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JobFilters
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JobLocation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JobProcessingOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JobQuery
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LatLng
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListCompaniesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListCompanyJobsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListJobsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LocationFilter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MatchingJob
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MendelDebugInput
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Money
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NamespacedDebugInput
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NumericBucketingOption
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NumericBucketingResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PostalAddress
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RequestMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResponseMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SearchJobsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SearchJobsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SpellingCorrection
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StringValues
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateJobRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchDeleteJobsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :filter, as: 'filter'
        end
      end
      
      class BucketRange
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :from, as: 'from'
          property :to, as: 'to'
        end
      end
      
      class BucketizedCount
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :count, as: 'count'
          property :range, as: 'range', class: Google::Apis::JobsV2::BucketRange, decorator: Google::Apis::JobsV2::BucketRange::Representation
      
        end
      end
      
      class CommuteInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :job_location, as: 'jobLocation', class: Google::Apis::JobsV2::JobLocation, decorator: Google::Apis::JobsV2::JobLocation::Representation
      
          property :travel_duration, as: 'travelDuration'
        end
      end
      
      class CommutePreference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :allow_non_street_level_address, as: 'allowNonStreetLevelAddress'
          property :departure_hour_local, as: 'departureHourLocal'
          property :method_prop, as: 'method'
          property :road_traffic, as: 'roadTraffic'
          property :start_location, as: 'startLocation', class: Google::Apis::JobsV2::LatLng, decorator: Google::Apis::JobsV2::LatLng::Representation
      
          property :travel_time, as: 'travelTime'
        end
      end
      
      class Company
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :career_page_link, as: 'careerPageLink'
          collection :company_info_sources, as: 'companyInfoSources', class: Google::Apis::JobsV2::CompanyInfoSource, decorator: Google::Apis::JobsV2::CompanyInfoSource::Representation
      
          property :company_size, as: 'companySize'
          property :disable_location_optimization, as: 'disableLocationOptimization'
          property :display_name, as: 'displayName'
          property :distributor_billing_company_id, as: 'distributorBillingCompanyId'
          property :distributor_company_id, as: 'distributorCompanyId'
          property :eeo_text, as: 'eeoText'
          property :hiring_agency, as: 'hiringAgency'
          property :hq_location, as: 'hqLocation'
          property :image_url, as: 'imageUrl'
          collection :keyword_searchable_custom_attributes, as: 'keywordSearchableCustomAttributes'
          collection :keyword_searchable_custom_fields, as: 'keywordSearchableCustomFields'
          property :name, as: 'name'
          property :structured_company_hq_location, as: 'structuredCompanyHqLocation', class: Google::Apis::JobsV2::JobLocation, decorator: Google::Apis::JobsV2::JobLocation::Representation
      
          property :suspended, as: 'suspended'
          property :title, as: 'title'
          property :website, as: 'website'
        end
      end
      
      class CompanyInfoSource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :freebase_mid, as: 'freebaseMid'
          property :gplus_id, as: 'gplusId'
          property :maps_cid, as: 'mapsCid'
          property :unknown_type_id, as: 'unknownTypeId'
        end
      end
      
      class CompensationEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :amount, as: 'amount', class: Google::Apis::JobsV2::Money, decorator: Google::Apis::JobsV2::Money::Representation
      
          property :description, as: 'description'
          property :expected_units_per_year, as: 'expectedUnitsPerYear'
          property :range, as: 'range', class: Google::Apis::JobsV2::CompensationRange, decorator: Google::Apis::JobsV2::CompensationRange::Representation
      
          property :type, as: 'type'
          property :unit, as: 'unit'
        end
      end
      
      class CompensationFilter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :include_jobs_with_unspecified_compensation_range, as: 'includeJobsWithUnspecifiedCompensationRange'
          property :range, as: 'range', class: Google::Apis::JobsV2::CompensationRange, decorator: Google::Apis::JobsV2::CompensationRange::Representation
      
          property :type, as: 'type'
          collection :units, as: 'units'
        end
      end
      
      class CompensationHistogramRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bucketing_option, as: 'bucketingOption', class: Google::Apis::JobsV2::NumericBucketingOption, decorator: Google::Apis::JobsV2::NumericBucketingOption::Representation
      
          property :type, as: 'type'
        end
      end
      
      class CompensationHistogramResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :result, as: 'result', class: Google::Apis::JobsV2::NumericBucketingResult, decorator: Google::Apis::JobsV2::NumericBucketingResult::Representation
      
          property :type, as: 'type'
        end
      end
      
      class CompensationInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :amount, as: 'amount', class: Google::Apis::JobsV2::Money, decorator: Google::Apis::JobsV2::Money::Representation
      
          property :annualized_base_compensation_range, as: 'annualizedBaseCompensationRange', class: Google::Apis::JobsV2::CompensationRange, decorator: Google::Apis::JobsV2::CompensationRange::Representation
      
          property :annualized_total_compensation_range, as: 'annualizedTotalCompensationRange', class: Google::Apis::JobsV2::CompensationRange, decorator: Google::Apis::JobsV2::CompensationRange::Representation
      
          collection :entries, as: 'entries', class: Google::Apis::JobsV2::CompensationEntry, decorator: Google::Apis::JobsV2::CompensationEntry::Representation
      
          property :max, as: 'max', class: Google::Apis::JobsV2::Money, decorator: Google::Apis::JobsV2::Money::Representation
      
          property :min, as: 'min', class: Google::Apis::JobsV2::Money, decorator: Google::Apis::JobsV2::Money::Representation
      
          property :type, as: 'type'
        end
      end
      
      class CompensationRange
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :max, as: 'max', class: Google::Apis::JobsV2::Money, decorator: Google::Apis::JobsV2::Money::Representation
      
          property :min, as: 'min', class: Google::Apis::JobsV2::Money, decorator: Google::Apis::JobsV2::Money::Representation
      
        end
      end
      
      class CompleteQueryResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :completion_results, as: 'completionResults', class: Google::Apis::JobsV2::CompletionResult, decorator: Google::Apis::JobsV2::CompletionResult::Representation
      
          property :metadata, as: 'metadata', class: Google::Apis::JobsV2::ResponseMetadata, decorator: Google::Apis::JobsV2::ResponseMetadata::Representation
      
        end
      end
      
      class CompletionResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :image_url, as: 'imageUrl'
          property :suggestion, as: 'suggestion'
          property :type, as: 'type'
        end
      end
      
      class CreateJobRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :disable_street_address_resolution, as: 'disableStreetAddressResolution'
          property :job, as: 'job', class: Google::Apis::JobsV2::Job, decorator: Google::Apis::JobsV2::Job::Representation
      
          property :processing_options, as: 'processingOptions', class: Google::Apis::JobsV2::JobProcessingOptions, decorator: Google::Apis::JobsV2::JobProcessingOptions::Representation
      
        end
      end
      
      class CustomAttribute
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :filterable, as: 'filterable'
          property :long_value, :numeric_string => true, as: 'longValue'
          property :string_values, as: 'stringValues', class: Google::Apis::JobsV2::StringValues, decorator: Google::Apis::JobsV2::StringValues::Representation
      
        end
      end
      
      class CustomAttributeHistogramRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          property :long_value_histogram_bucketing_option, as: 'longValueHistogramBucketingOption', class: Google::Apis::JobsV2::NumericBucketingOption, decorator: Google::Apis::JobsV2::NumericBucketingOption::Representation
      
          property :string_value_histogram, as: 'stringValueHistogram'
        end
      end
      
      class CustomAttributeHistogramResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          property :long_value_histogram_result, as: 'longValueHistogramResult', class: Google::Apis::JobsV2::NumericBucketingResult, decorator: Google::Apis::JobsV2::NumericBucketingResult::Representation
      
          hash :string_value_histogram_result, as: 'stringValueHistogramResult'
        end
      end
      
      class CustomField
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :values, as: 'values'
        end
      end
      
      class CustomFieldFilter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :queries, as: 'queries'
          property :type, as: 'type'
        end
      end
      
      class Date
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :day, as: 'day'
          property :month, as: 'month'
          property :year, as: 'year'
        end
      end
      
      class DeleteJobsByFilterRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :disable_fast_process, as: 'disableFastProcess'
          property :filter, as: 'filter', class: Google::Apis::JobsV2::Filter, decorator: Google::Apis::JobsV2::Filter::Representation
      
        end
      end
      
      class DeviceInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :device_type, as: 'deviceType'
          property :id, as: 'id'
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class ExtendedCompensationFilter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :compensation_range, as: 'compensationRange', class: Google::Apis::JobsV2::ExtendedCompensationInfoCompensationRange, decorator: Google::Apis::JobsV2::ExtendedCompensationInfoCompensationRange::Representation
      
          collection :compensation_units, as: 'compensationUnits'
          property :currency, as: 'currency'
          property :include_job_with_unspecified_compensation_range, as: 'includeJobWithUnspecifiedCompensationRange'
          property :type, as: 'type'
        end
      end
      
      class ExtendedCompensationInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :annualized_base_compensation_range, as: 'annualizedBaseCompensationRange', class: Google::Apis::JobsV2::ExtendedCompensationInfoCompensationRange, decorator: Google::Apis::JobsV2::ExtendedCompensationInfoCompensationRange::Representation
      
          property :annualized_base_compensation_unspecified, as: 'annualizedBaseCompensationUnspecified'
          property :annualized_total_compensation_range, as: 'annualizedTotalCompensationRange', class: Google::Apis::JobsV2::ExtendedCompensationInfoCompensationRange, decorator: Google::Apis::JobsV2::ExtendedCompensationInfoCompensationRange::Representation
      
          property :annualized_total_compensation_unspecified, as: 'annualizedTotalCompensationUnspecified'
          property :currency, as: 'currency'
          collection :entries, as: 'entries', class: Google::Apis::JobsV2::ExtendedCompensationInfoCompensationEntry, decorator: Google::Apis::JobsV2::ExtendedCompensationInfoCompensationEntry::Representation
      
        end
      end
      
      class ExtendedCompensationInfoCompensationEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :amount, as: 'amount', class: Google::Apis::JobsV2::ExtendedCompensationInfoDecimal, decorator: Google::Apis::JobsV2::ExtendedCompensationInfoDecimal::Representation
      
          property :description, as: 'description'
          property :expected_units_per_year, as: 'expectedUnitsPerYear', class: Google::Apis::JobsV2::ExtendedCompensationInfoDecimal, decorator: Google::Apis::JobsV2::ExtendedCompensationInfoDecimal::Representation
      
          property :range, as: 'range', class: Google::Apis::JobsV2::ExtendedCompensationInfoCompensationRange, decorator: Google::Apis::JobsV2::ExtendedCompensationInfoCompensationRange::Representation
      
          property :type, as: 'type'
          property :unit, as: 'unit'
          property :unspecified, as: 'unspecified'
        end
      end
      
      class ExtendedCompensationInfoCompensationRange
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :max, as: 'max', class: Google::Apis::JobsV2::ExtendedCompensationInfoDecimal, decorator: Google::Apis::JobsV2::ExtendedCompensationInfoDecimal::Representation
      
          property :min, as: 'min', class: Google::Apis::JobsV2::ExtendedCompensationInfoDecimal, decorator: Google::Apis::JobsV2::ExtendedCompensationInfoDecimal::Representation
      
        end
      end
      
      class ExtendedCompensationInfoDecimal
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :micros, as: 'micros'
          property :units, :numeric_string => true, as: 'units'
        end
      end
      
      class Filter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :requisition_id, as: 'requisitionId'
        end
      end
      
      class GetHistogramRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :allow_broadening, as: 'allowBroadening'
          property :filters, as: 'filters', class: Google::Apis::JobsV2::JobFilters, decorator: Google::Apis::JobsV2::JobFilters::Representation
      
          property :query, as: 'query', class: Google::Apis::JobsV2::JobQuery, decorator: Google::Apis::JobsV2::JobQuery::Representation
      
          property :request_metadata, as: 'requestMetadata', class: Google::Apis::JobsV2::RequestMetadata, decorator: Google::Apis::JobsV2::RequestMetadata::Representation
      
          collection :search_types, as: 'searchTypes'
        end
      end
      
      class GetHistogramResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :metadata, as: 'metadata', class: Google::Apis::JobsV2::ResponseMetadata, decorator: Google::Apis::JobsV2::ResponseMetadata::Representation
      
          collection :results, as: 'results', class: Google::Apis::JobsV2::HistogramResult, decorator: Google::Apis::JobsV2::HistogramResult::Representation
      
        end
      end
      
      class HistogramFacets
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :compensation_histogram_facets, as: 'compensationHistogramFacets', class: Google::Apis::JobsV2::CompensationHistogramRequest, decorator: Google::Apis::JobsV2::CompensationHistogramRequest::Representation
      
          collection :custom_attribute_histogram_facets, as: 'customAttributeHistogramFacets', class: Google::Apis::JobsV2::CustomAttributeHistogramRequest, decorator: Google::Apis::JobsV2::CustomAttributeHistogramRequest::Representation
      
          collection :simple_histogram_facets, as: 'simpleHistogramFacets'
        end
      end
      
      class HistogramResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :search_type, as: 'searchType'
          hash :values, as: 'values'
        end
      end
      
      class HistogramResults
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :compensation_histogram_results, as: 'compensationHistogramResults', class: Google::Apis::JobsV2::CompensationHistogramResult, decorator: Google::Apis::JobsV2::CompensationHistogramResult::Representation
      
          collection :custom_attribute_histogram_results, as: 'customAttributeHistogramResults', class: Google::Apis::JobsV2::CustomAttributeHistogramResult, decorator: Google::Apis::JobsV2::CustomAttributeHistogramResult::Representation
      
          collection :simple_histogram_results, as: 'simpleHistogramResults', class: Google::Apis::JobsV2::HistogramResult, decorator: Google::Apis::JobsV2::HistogramResult::Representation
      
        end
      end
      
      class Job
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :application_email_list, as: 'applicationEmailList'
          property :application_instruction, as: 'applicationInstruction'
          collection :application_urls, as: 'applicationUrls'
          collection :benefits, as: 'benefits'
          property :company_display_name, as: 'companyDisplayName'
          property :company_name, as: 'companyName'
          property :company_title, as: 'companyTitle'
          property :compensation_info, as: 'compensationInfo', class: Google::Apis::JobsV2::CompensationInfo, decorator: Google::Apis::JobsV2::CompensationInfo::Representation
      
          property :create_time, as: 'createTime'
          hash :custom_attributes, as: 'customAttributes', class: Google::Apis::JobsV2::CustomAttribute, decorator: Google::Apis::JobsV2::CustomAttribute::Representation
      
          property :department, as: 'department'
          property :description, as: 'description'
          property :distributor_company_id, as: 'distributorCompanyId'
          collection :education_levels, as: 'educationLevels'
          collection :employment_types, as: 'employmentTypes'
          property :end_date, as: 'endDate', class: Google::Apis::JobsV2::Date, decorator: Google::Apis::JobsV2::Date::Representation
      
          property :expire_time, as: 'expireTime'
          property :expiry_date, as: 'expiryDate', class: Google::Apis::JobsV2::Date, decorator: Google::Apis::JobsV2::Date::Representation
      
          property :extended_compensation_info, as: 'extendedCompensationInfo', class: Google::Apis::JobsV2::ExtendedCompensationInfo, decorator: Google::Apis::JobsV2::ExtendedCompensationInfo::Representation
      
          hash :filterable_custom_fields, as: 'filterableCustomFields', class: Google::Apis::JobsV2::CustomField, decorator: Google::Apis::JobsV2::CustomField::Representation
      
          property :incentives, as: 'incentives'
          collection :job_locations, as: 'jobLocations', class: Google::Apis::JobsV2::JobLocation, decorator: Google::Apis::JobsV2::JobLocation::Representation
      
          property :job_title, as: 'jobTitle'
          property :language_code, as: 'languageCode'
          property :level, as: 'level'
          collection :locations, as: 'locations'
          property :name, as: 'name'
          property :promotion_value, as: 'promotionValue'
          property :publish_date, as: 'publishDate', class: Google::Apis::JobsV2::Date, decorator: Google::Apis::JobsV2::Date::Representation
      
          property :qualifications, as: 'qualifications'
          property :reference_url, as: 'referenceUrl'
          property :region, as: 'region'
          property :requisition_id, as: 'requisitionId'
          property :responsibilities, as: 'responsibilities'
          property :start_date, as: 'startDate', class: Google::Apis::JobsV2::Date, decorator: Google::Apis::JobsV2::Date::Representation
      
          hash :unindexed_custom_fields, as: 'unindexedCustomFields', class: Google::Apis::JobsV2::CustomField, decorator: Google::Apis::JobsV2::CustomField::Representation
      
          property :update_time, as: 'updateTime'
          property :visibility, as: 'visibility'
        end
      end
      
      class JobFilters
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :categories, as: 'categories'
          property :commute_filter, as: 'commuteFilter', class: Google::Apis::JobsV2::CommutePreference, decorator: Google::Apis::JobsV2::CommutePreference::Representation
      
          collection :company_names, as: 'companyNames'
          collection :company_titles, as: 'companyTitles'
          property :compensation_filter, as: 'compensationFilter', class: Google::Apis::JobsV2::CompensationFilter, decorator: Google::Apis::JobsV2::CompensationFilter::Representation
      
          property :custom_attribute_filter, as: 'customAttributeFilter'
          hash :custom_field_filters, as: 'customFieldFilters', class: Google::Apis::JobsV2::CustomFieldFilter, decorator: Google::Apis::JobsV2::CustomFieldFilter::Representation
      
          property :disable_spell_check, as: 'disableSpellCheck'
          collection :employment_types, as: 'employmentTypes'
          property :extended_compensation_filter, as: 'extendedCompensationFilter', class: Google::Apis::JobsV2::ExtendedCompensationFilter, decorator: Google::Apis::JobsV2::ExtendedCompensationFilter::Representation
      
          collection :language_codes, as: 'languageCodes'
          collection :location_filters, as: 'locationFilters', class: Google::Apis::JobsV2::LocationFilter, decorator: Google::Apis::JobsV2::LocationFilter::Representation
      
          property :publish_date_range, as: 'publishDateRange'
          property :query, as: 'query'
          property :tenant_job_only, as: 'tenantJobOnly'
        end
      end
      
      class JobLocation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :lat_lng, as: 'latLng', class: Google::Apis::JobsV2::LatLng, decorator: Google::Apis::JobsV2::LatLng::Representation
      
          property :location_type, as: 'locationType'
          property :postal_address, as: 'postalAddress', class: Google::Apis::JobsV2::PostalAddress, decorator: Google::Apis::JobsV2::PostalAddress::Representation
      
          property :radius_meters, as: 'radiusMeters'
        end
      end
      
      class JobProcessingOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :disable_street_address_resolution, as: 'disableStreetAddressResolution'
          property :html_sanitization, as: 'htmlSanitization'
        end
      end
      
      class JobQuery
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :categories, as: 'categories'
          property :commute_filter, as: 'commuteFilter', class: Google::Apis::JobsV2::CommutePreference, decorator: Google::Apis::JobsV2::CommutePreference::Representation
      
          collection :company_display_names, as: 'companyDisplayNames'
          collection :company_names, as: 'companyNames'
          property :compensation_filter, as: 'compensationFilter', class: Google::Apis::JobsV2::CompensationFilter, decorator: Google::Apis::JobsV2::CompensationFilter::Representation
      
          property :custom_attribute_filter, as: 'customAttributeFilter'
          property :disable_spell_check, as: 'disableSpellCheck'
          collection :employment_types, as: 'employmentTypes'
          collection :language_codes, as: 'languageCodes'
          collection :location_filters, as: 'locationFilters', class: Google::Apis::JobsV2::LocationFilter, decorator: Google::Apis::JobsV2::LocationFilter::Representation
      
          property :publish_date_range, as: 'publishDateRange'
          property :query, as: 'query'
        end
      end
      
      class LatLng
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :latitude, as: 'latitude'
          property :longitude, as: 'longitude'
        end
      end
      
      class ListCompaniesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :companies, as: 'companies', class: Google::Apis::JobsV2::Company, decorator: Google::Apis::JobsV2::Company::Representation
      
          property :metadata, as: 'metadata', class: Google::Apis::JobsV2::ResponseMetadata, decorator: Google::Apis::JobsV2::ResponseMetadata::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListCompanyJobsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :jobs, as: 'jobs', class: Google::Apis::JobsV2::Job, decorator: Google::Apis::JobsV2::Job::Representation
      
          property :metadata, as: 'metadata', class: Google::Apis::JobsV2::ResponseMetadata, decorator: Google::Apis::JobsV2::ResponseMetadata::Representation
      
          property :next_page_token, as: 'nextPageToken'
          property :total_size, :numeric_string => true, as: 'totalSize'
        end
      end
      
      class ListJobsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :jobs, as: 'jobs', class: Google::Apis::JobsV2::Job, decorator: Google::Apis::JobsV2::Job::Representation
      
          property :metadata, as: 'metadata', class: Google::Apis::JobsV2::ResponseMetadata, decorator: Google::Apis::JobsV2::ResponseMetadata::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class LocationFilter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :distance_in_miles, as: 'distanceInMiles'
          property :is_telecommute, as: 'isTelecommute'
          property :lat_lng, as: 'latLng', class: Google::Apis::JobsV2::LatLng, decorator: Google::Apis::JobsV2::LatLng::Representation
      
          property :name, as: 'name'
          property :region_code, as: 'regionCode'
        end
      end
      
      class MatchingJob
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :commute_info, as: 'commuteInfo', class: Google::Apis::JobsV2::CommuteInfo, decorator: Google::Apis::JobsV2::CommuteInfo::Representation
      
          property :job, as: 'job', class: Google::Apis::JobsV2::Job, decorator: Google::Apis::JobsV2::Job::Representation
      
          property :job_summary, as: 'jobSummary'
          property :job_title_snippet, as: 'jobTitleSnippet'
          property :search_text_snippet, as: 'searchTextSnippet'
        end
      end
      
      class MendelDebugInput
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :namespaced_debug_input, as: 'namespacedDebugInput', class: Google::Apis::JobsV2::NamespacedDebugInput, decorator: Google::Apis::JobsV2::NamespacedDebugInput::Representation
      
        end
      end
      
      class Money
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :currency_code, as: 'currencyCode'
          property :nanos, as: 'nanos'
          property :units, :numeric_string => true, as: 'units'
        end
      end
      
      class NamespacedDebugInput
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :absolutely_forced_exp_names, as: 'absolutelyForcedExpNames'
          collection :absolutely_forced_exp_tags, as: 'absolutelyForcedExpTags'
          collection :absolutely_forced_exps, as: 'absolutelyForcedExps'
          collection :conditionally_forced_exp_names, as: 'conditionallyForcedExpNames'
          collection :conditionally_forced_exp_tags, as: 'conditionallyForcedExpTags'
          collection :conditionally_forced_exps, as: 'conditionallyForcedExps'
          property :disable_automatic_enrollment_selection, as: 'disableAutomaticEnrollmentSelection'
          collection :disable_exp_names, as: 'disableExpNames'
          collection :disable_exp_tags, as: 'disableExpTags'
          collection :disable_exps, as: 'disableExps'
          property :disable_manual_enrollment_selection, as: 'disableManualEnrollmentSelection'
          property :disable_organic_selection, as: 'disableOrganicSelection'
          hash :forced_flags, as: 'forcedFlags'
          hash :forced_rollouts, as: 'forcedRollouts'
        end
      end
      
      class NumericBucketingOption
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :bucket_bounds, as: 'bucketBounds'
          property :requires_min_max, as: 'requiresMinMax'
        end
      end
      
      class NumericBucketingResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :counts, as: 'counts', class: Google::Apis::JobsV2::BucketizedCount, decorator: Google::Apis::JobsV2::BucketizedCount::Representation
      
          property :max_value, as: 'maxValue'
          property :min_value, as: 'minValue'
        end
      end
      
      class PostalAddress
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :address_lines, as: 'addressLines'
          property :administrative_area, as: 'administrativeArea'
          property :language_code, as: 'languageCode'
          property :locality, as: 'locality'
          property :organization, as: 'organization'
          property :postal_code, as: 'postalCode'
          collection :recipients, as: 'recipients'
          property :region_code, as: 'regionCode'
          property :revision, as: 'revision'
          property :sorting_code, as: 'sortingCode'
          property :sublocality, as: 'sublocality'
        end
      end
      
      class RequestMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :device_info, as: 'deviceInfo', class: Google::Apis::JobsV2::DeviceInfo, decorator: Google::Apis::JobsV2::DeviceInfo::Representation
      
          property :domain, as: 'domain'
          property :session_id, as: 'sessionId'
          property :user_id, as: 'userId'
        end
      end
      
      class ResponseMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :experiment_id_list, as: 'experimentIdList'
          property :mode, as: 'mode'
          property :request_id, as: 'requestId'
        end
      end
      
      class SearchJobsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :disable_relevance_thresholding, as: 'disableRelevanceThresholding'
          property :enable_broadening, as: 'enableBroadening'
          property :enable_precise_result_size, as: 'enablePreciseResultSize'
          property :filters, as: 'filters', class: Google::Apis::JobsV2::JobFilters, decorator: Google::Apis::JobsV2::JobFilters::Representation
      
          property :histogram_facets, as: 'histogramFacets', class: Google::Apis::JobsV2::HistogramFacets, decorator: Google::Apis::JobsV2::HistogramFacets::Representation
      
          property :job_view, as: 'jobView'
          property :mode, as: 'mode'
          property :offset, as: 'offset'
          property :order_by, as: 'orderBy'
          property :page_size, as: 'pageSize'
          property :page_token, as: 'pageToken'
          property :query, as: 'query', class: Google::Apis::JobsV2::JobQuery, decorator: Google::Apis::JobsV2::JobQuery::Representation
      
          property :request_metadata, as: 'requestMetadata', class: Google::Apis::JobsV2::RequestMetadata, decorator: Google::Apis::JobsV2::RequestMetadata::Representation
      
          property :sort_by, as: 'sortBy'
        end
      end
      
      class SearchJobsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :applied_commute_filter, as: 'appliedCommuteFilter', class: Google::Apis::JobsV2::CommutePreference, decorator: Google::Apis::JobsV2::CommutePreference::Representation
      
          collection :applied_job_location_filters, as: 'appliedJobLocationFilters', class: Google::Apis::JobsV2::JobLocation, decorator: Google::Apis::JobsV2::JobLocation::Representation
      
          property :estimated_total_size, :numeric_string => true, as: 'estimatedTotalSize'
          property :histogram_results, as: 'histogramResults', class: Google::Apis::JobsV2::HistogramResults, decorator: Google::Apis::JobsV2::HistogramResults::Representation
      
          property :job_view, as: 'jobView'
          collection :matching_jobs, as: 'matchingJobs', class: Google::Apis::JobsV2::MatchingJob, decorator: Google::Apis::JobsV2::MatchingJob::Representation
      
          property :metadata, as: 'metadata', class: Google::Apis::JobsV2::ResponseMetadata, decorator: Google::Apis::JobsV2::ResponseMetadata::Representation
      
          property :next_page_token, as: 'nextPageToken'
          property :num_jobs_from_broadened_query, as: 'numJobsFromBroadenedQuery'
          property :spell_result, as: 'spellResult', class: Google::Apis::JobsV2::SpellingCorrection, decorator: Google::Apis::JobsV2::SpellingCorrection::Representation
      
          property :total_size, :numeric_string => true, as: 'totalSize'
        end
      end
      
      class SpellingCorrection
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :corrected, as: 'corrected'
          property :corrected_text, as: 'correctedText'
        end
      end
      
      class StringValues
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :values, as: 'values'
        end
      end
      
      class UpdateJobRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :disable_street_address_resolution, as: 'disableStreetAddressResolution'
          property :job, as: 'job', class: Google::Apis::JobsV2::Job, decorator: Google::Apis::JobsV2::Job::Representation
      
          property :processing_options, as: 'processingOptions', class: Google::Apis::JobsV2::JobProcessingOptions, decorator: Google::Apis::JobsV2::JobProcessingOptions::Representation
      
          property :update_job_fields, as: 'updateJobFields'
        end
      end
    end
  end
end
