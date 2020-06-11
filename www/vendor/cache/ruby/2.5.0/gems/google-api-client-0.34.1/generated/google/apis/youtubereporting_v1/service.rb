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

require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module YoutubereportingV1
      # YouTube Reporting API
      #
      # Schedules reporting jobs containing your YouTube Analytics data and downloads
      #  the resulting bulk data reports in the form of CSV files.
      #
      # @example
      #    require 'google/apis/youtubereporting_v1'
      #
      #    Youtubereporting = Google::Apis::YoutubereportingV1 # Alias the module
      #    service = Youtubereporting::YouTubeReportingService.new
      #
      # @see https://developers.google.com/youtube/reporting/v1/reports/
      class YouTubeReportingService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://youtubereporting.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Creates a job and returns it.
        # @param [Google::Apis::YoutubereportingV1::Job] job_object
        # @param [String] on_behalf_of_content_owner
        #   The content owner's external ID on which behalf the user is acting on. If
        #   not set, the user is acting for himself (his own channel).
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubereportingV1::Job] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubereportingV1::Job]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_job(job_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/jobs', options)
          command.request_representation = Google::Apis::YoutubereportingV1::Job::Representation
          command.request_object = job_object
          command.response_representation = Google::Apis::YoutubereportingV1::Job::Representation
          command.response_class = Google::Apis::YoutubereportingV1::Job
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a job.
        # @param [String] job_id
        #   The ID of the job to delete.
        # @param [String] on_behalf_of_content_owner
        #   The content owner's external ID on which behalf the user is acting on. If
        #   not set, the user is acting for himself (his own channel).
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubereportingV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubereportingV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_job(job_id, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/jobs/{jobId}', options)
          command.response_representation = Google::Apis::YoutubereportingV1::Empty::Representation
          command.response_class = Google::Apis::YoutubereportingV1::Empty
          command.params['jobId'] = job_id unless job_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a job.
        # @param [String] job_id
        #   The ID of the job to retrieve.
        # @param [String] on_behalf_of_content_owner
        #   The content owner's external ID on which behalf the user is acting on. If
        #   not set, the user is acting for himself (his own channel).
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubereportingV1::Job] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubereportingV1::Job]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_job(job_id, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/jobs/{jobId}', options)
          command.response_representation = Google::Apis::YoutubereportingV1::Job::Representation
          command.response_class = Google::Apis::YoutubereportingV1::Job
          command.params['jobId'] = job_id unless job_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists jobs.
        # @param [Boolean] include_system_managed
        #   If set to true, also system-managed jobs will be returned; otherwise only
        #   user-created jobs will be returned. System-managed jobs can neither be
        #   modified nor deleted.
        # @param [String] on_behalf_of_content_owner
        #   The content owner's external ID on which behalf the user is acting on. If
        #   not set, the user is acting for himself (his own channel).
        # @param [Fixnum] page_size
        #   Requested page size. Server may return fewer jobs than requested.
        #   If unspecified, server will pick an appropriate default.
        # @param [String] page_token
        #   A token identifying a page of results the server should return. Typically,
        #   this is the value of
        #   ListReportTypesResponse.next_page_token
        #   returned in response to the previous call to the `ListJobs` method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubereportingV1::ListJobsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubereportingV1::ListJobsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_jobs(include_system_managed: nil, on_behalf_of_content_owner: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/jobs', options)
          command.response_representation = Google::Apis::YoutubereportingV1::ListJobsResponse::Representation
          command.response_class = Google::Apis::YoutubereportingV1::ListJobsResponse
          command.query['includeSystemManaged'] = include_system_managed unless include_system_managed.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the metadata of a specific report.
        # @param [String] job_id
        #   The ID of the job.
        # @param [String] report_id
        #   The ID of the report to retrieve.
        # @param [String] on_behalf_of_content_owner
        #   The content owner's external ID on which behalf the user is acting on. If
        #   not set, the user is acting for himself (his own channel).
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubereportingV1::Report] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubereportingV1::Report]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_job_report(job_id, report_id, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/jobs/{jobId}/reports/{reportId}', options)
          command.response_representation = Google::Apis::YoutubereportingV1::Report::Representation
          command.response_class = Google::Apis::YoutubereportingV1::Report
          command.params['jobId'] = job_id unless job_id.nil?
          command.params['reportId'] = report_id unless report_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists reports created by a specific job.
        # Returns NOT_FOUND if the job does not exist.
        # @param [String] job_id
        #   The ID of the job.
        # @param [String] created_after
        #   If set, only reports created after the specified date/time are returned.
        # @param [String] on_behalf_of_content_owner
        #   The content owner's external ID on which behalf the user is acting on. If
        #   not set, the user is acting for himself (his own channel).
        # @param [Fixnum] page_size
        #   Requested page size. Server may return fewer report types than requested.
        #   If unspecified, server will pick an appropriate default.
        # @param [String] page_token
        #   A token identifying a page of results the server should return. Typically,
        #   this is the value of
        #   ListReportsResponse.next_page_token
        #   returned in response to the previous call to the `ListReports` method.
        # @param [String] start_time_at_or_after
        #   If set, only reports whose start time is greater than or equal the
        #   specified date/time are returned.
        # @param [String] start_time_before
        #   If set, only reports whose start time is smaller than the specified
        #   date/time are returned.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubereportingV1::ListReportsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubereportingV1::ListReportsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_job_reports(job_id, created_after: nil, on_behalf_of_content_owner: nil, page_size: nil, page_token: nil, start_time_at_or_after: nil, start_time_before: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/jobs/{jobId}/reports', options)
          command.response_representation = Google::Apis::YoutubereportingV1::ListReportsResponse::Representation
          command.response_class = Google::Apis::YoutubereportingV1::ListReportsResponse
          command.params['jobId'] = job_id unless job_id.nil?
          command.query['createdAfter'] = created_after unless created_after.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['startTimeAtOrAfter'] = start_time_at_or_after unless start_time_at_or_after.nil?
          command.query['startTimeBefore'] = start_time_before unless start_time_before.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Method for media download. Download is supported
        # on the URI `/v1/media/`+name`?alt=media`.
        # @param [String] resource_name
        #   Name of the media that is being downloaded.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [IO, String] download_dest
        #   IO stream or filename to receive content download
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubereportingV1::GdataMedia] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubereportingV1::GdataMedia]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def download_medium(resource_name, fields: nil, quota_user: nil, download_dest: nil, options: nil, &block)
          if download_dest.nil?
            command = make_simple_command(:get, 'v1/media/{+resourceName}', options)
          else
            command = make_download_command(:get, 'v1/media/{+resourceName}', options)
            command.download_dest = download_dest
          end
          command.response_representation = Google::Apis::YoutubereportingV1::GdataMedia::Representation
          command.response_class = Google::Apis::YoutubereportingV1::GdataMedia
          command.params['resourceName'] = resource_name unless resource_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists report types.
        # @param [Boolean] include_system_managed
        #   If set to true, also system-managed report types will be returned;
        #   otherwise only the report types that can be used to create new reporting
        #   jobs will be returned.
        # @param [String] on_behalf_of_content_owner
        #   The content owner's external ID on which behalf the user is acting on. If
        #   not set, the user is acting for himself (his own channel).
        # @param [Fixnum] page_size
        #   Requested page size. Server may return fewer report types than requested.
        #   If unspecified, server will pick an appropriate default.
        # @param [String] page_token
        #   A token identifying a page of results the server should return. Typically,
        #   this is the value of
        #   ListReportTypesResponse.next_page_token
        #   returned in response to the previous call to the `ListReportTypes` method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubereportingV1::ListReportTypesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubereportingV1::ListReportTypesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_report_types(include_system_managed: nil, on_behalf_of_content_owner: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/reportTypes', options)
          command.response_representation = Google::Apis::YoutubereportingV1::ListReportTypesResponse::Representation
          command.response_class = Google::Apis::YoutubereportingV1::ListReportTypesResponse
          command.query['includeSystemManaged'] = include_system_managed unless include_system_managed.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end

        protected

        def apply_command_defaults(command)
          command.query['key'] = key unless key.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
        end
      end
    end
  end
end
