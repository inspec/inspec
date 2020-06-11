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
    module FitnessV1
      
      class AggregateBucket
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AggregateBy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AggregateRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AggregateResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Application
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BucketByActivity
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BucketBySession
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BucketByTime
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BucketByTimePeriod
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DataPoint
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DataSource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DataType
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DataTypeField
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Dataset
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Device
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListDataPointChangesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListDataSourcesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListSessionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MapValue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Session
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Value
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ValueMapValEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AggregateBucket
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :activity, as: 'activity'
          collection :dataset, as: 'dataset', class: Google::Apis::FitnessV1::Dataset, decorator: Google::Apis::FitnessV1::Dataset::Representation
      
          property :end_time_millis, :numeric_string => true, as: 'endTimeMillis'
          property :session, as: 'session', class: Google::Apis::FitnessV1::Session, decorator: Google::Apis::FitnessV1::Session::Representation
      
          property :start_time_millis, :numeric_string => true, as: 'startTimeMillis'
          property :type, as: 'type'
        end
      end
      
      class AggregateBy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :data_source_id, as: 'dataSourceId'
          property :data_type_name, as: 'dataTypeName'
        end
      end
      
      class AggregateRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :aggregate_by, as: 'aggregateBy', class: Google::Apis::FitnessV1::AggregateBy, decorator: Google::Apis::FitnessV1::AggregateBy::Representation
      
          property :bucket_by_activity_segment, as: 'bucketByActivitySegment', class: Google::Apis::FitnessV1::BucketByActivity, decorator: Google::Apis::FitnessV1::BucketByActivity::Representation
      
          property :bucket_by_activity_type, as: 'bucketByActivityType', class: Google::Apis::FitnessV1::BucketByActivity, decorator: Google::Apis::FitnessV1::BucketByActivity::Representation
      
          property :bucket_by_session, as: 'bucketBySession', class: Google::Apis::FitnessV1::BucketBySession, decorator: Google::Apis::FitnessV1::BucketBySession::Representation
      
          property :bucket_by_time, as: 'bucketByTime', class: Google::Apis::FitnessV1::BucketByTime, decorator: Google::Apis::FitnessV1::BucketByTime::Representation
      
          property :end_time_millis, :numeric_string => true, as: 'endTimeMillis'
          collection :filtered_data_quality_standard, as: 'filteredDataQualityStandard'
          property :start_time_millis, :numeric_string => true, as: 'startTimeMillis'
        end
      end
      
      class AggregateResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :bucket, as: 'bucket', class: Google::Apis::FitnessV1::AggregateBucket, decorator: Google::Apis::FitnessV1::AggregateBucket::Representation
      
        end
      end
      
      class Application
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :details_url, as: 'detailsUrl'
          property :name, as: 'name'
          property :package_name, as: 'packageName'
          property :version, as: 'version'
        end
      end
      
      class BucketByActivity
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :activity_data_source_id, as: 'activityDataSourceId'
          property :min_duration_millis, :numeric_string => true, as: 'minDurationMillis'
        end
      end
      
      class BucketBySession
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :min_duration_millis, :numeric_string => true, as: 'minDurationMillis'
        end
      end
      
      class BucketByTime
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :duration_millis, :numeric_string => true, as: 'durationMillis'
          property :period, as: 'period', class: Google::Apis::FitnessV1::BucketByTimePeriod, decorator: Google::Apis::FitnessV1::BucketByTimePeriod::Representation
      
        end
      end
      
      class BucketByTimePeriod
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :time_zone_id, as: 'timeZoneId'
          property :type, as: 'type'
          property :value, as: 'value'
        end
      end
      
      class DataPoint
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :computation_time_millis, :numeric_string => true, as: 'computationTimeMillis'
          property :data_type_name, as: 'dataTypeName'
          property :end_time_nanos, :numeric_string => true, as: 'endTimeNanos'
          property :modified_time_millis, :numeric_string => true, as: 'modifiedTimeMillis'
          property :origin_data_source_id, as: 'originDataSourceId'
          property :raw_timestamp_nanos, :numeric_string => true, as: 'rawTimestampNanos'
          property :start_time_nanos, :numeric_string => true, as: 'startTimeNanos'
          collection :value, as: 'value', class: Google::Apis::FitnessV1::Value, decorator: Google::Apis::FitnessV1::Value::Representation
      
        end
      end
      
      class DataSource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :application, as: 'application', class: Google::Apis::FitnessV1::Application, decorator: Google::Apis::FitnessV1::Application::Representation
      
          collection :data_quality_standard, as: 'dataQualityStandard'
          property :data_stream_id, as: 'dataStreamId'
          property :data_stream_name, as: 'dataStreamName'
          property :data_type, as: 'dataType', class: Google::Apis::FitnessV1::DataType, decorator: Google::Apis::FitnessV1::DataType::Representation
      
          property :device, as: 'device', class: Google::Apis::FitnessV1::Device, decorator: Google::Apis::FitnessV1::Device::Representation
      
          property :name, as: 'name'
          property :type, as: 'type'
        end
      end
      
      class DataType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :field, as: 'field', class: Google::Apis::FitnessV1::DataTypeField, decorator: Google::Apis::FitnessV1::DataTypeField::Representation
      
          property :name, as: 'name'
        end
      end
      
      class DataTypeField
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :format, as: 'format'
          property :name, as: 'name'
          property :optional, as: 'optional'
        end
      end
      
      class Dataset
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :data_source_id, as: 'dataSourceId'
          property :max_end_time_ns, :numeric_string => true, as: 'maxEndTimeNs'
          property :min_start_time_ns, :numeric_string => true, as: 'minStartTimeNs'
          property :next_page_token, as: 'nextPageToken'
          collection :point, as: 'point', class: Google::Apis::FitnessV1::DataPoint, decorator: Google::Apis::FitnessV1::DataPoint::Representation
      
        end
      end
      
      class Device
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :manufacturer, as: 'manufacturer'
          property :model, as: 'model'
          property :type, as: 'type'
          property :uid, as: 'uid'
          property :version, as: 'version'
        end
      end
      
      class ListDataPointChangesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :data_source_id, as: 'dataSourceId'
          collection :deleted_data_point, as: 'deletedDataPoint', class: Google::Apis::FitnessV1::DataPoint, decorator: Google::Apis::FitnessV1::DataPoint::Representation
      
          collection :inserted_data_point, as: 'insertedDataPoint', class: Google::Apis::FitnessV1::DataPoint, decorator: Google::Apis::FitnessV1::DataPoint::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListDataSourcesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :data_source, as: 'dataSource', class: Google::Apis::FitnessV1::DataSource, decorator: Google::Apis::FitnessV1::DataSource::Representation
      
        end
      end
      
      class ListSessionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :deleted_session, as: 'deletedSession', class: Google::Apis::FitnessV1::Session, decorator: Google::Apis::FitnessV1::Session::Representation
      
          property :has_more_data, as: 'hasMoreData'
          property :next_page_token, as: 'nextPageToken'
          collection :session, as: 'session', class: Google::Apis::FitnessV1::Session, decorator: Google::Apis::FitnessV1::Session::Representation
      
        end
      end
      
      class MapValue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :fp_val, as: 'fpVal'
        end
      end
      
      class Session
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :active_time_millis, :numeric_string => true, as: 'activeTimeMillis'
          property :activity_type, as: 'activityType'
          property :application, as: 'application', class: Google::Apis::FitnessV1::Application, decorator: Google::Apis::FitnessV1::Application::Representation
      
          property :description, as: 'description'
          property :end_time_millis, :numeric_string => true, as: 'endTimeMillis'
          property :id, as: 'id'
          property :modified_time_millis, :numeric_string => true, as: 'modifiedTimeMillis'
          property :name, as: 'name'
          property :start_time_millis, :numeric_string => true, as: 'startTimeMillis'
        end
      end
      
      class Value
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :fp_val, as: 'fpVal'
          property :int_val, as: 'intVal'
          collection :map_val, as: 'mapVal', class: Google::Apis::FitnessV1::ValueMapValEntry, decorator: Google::Apis::FitnessV1::ValueMapValEntry::Representation
      
          property :string_val, as: 'stringVal'
        end
      end
      
      class ValueMapValEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          property :value, as: 'value', class: Google::Apis::FitnessV1::MapValue, decorator: Google::Apis::FitnessV1::MapValue::Representation
      
        end
      end
    end
  end
end
