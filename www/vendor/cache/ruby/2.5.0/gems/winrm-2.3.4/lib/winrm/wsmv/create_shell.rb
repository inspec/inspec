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
require_relative 'iso8601_duration'

module WinRM
  module WSMV
    # WSMV message to create a remote shell
    class CreateShell < Base
      # utf8 as default codepage
      # https://msdn.microsoft.com/en-us/library/dd317756(VS.85).aspx
      UTF8_CODE_PAGE = 65001

      attr_accessor :i_stream, :o_stream, :codepage, :noprofile
      attr_accessor :working_directory, :idle_timeout, :env_vars

      def initialize(session_opts, shell_opts = {})
        @session_opts = session_opts
        @shell_uri = opt_or_default(shell_opts, :shell_uri, RESOURCE_URI_CMD)
        @i_stream = opt_or_default(shell_opts, :i_stream, 'stdin')
        @o_stream = opt_or_default(shell_opts, :o_stream, 'stdout stderr')
        @codepage = opt_or_default(shell_opts, :codepage, UTF8_CODE_PAGE)
        @noprofile = opt_or_default(shell_opts, :noprofile, 'FALSE')
        @working_directory = opt_or_default(shell_opts, :working_directory)
        @idle_timeout = opt_or_default(shell_opts, :idle_timeout)
        @env_vars = opt_or_default(shell_opts, :env_vars)
      end

      protected

      def create_header(header)
        header << Gyoku.xml(shell_headers)
      end

      def create_body(body)
        body.tag!("#{NS_WIN_SHELL}:Shell") { |s| s << Gyoku.xml(shell_body) }
      end

      private

      def opt_or_default(shell_opts, key, default_value = nil)
        shell_opts.key?(key) ? shell_opts[key] : default_value
      end

      def shell_body
        body = {
          "#{NS_WIN_SHELL}:InputStreams" => @i_stream,
          "#{NS_WIN_SHELL}:OutputStreams" => @o_stream
        }
        body["#{NS_WIN_SHELL}:WorkingDirectory"] = @working_directory if @working_directory
        body["#{NS_WIN_SHELL}:IdleTimeOut"] = format_idle_timeout(@idle_timeout) if @idle_timeout
        body["#{NS_WIN_SHELL}:Environment"] = environment_vars_body if @env_vars
        body
      end

      # backwards compat - idle_timeout as an Iso8601Duration string
      def format_idle_timeout(timeout)
        timeout.is_a?(String) ? timeout : Iso8601Duration.sec_to_dur(timeout)
      end

      def environment_vars_body
        {
          "#{NS_WIN_SHELL}:Variable" => @env_vars.values,
          :attributes! => {
            "#{NS_WIN_SHELL}:Variable" => {
              'Name' => @env_vars.keys
            }
          }
        }
      end

      def shell_headers
        merge_headers(shared_headers(@session_opts),
                      resource_uri_shell(@shell_uri),
                      action_create,
                      header_opts)
      end

      def action_create
        {
          "#{NS_ADDRESSING}:Action" => 'http://schemas.xmlsoap.org/ws/2004/09/transfer/Create',
          :attributes! => {
            "#{NS_ADDRESSING}:Action" => {
              'mustUnderstand' => true
            }
          }
        }
      end

      def header_opts
        {
          "#{NS_WSMAN_DMTF}:OptionSet" => {
            "#{NS_WSMAN_DMTF}:Option" => [@noprofile, @codepage], :attributes! => {
              "#{NS_WSMAN_DMTF}:Option" => {
                'Name' => %w[WINRS_NOPROFILE WINRS_CODEPAGE]
              }
            }
          }
        }
      end
    end
  end
end
