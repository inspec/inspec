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
    module BigquerydatatransferV1
      
      class CheckValidCredsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CheckValidCredsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DataSource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DataSourceParameter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListDataSourcesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListLocationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListTransferConfigsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListTransferLogsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListTransferRunsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Location
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ScheduleOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ScheduleTransferRunsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ScheduleTransferRunsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StartManualTransferRunsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StartManualTransferRunsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Status
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TimeRange
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TransferConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TransferMessage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TransferRun
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CheckValidCredsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class CheckValidCredsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :has_valid_creds, as: 'hasValidCreds'
        end
      end
      
      class DataSource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :authorization_type, as: 'authorizationType'
          property :client_id, as: 'clientId'
          property :data_refresh_type, as: 'dataRefreshType'
          property :data_source_id, as: 'dataSourceId'
          property :default_data_refresh_window_days, as: 'defaultDataRefreshWindowDays'
          property :default_schedule, as: 'defaultSchedule'
          property :description, as: 'description'
          property :display_name, as: 'displayName'
          property :help_url, as: 'helpUrl'
          property :manual_runs_disabled, as: 'manualRunsDisabled'
          property :minimum_schedule_interval, as: 'minimumScheduleInterval'
          property :name, as: 'name'
          collection :parameters, as: 'parameters', class: Google::Apis::BigquerydatatransferV1::DataSourceParameter, decorator: Google::Apis::BigquerydatatransferV1::DataSourceParameter::Representation
      
          collection :scopes, as: 'scopes'
          property :supports_custom_schedule, as: 'supportsCustomSchedule'
          property :supports_multiple_transfers, as: 'supportsMultipleTransfers'
          property :transfer_type, as: 'transferType'
          property :update_deadline_seconds, as: 'updateDeadlineSeconds'
        end
      end
      
      class DataSourceParameter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :allowed_values, as: 'allowedValues'
          property :deprecated, as: 'deprecated'
          property :description, as: 'description'
          property :display_name, as: 'displayName'
          collection :fields, as: 'fields', class: Google::Apis::BigquerydatatransferV1::DataSourceParameter, decorator: Google::Apis::BigquerydatatransferV1::DataSourceParameter::Representation
      
          property :immutable, as: 'immutable'
          property :max_value, as: 'maxValue'
          property :min_value, as: 'minValue'
          property :param_id, as: 'paramId'
          property :recurse, as: 'recurse'
          property :repeated, as: 'repeated'
          property :required, as: 'required'
          property :type, as: 'type'
          property :validation_description, as: 'validationDescription'
          property :validation_help_url, as: 'validationHelpUrl'
          property :validation_regex, as: 'validationRegex'
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class ListDataSourcesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :data_sources, as: 'dataSources', class: Google::Apis::BigquerydatatransferV1::DataSource, decorator: Google::Apis::BigquerydatatransferV1::DataSource::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListLocationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :locations, as: 'locations', class: Google::Apis::BigquerydatatransferV1::Location, decorator: Google::Apis::BigquerydatatransferV1::Location::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListTransferConfigsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :transfer_configs, as: 'transferConfigs', class: Google::Apis::BigquerydatatransferV1::TransferConfig, decorator: Google::Apis::BigquerydatatransferV1::TransferConfig::Representation
      
        end
      end
      
      class ListTransferLogsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :transfer_messages, as: 'transferMessages', class: Google::Apis::BigquerydatatransferV1::TransferMessage, decorator: Google::Apis::BigquerydatatransferV1::TransferMessage::Representation
      
        end
      end
      
      class ListTransferRunsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :transfer_runs, as: 'transferRuns', class: Google::Apis::BigquerydatatransferV1::TransferRun, decorator: Google::Apis::BigquerydatatransferV1::TransferRun::Representation
      
        end
      end
      
      class Location
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_name, as: 'displayName'
          hash :labels, as: 'labels'
          property :location_id, as: 'locationId'
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
        end
      end
      
      class ScheduleOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :disable_auto_scheduling, as: 'disableAutoScheduling'
          property :end_time, as: 'endTime'
          property :start_time, as: 'startTime'
        end
      end
      
      class ScheduleTransferRunsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_time, as: 'endTime'
          property :start_time, as: 'startTime'
        end
      end
      
      class ScheduleTransferRunsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :runs, as: 'runs', class: Google::Apis::BigquerydatatransferV1::TransferRun, decorator: Google::Apis::BigquerydatatransferV1::TransferRun::Representation
      
        end
      end
      
      class StartManualTransferRunsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :requested_run_time, as: 'requestedRunTime'
          property :requested_time_range, as: 'requestedTimeRange', class: Google::Apis::BigquerydatatransferV1::TimeRange, decorator: Google::Apis::BigquerydatatransferV1::TimeRange::Representation
      
        end
      end
      
      class StartManualTransferRunsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :runs, as: 'runs', class: Google::Apis::BigquerydatatransferV1::TransferRun, decorator: Google::Apis::BigquerydatatransferV1::TransferRun::Representation
      
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
      
      class TimeRange
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_time, as: 'endTime'
          property :start_time, as: 'startTime'
        end
      end
      
      class TransferConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :data_refresh_window_days, as: 'dataRefreshWindowDays'
          property :data_source_id, as: 'dataSourceId'
          property :dataset_region, as: 'datasetRegion'
          property :destination_dataset_id, as: 'destinationDatasetId'
          property :disabled, as: 'disabled'
          property :display_name, as: 'displayName'
          property :name, as: 'name'
          property :next_run_time, as: 'nextRunTime'
          hash :params, as: 'params'
          property :schedule, as: 'schedule'
          property :schedule_options, as: 'scheduleOptions', class: Google::Apis::BigquerydatatransferV1::ScheduleOptions, decorator: Google::Apis::BigquerydatatransferV1::ScheduleOptions::Representation
      
          property :state, as: 'state'
          property :update_time, as: 'updateTime'
          property :user_id, :numeric_string => true, as: 'userId'
        end
      end
      
      class TransferMessage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :message_text, as: 'messageText'
          property :message_time, as: 'messageTime'
          property :severity, as: 'severity'
        end
      end
      
      class TransferRun
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :data_source_id, as: 'dataSourceId'
          property :destination_dataset_id, as: 'destinationDatasetId'
          property :end_time, as: 'endTime'
          property :error_status, as: 'errorStatus', class: Google::Apis::BigquerydatatransferV1::Status, decorator: Google::Apis::BigquerydatatransferV1::Status::Representation
      
          property :name, as: 'name'
          hash :params, as: 'params'
          property :run_time, as: 'runTime'
          property :schedule, as: 'schedule'
          property :schedule_time, as: 'scheduleTime'
          property :start_time, as: 'startTime'
          property :state, as: 'state'
          property :update_time, as: 'updateTime'
          property :user_id, :numeric_string => true, as: 'userId'
        end
      end
    end
  end
end
