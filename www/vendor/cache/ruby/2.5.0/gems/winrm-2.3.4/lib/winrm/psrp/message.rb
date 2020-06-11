# Copyright 2015 Matt Wrock <matt@mattwrock.com>
# Copyright 2016 Shawn Neal <sneal@sneal.net>
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require_relative 'uuid'
require_relative 'message_data'

module WinRM
  # PowerShell Remoting Protcol module
  module PSRP
    # PowerShell Remoting Protocol base message.
    # http://download.microsoft.com/download/9/5/E/95EF66AF-9026-4BB0-A41D-A4F81802D92C/%5BMS-PSRP%5D.pdf
    class Message
      include UUID

      # Value of message destination when sent to a client
      CLIENT_DESTINATION = 1

      # Value of message destination when sent to a server
      SERVER_DESTINATION = 2

      # All known PSRP message types
      MESSAGE_TYPES = {
        session_capability: 0x00010002,
        init_runspacepool: 0x00010004,
        public_key: 0x00010005,
        encrypted_session_key: 0x00010006,
        public_key_request: 0x00010007,
        connect_runspacepool: 0x00010008,
        runspace_init_data: 0x0002100b,
        reset_runspace_state: 0x0002100c,
        set_max_runspaces: 0x00021002,
        set_min_runspaces: 0x00021003,
        runspace_availability: 0x00021004,
        runspacepool_state: 0x00021005,
        create_pipeline: 0x00021006,
        get_available_runspaces: 0x00021007,
        user_event: 0x00021008,
        application_private_data: 0x00021009,
        get_command_metadata: 0x0002100a,
        runspacepool_host_call: 0x00021100,
        runspacepool_host_response: 0x00021101,
        pipeline_input: 0x00041002,
        end_of_pipeline_input: 0x00041003,
        pipeline_output: 0x00041004,
        error_record: 0x00041005,
        pipeline_state: 0x00041006,
        debug_record: 0x00041007,
        verbose_record: 0x00041008,
        warning_record: 0x00041009,
        progress_record: 0x00041010,
        information_record: 0x00041011,
        pipeline_host_call: 0x00041100,
        pipeline_host_response: 0x00041101
      }.freeze

      # Creates a new PSRP message instance
      # @param runspace_pool_id [String] The UUID of the remote shell/runspace pool.
      # @param pipeline_id [String] The UUID to correlate the command/pipeline response
      # @param type [Integer] The PSRP MessageType. This is most commonly
      # specified in hex, e.g. 0x00010002.
      # @param data [String] The PSRP payload as serialized XML
      # @param destination [Integer] The destination for this message - client or server
      def initialize(
        runspace_pool_id,
        type,
        data,
        pipeline_id = nil,
        destination = SERVER_DESTINATION
      )
        raise 'invalid message type' unless MESSAGE_TYPES.value?(type)

        @data = data
        @destination = destination
        @type = type
        @pipeline_id = pipeline_id
        @runspace_pool_id = runspace_pool_id
      end

      attr_reader :destination, :type, :runspace_pool_id, :pipeline_id, :data

      # Returns the raw PSRP message bytes ready for transfer to Windows inside a
      # WinRM message.
      # @return [Array<Byte>] Unencoded raw byte array of the PSRP message.
      def bytes
        [
          int16le(destination),
          int16le(type),
          uuid_to_windows_guid_bytes(runspace_pool_id),
          uuid_to_windows_guid_bytes(pipeline_id),
          byte_order_mark,
          data_bytes
        ].flatten
      end

      # Parses the raw data to a MessageData class
      # @return [MessageData::Base] MessageData corresponding to this message type
      def parsed_data
        @parsed_data ||= MessageData.parse(self)
      end

      private

      def byte_order_mark
        [239, 187, 191]
      end

      def data_bytes
        @data_bytes ||= data.force_encoding('utf-8').bytes
      end

      def int16le(int16)
        [int16].pack('N').unpack('C4').reverse
      end
    end
  end
end
