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

require "redis"
require "googleauth/token_store"

module Google
  module Auth
    module Stores
      # Implementation of user token storage backed by Redis. Tokens
      # are stored as JSON using the supplied key, prefixed with
      # `g-user-token:`
      class RedisTokenStore < Google::Auth::TokenStore
        DEFAULT_KEY_PREFIX = "g-user-token:".freeze

        # Create a new store with the supplied redis client.
        #
        # @param [::Redis, String] redis
        #  Initialized redis client to connect to.
        # @param [String] prefix
        #  Prefix for keys in redis. Defaults to 'g-user-token:'
        # @note If no redis instance is provided, a new one is created and
        #  the options passed through. You may include any other keys accepted
        #  by `Redis.new`
        def initialize options = {}
          redis = options.delete :redis
          prefix = options.delete :prefix
          @redis = case redis
                   when Redis
                     redis
                   else
                     Redis.new options
                   end
          @prefix = prefix || DEFAULT_KEY_PREFIX
        end

        # (see Google::Auth::Stores::TokenStore#load)
        def load id
          key = key_for id
          @redis.get key
        end

        # (see Google::Auth::Stores::TokenStore#store)
        def store id, token
          key = key_for id
          @redis.set key, token
        end

        # (see Google::Auth::Stores::TokenStore#delete)
        def delete id
          key = key_for id
          @redis.del key
        end

        private

        # Generate a redis key from a token ID
        #
        # @param [String] id
        #  ID of the token
        # @return [String]
        #  Redis key
        def key_for id
          @prefix + id
        end
      end
    end
  end
end
