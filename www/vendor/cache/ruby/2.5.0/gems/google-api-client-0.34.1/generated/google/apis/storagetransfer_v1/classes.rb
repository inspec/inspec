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
      
      # AWS access key (see
      # [AWS Security
      # Credentials](http://docs.aws.amazon.com/general/latest/gr/aws-security-
      # credentials.html)).
      class AwsAccessKey
        include Google::Apis::Core::Hashable
      
        # Required. AWS access key ID.
        # Corresponds to the JSON property `accessKeyId`
        # @return [String]
        attr_accessor :access_key_id
      
        # Required. AWS secret access key. This field is not returned in RPC
        # responses.
        # Corresponds to the JSON property `secretAccessKey`
        # @return [String]
        attr_accessor :secret_access_key
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @access_key_id = args[:access_key_id] if args.key?(:access_key_id)
          @secret_access_key = args[:secret_access_key] if args.key?(:secret_access_key)
        end
      end
      
      # An AwsS3Data resource can be a data source, but not a data sink.
      # In an AwsS3Data resource, an object's name is the S3 object's key name.
      class AwsS3Data
        include Google::Apis::Core::Hashable
      
        # AWS access key (see
        # [AWS Security
        # Credentials](http://docs.aws.amazon.com/general/latest/gr/aws-security-
        # credentials.html)).
        # Corresponds to the JSON property `awsAccessKey`
        # @return [Google::Apis::StoragetransferV1::AwsAccessKey]
        attr_accessor :aws_access_key
      
        # Required. S3 Bucket name (see
        # [Creating a
        # bucket](http://docs.aws.amazon.com/AmazonS3/latest/dev/create-bucket-get-
        # location-example.html)).
        # Corresponds to the JSON property `bucketName`
        # @return [String]
        attr_accessor :bucket_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @aws_access_key = args[:aws_access_key] if args.key?(:aws_access_key)
          @bucket_name = args[:bucket_name] if args.key?(:bucket_name)
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
      class Date
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
      
      # A generic empty message that you can re-use to avoid defining duplicated
      # empty messages in your APIs. A typical example is to use it as the request
      # or the response type of an API method. For instance:
      # service Foo `
      # rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);
      # `
      # The JSON representation for `Empty` is empty JSON object ````.
      class Empty
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # An entry describing an error that has occurred.
      class ErrorLogEntry
        include Google::Apis::Core::Hashable
      
        # A list of messages that carry the error details.
        # Corresponds to the JSON property `errorDetails`
        # @return [Array<String>]
        attr_accessor :error_details
      
        # Required. A URL that refers to the target (a data source, a data sink,
        # or an object) with which the error is associated.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_details = args[:error_details] if args.key?(:error_details)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # A summary of errors by error code, plus a count and sample error log
      # entries.
      class ErrorSummary
        include Google::Apis::Core::Hashable
      
        # Required.
        # Corresponds to the JSON property `errorCode`
        # @return [String]
        attr_accessor :error_code
      
        # Required. Count of this type of error.
        # Corresponds to the JSON property `errorCount`
        # @return [Fixnum]
        attr_accessor :error_count
      
        # Error samples.
        # At most 5 error log entries will be recorded for a given
        # error code for a single transfer operation.
        # Corresponds to the JSON property `errorLogEntries`
        # @return [Array<Google::Apis::StoragetransferV1::ErrorLogEntry>]
        attr_accessor :error_log_entries
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_code = args[:error_code] if args.key?(:error_code)
          @error_count = args[:error_count] if args.key?(:error_count)
          @error_log_entries = args[:error_log_entries] if args.key?(:error_log_entries)
        end
      end
      
      # In a GcsData resource, an object's name is the Cloud Storage object's
      # name and its `lastModificationTime` refers to the object's updated time,
      # which changes when the content or the metadata of the object is updated.
      class GcsData
        include Google::Apis::Core::Hashable
      
        # Required. Cloud Storage bucket name (see
        # [Bucket Name
        # Requirements](https://cloud.google.com/storage/docs/naming#requirements)).
        # Corresponds to the JSON property `bucketName`
        # @return [String]
        attr_accessor :bucket_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bucket_name = args[:bucket_name] if args.key?(:bucket_name)
        end
      end
      
      # Google service account
      class GoogleServiceAccount
        include Google::Apis::Core::Hashable
      
        # Email address of the service account.
        # Corresponds to the JSON property `accountEmail`
        # @return [String]
        attr_accessor :account_email
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_email = args[:account_email] if args.key?(:account_email)
        end
      end
      
      # An HttpData resource specifies a list of objects on the web to be transferred
      # over HTTP.  The information of the objects to be transferred is contained in
      # a file referenced by a URL. The first line in the file must be
      # "TsvHttpData-1.0", which specifies the format of the file.  Subsequent lines
      # specify the information of the list of objects, one object per list entry.
      # Each entry has the following tab-delimited fields:
      # * HTTP URL - The location of the object.
      # * Length - The size of the object in bytes.
      # * MD5 - The base64-encoded MD5 hash of the object.
      # For an example of a valid TSV file, see
      # [Transferring data from
      # URLs](https://cloud.google.com/storage/transfer/create-url-list).
      # When transferring data based on a URL list, keep the following in mind:
      # * When an object located at `http(s)://hostname:port/<URL-path>` is
      # transferred to a data sink, the name of the object at the data sink is
      # `<hostname>/<URL-path>`.
      # * If the specified size of an object does not match the actual size of the
      # object fetched, the object will not be transferred.
      # * If the specified MD5 does not match the MD5 computed from the transferred
      # bytes, the object transfer will fail. For more information, see
      # [Generating MD5 hashes](https://cloud.google.com/storage/transfer/#md5)
      # * Ensure that each URL you specify is publicly accessible. For
      # example, in Cloud Storage you can
      # [share an object publicly]
      # (https://cloud.google.com/storage/docs/cloud-console#_sharingdata) and get
      # a link to it.
      # * Storage Transfer Service obeys `robots.txt` rules and requires the source
      # HTTP server to support `Range` requests and to return a `Content-Length`
      # header in each response.
      # * [ObjectConditions](#ObjectConditions) have no effect when filtering objects
      # to transfer.
      class HttpData
        include Google::Apis::Core::Hashable
      
        # Required. The URL that points to the file that stores the object list
        # entries. This file must allow public access.  Currently, only URLs with
        # HTTP and HTTPS schemes are supported.
        # Corresponds to the JSON property `listUrl`
        # @return [String]
        attr_accessor :list_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @list_url = args[:list_url] if args.key?(:list_url)
        end
      end
      
      # The response message for Operations.ListOperations.
      class ListOperationsResponse
        include Google::Apis::Core::Hashable
      
        # The standard List next-page token.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # A list of operations that matches the specified filter in the request.
        # Corresponds to the JSON property `operations`
        # @return [Array<Google::Apis::StoragetransferV1::Operation>]
        attr_accessor :operations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @operations = args[:operations] if args.key?(:operations)
        end
      end
      
      # Response from ListTransferJobs.
      class ListTransferJobsResponse
        include Google::Apis::Core::Hashable
      
        # The list next page token.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # A list of transfer jobs.
        # Corresponds to the JSON property `transferJobs`
        # @return [Array<Google::Apis::StoragetransferV1::TransferJob>]
        attr_accessor :transfer_jobs
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @transfer_jobs = args[:transfer_jobs] if args.key?(:transfer_jobs)
        end
      end
      
      # Conditions that determine which objects will be transferred. Applies only
      # to S3 and Cloud Storage objects.
      class ObjectConditions
        include Google::Apis::Core::Hashable
      
        # `excludePrefixes` must follow the requirements described for
        # `includePrefixes`.
        # The max size of `excludePrefixes` is 1000.
        # Corresponds to the JSON property `excludePrefixes`
        # @return [Array<String>]
        attr_accessor :exclude_prefixes
      
        # If `includePrefixes` is specified, objects that satisfy the object
        # conditions must have names that start with one of the `includePrefixes`
        # and that do not start with any of the `excludePrefixes`. If
        # `includePrefixes` is not specified, all objects except those that have
        # names starting with one of the `excludePrefixes` must satisfy the object
        # conditions.
        # Requirements:
        # * Each include-prefix and exclude-prefix can contain any sequence of
        # Unicode characters, of max length 1024 bytes when UTF8-encoded, and
        # must not contain Carriage Return or Line Feed characters.  Wildcard
        # matching and regular expression matching are not supported.
        # * Each include-prefix and exclude-prefix must omit the leading slash.
        # For example, to include the `requests.gz` object in a transfer from
        # `s3://my-aws-bucket/logs/y=2015/requests.gz`, specify the include
        # prefix as `logs/y=2015/requests.gz`.
        # * None of the include-prefix or the exclude-prefix values can be empty,
        # if specified.
        # * Each include-prefix must include a distinct portion of the object
        # namespace, i.e., no include-prefix may be a prefix of another
        # include-prefix.
        # * Each exclude-prefix must exclude a distinct portion of the object
        # namespace, i.e., no exclude-prefix may be a prefix of another
        # exclude-prefix.
        # * If `includePrefixes` is specified, then each exclude-prefix must start
        # with the value of a path explicitly included by `includePrefixes`.
        # The max size of `includePrefixes` is 1000.
        # Corresponds to the JSON property `includePrefixes`
        # @return [Array<String>]
        attr_accessor :include_prefixes
      
        # If specified, only objects with a `lastModificationTime` on or after
        # `NOW` - `maxTimeElapsedSinceLastModification` and objects that don't have
        # a `lastModificationTime` are transferred.
        # Note that, for each `TransferOperation` started by this `TransferJob`,
        # `NOW` refers to the `start_time` of the 'TransferOperation`. Also,
        # `lastModificationTime` refers to the time of the last change to the
        # object's content or metadata - specifically, this would be the `updated`
        # property of Cloud Storage objects and the `LastModified` field of S3
        # objects.
        # Corresponds to the JSON property `maxTimeElapsedSinceLastModification`
        # @return [String]
        attr_accessor :max_time_elapsed_since_last_modification
      
        # If specified, only objects with a `lastModificationTime` before
        # `NOW` - `minTimeElapsedSinceLastModification` and objects that don't have a
        # `lastModificationTime` are transferred.
        # Note that, for each `TransferOperation` started by this `TransferJob`,
        # `NOW` refers to the `start_time` of the 'TransferOperation`. Also,
        # `lastModificationTime` refers to the time of the last change to the
        # object's content or metadata - specifically, this would be the `updated`
        # property of Cloud Storage objects and the `LastModified` field of S3
        # objects.
        # Corresponds to the JSON property `minTimeElapsedSinceLastModification`
        # @return [String]
        attr_accessor :min_time_elapsed_since_last_modification
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @exclude_prefixes = args[:exclude_prefixes] if args.key?(:exclude_prefixes)
          @include_prefixes = args[:include_prefixes] if args.key?(:include_prefixes)
          @max_time_elapsed_since_last_modification = args[:max_time_elapsed_since_last_modification] if args.key?(:max_time_elapsed_since_last_modification)
          @min_time_elapsed_since_last_modification = args[:min_time_elapsed_since_last_modification] if args.key?(:min_time_elapsed_since_last_modification)
        end
      end
      
      # This resource represents a long-running operation that is the result of a
      # network API call.
      class Operation
        include Google::Apis::Core::Hashable
      
        # If the value is `false`, it means the operation is still in progress.
        # If `true`, the operation is completed, and either `error` or `response` is
        # available.
        # Corresponds to the JSON property `done`
        # @return [Boolean]
        attr_accessor :done
        alias_method :done?, :done
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::StoragetransferV1::Status]
        attr_accessor :error
      
        # Represents the transfer operation object.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # The server-assigned name, which is only unique within the same service that
        # originally returns it. If you use the default HTTP mapping, the `name` should
        # have the format of `transferOperations/some/unique/name`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The normal response of the operation in case of success.  If the original
        # method returns no data on success, such as `Delete`, the response is
        # `google.protobuf.Empty`.  If the original method is standard
        # `Get`/`Create`/`Update`, the response should be the resource.  For other
        # methods, the response should have the type `XxxResponse`, where `Xxx`
        # is the original method name.  For example, if the original method name
        # is `TakeSnapshot()`, the inferred response type is
        # `TakeSnapshotResponse`.
        # Corresponds to the JSON property `response`
        # @return [Hash<String,Object>]
        attr_accessor :response
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @done = args[:done] if args.key?(:done)
          @error = args[:error] if args.key?(:error)
          @metadata = args[:metadata] if args.key?(:metadata)
          @name = args[:name] if args.key?(:name)
          @response = args[:response] if args.key?(:response)
        end
      end
      
      # Request passed to PauseTransferOperation.
      class PauseTransferOperationRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Request passed to ResumeTransferOperation.
      class ResumeTransferOperationRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Transfers can be scheduled to recur or to run just once.
      class Schedule
        include Google::Apis::Core::Hashable
      
        # Represents a whole or partial calendar date, e.g. a birthday. The time of day
        # and time zone are either specified elsewhere or are not significant. The date
        # is relative to the Proleptic Gregorian Calendar. This can represent:
        # * A full date, with non-zero year, month and day values
        # * A month and day value, with a zero year, e.g. an anniversary
        # * A year on its own, with zero month and day values
        # * A year and month value, with a zero day, e.g. a credit card expiration date
        # Related types are google.type.TimeOfDay and `google.protobuf.Timestamp`.
        # Corresponds to the JSON property `scheduleEndDate`
        # @return [Google::Apis::StoragetransferV1::Date]
        attr_accessor :schedule_end_date
      
        # Represents a whole or partial calendar date, e.g. a birthday. The time of day
        # and time zone are either specified elsewhere or are not significant. The date
        # is relative to the Proleptic Gregorian Calendar. This can represent:
        # * A full date, with non-zero year, month and day values
        # * A month and day value, with a zero year, e.g. an anniversary
        # * A year on its own, with zero month and day values
        # * A year and month value, with a zero day, e.g. a credit card expiration date
        # Related types are google.type.TimeOfDay and `google.protobuf.Timestamp`.
        # Corresponds to the JSON property `scheduleStartDate`
        # @return [Google::Apis::StoragetransferV1::Date]
        attr_accessor :schedule_start_date
      
        # Represents a time of day. The date and time zone are either not significant
        # or are specified elsewhere. An API may choose to allow leap seconds. Related
        # types are google.type.Date and `google.protobuf.Timestamp`.
        # Corresponds to the JSON property `startTimeOfDay`
        # @return [Google::Apis::StoragetransferV1::TimeOfDay]
        attr_accessor :start_time_of_day
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @schedule_end_date = args[:schedule_end_date] if args.key?(:schedule_end_date)
          @schedule_start_date = args[:schedule_start_date] if args.key?(:schedule_start_date)
          @start_time_of_day = args[:start_time_of_day] if args.key?(:start_time_of_day)
        end
      end
      
      # The `Status` type defines a logical error model that is suitable for
      # different programming environments, including REST APIs and RPC APIs. It is
      # used by [gRPC](https://github.com/grpc). Each `Status` message contains
      # three pieces of data: error code, error message, and error details.
      # You can find out more about this error model and how to work with it in the
      # [API Design Guide](https://cloud.google.com/apis/design/errors).
      class Status
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
      
      # Represents a time of day. The date and time zone are either not significant
      # or are specified elsewhere. An API may choose to allow leap seconds. Related
      # types are google.type.Date and `google.protobuf.Timestamp`.
      class TimeOfDay
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
      
      # A collection of counters that report the progress of a transfer operation.
      class TransferCounters
        include Google::Apis::Core::Hashable
      
        # Bytes that are copied to the data sink.
        # Corresponds to the JSON property `bytesCopiedToSink`
        # @return [Fixnum]
        attr_accessor :bytes_copied_to_sink
      
        # Bytes that are deleted from the data sink.
        # Corresponds to the JSON property `bytesDeletedFromSink`
        # @return [Fixnum]
        attr_accessor :bytes_deleted_from_sink
      
        # Bytes that are deleted from the data source.
        # Corresponds to the JSON property `bytesDeletedFromSource`
        # @return [Fixnum]
        attr_accessor :bytes_deleted_from_source
      
        # Bytes that failed to be deleted from the data sink.
        # Corresponds to the JSON property `bytesFailedToDeleteFromSink`
        # @return [Fixnum]
        attr_accessor :bytes_failed_to_delete_from_sink
      
        # Bytes found in the data source that are scheduled to be transferred,
        # excluding any that are filtered based on object conditions or skipped due
        # to sync.
        # Corresponds to the JSON property `bytesFoundFromSource`
        # @return [Fixnum]
        attr_accessor :bytes_found_from_source
      
        # Bytes found only in the data sink that are scheduled to be deleted.
        # Corresponds to the JSON property `bytesFoundOnlyFromSink`
        # @return [Fixnum]
        attr_accessor :bytes_found_only_from_sink
      
        # Bytes in the data source that failed to be transferred or that failed to
        # be deleted after being transferred.
        # Corresponds to the JSON property `bytesFromSourceFailed`
        # @return [Fixnum]
        attr_accessor :bytes_from_source_failed
      
        # Bytes in the data source that are not transferred because they already
        # exist in the data sink.
        # Corresponds to the JSON property `bytesFromSourceSkippedBySync`
        # @return [Fixnum]
        attr_accessor :bytes_from_source_skipped_by_sync
      
        # Objects that are copied to the data sink.
        # Corresponds to the JSON property `objectsCopiedToSink`
        # @return [Fixnum]
        attr_accessor :objects_copied_to_sink
      
        # Objects that are deleted from the data sink.
        # Corresponds to the JSON property `objectsDeletedFromSink`
        # @return [Fixnum]
        attr_accessor :objects_deleted_from_sink
      
        # Objects that are deleted from the data source.
        # Corresponds to the JSON property `objectsDeletedFromSource`
        # @return [Fixnum]
        attr_accessor :objects_deleted_from_source
      
        # Objects that failed to be deleted from the data sink.
        # Corresponds to the JSON property `objectsFailedToDeleteFromSink`
        # @return [Fixnum]
        attr_accessor :objects_failed_to_delete_from_sink
      
        # Objects found in the data source that are scheduled to be transferred,
        # excluding any that are filtered based on object conditions or skipped due
        # to sync.
        # Corresponds to the JSON property `objectsFoundFromSource`
        # @return [Fixnum]
        attr_accessor :objects_found_from_source
      
        # Objects found only in the data sink that are scheduled to be deleted.
        # Corresponds to the JSON property `objectsFoundOnlyFromSink`
        # @return [Fixnum]
        attr_accessor :objects_found_only_from_sink
      
        # Objects in the data source that failed to be transferred or that failed
        # to be deleted after being transferred.
        # Corresponds to the JSON property `objectsFromSourceFailed`
        # @return [Fixnum]
        attr_accessor :objects_from_source_failed
      
        # Objects in the data source that are not transferred because they already
        # exist in the data sink.
        # Corresponds to the JSON property `objectsFromSourceSkippedBySync`
        # @return [Fixnum]
        attr_accessor :objects_from_source_skipped_by_sync
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bytes_copied_to_sink = args[:bytes_copied_to_sink] if args.key?(:bytes_copied_to_sink)
          @bytes_deleted_from_sink = args[:bytes_deleted_from_sink] if args.key?(:bytes_deleted_from_sink)
          @bytes_deleted_from_source = args[:bytes_deleted_from_source] if args.key?(:bytes_deleted_from_source)
          @bytes_failed_to_delete_from_sink = args[:bytes_failed_to_delete_from_sink] if args.key?(:bytes_failed_to_delete_from_sink)
          @bytes_found_from_source = args[:bytes_found_from_source] if args.key?(:bytes_found_from_source)
          @bytes_found_only_from_sink = args[:bytes_found_only_from_sink] if args.key?(:bytes_found_only_from_sink)
          @bytes_from_source_failed = args[:bytes_from_source_failed] if args.key?(:bytes_from_source_failed)
          @bytes_from_source_skipped_by_sync = args[:bytes_from_source_skipped_by_sync] if args.key?(:bytes_from_source_skipped_by_sync)
          @objects_copied_to_sink = args[:objects_copied_to_sink] if args.key?(:objects_copied_to_sink)
          @objects_deleted_from_sink = args[:objects_deleted_from_sink] if args.key?(:objects_deleted_from_sink)
          @objects_deleted_from_source = args[:objects_deleted_from_source] if args.key?(:objects_deleted_from_source)
          @objects_failed_to_delete_from_sink = args[:objects_failed_to_delete_from_sink] if args.key?(:objects_failed_to_delete_from_sink)
          @objects_found_from_source = args[:objects_found_from_source] if args.key?(:objects_found_from_source)
          @objects_found_only_from_sink = args[:objects_found_only_from_sink] if args.key?(:objects_found_only_from_sink)
          @objects_from_source_failed = args[:objects_from_source_failed] if args.key?(:objects_from_source_failed)
          @objects_from_source_skipped_by_sync = args[:objects_from_source_skipped_by_sync] if args.key?(:objects_from_source_skipped_by_sync)
        end
      end
      
      # This resource represents the configuration of a transfer job that runs
      # periodically.
      class TransferJob
        include Google::Apis::Core::Hashable
      
        # Output only. The time that the transfer job was created.
        # Corresponds to the JSON property `creationTime`
        # @return [String]
        attr_accessor :creation_time
      
        # Output only. The time that the transfer job was deleted.
        # Corresponds to the JSON property `deletionTime`
        # @return [String]
        attr_accessor :deletion_time
      
        # A description provided by the user for the job. Its max length is 1024
        # bytes when Unicode-encoded.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Output only. The time that the transfer job was last modified.
        # Corresponds to the JSON property `lastModificationTime`
        # @return [String]
        attr_accessor :last_modification_time
      
        # A globally unique name assigned by Storage Transfer Service when the
        # job is created. This field should be left empty in requests to create a new
        # transfer job; otherwise, the requests result in an `INVALID_ARGUMENT`
        # error.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The ID of the Google Cloud Platform Project that owns the job.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Transfers can be scheduled to recur or to run just once.
        # Corresponds to the JSON property `schedule`
        # @return [Google::Apis::StoragetransferV1::Schedule]
        attr_accessor :schedule
      
        # Status of the job. This value MUST be specified for
        # `CreateTransferJobRequests`.
        # NOTE: The effect of the new job status takes place during a subsequent job
        # run. For example, if you change the job status from `ENABLED` to
        # `DISABLED`, and an operation spawned by the transfer is running, the status
        # change would not affect the current operation.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # Configuration for running a transfer.
        # Corresponds to the JSON property `transferSpec`
        # @return [Google::Apis::StoragetransferV1::TransferSpec]
        attr_accessor :transfer_spec
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @creation_time = args[:creation_time] if args.key?(:creation_time)
          @deletion_time = args[:deletion_time] if args.key?(:deletion_time)
          @description = args[:description] if args.key?(:description)
          @last_modification_time = args[:last_modification_time] if args.key?(:last_modification_time)
          @name = args[:name] if args.key?(:name)
          @project_id = args[:project_id] if args.key?(:project_id)
          @schedule = args[:schedule] if args.key?(:schedule)
          @status = args[:status] if args.key?(:status)
          @transfer_spec = args[:transfer_spec] if args.key?(:transfer_spec)
        end
      end
      
      # A description of the execution of a transfer.
      class TransferOperation
        include Google::Apis::Core::Hashable
      
        # A collection of counters that report the progress of a transfer operation.
        # Corresponds to the JSON property `counters`
        # @return [Google::Apis::StoragetransferV1::TransferCounters]
        attr_accessor :counters
      
        # End time of this transfer execution.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Summarizes errors encountered with sample error log entries.
        # Corresponds to the JSON property `errorBreakdowns`
        # @return [Array<Google::Apis::StoragetransferV1::ErrorSummary>]
        attr_accessor :error_breakdowns
      
        # A globally unique ID assigned by the system.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The ID of the Google Cloud Platform Project that owns the operation.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Start time of this transfer execution.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # Status of the transfer operation.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # The name of the transfer job that triggers this transfer operation.
        # Corresponds to the JSON property `transferJobName`
        # @return [String]
        attr_accessor :transfer_job_name
      
        # Configuration for running a transfer.
        # Corresponds to the JSON property `transferSpec`
        # @return [Google::Apis::StoragetransferV1::TransferSpec]
        attr_accessor :transfer_spec
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @counters = args[:counters] if args.key?(:counters)
          @end_time = args[:end_time] if args.key?(:end_time)
          @error_breakdowns = args[:error_breakdowns] if args.key?(:error_breakdowns)
          @name = args[:name] if args.key?(:name)
          @project_id = args[:project_id] if args.key?(:project_id)
          @start_time = args[:start_time] if args.key?(:start_time)
          @status = args[:status] if args.key?(:status)
          @transfer_job_name = args[:transfer_job_name] if args.key?(:transfer_job_name)
          @transfer_spec = args[:transfer_spec] if args.key?(:transfer_spec)
        end
      end
      
      # TransferOptions uses three boolean parameters to define the actions
      # to be performed on objects in a transfer.
      class TransferOptions
        include Google::Apis::Core::Hashable
      
        # Whether objects should be deleted from the source after they are
        # transferred to the sink.  Note that this option and
        # `deleteObjectsUniqueInSink` are mutually exclusive.
        # Corresponds to the JSON property `deleteObjectsFromSourceAfterTransfer`
        # @return [Boolean]
        attr_accessor :delete_objects_from_source_after_transfer
        alias_method :delete_objects_from_source_after_transfer?, :delete_objects_from_source_after_transfer
      
        # Whether objects that exist only in the sink should be deleted.  Note that
        # this option and `deleteObjectsFromSourceAfterTransfer` are mutually
        # exclusive.
        # Corresponds to the JSON property `deleteObjectsUniqueInSink`
        # @return [Boolean]
        attr_accessor :delete_objects_unique_in_sink
        alias_method :delete_objects_unique_in_sink?, :delete_objects_unique_in_sink
      
        # Whether overwriting objects that already exist in the sink is allowed.
        # Corresponds to the JSON property `overwriteObjectsAlreadyExistingInSink`
        # @return [Boolean]
        attr_accessor :overwrite_objects_already_existing_in_sink
        alias_method :overwrite_objects_already_existing_in_sink?, :overwrite_objects_already_existing_in_sink
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @delete_objects_from_source_after_transfer = args[:delete_objects_from_source_after_transfer] if args.key?(:delete_objects_from_source_after_transfer)
          @delete_objects_unique_in_sink = args[:delete_objects_unique_in_sink] if args.key?(:delete_objects_unique_in_sink)
          @overwrite_objects_already_existing_in_sink = args[:overwrite_objects_already_existing_in_sink] if args.key?(:overwrite_objects_already_existing_in_sink)
        end
      end
      
      # Configuration for running a transfer.
      class TransferSpec
        include Google::Apis::Core::Hashable
      
        # An AwsS3Data resource can be a data source, but not a data sink.
        # In an AwsS3Data resource, an object's name is the S3 object's key name.
        # Corresponds to the JSON property `awsS3DataSource`
        # @return [Google::Apis::StoragetransferV1::AwsS3Data]
        attr_accessor :aws_s3_data_source
      
        # In a GcsData resource, an object's name is the Cloud Storage object's
        # name and its `lastModificationTime` refers to the object's updated time,
        # which changes when the content or the metadata of the object is updated.
        # Corresponds to the JSON property `gcsDataSink`
        # @return [Google::Apis::StoragetransferV1::GcsData]
        attr_accessor :gcs_data_sink
      
        # In a GcsData resource, an object's name is the Cloud Storage object's
        # name and its `lastModificationTime` refers to the object's updated time,
        # which changes when the content or the metadata of the object is updated.
        # Corresponds to the JSON property `gcsDataSource`
        # @return [Google::Apis::StoragetransferV1::GcsData]
        attr_accessor :gcs_data_source
      
        # An HttpData resource specifies a list of objects on the web to be transferred
        # over HTTP.  The information of the objects to be transferred is contained in
        # a file referenced by a URL. The first line in the file must be
        # "TsvHttpData-1.0", which specifies the format of the file.  Subsequent lines
        # specify the information of the list of objects, one object per list entry.
        # Each entry has the following tab-delimited fields:
        # * HTTP URL - The location of the object.
        # * Length - The size of the object in bytes.
        # * MD5 - The base64-encoded MD5 hash of the object.
        # For an example of a valid TSV file, see
        # [Transferring data from
        # URLs](https://cloud.google.com/storage/transfer/create-url-list).
        # When transferring data based on a URL list, keep the following in mind:
        # * When an object located at `http(s)://hostname:port/<URL-path>` is
        # transferred to a data sink, the name of the object at the data sink is
        # `<hostname>/<URL-path>`.
        # * If the specified size of an object does not match the actual size of the
        # object fetched, the object will not be transferred.
        # * If the specified MD5 does not match the MD5 computed from the transferred
        # bytes, the object transfer will fail. For more information, see
        # [Generating MD5 hashes](https://cloud.google.com/storage/transfer/#md5)
        # * Ensure that each URL you specify is publicly accessible. For
        # example, in Cloud Storage you can
        # [share an object publicly]
        # (https://cloud.google.com/storage/docs/cloud-console#_sharingdata) and get
        # a link to it.
        # * Storage Transfer Service obeys `robots.txt` rules and requires the source
        # HTTP server to support `Range` requests and to return a `Content-Length`
        # header in each response.
        # * [ObjectConditions](#ObjectConditions) have no effect when filtering objects
        # to transfer.
        # Corresponds to the JSON property `httpDataSource`
        # @return [Google::Apis::StoragetransferV1::HttpData]
        attr_accessor :http_data_source
      
        # Conditions that determine which objects will be transferred. Applies only
        # to S3 and Cloud Storage objects.
        # Corresponds to the JSON property `objectConditions`
        # @return [Google::Apis::StoragetransferV1::ObjectConditions]
        attr_accessor :object_conditions
      
        # TransferOptions uses three boolean parameters to define the actions
        # to be performed on objects in a transfer.
        # Corresponds to the JSON property `transferOptions`
        # @return [Google::Apis::StoragetransferV1::TransferOptions]
        attr_accessor :transfer_options
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @aws_s3_data_source = args[:aws_s3_data_source] if args.key?(:aws_s3_data_source)
          @gcs_data_sink = args[:gcs_data_sink] if args.key?(:gcs_data_sink)
          @gcs_data_source = args[:gcs_data_source] if args.key?(:gcs_data_source)
          @http_data_source = args[:http_data_source] if args.key?(:http_data_source)
          @object_conditions = args[:object_conditions] if args.key?(:object_conditions)
          @transfer_options = args[:transfer_options] if args.key?(:transfer_options)
        end
      end
      
      # Request passed to UpdateTransferJob.
      class UpdateTransferJobRequest
        include Google::Apis::Core::Hashable
      
        # Required. The ID of the Google Cloud Platform Console project that owns the
        # job.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # This resource represents the configuration of a transfer job that runs
        # periodically.
        # Corresponds to the JSON property `transferJob`
        # @return [Google::Apis::StoragetransferV1::TransferJob]
        attr_accessor :transfer_job
      
        # The field mask of the fields in `transferJob` that are to be updated in
        # this request.  Fields in `transferJob` that can be updated are:
        # `description`, `transferSpec`, and `status`.  To update the `transferSpec`
        # of the job, a complete transfer specification has to be provided. An
        # incomplete specification which misses any required fields will be rejected
        # with the error `INVALID_ARGUMENT`.
        # Corresponds to the JSON property `updateTransferJobFieldMask`
        # @return [String]
        attr_accessor :update_transfer_job_field_mask
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @project_id = args[:project_id] if args.key?(:project_id)
          @transfer_job = args[:transfer_job] if args.key?(:transfer_job)
          @update_transfer_job_field_mask = args[:update_transfer_job_field_mask] if args.key?(:update_transfer_job_field_mask)
        end
      end
    end
  end
end
