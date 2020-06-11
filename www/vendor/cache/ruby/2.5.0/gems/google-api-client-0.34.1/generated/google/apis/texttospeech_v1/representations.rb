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
    module TexttospeechV1
      
      class AudioConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListVoicesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SynthesisInput
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SynthesizeSpeechRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SynthesizeSpeechResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Voice
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VoiceSelectionParams
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AudioConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :audio_encoding, as: 'audioEncoding'
          collection :effects_profile_id, as: 'effectsProfileId'
          property :pitch, as: 'pitch'
          property :sample_rate_hertz, as: 'sampleRateHertz'
          property :speaking_rate, as: 'speakingRate'
          property :volume_gain_db, as: 'volumeGainDb'
        end
      end
      
      class ListVoicesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :voices, as: 'voices', class: Google::Apis::TexttospeechV1::Voice, decorator: Google::Apis::TexttospeechV1::Voice::Representation
      
        end
      end
      
      class SynthesisInput
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ssml, as: 'ssml'
          property :text, as: 'text'
        end
      end
      
      class SynthesizeSpeechRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :audio_config, as: 'audioConfig', class: Google::Apis::TexttospeechV1::AudioConfig, decorator: Google::Apis::TexttospeechV1::AudioConfig::Representation
      
          property :input, as: 'input', class: Google::Apis::TexttospeechV1::SynthesisInput, decorator: Google::Apis::TexttospeechV1::SynthesisInput::Representation
      
          property :voice, as: 'voice', class: Google::Apis::TexttospeechV1::VoiceSelectionParams, decorator: Google::Apis::TexttospeechV1::VoiceSelectionParams::Representation
      
        end
      end
      
      class SynthesizeSpeechResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :audio_content, :base64 => true, as: 'audioContent'
        end
      end
      
      class Voice
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :language_codes, as: 'languageCodes'
          property :name, as: 'name'
          property :natural_sample_rate_hertz, as: 'naturalSampleRateHertz'
          property :ssml_gender, as: 'ssmlGender'
        end
      end
      
      class VoiceSelectionParams
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :language_code, as: 'languageCode'
          property :name, as: 'name'
          property :ssml_gender, as: 'ssmlGender'
        end
      end
    end
  end
end
