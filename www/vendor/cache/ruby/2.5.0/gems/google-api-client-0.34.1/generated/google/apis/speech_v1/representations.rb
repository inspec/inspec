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
    module SpeechV1
      
      class ListOperationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LongRunningRecognizeMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LongRunningRecognizeRequest
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
      
      class RecognitionAudio
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RecognitionConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RecognitionMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RecognizeRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RecognizeResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SpeakerDiarizationConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SpeechContext
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
          collection :operations, as: 'operations', class: Google::Apis::SpeechV1::Operation, decorator: Google::Apis::SpeechV1::Operation::Representation
      
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
      
      class LongRunningRecognizeRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :audio, as: 'audio', class: Google::Apis::SpeechV1::RecognitionAudio, decorator: Google::Apis::SpeechV1::RecognitionAudio::Representation
      
          property :config, as: 'config', class: Google::Apis::SpeechV1::RecognitionConfig, decorator: Google::Apis::SpeechV1::RecognitionConfig::Representation
      
        end
      end
      
      class LongRunningRecognizeResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :results, as: 'results', class: Google::Apis::SpeechV1::SpeechRecognitionResult, decorator: Google::Apis::SpeechV1::SpeechRecognitionResult::Representation
      
        end
      end
      
      class Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :done, as: 'done'
          property :error, as: 'error', class: Google::Apis::SpeechV1::Status, decorator: Google::Apis::SpeechV1::Status::Representation
      
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
          hash :response, as: 'response'
        end
      end
      
      class RecognitionAudio
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content, :base64 => true, as: 'content'
          property :uri, as: 'uri'
        end
      end
      
      class RecognitionConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :audio_channel_count, as: 'audioChannelCount'
          property :diarization_config, as: 'diarizationConfig', class: Google::Apis::SpeechV1::SpeakerDiarizationConfig, decorator: Google::Apis::SpeechV1::SpeakerDiarizationConfig::Representation
      
          property :enable_automatic_punctuation, as: 'enableAutomaticPunctuation'
          property :enable_separate_recognition_per_channel, as: 'enableSeparateRecognitionPerChannel'
          property :enable_word_time_offsets, as: 'enableWordTimeOffsets'
          property :encoding, as: 'encoding'
          property :language_code, as: 'languageCode'
          property :max_alternatives, as: 'maxAlternatives'
          property :metadata, as: 'metadata', class: Google::Apis::SpeechV1::RecognitionMetadata, decorator: Google::Apis::SpeechV1::RecognitionMetadata::Representation
      
          property :model, as: 'model'
          property :profanity_filter, as: 'profanityFilter'
          property :sample_rate_hertz, as: 'sampleRateHertz'
          collection :speech_contexts, as: 'speechContexts', class: Google::Apis::SpeechV1::SpeechContext, decorator: Google::Apis::SpeechV1::SpeechContext::Representation
      
          property :use_enhanced, as: 'useEnhanced'
        end
      end
      
      class RecognitionMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :audio_topic, as: 'audioTopic'
          property :industry_naics_code_of_audio, as: 'industryNaicsCodeOfAudio'
          property :interaction_type, as: 'interactionType'
          property :microphone_distance, as: 'microphoneDistance'
          property :obfuscated_id, :numeric_string => true, as: 'obfuscatedId'
          property :original_media_type, as: 'originalMediaType'
          property :original_mime_type, as: 'originalMimeType'
          property :recording_device_name, as: 'recordingDeviceName'
          property :recording_device_type, as: 'recordingDeviceType'
        end
      end
      
      class RecognizeRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :audio, as: 'audio', class: Google::Apis::SpeechV1::RecognitionAudio, decorator: Google::Apis::SpeechV1::RecognitionAudio::Representation
      
          property :config, as: 'config', class: Google::Apis::SpeechV1::RecognitionConfig, decorator: Google::Apis::SpeechV1::RecognitionConfig::Representation
      
        end
      end
      
      class RecognizeResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :results, as: 'results', class: Google::Apis::SpeechV1::SpeechRecognitionResult, decorator: Google::Apis::SpeechV1::SpeechRecognitionResult::Representation
      
        end
      end
      
      class SpeakerDiarizationConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :enable_speaker_diarization, as: 'enableSpeakerDiarization'
          property :max_speaker_count, as: 'maxSpeakerCount'
          property :min_speaker_count, as: 'minSpeakerCount'
        end
      end
      
      class SpeechContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :phrases, as: 'phrases'
        end
      end
      
      class SpeechRecognitionAlternative
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :confidence, as: 'confidence'
          property :transcript, as: 'transcript'
          collection :words, as: 'words', class: Google::Apis::SpeechV1::WordInfo, decorator: Google::Apis::SpeechV1::WordInfo::Representation
      
        end
      end
      
      class SpeechRecognitionResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :alternatives, as: 'alternatives', class: Google::Apis::SpeechV1::SpeechRecognitionAlternative, decorator: Google::Apis::SpeechV1::SpeechRecognitionAlternative::Representation
      
          property :channel_tag, as: 'channelTag'
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
          property :end_time, as: 'endTime'
          property :speaker_tag, as: 'speakerTag'
          property :start_time, as: 'startTime'
          property :word, as: 'word'
        end
      end
    end
  end
end
