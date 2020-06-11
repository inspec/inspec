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
    module YoutubereportingV1
      
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
      
      # gdata
      class GdataBlobstore2Info
        include Google::Apis::Core::Hashable
      
        # gdata
        # Corresponds to the JSON property `blobGeneration`
        # @return [Fixnum]
        attr_accessor :blob_generation
      
        # gdata
        # Corresponds to the JSON property `blobId`
        # @return [String]
        attr_accessor :blob_id
      
        # gdata
        # Corresponds to the JSON property `downloadReadHandle`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :download_read_handle
      
        # gdata
        # Corresponds to the JSON property `readToken`
        # @return [String]
        attr_accessor :read_token
      
        # gdata
        # Corresponds to the JSON property `uploadMetadataContainer`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :upload_metadata_container
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @blob_generation = args[:blob_generation] if args.key?(:blob_generation)
          @blob_id = args[:blob_id] if args.key?(:blob_id)
          @download_read_handle = args[:download_read_handle] if args.key?(:download_read_handle)
          @read_token = args[:read_token] if args.key?(:read_token)
          @upload_metadata_container = args[:upload_metadata_container] if args.key?(:upload_metadata_container)
        end
      end
      
      # gdata
      class GdataCompositeMedia
        include Google::Apis::Core::Hashable
      
        # gdata
        # Corresponds to the JSON property `blobRef`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :blob_ref
      
        # gdata
        # Corresponds to the JSON property `blobstore2Info`
        # @return [Google::Apis::YoutubereportingV1::GdataBlobstore2Info]
        attr_accessor :blobstore2_info
      
        # gdata
        # Corresponds to the JSON property `cosmoBinaryReference`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :cosmo_binary_reference
      
        # gdata
        # Corresponds to the JSON property `crc32cHash`
        # @return [Fixnum]
        attr_accessor :crc32c_hash
      
        # gdata
        # Corresponds to the JSON property `inline`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :inline
      
        # gdata
        # Corresponds to the JSON property `length`
        # @return [Fixnum]
        attr_accessor :length
      
        # gdata
        # Corresponds to the JSON property `md5Hash`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :md5_hash
      
        # gdata
        # Corresponds to the JSON property `objectId`
        # @return [Google::Apis::YoutubereportingV1::GdataObjectId]
        attr_accessor :object_id_prop
      
        # gdata
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        # gdata
        # Corresponds to the JSON property `referenceType`
        # @return [String]
        attr_accessor :reference_type
      
        # gdata
        # Corresponds to the JSON property `sha1Hash`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :sha1_hash
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @blob_ref = args[:blob_ref] if args.key?(:blob_ref)
          @blobstore2_info = args[:blobstore2_info] if args.key?(:blobstore2_info)
          @cosmo_binary_reference = args[:cosmo_binary_reference] if args.key?(:cosmo_binary_reference)
          @crc32c_hash = args[:crc32c_hash] if args.key?(:crc32c_hash)
          @inline = args[:inline] if args.key?(:inline)
          @length = args[:length] if args.key?(:length)
          @md5_hash = args[:md5_hash] if args.key?(:md5_hash)
          @object_id_prop = args[:object_id_prop] if args.key?(:object_id_prop)
          @path = args[:path] if args.key?(:path)
          @reference_type = args[:reference_type] if args.key?(:reference_type)
          @sha1_hash = args[:sha1_hash] if args.key?(:sha1_hash)
        end
      end
      
      # gdata
      class GdataContentTypeInfo
        include Google::Apis::Core::Hashable
      
        # gdata
        # Corresponds to the JSON property `bestGuess`
        # @return [String]
        attr_accessor :best_guess
      
        # gdata
        # Corresponds to the JSON property `fromBytes`
        # @return [String]
        attr_accessor :from_bytes
      
        # gdata
        # Corresponds to the JSON property `fromFileName`
        # @return [String]
        attr_accessor :from_file_name
      
        # gdata
        # Corresponds to the JSON property `fromHeader`
        # @return [String]
        attr_accessor :from_header
      
        # gdata
        # Corresponds to the JSON property `fromUrlPath`
        # @return [String]
        attr_accessor :from_url_path
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @best_guess = args[:best_guess] if args.key?(:best_guess)
          @from_bytes = args[:from_bytes] if args.key?(:from_bytes)
          @from_file_name = args[:from_file_name] if args.key?(:from_file_name)
          @from_header = args[:from_header] if args.key?(:from_header)
          @from_url_path = args[:from_url_path] if args.key?(:from_url_path)
        end
      end
      
      # gdata
      class GdataDiffChecksumsResponse
        include Google::Apis::Core::Hashable
      
        # gdata
        # Corresponds to the JSON property `checksumsLocation`
        # @return [Google::Apis::YoutubereportingV1::GdataCompositeMedia]
        attr_accessor :checksums_location
      
        # gdata
        # Corresponds to the JSON property `chunkSizeBytes`
        # @return [Fixnum]
        attr_accessor :chunk_size_bytes
      
        # gdata
        # Corresponds to the JSON property `objectLocation`
        # @return [Google::Apis::YoutubereportingV1::GdataCompositeMedia]
        attr_accessor :object_location
      
        # gdata
        # Corresponds to the JSON property `objectSizeBytes`
        # @return [Fixnum]
        attr_accessor :object_size_bytes
      
        # gdata
        # Corresponds to the JSON property `objectVersion`
        # @return [String]
        attr_accessor :object_version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @checksums_location = args[:checksums_location] if args.key?(:checksums_location)
          @chunk_size_bytes = args[:chunk_size_bytes] if args.key?(:chunk_size_bytes)
          @object_location = args[:object_location] if args.key?(:object_location)
          @object_size_bytes = args[:object_size_bytes] if args.key?(:object_size_bytes)
          @object_version = args[:object_version] if args.key?(:object_version)
        end
      end
      
      # gdata
      class GdataDiffDownloadResponse
        include Google::Apis::Core::Hashable
      
        # gdata
        # Corresponds to the JSON property `objectLocation`
        # @return [Google::Apis::YoutubereportingV1::GdataCompositeMedia]
        attr_accessor :object_location
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @object_location = args[:object_location] if args.key?(:object_location)
        end
      end
      
      # gdata
      class GdataDiffUploadRequest
        include Google::Apis::Core::Hashable
      
        # gdata
        # Corresponds to the JSON property `checksumsInfo`
        # @return [Google::Apis::YoutubereportingV1::GdataCompositeMedia]
        attr_accessor :checksums_info
      
        # gdata
        # Corresponds to the JSON property `objectInfo`
        # @return [Google::Apis::YoutubereportingV1::GdataCompositeMedia]
        attr_accessor :object_info
      
        # gdata
        # Corresponds to the JSON property `objectVersion`
        # @return [String]
        attr_accessor :object_version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @checksums_info = args[:checksums_info] if args.key?(:checksums_info)
          @object_info = args[:object_info] if args.key?(:object_info)
          @object_version = args[:object_version] if args.key?(:object_version)
        end
      end
      
      # gdata
      class GdataDiffUploadResponse
        include Google::Apis::Core::Hashable
      
        # gdata
        # Corresponds to the JSON property `objectVersion`
        # @return [String]
        attr_accessor :object_version
      
        # gdata
        # Corresponds to the JSON property `originalObject`
        # @return [Google::Apis::YoutubereportingV1::GdataCompositeMedia]
        attr_accessor :original_object
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @object_version = args[:object_version] if args.key?(:object_version)
          @original_object = args[:original_object] if args.key?(:original_object)
        end
      end
      
      # gdata
      class GdataDiffVersionResponse
        include Google::Apis::Core::Hashable
      
        # gdata
        # Corresponds to the JSON property `objectSizeBytes`
        # @return [Fixnum]
        attr_accessor :object_size_bytes
      
        # gdata
        # Corresponds to the JSON property `objectVersion`
        # @return [String]
        attr_accessor :object_version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @object_size_bytes = args[:object_size_bytes] if args.key?(:object_size_bytes)
          @object_version = args[:object_version] if args.key?(:object_version)
        end
      end
      
      # gdata
      class GdataDownloadParameters
        include Google::Apis::Core::Hashable
      
        # gdata
        # Corresponds to the JSON property `allowGzipCompression`
        # @return [Boolean]
        attr_accessor :allow_gzip_compression
        alias_method :allow_gzip_compression?, :allow_gzip_compression
      
        # gdata
        # Corresponds to the JSON property `ignoreRange`
        # @return [Boolean]
        attr_accessor :ignore_range
        alias_method :ignore_range?, :ignore_range
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @allow_gzip_compression = args[:allow_gzip_compression] if args.key?(:allow_gzip_compression)
          @ignore_range = args[:ignore_range] if args.key?(:ignore_range)
        end
      end
      
      # gdata
      class GdataMedia
        include Google::Apis::Core::Hashable
      
        # gdata
        # Corresponds to the JSON property `algorithm`
        # @return [String]
        attr_accessor :algorithm
      
        # gdata
        # Corresponds to the JSON property `bigstoreObjectRef`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :bigstore_object_ref
      
        # gdata
        # Corresponds to the JSON property `blobRef`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :blob_ref
      
        # gdata
        # Corresponds to the JSON property `blobstore2Info`
        # @return [Google::Apis::YoutubereportingV1::GdataBlobstore2Info]
        attr_accessor :blobstore2_info
      
        # gdata
        # Corresponds to the JSON property `compositeMedia`
        # @return [Array<Google::Apis::YoutubereportingV1::GdataCompositeMedia>]
        attr_accessor :composite_media
      
        # gdata
        # Corresponds to the JSON property `contentType`
        # @return [String]
        attr_accessor :content_type
      
        # gdata
        # Corresponds to the JSON property `contentTypeInfo`
        # @return [Google::Apis::YoutubereportingV1::GdataContentTypeInfo]
        attr_accessor :content_type_info
      
        # gdata
        # Corresponds to the JSON property `cosmoBinaryReference`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :cosmo_binary_reference
      
        # gdata
        # Corresponds to the JSON property `crc32cHash`
        # @return [Fixnum]
        attr_accessor :crc32c_hash
      
        # gdata
        # Corresponds to the JSON property `diffChecksumsResponse`
        # @return [Google::Apis::YoutubereportingV1::GdataDiffChecksumsResponse]
        attr_accessor :diff_checksums_response
      
        # gdata
        # Corresponds to the JSON property `diffDownloadResponse`
        # @return [Google::Apis::YoutubereportingV1::GdataDiffDownloadResponse]
        attr_accessor :diff_download_response
      
        # gdata
        # Corresponds to the JSON property `diffUploadRequest`
        # @return [Google::Apis::YoutubereportingV1::GdataDiffUploadRequest]
        attr_accessor :diff_upload_request
      
        # gdata
        # Corresponds to the JSON property `diffUploadResponse`
        # @return [Google::Apis::YoutubereportingV1::GdataDiffUploadResponse]
        attr_accessor :diff_upload_response
      
        # gdata
        # Corresponds to the JSON property `diffVersionResponse`
        # @return [Google::Apis::YoutubereportingV1::GdataDiffVersionResponse]
        attr_accessor :diff_version_response
      
        # gdata
        # Corresponds to the JSON property `downloadParameters`
        # @return [Google::Apis::YoutubereportingV1::GdataDownloadParameters]
        attr_accessor :download_parameters
      
        # gdata
        # Corresponds to the JSON property `filename`
        # @return [String]
        attr_accessor :filename
      
        # gdata
        # Corresponds to the JSON property `hash`
        # @return [String]
        attr_accessor :hash_prop
      
        # gdata
        # Corresponds to the JSON property `hashVerified`
        # @return [Boolean]
        attr_accessor :hash_verified
        alias_method :hash_verified?, :hash_verified
      
        # gdata
        # Corresponds to the JSON property `inline`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :inline
      
        # gdata
        # Corresponds to the JSON property `isPotentialRetry`
        # @return [Boolean]
        attr_accessor :is_potential_retry
        alias_method :is_potential_retry?, :is_potential_retry
      
        # gdata
        # Corresponds to the JSON property `length`
        # @return [Fixnum]
        attr_accessor :length
      
        # gdata
        # Corresponds to the JSON property `md5Hash`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :md5_hash
      
        # gdata
        # Corresponds to the JSON property `mediaId`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :media_id
      
        # gdata
        # Corresponds to the JSON property `objectId`
        # @return [Google::Apis::YoutubereportingV1::GdataObjectId]
        attr_accessor :object_id_prop
      
        # gdata
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        # gdata
        # Corresponds to the JSON property `referenceType`
        # @return [String]
        attr_accessor :reference_type
      
        # gdata
        # Corresponds to the JSON property `sha1Hash`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :sha1_hash
      
        # gdata
        # Corresponds to the JSON property `sha256Hash`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :sha256_hash
      
        # gdata
        # Corresponds to the JSON property `timestamp`
        # @return [Fixnum]
        attr_accessor :timestamp
      
        # gdata
        # Corresponds to the JSON property `token`
        # @return [String]
        attr_accessor :token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @algorithm = args[:algorithm] if args.key?(:algorithm)
          @bigstore_object_ref = args[:bigstore_object_ref] if args.key?(:bigstore_object_ref)
          @blob_ref = args[:blob_ref] if args.key?(:blob_ref)
          @blobstore2_info = args[:blobstore2_info] if args.key?(:blobstore2_info)
          @composite_media = args[:composite_media] if args.key?(:composite_media)
          @content_type = args[:content_type] if args.key?(:content_type)
          @content_type_info = args[:content_type_info] if args.key?(:content_type_info)
          @cosmo_binary_reference = args[:cosmo_binary_reference] if args.key?(:cosmo_binary_reference)
          @crc32c_hash = args[:crc32c_hash] if args.key?(:crc32c_hash)
          @diff_checksums_response = args[:diff_checksums_response] if args.key?(:diff_checksums_response)
          @diff_download_response = args[:diff_download_response] if args.key?(:diff_download_response)
          @diff_upload_request = args[:diff_upload_request] if args.key?(:diff_upload_request)
          @diff_upload_response = args[:diff_upload_response] if args.key?(:diff_upload_response)
          @diff_version_response = args[:diff_version_response] if args.key?(:diff_version_response)
          @download_parameters = args[:download_parameters] if args.key?(:download_parameters)
          @filename = args[:filename] if args.key?(:filename)
          @hash_prop = args[:hash_prop] if args.key?(:hash_prop)
          @hash_verified = args[:hash_verified] if args.key?(:hash_verified)
          @inline = args[:inline] if args.key?(:inline)
          @is_potential_retry = args[:is_potential_retry] if args.key?(:is_potential_retry)
          @length = args[:length] if args.key?(:length)
          @md5_hash = args[:md5_hash] if args.key?(:md5_hash)
          @media_id = args[:media_id] if args.key?(:media_id)
          @object_id_prop = args[:object_id_prop] if args.key?(:object_id_prop)
          @path = args[:path] if args.key?(:path)
          @reference_type = args[:reference_type] if args.key?(:reference_type)
          @sha1_hash = args[:sha1_hash] if args.key?(:sha1_hash)
          @sha256_hash = args[:sha256_hash] if args.key?(:sha256_hash)
          @timestamp = args[:timestamp] if args.key?(:timestamp)
          @token = args[:token] if args.key?(:token)
        end
      end
      
      # gdata
      class GdataObjectId
        include Google::Apis::Core::Hashable
      
        # gdata
        # Corresponds to the JSON property `bucketName`
        # @return [String]
        attr_accessor :bucket_name
      
        # gdata
        # Corresponds to the JSON property `generation`
        # @return [Fixnum]
        attr_accessor :generation
      
        # gdata
        # Corresponds to the JSON property `objectName`
        # @return [String]
        attr_accessor :object_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bucket_name = args[:bucket_name] if args.key?(:bucket_name)
          @generation = args[:generation] if args.key?(:generation)
          @object_name = args[:object_name] if args.key?(:object_name)
        end
      end
      
      # A job creating reports of a specific type.
      class Job
        include Google::Apis::Core::Hashable
      
        # The creation date/time of the job.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # The date/time when this job will expire/expired. After a job expired, no
        # new reports are generated.
        # Corresponds to the JSON property `expireTime`
        # @return [String]
        attr_accessor :expire_time
      
        # The server-generated ID of the job (max. 40 characters).
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The name of the job (max. 100 characters).
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The type of reports this job creates. Corresponds to the ID of a
        # ReportType.
        # Corresponds to the JSON property `reportTypeId`
        # @return [String]
        attr_accessor :report_type_id
      
        # True if this a system-managed job that cannot be modified by the user;
        # otherwise false.
        # Corresponds to the JSON property `systemManaged`
        # @return [Boolean]
        attr_accessor :system_managed
        alias_method :system_managed?, :system_managed
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @expire_time = args[:expire_time] if args.key?(:expire_time)
          @id = args[:id] if args.key?(:id)
          @name = args[:name] if args.key?(:name)
          @report_type_id = args[:report_type_id] if args.key?(:report_type_id)
          @system_managed = args[:system_managed] if args.key?(:system_managed)
        end
      end
      
      # Response message for ReportingService.ListJobs.
      class ListJobsResponse
        include Google::Apis::Core::Hashable
      
        # The list of jobs.
        # Corresponds to the JSON property `jobs`
        # @return [Array<Google::Apis::YoutubereportingV1::Job>]
        attr_accessor :jobs
      
        # A token to retrieve next page of results.
        # Pass this value in the
        # ListJobsRequest.page_token
        # field in the subsequent call to `ListJobs` method to retrieve the next
        # page of results.
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
      
      # Response message for ReportingService.ListReportTypes.
      class ListReportTypesResponse
        include Google::Apis::Core::Hashable
      
        # A token to retrieve next page of results.
        # Pass this value in the
        # ListReportTypesRequest.page_token
        # field in the subsequent call to `ListReportTypes` method to retrieve the
        # next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The list of report types.
        # Corresponds to the JSON property `reportTypes`
        # @return [Array<Google::Apis::YoutubereportingV1::ReportType>]
        attr_accessor :report_types
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @report_types = args[:report_types] if args.key?(:report_types)
        end
      end
      
      # Response message for ReportingService.ListReports.
      class ListReportsResponse
        include Google::Apis::Core::Hashable
      
        # A token to retrieve next page of results.
        # Pass this value in the
        # ListReportsRequest.page_token
        # field in the subsequent call to `ListReports` method to retrieve the next
        # page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The list of report types.
        # Corresponds to the JSON property `reports`
        # @return [Array<Google::Apis::YoutubereportingV1::Report>]
        attr_accessor :reports
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @reports = args[:reports] if args.key?(:reports)
        end
      end
      
      # A report's metadata including the URL from which the report itself can be
      # downloaded.
      class Report
        include Google::Apis::Core::Hashable
      
        # The date/time when this report was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # The URL from which the report can be downloaded (max. 1000 characters).
        # Corresponds to the JSON property `downloadUrl`
        # @return [String]
        attr_accessor :download_url
      
        # The end of the time period that the report instance covers. The value is
        # exclusive.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # The server-generated ID of the report.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The date/time when the job this report belongs to will expire/expired.
        # Corresponds to the JSON property `jobExpireTime`
        # @return [String]
        attr_accessor :job_expire_time
      
        # The ID of the job that created this report.
        # Corresponds to the JSON property `jobId`
        # @return [String]
        attr_accessor :job_id
      
        # The start of the time period that the report instance covers. The value is
        # inclusive.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @download_url = args[:download_url] if args.key?(:download_url)
          @end_time = args[:end_time] if args.key?(:end_time)
          @id = args[:id] if args.key?(:id)
          @job_expire_time = args[:job_expire_time] if args.key?(:job_expire_time)
          @job_id = args[:job_id] if args.key?(:job_id)
          @start_time = args[:start_time] if args.key?(:start_time)
        end
      end
      
      # A report type.
      class ReportType
        include Google::Apis::Core::Hashable
      
        # The date/time when this report type was/will be deprecated.
        # Corresponds to the JSON property `deprecateTime`
        # @return [String]
        attr_accessor :deprecate_time
      
        # The ID of the report type (max. 100 characters).
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The name of the report type (max. 100 characters).
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # True if this a system-managed report type; otherwise false. Reporting jobs
        # for system-managed report types are created automatically and can thus not
        # be used in the `CreateJob` method.
        # Corresponds to the JSON property `systemManaged`
        # @return [Boolean]
        attr_accessor :system_managed
        alias_method :system_managed?, :system_managed
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @deprecate_time = args[:deprecate_time] if args.key?(:deprecate_time)
          @id = args[:id] if args.key?(:id)
          @name = args[:name] if args.key?(:name)
          @system_managed = args[:system_managed] if args.key?(:system_managed)
        end
      end
    end
  end
end
