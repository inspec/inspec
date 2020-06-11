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
    # WSMV message to get output from a remote shell
    class CommandOutput < Base
      def initialize(session_opts, command_out_opts)
        raise 'command_out_opts[:shell_id] is required' unless command_out_opts[:shell_id]
        raise 'command_out_opts[:command_id] is required' unless command_out_opts[:command_id]

        @session_opts = session_opts
        @shell_id = command_out_opts[:shell_id]
        @command_id = command_out_opts[:command_id]
        @shell_uri = command_out_opts[:shell_uri] || RESOURCE_URI_CMD
        @out_streams = command_out_opts[:out_streams] || %w[stdout stderr]
      end

      protected

      def create_header(header)
        header << Gyoku.xml(output_header)
      end

      def create_body(body)
        body.tag!("#{NS_WIN_SHELL}:Receive") { |cl| cl << Gyoku.xml(output_body) }
      end

      private

      def output_header
        merge_headers(shared_headers(@session_opts),
                      resource_uri_shell(@shell_uri),
                      action_receive,
                      header_opts,
                      selector_shell_id(@shell_id))
      end

      def header_opts
        {
          "#{NS_WSMAN_DMTF}:OptionSet" => {
            "#{NS_WSMAN_DMTF}:Option" => 'TRUE', :attributes! => {
              "#{NS_WSMAN_DMTF}:Option" => {
                'Name' => 'WSMAN_CMDSHELL_OPTION_KEEPALIVE'
              }
            }
          }
        }
      end

      def output_body
        {
          "#{NS_WIN_SHELL}:DesiredStream" => @out_streams.join(' '), :attributes! => {
            "#{NS_WIN_SHELL}:DesiredStream" => {
              'CommandId' => @command_id
            }
          }
        }
      end
    end
  end
end
