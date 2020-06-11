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
require "multi_json"

module Google
  # Module Auth provides classes that provide Google-specific authorization
  # used to access Google APIs.
  module Auth
    # Authenticates requests using IAM credentials.
    class IAMCredentials
      SELECTOR_KEY = "x-goog-iam-authority-selector".freeze
      TOKEN_KEY = "x-goog-iam-authorization-token".freeze

      # Initializes an IAMCredentials.
      #
      # @param selector the IAM selector.
      # @param token the IAM token.
      def initialize selector, token
        raise TypeError unless selector.is_a? String
        raise TypeError unless token.is_a? String
        @selector = selector
        @token = token
      end

      # Adds the credential fields to the hash.
      def apply! a_hash
        a_hash[SELECTOR_KEY] = @selector
        a_hash[TOKEN_KEY] = @token
        a_hash
      end

      # Returns a clone of a_hash updated with the authoriation header
      def apply a_hash
        a_copy = a_hash.clone
        apply! a_copy
        a_copy
      end

      # Returns a reference to the #apply method, suitable for passing as
      # a closure
      def updater_proc
        lambda(&method(:apply))
      end
    end
  end
end
