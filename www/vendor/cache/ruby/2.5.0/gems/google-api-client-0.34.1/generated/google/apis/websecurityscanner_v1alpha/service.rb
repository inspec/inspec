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
    module WebsecurityscannerV1alpha
      # Web Security Scanner API
      #
      # Scans your Compute and App Engine apps for common web vulnerabilities.
      #
      # @example
      #    require 'google/apis/websecurityscanner_v1alpha'
      #
      #    Websecurityscanner = Google::Apis::WebsecurityscannerV1alpha # Alias the module
      #    service = Websecurityscanner::WebSecurityScannerService.new
      #
      # @see https://cloud.google.com/security-scanner/
      class WebSecurityScannerService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://websecurityscanner.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Creates a new ScanConfig.
        # @param [String] parent
        #   Required. The parent resource name where the scan is created, which should be
        #   a
        #   project resource name in the format 'projects/`projectId`'.
        # @param [Google::Apis::WebsecurityscannerV1alpha::ScanConfig] scan_config_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::WebsecurityscannerV1alpha::ScanConfig] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::WebsecurityscannerV1alpha::ScanConfig]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_scan_config(parent, scan_config_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1alpha/{+parent}/scanConfigs', options)
          command.request_representation = Google::Apis::WebsecurityscannerV1alpha::ScanConfig::Representation
          command.request_object = scan_config_object
          command.response_representation = Google::Apis::WebsecurityscannerV1alpha::ScanConfig::Representation
          command.response_class = Google::Apis::WebsecurityscannerV1alpha::ScanConfig
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes an existing ScanConfig and its child resources.
        # @param [String] name
        #   Required. The resource name of the ScanConfig to be deleted. The name follows
        #   the
        #   format of 'projects/`projectId`/scanConfigs/`scanConfigId`'.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::WebsecurityscannerV1alpha::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::WebsecurityscannerV1alpha::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_scan_config(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1alpha/{+name}', options)
          command.response_representation = Google::Apis::WebsecurityscannerV1alpha::Empty::Representation
          command.response_class = Google::Apis::WebsecurityscannerV1alpha::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a ScanConfig.
        # @param [String] name
        #   Required. The resource name of the ScanConfig to be returned. The name follows
        #   the
        #   format of 'projects/`projectId`/scanConfigs/`scanConfigId`'.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::WebsecurityscannerV1alpha::ScanConfig] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::WebsecurityscannerV1alpha::ScanConfig]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_scan_config(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha/{+name}', options)
          command.response_representation = Google::Apis::WebsecurityscannerV1alpha::ScanConfig::Representation
          command.response_class = Google::Apis::WebsecurityscannerV1alpha::ScanConfig
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists ScanConfigs under a given project.
        # @param [String] parent
        #   Required. The parent resource name, which should be a project resource name in
        #   the
        #   format 'projects/`projectId`'.
        # @param [Fixnum] page_size
        #   The maximum number of ScanConfigs to return, can be limited by server.
        #   If not specified or not positive, the implementation will select a
        #   reasonable value.
        # @param [String] page_token
        #   A token identifying a page of results to be returned. This should be a
        #   `next_page_token` value returned from a previous List request.
        #   If unspecified, the first page of results is returned.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::WebsecurityscannerV1alpha::ListScanConfigsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::WebsecurityscannerV1alpha::ListScanConfigsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_scan_configs(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha/{+parent}/scanConfigs', options)
          command.response_representation = Google::Apis::WebsecurityscannerV1alpha::ListScanConfigsResponse::Representation
          command.response_class = Google::Apis::WebsecurityscannerV1alpha::ListScanConfigsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a ScanConfig. This method support partial update of a ScanConfig.
        # @param [String] name
        #   The resource name of the ScanConfig. The name follows the format of
        #   'projects/`projectId`/scanConfigs/`scanConfigId`'. The ScanConfig IDs are
        #   generated by the system.
        # @param [Google::Apis::WebsecurityscannerV1alpha::ScanConfig] scan_config_object
        # @param [String] update_mask
        #   Required. The update mask applies to the resource. For the `FieldMask`
        #   definition,
        #   see
        #   https://developers.google.com/protocol-buffers/docs/reference/google.protobuf#
        #   fieldmask
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::WebsecurityscannerV1alpha::ScanConfig] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::WebsecurityscannerV1alpha::ScanConfig]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_scan_config(name, scan_config_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1alpha/{+name}', options)
          command.request_representation = Google::Apis::WebsecurityscannerV1alpha::ScanConfig::Representation
          command.request_object = scan_config_object
          command.response_representation = Google::Apis::WebsecurityscannerV1alpha::ScanConfig::Representation
          command.response_class = Google::Apis::WebsecurityscannerV1alpha::ScanConfig
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Start a ScanRun according to the given ScanConfig.
        # @param [String] name
        #   Required. The resource name of the ScanConfig to be used. The name follows the
        #   format of 'projects/`projectId`/scanConfigs/`scanConfigId`'.
        # @param [Google::Apis::WebsecurityscannerV1alpha::StartScanRunRequest] start_scan_run_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::WebsecurityscannerV1alpha::ScanRun] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::WebsecurityscannerV1alpha::ScanRun]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def start_scan_config_scan_run(name, start_scan_run_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1alpha/{+name}:start', options)
          command.request_representation = Google::Apis::WebsecurityscannerV1alpha::StartScanRunRequest::Representation
          command.request_object = start_scan_run_request_object
          command.response_representation = Google::Apis::WebsecurityscannerV1alpha::ScanRun::Representation
          command.response_class = Google::Apis::WebsecurityscannerV1alpha::ScanRun
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a ScanRun.
        # @param [String] name
        #   Required. The resource name of the ScanRun to be returned. The name follows
        #   the
        #   format of
        #   'projects/`projectId`/scanConfigs/`scanConfigId`/scanRuns/`scanRunId`'.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::WebsecurityscannerV1alpha::ScanRun] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::WebsecurityscannerV1alpha::ScanRun]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_scan_config_scan_run(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha/{+name}', options)
          command.response_representation = Google::Apis::WebsecurityscannerV1alpha::ScanRun::Representation
          command.response_class = Google::Apis::WebsecurityscannerV1alpha::ScanRun
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists ScanRuns under a given ScanConfig, in descending order of ScanRun
        # stop time.
        # @param [String] parent
        #   Required. The parent resource name, which should be a scan resource name in
        #   the
        #   format 'projects/`projectId`/scanConfigs/`scanConfigId`'.
        # @param [Fixnum] page_size
        #   The maximum number of ScanRuns to return, can be limited by server.
        #   If not specified or not positive, the implementation will select a
        #   reasonable value.
        # @param [String] page_token
        #   A token identifying a page of results to be returned. This should be a
        #   `next_page_token` value returned from a previous List request.
        #   If unspecified, the first page of results is returned.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::WebsecurityscannerV1alpha::ListScanRunsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::WebsecurityscannerV1alpha::ListScanRunsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_scan_config_scan_runs(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha/{+parent}/scanRuns', options)
          command.response_representation = Google::Apis::WebsecurityscannerV1alpha::ListScanRunsResponse::Representation
          command.response_class = Google::Apis::WebsecurityscannerV1alpha::ListScanRunsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Stops a ScanRun. The stopped ScanRun is returned.
        # @param [String] name
        #   Required. The resource name of the ScanRun to be stopped. The name follows the
        #   format of
        #   'projects/`projectId`/scanConfigs/`scanConfigId`/scanRuns/`scanRunId`'.
        # @param [Google::Apis::WebsecurityscannerV1alpha::StopScanRunRequest] stop_scan_run_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::WebsecurityscannerV1alpha::ScanRun] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::WebsecurityscannerV1alpha::ScanRun]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def stop_scan_run(name, stop_scan_run_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1alpha/{+name}:stop', options)
          command.request_representation = Google::Apis::WebsecurityscannerV1alpha::StopScanRunRequest::Representation
          command.request_object = stop_scan_run_request_object
          command.response_representation = Google::Apis::WebsecurityscannerV1alpha::ScanRun::Representation
          command.response_class = Google::Apis::WebsecurityscannerV1alpha::ScanRun
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List CrawledUrls under a given ScanRun.
        # @param [String] parent
        #   Required. The parent resource name, which should be a scan run resource name
        #   in the
        #   format
        #   'projects/`projectId`/scanConfigs/`scanConfigId`/scanRuns/`scanRunId`'.
        # @param [Fixnum] page_size
        #   The maximum number of CrawledUrls to return, can be limited by server.
        #   If not specified or not positive, the implementation will select a
        #   reasonable value.
        # @param [String] page_token
        #   A token identifying a page of results to be returned. This should be a
        #   `next_page_token` value returned from a previous List request.
        #   If unspecified, the first page of results is returned.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::WebsecurityscannerV1alpha::ListCrawledUrlsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::WebsecurityscannerV1alpha::ListCrawledUrlsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_scan_config_scan_run_crawled_urls(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha/{+parent}/crawledUrls', options)
          command.response_representation = Google::Apis::WebsecurityscannerV1alpha::ListCrawledUrlsResponse::Representation
          command.response_class = Google::Apis::WebsecurityscannerV1alpha::ListCrawledUrlsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all FindingTypeStats under a given ScanRun.
        # @param [String] parent
        #   Required. The parent resource name, which should be a scan run resource name
        #   in the
        #   format
        #   'projects/`projectId`/scanConfigs/`scanConfigId`/scanRuns/`scanRunId`'.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::WebsecurityscannerV1alpha::ListFindingTypeStatsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::WebsecurityscannerV1alpha::ListFindingTypeStatsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_scan_config_scan_run_finding_type_stats(parent, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha/{+parent}/findingTypeStats', options)
          command.response_representation = Google::Apis::WebsecurityscannerV1alpha::ListFindingTypeStatsResponse::Representation
          command.response_class = Google::Apis::WebsecurityscannerV1alpha::ListFindingTypeStatsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a Finding.
        # @param [String] name
        #   Required. The resource name of the Finding to be returned. The name follows
        #   the
        #   format of
        #   'projects/`projectId`/scanConfigs/`scanConfigId`/scanRuns/`scanRunId`/findings/
        #   `findingId`'.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::WebsecurityscannerV1alpha::Finding] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::WebsecurityscannerV1alpha::Finding]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_scan_config_scan_run_finding(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha/{+name}', options)
          command.response_representation = Google::Apis::WebsecurityscannerV1alpha::Finding::Representation
          command.response_class = Google::Apis::WebsecurityscannerV1alpha::Finding
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List Findings under a given ScanRun.
        # @param [String] parent
        #   Required. The parent resource name, which should be a scan run resource name
        #   in the
        #   format
        #   'projects/`projectId`/scanConfigs/`scanConfigId`/scanRuns/`scanRunId`'.
        # @param [String] filter
        #   Required. The filter expression. The expression must be in the format: <field>
        #   <operator> <value>.
        #   Supported field: 'finding_type'.
        #   Supported operator: '='.
        # @param [Fixnum] page_size
        #   The maximum number of Findings to return, can be limited by server.
        #   If not specified or not positive, the implementation will select a
        #   reasonable value.
        # @param [String] page_token
        #   A token identifying a page of results to be returned. This should be a
        #   `next_page_token` value returned from a previous List request.
        #   If unspecified, the first page of results is returned.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::WebsecurityscannerV1alpha::ListFindingsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::WebsecurityscannerV1alpha::ListFindingsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_scan_config_scan_run_findings(parent, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha/{+parent}/findings', options)
          command.response_representation = Google::Apis::WebsecurityscannerV1alpha::ListFindingsResponse::Representation
          command.response_class = Google::Apis::WebsecurityscannerV1alpha::ListFindingsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['filter'] = filter unless filter.nil?
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
