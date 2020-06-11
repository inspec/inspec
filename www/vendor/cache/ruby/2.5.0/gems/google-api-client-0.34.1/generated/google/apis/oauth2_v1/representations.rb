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
    module Oauth2V1
      
      class Tokeninfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Userinfoplus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Tokeninfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :access_type, as: 'access_type'
          property :audience, as: 'audience'
          property :email, as: 'email'
          property :email_verified, as: 'email_verified'
          property :expires_in, as: 'expires_in'
          property :issued_at, as: 'issued_at'
          property :issued_to, as: 'issued_to'
          property :issuer, as: 'issuer'
          property :nonce, as: 'nonce'
          property :scope, as: 'scope'
          property :user_id, as: 'user_id'
          property :verified_email, as: 'verified_email'
        end
      end
      
      class Userinfoplus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :email, as: 'email'
          property :family_name, as: 'family_name'
          property :gender, as: 'gender'
          property :given_name, as: 'given_name'
          property :hd, as: 'hd'
          property :id, as: 'id'
          property :link, as: 'link'
          property :locale, as: 'locale'
          property :name, as: 'name'
          property :picture, as: 'picture'
          property :verified_email, as: 'verified_email'
        end
      end
    end
  end
end
