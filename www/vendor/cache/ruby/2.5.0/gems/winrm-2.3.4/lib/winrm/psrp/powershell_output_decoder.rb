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

require 'base64'
require_relative 'message'
require_relative 'message_data/pipeline_state'

module WinRM
  module PSRP
    # Handles decoding a raw powershell output response
    class PowershellOutputDecoder
      # rubocop:disable Metrics/CyclomaticComplexity
      # Decode the raw SOAP output into decoded PSRP message,
      # Removes BOM and replaces encoded line endings
      # @param raw_output [String] The raw encoded output
      # @return [String] The decoded output
      def decode(message)
        case message.type
        when WinRM::PSRP::Message::MESSAGE_TYPES[:pipeline_output]
          decode_pipeline_output(message)
        when WinRM::PSRP::Message::MESSAGE_TYPES[:runspacepool_host_call]
          decode_host_call(message)
        when WinRM::PSRP::Message::MESSAGE_TYPES[:pipeline_host_call]
          decode_host_call(message)
        when WinRM::PSRP::Message::MESSAGE_TYPES[:error_record]
          decode_error_record(message)
        when WinRM::PSRP::Message::MESSAGE_TYPES[:pipeline_state]
          if message.parsed_data.pipeline_state == WinRM::PSRP::MessageData::PipelineState::FAILED
            decode_error_record(message)
          end
        end
      end
      # rubocop:enable Metrics/CyclomaticComplexity

      protected

      def decode_pipeline_output(message)
        message.parsed_data.output
      end

      def decode_host_call(message)
        text = begin
          case message.parsed_data.method_identifier
          when /WriteLine/, 'WriteErrorLine'
            "#{message.parsed_data.method_parameters[:s]}\r\n"
          when 'WriteDebugLine'
            "Debug: #{message.parsed_data.method_parameters[:s]}\r\n"
          when 'WriteWarningLine'
            "Warning: #{message.parsed_data.method_parameters[:s]}\r\n"
          when 'WriteVerboseLine'
            "Verbose: #{message.parsed_data.method_parameters[:s]}\r\n"
          when /Write[1-2]/
            message.parsed_data.method_parameters[:s]
          end
        end

        hex_decode(text)
      end

      def decode_error_record(message)
        parsed = message.parsed_data
        text = begin
          if message.type == WinRM::PSRP::Message::MESSAGE_TYPES[:pipeline_state]
            render_exception_as_error_record(parsed.exception_as_error_record)
          else
            case parsed.fully_qualified_error_id
            when 'Microsoft.PowerShell.Commands.WriteErrorException'
              render_write_error_exception(parsed)
            when 'NativeCommandError'
              render_native_command_error(parsed)
            when 'NativeCommandErrorMessage'
              parsed.exception[:message]
            else
              render_exception(parsed)
            end
          end
        end

        hex_decode(text)
      end

      def render_write_error_exception(parsed)
        <<EOH
#{parsed.invocation_info[:line]} : #{parsed.exception[:message]}
    + CategoryInfo          : #{parsed.error_category_message}
    + FullyQualifiedErrorId : #{parsed.fully_qualified_error_id}
EOH
      end

      def render_exception(parsed)
        <<EOH
#{parsed.exception[:message]}
#{parsed.invocation_info[:position_message]}
    + CategoryInfo          : #{parsed.error_category_message}
    + FullyQualifiedErrorId : #{parsed.fully_qualified_error_id}
EOH
      end

      def render_native_command_error(parsed)
        <<EOH
#{parsed.invocation_info[:my_command]} : #{parsed.exception[:message]}
    + CategoryInfo          : #{parsed.error_category_message}
    + FullyQualifiedErrorId : #{parsed.fully_qualified_error_id}
EOH
      end

      def render_exception_as_error_record(parsed)
        <<EOH
#{parsed.exception[:message]}
    + CategoryInfo          : #{parsed.error_category_message}
    + FullyQualifiedErrorId : #{parsed.fully_qualified_error_id}
EOH
      end

      private

      def hex_decode(text)
        return unless text

        text.gsub(/_x(\h\h\h\h)_/) do
          decoded_text = Regexp.last_match[1].hex.chr.force_encoding('utf-8')
          if decoded_text.respond_to?(:scrub)
            decoded_text.scrub
          else
            decoded_text.encode('utf-16', invalid: :replace, undef: :replace).encode('utf-8')
          end
        end
      end
    end
  end
end
