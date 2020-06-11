# Copyright 2016 Matt Wrock <matt@mattwrock.com>
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

require_relative 'fragment'

module WinRM
  # PowerShell Remoting Protcol module
  module PSRP
    # PowerShell Remoting Protocol message fragmenter.
    class MessageDefragmenter
      def initialize
        @messages = {}
      end

      def defragment(base64_bytes)
        fragment = fragment_from(Base64.decode64(base64_bytes))

        @messages[fragment.object_id] ||= []
        @messages[fragment.object_id].push fragment

        # rubocop:disable Style/GuardClause
        if fragment.end_fragment
          blob = []
          @messages.delete(fragment.object_id).each { |frag| blob += frag.blob }
          return message_from(blob.pack('C*'))
        end
        # rubocop:enable Style/GuardClause
      end

      def fragment_from(byte_string)
        Fragment.new(
          byte_string[0..7].reverse.unpack('Q')[0],
          byte_string[21..-1].bytes,
          byte_string[8..15].reverse.unpack('Q')[0],
          byte_string[16].unpack('C')[0][0] == 1,
          byte_string[16].unpack('C')[0][1] == 1
        )
      end

      def message_from(byte_string)
        Message.new(
          '00000000-0000-0000-0000-000000000000',
          byte_string[4..7].unpack('V')[0],
          byte_string[40..-1],
          '00000000-0000-0000-0000-000000000000',
          byte_string[0..3].unpack('V')[0]
        )
      end
    end
  end
end
