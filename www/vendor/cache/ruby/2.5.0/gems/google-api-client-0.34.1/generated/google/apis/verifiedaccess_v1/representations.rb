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
    module VerifiedaccessV1
      
      class Challenge
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SignedData
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VerifyChallengeResponseRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VerifyChallengeResponseResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Challenge
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :alternative_challenge, as: 'alternativeChallenge', class: Google::Apis::VerifiedaccessV1::SignedData, decorator: Google::Apis::VerifiedaccessV1::SignedData::Representation
      
          property :challenge, as: 'challenge', class: Google::Apis::VerifiedaccessV1::SignedData, decorator: Google::Apis::VerifiedaccessV1::SignedData::Representation
      
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class SignedData
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :data, :base64 => true, as: 'data'
          property :signature, :base64 => true, as: 'signature'
        end
      end
      
      class VerifyChallengeResponseRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :challenge_response, as: 'challengeResponse', class: Google::Apis::VerifiedaccessV1::SignedData, decorator: Google::Apis::VerifiedaccessV1::SignedData::Representation
      
          property :expected_identity, as: 'expectedIdentity'
        end
      end
      
      class VerifyChallengeResponseResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :device_enrollment_id, as: 'deviceEnrollmentId'
          property :device_permanent_id, as: 'devicePermanentId'
          property :signed_public_key_and_challenge, as: 'signedPublicKeyAndChallenge'
          property :verification_output, as: 'verificationOutput'
        end
      end
    end
  end
end
