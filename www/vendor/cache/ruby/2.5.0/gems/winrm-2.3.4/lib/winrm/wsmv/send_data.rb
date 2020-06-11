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
    # Subclasses base, sends additional data to WinRM
    class SendData < Base
      attr_accessor :shell_id, :command_id, :fragment

      def initialize(session_opts, shell_id, command_id, fragment)
        @session_opts = session_opts
        @shell_id = shell_id
        @command_id = command_id
        @fragment = fragment
      end

      protected

      def create_header(header)
        header << Gyoku.xml(command_headers)
      end

      def create_body(body)
        body.tag!("#{NS_WIN_SHELL}:Send") do |cl|
          cl << Gyoku.xml(command_body)
        end
      end

      private

      def command_body
        {
          "#{NS_WIN_SHELL}:Stream" => encode_bytes(fragment.bytes),
          :attributes! => {
            "#{NS_WIN_SHELL}:Stream" => {
              'Name' => 'stdin',
              'CommandId' => command_id
            }
          }
        }
      end

      def command_headers
        merge_headers(
          shared_headers(@session_opts),
          resource_uri_shell(RESOURCE_URI_POWERSHELL),
          action_send,
          selector_shell_id(shell_id)
        )
      end
    end
  end
end
