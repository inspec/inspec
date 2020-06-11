# Copyright 2016 Shawn Neal <sneal@sneal.net>
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
    # WSMV message to close a remote shell
    class CloseShell < Base
      def initialize(session_opts, shell_opts)
        raise 'shell_opts[:shell_id] is required' unless shell_opts[:shell_id]

        @session_opts = session_opts
        @shell_id = shell_opts[:shell_id]
        @shell_uri = shell_opts[:shell_uri] || RESOURCE_URI_CMD
      end

      protected

      def create_header(header)
        header << Gyoku.xml(close_header)
      end

      def create_body(_body)
        # no body
      end

      private

      def close_header
        merge_headers(shared_headers(@session_opts),
                      resource_uri_shell(@shell_uri),
                      action_delete,
                      selector_shell_id(@shell_id))
      end
    end
  end
end
