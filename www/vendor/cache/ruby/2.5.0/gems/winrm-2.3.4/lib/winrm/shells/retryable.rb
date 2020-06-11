# Copyright 2016 Shawn Neal <sneal@sneal.net>
# Copyright 2015 Matt Wrock <matt@mattwrock.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require_relative '../exceptions'

module WinRM
  module Shells
    # Shell mixin for retrying an operation
    module Retryable
      RETRYABLE_EXCEPTIONS = lambda do
        [
          Errno::EACCES, Errno::EADDRINUSE, Errno::ECONNREFUSED, Errno::ETIMEDOUT,
          Errno::ECONNRESET, Errno::ENETUNREACH, Errno::EHOSTUNREACH, ::WinRM::WinRMWSManFault,
          ::WinRM::WinRMHTTPTransportError, ::WinRM::WinRMAuthorizationError,
          HTTPClient::KeepAliveDisconnected, HTTPClient::ConnectTimeoutError
        ].freeze
      end

      # Retries the operation a specified number of times with a delay between
      # @param retries [Integer] The number of times to retry
      # @param delay [Integer] The number of seconds to wait between retry attempts
      def retryable(retries, delay)
        yield
      rescue *RETRYABLE_EXCEPTIONS.call
        raise unless (retries -= 1) > 0

        sleep(delay)
        retry
      end
    end
  end
end
