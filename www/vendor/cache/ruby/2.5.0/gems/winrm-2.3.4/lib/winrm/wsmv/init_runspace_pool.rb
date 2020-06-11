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
    # WSMV message to create a remote shell
    class InitRunspacePool < Base
      attr_accessor :shell_id

      def initialize(session_opts, shell_id, payload)
        @session_opts = session_opts
        @shell_id = shell_id
        @payload = payload
      end

      protected

      def create_header(header)
        header << Gyoku.xml(shell_headers)
      end

      def create_body(body)
        # OMI server requires a Name for the Shell
        body.tag!("#{NS_WIN_SHELL}:Shell", 'ShellId' => shell_id, 'Name' => 'Runspace') do |s|
          s << Gyoku.xml(shell_body)
        end
      end

      private

      def shell_body
        body = {
          "#{NS_WIN_SHELL}:InputStreams" => 'stdin pr',
          "#{NS_WIN_SHELL}:OutputStreams" => 'stdout'
        }
        body['creationXml'] = encode_bytes(@payload)
        body[:attributes!] = {
          'creationXml' => {
            'xmlns' => 'http://schemas.microsoft.com/powershell'
          }
        }
        body
      end

      def shell_headers
        merge_headers(shared_headers(@session_opts),
                      resource_uri_shell(RESOURCE_URI_POWERSHELL),
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
            "#{NS_WSMAN_DMTF}:Option" => 2.3,
            :attributes! => {
              "#{NS_WSMAN_DMTF}:Option" => {
                'Name' => 'protocolversion',
                'MustComply' => 'true'
              }
            }
          },
          :attributes! => {
            "#{NS_WSMAN_DMTF}:OptionSet" => {
              'env:mustUnderstand' => 'true'
            }
          }
        }
      end
    end
  end
end
