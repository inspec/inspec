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
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GdataBlobstore2Info
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GdataCompositeMedia
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GdataContentTypeInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GdataDiffChecksumsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GdataDiffDownloadResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GdataDiffUploadRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GdataDiffUploadResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GdataDiffVersionResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GdataDownloadParameters
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GdataMedia
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GdataObjectId
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Job
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListJobsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListReportTypesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListReportsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Report
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReportType
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class GdataBlobstore2Info
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :blob_generation, :numeric_string => true, as: 'blobGeneration'
          property :blob_id, as: 'blobId'
          property :download_read_handle, :base64 => true, as: 'downloadReadHandle'
          property :read_token, as: 'readToken'
          property :upload_metadata_container, :base64 => true, as: 'uploadMetadataContainer'
        end
      end
      
      class GdataCompositeMedia
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :blob_ref, :base64 => true, as: 'blobRef'
          property :blobstore2_info, as: 'blobstore2Info', class: Google::Apis::YoutubereportingV1::GdataBlobstore2Info, decorator: Google::Apis::YoutubereportingV1::GdataBlobstore2Info::Representation
      
          property :cosmo_binary_reference, :base64 => true, as: 'cosmoBinaryReference'
          property :crc32c_hash, as: 'crc32cHash'
          property :inline, :base64 => true, as: 'inline'
          property :length, :numeric_string => true, as: 'length'
          property :md5_hash, :base64 => true, as: 'md5Hash'
          property :object_id_prop, as: 'objectId', class: Google::Apis::YoutubereportingV1::GdataObjectId, decorator: Google::Apis::YoutubereportingV1::GdataObjectId::Representation
      
          property :path, as: 'path'
          property :reference_type, as: 'referenceType'
          property :sha1_hash, :base64 => true, as: 'sha1Hash'
        end
      end
      
      class GdataContentTypeInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :best_guess, as: 'bestGuess'
          property :from_bytes, as: 'fromBytes'
          property :from_file_name, as: 'fromFileName'
          property :from_header, as: 'fromHeader'
          property :from_url_path, as: 'fromUrlPath'
        end
      end
      
      class GdataDiffChecksumsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :checksums_location, as: 'checksumsLocation', class: Google::Apis::YoutubereportingV1::GdataCompositeMedia, decorator: Google::Apis::YoutubereportingV1::GdataCompositeMedia::Representation
      
          property :chunk_size_bytes, :numeric_string => true, as: 'chunkSizeBytes'
          property :object_location, as: 'objectLocation', class: Google::Apis::YoutubereportingV1::GdataCompositeMedia, decorator: Google::Apis::YoutubereportingV1::GdataCompositeMedia::Representation
      
          property :object_size_bytes, :numeric_string => true, as: 'objectSizeBytes'
          property :object_version, as: 'objectVersion'
        end
      end
      
      class GdataDiffDownloadResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :object_location, as: 'objectLocation', class: Google::Apis::YoutubereportingV1::GdataCompositeMedia, decorator: Google::Apis::YoutubereportingV1::GdataCompositeMedia::Representation
      
        end
      end
      
      class GdataDiffUploadRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :checksums_info, as: 'checksumsInfo', class: Google::Apis::YoutubereportingV1::GdataCompositeMedia, decorator: Google::Apis::YoutubereportingV1::GdataCompositeMedia::Representation
      
          property :object_info, as: 'objectInfo', class: Google::Apis::YoutubereportingV1::GdataCompositeMedia, decorator: Google::Apis::YoutubereportingV1::GdataCompositeMedia::Representation
      
          property :object_version, as: 'objectVersion'
        end
      end
      
      class GdataDiffUploadResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :object_version, as: 'objectVersion'
          property :original_object, as: 'originalObject', class: Google::Apis::YoutubereportingV1::GdataCompositeMedia, decorator: Google::Apis::YoutubereportingV1::GdataCompositeMedia::Representation
      
        end
      end
      
      class GdataDiffVersionResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :object_size_bytes, :numeric_string => true, as: 'objectSizeBytes'
          property :object_version, as: 'objectVersion'
        end
      end
      
      class GdataDownloadParameters
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :allow_gzip_compression, as: 'allowGzipCompression'
          property :ignore_range, as: 'ignoreRange'
        end
      end
      
      class GdataMedia
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :algorithm, as: 'algorithm'
          property :bigstore_object_ref, :base64 => true, as: 'bigstoreObjectRef'
          property :blob_ref, :base64 => true, as: 'blobRef'
          property :blobstore2_info, as: 'blobstore2Info', class: Google::Apis::YoutubereportingV1::GdataBlobstore2Info, decorator: Google::Apis::YoutubereportingV1::GdataBlobstore2Info::Representation
      
          collection :composite_media, as: 'compositeMedia', class: Google::Apis::YoutubereportingV1::GdataCompositeMedia, decorator: Google::Apis::YoutubereportingV1::GdataCompositeMedia::Representation
      
          property :content_type, as: 'contentType'
          property :content_type_info, as: 'contentTypeInfo', class: Google::Apis::YoutubereportingV1::GdataContentTypeInfo, decorator: Google::Apis::YoutubereportingV1::GdataContentTypeInfo::Representation
      
          property :cosmo_binary_reference, :base64 => true, as: 'cosmoBinaryReference'
          property :crc32c_hash, as: 'crc32cHash'
          property :diff_checksums_response, as: 'diffChecksumsResponse', class: Google::Apis::YoutubereportingV1::GdataDiffChecksumsResponse, decorator: Google::Apis::YoutubereportingV1::GdataDiffChecksumsResponse::Representation
      
          property :diff_download_response, as: 'diffDownloadResponse', class: Google::Apis::YoutubereportingV1::GdataDiffDownloadResponse, decorator: Google::Apis::YoutubereportingV1::GdataDiffDownloadResponse::Representation
      
          property :diff_upload_request, as: 'diffUploadRequest', class: Google::Apis::YoutubereportingV1::GdataDiffUploadRequest, decorator: Google::Apis::YoutubereportingV1::GdataDiffUploadRequest::Representation
      
          property :diff_upload_response, as: 'diffUploadResponse', class: Google::Apis::YoutubereportingV1::GdataDiffUploadResponse, decorator: Google::Apis::YoutubereportingV1::GdataDiffUploadResponse::Representation
      
          property :diff_version_response, as: 'diffVersionResponse', class: Google::Apis::YoutubereportingV1::GdataDiffVersionResponse, decorator: Google::Apis::YoutubereportingV1::GdataDiffVersionResponse::Representation
      
          property :download_parameters, as: 'downloadParameters', class: Google::Apis::YoutubereportingV1::GdataDownloadParameters, decorator: Google::Apis::YoutubereportingV1::GdataDownloadParameters::Representation
      
          property :filename, as: 'filename'
          property :hash_prop, as: 'hash'
          property :hash_verified, as: 'hashVerified'
          property :inline, :base64 => true, as: 'inline'
          property :is_potential_retry, as: 'isPotentialRetry'
          property :length, :numeric_string => true, as: 'length'
          property :md5_hash, :base64 => true, as: 'md5Hash'
          property :media_id, :base64 => true, as: 'mediaId'
          property :object_id_prop, as: 'objectId', class: Google::Apis::YoutubereportingV1::GdataObjectId, decorator: Google::Apis::YoutubereportingV1::GdataObjectId::Representation
      
          property :path, as: 'path'
          property :reference_type, as: 'referenceType'
          property :sha1_hash, :base64 => true, as: 'sha1Hash'
          property :sha256_hash, :base64 => true, as: 'sha256Hash'
          property :timestamp, :numeric_string => true, as: 'timestamp'
          property :token, as: 'token'
        end
      end
      
      class GdataObjectId
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bucket_name, as: 'bucketName'
          property :generation, :numeric_string => true, as: 'generation'
          property :object_name, as: 'objectName'
        end
      end
      
      class Job
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :expire_time, as: 'expireTime'
          property :id, as: 'id'
          property :name, as: 'name'
          property :report_type_id, as: 'reportTypeId'
          property :system_managed, as: 'systemManaged'
        end
      end
      
      class ListJobsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :jobs, as: 'jobs', class: Google::Apis::YoutubereportingV1::Job, decorator: Google::Apis::YoutubereportingV1::Job::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListReportTypesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :report_types, as: 'reportTypes', class: Google::Apis::YoutubereportingV1::ReportType, decorator: Google::Apis::YoutubereportingV1::ReportType::Representation
      
        end
      end
      
      class ListReportsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :reports, as: 'reports', class: Google::Apis::YoutubereportingV1::Report, decorator: Google::Apis::YoutubereportingV1::Report::Representation
      
        end
      end
      
      class Report
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :download_url, as: 'downloadUrl'
          property :end_time, as: 'endTime'
          property :id, as: 'id'
          property :job_expire_time, as: 'jobExpireTime'
          property :job_id, as: 'jobId'
          property :start_time, as: 'startTime'
        end
      end
      
      class ReportType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :deprecate_time, as: 'deprecateTime'
          property :id, as: 'id'
          property :name, as: 'name'
          property :system_managed, as: 'systemManaged'
        end
      end
    end
  end
end
