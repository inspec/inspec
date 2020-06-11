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
    class KeepAlive < Base
      attr_accessor :shell_id

      def initialize(session_opts, shell_id)
        @session_opts = session_opts
        @shell_id = shell_id
      end

      protected

      def create_header(header)
        header << Gyoku.xml(keep_alive_headers)
      end

      def create_body(body)
        body.tag!("#{NS_WIN_SHELL}:Receive") { |s| s << Gyoku.xml(keep_alive_body) }
      end

      private

      def keep_alive_body
        { "#{NS_WIN_SHELL}:DesiredStream" => 'stdout' }
      end

      def keep_alive_headers
        merge_headers(shared_headers(@session_opts),
                      resource_uri_shell(RESOURCE_URI_POWERSHELL),
                      action_receive,
                      header_opts,
                      selector_shell_id(shell_id))
      end

      def header_opts
        {
          "#{NS_WSMAN_DMTF}:OptionSet" => {
            "#{NS_WSMAN_DMTF}:Option" => 'TRUE',
            :attributes! => {
              "#{NS_WSMAN_DMTF}:Option" => {
                'Name' => 'WSMAN_CMDSHELL_OPTION_KEEPALIVE'
              }
            }
          }
        }
      end
    end
  end
end
