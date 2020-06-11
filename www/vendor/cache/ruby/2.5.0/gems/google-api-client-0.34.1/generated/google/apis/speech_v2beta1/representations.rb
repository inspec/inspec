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
    module SpeechV2beta1
      
      class ListOperationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LongRunningRecognizeMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LongRunningRecognizeResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Operation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SpeechRecognitionAlternative
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SpeechRecognitionResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Status
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WordInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListOperationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :operations, as: 'operations', class: Google::Apis::SpeechV2beta1::Operation, decorator: Google::Apis::SpeechV2beta1::Operation::Representation
      
        end
      end
      
      class LongRunningRecognizeMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :last_update_time, as: 'lastUpdateTime'
          property :progress_percent, as: 'progressPercent'
          property :start_time, as: 'startTime'
        end
      end
      
      class LongRunningRecognizeResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :results, as: 'results', class: Google::Apis::SpeechV2beta1::SpeechRecognitionResult, decorator: Google::Apis::SpeechV2beta1::SpeechRecognitionResult::Representation
      
        end
      end
      
      class Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :done, as: 'done'
          property :error, as: 'error', class: Google::Apis::SpeechV2beta1::Status, decorator: Google::Apis::SpeechV2beta1::Status::Representation
      
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
          hash :response, as: 'response'
        end
      end
      
      class SpeechRecognitionAlternative
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :confidence, as: 'confidence'
          property :transcript, as: 'transcript'
          collection :words, as: 'words', class: Google::Apis::SpeechV2beta1::WordInfo, decorator: Google::Apis::SpeechV2beta1::WordInfo::Representation
      
        end
      end
      
      class SpeechRecognitionResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :alternatives, as: 'alternatives', class: Google::Apis::SpeechV2beta1::SpeechRecognitionAlternative, decorator: Google::Apis::SpeechV2beta1::SpeechRecognitionAlternative::Representation
      
          property :channel_tag, as: 'channelTag'
          property :language_code, as: 'languageCode'
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
      
      class WordInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :confidence, as: 'confidence'
          property :end_offset, as: 'endOffset'
          property :speaker_tag, as: 'speakerTag'
          property :start_offset, as: 'startOffset'
          property :word, as: 'word'
        end
      end
    end
  end
end
