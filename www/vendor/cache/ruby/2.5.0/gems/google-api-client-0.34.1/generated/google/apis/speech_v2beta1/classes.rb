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
      
      # The response message for Operations.ListOperations.
      class ListOperationsResponse
        include Google::Apis::Core::Hashable
      
        # The standard List next-page token.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # A list of operations that matches the specified filter in the request.
        # Corresponds to the JSON property `operations`
        # @return [Array<Google::Apis::SpeechV2beta1::Operation>]
        attr_accessor :operations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @operations = args[:operations] if args.key?(:operations)
        end
      end
      
      # Describes the progress of a long-running `LongRunningRecognize` call. It is
      # included in the `metadata` field of the `Operation` returned by the
      # `GetOperation` call of the `google::longrunning::Operations` service.
      class LongRunningRecognizeMetadata
        include Google::Apis::Core::Hashable
      
        # Output only. Time of the most recent processing update.
        # Corresponds to the JSON property `lastUpdateTime`
        # @return [String]
        attr_accessor :last_update_time
      
        # Output only. Approximate percentage of audio processed thus far. Guaranteed to
        # be 100
        # when the audio is fully processed and the results are available.
        # Corresponds to the JSON property `progressPercent`
        # @return [Fixnum]
        attr_accessor :progress_percent
      
        # Output only. Time when the request was received.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @last_update_time = args[:last_update_time] if args.key?(:last_update_time)
          @progress_percent = args[:progress_percent] if args.key?(:progress_percent)
          @start_time = args[:start_time] if args.key?(:start_time)
        end
      end
      
      # The only message returned to the client by the `LongRunningRecognize` method.
      # It contains the result as zero or more sequential SpeechRecognitionResult
      # messages. It is included in the `result.response` field of the `Operation`
      # returned by the `GetOperation` call of the `google::longrunning::Operations`
      # service.
      class LongRunningRecognizeResponse
        include Google::Apis::Core::Hashable
      
        # Output only. Sequential list of transcription results corresponding to
        # sequential portions of audio.
        # Corresponds to the JSON property `results`
        # @return [Array<Google::Apis::SpeechV2beta1::SpeechRecognitionResult>]
        attr_accessor :results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @results = args[:results] if args.key?(:results)
        end
      end
      
      # This resource represents a long-running operation that is the result of a
      # network API call.
      class Operation
        include Google::Apis::Core::Hashable
      
        # If the value is `false`, it means the operation is still in progress.
        # If `true`, the operation is completed, and either `error` or `response` is
        # available.
        # Corresponds to the JSON property `done`
        # @return [Boolean]
        attr_accessor :done
        alias_method :done?, :done
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::SpeechV2beta1::Status]
        attr_accessor :error
      
        # Service-specific metadata associated with the operation.  It typically
        # contains progress information and common metadata such as create time.
        # Some services might not provide such metadata.  Any method that returns a
        # long-running operation should document the metadata type, if any.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # The server-assigned name, which is only unique within the same service that
        # originally returns it. If you use the default HTTP mapping, the
        # `name` should be a resource name ending with `operations/`unique_id``.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The normal response of the operation in case of success.  If the original
        # method returns no data on success, such as `Delete`, the response is
        # `google.protobuf.Empty`.  If the original method is standard
        # `Get`/`Create`/`Update`, the response should be the resource.  For other
        # methods, the response should have the type `XxxResponse`, where `Xxx`
        # is the original method name.  For example, if the original method name
        # is `TakeSnapshot()`, the inferred response type is
        # `TakeSnapshotResponse`.
        # Corresponds to the JSON property `response`
        # @return [Hash<String,Object>]
        attr_accessor :response
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @done = args[:done] if args.key?(:done)
          @error = args[:error] if args.key?(:error)
          @metadata = args[:metadata] if args.key?(:metadata)
          @name = args[:name] if args.key?(:name)
          @response = args[:response] if args.key?(:response)
        end
      end
      
      # Alternative hypotheses (a.k.a. n-best list).
      class SpeechRecognitionAlternative
        include Google::Apis::Core::Hashable
      
        # Output only. The confidence estimate between 0.0 and 1.0. A higher number
        # indicates an estimated greater likelihood that the recognized words are
        # correct. This field is set only for the top alternative of a non-streaming
        # result or, of a streaming result where `is_final=true`.
        # This field is not guaranteed to be accurate and users should not rely on it
        # to be always provided.
        # The default of 0.0 is a sentinel value indicating `confidence` was not set.
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Output only. Transcript text representing the words that the user spoke.
        # Corresponds to the JSON property `transcript`
        # @return [String]
        attr_accessor :transcript
      
        # Output only. A list of word-specific information for each recognized word.
        # Note: When `enable_speaker_diarization` is true, you will see all the words
        # from the beginning of the audio.
        # Corresponds to the JSON property `words`
        # @return [Array<Google::Apis::SpeechV2beta1::WordInfo>]
        attr_accessor :words
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @transcript = args[:transcript] if args.key?(:transcript)
          @words = args[:words] if args.key?(:words)
        end
      end
      
      # A speech recognition result corresponding to a portion of the audio.
      class SpeechRecognitionResult
        include Google::Apis::Core::Hashable
      
        # Output only. May contain one or more recognition hypotheses (up to the
        # maximum specified in `max_alternatives`).
        # These alternatives are ordered in terms of accuracy, with the top (first)
        # alternative being the most probable, as ranked by the recognizer.
        # Corresponds to the JSON property `alternatives`
        # @return [Array<Google::Apis::SpeechV2beta1::SpeechRecognitionAlternative>]
        attr_accessor :alternatives
      
        # Output only. For multi-channel audio, this is the channel number corresponding
        # to the
        # recognized result for the audio from that channel.
        # For `audio_channel_count` = N, its output values can range from `1` to `N`.
        # Corresponds to the JSON property `channelTag`
        # @return [Fixnum]
        attr_accessor :channel_tag
      
        # Output only. The
        # [BCP-47](https://www.rfc-editor.org/rfc/bcp/bcp47.txt) language tag of the
        # language in this result. This language code was detected to have the most
        # likelihood of being spoken in the audio.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alternatives = args[:alternatives] if args.key?(:alternatives)
          @channel_tag = args[:channel_tag] if args.key?(:channel_tag)
          @language_code = args[:language_code] if args.key?(:language_code)
        end
      end
      
      # The `Status` type defines a logical error model that is suitable for
      # different programming environments, including REST APIs and RPC APIs. It is
      # used by [gRPC](https://github.com/grpc). Each `Status` message contains
      # three pieces of data: error code, error message, and error details.
      # You can find out more about this error model and how to work with it in the
      # [API Design Guide](https://cloud.google.com/apis/design/errors).
      class Status
        include Google::Apis::Core::Hashable
      
        # The status code, which should be an enum value of google.rpc.Code.
        # Corresponds to the JSON property `code`
        # @return [Fixnum]
        attr_accessor :code
      
        # A list of messages that carry the error details.  There is a common set of
        # message types for APIs to use.
        # Corresponds to the JSON property `details`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :details
      
        # A developer-facing error message, which should be in English. Any
        # user-facing error message should be localized and sent in the
        # google.rpc.Status.details field, or localized by the client.
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @details = args[:details] if args.key?(:details)
          @message = args[:message] if args.key?(:message)
        end
      end
      
      # Word-specific information for recognized words.
      class WordInfo
        include Google::Apis::Core::Hashable
      
        # Output only. The confidence estimate between 0.0 and 1.0. A higher number
        # indicates an estimated greater likelihood that the recognized words are
        # correct. This field is set only for the top alternative of a non-streaming
        # result or, of a streaming result where `is_final=true`.
        # This field is not guaranteed to be accurate and users should not rely on it
        # to be always provided.
        # The default of 0.0 is a sentinel value indicating `confidence` was not set.
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Output only. Time offset relative to the beginning of the audio,
        # and corresponding to the end of the spoken word.
        # This field is only set if `enable_word_time_offsets=true` and only
        # in the top hypothesis.
        # This is an experimental feature and the accuracy of the time offset can
        # vary.
        # Corresponds to the JSON property `endOffset`
        # @return [String]
        attr_accessor :end_offset
      
        # Output only. A distinct integer value is assigned for every speaker within
        # the audio. This field specifies which one of those speakers was detected to
        # have spoken this word. Value ranges from `1` to
        # `diarization_config.max_speaker_count` . `speaker_tag` is set if
        # `diarization_config.enable_speaker_diarization` = `true` and only in the
        # top alternative.
        # Corresponds to the JSON property `speakerTag`
        # @return [Fixnum]
        attr_accessor :speaker_tag
      
        # Output only. Time offset relative to the beginning of the audio,
        # and corresponding to the start of the spoken word.
        # This field is only set if `enable_word_time_offsets=true` and only
        # in the top hypothesis.
        # This is an experimental feature and the accuracy of the time offset can
        # vary.
        # Corresponds to the JSON property `startOffset`
        # @return [String]
        attr_accessor :start_offset
      
        # Output only. The word corresponding to this set of information.
        # Corresponds to the JSON property `word`
        # @return [String]
        attr_accessor :word
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @end_offset = args[:end_offset] if args.key?(:end_offset)
          @speaker_tag = args[:speaker_tag] if args.key?(:speaker_tag)
          @start_offset = args[:start_offset] if args.key?(:start_offset)
          @word = args[:word] if args.key?(:word)
        end
      end
    end
  end
end
