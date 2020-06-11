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
    module JobsV2
      # Cloud Talent Solution API
      #
      # Cloud Talent Solution provides the capability to create, read, update, and
      #  delete job postings, as well as search jobs based on keywords and filters.
      #
      # @example
      #    require 'google/apis/jobs_v2'
      #
      #    Jobs = Google::Apis::JobsV2 # Alias the module
      #    service = Jobs::CloudTalentSolutionService.new
      #
      # @see https://cloud.google.com/talent-solution/job-search/docs/
      class CloudTalentSolutionService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://jobs.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Creates a new company entity.
        # @param [Google::Apis::JobsV2::Company] company_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::JobsV2::Company] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::JobsV2::Company]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_company(company_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/companies', options)
          command.request_representation = Google::Apis::JobsV2::Company::Representation
          command.request_object = company_object
          command.response_representation = Google::Apis::JobsV2::Company::Representation
          command.response_class = Google::Apis::JobsV2::Company
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the specified company.
        # @param [String] name
        #   Required. The resource name of the company to be deleted,
        #   such as, "companies/0000aaaa-1111-bbbb-2222-cccc3333dddd".
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::JobsV2::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::JobsV2::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_company(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2/{+name}', options)
          command.response_representation = Google::Apis::JobsV2::Empty::Representation
          command.response_class = Google::Apis::JobsV2::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the specified company.
        # @param [String] name
        #   Required. Resource name of the company to retrieve,
        #   such as "companies/0000aaaa-1111-bbbb-2222-cccc3333dddd".
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::JobsV2::Company] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::JobsV2::Company]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_company(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+name}', options)
          command.response_representation = Google::Apis::JobsV2::Company::Representation
          command.response_class = Google::Apis::JobsV2::Company
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all companies associated with a Cloud Talent Solution account.
        # @param [Boolean] must_have_open_jobs
        #   Optional. Set to true if the companies request must have open jobs.
        #   Defaults to false.
        #   If true, at most page_size of companies are fetched, among which
        #   only those with open jobs are returned.
        # @param [Fixnum] page_size
        #   Optional. The maximum number of companies to be returned, at most 100.
        #   Default is 100 if a non-positive number is provided.
        # @param [String] page_token
        #   Optional. The starting indicator from which to return results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::JobsV2::ListCompaniesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::JobsV2::ListCompaniesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_companies(must_have_open_jobs: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/companies', options)
          command.response_representation = Google::Apis::JobsV2::ListCompaniesResponse::Representation
          command.response_class = Google::Apis::JobsV2::ListCompaniesResponse
          command.query['mustHaveOpenJobs'] = must_have_open_jobs unless must_have_open_jobs.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the specified company. Company names can't be updated. To update a
        # company name, delete the company and all jobs associated with it, and only
        # then re-create them.
        # @param [String] name
        #   Required during company update.
        #   The resource name for a company. This is generated by the service when a
        #   company is created, for example,
        #   "companies/0000aaaa-1111-bbbb-2222-cccc3333dddd".
        # @param [Google::Apis::JobsV2::Company] company_object
        # @param [String] update_company_fields
        #   Optional but strongly recommended to be provided for the best service
        #   experience.
        #   If update_company_fields is provided, only the specified fields in
        #   company are updated. Otherwise all the fields are updated.
        #   A field mask to specify the company fields to update. Valid values are:
        #   * displayName
        #   * website
        #   * imageUrl
        #   * companySize
        #   * distributorBillingCompanyId
        #   * companyInfoSources
        #   * careerPageLink
        #   * hiringAgency
        #   * hqLocation
        #   * eeoText
        #   * keywordSearchableCustomAttributes
        #   * title (deprecated)
        #   * keywordSearchableCustomFields (deprecated)
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::JobsV2::Company] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::JobsV2::Company]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_company(name, company_object = nil, update_company_fields: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v2/{+name}', options)
          command.request_representation = Google::Apis::JobsV2::Company::Representation
          command.request_object = company_object
          command.response_representation = Google::Apis::JobsV2::Company::Representation
          command.response_class = Google::Apis::JobsV2::Company
          command.params['name'] = name unless name.nil?
          command.query['updateCompanyFields'] = update_company_fields unless update_company_fields.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deprecated. Use ListJobs instead.
        # Lists all jobs associated with a company.
        # @param [String] company_name
        #   Required. The resource name of the company that owns the jobs to be listed,
        #   such as, "companies/0000aaaa-1111-bbbb-2222-cccc3333dddd".
        # @param [Boolean] ids_only
        #   Optional. If set to `true`, only job ID, job requisition ID and language code
        #   will be
        #   returned.
        #   A typical use is to synchronize job repositories.
        #   Defaults to false.
        # @param [Boolean] include_jobs_count
        #   Deprecated. Please DO NOT use this field except for small companies.
        #   Suggest counting jobs page by page instead.
        #   Optional.
        #   Set to true if the total number of open jobs is to be returned.
        #   Defaults to false.
        # @param [String] job_requisition_id
        #   Optional. The requisition ID, also known as posting ID, assigned by the
        #   company
        #   to the job.
        #   The maximum number of allowable characters is 225.
        # @param [Fixnum] page_size
        #   Optional. The maximum number of jobs to be returned per page of results.
        #   If ids_only is set to true, the maximum allowed page size
        #   is 1000. Otherwise, the maximum allowed page size is 100.
        #   Default is 100 if empty or a number < 1 is specified.
        # @param [String] page_token
        #   Optional. The starting point of a query result.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::JobsV2::ListCompanyJobsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::JobsV2::ListCompanyJobsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_company_jobs(company_name, ids_only: nil, include_jobs_count: nil, job_requisition_id: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+companyName}/jobs', options)
          command.response_representation = Google::Apis::JobsV2::ListCompanyJobsResponse::Representation
          command.response_class = Google::Apis::JobsV2::ListCompanyJobsResponse
          command.params['companyName'] = company_name unless company_name.nil?
          command.query['idsOnly'] = ids_only unless ids_only.nil?
          command.query['includeJobsCount'] = include_jobs_count unless include_jobs_count.nil?
          command.query['jobRequisitionId'] = job_requisition_id unless job_requisition_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a list of Job postings by filter.
        # @param [Google::Apis::JobsV2::BatchDeleteJobsRequest] batch_delete_jobs_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::JobsV2::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::JobsV2::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_delete_jobs(batch_delete_jobs_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/jobs:batchDelete', options)
          command.request_representation = Google::Apis::JobsV2::BatchDeleteJobsRequest::Representation
          command.request_object = batch_delete_jobs_request_object
          command.response_representation = Google::Apis::JobsV2::Empty::Representation
          command.response_class = Google::Apis::JobsV2::Empty
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new job.
        # Typically, the job becomes searchable within 10 seconds, but it may take
        # up to 5 minutes.
        # @param [Google::Apis::JobsV2::CreateJobRequest] create_job_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::JobsV2::Job] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::JobsV2::Job]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_job(create_job_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/jobs', options)
          command.request_representation = Google::Apis::JobsV2::CreateJobRequest::Representation
          command.request_object = create_job_request_object
          command.response_representation = Google::Apis::JobsV2::Job::Representation
          command.response_class = Google::Apis::JobsV2::Job
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the specified job.
        # Typically, the job becomes unsearchable within 10 seconds, but it may take
        # up to 5 minutes.
        # @param [String] name
        #   Required. The resource name of the job to be deleted, such as "jobs/11111111".
        # @param [Boolean] disable_fast_process
        #   Deprecated. This field is not working anymore.
        #   Optional.
        #   If set to true, this call waits for all processing steps to complete
        #   before the job is cleaned up. Otherwise, the call returns while some
        #   steps are still taking place asynchronously, hence faster.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::JobsV2::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::JobsV2::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_job(name, disable_fast_process: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2/{+name}', options)
          command.response_representation = Google::Apis::JobsV2::Empty::Representation
          command.response_class = Google::Apis::JobsV2::Empty
          command.params['name'] = name unless name.nil?
          command.query['disableFastProcess'] = disable_fast_process unless disable_fast_process.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deprecated. Use BatchDeleteJobs instead.
        # Deletes the specified job by filter. You can specify whether to
        # synchronously wait for validation, indexing, and general processing to be
        # completed before the response is returned.
        # @param [Google::Apis::JobsV2::DeleteJobsByFilterRequest] delete_jobs_by_filter_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::JobsV2::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::JobsV2::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_job_by_filter(delete_jobs_by_filter_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/jobs:deleteByFilter', options)
          command.request_representation = Google::Apis::JobsV2::DeleteJobsByFilterRequest::Representation
          command.request_object = delete_jobs_by_filter_request_object
          command.response_representation = Google::Apis::JobsV2::Empty::Representation
          command.response_class = Google::Apis::JobsV2::Empty
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the specified job, whose status is OPEN or recently EXPIRED
        # within the last 90 days.
        # @param [String] name
        #   Required. The resource name of the job to retrieve, such as "jobs/11111111".
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::JobsV2::Job] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::JobsV2::Job]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_job(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+name}', options)
          command.response_representation = Google::Apis::JobsV2::Job::Representation
          command.response_class = Google::Apis::JobsV2::Job
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deprecated. Use SearchJobsRequest.histogram_facets instead to make
        # a single call with both search and histogram.
        # Retrieves a histogram for the given
        # GetHistogramRequest. This call provides a structured
        # count of jobs that match against the search query, grouped by specified
        # facets.
        # This call constrains the visibility of jobs
        # present in the database, and only counts jobs the caller has
        # permission to search against.
        # For example, use this call to generate the
        # number of jobs in the U.S. by state.
        # @param [Google::Apis::JobsV2::GetHistogramRequest] get_histogram_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::JobsV2::GetHistogramResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::JobsV2::GetHistogramResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def histogram_job(get_histogram_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/jobs:histogram', options)
          command.request_representation = Google::Apis::JobsV2::GetHistogramRequest::Representation
          command.request_object = get_histogram_request_object
          command.response_representation = Google::Apis::JobsV2::GetHistogramResponse::Representation
          command.response_class = Google::Apis::JobsV2::GetHistogramResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists jobs by filter.
        # @param [String] filter
        #   Required. The filter string specifies the jobs to be enumerated.
        #   Supported operator: =, AND
        #   The fields eligible for filtering are:
        #   * `companyName` (Required)
        #   * `requisitionId` (Optional)
        #   Sample Query:
        #   * companyName = "companies/123"
        #   * companyName = "companies/123" AND requisitionId = "req-1"
        # @param [Boolean] ids_only
        #   Optional. If set to `true`, only Job.name, Job.requisition_id and
        #   Job.language_code will be returned.
        #   A typical use case is to synchronize job repositories.
        #   Defaults to false.
        # @param [Fixnum] page_size
        #   Optional. The maximum number of jobs to be returned per page of results.
        #   If ids_only is set to true, the maximum allowed page size
        #   is 1000. Otherwise, the maximum allowed page size is 100.
        #   Default is 100 if empty or a number < 1 is specified.
        # @param [String] page_token
        #   Optional. The starting point of a query result.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::JobsV2::ListJobsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::JobsV2::ListJobsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_jobs(filter: nil, ids_only: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/jobs', options)
          command.response_representation = Google::Apis::JobsV2::ListJobsResponse::Representation
          command.response_class = Google::Apis::JobsV2::ListJobsResponse
          command.query['filter'] = filter unless filter.nil?
          command.query['idsOnly'] = ids_only unless ids_only.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates specified job.
        # Typically, updated contents become visible in search results within 10
        # seconds, but it may take up to 5 minutes.
        # @param [String] name
        #   Required during job update.
        #   Resource name assigned to a job by the API, for example, "/jobs/foo". Use
        #   of this field in job queries and API calls is preferred over the use of
        #   requisition_id since this value is unique.
        # @param [Google::Apis::JobsV2::UpdateJobRequest] update_job_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::JobsV2::Job] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::JobsV2::Job]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_job(name, update_job_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v2/{+name}', options)
          command.request_representation = Google::Apis::JobsV2::UpdateJobRequest::Representation
          command.request_object = update_job_request_object
          command.response_representation = Google::Apis::JobsV2::Job::Representation
          command.response_class = Google::Apis::JobsV2::Job
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Searches for jobs using the provided SearchJobsRequest.
        # This call constrains the visibility of jobs
        # present in the database, and only returns jobs that the caller has
        # permission to search against.
        # @param [Google::Apis::JobsV2::SearchJobsRequest] search_jobs_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::JobsV2::SearchJobsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::JobsV2::SearchJobsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def search_jobs(search_jobs_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/jobs:search', options)
          command.request_representation = Google::Apis::JobsV2::SearchJobsRequest::Representation
          command.request_object = search_jobs_request_object
          command.response_representation = Google::Apis::JobsV2::SearchJobsResponse::Representation
          command.response_class = Google::Apis::JobsV2::SearchJobsResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Searches for jobs using the provided SearchJobsRequest.
        # This API call is intended for the use case of targeting passive job
        # seekers (for example, job seekers who have signed up to receive email
        # alerts about potential job opportunities), and has different algorithmic
        # adjustments that are targeted to passive job seekers.
        # This call constrains the visibility of jobs
        # present in the database, and only returns jobs the caller has
        # permission to search against.
        # @param [Google::Apis::JobsV2::SearchJobsRequest] search_jobs_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::JobsV2::SearchJobsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::JobsV2::SearchJobsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def search_job_for_alert(search_jobs_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/jobs:searchForAlert', options)
          command.request_representation = Google::Apis::JobsV2::SearchJobsRequest::Representation
          command.request_object = search_jobs_request_object
          command.response_representation = Google::Apis::JobsV2::SearchJobsResponse::Representation
          command.response_class = Google::Apis::JobsV2::SearchJobsResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Completes the specified prefix with job keyword suggestions.
        # Intended for use by a job search auto-complete search box.
        # @param [String] company_name
        #   Optional. If provided, restricts completion to the specified company.
        # @param [String] language_code
        #   Required. The language of the query. This is
        #   the BCP-47 language code, such as "en-US" or "sr-Latn".
        #   For more information, see
        #   [Tags for Identifying Languages](https://tools.ietf.org/html/bcp47).
        #   For CompletionType.JOB_TITLE type, only open jobs with same
        #   language_code are returned.
        #   For CompletionType.COMPANY_NAME type,
        #   only companies having open jobs with same language_code are
        #   returned.
        #   For CompletionType.COMBINED type, only open jobs with same
        #   language_code or companies having open jobs with same
        #   language_code are returned.
        # @param [Fixnum] page_size
        #   Required. Completion result count.
        #   The maximum allowed page size is 10.
        # @param [String] query
        #   Required. The query used to generate suggestions.
        # @param [String] scope
        #   Optional. The scope of the completion. The defaults is CompletionScope.PUBLIC.
        # @param [String] type
        #   Optional. The completion topic. The default is CompletionType.COMBINED.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::JobsV2::CompleteQueryResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::JobsV2::CompleteQueryResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def complete(company_name: nil, language_code: nil, page_size: nil, query: nil, scope: nil, type: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2:complete', options)
          command.response_representation = Google::Apis::JobsV2::CompleteQueryResponse::Representation
          command.response_class = Google::Apis::JobsV2::CompleteQueryResponse
          command.query['companyName'] = company_name unless company_name.nil?
          command.query['languageCode'] = language_code unless language_code.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['query'] = query unless query.nil?
          command.query['scope'] = scope unless scope.nil?
          command.query['type'] = type unless type.nil?
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
