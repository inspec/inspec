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
    module DoubleclicksearchV2
      
      class Availability
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Conversion
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConversionList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomDimension
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomMetric
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Report
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class File
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReportApiColumnSpec
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReportRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Filter
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class OrderBy
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class ReportScope
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class TimeRange
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SavedColumn
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SavedColumnList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateAvailabilityRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateAvailabilityResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Availability
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :advertiser_id, :numeric_string => true, as: 'advertiserId'
          property :agency_id, :numeric_string => true, as: 'agencyId'
          property :availability_timestamp, :numeric_string => true, as: 'availabilityTimestamp'
          property :segmentation_id, :numeric_string => true, as: 'segmentationId'
          property :segmentation_name, as: 'segmentationName'
          property :segmentation_type, as: 'segmentationType'
        end
      end
      
      class Conversion
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ad_group_id, :numeric_string => true, as: 'adGroupId'
          property :ad_id, :numeric_string => true, as: 'adId'
          property :advertiser_id, :numeric_string => true, as: 'advertiserId'
          property :agency_id, :numeric_string => true, as: 'agencyId'
          property :attribution_model, as: 'attributionModel'
          property :campaign_id, :numeric_string => true, as: 'campaignId'
          property :channel, as: 'channel'
          property :click_id, as: 'clickId'
          property :conversion_id, as: 'conversionId'
          property :conversion_modified_timestamp, :numeric_string => true, as: 'conversionModifiedTimestamp'
          property :conversion_timestamp, :numeric_string => true, as: 'conversionTimestamp'
          property :count_millis, :numeric_string => true, as: 'countMillis'
          property :criterion_id, :numeric_string => true, as: 'criterionId'
          property :currency_code, as: 'currencyCode'
          collection :custom_dimension, as: 'customDimension', class: Google::Apis::DoubleclicksearchV2::CustomDimension, decorator: Google::Apis::DoubleclicksearchV2::CustomDimension::Representation
      
          collection :custom_metric, as: 'customMetric', class: Google::Apis::DoubleclicksearchV2::CustomMetric, decorator: Google::Apis::DoubleclicksearchV2::CustomMetric::Representation
      
          property :device_type, as: 'deviceType'
          property :ds_conversion_id, :numeric_string => true, as: 'dsConversionId'
          property :engine_account_id, :numeric_string => true, as: 'engineAccountId'
          property :floodlight_order_id, as: 'floodlightOrderId'
          property :inventory_account_id, :numeric_string => true, as: 'inventoryAccountId'
          property :product_country, as: 'productCountry'
          property :product_group_id, :numeric_string => true, as: 'productGroupId'
          property :product_id, as: 'productId'
          property :product_language, as: 'productLanguage'
          property :quantity_millis, :numeric_string => true, as: 'quantityMillis'
          property :revenue_micros, :numeric_string => true, as: 'revenueMicros'
          property :segmentation_id, :numeric_string => true, as: 'segmentationId'
          property :segmentation_name, as: 'segmentationName'
          property :segmentation_type, as: 'segmentationType'
          property :state, as: 'state'
          property :store_id, as: 'storeId'
          property :type, as: 'type'
        end
      end
      
      class ConversionList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :conversion, as: 'conversion', class: Google::Apis::DoubleclicksearchV2::Conversion, decorator: Google::Apis::DoubleclicksearchV2::Conversion::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class CustomDimension
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :value, as: 'value'
        end
      end
      
      class CustomMetric
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :value, as: 'value'
        end
      end
      
      class Report
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :files, as: 'files', class: Google::Apis::DoubleclicksearchV2::Report::File, decorator: Google::Apis::DoubleclicksearchV2::Report::File::Representation
      
          property :id, as: 'id'
          property :is_report_ready, as: 'isReportReady'
          property :kind, as: 'kind'
          property :request, as: 'request', class: Google::Apis::DoubleclicksearchV2::ReportRequest, decorator: Google::Apis::DoubleclicksearchV2::ReportRequest::Representation
      
          property :row_count, as: 'rowCount'
          collection :rows, as: 'rows'
          property :statistics_currency_code, as: 'statisticsCurrencyCode'
          property :statistics_time_zone, as: 'statisticsTimeZone'
        end
        
        class File
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :byte_count, :numeric_string => true, as: 'byteCount'
            property :url, as: 'url'
          end
        end
      end
      
      class ReportApiColumnSpec
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :column_name, as: 'columnName'
          property :custom_dimension_name, as: 'customDimensionName'
          property :custom_metric_name, as: 'customMetricName'
          property :end_date, as: 'endDate'
          property :group_by_column, as: 'groupByColumn'
          property :header_text, as: 'headerText'
          property :platform_source, as: 'platformSource'
          property :product_report_perspective, as: 'productReportPerspective'
          property :saved_column_name, as: 'savedColumnName'
          property :start_date, as: 'startDate'
        end
      end
      
      class ReportRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :columns, as: 'columns', class: Google::Apis::DoubleclicksearchV2::ReportApiColumnSpec, decorator: Google::Apis::DoubleclicksearchV2::ReportApiColumnSpec::Representation
      
          property :download_format, as: 'downloadFormat'
          collection :filters, as: 'filters', class: Google::Apis::DoubleclicksearchV2::ReportRequest::Filter, decorator: Google::Apis::DoubleclicksearchV2::ReportRequest::Filter::Representation
      
          property :include_deleted_entities, as: 'includeDeletedEntities'
          property :include_removed_entities, as: 'includeRemovedEntities'
          property :max_rows_per_file, as: 'maxRowsPerFile'
          collection :order_by, as: 'orderBy', class: Google::Apis::DoubleclicksearchV2::ReportRequest::OrderBy, decorator: Google::Apis::DoubleclicksearchV2::ReportRequest::OrderBy::Representation
      
          property :report_scope, as: 'reportScope', class: Google::Apis::DoubleclicksearchV2::ReportRequest::ReportScope, decorator: Google::Apis::DoubleclicksearchV2::ReportRequest::ReportScope::Representation
      
          property :report_type, as: 'reportType'
          property :row_count, as: 'rowCount'
          property :start_row, as: 'startRow'
          property :statistics_currency, as: 'statisticsCurrency'
          property :time_range, as: 'timeRange', class: Google::Apis::DoubleclicksearchV2::ReportRequest::TimeRange, decorator: Google::Apis::DoubleclicksearchV2::ReportRequest::TimeRange::Representation
      
          property :verify_single_time_zone, as: 'verifySingleTimeZone'
        end
        
        class Filter
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :column, as: 'column', class: Google::Apis::DoubleclicksearchV2::ReportApiColumnSpec, decorator: Google::Apis::DoubleclicksearchV2::ReportApiColumnSpec::Representation
        
            property :operator, as: 'operator'
            collection :values, as: 'values'
          end
        end
        
        class OrderBy
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :column, as: 'column', class: Google::Apis::DoubleclicksearchV2::ReportApiColumnSpec, decorator: Google::Apis::DoubleclicksearchV2::ReportApiColumnSpec::Representation
        
            property :sort_order, as: 'sortOrder'
          end
        end
        
        class ReportScope
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :ad_group_id, :numeric_string => true, as: 'adGroupId'
            property :ad_id, :numeric_string => true, as: 'adId'
            property :advertiser_id, :numeric_string => true, as: 'advertiserId'
            property :agency_id, :numeric_string => true, as: 'agencyId'
            property :campaign_id, :numeric_string => true, as: 'campaignId'
            property :engine_account_id, :numeric_string => true, as: 'engineAccountId'
            property :keyword_id, :numeric_string => true, as: 'keywordId'
          end
        end
        
        class TimeRange
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :changed_attributes_since_timestamp, as: 'changedAttributesSinceTimestamp', type: DateTime
        
            property :changed_metrics_since_timestamp, as: 'changedMetricsSinceTimestamp', type: DateTime
        
            property :end_date, as: 'endDate'
            property :start_date, as: 'startDate'
          end
        end
      end
      
      class SavedColumn
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :saved_column_name, as: 'savedColumnName'
          property :type, as: 'type'
        end
      end
      
      class SavedColumnList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::DoubleclicksearchV2::SavedColumn, decorator: Google::Apis::DoubleclicksearchV2::SavedColumn::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class UpdateAvailabilityRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :availabilities, as: 'availabilities', class: Google::Apis::DoubleclicksearchV2::Availability, decorator: Google::Apis::DoubleclicksearchV2::Availability::Representation
      
        end
      end
      
      class UpdateAvailabilityResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :availabilities, as: 'availabilities', class: Google::Apis::DoubleclicksearchV2::Availability, decorator: Google::Apis::DoubleclicksearchV2::Availability::Representation
      
        end
      end
    end
  end
end
