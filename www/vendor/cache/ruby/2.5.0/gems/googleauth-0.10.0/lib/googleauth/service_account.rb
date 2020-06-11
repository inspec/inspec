# Copyright 2015, Google Inc.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
#     * Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above
# copyright notice, this list of conditions and the following disclaimer
# in the documentation and/or other materials provided with the
# distribution.
#     * Neither the name of Google Inc. nor the names of its
# contributors may be used to endorse or promote products derived from
# this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

require "googleauth/signet"
require "googleauth/credentials_loader"
require "googleauth/json_key_reader"
require "jwt"
require "multi_json"
require "stringio"

module Google
  # Module Auth provides classes that provide Google-specific authorization
  # used to access Google APIs.
  module Auth
    # Authenticates requests using Google's Service Account credentials via an
    # OAuth access token.
    #
    # This class allows authorizing requests for service accounts directly
    # from credentials from a json key file downloaded from the developer
    # console (via 'Generate new Json Key').
    #
    # cf [Application Default Credentials](http://goo.gl/mkAHpZ)
    class ServiceAccountCredentials < Signet::OAuth2::Client
      TOKEN_CRED_URI = "https://www.googleapis.com/oauth2/v4/token".freeze
      extend CredentialsLoader
      extend JsonKeyReader
      attr_reader :project_id

      # Creates a ServiceAccountCredentials.
      #
      # @param json_key_io [IO] an IO from which the JSON key can be read
      # @param scope [string|array|nil] the scope(s) to access
      def self.make_creds options = {}
        json_key_io, scope = options.values_at :json_key_io, :scope
        if json_key_io
          private_key, client_email, project_id = read_json_key json_key_io
        else
          private_key = unescape ENV[CredentialsLoader::PRIVATE_KEY_VAR]
          client_email = ENV[CredentialsLoader::CLIENT_EMAIL_VAR]
          project_id = ENV[CredentialsLoader::PROJECT_ID_VAR]
        end
        project_id ||= CredentialsLoader.load_gcloud_project_id

        new(token_credential_uri: TOKEN_CRED_URI,
            audience:             TOKEN_CRED_URI,
            scope:                scope,
            issuer:               client_email,
            signing_key:          OpenSSL::PKey::RSA.new(private_key),
            project_id:           project_id)
          .configure_connection(options)
      end

      # Handles certain escape sequences that sometimes appear in input.
      # Specifically, interprets the "\n" sequence for newline, and removes
      # enclosing quotes.
      def self.unescape str
        str = str.gsub '\n', "\n"
        str = str[1..-2] if str.start_with?('"') && str.end_with?('"')
        str
      end

      def initialize options = {}
        @project_id = options[:project_id]
        super options
      end

      # Extends the base class.
      #
      # If scope(s) is not set, it creates a transient
      # ServiceAccountJwtHeaderCredentials instance and uses that to
      # authenticate instead.
      def apply! a_hash, opts = {}
        # Use the base implementation if scopes are set
        unless scope.nil?
          super
          return
        end

        # Use the ServiceAccountJwtHeaderCredentials using the same cred values
        # if no scopes are set.
        cred_json = {
          private_key:  @signing_key.to_s,
          client_email: @issuer
        }
        alt_clz = ServiceAccountJwtHeaderCredentials
        key_io = StringIO.new MultiJson.dump(cred_json)
        alt = alt_clz.make_creds json_key_io: key_io
        alt.apply! a_hash
      end
    end

    # Authenticates requests using Google's Service Account credentials via
    # JWT Header.
    #
    # This class allows authorizing requests for service accounts directly
    # from credentials from a json key file downloaded from the developer
    # console (via 'Generate new Json Key').  It is not part of any OAuth2
    # flow, rather it creates a JWT and sends that as a credential.
    #
    # cf [Application Default Credentials](http://goo.gl/mkAHpZ)
    class ServiceAccountJwtHeaderCredentials
      JWT_AUD_URI_KEY = :jwt_aud_uri
      AUTH_METADATA_KEY = Signet::OAuth2::AUTH_METADATA_KEY
      TOKEN_CRED_URI = "https://www.googleapis.com/oauth2/v4/token".freeze
      SIGNING_ALGORITHM = "RS256".freeze
      EXPIRY = 60
      extend CredentialsLoader
      extend JsonKeyReader
      attr_reader :project_id

      # make_creds proxies the construction of a credentials instance
      #
      # make_creds is used by the methods in CredentialsLoader.
      #
      # By default, it calls #new with 2 args, the second one being an
      # optional scope. Here's the constructor only has one param, so
      # we modify make_creds to reflect this.
      def self.make_creds *args
        new json_key_io: args[0][:json_key_io]
      end

      # Initializes a ServiceAccountJwtHeaderCredentials.
      #
      # @param json_key_io [IO] an IO from which the JSON key can be read
      def initialize options = {}
        json_key_io = options[:json_key_io]
        if json_key_io
          @private_key, @issuer, @project_id =
            self.class.read_json_key json_key_io
        else
          @private_key = ENV[CredentialsLoader::PRIVATE_KEY_VAR]
          @issuer = ENV[CredentialsLoader::CLIENT_EMAIL_VAR]
          @project_id = ENV[CredentialsLoader::PROJECT_ID_VAR]
        end
        @project_id ||= CredentialsLoader.load_gcloud_project_id
        @signing_key = OpenSSL::PKey::RSA.new @private_key
      end

      # Construct a jwt token if the JWT_AUD_URI key is present in the input
      # hash.
      #
      # The jwt token is used as the value of a 'Bearer '.
      def apply! a_hash, opts = {}
        jwt_aud_uri = a_hash.delete JWT_AUD_URI_KEY
        return a_hash if jwt_aud_uri.nil?
        jwt_token = new_jwt_token jwt_aud_uri, opts
        a_hash[AUTH_METADATA_KEY] = "Bearer #{jwt_token}"
        a_hash
      end

      # Returns a clone of a_hash updated with the authoriation header
      def apply a_hash, opts = {}
        a_copy = a_hash.clone
        apply! a_copy, opts
        a_copy
      end

      # Returns a reference to the #apply method, suitable for passing as
      # a closure
      def updater_proc
        lambda(&method(:apply))
      end

      protected

      # Creates a jwt uri token.
      def new_jwt_token jwt_aud_uri, options = {}
        now = Time.new
        skew = options[:skew] || 60
        assertion = {
          "iss" => @issuer,
          "sub" => @issuer,
          "aud" => jwt_aud_uri,
          "exp" => (now + EXPIRY).to_i,
          "iat" => (now - skew).to_i
        }
        JWT.encode assertion, @signing_key, SIGNING_ALGORITHM
      end
    end
  end
end
