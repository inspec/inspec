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

require 'date'
require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module TranslateV3beta1
      
      class BatchTranslateTextRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CancelOperationRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DetectLanguageRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DetectLanguageResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DetectedLanguage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GcsDestination
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GcsSource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Glossary
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GlossaryInputConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InputConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LanguageCodePair
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LanguageCodesSet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListGlossariesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListLocationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListOperationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Location
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Operation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OutputConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Status
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SupportedLanguage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SupportedLanguages
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TranslateTextGlossaryConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TranslateTextRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TranslateTextResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Translation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WaitOperationRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchTranslateTextRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :glossaries, as: 'glossaries', class: Google::Apis::TranslateV3beta1::TranslateTextGlossaryConfig, decorator: Google::Apis::TranslateV3beta1::TranslateTextGlossaryConfig::Representation
      
          collection :input_configs, as: 'inputConfigs', class: Google::Apis::TranslateV3beta1::InputConfig, decorator: Google::Apis::TranslateV3beta1::InputConfig::Representation
      
          hash :labels, as: 'labels'
          hash :models, as: 'models'
          property :output_config, as: 'outputConfig', class: Google::Apis::TranslateV3beta1::OutputConfig, decorator: Google::Apis::TranslateV3beta1::OutputConfig::Representation
      
          property :source_language_code, as: 'sourceLanguageCode'
          collection :target_language_codes, as: 'targetLanguageCodes'
        end
      end
      
      class CancelOperationRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class DetectLanguageRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content, as: 'content'
          hash :labels, as: 'labels'
          property :mime_type, as: 'mimeType'
          property :model, as: 'model'
        end
      end
      
      class DetectLanguageResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :languages, as: 'languages', class: Google::Apis::TranslateV3beta1::DetectedLanguage, decorator: Google::Apis::TranslateV3beta1::DetectedLanguage::Representation
      
        end
      end
      
      class DetectedLanguage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :confidence, as: 'confidence'
          property :language_code, as: 'languageCode'
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class GcsDestination
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :output_uri_prefix, as: 'outputUriPrefix'
        end
      end
      
      class GcsSource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :input_uri, as: 'inputUri'
        end
      end
      
      class Glossary
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_time, as: 'endTime'
          property :entry_count, as: 'entryCount'
          property :input_config, as: 'inputConfig', class: Google::Apis::TranslateV3beta1::GlossaryInputConfig, decorator: Google::Apis::TranslateV3beta1::GlossaryInputConfig::Representation
      
          property :language_codes_set, as: 'languageCodesSet', class: Google::Apis::TranslateV3beta1::LanguageCodesSet, decorator: Google::Apis::TranslateV3beta1::LanguageCodesSet::Representation
      
          property :language_pair, as: 'languagePair', class: Google::Apis::TranslateV3beta1::LanguageCodePair, decorator: Google::Apis::TranslateV3beta1::LanguageCodePair::Representation
      
          property :name, as: 'name'
          property :submit_time, as: 'submitTime'
        end
      end
      
      class GlossaryInputConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :gcs_source, as: 'gcsSource', class: Google::Apis::TranslateV3beta1::GcsSource, decorator: Google::Apis::TranslateV3beta1::GcsSource::Representation
      
        end
      end
      
      class InputConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :gcs_source, as: 'gcsSource', class: Google::Apis::TranslateV3beta1::GcsSource, decorator: Google::Apis::TranslateV3beta1::GcsSource::Representation
      
          property :mime_type, as: 'mimeType'
        end
      end
      
      class LanguageCodePair
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :source_language_code, as: 'sourceLanguageCode'
          property :target_language_code, as: 'targetLanguageCode'
        end
      end
      
      class LanguageCodesSet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :language_codes, as: 'languageCodes'
        end
      end
      
      class ListGlossariesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :glossaries, as: 'glossaries', class: Google::Apis::TranslateV3beta1::Glossary, decorator: Google::Apis::TranslateV3beta1::Glossary::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListLocationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :locations, as: 'locations', class: Google::Apis::TranslateV3beta1::Location, decorator: Google::Apis::TranslateV3beta1::Location::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListOperationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :operations, as: 'operations', class: Google::Apis::TranslateV3beta1::Operation, decorator: Google::Apis::TranslateV3beta1::Operation::Representation
      
        end
      end
      
      class Location
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_name, as: 'displayName'
          hash :labels, as: 'labels'
          property :location_id, as: 'locationId'
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
        end
      end
      
      class Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :done, as: 'done'
          property :error, as: 'error', class: Google::Apis::TranslateV3beta1::Status, decorator: Google::Apis::TranslateV3beta1::Status::Representation
      
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
          hash :response, as: 'response'
        end
      end
      
      class OutputConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :gcs_destination, as: 'gcsDestination', class: Google::Apis::TranslateV3beta1::GcsDestination, decorator: Google::Apis::TranslateV3beta1::GcsDestination::Representation
      
        end
      end
      
      class Status
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          collection :details, as: 'details'
          property :message, as: 'message'
        end
      end
      
      class SupportedLanguage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_name, as: 'displayName'
          property :language_code, as: 'languageCode'
          property :support_source, as: 'supportSource'
          property :support_target, as: 'supportTarget'
        end
      end
      
      class SupportedLanguages
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :languages, as: 'languages', class: Google::Apis::TranslateV3beta1::SupportedLanguage, decorator: Google::Apis::TranslateV3beta1::SupportedLanguage::Representation
      
        end
      end
      
      class TranslateTextGlossaryConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :glossary, as: 'glossary'
          property :ignore_case, as: 'ignoreCase'
        end
      end
      
      class TranslateTextRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :contents, as: 'contents'
          property :glossary_config, as: 'glossaryConfig', class: Google::Apis::TranslateV3beta1::TranslateTextGlossaryConfig, decorator: Google::Apis::TranslateV3beta1::TranslateTextGlossaryConfig::Representation
      
          hash :labels, as: 'labels'
          property :mime_type, as: 'mimeType'
          property :model, as: 'model'
          property :source_language_code, as: 'sourceLanguageCode'
          property :target_language_code, as: 'targetLanguageCode'
        end
      end
      
      class TranslateTextResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :glossary_translations, as: 'glossaryTranslations', class: Google::Apis::TranslateV3beta1::Translation, decorator: Google::Apis::TranslateV3beta1::Translation::Representation
      
          collection :translations, as: 'translations', class: Google::Apis::TranslateV3beta1::Translation, decorator: Google::Apis::TranslateV3beta1::Translation::Representation
      
        end
      end
      
      class Translation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :detected_language_code, as: 'detectedLanguageCode'
          property :glossary_config, as: 'glossaryConfig', class: Google::Apis::TranslateV3beta1::TranslateTextGlossaryConfig, decorator: Google::Apis::TranslateV3beta1::TranslateTextGlossaryConfig::Representation
      
          property :model, as: 'model'
          property :translated_text, as: 'translatedText'
        end
      end
      
      class WaitOperationRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :timeout, as: 'timeout'
        end
      end
    end
  end
end
