# Copyright 2014, Google Inc.
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

require "multi_json"
require "googleauth/credentials_loader"

module Google
  module Auth
    # Representation of an application's identity for user authorization
    # flows.
    class ClientId
      INSTALLED_APP = "installed".freeze
      WEB_APP = "web".freeze
      CLIENT_ID = "client_id".freeze
      CLIENT_SECRET = "client_secret".freeze
      MISSING_TOP_LEVEL_ELEMENT_ERROR =
        "Expected top level property 'installed' or 'web' to be present.".freeze

      # Text identifier of the client ID
      # @return [String]
      attr_reader :id

      # Secret associated with the client ID
      # @return [String]
      attr_reader :secret

      class << self
        attr_accessor :default
      end

      # Initialize the Client ID
      #
      # @param [String] id
      #  Text identifier of the client ID
      # @param [String] secret
      #  Secret associated with the client ID
      # @note Direction instantion is discouraged to avoid embedding IDs
      #       & secrets in source. See {#from_file} to load from
      #       `client_secrets.json` files.
      def initialize id, secret
        CredentialsLoader.warn_if_cloud_sdk_credentials id
        raise "Client id can not be nil" if id.nil?
        raise "Client secret can not be nil" if secret.nil?
        @id = id
        @secret = secret
      end

      # Constructs a Client ID from a JSON file downloaded from the
      # Google Developers Console.
      #
      # @param [String, File] file
      #  Path of file to read from
      # @return [Google::Auth::ClientID]
      def self.from_file file
        raise "File can not be nil." if file.nil?
        File.open file.to_s do |f|
          json = f.read
          config = MultiJson.load json
          from_hash config
        end
      end

      # Constructs a Client ID from a previously loaded JSON file. The hash
      # structure should
      # match the expected JSON format.
      #
      # @param [hash] config
      #  Parsed contents of the JSON file
      # @return [Google::Auth::ClientID]
      def self.from_hash config
        raise "Hash can not be nil." if config.nil?
        raw_detail = config[INSTALLED_APP] || config[WEB_APP]
        raise MISSING_TOP_LEVEL_ELEMENT_ERROR if raw_detail.nil?
        ClientId.new raw_detail[CLIENT_ID], raw_detail[CLIENT_SECRET]
      end
    end
  end
end
