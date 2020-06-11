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

require_relative 'soap'
require_relative 'header'
require_relative 'command_output_decoder'
require_relative '../output'

module WinRM
  module WSMV
    # Class for reading wsmv Receive_Response messages
    class ReceiveResponseReader
      include WinRM::WSMV::SOAP
      include WinRM::WSMV::Header

      # Creates a new ReceiveResponseReader
      # @param transport [HttpTransport] The WinRM SOAP transport
      # @param logger [Logger] The logger to log diagnostic messages to
      def initialize(transport, logger)
        @transport = transport
        @logger = logger
        @output_decoder = CommandOutputDecoder.new
      end

      attr_reader :logger

      # Reads streams and returns decoded output
      # @param wsmv_message [WinRM::WSMV::Base] A wsmv message to send to endpoint
      # @yieldparam [string] standard out response text
      # @yieldparam [string] standard error response text
      # @yieldreturn [WinRM::Output] The command output
      def read_output(wsmv_message)
        with_output do |output|
          read_response(wsmv_message, true) do |stream, doc|
            handled_out = handle_stream(stream, output, doc)
            yield handled_out if handled_out && block_given?
          end
        end
      end

      # Reads streams sent in one or more receive response messages
      # @param wsmv_message [WinRM::WSMV::Base] A wsmv message to send to endpoint
      # @param wait_for_done_state whether to poll for a CommandState of Done
      # @yieldparam [Hash] Hash representation of stream with type and text
      # @yieldparam [REXML::Document] Complete SOAP envelope returned to wsmv_message
      def read_response(wsmv_message, wait_for_done_state = false)
        resp_doc = nil
        until command_done?(resp_doc, wait_for_done_state)
          logger.debug('[WinRM] Waiting for output...')
          resp_doc = send_get_output_message(wsmv_message.build)
          logger.debug('[WinRM] Processing output')
          read_streams(resp_doc) do |stream|
            yield stream, resp_doc
          end
        end
      end

      protected

      def with_output
        output = WinRM::Output.new
        yield output
        output.exitcode ||= 0
        output
      end

      private

      def handle_stream(stream, output, resp_doc)
        decoded_text = @output_decoder.decode(stream[:text])
        return unless decoded_text

        out = { stream[:type] => decoded_text }
        output << out
        if (code = REXML::XPath.first(resp_doc, "//*[local-name() = 'ExitCode']"))
          output.exitcode = code.text.to_i
        end
        [out[:stdout], out[:stderr]]
      end

      def send_get_output_message(message)
        @transport.send_request(message)
      rescue WinRMWSManFault => e
        # If no output is available before the wsman:OperationTimeout expires,
        # the server MUST return a WSManFault with the Code attribute equal to
        # 2150858793. When the client receives this fault, it SHOULD issue
        # another Receive request.
        # http://msdn.microsoft.com/en-us/library/cc251676.aspx
        raise unless e.fault_code == '2150858793'

        logger.debug('[WinRM] retrying receive request after timeout')
        retry
      end

      def command_done?(resp_doc, wait_for_done_state)
        return false unless resp_doc
        return true unless wait_for_done_state

        REXML::XPath.match(
          resp_doc,
          "//*[@State='http://schemas.microsoft.com/wbem/wsman/1/windows/shell/" \
          "CommandState/Done']"
        ).any?
      end

      def read_streams(response_document)
        body_path = "/*[local-name() = 'Envelope']/*[local-name() = 'Body']"
        path = "#{body_path}/*[local-name() = 'ReceiveResponse']/*[local-name() = 'Stream']"
        REXML::XPath.match(response_document, path).each do |stream|
          next if stream.text.nil? || stream.text.empty?

          yield type: stream.attributes['Name'].to_sym, text: stream.text
        end
      end
    end
  end
end
