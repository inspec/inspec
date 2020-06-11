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
      
      # 
      class Tokeninfo
        include Google::Apis::Core::Hashable
      
        # The access type granted with this token. It can be offline or online.
        # Corresponds to the JSON property `access_type`
        # @return [String]
        attr_accessor :access_type
      
        # Who is the intended audience for this token. In general the same as issued_to.
        # Corresponds to the JSON property `audience`
        # @return [String]
        attr_accessor :audience
      
        # The email address of the user. Present only if the email scope is present in
        # the request.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # Boolean flag which is true if the email address is verified. Present only if
        # the email scope is present in the request.
        # Corresponds to the JSON property `email_verified`
        # @return [Boolean]
        attr_accessor :email_verified
        alias_method :email_verified?, :email_verified
      
        # The expiry time of the token, as number of seconds left until expiry.
        # Corresponds to the JSON property `expires_in`
        # @return [Fixnum]
        attr_accessor :expires_in
      
        # The issue time of the token, as number of seconds.
        # Corresponds to the JSON property `issued_at`
        # @return [Fixnum]
        attr_accessor :issued_at
      
        # To whom was the token issued to. In general the same as audience.
        # Corresponds to the JSON property `issued_to`
        # @return [String]
        attr_accessor :issued_to
      
        # Who issued the token.
        # Corresponds to the JSON property `issuer`
        # @return [String]
        attr_accessor :issuer
      
        # Nonce of the id token.
        # Corresponds to the JSON property `nonce`
        # @return [String]
        attr_accessor :nonce
      
        # The space separated list of scopes granted to this token.
        # Corresponds to the JSON property `scope`
        # @return [String]
        attr_accessor :scope
      
        # The obfuscated user id.
        # Corresponds to the JSON property `user_id`
        # @return [String]
        attr_accessor :user_id
      
        # Boolean flag which is true if the email address is verified. Present only if
        # the email scope is present in the request.
        # Corresponds to the JSON property `verified_email`
        # @return [Boolean]
        attr_accessor :verified_email
        alias_method :verified_email?, :verified_email
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @access_type = args[:access_type] if args.key?(:access_type)
          @audience = args[:audience] if args.key?(:audience)
          @email = args[:email] if args.key?(:email)
          @email_verified = args[:email_verified] if args.key?(:email_verified)
          @expires_in = args[:expires_in] if args.key?(:expires_in)
          @issued_at = args[:issued_at] if args.key?(:issued_at)
          @issued_to = args[:issued_to] if args.key?(:issued_to)
          @issuer = args[:issuer] if args.key?(:issuer)
          @nonce = args[:nonce] if args.key?(:nonce)
          @scope = args[:scope] if args.key?(:scope)
          @user_id = args[:user_id] if args.key?(:user_id)
          @verified_email = args[:verified_email] if args.key?(:verified_email)
        end
      end
      
      # 
      class Userinfoplus
        include Google::Apis::Core::Hashable
      
        # The user's email address.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # The user's last name.
        # Corresponds to the JSON property `family_name`
        # @return [String]
        attr_accessor :family_name
      
        # The user's gender.
        # Corresponds to the JSON property `gender`
        # @return [String]
        attr_accessor :gender
      
        # The user's first name.
        # Corresponds to the JSON property `given_name`
        # @return [String]
        attr_accessor :given_name
      
        # The hosted domain e.g. example.com if the user is Google apps user.
        # Corresponds to the JSON property `hd`
        # @return [String]
        attr_accessor :hd
      
        # The obfuscated ID of the user.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # URL of the profile page.
        # Corresponds to the JSON property `link`
        # @return [String]
        attr_accessor :link
      
        # The user's preferred locale.
        # Corresponds to the JSON property `locale`
        # @return [String]
        attr_accessor :locale
      
        # The user's full name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # URL of the user's picture image.
        # Corresponds to the JSON property `picture`
        # @return [String]
        attr_accessor :picture
      
        # Boolean flag which is true if the email address is verified. Always verified
        # because we only return the user's primary email address.
        # Corresponds to the JSON property `verified_email`
        # @return [Boolean]
        attr_accessor :verified_email
        alias_method :verified_email?, :verified_email
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @email = args[:email] if args.key?(:email)
          @family_name = args[:family_name] if args.key?(:family_name)
          @gender = args[:gender] if args.key?(:gender)
          @given_name = args[:given_name] if args.key?(:given_name)
          @hd = args[:hd] if args.key?(:hd)
          @id = args[:id] if args.key?(:id)
          @link = args[:link] if args.key?(:link)
          @locale = args[:locale] if args.key?(:locale)
          @name = args[:name] if args.key?(:name)
          @picture = args[:picture] if args.key?(:picture)
          @verified_email = args[:verified_email] if args.key?(:verified_email)
        end
      end
    end
  end
end
