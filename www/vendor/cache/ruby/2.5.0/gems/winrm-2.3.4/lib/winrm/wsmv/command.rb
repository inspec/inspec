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
    # WSMV message to execute a command inside a remote shell
    class Command < Base
      attr_reader :command_id

      def initialize(session_opts, cmd_opts)
        @command_id = SecureRandom.uuid.to_s.upcase
        validate_opts(session_opts, cmd_opts)
        init_ops(session_opts, cmd_opts)
      end

      def build
        xml = super
        issue69_unescape_single_quotes(xml)
      end

      protected

      def create_header(header)
        header << Gyoku.xml(command_headers)
      end

      def create_body(body)
        body.tag!("#{NS_WIN_SHELL}:CommandLine", 'CommandId' => @command_id) do |cl|
          cl << Gyoku.xml(command_body)
        end
      end

      private

      def init_ops(session_opts, cmd_opts)
        @session_opts = session_opts
        @shell_id = cmd_opts[:shell_id]
        @command = cmd_opts[:command]
        @arguments = cmd_opts[:arguments] || []
        @shell_uri = cmd_opts[:shell_uri] || RESOURCE_URI_CMD
        @consolemode = cmd_opts.key?(:console_mode_stdin) ? cmd_opts[:console_mode_stdin] : 'TRUE'
        @skipcmd = cmd_opts.key?(:skip_cmd_shell) ? cmd_opts[:skip_cmd_shell] : 'FALSE'
      end

      def validate_opts(session_opts, cmd_opts)
        raise 'session_opts is required' unless session_opts
        raise 'cmd_opts[:shell_id] is required' unless cmd_opts[:shell_id]
        raise 'cmd_opts[:command] is required' unless cmd_opts[:command]
      end

      def issue69_unescape_single_quotes(xml)
        escaped_cmd = %r{<#{NS_WIN_SHELL}:Command>(.+)<\/#{NS_WIN_SHELL}:Command>}m.match(xml)[1]
        xml[escaped_cmd] = escaped_cmd.gsub(/&#39;/, "'")
        xml
      end

      def command_body
        {
          "#{NS_WIN_SHELL}:Command" => "\"#{@command}\"", "#{NS_WIN_SHELL}:Arguments" => @arguments
        }
      end

      def command_headers
        merge_headers(shared_headers(@session_opts),
                      resource_uri_shell(@shell_uri),
                      action_command,
                      command_header_opts,
                      selector_shell_id(@shell_id))
      end

      def command_header_opts
        return {} if @shell_uri != RESOURCE_URI_CMD

        # this is only needed for the regular Windows shell
        {
          "#{NS_WSMAN_DMTF}:OptionSet" => {
            "#{NS_WSMAN_DMTF}:Option" => [@consolemode, @skipcmd], :attributes! => {
              "#{NS_WSMAN_DMTF}:Option" => {
                'Name' => %w[WINRS_CONSOLEMODE_STDIN WINRS_SKIP_CMD_SHELL]
              }
            }
          }
        }
      end
    end
  end
end
