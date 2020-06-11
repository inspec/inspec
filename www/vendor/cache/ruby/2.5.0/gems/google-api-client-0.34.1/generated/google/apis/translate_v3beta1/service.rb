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
    module TranslateV3beta1
      # Cloud Translation API
      #
      # Integrates text translation into your website or application.
      #
      # @example
      #    require 'google/apis/translate_v3beta1'
      #
      #    Translate = Google::Apis::TranslateV3beta1 # Alias the module
      #    service = Translate::TranslateService.new
      #
      # @see https://cloud.google.com/translate/docs/quickstarts
      class TranslateService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://translation.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Detects the language of text within a request.
        # @param [String] parent
        #   Required. Project or location to make a call. Must refer to a caller's
        #   project.
        #   Format: `projects/`project-number-or-id`/locations/`location-id`` or
        #   `projects/`project-number-or-id``.
        #   For global calls, use `projects/`project-number-or-id`/locations/global` or
        #   `projects/`project-number-or-id``.
        #   Only models within the same region (has same location-id) can be used.
        #   Otherwise an INVALID_ARGUMENT (400) error is returned.
        # @param [Google::Apis::TranslateV3beta1::DetectLanguageRequest] detect_language_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::TranslateV3beta1::DetectLanguageResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TranslateV3beta1::DetectLanguageResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def detect_project_language(parent, detect_language_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v3beta1/{+parent}:detectLanguage', options)
          command.request_representation = Google::Apis::TranslateV3beta1::DetectLanguageRequest::Representation
          command.request_object = detect_language_request_object
          command.response_representation = Google::Apis::TranslateV3beta1::DetectLanguageResponse::Representation
          command.response_class = Google::Apis::TranslateV3beta1::DetectLanguageResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of supported languages for translation.
        # @param [String] parent
        #   Required. Project or location to make a call. Must refer to a caller's
        #   project.
        #   Format: `projects/`project-number-or-id`` or
        #   `projects/`project-number-or-id`/locations/`location-id``.
        #   For global calls, use `projects/`project-number-or-id`/locations/global` or
        #   `projects/`project-number-or-id``.
        #   Non-global location is required for AutoML models.
        #   Only models within the same region (have same location-id) can be used,
        #   otherwise an INVALID_ARGUMENT (400) error is returned.
        # @param [String] display_language_code
        #   Optional. The language to use to return localized, human readable names
        #   of supported languages. If missing, then display names are not returned
        #   in a response.
        # @param [String] model
        #   Optional. Get supported languages of this model.
        #   The format depends on model type:
        #   - AutoML Translation models:
        #   `projects/`project-number-or-id`/locations/`location-id`/models/`model-id``
        #   - General (built-in) models:
        #   `projects/`project-number-or-id`/locations/`location-id`/models/general/nmt`,
        #   `projects/`project-number-or-id`/locations/`location-id`/models/general/base`
        #   Returns languages supported by the specified model.
        #   If missing, we get supported languages of Google general base (PBMT) model.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::TranslateV3beta1::SupportedLanguages] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TranslateV3beta1::SupportedLanguages]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_supported_languages(parent, display_language_code: nil, model: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v3beta1/{+parent}/supportedLanguages', options)
          command.response_representation = Google::Apis::TranslateV3beta1::SupportedLanguages::Representation
          command.response_class = Google::Apis::TranslateV3beta1::SupportedLanguages
          command.params['parent'] = parent unless parent.nil?
          command.query['displayLanguageCode'] = display_language_code unless display_language_code.nil?
          command.query['model'] = model unless model.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Translates input text and returns translated text.
        # @param [String] parent
        #   Required. Project or location to make a call. Must refer to a caller's
        #   project.
        #   Format: `projects/`project-number-or-id`` or
        #   `projects/`project-number-or-id`/locations/`location-id``.
        #   For global calls, use `projects/`project-number-or-id`/locations/global` or
        #   `projects/`project-number-or-id``.
        #   Non-global location is required for requests using AutoML models or
        #   custom glossaries.
        #   Models and glossaries must be within the same region (have same
        #   location-id), otherwise an INVALID_ARGUMENT (400) error is returned.
        # @param [Google::Apis::TranslateV3beta1::TranslateTextRequest] translate_text_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::TranslateV3beta1::TranslateTextResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TranslateV3beta1::TranslateTextResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def translate_project_text(parent, translate_text_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v3beta1/{+parent}:translateText', options)
          command.request_representation = Google::Apis::TranslateV3beta1::TranslateTextRequest::Representation
          command.request_object = translate_text_request_object
          command.response_representation = Google::Apis::TranslateV3beta1::TranslateTextResponse::Representation
          command.response_class = Google::Apis::TranslateV3beta1::TranslateTextResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Translates a large volume of text in asynchronous batch mode.
        # This function provides real-time output as the inputs are being processed.
        # If caller cancels a request, the partial results (for an input file, it's
        # all or nothing) may still be available on the specified output location.
        # This call returns immediately and you can
        # use google.longrunning.Operation.name to poll the status of the call.
        # @param [String] parent
        #   Required. Location to make a call. Must refer to a caller's project.
        #   Format: `projects/`project-number-or-id`/locations/`location-id``.
        #   The `global` location is not supported for batch translation.
        #   Only AutoML Translation models or glossaries within the same region (have
        #   the same location-id) can be used, otherwise an INVALID_ARGUMENT (400)
        #   error is returned.
        # @param [Google::Apis::TranslateV3beta1::BatchTranslateTextRequest] batch_translate_text_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::TranslateV3beta1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TranslateV3beta1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_location_translate_text(parent, batch_translate_text_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v3beta1/{+parent}:batchTranslateText', options)
          command.request_representation = Google::Apis::TranslateV3beta1::BatchTranslateTextRequest::Representation
          command.request_object = batch_translate_text_request_object
          command.response_representation = Google::Apis::TranslateV3beta1::Operation::Representation
          command.response_class = Google::Apis::TranslateV3beta1::Operation
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Detects the language of text within a request.
        # @param [String] parent
        #   Required. Project or location to make a call. Must refer to a caller's
        #   project.
        #   Format: `projects/`project-number-or-id`/locations/`location-id`` or
        #   `projects/`project-number-or-id``.
        #   For global calls, use `projects/`project-number-or-id`/locations/global` or
        #   `projects/`project-number-or-id``.
        #   Only models within the same region (has same location-id) can be used.
        #   Otherwise an INVALID_ARGUMENT (400) error is returned.
        # @param [Google::Apis::TranslateV3beta1::DetectLanguageRequest] detect_language_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::TranslateV3beta1::DetectLanguageResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TranslateV3beta1::DetectLanguageResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def detect_location_language(parent, detect_language_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v3beta1/{+parent}:detectLanguage', options)
          command.request_representation = Google::Apis::TranslateV3beta1::DetectLanguageRequest::Representation
          command.request_object = detect_language_request_object
          command.response_representation = Google::Apis::TranslateV3beta1::DetectLanguageResponse::Representation
          command.response_class = Google::Apis::TranslateV3beta1::DetectLanguageResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
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
        # @yieldparam result [Google::Apis::TranslateV3beta1::Location] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TranslateV3beta1::Location]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v3beta1/{+name}', options)
          command.response_representation = Google::Apis::TranslateV3beta1::Location::Representation
          command.response_class = Google::Apis::TranslateV3beta1::Location
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of supported languages for translation.
        # @param [String] parent
        #   Required. Project or location to make a call. Must refer to a caller's
        #   project.
        #   Format: `projects/`project-number-or-id`` or
        #   `projects/`project-number-or-id`/locations/`location-id``.
        #   For global calls, use `projects/`project-number-or-id`/locations/global` or
        #   `projects/`project-number-or-id``.
        #   Non-global location is required for AutoML models.
        #   Only models within the same region (have same location-id) can be used,
        #   otherwise an INVALID_ARGUMENT (400) error is returned.
        # @param [String] display_language_code
        #   Optional. The language to use to return localized, human readable names
        #   of supported languages. If missing, then display names are not returned
        #   in a response.
        # @param [String] model
        #   Optional. Get supported languages of this model.
        #   The format depends on model type:
        #   - AutoML Translation models:
        #   `projects/`project-number-or-id`/locations/`location-id`/models/`model-id``
        #   - General (built-in) models:
        #   `projects/`project-number-or-id`/locations/`location-id`/models/general/nmt`,
        #   `projects/`project-number-or-id`/locations/`location-id`/models/general/base`
        #   Returns languages supported by the specified model.
        #   If missing, we get supported languages of Google general base (PBMT) model.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::TranslateV3beta1::SupportedLanguages] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TranslateV3beta1::SupportedLanguages]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_supported_languages(parent, display_language_code: nil, model: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v3beta1/{+parent}/supportedLanguages', options)
          command.response_representation = Google::Apis::TranslateV3beta1::SupportedLanguages::Representation
          command.response_class = Google::Apis::TranslateV3beta1::SupportedLanguages
          command.params['parent'] = parent unless parent.nil?
          command.query['displayLanguageCode'] = display_language_code unless display_language_code.nil?
          command.query['model'] = model unless model.nil?
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
        # @yieldparam result [Google::Apis::TranslateV3beta1::ListLocationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TranslateV3beta1::ListLocationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_locations(name, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v3beta1/{+name}/locations', options)
          command.response_representation = Google::Apis::TranslateV3beta1::ListLocationsResponse::Representation
          command.response_class = Google::Apis::TranslateV3beta1::ListLocationsResponse
          command.params['name'] = name unless name.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Translates input text and returns translated text.
        # @param [String] parent
        #   Required. Project or location to make a call. Must refer to a caller's
        #   project.
        #   Format: `projects/`project-number-or-id`` or
        #   `projects/`project-number-or-id`/locations/`location-id``.
        #   For global calls, use `projects/`project-number-or-id`/locations/global` or
        #   `projects/`project-number-or-id``.
        #   Non-global location is required for requests using AutoML models or
        #   custom glossaries.
        #   Models and glossaries must be within the same region (have same
        #   location-id), otherwise an INVALID_ARGUMENT (400) error is returned.
        # @param [Google::Apis::TranslateV3beta1::TranslateTextRequest] translate_text_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::TranslateV3beta1::TranslateTextResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TranslateV3beta1::TranslateTextResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def translate_location_text(parent, translate_text_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v3beta1/{+parent}:translateText', options)
          command.request_representation = Google::Apis::TranslateV3beta1::TranslateTextRequest::Representation
          command.request_object = translate_text_request_object
          command.response_representation = Google::Apis::TranslateV3beta1::TranslateTextResponse::Representation
          command.response_class = Google::Apis::TranslateV3beta1::TranslateTextResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a glossary and returns the long-running operation. Returns
        # NOT_FOUND, if the project doesn't exist.
        # @param [String] parent
        #   Required. The project name.
        # @param [Google::Apis::TranslateV3beta1::Glossary] glossary_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::TranslateV3beta1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TranslateV3beta1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_location_glossary(parent, glossary_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v3beta1/{+parent}/glossaries', options)
          command.request_representation = Google::Apis::TranslateV3beta1::Glossary::Representation
          command.request_object = glossary_object
          command.response_representation = Google::Apis::TranslateV3beta1::Operation::Representation
          command.response_class = Google::Apis::TranslateV3beta1::Operation
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a glossary, or cancels glossary construction
        # if the glossary isn't created yet.
        # Returns NOT_FOUND, if the glossary doesn't exist.
        # @param [String] name
        #   Required. The name of the glossary to delete.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::TranslateV3beta1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TranslateV3beta1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_location_glossary(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v3beta1/{+name}', options)
          command.response_representation = Google::Apis::TranslateV3beta1::Operation::Representation
          command.response_class = Google::Apis::TranslateV3beta1::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a glossary. Returns NOT_FOUND, if the glossary doesn't
        # exist.
        # @param [String] name
        #   Required. The name of the glossary to retrieve.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::TranslateV3beta1::Glossary] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TranslateV3beta1::Glossary]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_glossary(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v3beta1/{+name}', options)
          command.response_representation = Google::Apis::TranslateV3beta1::Glossary::Representation
          command.response_class = Google::Apis::TranslateV3beta1::Glossary
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists glossaries in a project. Returns NOT_FOUND, if the project doesn't
        # exist.
        # @param [String] parent
        #   Required. The name of the project from which to list all of the glossaries.
        # @param [String] filter
        #   Optional. Filter specifying constraints of a list operation.
        #   Filtering is not supported yet, and the parameter currently has no effect.
        #   If missing, no filtering is performed.
        # @param [Fixnum] page_size
        #   Optional. Requested page size. The server may return fewer glossaries than
        #   requested. If unspecified, the server picks an appropriate default.
        # @param [String] page_token
        #   Optional. A token identifying a page of results the server should return.
        #   Typically, this is the value of [ListGlossariesResponse.next_page_token]
        #   returned from the previous call to `ListGlossaries` method.
        #   The first page is returned if `page_token`is empty or missing.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::TranslateV3beta1::ListGlossariesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TranslateV3beta1::ListGlossariesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_glossaries(parent, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v3beta1/{+parent}/glossaries', options)
          command.response_representation = Google::Apis::TranslateV3beta1::ListGlossariesResponse::Representation
          command.response_class = Google::Apis::TranslateV3beta1::ListGlossariesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Starts asynchronous cancellation on a long-running operation.  The server
        # makes a best effort to cancel the operation, but success is not
        # guaranteed.  If the server doesn't support this method, it returns
        # `google.rpc.Code.UNIMPLEMENTED`.  Clients can use
        # Operations.GetOperation or
        # other methods to check whether the cancellation succeeded or whether the
        # operation completed despite cancellation. On successful cancellation,
        # the operation is not deleted; instead, it becomes an operation with
        # an Operation.error value with a google.rpc.Status.code of 1,
        # corresponding to `Code.CANCELLED`.
        # @param [String] name
        #   The name of the operation resource to be cancelled.
        # @param [Google::Apis::TranslateV3beta1::CancelOperationRequest] cancel_operation_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::TranslateV3beta1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TranslateV3beta1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def cancel_operation(name, cancel_operation_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v3beta1/{+name}:cancel', options)
          command.request_representation = Google::Apis::TranslateV3beta1::CancelOperationRequest::Representation
          command.request_object = cancel_operation_request_object
          command.response_representation = Google::Apis::TranslateV3beta1::Empty::Representation
          command.response_class = Google::Apis::TranslateV3beta1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a long-running operation. This method indicates that the client is
        # no longer interested in the operation result. It does not cancel the
        # operation. If the server doesn't support this method, it returns
        # `google.rpc.Code.UNIMPLEMENTED`.
        # @param [String] name
        #   The name of the operation resource to be deleted.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::TranslateV3beta1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TranslateV3beta1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_location_operation(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v3beta1/{+name}', options)
          command.response_representation = Google::Apis::TranslateV3beta1::Empty::Representation
          command.response_class = Google::Apis::TranslateV3beta1::Empty
          command.params['name'] = name unless name.nil?
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
        # @yieldparam result [Google::Apis::TranslateV3beta1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TranslateV3beta1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_operation(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v3beta1/{+name}', options)
          command.response_representation = Google::Apis::TranslateV3beta1::Operation::Representation
          command.response_class = Google::Apis::TranslateV3beta1::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists operations that match the specified filter in the request. If the
        # server doesn't support this method, it returns `UNIMPLEMENTED`.
        # NOTE: the `name` binding allows API services to override the binding
        # to use different resource name schemes, such as `users/*/operations`. To
        # override the binding, API services can add a binding such as
        # `"/v1/`name=users/*`/operations"` to their service configuration.
        # For backwards compatibility, the default name includes the operations
        # collection id, however overriding users must ensure the name binding
        # is the parent resource, without the operations collection id.
        # @param [String] name
        #   The name of the operation's parent resource.
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
        # @yieldparam result [Google::Apis::TranslateV3beta1::ListOperationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TranslateV3beta1::ListOperationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_operations(name, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v3beta1/{+name}/operations', options)
          command.response_representation = Google::Apis::TranslateV3beta1::ListOperationsResponse::Representation
          command.response_class = Google::Apis::TranslateV3beta1::ListOperationsResponse
          command.params['name'] = name unless name.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Waits for the specified long-running operation until it is done or reaches
        # at most a specified timeout, returning the latest state.  If the operation
        # is already done, the latest state is immediately returned.  If the timeout
        # specified is greater than the default HTTP/RPC timeout, the HTTP/RPC
        # timeout is used.  If the server does not support this method, it returns
        # `google.rpc.Code.UNIMPLEMENTED`.
        # Note that this method is on a best-effort basis.  It may return the latest
        # state before the specified timeout (including immediately), meaning even an
        # immediate response is no guarantee that the operation is done.
        # @param [String] name
        #   The name of the operation resource to wait on.
        # @param [Google::Apis::TranslateV3beta1::WaitOperationRequest] wait_operation_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::TranslateV3beta1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TranslateV3beta1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def wait_operation(name, wait_operation_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v3beta1/{+name}:wait', options)
          command.request_representation = Google::Apis::TranslateV3beta1::WaitOperationRequest::Representation
          command.request_object = wait_operation_request_object
          command.response_representation = Google::Apis::TranslateV3beta1::Operation::Representation
          command.response_class = Google::Apis::TranslateV3beta1::Operation
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
