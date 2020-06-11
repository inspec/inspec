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
    module TranslateV2
      # Google Cloud Translation API
      #
      # The Google Cloud Translation API lets websites and programs integrate with
      #  Google Translate programmatically.
      #
      # @example
      #    require 'google/apis/translate_v2'
      #
      #    Translate = Google::Apis::TranslateV2 # Alias the module
      #    service = Translate::TranslateService.new
      #
      # @see https://code.google.com/apis/language/translate/v2/getting_started.html
      class TranslateService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        #  Overrides userIp if both are provided.
        attr_accessor :quota_user

        def initialize
          super('https://translation.googleapis.com/', 'language/translate/')
          @batch_path = 'batch/translate'
        end
        
        # Detects the language of text within a request.
        # @param [Google::Apis::TranslateV2::DetectLanguageRequest] detect_language_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::TranslateV2::ListDetectionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TranslateV2::ListDetectionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def detect_detection_language(detect_language_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/detect', options)
          command.request_representation = Google::Apis::TranslateV2::DetectLanguageRequest::Representation
          command.request_object = detect_language_request_object
          command.response_representation = Google::Apis::TranslateV2::ListDetectionsResponse::Representation
          command.response_class = Google::Apis::TranslateV2::ListDetectionsResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Detects the language of text within a request.
        # @param [Array<String>, String] q
        #   The input text upon which to perform language detection. Repeat this
        #   parameter to perform language detection on multiple text inputs.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::TranslateV2::ListDetectionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TranslateV2::ListDetectionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_detections(q, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/detect', options)
          command.response_representation = Google::Apis::TranslateV2::ListDetectionsResponse::Representation
          command.response_class = Google::Apis::TranslateV2::ListDetectionsResponse
          command.query['q'] = q unless q.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of supported languages for translation.
        # @param [String] model
        #   The model type for which supported languages should be returned.
        # @param [String] target
        #   The language to use to return localized, human readable names of supported
        #   languages.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::TranslateV2::ListLanguagesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TranslateV2::ListLanguagesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_languages(model: nil, target: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/languages', options)
          command.response_representation = Google::Apis::TranslateV2::ListLanguagesResponse::Representation
          command.response_class = Google::Apis::TranslateV2::ListLanguagesResponse
          command.query['model'] = model unless model.nil?
          command.query['target'] = target unless target.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Translates input text, returning translated text.
        # @param [Array<String>, String] q
        #   The input text to translate. Repeat this parameter to perform translation
        #   operations on multiple text inputs.
        # @param [String] target
        #   The language to use for translation of the input text, set to one of the
        #   language codes listed in Language Support.
        # @param [Array<String>, String] cid
        #   The customization id for translate
        # @param [String] format
        #   The format of the source text, in either HTML (default) or plain-text. A
        #   value of "html" indicates HTML and a value of "text" indicates plain-text.
        # @param [String] model
        #   The `model` type requested for this translation. Valid values are
        #   listed in public documentation.
        # @param [String] source
        #   The language of the source text, set to one of the language codes listed in
        #   Language Support. If the source language is not specified, the API will
        #   attempt to identify the source language automatically and return it within
        #   the response.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::TranslateV2::ListTranslationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TranslateV2::ListTranslationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_translations(q, target, cid: nil, format: nil, model: nil, source: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2', options)
          command.response_representation = Google::Apis::TranslateV2::ListTranslationsResponse::Representation
          command.response_class = Google::Apis::TranslateV2::ListTranslationsResponse
          command.query['cid'] = cid unless cid.nil?
          command.query['format'] = format unless format.nil?
          command.query['model'] = model unless model.nil?
          command.query['q'] = q unless q.nil?
          command.query['source'] = source unless source.nil?
          command.query['target'] = target unless target.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Translates input text, returning translated text.
        # @param [Google::Apis::TranslateV2::TranslateTextRequest] translate_text_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::TranslateV2::ListTranslationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TranslateV2::ListTranslationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def translate_translation_text(translate_text_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2', options)
          command.request_representation = Google::Apis::TranslateV2::TranslateTextRequest::Representation
          command.request_object = translate_text_request_object
          command.response_representation = Google::Apis::TranslateV2::ListTranslationsResponse::Representation
          command.response_class = Google::Apis::TranslateV2::ListTranslationsResponse
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
