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
    module DlpV2
      # Cloud Data Loss Prevention (DLP) API
      #
      # Provides methods for detection, risk analysis, and de-identification of
      #  privacy-sensitive fragments in text, images, and Google Cloud Platform storage
      #  repositories.
      #
      # @example
      #    require 'google/apis/dlp_v2'
      #
      #    Dlp = Google::Apis::DlpV2 # Alias the module
      #    service = Dlp::DLPService.new
      #
      # @see https://cloud.google.com/dlp/docs/
      class DLPService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://dlp.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Returns a list of the sensitive information types that the DLP API
        # supports. See https://cloud.google.com/dlp/docs/infotypes-reference to
        # learn more.
        # @param [String] filter
        #   Optional filter to only return infoTypes supported by certain parts of the
        #   API. Defaults to supported_by=INSPECT.
        # @param [String] language_code
        #   Optional BCP-47 language code for localized infoType friendly
        #   names. If omitted, or if localized strings are not available,
        #   en-US strings will be returned.
        # @param [String] location
        #   The geographic location to list info types. Reserved for future
        #   extensions.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2ListInfoTypesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2ListInfoTypesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_info_types(filter: nil, language_code: nil, location: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/infoTypes', options)
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2ListInfoTypesResponse::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2ListInfoTypesResponse
          command.query['filter'] = filter unless filter.nil?
          command.query['languageCode'] = language_code unless language_code.nil?
          command.query['location'] = location unless location.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of the sensitive information types that the DLP API
        # supports. See https://cloud.google.com/dlp/docs/infotypes-reference to
        # learn more.
        # @param [String] location
        #   The geographic location to list info types. Reserved for future
        #   extensions.
        # @param [String] filter
        #   Optional filter to only return infoTypes supported by certain parts of the
        #   API. Defaults to supported_by=INSPECT.
        # @param [String] language_code
        #   Optional BCP-47 language code for localized infoType friendly
        #   names. If omitted, or if localized strings are not available,
        #   en-US strings will be returned.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2ListInfoTypesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2ListInfoTypesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_location_info_types(location, filter: nil, language_code: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/locations/{location}/infoTypes', options)
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2ListInfoTypesResponse::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2ListInfoTypesResponse
          command.params['location'] = location unless location.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['languageCode'] = language_code unless language_code.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a DeidentifyTemplate for re-using frequently used configuration
        # for de-identifying content, images, and storage.
        # See https://cloud.google.com/dlp/docs/creating-templates-deid to learn
        # more.
        # @param [String] parent
        #   Required. The parent resource name, for example projects/my-project-id or
        #   organizations/my-org-id.
        # @param [Google::Apis::DlpV2::GooglePrivacyDlpV2CreateDeidentifyTemplateRequest] google_privacy_dlp_v2_create_deidentify_template_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyTemplate] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyTemplate]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_organization_deidentify_template(parent, google_privacy_dlp_v2_create_deidentify_template_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+parent}/deidentifyTemplates', options)
          command.request_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2CreateDeidentifyTemplateRequest::Representation
          command.request_object = google_privacy_dlp_v2_create_deidentify_template_request_object
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyTemplate::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyTemplate
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a DeidentifyTemplate.
        # See https://cloud.google.com/dlp/docs/creating-templates-deid to learn
        # more.
        # @param [String] name
        #   Required. Resource name of the organization and deidentify template to be
        #   deleted,
        #   for example `organizations/433245324/deidentifyTemplates/432452342` or
        #   projects/project-id/deidentifyTemplates/432452342.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GoogleProtobufEmpty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GoogleProtobufEmpty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_organization_deidentify_template(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2/{+name}', options)
          command.response_representation = Google::Apis::DlpV2::GoogleProtobufEmpty::Representation
          command.response_class = Google::Apis::DlpV2::GoogleProtobufEmpty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a DeidentifyTemplate.
        # See https://cloud.google.com/dlp/docs/creating-templates-deid to learn
        # more.
        # @param [String] name
        #   Required. Resource name of the organization and deidentify template to be read,
        #   for
        #   example `organizations/433245324/deidentifyTemplates/432452342` or
        #   projects/project-id/deidentifyTemplates/432452342.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyTemplate] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyTemplate]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_organization_deidentify_template(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+name}', options)
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyTemplate::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyTemplate
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists DeidentifyTemplates.
        # See https://cloud.google.com/dlp/docs/creating-templates-deid to learn
        # more.
        # @param [String] parent
        #   Required. The parent resource name, for example projects/my-project-id or
        #   organizations/my-org-id.
        # @param [String] order_by
        #   Optional comma separated list of fields to order by,
        #   followed by `asc` or `desc` postfix. This list is case-insensitive,
        #   default sorting order is ascending, redundant space characters are
        #   insignificant.
        #   Example: `name asc,update_time, create_time desc`
        #   Supported fields are:
        #   - `create_time`: corresponds to time the template was created.
        #   - `update_time`: corresponds to time the template was last updated.
        #   - `name`: corresponds to template's name.
        #   - `display_name`: corresponds to template's display name.
        # @param [Fixnum] page_size
        #   Optional size of the page, can be limited by server. If zero server returns
        #   a page of max size 100.
        # @param [String] page_token
        #   Optional page token to continue retrieval. Comes from previous call
        #   to `ListDeidentifyTemplates`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2ListDeidentifyTemplatesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2ListDeidentifyTemplatesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_organization_deidentify_templates(parent, order_by: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+parent}/deidentifyTemplates', options)
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2ListDeidentifyTemplatesResponse::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2ListDeidentifyTemplatesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the DeidentifyTemplate.
        # See https://cloud.google.com/dlp/docs/creating-templates-deid to learn
        # more.
        # @param [String] name
        #   Required. Resource name of organization and deidentify template to be updated,
        #   for
        #   example `organizations/433245324/deidentifyTemplates/432452342` or
        #   projects/project-id/deidentifyTemplates/432452342.
        # @param [Google::Apis::DlpV2::GooglePrivacyDlpV2UpdateDeidentifyTemplateRequest] google_privacy_dlp_v2_update_deidentify_template_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyTemplate] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyTemplate]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_organization_deidentify_template(name, google_privacy_dlp_v2_update_deidentify_template_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v2/{+name}', options)
          command.request_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2UpdateDeidentifyTemplateRequest::Representation
          command.request_object = google_privacy_dlp_v2_update_deidentify_template_request_object
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyTemplate::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyTemplate
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates an InspectTemplate for re-using frequently used configuration
        # for inspecting content, images, and storage.
        # See https://cloud.google.com/dlp/docs/creating-templates to learn more.
        # @param [String] parent
        #   Required. The parent resource name, for example projects/my-project-id or
        #   organizations/my-org-id.
        # @param [Google::Apis::DlpV2::GooglePrivacyDlpV2CreateInspectTemplateRequest] google_privacy_dlp_v2_create_inspect_template_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_organization_inspect_template(parent, google_privacy_dlp_v2_create_inspect_template_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+parent}/inspectTemplates', options)
          command.request_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2CreateInspectTemplateRequest::Representation
          command.request_object = google_privacy_dlp_v2_create_inspect_template_request_object
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes an InspectTemplate.
        # See https://cloud.google.com/dlp/docs/creating-templates to learn more.
        # @param [String] name
        #   Required. Resource name of the organization and inspectTemplate to be deleted,
        #   for
        #   example `organizations/433245324/inspectTemplates/432452342` or
        #   projects/project-id/inspectTemplates/432452342.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GoogleProtobufEmpty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GoogleProtobufEmpty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_organization_inspect_template(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2/{+name}', options)
          command.response_representation = Google::Apis::DlpV2::GoogleProtobufEmpty::Representation
          command.response_class = Google::Apis::DlpV2::GoogleProtobufEmpty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets an InspectTemplate.
        # See https://cloud.google.com/dlp/docs/creating-templates to learn more.
        # @param [String] name
        #   Required. Resource name of the organization and inspectTemplate to be read,
        #   for
        #   example `organizations/433245324/inspectTemplates/432452342` or
        #   projects/project-id/inspectTemplates/432452342.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_organization_inspect_template(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+name}', options)
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists InspectTemplates.
        # See https://cloud.google.com/dlp/docs/creating-templates to learn more.
        # @param [String] parent
        #   Required. The parent resource name, for example projects/my-project-id or
        #   organizations/my-org-id.
        # @param [String] order_by
        #   Optional comma separated list of fields to order by,
        #   followed by `asc` or `desc` postfix. This list is case-insensitive,
        #   default sorting order is ascending, redundant space characters are
        #   insignificant.
        #   Example: `name asc,update_time, create_time desc`
        #   Supported fields are:
        #   - `create_time`: corresponds to time the template was created.
        #   - `update_time`: corresponds to time the template was last updated.
        #   - `name`: corresponds to template's name.
        #   - `display_name`: corresponds to template's display name.
        # @param [Fixnum] page_size
        #   Optional size of the page, can be limited by server. If zero server returns
        #   a page of max size 100.
        # @param [String] page_token
        #   Optional page token to continue retrieval. Comes from previous call
        #   to `ListInspectTemplates`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2ListInspectTemplatesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2ListInspectTemplatesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_organization_inspect_templates(parent, order_by: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+parent}/inspectTemplates', options)
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2ListInspectTemplatesResponse::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2ListInspectTemplatesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the InspectTemplate.
        # See https://cloud.google.com/dlp/docs/creating-templates to learn more.
        # @param [String] name
        #   Required. Resource name of organization and inspectTemplate to be updated, for
        #   example `organizations/433245324/inspectTemplates/432452342` or
        #   projects/project-id/inspectTemplates/432452342.
        # @param [Google::Apis::DlpV2::GooglePrivacyDlpV2UpdateInspectTemplateRequest] google_privacy_dlp_v2_update_inspect_template_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_organization_inspect_template(name, google_privacy_dlp_v2_update_inspect_template_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v2/{+name}', options)
          command.request_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2UpdateInspectTemplateRequest::Representation
          command.request_object = google_privacy_dlp_v2_update_inspect_template_request_object
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a pre-built stored infoType to be used for inspection.
        # See https://cloud.google.com/dlp/docs/creating-stored-infotypes to
        # learn more.
        # @param [String] parent
        #   Required. The parent resource name, for example projects/my-project-id or
        #   organizations/my-org-id.
        # @param [Google::Apis::DlpV2::GooglePrivacyDlpV2CreateStoredInfoTypeRequest] google_privacy_dlp_v2_create_stored_info_type_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoType] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoType]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_organization_stored_info_type(parent, google_privacy_dlp_v2_create_stored_info_type_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+parent}/storedInfoTypes', options)
          command.request_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2CreateStoredInfoTypeRequest::Representation
          command.request_object = google_privacy_dlp_v2_create_stored_info_type_request_object
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoType::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoType
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a stored infoType.
        # See https://cloud.google.com/dlp/docs/creating-stored-infotypes to
        # learn more.
        # @param [String] name
        #   Required. Resource name of the organization and storedInfoType to be deleted,
        #   for
        #   example `organizations/433245324/storedInfoTypes/432452342` or
        #   projects/project-id/storedInfoTypes/432452342.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GoogleProtobufEmpty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GoogleProtobufEmpty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_organization_stored_info_type(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2/{+name}', options)
          command.response_representation = Google::Apis::DlpV2::GoogleProtobufEmpty::Representation
          command.response_class = Google::Apis::DlpV2::GoogleProtobufEmpty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a stored infoType.
        # See https://cloud.google.com/dlp/docs/creating-stored-infotypes to
        # learn more.
        # @param [String] name
        #   Required. Resource name of the organization and storedInfoType to be read, for
        #   example `organizations/433245324/storedInfoTypes/432452342` or
        #   projects/project-id/storedInfoTypes/432452342.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoType] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoType]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_organization_stored_info_type(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+name}', options)
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoType::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoType
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists stored infoTypes.
        # See https://cloud.google.com/dlp/docs/creating-stored-infotypes to
        # learn more.
        # @param [String] parent
        #   Required. The parent resource name, for example projects/my-project-id or
        #   organizations/my-org-id.
        # @param [String] order_by
        #   Optional comma separated list of fields to order by,
        #   followed by `asc` or `desc` postfix. This list is case-insensitive,
        #   default sorting order is ascending, redundant space characters are
        #   insignificant.
        #   Example: `name asc, display_name, create_time desc`
        #   Supported fields are:
        #   - `create_time`: corresponds to time the most recent version of the
        #   resource was created.
        #   - `state`: corresponds to the state of the resource.
        #   - `name`: corresponds to resource name.
        #   - `display_name`: corresponds to info type's display name.
        # @param [Fixnum] page_size
        #   Optional size of the page, can be limited by server. If zero server returns
        #   a page of max size 100.
        # @param [String] page_token
        #   Optional page token to continue retrieval. Comes from previous call
        #   to `ListStoredInfoTypes`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2ListStoredInfoTypesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2ListStoredInfoTypesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_organization_stored_info_types(parent, order_by: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+parent}/storedInfoTypes', options)
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2ListStoredInfoTypesResponse::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2ListStoredInfoTypesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the stored infoType by creating a new version. The existing version
        # will continue to be used until the new version is ready.
        # See https://cloud.google.com/dlp/docs/creating-stored-infotypes to
        # learn more.
        # @param [String] name
        #   Required. Resource name of organization and storedInfoType to be updated, for
        #   example `organizations/433245324/storedInfoTypes/432452342` or
        #   projects/project-id/storedInfoTypes/432452342.
        # @param [Google::Apis::DlpV2::GooglePrivacyDlpV2UpdateStoredInfoTypeRequest] google_privacy_dlp_v2_update_stored_info_type_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoType] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoType]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_organization_stored_info_type(name, google_privacy_dlp_v2_update_stored_info_type_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v2/{+name}', options)
          command.request_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2UpdateStoredInfoTypeRequest::Representation
          command.request_object = google_privacy_dlp_v2_update_stored_info_type_request_object
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoType::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoType
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # De-identifies potentially sensitive info from a ContentItem.
        # This method has limits on input size and output size.
        # See https://cloud.google.com/dlp/docs/deidentify-sensitive-data to
        # learn more.
        # When no InfoTypes or CustomInfoTypes are specified in this request, the
        # system will automatically choose what detectors to run. By default this may
        # be all types, but may change over time as detectors are updated.
        # @param [String] parent
        #   The parent resource name, for example projects/my-project-id.
        # @param [Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyContentRequest] google_privacy_dlp_v2_deidentify_content_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyContentResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyContentResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def deidentify_project_content(parent, google_privacy_dlp_v2_deidentify_content_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+parent}/content:deidentify', options)
          command.request_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyContentRequest::Representation
          command.request_object = google_privacy_dlp_v2_deidentify_content_request_object
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyContentResponse::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyContentResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Finds potentially sensitive info in content.
        # This method has limits on input size, processing time, and output size.
        # When no InfoTypes or CustomInfoTypes are specified in this request, the
        # system will automatically choose what detectors to run. By default this may
        # be all types, but may change over time as detectors are updated.
        # For how to guides, see https://cloud.google.com/dlp/docs/inspecting-images
        # and https://cloud.google.com/dlp/docs/inspecting-text,
        # @param [String] parent
        #   The parent resource name, for example projects/my-project-id.
        # @param [Google::Apis::DlpV2::GooglePrivacyDlpV2InspectContentRequest] google_privacy_dlp_v2_inspect_content_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2InspectContentResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InspectContentResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def inspect_project_content(parent, google_privacy_dlp_v2_inspect_content_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+parent}/content:inspect', options)
          command.request_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2InspectContentRequest::Representation
          command.request_object = google_privacy_dlp_v2_inspect_content_request_object
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2InspectContentResponse::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2InspectContentResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Re-identifies content that has been de-identified.
        # See
        # https://cloud.google.com/dlp/docs/pseudonymization#re-
        # identification_in_free_text_code_example
        # to learn more.
        # @param [String] parent
        #   Required. The parent resource name.
        # @param [Google::Apis::DlpV2::GooglePrivacyDlpV2ReidentifyContentRequest] google_privacy_dlp_v2_reidentify_content_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2ReidentifyContentResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2ReidentifyContentResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def reidentify_project_content(parent, google_privacy_dlp_v2_reidentify_content_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+parent}/content:reidentify', options)
          command.request_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2ReidentifyContentRequest::Representation
          command.request_object = google_privacy_dlp_v2_reidentify_content_request_object
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2ReidentifyContentResponse::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2ReidentifyContentResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a DeidentifyTemplate for re-using frequently used configuration
        # for de-identifying content, images, and storage.
        # See https://cloud.google.com/dlp/docs/creating-templates-deid to learn
        # more.
        # @param [String] parent
        #   Required. The parent resource name, for example projects/my-project-id or
        #   organizations/my-org-id.
        # @param [Google::Apis::DlpV2::GooglePrivacyDlpV2CreateDeidentifyTemplateRequest] google_privacy_dlp_v2_create_deidentify_template_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyTemplate] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyTemplate]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_deidentify_template(parent, google_privacy_dlp_v2_create_deidentify_template_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+parent}/deidentifyTemplates', options)
          command.request_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2CreateDeidentifyTemplateRequest::Representation
          command.request_object = google_privacy_dlp_v2_create_deidentify_template_request_object
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyTemplate::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyTemplate
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a DeidentifyTemplate.
        # See https://cloud.google.com/dlp/docs/creating-templates-deid to learn
        # more.
        # @param [String] name
        #   Required. Resource name of the organization and deidentify template to be
        #   deleted,
        #   for example `organizations/433245324/deidentifyTemplates/432452342` or
        #   projects/project-id/deidentifyTemplates/432452342.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GoogleProtobufEmpty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GoogleProtobufEmpty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_deidentify_template(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2/{+name}', options)
          command.response_representation = Google::Apis::DlpV2::GoogleProtobufEmpty::Representation
          command.response_class = Google::Apis::DlpV2::GoogleProtobufEmpty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a DeidentifyTemplate.
        # See https://cloud.google.com/dlp/docs/creating-templates-deid to learn
        # more.
        # @param [String] name
        #   Required. Resource name of the organization and deidentify template to be read,
        #   for
        #   example `organizations/433245324/deidentifyTemplates/432452342` or
        #   projects/project-id/deidentifyTemplates/432452342.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyTemplate] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyTemplate]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_deidentify_template(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+name}', options)
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyTemplate::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyTemplate
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists DeidentifyTemplates.
        # See https://cloud.google.com/dlp/docs/creating-templates-deid to learn
        # more.
        # @param [String] parent
        #   Required. The parent resource name, for example projects/my-project-id or
        #   organizations/my-org-id.
        # @param [String] order_by
        #   Optional comma separated list of fields to order by,
        #   followed by `asc` or `desc` postfix. This list is case-insensitive,
        #   default sorting order is ascending, redundant space characters are
        #   insignificant.
        #   Example: `name asc,update_time, create_time desc`
        #   Supported fields are:
        #   - `create_time`: corresponds to time the template was created.
        #   - `update_time`: corresponds to time the template was last updated.
        #   - `name`: corresponds to template's name.
        #   - `display_name`: corresponds to template's display name.
        # @param [Fixnum] page_size
        #   Optional size of the page, can be limited by server. If zero server returns
        #   a page of max size 100.
        # @param [String] page_token
        #   Optional page token to continue retrieval. Comes from previous call
        #   to `ListDeidentifyTemplates`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2ListDeidentifyTemplatesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2ListDeidentifyTemplatesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_deidentify_templates(parent, order_by: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+parent}/deidentifyTemplates', options)
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2ListDeidentifyTemplatesResponse::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2ListDeidentifyTemplatesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the DeidentifyTemplate.
        # See https://cloud.google.com/dlp/docs/creating-templates-deid to learn
        # more.
        # @param [String] name
        #   Required. Resource name of organization and deidentify template to be updated,
        #   for
        #   example `organizations/433245324/deidentifyTemplates/432452342` or
        #   projects/project-id/deidentifyTemplates/432452342.
        # @param [Google::Apis::DlpV2::GooglePrivacyDlpV2UpdateDeidentifyTemplateRequest] google_privacy_dlp_v2_update_deidentify_template_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyTemplate] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyTemplate]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_deidentify_template(name, google_privacy_dlp_v2_update_deidentify_template_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v2/{+name}', options)
          command.request_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2UpdateDeidentifyTemplateRequest::Representation
          command.request_object = google_privacy_dlp_v2_update_deidentify_template_request_object
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyTemplate::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyTemplate
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Starts asynchronous cancellation on a long-running DlpJob. The server
        # makes a best effort to cancel the DlpJob, but success is not
        # guaranteed.
        # See https://cloud.google.com/dlp/docs/inspecting-storage and
        # https://cloud.google.com/dlp/docs/compute-risk-analysis to learn more.
        # @param [String] name
        #   Required. The name of the DlpJob resource to be cancelled.
        # @param [Google::Apis::DlpV2::GooglePrivacyDlpV2CancelDlpJobRequest] google_privacy_dlp_v2_cancel_dlp_job_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GoogleProtobufEmpty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GoogleProtobufEmpty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def cancel_project_dlp_job(name, google_privacy_dlp_v2_cancel_dlp_job_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+name}:cancel', options)
          command.request_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2CancelDlpJobRequest::Representation
          command.request_object = google_privacy_dlp_v2_cancel_dlp_job_request_object
          command.response_representation = Google::Apis::DlpV2::GoogleProtobufEmpty::Representation
          command.response_class = Google::Apis::DlpV2::GoogleProtobufEmpty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new job to inspect storage or calculate risk metrics.
        # See https://cloud.google.com/dlp/docs/inspecting-storage and
        # https://cloud.google.com/dlp/docs/compute-risk-analysis to learn more.
        # When no InfoTypes or CustomInfoTypes are specified in inspect jobs, the
        # system will automatically choose what detectors to run. By default this may
        # be all types, but may change over time as detectors are updated.
        # @param [String] parent
        #   Required. The parent resource name, for example projects/my-project-id.
        # @param [Google::Apis::DlpV2::GooglePrivacyDlpV2CreateDlpJobRequest] google_privacy_dlp_v2_create_dlp_job_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2DlpJob] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2DlpJob]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_dlp_job(parent, google_privacy_dlp_v2_create_dlp_job_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+parent}/dlpJobs', options)
          command.request_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2CreateDlpJobRequest::Representation
          command.request_object = google_privacy_dlp_v2_create_dlp_job_request_object
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2DlpJob::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2DlpJob
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a long-running DlpJob. This method indicates that the client is
        # no longer interested in the DlpJob result. The job will be cancelled if
        # possible.
        # See https://cloud.google.com/dlp/docs/inspecting-storage and
        # https://cloud.google.com/dlp/docs/compute-risk-analysis to learn more.
        # @param [String] name
        #   Required. The name of the DlpJob resource to be deleted.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GoogleProtobufEmpty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GoogleProtobufEmpty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_dlp_job(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2/{+name}', options)
          command.response_representation = Google::Apis::DlpV2::GoogleProtobufEmpty::Representation
          command.response_class = Google::Apis::DlpV2::GoogleProtobufEmpty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the latest state of a long-running DlpJob.
        # See https://cloud.google.com/dlp/docs/inspecting-storage and
        # https://cloud.google.com/dlp/docs/compute-risk-analysis to learn more.
        # @param [String] name
        #   Required. The name of the DlpJob resource.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2DlpJob] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2DlpJob]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_dlp_job(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+name}', options)
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2DlpJob::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2DlpJob
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists DlpJobs that match the specified filter in the request.
        # See https://cloud.google.com/dlp/docs/inspecting-storage and
        # https://cloud.google.com/dlp/docs/compute-risk-analysis to learn more.
        # @param [String] parent
        #   Required. The parent resource name, for example projects/my-project-id.
        # @param [String] filter
        #   Optional. Allows filtering.
        #   Supported syntax:
        #   * Filter expressions are made up of one or more restrictions.
        #   * Restrictions can be combined by `AND` or `OR` logical operators. A
        #   sequence of restrictions implicitly uses `AND`.
        #   * A restriction has the form of `<field> <operator> <value>`.
        #   * Supported fields/values for inspect jobs:
        #   - `state` - PENDING|RUNNING|CANCELED|FINISHED|FAILED
        #   - `inspected_storage` - DATASTORE|CLOUD_STORAGE|BIGQUERY
        #   - `trigger_name` - The resource name of the trigger that created job.
        #   - 'end_time` - Corresponds to time the job finished.
        #   - 'start_time` - Corresponds to time the job finished.
        #   * Supported fields for risk analysis jobs:
        #   - `state` - RUNNING|CANCELED|FINISHED|FAILED
        #   - 'end_time` - Corresponds to time the job finished.
        #   - 'start_time` - Corresponds to time the job finished.
        #   * The operator must be `=` or `!=`.
        #   Examples:
        #   * inspected_storage = cloud_storage AND state = done
        #   * inspected_storage = cloud_storage OR inspected_storage = bigquery
        #   * inspected_storage = cloud_storage AND (state = done OR state = canceled)
        #   * end_time > \"2017-12-12T00:00:00+00:00\"
        #   The length of this field should be no more than 500 characters.
        # @param [String] order_by
        #   Optional comma separated list of fields to order by,
        #   followed by `asc` or `desc` postfix. This list is case-insensitive,
        #   default sorting order is ascending, redundant space characters are
        #   insignificant.
        #   Example: `name asc, end_time asc, create_time desc`
        #   Supported fields are:
        #   - `create_time`: corresponds to time the job was created.
        #   - `end_time`: corresponds to time the job ended.
        #   - `name`: corresponds to job's name.
        #   - `state`: corresponds to `state`
        # @param [Fixnum] page_size
        #   The standard list page size.
        # @param [String] page_token
        #   The standard list page token.
        # @param [String] type
        #   The type of job. Defaults to `DlpJobType.INSPECT`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2ListDlpJobsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2ListDlpJobsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_dlp_jobs(parent, filter: nil, order_by: nil, page_size: nil, page_token: nil, type: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+parent}/dlpJobs', options)
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2ListDlpJobsResponse::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2ListDlpJobsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['type'] = type unless type.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Redacts potentially sensitive info from an image.
        # This method has limits on input size, processing time, and output size.
        # See https://cloud.google.com/dlp/docs/redacting-sensitive-data-images to
        # learn more.
        # When no InfoTypes or CustomInfoTypes are specified in this request, the
        # system will automatically choose what detectors to run. By default this may
        # be all types, but may change over time as detectors are updated.
        # @param [String] parent
        #   The parent resource name, for example projects/my-project-id.
        # @param [Google::Apis::DlpV2::GooglePrivacyDlpV2RedactImageRequest] google_privacy_dlp_v2_redact_image_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2RedactImageResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2RedactImageResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def redact_project_image(parent, google_privacy_dlp_v2_redact_image_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+parent}/image:redact', options)
          command.request_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2RedactImageRequest::Representation
          command.request_object = google_privacy_dlp_v2_redact_image_request_object
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2RedactImageResponse::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2RedactImageResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates an InspectTemplate for re-using frequently used configuration
        # for inspecting content, images, and storage.
        # See https://cloud.google.com/dlp/docs/creating-templates to learn more.
        # @param [String] parent
        #   Required. The parent resource name, for example projects/my-project-id or
        #   organizations/my-org-id.
        # @param [Google::Apis::DlpV2::GooglePrivacyDlpV2CreateInspectTemplateRequest] google_privacy_dlp_v2_create_inspect_template_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_inspect_template(parent, google_privacy_dlp_v2_create_inspect_template_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+parent}/inspectTemplates', options)
          command.request_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2CreateInspectTemplateRequest::Representation
          command.request_object = google_privacy_dlp_v2_create_inspect_template_request_object
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes an InspectTemplate.
        # See https://cloud.google.com/dlp/docs/creating-templates to learn more.
        # @param [String] name
        #   Required. Resource name of the organization and inspectTemplate to be deleted,
        #   for
        #   example `organizations/433245324/inspectTemplates/432452342` or
        #   projects/project-id/inspectTemplates/432452342.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GoogleProtobufEmpty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GoogleProtobufEmpty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_inspect_template(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2/{+name}', options)
          command.response_representation = Google::Apis::DlpV2::GoogleProtobufEmpty::Representation
          command.response_class = Google::Apis::DlpV2::GoogleProtobufEmpty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets an InspectTemplate.
        # See https://cloud.google.com/dlp/docs/creating-templates to learn more.
        # @param [String] name
        #   Required. Resource name of the organization and inspectTemplate to be read,
        #   for
        #   example `organizations/433245324/inspectTemplates/432452342` or
        #   projects/project-id/inspectTemplates/432452342.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_inspect_template(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+name}', options)
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists InspectTemplates.
        # See https://cloud.google.com/dlp/docs/creating-templates to learn more.
        # @param [String] parent
        #   Required. The parent resource name, for example projects/my-project-id or
        #   organizations/my-org-id.
        # @param [String] order_by
        #   Optional comma separated list of fields to order by,
        #   followed by `asc` or `desc` postfix. This list is case-insensitive,
        #   default sorting order is ascending, redundant space characters are
        #   insignificant.
        #   Example: `name asc,update_time, create_time desc`
        #   Supported fields are:
        #   - `create_time`: corresponds to time the template was created.
        #   - `update_time`: corresponds to time the template was last updated.
        #   - `name`: corresponds to template's name.
        #   - `display_name`: corresponds to template's display name.
        # @param [Fixnum] page_size
        #   Optional size of the page, can be limited by server. If zero server returns
        #   a page of max size 100.
        # @param [String] page_token
        #   Optional page token to continue retrieval. Comes from previous call
        #   to `ListInspectTemplates`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2ListInspectTemplatesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2ListInspectTemplatesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_inspect_templates(parent, order_by: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+parent}/inspectTemplates', options)
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2ListInspectTemplatesResponse::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2ListInspectTemplatesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the InspectTemplate.
        # See https://cloud.google.com/dlp/docs/creating-templates to learn more.
        # @param [String] name
        #   Required. Resource name of organization and inspectTemplate to be updated, for
        #   example `organizations/433245324/inspectTemplates/432452342` or
        #   projects/project-id/inspectTemplates/432452342.
        # @param [Google::Apis::DlpV2::GooglePrivacyDlpV2UpdateInspectTemplateRequest] google_privacy_dlp_v2_update_inspect_template_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_inspect_template(name, google_privacy_dlp_v2_update_inspect_template_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v2/{+name}', options)
          command.request_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2UpdateInspectTemplateRequest::Representation
          command.request_object = google_privacy_dlp_v2_update_inspect_template_request_object
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2InspectTemplate
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Activate a job trigger. Causes the immediate execute of a trigger
        # instead of waiting on the trigger event to occur.
        # @param [String] name
        #   Required. Resource name of the trigger to activate, for example
        #   `projects/dlp-test-project/jobTriggers/53234423`.
        # @param [Google::Apis::DlpV2::GooglePrivacyDlpV2ActivateJobTriggerRequest] google_privacy_dlp_v2_activate_job_trigger_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2DlpJob] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2DlpJob]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def activate_project_job_trigger(name, google_privacy_dlp_v2_activate_job_trigger_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+name}:activate', options)
          command.request_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2ActivateJobTriggerRequest::Representation
          command.request_object = google_privacy_dlp_v2_activate_job_trigger_request_object
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2DlpJob::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2DlpJob
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a job trigger to run DLP actions such as scanning storage for
        # sensitive information on a set schedule.
        # See https://cloud.google.com/dlp/docs/creating-job-triggers to learn more.
        # @param [String] parent
        #   Required. The parent resource name, for example projects/my-project-id.
        # @param [Google::Apis::DlpV2::GooglePrivacyDlpV2CreateJobTriggerRequest] google_privacy_dlp_v2_create_job_trigger_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2JobTrigger] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2JobTrigger]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_job_trigger(parent, google_privacy_dlp_v2_create_job_trigger_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+parent}/jobTriggers', options)
          command.request_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2CreateJobTriggerRequest::Representation
          command.request_object = google_privacy_dlp_v2_create_job_trigger_request_object
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2JobTrigger::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2JobTrigger
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a job trigger.
        # See https://cloud.google.com/dlp/docs/creating-job-triggers to learn more.
        # @param [String] name
        #   Required. Resource name of the project and the triggeredJob, for example
        #   `projects/dlp-test-project/jobTriggers/53234423`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GoogleProtobufEmpty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GoogleProtobufEmpty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_job_trigger(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2/{+name}', options)
          command.response_representation = Google::Apis::DlpV2::GoogleProtobufEmpty::Representation
          command.response_class = Google::Apis::DlpV2::GoogleProtobufEmpty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a job trigger.
        # See https://cloud.google.com/dlp/docs/creating-job-triggers to learn more.
        # @param [String] name
        #   Required. Resource name of the project and the triggeredJob, for example
        #   `projects/dlp-test-project/jobTriggers/53234423`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2JobTrigger] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2JobTrigger]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_job_trigger(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+name}', options)
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2JobTrigger::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2JobTrigger
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists job triggers.
        # See https://cloud.google.com/dlp/docs/creating-job-triggers to learn more.
        # @param [String] parent
        #   Required. The parent resource name, for example `projects/my-project-id`.
        # @param [String] filter
        #   Optional. Allows filtering.
        #   Supported syntax:
        #   * Filter expressions are made up of one or more restrictions.
        #   * Restrictions can be combined by `AND` or `OR` logical operators. A
        #   sequence of restrictions implicitly uses `AND`.
        #   * A restriction has the form of `<field> <operator> <value>`.
        #   * Supported fields/values for inspect jobs:
        #   - `status` - HEALTHY|PAUSED|CANCELLED
        #   - `inspected_storage` - DATASTORE|CLOUD_STORAGE|BIGQUERY
        #   - 'last_run_time` - RFC 3339 formatted timestamp, surrounded by
        #   quotation marks. Nanoseconds are ignored.
        #   - 'error_count' - Number of errors that have occurred while running.
        #   * The operator must be `=` or `!=` for status and inspected_storage.
        #   Examples:
        #   * inspected_storage = cloud_storage AND status = HEALTHY
        #   * inspected_storage = cloud_storage OR inspected_storage = bigquery
        #   * inspected_storage = cloud_storage AND (state = PAUSED OR state = HEALTHY)
        #   * last_run_time > \"2017-12-12T00:00:00+00:00\"
        #   The length of this field should be no more than 500 characters.
        # @param [String] order_by
        #   Optional comma separated list of triggeredJob fields to order by,
        #   followed by `asc` or `desc` postfix. This list is case-insensitive,
        #   default sorting order is ascending, redundant space characters are
        #   insignificant.
        #   Example: `name asc,update_time, create_time desc`
        #   Supported fields are:
        #   - `create_time`: corresponds to time the JobTrigger was created.
        #   - `update_time`: corresponds to time the JobTrigger was last updated.
        #   - `last_run_time`: corresponds to the last time the JobTrigger ran.
        #   - `name`: corresponds to JobTrigger's name.
        #   - `display_name`: corresponds to JobTrigger's display name.
        #   - `status`: corresponds to JobTrigger's status.
        # @param [Fixnum] page_size
        #   Optional size of the page, can be limited by a server.
        # @param [String] page_token
        #   Optional page token to continue retrieval. Comes from previous call
        #   to ListJobTriggers. `order_by` field must not
        #   change for subsequent calls.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2ListJobTriggersResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2ListJobTriggersResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_job_triggers(parent, filter: nil, order_by: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+parent}/jobTriggers', options)
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2ListJobTriggersResponse::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2ListJobTriggersResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a job trigger.
        # See https://cloud.google.com/dlp/docs/creating-job-triggers to learn more.
        # @param [String] name
        #   Required. Resource name of the project and the triggeredJob, for example
        #   `projects/dlp-test-project/jobTriggers/53234423`.
        # @param [Google::Apis::DlpV2::GooglePrivacyDlpV2UpdateJobTriggerRequest] google_privacy_dlp_v2_update_job_trigger_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2JobTrigger] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2JobTrigger]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_job_trigger(name, google_privacy_dlp_v2_update_job_trigger_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v2/{+name}', options)
          command.request_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2UpdateJobTriggerRequest::Representation
          command.request_object = google_privacy_dlp_v2_update_job_trigger_request_object
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2JobTrigger::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2JobTrigger
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # De-identifies potentially sensitive info from a ContentItem.
        # This method has limits on input size and output size.
        # See https://cloud.google.com/dlp/docs/deidentify-sensitive-data to
        # learn more.
        # When no InfoTypes or CustomInfoTypes are specified in this request, the
        # system will automatically choose what detectors to run. By default this may
        # be all types, but may change over time as detectors are updated.
        # @param [String] parent
        #   The parent resource name, for example projects/my-project-id.
        # @param [String] location
        #   The geographic location to process de-identification. Reserved for future
        #   extensions.
        # @param [Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyContentRequest] google_privacy_dlp_v2_deidentify_content_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyContentResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyContentResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def deidentify_project_location_content(parent, location, google_privacy_dlp_v2_deidentify_content_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+parent}/locations/{location}/content:deidentify', options)
          command.request_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyContentRequest::Representation
          command.request_object = google_privacy_dlp_v2_deidentify_content_request_object
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyContentResponse::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2DeidentifyContentResponse
          command.params['parent'] = parent unless parent.nil?
          command.params['location'] = location unless location.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Finds potentially sensitive info in content.
        # This method has limits on input size, processing time, and output size.
        # When no InfoTypes or CustomInfoTypes are specified in this request, the
        # system will automatically choose what detectors to run. By default this may
        # be all types, but may change over time as detectors are updated.
        # For how to guides, see https://cloud.google.com/dlp/docs/inspecting-images
        # and https://cloud.google.com/dlp/docs/inspecting-text,
        # @param [String] parent
        #   The parent resource name, for example projects/my-project-id.
        # @param [String] location
        #   The geographic location to process content inspection. Reserved for future
        #   extensions.
        # @param [Google::Apis::DlpV2::GooglePrivacyDlpV2InspectContentRequest] google_privacy_dlp_v2_inspect_content_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2InspectContentResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2InspectContentResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def inspect_project_location_content(parent, location, google_privacy_dlp_v2_inspect_content_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+parent}/locations/{location}/content:inspect', options)
          command.request_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2InspectContentRequest::Representation
          command.request_object = google_privacy_dlp_v2_inspect_content_request_object
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2InspectContentResponse::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2InspectContentResponse
          command.params['parent'] = parent unless parent.nil?
          command.params['location'] = location unless location.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Re-identifies content that has been de-identified.
        # See
        # https://cloud.google.com/dlp/docs/pseudonymization#re-
        # identification_in_free_text_code_example
        # to learn more.
        # @param [String] parent
        #   Required. The parent resource name.
        # @param [String] location
        #   The geographic location to process content reidentification.  Reserved for
        #   future extensions.
        # @param [Google::Apis::DlpV2::GooglePrivacyDlpV2ReidentifyContentRequest] google_privacy_dlp_v2_reidentify_content_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2ReidentifyContentResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2ReidentifyContentResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def reidentify_project_location_content(parent, location, google_privacy_dlp_v2_reidentify_content_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+parent}/locations/{location}/content:reidentify', options)
          command.request_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2ReidentifyContentRequest::Representation
          command.request_object = google_privacy_dlp_v2_reidentify_content_request_object
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2ReidentifyContentResponse::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2ReidentifyContentResponse
          command.params['parent'] = parent unless parent.nil?
          command.params['location'] = location unless location.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Redacts potentially sensitive info from an image.
        # This method has limits on input size, processing time, and output size.
        # See https://cloud.google.com/dlp/docs/redacting-sensitive-data-images to
        # learn more.
        # When no InfoTypes or CustomInfoTypes are specified in this request, the
        # system will automatically choose what detectors to run. By default this may
        # be all types, but may change over time as detectors are updated.
        # @param [String] parent
        #   The parent resource name, for example projects/my-project-id.
        # @param [String] location
        #   The geographic location to process the request. Reserved for future
        #   extensions.
        # @param [Google::Apis::DlpV2::GooglePrivacyDlpV2RedactImageRequest] google_privacy_dlp_v2_redact_image_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2RedactImageResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2RedactImageResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def redact_project_location_image(parent, location, google_privacy_dlp_v2_redact_image_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+parent}/locations/{location}/image:redact', options)
          command.request_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2RedactImageRequest::Representation
          command.request_object = google_privacy_dlp_v2_redact_image_request_object
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2RedactImageResponse::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2RedactImageResponse
          command.params['parent'] = parent unless parent.nil?
          command.params['location'] = location unless location.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a pre-built stored infoType to be used for inspection.
        # See https://cloud.google.com/dlp/docs/creating-stored-infotypes to
        # learn more.
        # @param [String] parent
        #   Required. The parent resource name, for example projects/my-project-id or
        #   organizations/my-org-id.
        # @param [Google::Apis::DlpV2::GooglePrivacyDlpV2CreateStoredInfoTypeRequest] google_privacy_dlp_v2_create_stored_info_type_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoType] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoType]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_stored_info_type(parent, google_privacy_dlp_v2_create_stored_info_type_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+parent}/storedInfoTypes', options)
          command.request_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2CreateStoredInfoTypeRequest::Representation
          command.request_object = google_privacy_dlp_v2_create_stored_info_type_request_object
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoType::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoType
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a stored infoType.
        # See https://cloud.google.com/dlp/docs/creating-stored-infotypes to
        # learn more.
        # @param [String] name
        #   Required. Resource name of the organization and storedInfoType to be deleted,
        #   for
        #   example `organizations/433245324/storedInfoTypes/432452342` or
        #   projects/project-id/storedInfoTypes/432452342.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GoogleProtobufEmpty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GoogleProtobufEmpty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_stored_info_type(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2/{+name}', options)
          command.response_representation = Google::Apis::DlpV2::GoogleProtobufEmpty::Representation
          command.response_class = Google::Apis::DlpV2::GoogleProtobufEmpty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a stored infoType.
        # See https://cloud.google.com/dlp/docs/creating-stored-infotypes to
        # learn more.
        # @param [String] name
        #   Required. Resource name of the organization and storedInfoType to be read, for
        #   example `organizations/433245324/storedInfoTypes/432452342` or
        #   projects/project-id/storedInfoTypes/432452342.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoType] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoType]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_stored_info_type(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+name}', options)
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoType::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoType
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists stored infoTypes.
        # See https://cloud.google.com/dlp/docs/creating-stored-infotypes to
        # learn more.
        # @param [String] parent
        #   Required. The parent resource name, for example projects/my-project-id or
        #   organizations/my-org-id.
        # @param [String] order_by
        #   Optional comma separated list of fields to order by,
        #   followed by `asc` or `desc` postfix. This list is case-insensitive,
        #   default sorting order is ascending, redundant space characters are
        #   insignificant.
        #   Example: `name asc, display_name, create_time desc`
        #   Supported fields are:
        #   - `create_time`: corresponds to time the most recent version of the
        #   resource was created.
        #   - `state`: corresponds to the state of the resource.
        #   - `name`: corresponds to resource name.
        #   - `display_name`: corresponds to info type's display name.
        # @param [Fixnum] page_size
        #   Optional size of the page, can be limited by server. If zero server returns
        #   a page of max size 100.
        # @param [String] page_token
        #   Optional page token to continue retrieval. Comes from previous call
        #   to `ListStoredInfoTypes`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2ListStoredInfoTypesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2ListStoredInfoTypesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_stored_info_types(parent, order_by: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+parent}/storedInfoTypes', options)
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2ListStoredInfoTypesResponse::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2ListStoredInfoTypesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the stored infoType by creating a new version. The existing version
        # will continue to be used until the new version is ready.
        # See https://cloud.google.com/dlp/docs/creating-stored-infotypes to
        # learn more.
        # @param [String] name
        #   Required. Resource name of organization and storedInfoType to be updated, for
        #   example `organizations/433245324/storedInfoTypes/432452342` or
        #   projects/project-id/storedInfoTypes/432452342.
        # @param [Google::Apis::DlpV2::GooglePrivacyDlpV2UpdateStoredInfoTypeRequest] google_privacy_dlp_v2_update_stored_info_type_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoType] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoType]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_stored_info_type(name, google_privacy_dlp_v2_update_stored_info_type_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v2/{+name}', options)
          command.request_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2UpdateStoredInfoTypeRequest::Representation
          command.request_object = google_privacy_dlp_v2_update_stored_info_type_request_object
          command.response_representation = Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoType::Representation
          command.response_class = Google::Apis::DlpV2::GooglePrivacyDlpV2StoredInfoType
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
