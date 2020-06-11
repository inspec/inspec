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

# rubocop:disable Metrics/MethodLength

require_relative 'soap'
require_relative 'iso8601_duration'

module WinRM
  module WSMV
    # SOAP header utility mixin
    module Header
      # WSMan URI of the regular Windows cmd shell
      RESOURCE_URI_CMD = 'http://schemas.microsoft.com/wbem/wsman/1/windows/shell/cmd'.freeze

      # WSMan URI for PowerShell
      RESOURCE_URI_POWERSHELL = 'http://schemas.microsoft.com/powershell/Microsoft.PowerShell'.freeze

      # Merge the various header hashes and make sure we carry all of the attributes
      # through instead of overwriting them.
      def merge_headers(*headers)
        hdr = {}
        headers.each do |h|
          hdr.merge!(h) do |k, v1, v2|
            v1.merge!(v2) if k == :attributes!
          end
        end
        hdr
      end

      def shared_headers(session_opts)
        {
          "#{SOAP::NS_ADDRESSING}:To" => session_opts[:endpoint],
          "#{SOAP::NS_ADDRESSING}:ReplyTo" => {
            "#{SOAP::NS_ADDRESSING}:Address" =>
              'http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous',
            :attributes! => {
              "#{SOAP::NS_ADDRESSING}:Address" => {
                'mustUnderstand' => true
              }
            }
          },
          "#{SOAP::NS_WSMAN_DMTF}:MaxEnvelopeSize" => session_opts[:max_envelope_size],
          "#{SOAP::NS_ADDRESSING}:MessageID" => "uuid:#{SecureRandom.uuid.to_s.upcase}",
          "#{SOAP::NS_WSMAN_MSFT}:SessionId" => "uuid:#{session_opts[:session_id]}",
          "#{SOAP::NS_WSMAN_DMTF}:Locale/" => '',
          "#{SOAP::NS_WSMAN_MSFT}:DataLocale/" => '',
          "#{SOAP::NS_WSMAN_DMTF}:OperationTimeout" =>
            Iso8601Duration.sec_to_dur(session_opts[:operation_timeout]),
          :attributes! => {
            "#{SOAP::NS_WSMAN_DMTF}:MaxEnvelopeSize" => { 'mustUnderstand' => true },
            "#{SOAP::NS_WSMAN_DMTF}:Locale/" => {
              'xml:lang' => session_opts[:locale], 'mustUnderstand' => false
            },
            "#{SOAP::NS_WSMAN_MSFT}:DataLocale/" => {
              'xml:lang' => session_opts[:locale], 'mustUnderstand' => false
            },
            "#{SOAP::NS_WSMAN_MSFT}:SessionId" => { 'mustUnderstand' => false }
          }
        }
      end

      # Helper methods for SOAP Headers

      def resource_uri_shell(shell_uri)
        {
          "#{SOAP::NS_WSMAN_DMTF}:ResourceURI" => shell_uri, :attributes! => {
            "#{SOAP::NS_WSMAN_DMTF}:ResourceURI" => {
              'mustUnderstand' => true
            }
          }
        }
      end

      def resource_uri_cmd
        resource_uri_shell(RESOURCE_URI_CMD)
      end

      def resource_uri_wmi(namespace = 'root/cimv2/*')
        {
          "#{SOAP::NS_WSMAN_DMTF}:ResourceURI" =>
          "http://schemas.microsoft.com/wbem/wsman/1/wmi/#{namespace}",
          :attributes! => {
            "#{SOAP::NS_WSMAN_DMTF}:ResourceURI" => {
              'mustUnderstand' => true
            }
          }
        }
      end

      def action_get
        {
          "#{SOAP::NS_ADDRESSING}:Action" =>
          'http://schemas.xmlsoap.org/ws/2004/09/transfer/Get',
          :attributes! => {
            "#{SOAP::NS_ADDRESSING}:Action" => {
              'mustUnderstand' => true
            }
          }
        }
      end

      def action_delete
        {
          "#{SOAP::NS_ADDRESSING}:Action" =>
          'http://schemas.xmlsoap.org/ws/2004/09/transfer/Delete',
          :attributes! => {
            "#{SOAP::NS_ADDRESSING}:Action" => {
              'mustUnderstand' => true
            }
          }
        }
      end

      def action_command
        {
          "#{SOAP::NS_ADDRESSING}:Action" =>
          'http://schemas.microsoft.com/wbem/wsman/1/windows/shell/Command',
          :attributes! => {
            "#{SOAP::NS_ADDRESSING}:Action" => {
              'mustUnderstand' => true
            }
          }
        }
      end

      def action_receive
        {
          "#{SOAP::NS_ADDRESSING}:Action" =>
          'http://schemas.microsoft.com/wbem/wsman/1/windows/shell/Receive',
          :attributes! => {
            "#{SOAP::NS_ADDRESSING}:Action" => {
              'mustUnderstand' => true
            }
          }
        }
      end

      def action_send
        {
          "#{SOAP::NS_ADDRESSING}:Action" =>
          'http://schemas.microsoft.com/wbem/wsman/1/windows/shell/Send',
          :attributes! => {
            "#{SOAP::NS_ADDRESSING}:Action" => {
              'mustUnderstand' => true
            }
          }
        }
      end

      def action_signal
        {
          "#{SOAP::NS_ADDRESSING}:Action" =>
          'http://schemas.microsoft.com/wbem/wsman/1/windows/shell/Signal',
          :attributes! => {
            "#{SOAP::NS_ADDRESSING}:Action" => {
              'mustUnderstand' => true
            }
          }
        }
      end

      def action_enumerate
        {
          "#{SOAP::NS_ADDRESSING}:Action" =>
          'http://schemas.xmlsoap.org/ws/2004/09/enumeration/Enumerate',
          :attributes! => {
            "#{SOAP::NS_ADDRESSING}:Action" => {
              'mustUnderstand' => true
            }
          }
        }
      end

      def action_enumerate_pull
        {
          "#{SOAP::NS_ADDRESSING}:Action" =>
          'http://schemas.xmlsoap.org/ws/2004/09/enumeration/Pull',
          :attributes! => {
            "#{SOAP::NS_ADDRESSING}:Action" => {
              'mustUnderstand' => true
            }
          }
        }
      end

      def selector_shell_id(shell_id)
        {
          "#{SOAP::NS_WSMAN_DMTF}:SelectorSet" => {
            "#{SOAP::NS_WSMAN_DMTF}:Selector" => shell_id, :attributes! => {
              "#{SOAP::NS_WSMAN_DMTF}:Selector" => {
                'Name' => 'ShellId'
              }
            }
          }
        }
      end
    end
  end
end

# rubocop:enable Metrics/MethodLength
