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
    module CloudschedulerV1
      # Cloud Scheduler API
      #
      # Creates and manages jobs run on a regular recurring schedule.
      #
      # @example
      #    require 'google/apis/cloudscheduler_v1'
      #
      #    Cloudscheduler = Google::Apis::CloudschedulerV1 # Alias the module
      #    service = Cloudscheduler::CloudSchedulerService.new
      #
      # @see https://cloud.google.com/scheduler/
      class CloudSchedulerService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://cloudscheduler.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Gets information about a location.
        # @param [String] name
        #   Resource name for the location.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudschedulerV1::Location] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudschedulerV1::Location]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::CloudschedulerV1::Location::Representation
          command.response_class = Google::Apis::CloudschedulerV1::Location
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists information about the supported locations for this service.
        # @param [String] name
        #   The resource that owns the locations collection, if applicable.
        # @param [String] filter
        #   The standard list filter.
        # @param [Fixnum] page_size
        #   The standard list page size.
        # @param [String] page_token
        #   The standard list page token.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudschedulerV1::ListLocationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudschedulerV1::ListLocationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_locations(name, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}/locations', options)
          command.response_representation = Google::Apis::CloudschedulerV1::ListLocationsResponse::Representation
          command.response_class = Google::Apis::CloudschedulerV1::ListLocationsResponse
          command.params['name'] = name unless name.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a job.
        # @param [String] parent
        #   Required. The location name. For example:
        #   `projects/PROJECT_ID/locations/LOCATION_ID`.
        # @param [Google::Apis::CloudschedulerV1::Job] job_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudschedulerV1::Job] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudschedulerV1::Job]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_location_job(parent, job_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}/jobs', options)
          command.request_representation = Google::Apis::CloudschedulerV1::Job::Representation
          command.request_object = job_object
          command.response_representation = Google::Apis::CloudschedulerV1::Job::Representation
          command.response_class = Google::Apis::CloudschedulerV1::Job
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a job.
        # @param [String] name
        #   Required. The job name. For example:
        #   `projects/PROJECT_ID/locations/LOCATION_ID/jobs/JOB_ID`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudschedulerV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudschedulerV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_location_job(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/{+name}', options)
          command.response_representation = Google::Apis::CloudschedulerV1::Empty::Representation
          command.response_class = Google::Apis::CloudschedulerV1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a job.
        # @param [String] name
        #   Required. The job name. For example:
        #   `projects/PROJECT_ID/locations/LOCATION_ID/jobs/JOB_ID`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudschedulerV1::Job] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudschedulerV1::Job]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_job(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::CloudschedulerV1::Job::Representation
          command.response_class = Google::Apis::CloudschedulerV1::Job
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists jobs.
        # @param [String] parent
        #   Required. The location name. For example:
        #   `projects/PROJECT_ID/locations/LOCATION_ID`.
        # @param [Fixnum] page_size
        #   Requested page size.
        #   The maximum page size is 500. If unspecified, the page size will
        #   be the maximum. Fewer jobs than requested might be returned,
        #   even if more jobs exist; use next_page_token to determine if more
        #   jobs exist.
        # @param [String] page_token
        #   A token identifying a page of results the server will return. To
        #   request the first page results, page_token must be empty. To
        #   request the next page of results, page_token must be the value of
        #   next_page_token returned from
        #   the previous call to ListJobs. It is an error to
        #   switch the value of filter or
        #   order_by while iterating through pages.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudschedulerV1::ListJobsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudschedulerV1::ListJobsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_jobs(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+parent}/jobs', options)
          command.response_representation = Google::Apis::CloudschedulerV1::ListJobsResponse::Representation
          command.response_class = Google::Apis::CloudschedulerV1::ListJobsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a job.
        # If successful, the updated Job is returned. If the job does
        # not exist, `NOT_FOUND` is returned.
        # If UpdateJob does not successfully return, it is possible for the
        # job to be in an Job.State.UPDATE_FAILED state. A job in this state may
        # not be executed. If this happens, retry the UpdateJob request
        # until a successful response is received.
        # @param [String] name
        #   Optionally caller-specified in CreateJob, after
        #   which it becomes output only.
        #   The job name. For example:
        #   `projects/PROJECT_ID/locations/LOCATION_ID/jobs/JOB_ID`.
        #   * `PROJECT_ID` can contain letters ([A-Za-z]), numbers ([0-9]),
        #   hyphens (-), colons (:), or periods (.).
        #   For more information, see
        #   [Identifying
        #   projects](https://cloud.google.com/resource-manager/docs/creating-managing-
        #   projects#identifying_projects)
        #   * `LOCATION_ID` is the canonical ID for the job's location.
        #   The list of available locations can be obtained by calling
        #   ListLocations.
        #   For more information, see https://cloud.google.com/about/locations/.
        #   * `JOB_ID` can contain only letters ([A-Za-z]), numbers ([0-9]),
        #   hyphens (-), or underscores (_). The maximum length is 500 characters.
        # @param [Google::Apis::CloudschedulerV1::Job] job_object
        # @param [String] update_mask
        #   A  mask used to specify which fields of the job are being updated.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudschedulerV1::Job] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudschedulerV1::Job]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_location_job(name, job_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/{+name}', options)
          command.request_representation = Google::Apis::CloudschedulerV1::Job::Representation
          command.request_object = job_object
          command.response_representation = Google::Apis::CloudschedulerV1::Job::Representation
          command.response_class = Google::Apis::CloudschedulerV1::Job
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Pauses a job.
        # If a job is paused then the system will stop executing the job
        # until it is re-enabled via ResumeJob. The
        # state of the job is stored in state; if paused it
        # will be set to Job.State.PAUSED. A job must be in Job.State.ENABLED
        # to be paused.
        # @param [String] name
        #   Required. The job name. For example:
        #   `projects/PROJECT_ID/locations/LOCATION_ID/jobs/JOB_ID`.
        # @param [Google::Apis::CloudschedulerV1::PauseJobRequest] pause_job_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudschedulerV1::Job] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudschedulerV1::Job]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def pause_job(name, pause_job_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+name}:pause', options)
          command.request_representation = Google::Apis::CloudschedulerV1::PauseJobRequest::Representation
          command.request_object = pause_job_request_object
          command.response_representation = Google::Apis::CloudschedulerV1::Job::Representation
          command.response_class = Google::Apis::CloudschedulerV1::Job
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Resume a job.
        # This method reenables a job after it has been Job.State.PAUSED. The
        # state of a job is stored in Job.state; after calling this method it
        # will be set to Job.State.ENABLED. A job must be in
        # Job.State.PAUSED to be resumed.
        # @param [String] name
        #   Required. The job name. For example:
        #   `projects/PROJECT_ID/locations/LOCATION_ID/jobs/JOB_ID`.
        # @param [Google::Apis::CloudschedulerV1::ResumeJobRequest] resume_job_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudschedulerV1::Job] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudschedulerV1::Job]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def resume_job(name, resume_job_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+name}:resume', options)
          command.request_representation = Google::Apis::CloudschedulerV1::ResumeJobRequest::Representation
          command.request_object = resume_job_request_object
          command.response_representation = Google::Apis::CloudschedulerV1::Job::Representation
          command.response_class = Google::Apis::CloudschedulerV1::Job
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Forces a job to run now.
        # When this method is called, Cloud Scheduler will dispatch the job, even
        # if the job is already running.
        # @param [String] name
        #   Required. The job name. For example:
        #   `projects/PROJECT_ID/locations/LOCATION_ID/jobs/JOB_ID`.
        # @param [Google::Apis::CloudschedulerV1::RunJobRequest] run_job_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudschedulerV1::Job] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudschedulerV1::Job]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def run_job(name, run_job_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+name}:run', options)
          command.request_representation = Google::Apis::CloudschedulerV1::RunJobRequest::Representation
          command.request_object = run_job_request_object
          command.response_representation = Google::Apis::CloudschedulerV1::Job::Representation
          command.response_class = Google::Apis::CloudschedulerV1::Job
          command.params['name'] = name unless name.nil?
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
