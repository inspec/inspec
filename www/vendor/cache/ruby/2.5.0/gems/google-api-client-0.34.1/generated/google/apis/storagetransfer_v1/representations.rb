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
    module StoragetransferV1
      
      class AwsAccessKey
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AwsS3Data
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Date
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ErrorLogEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ErrorSummary
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GcsData
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleServiceAccount
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HttpData
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListOperationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListTransferJobsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ObjectConditions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Operation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PauseTransferOperationRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResumeTransferOperationRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Schedule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Status
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TimeOfDay
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TransferCounters
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TransferJob
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TransferOperation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TransferOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TransferSpec
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateTransferJobRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AwsAccessKey
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :access_key_id, as: 'accessKeyId'
          property :secret_access_key, as: 'secretAccessKey'
        end
      end
      
      class AwsS3Data
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :aws_access_key, as: 'awsAccessKey', class: Google::Apis::StoragetransferV1::AwsAccessKey, decorator: Google::Apis::StoragetransferV1::AwsAccessKey::Representation
      
          property :bucket_name, as: 'bucketName'
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
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class ErrorLogEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :error_details, as: 'errorDetails'
          property :url, as: 'url'
        end
      end
      
      class ErrorSummary
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :error_code, as: 'errorCode'
          property :error_count, :numeric_string => true, as: 'errorCount'
          collection :error_log_entries, as: 'errorLogEntries', class: Google::Apis::StoragetransferV1::ErrorLogEntry, decorator: Google::Apis::StoragetransferV1::ErrorLogEntry::Representation
      
        end
      end
      
      class GcsData
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bucket_name, as: 'bucketName'
        end
      end
      
      class GoogleServiceAccount
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_email, as: 'accountEmail'
        end
      end
      
      class HttpData
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :list_url, as: 'listUrl'
        end
      end
      
      class ListOperationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :operations, as: 'operations', class: Google::Apis::StoragetransferV1::Operation, decorator: Google::Apis::StoragetransferV1::Operation::Representation
      
        end
      end
      
      class ListTransferJobsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :transfer_jobs, as: 'transferJobs', class: Google::Apis::StoragetransferV1::TransferJob, decorator: Google::Apis::StoragetransferV1::TransferJob::Representation
      
        end
      end
      
      class ObjectConditions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :exclude_prefixes, as: 'excludePrefixes'
          collection :include_prefixes, as: 'includePrefixes'
          property :max_time_elapsed_since_last_modification, as: 'maxTimeElapsedSinceLastModification'
          property :min_time_elapsed_since_last_modification, as: 'minTimeElapsedSinceLastModification'
        end
      end
      
      class Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :done, as: 'done'
          property :error, as: 'error', class: Google::Apis::StoragetransferV1::Status, decorator: Google::Apis::StoragetransferV1::Status::Representation
      
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
          hash :response, as: 'response'
        end
      end
      
      class PauseTransferOperationRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class ResumeTransferOperationRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class Schedule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :schedule_end_date, as: 'scheduleEndDate', class: Google::Apis::StoragetransferV1::Date, decorator: Google::Apis::StoragetransferV1::Date::Representation
      
          property :schedule_start_date, as: 'scheduleStartDate', class: Google::Apis::StoragetransferV1::Date, decorator: Google::Apis::StoragetransferV1::Date::Representation
      
          property :start_time_of_day, as: 'startTimeOfDay', class: Google::Apis::StoragetransferV1::TimeOfDay, decorator: Google::Apis::StoragetransferV1::TimeOfDay::Representation
      
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
      
      class TimeOfDay
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :hours, as: 'hours'
          property :minutes, as: 'minutes'
          property :nanos, as: 'nanos'
          property :seconds, as: 'seconds'
        end
      end
      
      class TransferCounters
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bytes_copied_to_sink, :numeric_string => true, as: 'bytesCopiedToSink'
          property :bytes_deleted_from_sink, :numeric_string => true, as: 'bytesDeletedFromSink'
          property :bytes_deleted_from_source, :numeric_string => true, as: 'bytesDeletedFromSource'
          property :bytes_failed_to_delete_from_sink, :numeric_string => true, as: 'bytesFailedToDeleteFromSink'
          property :bytes_found_from_source, :numeric_string => true, as: 'bytesFoundFromSource'
          property :bytes_found_only_from_sink, :numeric_string => true, as: 'bytesFoundOnlyFromSink'
          property :bytes_from_source_failed, :numeric_string => true, as: 'bytesFromSourceFailed'
          property :bytes_from_source_skipped_by_sync, :numeric_string => true, as: 'bytesFromSourceSkippedBySync'
          property :objects_copied_to_sink, :numeric_string => true, as: 'objectsCopiedToSink'
          property :objects_deleted_from_sink, :numeric_string => true, as: 'objectsDeletedFromSink'
          property :objects_deleted_from_source, :numeric_string => true, as: 'objectsDeletedFromSource'
          property :objects_failed_to_delete_from_sink, :numeric_string => true, as: 'objectsFailedToDeleteFromSink'
          property :objects_found_from_source, :numeric_string => true, as: 'objectsFoundFromSource'
          property :objects_found_only_from_sink, :numeric_string => true, as: 'objectsFoundOnlyFromSink'
          property :objects_from_source_failed, :numeric_string => true, as: 'objectsFromSourceFailed'
          property :objects_from_source_skipped_by_sync, :numeric_string => true, as: 'objectsFromSourceSkippedBySync'
        end
      end
      
      class TransferJob
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_time, as: 'creationTime'
          property :deletion_time, as: 'deletionTime'
          property :description, as: 'description'
          property :last_modification_time, as: 'lastModificationTime'
          property :name, as: 'name'
          property :project_id, as: 'projectId'
          property :schedule, as: 'schedule', class: Google::Apis::StoragetransferV1::Schedule, decorator: Google::Apis::StoragetransferV1::Schedule::Representation
      
          property :status, as: 'status'
          property :transfer_spec, as: 'transferSpec', class: Google::Apis::StoragetransferV1::TransferSpec, decorator: Google::Apis::StoragetransferV1::TransferSpec::Representation
      
        end
      end
      
      class TransferOperation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :counters, as: 'counters', class: Google::Apis::StoragetransferV1::TransferCounters, decorator: Google::Apis::StoragetransferV1::TransferCounters::Representation
      
          property :end_time, as: 'endTime'
          collection :error_breakdowns, as: 'errorBreakdowns', class: Google::Apis::StoragetransferV1::ErrorSummary, decorator: Google::Apis::StoragetransferV1::ErrorSummary::Representation
      
          property :name, as: 'name'
          property :project_id, as: 'projectId'
          property :start_time, as: 'startTime'
          property :status, as: 'status'
          property :transfer_job_name, as: 'transferJobName'
          property :transfer_spec, as: 'transferSpec', class: Google::Apis::StoragetransferV1::TransferSpec, decorator: Google::Apis::StoragetransferV1::TransferSpec::Representation
      
        end
      end
      
      class TransferOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :delete_objects_from_source_after_transfer, as: 'deleteObjectsFromSourceAfterTransfer'
          property :delete_objects_unique_in_sink, as: 'deleteObjectsUniqueInSink'
          property :overwrite_objects_already_existing_in_sink, as: 'overwriteObjectsAlreadyExistingInSink'
        end
      end
      
      class TransferSpec
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :aws_s3_data_source, as: 'awsS3DataSource', class: Google::Apis::StoragetransferV1::AwsS3Data, decorator: Google::Apis::StoragetransferV1::AwsS3Data::Representation
      
          property :gcs_data_sink, as: 'gcsDataSink', class: Google::Apis::StoragetransferV1::GcsData, decorator: Google::Apis::StoragetransferV1::GcsData::Representation
      
          property :gcs_data_source, as: 'gcsDataSource', class: Google::Apis::StoragetransferV1::GcsData, decorator: Google::Apis::StoragetransferV1::GcsData::Representation
      
          property :http_data_source, as: 'httpDataSource', class: Google::Apis::StoragetransferV1::HttpData, decorator: Google::Apis::StoragetransferV1::HttpData::Representation
      
          property :object_conditions, as: 'objectConditions', class: Google::Apis::StoragetransferV1::ObjectConditions, decorator: Google::Apis::StoragetransferV1::ObjectConditions::Representation
      
          property :transfer_options, as: 'transferOptions', class: Google::Apis::StoragetransferV1::TransferOptions, decorator: Google::Apis::StoragetransferV1::TransferOptions::Representation
      
        end
      end
      
      class UpdateTransferJobRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :project_id, as: 'projectId'
          property :transfer_job, as: 'transferJob', class: Google::Apis::StoragetransferV1::TransferJob, decorator: Google::Apis::StoragetransferV1::TransferJob::Representation
      
          property :update_transfer_job_field_mask, as: 'updateTransferJobFieldMask'
        end
      end
    end
  end
end
