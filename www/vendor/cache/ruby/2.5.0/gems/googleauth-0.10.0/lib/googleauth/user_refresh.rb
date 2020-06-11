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
require "googleauth/scope_util"
require "multi_json"

module Google
  # Module Auth provides classes that provide Google-specific authorization
  # used to access Google APIs.
  module Auth
    # Authenticates requests using User Refresh credentials.
    #
    # This class allows authorizing requests from user refresh tokens.
    #
    # This the end of the result of a 3LO flow.  E.g, the end result of
    # 'gcloud auth login' saves a file with these contents in well known
    # location
    #
    # cf [Application Default Credentials](http://goo.gl/mkAHpZ)
    class UserRefreshCredentials < Signet::OAuth2::Client
      TOKEN_CRED_URI = "https://oauth2.googleapis.com/token".freeze
      AUTHORIZATION_URI = "https://accounts.google.com/o/oauth2/auth".freeze
      REVOKE_TOKEN_URI = "https://oauth2.googleapis.com/revoke".freeze
      extend CredentialsLoader
      attr_reader :project_id

      # Create a UserRefreshCredentials.
      #
      # @param json_key_io [IO] an IO from which the JSON key can be read
      # @param scope [string|array|nil] the scope(s) to access
      def self.make_creds options = {}
        json_key_io, scope = options.values_at :json_key_io, :scope
        user_creds = read_json_key json_key_io if json_key_io
        user_creds ||= {
          "client_id"     => ENV[CredentialsLoader::CLIENT_ID_VAR],
          "client_secret" => ENV[CredentialsLoader::CLIENT_SECRET_VAR],
          "refresh_token" => ENV[CredentialsLoader::REFRESH_TOKEN_VAR],
          "project_id"    => ENV[CredentialsLoader::PROJECT_ID_VAR]
        }

        new(token_credential_uri: TOKEN_CRED_URI,
            client_id:            user_creds["client_id"],
            client_secret:        user_creds["client_secret"],
            refresh_token:        user_creds["refresh_token"],
            project_id:           user_creds["project_id"],
            scope:                scope)
          .configure_connection(options)
      end

      # Reads the client_id, client_secret and refresh_token fields from the
      # JSON key.
      def self.read_json_key json_key_io
        json_key = MultiJson.load json_key_io.read
        wanted = ["client_id", "client_secret", "refresh_token"]
        wanted.each do |key|
          raise "the json is missing the #{key} field" unless json_key.key? key
        end
        json_key
      end

      def initialize options = {}
        options ||= {}
        options[:token_credential_uri] ||= TOKEN_CRED_URI
        options[:authorization_uri] ||= AUTHORIZATION_URI
        @project_id = options[:project_id]
        @project_id ||= CredentialsLoader.load_gcloud_project_id
        super options
      end

      # Revokes the credential
      def revoke! options = {}
        c = options[:connection] || Faraday.default_connection

        retry_with_error do
          resp = c.post(REVOKE_TOKEN_URI, token: refresh_token || access_token)
          case resp.status
          when 200
            self.access_token = nil
            self.refresh_token = nil
            self.expires_at = 0
          else
            raise(Signet::AuthorizationError,
                  "Unexpected error code #{resp.status}")
          end
        end
      end

      # Verifies that a credential grants the requested scope
      #
      # @param [Array<String>, String] required_scope
      #  Scope to verify
      # @return [Boolean]
      #  True if scope is granted
      def includes_scope? required_scope
        missing_scope = Google::Auth::ScopeUtil.normalize(required_scope) -
                        Google::Auth::ScopeUtil.normalize(scope)
        missing_scope.empty?
      end
    end
  end
end
