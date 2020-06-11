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
    module TranslateV2
      
      # The request message for language detection.
      class DetectLanguageRequest
        include Google::Apis::Core::Hashable
      
        # The input text upon which to perform language detection. Repeat this
        # parameter to perform language detection on multiple text inputs.
        # Corresponds to the JSON property `q`
        # @return [Array<String>]
        attr_accessor :q
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @q = args[:q] if args.key?(:q)
        end
      end
      
      # 
      class ListDetectionsResponse
        include Google::Apis::Core::Hashable
      
        # A detections contains detection results of several text
        # Corresponds to the JSON property `detections`
        # @return [Array<Array<Google::Apis::TranslateV2::DetectionsResource>>]
        attr_accessor :detections
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @detections = args[:detections] if args.key?(:detections)
        end
      end
      
      # 
      class DetectionsResource
        include Google::Apis::Core::Hashable
      
        # The confidence of the detection result of this language.
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # A boolean to indicate is the language detection result reliable.
        # Corresponds to the JSON property `isReliable`
        # @return [Boolean]
        attr_accessor :is_reliable
        alias_method :is_reliable?, :is_reliable
      
        # The language we detected.
        # Corresponds to the JSON property `language`
        # @return [String]
        attr_accessor :language
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @is_reliable = args[:is_reliable] if args.key?(:is_reliable)
          @language = args[:language] if args.key?(:language)
        end
      end
      
      # The request message for discovering supported languages.
      class GetSupportedLanguagesRequest
        include Google::Apis::Core::Hashable
      
        # The language to use to return localized, human readable names of supported
        # languages.
        # Corresponds to the JSON property `target`
        # @return [String]
        attr_accessor :target
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @target = args[:target] if args.key?(:target)
        end
      end
      
      # 
      class ListLanguagesResponse
        include Google::Apis::Core::Hashable
      
        # List of source/target languages supported by the translation API. If target
        # parameter is unspecified, the list is sorted by the ASCII code point order of
        # the language code. If target parameter is specified, the list is sorted by the
        # collation order of the language name in the target language.
        # Corresponds to the JSON property `languages`
        # @return [Array<Google::Apis::TranslateV2::LanguagesResource>]
        attr_accessor :languages
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @languages = args[:languages] if args.key?(:languages)
        end
      end
      
      # 
      class LanguagesResource
        include Google::Apis::Core::Hashable
      
        # Supported language code, generally consisting of its ISO 639-1
        # identifier. (E.g. 'en', 'ja'). In certain cases, BCP-47 codes including
        # language + region identifiers are returned (e.g. 'zh-TW' and 'zh-CH')
        # Corresponds to the JSON property `language`
        # @return [String]
        attr_accessor :language
      
        # Human readable name of the language localized to the target language.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @language = args[:language] if args.key?(:language)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # The main translation request message for the Cloud Translation API.
      class TranslateTextRequest
        include Google::Apis::Core::Hashable
      
        # The format of the source text, in either HTML (default) or plain-text. A
        # value of "html" indicates HTML and a value of "text" indicates plain-text.
        # Corresponds to the JSON property `format`
        # @return [String]
        attr_accessor :format
      
        # The `model` type requested for this translation. Valid values are
        # listed in public documentation.
        # Corresponds to the JSON property `model`
        # @return [String]
        attr_accessor :model
      
        # The input text to translate. Repeat this parameter to perform translation
        # operations on multiple text inputs.
        # Corresponds to the JSON property `q`
        # @return [Array<String>]
        attr_accessor :q
      
        # The language of the source text, set to one of the language codes listed in
        # Language Support. If the source language is not specified, the API will
        # attempt to identify the source language automatically and return it within
        # the response.
        # Corresponds to the JSON property `source`
        # @return [String]
        attr_accessor :source
      
        # The language to use for translation of the input text, set to one of the
        # language codes listed in Language Support.
        # Corresponds to the JSON property `target`
        # @return [String]
        attr_accessor :target
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @format = args[:format] if args.key?(:format)
          @model = args[:model] if args.key?(:model)
          @q = args[:q] if args.key?(:q)
          @source = args[:source] if args.key?(:source)
          @target = args[:target] if args.key?(:target)
        end
      end
      
      # The main language translation response message.
      class ListTranslationsResponse
        include Google::Apis::Core::Hashable
      
        # Translations contains list of translation results of given text
        # Corresponds to the JSON property `translations`
        # @return [Array<Google::Apis::TranslateV2::TranslationsResource>]
        attr_accessor :translations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @translations = args[:translations] if args.key?(:translations)
        end
      end
      
      # 
      class TranslationsResource
        include Google::Apis::Core::Hashable
      
        # The source language of the initial request, detected automatically, if
        # no source language was passed within the initial request. If the
        # source language was passed, auto-detection of the language will not
        # occur and this field will be empty.
        # Corresponds to the JSON property `detectedSourceLanguage`
        # @return [String]
        attr_accessor :detected_source_language
      
        # The `model` type used for this translation. Valid values are
        # listed in public documentation. Can be different from requested `model`.
        # Present only if specific model type was explicitly requested.
        # Corresponds to the JSON property `model`
        # @return [String]
        attr_accessor :model
      
        # Text translated into the target language.
        # Corresponds to the JSON property `translatedText`
        # @return [String]
        attr_accessor :translated_text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @detected_source_language = args[:detected_source_language] if args.key?(:detected_source_language)
          @model = args[:model] if args.key?(:model)
          @translated_text = args[:translated_text] if args.key?(:translated_text)
        end
      end
    end
  end
end
