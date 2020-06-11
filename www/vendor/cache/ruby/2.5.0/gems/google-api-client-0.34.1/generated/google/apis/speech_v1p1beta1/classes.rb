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
    module SpeechV1p1beta1
      
      # The response message for Operations.ListOperations.
      class ListOperationsResponse
        include Google::Apis::Core::Hashable
      
        # The standard List next-page token.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # A list of operations that matches the specified filter in the request.
        # Corresponds to the JSON property `operations`
        # @return [Array<Google::Apis::SpeechV1p1beta1::Operation>]
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
      
        # Time of the most recent processing update.
        # Corresponds to the JSON property `lastUpdateTime`
        # @return [String]
        attr_accessor :last_update_time
      
        # Approximate percentage of audio processed thus far. Guaranteed to be 100
        # when the audio is fully processed and the results are available.
        # Corresponds to the JSON property `progressPercent`
        # @return [Fixnum]
        attr_accessor :progress_percent
      
        # Time when the request was received.
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
      
      # The top-level message sent by the client for the `LongRunningRecognize`
      # method.
      class LongRunningRecognizeRequest
        include Google::Apis::Core::Hashable
      
        # Contains audio data in the encoding specified in the `RecognitionConfig`.
        # Either `content` or `uri` must be supplied. Supplying both or neither
        # returns google.rpc.Code.INVALID_ARGUMENT. See
        # [content limits](https://cloud.google.com/speech-to-text/quotas#content).
        # Corresponds to the JSON property `audio`
        # @return [Google::Apis::SpeechV1p1beta1::RecognitionAudio]
        attr_accessor :audio
      
        # Provides information to the recognizer that specifies how to process the
        # request.
        # Corresponds to the JSON property `config`
        # @return [Google::Apis::SpeechV1p1beta1::RecognitionConfig]
        attr_accessor :config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @audio = args[:audio] if args.key?(:audio)
          @config = args[:config] if args.key?(:config)
        end
      end
      
      # The only message returned to the client by the `LongRunningRecognize` method.
      # It contains the result as zero or more sequential `SpeechRecognitionResult`
      # messages. It is included in the `result.response` field of the `Operation`
      # returned by the `GetOperation` call of the `google::longrunning::Operations`
      # service.
      class LongRunningRecognizeResponse
        include Google::Apis::Core::Hashable
      
        # Sequential list of transcription results corresponding to
        # sequential portions of audio.
        # Corresponds to the JSON property `results`
        # @return [Array<Google::Apis::SpeechV1p1beta1::SpeechRecognitionResult>]
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
        # @return [Google::Apis::SpeechV1p1beta1::Status]
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
      
      # Contains audio data in the encoding specified in the `RecognitionConfig`.
      # Either `content` or `uri` must be supplied. Supplying both or neither
      # returns google.rpc.Code.INVALID_ARGUMENT. See
      # [content limits](https://cloud.google.com/speech-to-text/quotas#content).
      class RecognitionAudio
        include Google::Apis::Core::Hashable
      
        # The audio data bytes encoded as specified in
        # `RecognitionConfig`. Note: as with all bytes fields, proto buffers use a
        # pure binary representation, whereas JSON representations use base64.
        # Corresponds to the JSON property `content`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :content
      
        # URI that points to a file that contains audio data bytes as specified in
        # `RecognitionConfig`. The file must not be compressed (for example, gzip).
        # Currently, only Google Cloud Storage URIs are
        # supported, which must be specified in the following format:
        # `gs://bucket_name/object_name` (other URI formats return
        # google.rpc.Code.INVALID_ARGUMENT). For more information, see
        # [Request URIs](https://cloud.google.com/storage/docs/reference-uris).
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content = args[:content] if args.key?(:content)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Provides information to the recognizer that specifies how to process the
      # request.
      class RecognitionConfig
        include Google::Apis::Core::Hashable
      
        # A list of up to 3 additional
        # [BCP-47](https://www.rfc-editor.org/rfc/bcp/bcp47.txt) language tags,
        # listing possible alternative languages of the supplied audio.
        # See [Language
        # Support](https://cloud.google.com/speech-to-text/docs/languages) for a list
        # of the currently supported language codes. If alternative languages are
        # listed, recognition result will contain recognition in the most likely
        # language detected including the main language_code. The recognition result
        # will include the language tag of the language detected in the audio. Note:
        # This feature is only supported for Voice Command and Voice Search use cases
        # and performance may vary for other use cases (e.g., phone call
        # transcription).
        # Corresponds to the JSON property `alternativeLanguageCodes`
        # @return [Array<String>]
        attr_accessor :alternative_language_codes
      
        # The number of channels in the input audio data.
        # ONLY set this for MULTI-CHANNEL recognition.
        # Valid values for LINEAR16 and FLAC are `1`-`8`.
        # Valid values for OGG_OPUS are '1'-'254'.
        # Valid value for MULAW, AMR, AMR_WB and SPEEX_WITH_HEADER_BYTE is only `1`.
        # If `0` or omitted, defaults to one channel (mono).
        # Note: We only recognize the first channel by default.
        # To perform independent recognition on each channel set
        # `enable_separate_recognition_per_channel` to 'true'.
        # Corresponds to the JSON property `audioChannelCount`
        # @return [Fixnum]
        attr_accessor :audio_channel_count
      
        # Config to enable speaker diarization.
        # Corresponds to the JSON property `diarizationConfig`
        # @return [Google::Apis::SpeechV1p1beta1::SpeakerDiarizationConfig]
        attr_accessor :diarization_config
      
        # If set, specifies the estimated number of speakers in the conversation.
        # Defaults to '2'. Ignored unless enable_speaker_diarization is set to true.
        # Note: Use diarization_config instead.
        # Corresponds to the JSON property `diarizationSpeakerCount`
        # @return [Fixnum]
        attr_accessor :diarization_speaker_count
      
        # If 'true', adds punctuation to recognition result hypotheses.
        # This feature is only available in select languages. Setting this for
        # requests in other languages has no effect at all.
        # The default 'false' value does not add punctuation to result hypotheses.
        # Note: This is currently offered as an experimental service, complimentary
        # to all users. In the future this may be exclusively available as a
        # premium feature.
        # Corresponds to the JSON property `enableAutomaticPunctuation`
        # @return [Boolean]
        attr_accessor :enable_automatic_punctuation
        alias_method :enable_automatic_punctuation?, :enable_automatic_punctuation
      
        # This needs to be set to `true` explicitly and `audio_channel_count` > 1
        # to get each channel recognized separately. The recognition result will
        # contain a `channel_tag` field to state which channel that result belongs
        # to. If this is not true, we will only recognize the first channel. The
        # request is billed cumulatively for all channels recognized:
        # `audio_channel_count` multiplied by the length of the audio.
        # Corresponds to the JSON property `enableSeparateRecognitionPerChannel`
        # @return [Boolean]
        attr_accessor :enable_separate_recognition_per_channel
        alias_method :enable_separate_recognition_per_channel?, :enable_separate_recognition_per_channel
      
        # If 'true', enables speaker detection for each recognized word in
        # the top alternative of the recognition result using a speaker_tag provided
        # in the WordInfo.
        # Note: Use diarization_config instead.
        # Corresponds to the JSON property `enableSpeakerDiarization`
        # @return [Boolean]
        attr_accessor :enable_speaker_diarization
        alias_method :enable_speaker_diarization?, :enable_speaker_diarization
      
        # If `true`, the top result includes a list of words and the
        # confidence for those words. If `false`, no word-level confidence
        # information is returned. The default is `false`.
        # Corresponds to the JSON property `enableWordConfidence`
        # @return [Boolean]
        attr_accessor :enable_word_confidence
        alias_method :enable_word_confidence?, :enable_word_confidence
      
        # If `true`, the top result includes a list of words and
        # the start and end time offsets (timestamps) for those words. If
        # `false`, no word-level time offset information is returned. The default is
        # `false`.
        # Corresponds to the JSON property `enableWordTimeOffsets`
        # @return [Boolean]
        attr_accessor :enable_word_time_offsets
        alias_method :enable_word_time_offsets?, :enable_word_time_offsets
      
        # Encoding of audio data sent in all `RecognitionAudio` messages.
        # This field is optional for `FLAC` and `WAV` audio files and required
        # for all other audio formats. For details, see AudioEncoding.
        # Corresponds to the JSON property `encoding`
        # @return [String]
        attr_accessor :encoding
      
        # Required. The language of the supplied audio as a
        # [BCP-47](https://www.rfc-editor.org/rfc/bcp/bcp47.txt) language tag.
        # Example: "en-US".
        # See [Language
        # Support](https://cloud.google.com/speech-to-text/docs/languages) for a list
        # of the currently supported language codes.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # Maximum number of recognition hypotheses to be returned.
        # Specifically, the maximum number of `SpeechRecognitionAlternative` messages
        # within each `SpeechRecognitionResult`.
        # The server may return fewer than `max_alternatives`.
        # Valid values are `0`-`30`. A value of `0` or `1` will return a maximum of
        # one. If omitted, will return a maximum of one.
        # Corresponds to the JSON property `maxAlternatives`
        # @return [Fixnum]
        attr_accessor :max_alternatives
      
        # Description of audio data to be recognized.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::SpeechV1p1beta1::RecognitionMetadata]
        attr_accessor :metadata
      
        # Which model to select for the given request. Select the model
        # best suited to your domain to get best results. If a model is not
        # explicitly specified, then we auto-select a model based on the parameters
        # in the RecognitionConfig.
        # <table>
        # <tr>
        # <td><b>Model</b></td>
        # <td><b>Description</b></td>
        # </tr>
        # <tr>
        # <td><code>command_and_search</code></td>
        # <td>Best for short queries such as voice commands or voice search.</td>
        # </tr>
        # <tr>
        # <td><code>phone_call</code></td>
        # <td>Best for audio that originated from a phone call (typically
        # recorded at an 8khz sampling rate).</td>
        # </tr>
        # <tr>
        # <td><code>video</code></td>
        # <td>Best for audio that originated from from video or includes multiple
        # speakers. Ideally the audio is recorded at a 16khz or greater
        # sampling rate. This is a premium model that costs more than the
        # standard rate.</td>
        # </tr>
        # <tr>
        # <td><code>default</code></td>
        # <td>Best for audio that is not one of the specific audio models.
        # For example, long-form audio. Ideally the audio is high-fidelity,
        # recorded at a 16khz or greater sampling rate.</td>
        # </tr>
        # </table>
        # Corresponds to the JSON property `model`
        # @return [String]
        attr_accessor :model
      
        # If set to `true`, the server will attempt to filter out
        # profanities, replacing all but the initial character in each filtered word
        # with asterisks, e.g. "f***". If set to `false` or omitted, profanities
        # won't be filtered out.
        # Corresponds to the JSON property `profanityFilter`
        # @return [Boolean]
        attr_accessor :profanity_filter
        alias_method :profanity_filter?, :profanity_filter
      
        # Sample rate in Hertz of the audio data sent in all
        # `RecognitionAudio` messages. Valid values are: 8000-48000.
        # 16000 is optimal. For best results, set the sampling rate of the audio
        # source to 16000 Hz. If that's not possible, use the native sample rate of
        # the audio source (instead of re-sampling).
        # This field is optional for FLAC and WAV audio files, but is
        # required for all other audio formats. For details, see AudioEncoding.
        # Corresponds to the JSON property `sampleRateHertz`
        # @return [Fixnum]
        attr_accessor :sample_rate_hertz
      
        # Array of SpeechContext.
        # A means to provide context to assist the speech recognition. For more
        # information, see
        # [speech
        # adaptation](https://cloud.google.com/speech-to-text/docs/context-strength).
        # Corresponds to the JSON property `speechContexts`
        # @return [Array<Google::Apis::SpeechV1p1beta1::SpeechContext>]
        attr_accessor :speech_contexts
      
        # Set to true to use an enhanced model for speech recognition.
        # If `use_enhanced` is set to true and the `model` field is not set, then
        # an appropriate enhanced model is chosen if an enhanced model exists for
        # the audio.
        # If `use_enhanced` is true and an enhanced version of the specified model
        # does not exist, then the speech is recognized using the standard version
        # of the specified model.
        # Corresponds to the JSON property `useEnhanced`
        # @return [Boolean]
        attr_accessor :use_enhanced
        alias_method :use_enhanced?, :use_enhanced
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alternative_language_codes = args[:alternative_language_codes] if args.key?(:alternative_language_codes)
          @audio_channel_count = args[:audio_channel_count] if args.key?(:audio_channel_count)
          @diarization_config = args[:diarization_config] if args.key?(:diarization_config)
          @diarization_speaker_count = args[:diarization_speaker_count] if args.key?(:diarization_speaker_count)
          @enable_automatic_punctuation = args[:enable_automatic_punctuation] if args.key?(:enable_automatic_punctuation)
          @enable_separate_recognition_per_channel = args[:enable_separate_recognition_per_channel] if args.key?(:enable_separate_recognition_per_channel)
          @enable_speaker_diarization = args[:enable_speaker_diarization] if args.key?(:enable_speaker_diarization)
          @enable_word_confidence = args[:enable_word_confidence] if args.key?(:enable_word_confidence)
          @enable_word_time_offsets = args[:enable_word_time_offsets] if args.key?(:enable_word_time_offsets)
          @encoding = args[:encoding] if args.key?(:encoding)
          @language_code = args[:language_code] if args.key?(:language_code)
          @max_alternatives = args[:max_alternatives] if args.key?(:max_alternatives)
          @metadata = args[:metadata] if args.key?(:metadata)
          @model = args[:model] if args.key?(:model)
          @profanity_filter = args[:profanity_filter] if args.key?(:profanity_filter)
          @sample_rate_hertz = args[:sample_rate_hertz] if args.key?(:sample_rate_hertz)
          @speech_contexts = args[:speech_contexts] if args.key?(:speech_contexts)
          @use_enhanced = args[:use_enhanced] if args.key?(:use_enhanced)
        end
      end
      
      # Description of audio data to be recognized.
      class RecognitionMetadata
        include Google::Apis::Core::Hashable
      
        # Description of the content. Eg. "Recordings of federal supreme court
        # hearings from 2012".
        # Corresponds to the JSON property `audioTopic`
        # @return [String]
        attr_accessor :audio_topic
      
        # The industry vertical to which this speech recognition request most
        # closely applies. This is most indicative of the topics contained
        # in the audio.  Use the 6-digit NAICS code to identify the industry
        # vertical - see https://www.naics.com/search/.
        # Corresponds to the JSON property `industryNaicsCodeOfAudio`
        # @return [Fixnum]
        attr_accessor :industry_naics_code_of_audio
      
        # The use case most closely describing the audio content to be recognized.
        # Corresponds to the JSON property `interactionType`
        # @return [String]
        attr_accessor :interaction_type
      
        # The audio type that most closely describes the audio being recognized.
        # Corresponds to the JSON property `microphoneDistance`
        # @return [String]
        attr_accessor :microphone_distance
      
        # Obfuscated (privacy-protected) ID of the user, to identify number of
        # unique users using the service.
        # Corresponds to the JSON property `obfuscatedId`
        # @return [Fixnum]
        attr_accessor :obfuscated_id
      
        # The original media the speech was recorded on.
        # Corresponds to the JSON property `originalMediaType`
        # @return [String]
        attr_accessor :original_media_type
      
        # Mime type of the original audio file.  For example `audio/m4a`,
        # `audio/x-alaw-basic`, `audio/mp3`, `audio/3gpp`.
        # A list of possible audio mime types is maintained at
        # http://www.iana.org/assignments/media-types/media-types.xhtml#audio
        # Corresponds to the JSON property `originalMimeType`
        # @return [String]
        attr_accessor :original_mime_type
      
        # The device used to make the recording.  Examples 'Nexus 5X' or
        # 'Polycom SoundStation IP 6000' or 'POTS' or 'VoIP' or
        # 'Cardioid Microphone'.
        # Corresponds to the JSON property `recordingDeviceName`
        # @return [String]
        attr_accessor :recording_device_name
      
        # The type of device the speech was recorded with.
        # Corresponds to the JSON property `recordingDeviceType`
        # @return [String]
        attr_accessor :recording_device_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @audio_topic = args[:audio_topic] if args.key?(:audio_topic)
          @industry_naics_code_of_audio = args[:industry_naics_code_of_audio] if args.key?(:industry_naics_code_of_audio)
          @interaction_type = args[:interaction_type] if args.key?(:interaction_type)
          @microphone_distance = args[:microphone_distance] if args.key?(:microphone_distance)
          @obfuscated_id = args[:obfuscated_id] if args.key?(:obfuscated_id)
          @original_media_type = args[:original_media_type] if args.key?(:original_media_type)
          @original_mime_type = args[:original_mime_type] if args.key?(:original_mime_type)
          @recording_device_name = args[:recording_device_name] if args.key?(:recording_device_name)
          @recording_device_type = args[:recording_device_type] if args.key?(:recording_device_type)
        end
      end
      
      # The top-level message sent by the client for the `Recognize` method.
      class RecognizeRequest
        include Google::Apis::Core::Hashable
      
        # Contains audio data in the encoding specified in the `RecognitionConfig`.
        # Either `content` or `uri` must be supplied. Supplying both or neither
        # returns google.rpc.Code.INVALID_ARGUMENT. See
        # [content limits](https://cloud.google.com/speech-to-text/quotas#content).
        # Corresponds to the JSON property `audio`
        # @return [Google::Apis::SpeechV1p1beta1::RecognitionAudio]
        attr_accessor :audio
      
        # Provides information to the recognizer that specifies how to process the
        # request.
        # Corresponds to the JSON property `config`
        # @return [Google::Apis::SpeechV1p1beta1::RecognitionConfig]
        attr_accessor :config
      
        # Use `model` field in RecognitionConfig instead.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @audio = args[:audio] if args.key?(:audio)
          @config = args[:config] if args.key?(:config)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # The only message returned to the client by the `Recognize` method. It
      # contains the result as zero or more sequential `SpeechRecognitionResult`
      # messages.
      class RecognizeResponse
        include Google::Apis::Core::Hashable
      
        # Sequential list of transcription results corresponding to
        # sequential portions of audio.
        # Corresponds to the JSON property `results`
        # @return [Array<Google::Apis::SpeechV1p1beta1::SpeechRecognitionResult>]
        attr_accessor :results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @results = args[:results] if args.key?(:results)
        end
      end
      
      # Config to enable speaker diarization.
      class SpeakerDiarizationConfig
        include Google::Apis::Core::Hashable
      
        # If 'true', enables speaker detection for each recognized word in
        # the top alternative of the recognition result using a speaker_tag provided
        # in the WordInfo.
        # Corresponds to the JSON property `enableSpeakerDiarization`
        # @return [Boolean]
        attr_accessor :enable_speaker_diarization
        alias_method :enable_speaker_diarization?, :enable_speaker_diarization
      
        # Maximum number of speakers in the conversation. This range gives you more
        # flexibility by allowing the system to automatically determine the correct
        # number of speakers. If not set, the default value is 6.
        # Corresponds to the JSON property `maxSpeakerCount`
        # @return [Fixnum]
        attr_accessor :max_speaker_count
      
        # Minimum number of speakers in the conversation. This range gives you more
        # flexibility by allowing the system to automatically determine the correct
        # number of speakers. If not set, the default value is 2.
        # Corresponds to the JSON property `minSpeakerCount`
        # @return [Fixnum]
        attr_accessor :min_speaker_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enable_speaker_diarization = args[:enable_speaker_diarization] if args.key?(:enable_speaker_diarization)
          @max_speaker_count = args[:max_speaker_count] if args.key?(:max_speaker_count)
          @min_speaker_count = args[:min_speaker_count] if args.key?(:min_speaker_count)
        end
      end
      
      # Provides "hints" to the speech recognizer to favor specific words and phrases
      # in the results.
      class SpeechContext
        include Google::Apis::Core::Hashable
      
        # Hint Boost. Positive value will increase the probability that a specific
        # phrase will be recognized over other similar sounding phrases. The higher
        # the boost, the higher the chance of false positive recognition as well.
        # Negative boost values would correspond to anti-biasing. Anti-biasing is not
        # enabled, so negative boost will simply be ignored. Though `boost` can
        # accept a wide range of positive values, most use cases are best served with
        # values between 0 and 20. We recommend using a binary search approach to
        # finding the optimal value for your use case.
        # Corresponds to the JSON property `boost`
        # @return [Float]
        attr_accessor :boost
      
        # A list of strings containing words and phrases "hints" so that
        # the speech recognition is more likely to recognize them. This can be used
        # to improve the accuracy for specific words and phrases, for example, if
        # specific commands are typically spoken by the user. This can also be used
        # to add additional words to the vocabulary of the recognizer. See
        # [usage limits](https://cloud.google.com/speech-to-text/quotas#content).
        # List items can also be set to classes for groups of words that represent
        # common concepts that occur in natural language. For example, rather than
        # providing phrase hints for every month of the year, using the $MONTH class
        # improves the likelihood of correctly transcribing audio that includes
        # months.
        # Corresponds to the JSON property `phrases`
        # @return [Array<String>]
        attr_accessor :phrases
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @boost = args[:boost] if args.key?(:boost)
          @phrases = args[:phrases] if args.key?(:phrases)
        end
      end
      
      # Alternative hypotheses (a.k.a. n-best list).
      class SpeechRecognitionAlternative
        include Google::Apis::Core::Hashable
      
        # The confidence estimate between 0.0 and 1.0. A higher number
        # indicates an estimated greater likelihood that the recognized words are
        # correct. This field is set only for the top alternative of a non-streaming
        # result or, of a streaming result where `is_final=true`.
        # This field is not guaranteed to be accurate and users should not rely on it
        # to be always provided.
        # The default of 0.0 is a sentinel value indicating `confidence` was not set.
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Transcript text representing the words that the user spoke.
        # Corresponds to the JSON property `transcript`
        # @return [String]
        attr_accessor :transcript
      
        # A list of word-specific information for each recognized word.
        # Note: When `enable_speaker_diarization` is true, you will see all the words
        # from the beginning of the audio.
        # Corresponds to the JSON property `words`
        # @return [Array<Google::Apis::SpeechV1p1beta1::WordInfo>]
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
      
        # May contain one or more recognition hypotheses (up to the
        # maximum specified in `max_alternatives`).
        # These alternatives are ordered in terms of accuracy, with the top (first)
        # alternative being the most probable, as ranked by the recognizer.
        # Corresponds to the JSON property `alternatives`
        # @return [Array<Google::Apis::SpeechV1p1beta1::SpeechRecognitionAlternative>]
        attr_accessor :alternatives
      
        # For multi-channel audio, this is the channel number corresponding to the
        # recognized result for the audio from that channel.
        # For audio_channel_count = N, its output values can range from '1' to 'N'.
        # Corresponds to the JSON property `channelTag`
        # @return [Fixnum]
        attr_accessor :channel_tag
      
        # The [BCP-47](https://www.rfc-editor.org/rfc/bcp/bcp47.txt) language tag
        # of the language in this result. This language code was detected to have
        # the most likelihood of being spoken in the audio.
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
      
        # The confidence estimate between 0.0 and 1.0. A higher number
        # indicates an estimated greater likelihood that the recognized words are
        # correct. This field is set only for the top alternative of a non-streaming
        # result or, of a streaming result where `is_final=true`.
        # This field is not guaranteed to be accurate and users should not rely on it
        # to be always provided.
        # The default of 0.0 is a sentinel value indicating `confidence` was not set.
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Time offset relative to the beginning of the audio,
        # and corresponding to the end of the spoken word.
        # This field is only set if `enable_word_time_offsets=true` and only
        # in the top hypothesis.
        # This is an experimental feature and the accuracy of the time offset can
        # vary.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # A distinct integer value is assigned for every speaker within
        # the audio. This field specifies which one of those speakers was detected to
        # have spoken this word. Value ranges from '1' to diarization_speaker_count.
        # speaker_tag is set if enable_speaker_diarization = 'true' and only in the
        # top alternative.
        # Corresponds to the JSON property `speakerTag`
        # @return [Fixnum]
        attr_accessor :speaker_tag
      
        # Time offset relative to the beginning of the audio,
        # and corresponding to the start of the spoken word.
        # This field is only set if `enable_word_time_offsets=true` and only
        # in the top hypothesis.
        # This is an experimental feature and the accuracy of the time offset can
        # vary.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # The word corresponding to this set of information.
        # Corresponds to the JSON property `word`
        # @return [String]
        attr_accessor :word
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @end_time = args[:end_time] if args.key?(:end_time)
          @speaker_tag = args[:speaker_tag] if args.key?(:speaker_tag)
          @start_time = args[:start_time] if args.key?(:start_time)
          @word = args[:word] if args.key?(:word)
        end
      end
    end
  end
end
