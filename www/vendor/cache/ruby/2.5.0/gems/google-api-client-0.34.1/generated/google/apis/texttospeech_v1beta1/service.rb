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
    module TexttospeechV1beta1
      # Cloud Text-to-Speech API
      #
      # Synthesizes natural-sounding speech by applying powerful neural network models.
      #
      # @example
      #    require 'google/apis/texttospeech_v1beta1'
      #
      #    Texttospeech = Google::Apis::TexttospeechV1beta1 # Alias the module
      #    service = Texttospeech::TexttospeechService.new
      #
      # @see https://cloud.google.com/text-to-speech/
      class TexttospeechService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://texttospeech.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Synthesizes speech synchronously: receive results after all text input
        # has been processed.
        # @param [Google::Apis::TexttospeechV1beta1::SynthesizeSpeechRequest] synthesize_speech_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::TexttospeechV1beta1::SynthesizeSpeechResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TexttospeechV1beta1::SynthesizeSpeechResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def synthesize_text_speech(synthesize_speech_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/text:synthesize', options)
          command.request_representation = Google::Apis::TexttospeechV1beta1::SynthesizeSpeechRequest::Representation
          command.request_object = synthesize_speech_request_object
          command.response_representation = Google::Apis::TexttospeechV1beta1::SynthesizeSpeechResponse::Representation
          command.response_class = Google::Apis::TexttospeechV1beta1::SynthesizeSpeechResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of Voice supported for synthesis.
        # @param [String] language_code
        #   Optional. Recommended.
        #   [BCP-47](https://www.rfc-editor.org/rfc/bcp/bcp47.txt) language tag. If
        #   specified, the ListVoices call will only return voices that can be used to
        #   synthesize this language_code. E.g. when specifying "en-NZ", you will get
        #   supported "en-*" voices; when specifying "no", you will get supported
        #   "no-*" (Norwegian) and "nb-*" (Norwegian Bokmal) voices; specifying "zh"
        #   will also get supported "cmn-*" voices; specifying "zh-hk" will also get
        #   supported "yue-*" voices.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::TexttospeechV1beta1::ListVoicesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TexttospeechV1beta1::ListVoicesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_voices(language_code: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/voices', options)
          command.response_representation = Google::Apis::TexttospeechV1beta1::ListVoicesResponse::Representation
          command.response_class = Google::Apis::TexttospeechV1beta1::ListVoicesResponse
          command.query['languageCode'] = language_code unless language_code.nil?
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
