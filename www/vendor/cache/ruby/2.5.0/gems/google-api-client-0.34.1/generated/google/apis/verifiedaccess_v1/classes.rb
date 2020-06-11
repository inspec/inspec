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
      
      # Result message for VerifiedAccess.CreateChallenge.
      class Challenge
        include Google::Apis::Core::Hashable
      
        # The wrapper message of any data and its signature.
        # Corresponds to the JSON property `alternativeChallenge`
        # @return [Google::Apis::VerifiedaccessV1::SignedData]
        attr_accessor :alternative_challenge
      
        # The wrapper message of any data and its signature.
        # Corresponds to the JSON property `challenge`
        # @return [Google::Apis::VerifiedaccessV1::SignedData]
        attr_accessor :challenge
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alternative_challenge = args[:alternative_challenge] if args.key?(:alternative_challenge)
          @challenge = args[:challenge] if args.key?(:challenge)
        end
      end
      
      # A generic empty message that you can re-use to avoid defining duplicated
      # empty messages in your APIs. A typical example is to use it as the request
      # or the response type of an API method. For instance:
      # service Foo `
      # rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);
      # `
      # The JSON representation for `Empty` is empty JSON object ````.
      class Empty
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # The wrapper message of any data and its signature.
      class SignedData
        include Google::Apis::Core::Hashable
      
        # The data to be signed.
        # Corresponds to the JSON property `data`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :data
      
        # The signature of the data field.
        # Corresponds to the JSON property `signature`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :signature
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data = args[:data] if args.key?(:data)
          @signature = args[:signature] if args.key?(:signature)
        end
      end
      
      # signed ChallengeResponse
      class VerifyChallengeResponseRequest
        include Google::Apis::Core::Hashable
      
        # The wrapper message of any data and its signature.
        # Corresponds to the JSON property `challengeResponse`
        # @return [Google::Apis::VerifiedaccessV1::SignedData]
        attr_accessor :challenge_response
      
        # Service can optionally provide identity information about the device
        # or user associated with the key.
        # For an EMK, this value is the enrolled domain.
        # For an EUK, this value is the user's email address.
        # If present, this value will be checked against contents
        # of the response, and verification will fail if there is no match.
        # Corresponds to the JSON property `expectedIdentity`
        # @return [String]
        attr_accessor :expected_identity
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @challenge_response = args[:challenge_response] if args.key?(:challenge_response)
          @expected_identity = args[:expected_identity] if args.key?(:expected_identity)
        end
      end
      
      # Result message for VerifiedAccess.VerifyChallengeResponse.
      class VerifyChallengeResponseResult
        include Google::Apis::Core::Hashable
      
        # Device enrollment id is returned in this field (for the machine response
        # only).
        # Corresponds to the JSON property `deviceEnrollmentId`
        # @return [String]
        attr_accessor :device_enrollment_id
      
        # Device permanent id is returned in this field (for the machine response
        # only).
        # Corresponds to the JSON property `devicePermanentId`
        # @return [String]
        attr_accessor :device_permanent_id
      
        # Certificate Signing Request (in the SPKAC format, base64 encoded) is
        # returned in this field. This field will be set only if device has included
        # CSR in its challenge response.
        # (the option to include CSR is now available for both user and machine
        # responses)
        # Corresponds to the JSON property `signedPublicKeyAndChallenge`
        # @return [String]
        attr_accessor :signed_public_key_and_challenge
      
        # For EMCert check, device permanent id is returned here.
        # For EUCert check, signed_public_key_and_challenge [base64 encoded]
        # is returned if present, otherwise empty string is returned.
        # This field is deprecated, please use device_permanent_id or
        # signed_public_key_and_challenge fields.
        # Corresponds to the JSON property `verificationOutput`
        # @return [String]
        attr_accessor :verification_output
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @device_enrollment_id = args[:device_enrollment_id] if args.key?(:device_enrollment_id)
          @device_permanent_id = args[:device_permanent_id] if args.key?(:device_permanent_id)
          @signed_public_key_and_challenge = args[:signed_public_key_and_challenge] if args.key?(:signed_public_key_and_challenge)
          @verification_output = args[:verification_output] if args.key?(:verification_output)
        end
      end
    end
  end
end
