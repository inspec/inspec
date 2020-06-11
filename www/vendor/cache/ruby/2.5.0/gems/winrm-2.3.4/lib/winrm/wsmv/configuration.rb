# Copyright 2016 Matt Wrock <matt@mattwrock.com>
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

require_relative 'base'

module WinRM
  module WSMV
    # WSMV keep alive message
    class Configuration < Base
      def initialize(session_opts)
        @session_opts = session_opts
      end

      protected

      def create_header(header)
        header << Gyoku.xml(configuration_headers)
      end

      def create_body(_body)
        # no body
      end

      private

      def configuration_headers
        merge_headers(shared_headers(@session_opts),
                      resource_uri_shell('http://schemas.microsoft.com/wbem/wsman/1/config'),
                      action_get)
      end
    end
  end
end
