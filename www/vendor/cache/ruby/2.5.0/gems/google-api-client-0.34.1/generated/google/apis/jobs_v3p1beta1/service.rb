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
    module JobsV3p1beta1
      # Cloud Talent Solution API
      #
      # Cloud Talent Solution provides the capability to create, read, update, and
      #  delete job postings, as well as search jobs based on keywords and filters.
      #
      # @example
      #    require 'google/apis/jobs_v3p1beta1'
      #
      #    Jobs = Google::Apis::JobsV3p1beta1 # Alias the module
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
        
        # Completes the specified prefix with keyword suggestions.
        # Intended for use by a job search auto-complete search box.
        # @param [String] name
        #   Required. Resource name of project the completion is performed within.
        #   The format is "projects/`project_id`", for example,
        #   "projects/api-test-project".
        # @param [String] company_name
        #   Optional. If provided, restricts completion to specified company.
        #   The format is "projects/`project_id`/companies/`company_id`", for example,
        #   "projects/api-test-project/companies/foo".
        # @param [String] language_code
        #   Deprecated. Use language_codes instead.
        #   Optional.
        #   The language of the query. This is
        #   the BCP-47 language code, such as "en-US" or "sr-Latn".
        #   For more information, see
        #   [Tags for Identifying Languages](https://tools.ietf.org/html/bcp47).
        #   For CompletionType.JOB_TITLE type, only open jobs with the same
        #   language_code are returned.
        #   For CompletionType.COMPANY_NAME type,
        #   only companies having open jobs with the same language_code are
        #   returned.
        #   For CompletionType.COMBINED type, only open jobs with the same
        #   language_code or companies having open jobs with the same
        #   language_code are returned.
        #   The maximum number of allowed characters is 255.
        # @param [Array<String>, String] language_codes
        #   Optional. The list of languages of the query. This is
        #   the BCP-47 language code, such as "en-US" or "sr-Latn".
        #   For more information, see
        #   [Tags for Identifying Languages](https://tools.ietf.org/html/bcp47).
        #   For CompletionType.JOB_TITLE type, only open jobs with the same
        #   language_codes are returned.
        #   For CompletionType.COMPANY_NAME type,
        #   only companies having open jobs with the same language_codes are
        #   returned.
        #   For CompletionType.COMBINED type, only open jobs with the same
        #   language_codes or companies having open jobs with the same
        #   language_codes are returned.
        #   The maximum number of allowed characters is 255.
        # @param [Fixnum] page_size
        #   Required. Completion result count.
        #   The maximum allowed page size is 10.
        # @param [String] query
        #   Required. The query used to generate suggestions.
        #   The maximum number of allowed characters is 255.
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
        # @yieldparam result [Google::Apis::JobsV3p1beta1::CompleteQueryResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::JobsV3p1beta1::CompleteQueryResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def complete_project(name, company_name: nil, language_code: nil, language_codes: nil, page_size: nil, query: nil, scope: nil, type: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v3p1beta1/{+name}:complete', options)
          command.response_representation = Google::Apis::JobsV3p1beta1::CompleteQueryResponse::Representation
          command.response_class = Google::Apis::JobsV3p1beta1::CompleteQueryResponse
          command.params['name'] = name unless name.nil?
          command.query['companyName'] = company_name unless company_name.nil?
          command.query['languageCode'] = language_code unless language_code.nil?
          command.query['languageCodes'] = language_codes unless language_codes.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['query'] = query unless query.nil?
          command.query['scope'] = scope unless scope.nil?
          command.query['type'] = type unless type.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Report events issued when end user interacts with customer's application
        # that uses Cloud Talent Solution. You may inspect the created events in
        # [self service
        # tools](https://console.cloud.google.com/talent-solution/overview).
        # [Learn
        # more](https://cloud.google.com/talent-solution/docs/management-tools)
        # about self service tools.
        # @param [String] parent
        #   Parent project name.
        # @param [Google::Apis::JobsV3p1beta1::CreateClientEventRequest] create_client_event_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::JobsV3p1beta1::ClientEvent] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::JobsV3p1beta1::ClientEvent]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_client_event(parent, create_client_event_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v3p1beta1/{+parent}/clientEvents', options)
          command.request_representation = Google::Apis::JobsV3p1beta1::CreateClientEventRequest::Representation
          command.request_object = create_client_event_request_object
          command.response_representation = Google::Apis::JobsV3p1beta1::ClientEvent::Representation
          command.response_class = Google::Apis::JobsV3p1beta1::ClientEvent
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new company entity.
        # @param [String] parent
        #   Required. Resource name of the project under which the company is created.
        #   The format is "projects/`project_id`", for example,
        #   "projects/api-test-project".
        # @param [Google::Apis::JobsV3p1beta1::CreateCompanyRequest] create_company_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::JobsV3p1beta1::Company] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::JobsV3p1beta1::Company]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_company(parent, create_company_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v3p1beta1/{+parent}/companies', options)
          command.request_representation = Google::Apis::JobsV3p1beta1::CreateCompanyRequest::Representation
          command.request_object = create_company_request_object
          command.response_representation = Google::Apis::JobsV3p1beta1::Company::Representation
          command.response_class = Google::Apis::JobsV3p1beta1::Company
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes specified company.
        # Prerequisite: The company has no jobs associated with it.
        # @param [String] name
        #   Required. The resource name of the company to be deleted.
        #   The format is "projects/`project_id`/companies/`company_id`", for example,
        #   "projects/api-test-project/companies/foo".
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::JobsV3p1beta1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::JobsV3p1beta1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_company(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v3p1beta1/{+name}', options)
          command.response_representation = Google::Apis::JobsV3p1beta1::Empty::Representation
          command.response_class = Google::Apis::JobsV3p1beta1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves specified company.
        # @param [String] name
        #   Required. The resource name of the company to be retrieved.
        #   The format is "projects/`project_id`/companies/`company_id`", for example,
        #   "projects/api-test-project/companies/foo".
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::JobsV3p1beta1::Company] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::JobsV3p1beta1::Company]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_company(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v3p1beta1/{+name}', options)
          command.response_representation = Google::Apis::JobsV3p1beta1::Company::Representation
          command.response_class = Google::Apis::JobsV3p1beta1::Company
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all companies associated with the service account.
        # @param [String] parent
        #   Required. Resource name of the project under which the company is created.
        #   The format is "projects/`project_id`", for example,
        #   "projects/api-test-project".
        # @param [Fixnum] page_size
        #   Optional. The maximum number of companies to be returned, at most 100.
        #   Default is 100 if a non-positive number is provided.
        # @param [String] page_token
        #   Optional. The starting indicator from which to return results.
        # @param [Boolean] require_open_jobs
        #   Optional. Set to true if the companies requested must have open jobs.
        #   Defaults to false.
        #   If true, at most page_size of companies are fetched, among which
        #   only those with open jobs are returned.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::JobsV3p1beta1::ListCompaniesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::JobsV3p1beta1::ListCompaniesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_companies(parent, page_size: nil, page_token: nil, require_open_jobs: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v3p1beta1/{+parent}/companies', options)
          command.response_representation = Google::Apis::JobsV3p1beta1::ListCompaniesResponse::Representation
          command.response_class = Google::Apis::JobsV3p1beta1::ListCompaniesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['requireOpenJobs'] = require_open_jobs unless require_open_jobs.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates specified company. Company names can't be updated. To update a
        # company name, delete the company and all jobs associated with it, and only
        # then re-create them.
        # @param [String] name
        #   Required during company update.
        #   The resource name for a company. This is generated by the service when a
        #   company is created.
        #   The format is "projects/`project_id`/companies/`company_id`", for example,
        #   "projects/api-test-project/companies/foo".
        # @param [Google::Apis::JobsV3p1beta1::UpdateCompanyRequest] update_company_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::JobsV3p1beta1::Company] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::JobsV3p1beta1::Company]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_company(name, update_company_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v3p1beta1/{+name}', options)
          command.request_representation = Google::Apis::JobsV3p1beta1::UpdateCompanyRequest::Representation
          command.request_object = update_company_request_object
          command.response_representation = Google::Apis::JobsV3p1beta1::Company::Representation
          command.response_class = Google::Apis::JobsV3p1beta1::Company
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a list of Jobs by filter.
        # @param [String] parent
        #   Required. The resource name of the project under which the job is created.
        #   The format is "projects/`project_id`", for example,
        #   "projects/api-test-project".
        # @param [Google::Apis::JobsV3p1beta1::BatchDeleteJobsRequest] batch_delete_jobs_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::JobsV3p1beta1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::JobsV3p1beta1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_delete_jobs(parent, batch_delete_jobs_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v3p1beta1/{+parent}/jobs:batchDelete', options)
          command.request_representation = Google::Apis::JobsV3p1beta1::BatchDeleteJobsRequest::Representation
          command.request_object = batch_delete_jobs_request_object
          command.response_representation = Google::Apis::JobsV3p1beta1::Empty::Representation
          command.response_class = Google::Apis::JobsV3p1beta1::Empty
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new job.
        # Typically, the job becomes searchable within 10 seconds, but it may take
        # up to 5 minutes.
        # @param [String] parent
        #   Required. The resource name of the project under which the job is created.
        #   The format is "projects/`project_id`", for example,
        #   "projects/api-test-project".
        # @param [Google::Apis::JobsV3p1beta1::CreateJobRequest] create_job_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::JobsV3p1beta1::Job] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::JobsV3p1beta1::Job]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_job(parent, create_job_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v3p1beta1/{+parent}/jobs', options)
          command.request_representation = Google::Apis::JobsV3p1beta1::CreateJobRequest::Representation
          command.request_object = create_job_request_object
          command.response_representation = Google::Apis::JobsV3p1beta1::Job::Representation
          command.response_class = Google::Apis::JobsV3p1beta1::Job
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the specified job.
        # Typically, the job becomes unsearchable within 10 seconds, but it may take
        # up to 5 minutes.
        # @param [String] name
        #   Required. The resource name of the job to be deleted.
        #   The format is "projects/`project_id`/jobs/`job_id`",
        #   for example, "projects/api-test-project/jobs/1234".
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::JobsV3p1beta1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::JobsV3p1beta1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_job(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v3p1beta1/{+name}', options)
          command.response_representation = Google::Apis::JobsV3p1beta1::Empty::Representation
          command.response_class = Google::Apis::JobsV3p1beta1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the specified job, whose status is OPEN or recently EXPIRED
        # within the last 90 days.
        # @param [String] name
        #   Required. The resource name of the job to retrieve.
        #   The format is "projects/`project_id`/jobs/`job_id`",
        #   for example, "projects/api-test-project/jobs/1234".
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::JobsV3p1beta1::Job] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::JobsV3p1beta1::Job]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_job(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v3p1beta1/{+name}', options)
          command.response_representation = Google::Apis::JobsV3p1beta1::Job::Representation
          command.response_class = Google::Apis::JobsV3p1beta1::Job
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists jobs by filter.
        # @param [String] parent
        #   Required. The resource name of the project under which the job is created.
        #   The format is "projects/`project_id`", for example,
        #   "projects/api-test-project".
        # @param [String] filter
        #   Required. The filter string specifies the jobs to be enumerated.
        #   Supported operator: =, AND
        #   The fields eligible for filtering are:
        #   * `companyName` (Required)
        #   * `requisitionId` (Optional)
        #   Sample Query:
        #   * companyName = "projects/api-test-project/companies/123"
        #   * companyName = "projects/api-test-project/companies/123" AND requisitionId
        #   = "req-1"
        # @param [String] job_view
        #   Optional. The desired job attributes returned for jobs in the
        #   search response. Defaults to JobView.JOB_VIEW_FULL if no value is
        #   specified.
        # @param [Fixnum] page_size
        #   Optional. The maximum number of jobs to be returned per page of results.
        #   If job_view is set to JobView.JOB_VIEW_ID_ONLY, the maximum allowed
        #   page size is 1000. Otherwise, the maximum allowed page size is 100.
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
        # @yieldparam result [Google::Apis::JobsV3p1beta1::ListJobsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::JobsV3p1beta1::ListJobsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_jobs(parent, filter: nil, job_view: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v3p1beta1/{+parent}/jobs', options)
          command.response_representation = Google::Apis::JobsV3p1beta1::ListJobsResponse::Representation
          command.response_class = Google::Apis::JobsV3p1beta1::ListJobsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['jobView'] = job_view unless job_view.nil?
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
        #   The resource name for the job. This is generated by the service when a
        #   job is created.
        #   The format is "projects/`project_id`/jobs/`job_id`",
        #   for example, "projects/api-test-project/jobs/1234".
        #   Use of this field in job queries and API calls is preferred over the use of
        #   requisition_id since this value is unique.
        # @param [Google::Apis::JobsV3p1beta1::UpdateJobRequest] update_job_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::JobsV3p1beta1::Job] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::JobsV3p1beta1::Job]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_job(name, update_job_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v3p1beta1/{+name}', options)
          command.request_representation = Google::Apis::JobsV3p1beta1::UpdateJobRequest::Representation
          command.request_object = update_job_request_object
          command.response_representation = Google::Apis::JobsV3p1beta1::Job::Representation
          command.response_class = Google::Apis::JobsV3p1beta1::Job
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Searches for jobs using the provided SearchJobsRequest.
        # This call constrains the visibility of jobs
        # present in the database, and only returns jobs that the caller has
        # permission to search against.
        # @param [String] parent
        #   Required. The resource name of the project to search within.
        #   The format is "projects/`project_id`", for example,
        #   "projects/api-test-project".
        # @param [Google::Apis::JobsV3p1beta1::SearchJobsRequest] search_jobs_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::JobsV3p1beta1::SearchJobsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::JobsV3p1beta1::SearchJobsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def search_jobs(parent, search_jobs_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v3p1beta1/{+parent}/jobs:search', options)
          command.request_representation = Google::Apis::JobsV3p1beta1::SearchJobsRequest::Representation
          command.request_object = search_jobs_request_object
          command.response_representation = Google::Apis::JobsV3p1beta1::SearchJobsResponse::Representation
          command.response_class = Google::Apis::JobsV3p1beta1::SearchJobsResponse
          command.params['parent'] = parent unless parent.nil?
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
        # @param [String] parent
        #   Required. The resource name of the project to search within.
        #   The format is "projects/`project_id`", for example,
        #   "projects/api-test-project".
        # @param [Google::Apis::JobsV3p1beta1::SearchJobsRequest] search_jobs_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::JobsV3p1beta1::SearchJobsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::JobsV3p1beta1::SearchJobsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def search_project_job_for_alert(parent, search_jobs_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v3p1beta1/{+parent}/jobs:searchForAlert', options)
          command.request_representation = Google::Apis::JobsV3p1beta1::SearchJobsRequest::Representation
          command.request_object = search_jobs_request_object
          command.response_representation = Google::Apis::JobsV3p1beta1::SearchJobsResponse::Representation
          command.response_class = Google::Apis::JobsV3p1beta1::SearchJobsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the latest state of a long-running operation.  Clients can use this
        # method to poll the operation result at intervals as recommended by the API
        # service.
        # @param [String] name
        #   The name of the operation resource.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::JobsV3p1beta1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::JobsV3p1beta1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_operation(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v3p1beta1/{+name}', options)
          command.response_representation = Google::Apis::JobsV3p1beta1::Operation::Representation
          command.response_class = Google::Apis::JobsV3p1beta1::Operation
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
