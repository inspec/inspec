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
    module BigqueryV2
      # BigQuery API
      #
      # A data platform for customers to create, manage, share and query data.
      #
      # @example
      #    require 'google/apis/bigquery_v2'
      #
      #    Bigquery = Google::Apis::BigqueryV2 # Alias the module
      #    service = Bigquery::BigqueryService.new
      #
      # @see https://cloud.google.com/bigquery/
      class BigqueryService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  An opaque string that represents a user for quota purposes. Must not exceed 40
        #  characters.
        attr_accessor :quota_user

        # @return [String]
        #  Deprecated. Please use quotaUser instead.
        attr_accessor :user_ip

        def initialize
          super('https://bigquery.googleapis.com/', 'bigquery/v2/')
          @batch_path = 'batch/bigquery/v2'
        end
        
        # Deletes the dataset specified by the datasetId value. Before you can delete a
        # dataset, you must delete all its tables, either manually or by specifying
        # deleteContents. Immediately after deletion, you can create another dataset
        # with the same name.
        # @param [String] project_id
        #   Project ID of the dataset being deleted
        # @param [String] dataset_id
        #   Dataset ID of dataset being deleted
        # @param [Boolean] delete_contents
        #   If True, delete all the tables in the dataset. If False and the dataset
        #   contains tables, the request will fail. Default is False
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_dataset(project_id, dataset_id, delete_contents: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'projects/{projectId}/datasets/{datasetId}', options)
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['datasetId'] = dataset_id unless dataset_id.nil?
          command.query['deleteContents'] = delete_contents unless delete_contents.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the dataset specified by datasetID.
        # @param [String] project_id
        #   Project ID of the requested dataset
        # @param [String] dataset_id
        #   Dataset ID of the requested dataset
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryV2::Dataset] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryV2::Dataset]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_dataset(project_id, dataset_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'projects/{projectId}/datasets/{datasetId}', options)
          command.response_representation = Google::Apis::BigqueryV2::Dataset::Representation
          command.response_class = Google::Apis::BigqueryV2::Dataset
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['datasetId'] = dataset_id unless dataset_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new empty dataset.
        # @param [String] project_id
        #   Project ID of the new dataset
        # @param [Google::Apis::BigqueryV2::Dataset] dataset_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryV2::Dataset] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryV2::Dataset]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_dataset(project_id, dataset_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'projects/{projectId}/datasets', options)
          command.request_representation = Google::Apis::BigqueryV2::Dataset::Representation
          command.request_object = dataset_object
          command.response_representation = Google::Apis::BigqueryV2::Dataset::Representation
          command.response_class = Google::Apis::BigqueryV2::Dataset
          command.params['projectId'] = project_id unless project_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all datasets in the specified project to which you have been granted the
        # READER dataset role.
        # @param [String] project_id
        #   Project ID of the datasets to be listed
        # @param [Boolean] all
        #   Whether to list all datasets, including hidden ones
        # @param [String] filter
        #   An expression for filtering the results of the request by label. The syntax is
        #   "labels.<name>[:<value>]". Multiple filters can be ANDed together by
        #   connecting with a space. Example: "labels.department:receiving labels.active".
        #   See Filtering datasets using labels for details.
        # @param [Fixnum] max_results
        #   The maximum number of results to return
        # @param [String] page_token
        #   Page token, returned by a previous call, to request the next page of results
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryV2::DatasetList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryV2::DatasetList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_datasets(project_id, all: nil, filter: nil, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'projects/{projectId}/datasets', options)
          command.response_representation = Google::Apis::BigqueryV2::DatasetList::Representation
          command.response_class = Google::Apis::BigqueryV2::DatasetList
          command.params['projectId'] = project_id unless project_id.nil?
          command.query['all'] = all unless all.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates information in an existing dataset. The update method replaces the
        # entire dataset resource, whereas the patch method only replaces fields that
        # are provided in the submitted dataset resource. This method supports patch
        # semantics.
        # @param [String] project_id
        #   Project ID of the dataset being updated
        # @param [String] dataset_id
        #   Dataset ID of the dataset being updated
        # @param [Google::Apis::BigqueryV2::Dataset] dataset_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryV2::Dataset] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryV2::Dataset]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_dataset(project_id, dataset_id, dataset_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'projects/{projectId}/datasets/{datasetId}', options)
          command.request_representation = Google::Apis::BigqueryV2::Dataset::Representation
          command.request_object = dataset_object
          command.response_representation = Google::Apis::BigqueryV2::Dataset::Representation
          command.response_class = Google::Apis::BigqueryV2::Dataset
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['datasetId'] = dataset_id unless dataset_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates information in an existing dataset. The update method replaces the
        # entire dataset resource, whereas the patch method only replaces fields that
        # are provided in the submitted dataset resource.
        # @param [String] project_id
        #   Project ID of the dataset being updated
        # @param [String] dataset_id
        #   Dataset ID of the dataset being updated
        # @param [Google::Apis::BigqueryV2::Dataset] dataset_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryV2::Dataset] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryV2::Dataset]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_dataset(project_id, dataset_id, dataset_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'projects/{projectId}/datasets/{datasetId}', options)
          command.request_representation = Google::Apis::BigqueryV2::Dataset::Representation
          command.request_object = dataset_object
          command.response_representation = Google::Apis::BigqueryV2::Dataset::Representation
          command.response_class = Google::Apis::BigqueryV2::Dataset
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['datasetId'] = dataset_id unless dataset_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Requests that a job be cancelled. This call will return immediately, and the
        # client will need to poll for the job status to see if the cancel completed
        # successfully. Cancelled jobs may still incur costs.
        # @param [String] project_id
        #   [Required] Project ID of the job to cancel
        # @param [String] job_id
        #   [Required] Job ID of the job to cancel
        # @param [String] location
        #   The geographic location of the job. Required except for US and EU. See details
        #   at https://cloud.google.com/bigquery/docs/locations#specifying_your_location.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryV2::CancelJobResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryV2::CancelJobResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def cancel_job(project_id, job_id, location: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'projects/{projectId}/jobs/{jobId}/cancel', options)
          command.response_representation = Google::Apis::BigqueryV2::CancelJobResponse::Representation
          command.response_class = Google::Apis::BigqueryV2::CancelJobResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['jobId'] = job_id unless job_id.nil?
          command.query['location'] = location unless location.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns information about a specific job. Job information is available for a
        # six month period after creation. Requires that you're the person who ran the
        # job, or have the Is Owner project role.
        # @param [String] project_id
        #   [Required] Project ID of the requested job
        # @param [String] job_id
        #   [Required] Job ID of the requested job
        # @param [String] location
        #   The geographic location of the job. Required except for US and EU. See details
        #   at https://cloud.google.com/bigquery/docs/locations#specifying_your_location.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryV2::Job] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryV2::Job]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_job(project_id, job_id, location: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'projects/{projectId}/jobs/{jobId}', options)
          command.response_representation = Google::Apis::BigqueryV2::Job::Representation
          command.response_class = Google::Apis::BigqueryV2::Job
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['jobId'] = job_id unless job_id.nil?
          command.query['location'] = location unless location.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the results of a query job.
        # @param [String] project_id
        #   [Required] Project ID of the query job
        # @param [String] job_id
        #   [Required] Job ID of the query job
        # @param [String] location
        #   The geographic location where the job should run. Required except for US and
        #   EU. See details at https://cloud.google.com/bigquery/docs/locations#
        #   specifying_your_location.
        # @param [Fixnum] max_results
        #   Maximum number of results to read
        # @param [String] page_token
        #   Page token, returned by a previous call, to request the next page of results
        # @param [Fixnum] start_index
        #   Zero-based index of the starting row
        # @param [Fixnum] timeout_ms
        #   How long to wait for the query to complete, in milliseconds, before returning.
        #   Default is 10 seconds. If the timeout passes before the job completes, the '
        #   jobComplete' field in the response will be false
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryV2::GetQueryResultsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryV2::GetQueryResultsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_job_query_results(project_id, job_id, location: nil, max_results: nil, page_token: nil, start_index: nil, timeout_ms: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'projects/{projectId}/queries/{jobId}', options)
          command.response_representation = Google::Apis::BigqueryV2::GetQueryResultsResponse::Representation
          command.response_class = Google::Apis::BigqueryV2::GetQueryResultsResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['jobId'] = job_id unless job_id.nil?
          command.query['location'] = location unless location.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['startIndex'] = start_index unless start_index.nil?
          command.query['timeoutMs'] = timeout_ms unless timeout_ms.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Starts a new asynchronous job. Requires the Can View project role.
        # @param [String] project_id
        #   Project ID of the project that will be billed for the job
        # @param [Google::Apis::BigqueryV2::Job] job_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [IO, String] upload_source
        #   IO stream or filename containing content to upload
        # @param [String] content_type
        #   Content type of the uploaded content.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryV2::Job] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryV2::Job]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_job(project_id, job_object = nil, fields: nil, quota_user: nil, user_ip: nil, upload_source: nil, content_type: nil, options: nil, &block)
          if upload_source.nil?
            command = make_simple_command(:post, 'projects/{projectId}/jobs', options)
          else
            command = make_upload_command(:post, 'projects/{projectId}/jobs', options)
            command.upload_source = upload_source
            command.upload_content_type = content_type
          end
          command.request_representation = Google::Apis::BigqueryV2::Job::Representation
          command.request_object = job_object
          command.response_representation = Google::Apis::BigqueryV2::Job::Representation
          command.response_class = Google::Apis::BigqueryV2::Job
          command.params['projectId'] = project_id unless project_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all jobs that you started in the specified project. Job information is
        # available for a six month period after creation. The job list is sorted in
        # reverse chronological order, by job creation time. Requires the Can View
        # project role, or the Is Owner project role if you set the allUsers property.
        # @param [String] project_id
        #   Project ID of the jobs to list
        # @param [Boolean] all_users
        #   Whether to display jobs owned by all users in the project. Default false
        # @param [Fixnum] max_creation_time
        #   Max value for job creation time, in milliseconds since the POSIX epoch. If set,
        #   only jobs created before or at this timestamp are returned
        # @param [Fixnum] max_results
        #   Maximum number of results to return
        # @param [Fixnum] min_creation_time
        #   Min value for job creation time, in milliseconds since the POSIX epoch. If set,
        #   only jobs created after or at this timestamp are returned
        # @param [String] page_token
        #   Page token, returned by a previous call, to request the next page of results
        # @param [String] parent_job_id
        #   If set, retrieves only jobs whose parent is this job. Otherwise, retrieves
        #   only jobs which have no parent
        # @param [String] projection
        #   Restrict information returned to a set of selected fields
        # @param [Array<String>, String] state_filter
        #   Filter for job state
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryV2::JobList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryV2::JobList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_jobs(project_id, all_users: nil, max_creation_time: nil, max_results: nil, min_creation_time: nil, page_token: nil, parent_job_id: nil, projection: nil, state_filter: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'projects/{projectId}/jobs', options)
          command.response_representation = Google::Apis::BigqueryV2::JobList::Representation
          command.response_class = Google::Apis::BigqueryV2::JobList
          command.params['projectId'] = project_id unless project_id.nil?
          command.query['allUsers'] = all_users unless all_users.nil?
          command.query['maxCreationTime'] = max_creation_time unless max_creation_time.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['minCreationTime'] = min_creation_time unless min_creation_time.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['parentJobId'] = parent_job_id unless parent_job_id.nil?
          command.query['projection'] = projection unless projection.nil?
          command.query['stateFilter'] = state_filter unless state_filter.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Runs a BigQuery SQL query synchronously and returns query results if the query
        # completes within a specified timeout.
        # @param [String] project_id
        #   Project ID of the project billed for the query
        # @param [Google::Apis::BigqueryV2::QueryRequest] query_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryV2::QueryResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryV2::QueryResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def query_job(project_id, query_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'projects/{projectId}/queries', options)
          command.request_representation = Google::Apis::BigqueryV2::QueryRequest::Representation
          command.request_object = query_request_object
          command.response_representation = Google::Apis::BigqueryV2::QueryResponse::Representation
          command.response_class = Google::Apis::BigqueryV2::QueryResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the model specified by modelId from the dataset.
        # @param [String] project_id
        #   Required. Project ID of the model to delete.
        # @param [String] dataset_id
        #   Required. Dataset ID of the model to delete.
        # @param [String] model_id
        #   Required. Model ID of the model to delete.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_model(project_id, dataset_id, model_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'projects/{+projectId}/datasets/{+datasetId}/models/{+modelId}', options)
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['datasetId'] = dataset_id unless dataset_id.nil?
          command.params['modelId'] = model_id unless model_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the specified model resource by model ID.
        # @param [String] project_id
        #   Required. Project ID of the requested model.
        # @param [String] dataset_id
        #   Required. Dataset ID of the requested model.
        # @param [String] model_id
        #   Required. Model ID of the requested model.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryV2::Model] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryV2::Model]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_model(project_id, dataset_id, model_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'projects/{+projectId}/datasets/{+datasetId}/models/{+modelId}', options)
          command.response_representation = Google::Apis::BigqueryV2::Model::Representation
          command.response_class = Google::Apis::BigqueryV2::Model
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['datasetId'] = dataset_id unless dataset_id.nil?
          command.params['modelId'] = model_id unless model_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all models in the specified dataset. Requires the READER dataset
        # role.
        # @param [String] project_id
        #   Required. Project ID of the models to list.
        # @param [String] dataset_id
        #   Required. Dataset ID of the models to list.
        # @param [Fixnum] max_results
        #   The maximum number of results to return in a single response page.
        #   Leverage the page tokens to iterate through the entire collection.
        # @param [String] page_token
        #   Page token, returned by a previous call to request the next page of
        #   results
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryV2::ListModelsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryV2::ListModelsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_models(project_id, dataset_id, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'projects/{+projectId}/datasets/{+datasetId}/models', options)
          command.response_representation = Google::Apis::BigqueryV2::ListModelsResponse::Representation
          command.response_class = Google::Apis::BigqueryV2::ListModelsResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['datasetId'] = dataset_id unless dataset_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Patch specific fields in the specified model.
        # @param [String] project_id
        #   Required. Project ID of the model to patch.
        # @param [String] dataset_id
        #   Required. Dataset ID of the model to patch.
        # @param [String] model_id
        #   Required. Model ID of the model to patch.
        # @param [Google::Apis::BigqueryV2::Model] model_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryV2::Model] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryV2::Model]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_model(project_id, dataset_id, model_id, model_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'projects/{+projectId}/datasets/{+datasetId}/models/{+modelId}', options)
          command.request_representation = Google::Apis::BigqueryV2::Model::Representation
          command.request_object = model_object
          command.response_representation = Google::Apis::BigqueryV2::Model::Representation
          command.response_class = Google::Apis::BigqueryV2::Model
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['datasetId'] = dataset_id unless dataset_id.nil?
          command.params['modelId'] = model_id unless model_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the email address of the service account for your project used for
        # interactions with Google Cloud KMS.
        # @param [String] project_id
        #   Project ID for which the service account is requested.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryV2::GetServiceAccountResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryV2::GetServiceAccountResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_service_account(project_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'projects/{projectId}/serviceAccount', options)
          command.response_representation = Google::Apis::BigqueryV2::GetServiceAccountResponse::Representation
          command.response_class = Google::Apis::BigqueryV2::GetServiceAccountResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all projects to which you have been granted any project role.
        # @param [Fixnum] max_results
        #   Maximum number of results to return
        # @param [String] page_token
        #   Page token, returned by a previous call, to request the next page of results
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryV2::ProjectList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryV2::ProjectList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_projects(max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'projects', options)
          command.response_representation = Google::Apis::BigqueryV2::ProjectList::Representation
          command.response_class = Google::Apis::BigqueryV2::ProjectList
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the routine specified by routineId from the dataset.
        # @param [String] project_id
        #   Required. Project ID of the routine to delete
        # @param [String] dataset_id
        #   Required. Dataset ID of the routine to delete
        # @param [String] routine_id
        #   Required. Routine ID of the routine to delete
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_routine(project_id, dataset_id, routine_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'projects/{+projectId}/datasets/{+datasetId}/routines/{+routineId}', options)
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['datasetId'] = dataset_id unless dataset_id.nil?
          command.params['routineId'] = routine_id unless routine_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the specified routine resource by routine ID.
        # @param [String] project_id
        #   Required. Project ID of the requested routine
        # @param [String] dataset_id
        #   Required. Dataset ID of the requested routine
        # @param [String] routine_id
        #   Required. Routine ID of the requested routine
        # @param [String] field_mask
        #   If set, only the Routine fields in the field mask are returned in the
        #   response. If unset, all Routine fields are returned.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryV2::Routine] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryV2::Routine]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_routine(project_id, dataset_id, routine_id, field_mask: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'projects/{+projectId}/datasets/{+datasetId}/routines/{+routineId}', options)
          command.response_representation = Google::Apis::BigqueryV2::Routine::Representation
          command.response_class = Google::Apis::BigqueryV2::Routine
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['datasetId'] = dataset_id unless dataset_id.nil?
          command.params['routineId'] = routine_id unless routine_id.nil?
          command.query['fieldMask'] = field_mask unless field_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new routine in the dataset.
        # @param [String] project_id
        #   Required. Project ID of the new routine
        # @param [String] dataset_id
        #   Required. Dataset ID of the new routine
        # @param [Google::Apis::BigqueryV2::Routine] routine_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryV2::Routine] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryV2::Routine]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_routine(project_id, dataset_id, routine_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'projects/{+projectId}/datasets/{+datasetId}/routines', options)
          command.request_representation = Google::Apis::BigqueryV2::Routine::Representation
          command.request_object = routine_object
          command.response_representation = Google::Apis::BigqueryV2::Routine::Representation
          command.response_class = Google::Apis::BigqueryV2::Routine
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['datasetId'] = dataset_id unless dataset_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all routines in the specified dataset. Requires the READER dataset
        # role.
        # @param [String] project_id
        #   Required. Project ID of the routines to list
        # @param [String] dataset_id
        #   Required. Dataset ID of the routines to list
        # @param [Fixnum] max_results
        #   The maximum number of results to return in a single response page.
        #   Leverage the page tokens to iterate through the entire collection.
        # @param [String] page_token
        #   Page token, returned by a previous call, to request the next page of
        #   results
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryV2::ListRoutinesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryV2::ListRoutinesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_routines(project_id, dataset_id, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'projects/{+projectId}/datasets/{+datasetId}/routines', options)
          command.response_representation = Google::Apis::BigqueryV2::ListRoutinesResponse::Representation
          command.response_class = Google::Apis::BigqueryV2::ListRoutinesResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['datasetId'] = dataset_id unless dataset_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates information in an existing routine. The update method replaces the
        # entire Routine resource.
        # @param [String] project_id
        #   Required. Project ID of the routine to update
        # @param [String] dataset_id
        #   Required. Dataset ID of the routine to update
        # @param [String] routine_id
        #   Required. Routine ID of the routine to update
        # @param [Google::Apis::BigqueryV2::Routine] routine_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryV2::Routine] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryV2::Routine]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_routine(project_id, dataset_id, routine_id, routine_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'projects/{+projectId}/datasets/{+datasetId}/routines/{+routineId}', options)
          command.request_representation = Google::Apis::BigqueryV2::Routine::Representation
          command.request_object = routine_object
          command.response_representation = Google::Apis::BigqueryV2::Routine::Representation
          command.response_class = Google::Apis::BigqueryV2::Routine
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['datasetId'] = dataset_id unless dataset_id.nil?
          command.params['routineId'] = routine_id unless routine_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Streams data into BigQuery one record at a time without needing to run a load
        # job. Requires the WRITER dataset role.
        # @param [String] project_id
        #   Project ID of the destination table.
        # @param [String] dataset_id
        #   Dataset ID of the destination table.
        # @param [String] table_id
        #   Table ID of the destination table.
        # @param [Google::Apis::BigqueryV2::InsertAllTableDataRequest] insert_all_table_data_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryV2::InsertAllTableDataResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryV2::InsertAllTableDataResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_all_table_data(project_id, dataset_id, table_id, insert_all_table_data_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'projects/{projectId}/datasets/{datasetId}/tables/{tableId}/insertAll', options)
          command.request_representation = Google::Apis::BigqueryV2::InsertAllTableDataRequest::Representation
          command.request_object = insert_all_table_data_request_object
          command.response_representation = Google::Apis::BigqueryV2::InsertAllTableDataResponse::Representation
          command.response_class = Google::Apis::BigqueryV2::InsertAllTableDataResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['datasetId'] = dataset_id unless dataset_id.nil?
          command.params['tableId'] = table_id unless table_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves table data from a specified set of rows. Requires the READER dataset
        # role.
        # @param [String] project_id
        #   Project ID of the table to read
        # @param [String] dataset_id
        #   Dataset ID of the table to read
        # @param [String] table_id
        #   Table ID of the table to read
        # @param [Fixnum] max_results
        #   Maximum number of results to return
        # @param [String] page_token
        #   Page token, returned by a previous call, identifying the result set
        # @param [String] selected_fields
        #   List of fields to return (comma-separated). If unspecified, all fields are
        #   returned
        # @param [Fixnum] start_index
        #   Zero-based index of the starting row to read
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryV2::TableDataList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryV2::TableDataList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_table_data(project_id, dataset_id, table_id, max_results: nil, page_token: nil, selected_fields: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'projects/{projectId}/datasets/{datasetId}/tables/{tableId}/data', options)
          command.response_representation = Google::Apis::BigqueryV2::TableDataList::Representation
          command.response_class = Google::Apis::BigqueryV2::TableDataList
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['datasetId'] = dataset_id unless dataset_id.nil?
          command.params['tableId'] = table_id unless table_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['selectedFields'] = selected_fields unless selected_fields.nil?
          command.query['startIndex'] = start_index unless start_index.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the table specified by tableId from the dataset. If the table contains
        # data, all the data will be deleted.
        # @param [String] project_id
        #   Project ID of the table to delete
        # @param [String] dataset_id
        #   Dataset ID of the table to delete
        # @param [String] table_id
        #   Table ID of the table to delete
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_table(project_id, dataset_id, table_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'projects/{projectId}/datasets/{datasetId}/tables/{tableId}', options)
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['datasetId'] = dataset_id unless dataset_id.nil?
          command.params['tableId'] = table_id unless table_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the specified table resource by table ID. This method does not return the
        # data in the table, it only returns the table resource, which describes the
        # structure of this table.
        # @param [String] project_id
        #   Project ID of the requested table
        # @param [String] dataset_id
        #   Dataset ID of the requested table
        # @param [String] table_id
        #   Table ID of the requested table
        # @param [String] selected_fields
        #   List of fields to return (comma-separated). If unspecified, all fields are
        #   returned
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryV2::Table] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryV2::Table]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_table(project_id, dataset_id, table_id, selected_fields: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'projects/{projectId}/datasets/{datasetId}/tables/{tableId}', options)
          command.response_representation = Google::Apis::BigqueryV2::Table::Representation
          command.response_class = Google::Apis::BigqueryV2::Table
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['datasetId'] = dataset_id unless dataset_id.nil?
          command.params['tableId'] = table_id unless table_id.nil?
          command.query['selectedFields'] = selected_fields unless selected_fields.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new, empty table in the dataset.
        # @param [String] project_id
        #   Project ID of the new table
        # @param [String] dataset_id
        #   Dataset ID of the new table
        # @param [Google::Apis::BigqueryV2::Table] table_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryV2::Table] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryV2::Table]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_table(project_id, dataset_id, table_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'projects/{projectId}/datasets/{datasetId}/tables', options)
          command.request_representation = Google::Apis::BigqueryV2::Table::Representation
          command.request_object = table_object
          command.response_representation = Google::Apis::BigqueryV2::Table::Representation
          command.response_class = Google::Apis::BigqueryV2::Table
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['datasetId'] = dataset_id unless dataset_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all tables in the specified dataset. Requires the READER dataset role.
        # @param [String] project_id
        #   Project ID of the tables to list
        # @param [String] dataset_id
        #   Dataset ID of the tables to list
        # @param [Fixnum] max_results
        #   Maximum number of results to return
        # @param [String] page_token
        #   Page token, returned by a previous call, to request the next page of results
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryV2::TableList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryV2::TableList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_tables(project_id, dataset_id, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'projects/{projectId}/datasets/{datasetId}/tables', options)
          command.response_representation = Google::Apis::BigqueryV2::TableList::Representation
          command.response_class = Google::Apis::BigqueryV2::TableList
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['datasetId'] = dataset_id unless dataset_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates information in an existing table. The update method replaces the
        # entire table resource, whereas the patch method only replaces fields that are
        # provided in the submitted table resource. This method supports patch semantics.
        # @param [String] project_id
        #   Project ID of the table to update
        # @param [String] dataset_id
        #   Dataset ID of the table to update
        # @param [String] table_id
        #   Table ID of the table to update
        # @param [Google::Apis::BigqueryV2::Table] table_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryV2::Table] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryV2::Table]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_table(project_id, dataset_id, table_id, table_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'projects/{projectId}/datasets/{datasetId}/tables/{tableId}', options)
          command.request_representation = Google::Apis::BigqueryV2::Table::Representation
          command.request_object = table_object
          command.response_representation = Google::Apis::BigqueryV2::Table::Representation
          command.response_class = Google::Apis::BigqueryV2::Table
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['datasetId'] = dataset_id unless dataset_id.nil?
          command.params['tableId'] = table_id unless table_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates information in an existing table. The update method replaces the
        # entire table resource, whereas the patch method only replaces fields that are
        # provided in the submitted table resource.
        # @param [String] project_id
        #   Project ID of the table to update
        # @param [String] dataset_id
        #   Dataset ID of the table to update
        # @param [String] table_id
        #   Table ID of the table to update
        # @param [Google::Apis::BigqueryV2::Table] table_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryV2::Table] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryV2::Table]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_table(project_id, dataset_id, table_id, table_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'projects/{projectId}/datasets/{datasetId}/tables/{tableId}', options)
          command.request_representation = Google::Apis::BigqueryV2::Table::Representation
          command.request_object = table_object
          command.response_representation = Google::Apis::BigqueryV2::Table::Representation
          command.response_class = Google::Apis::BigqueryV2::Table
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['datasetId'] = dataset_id unless dataset_id.nil?
          command.params['tableId'] = table_id unless table_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end

        protected

        def apply_command_defaults(command)
          command.query['key'] = key unless key.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
        end
      end
    end
  end
end
