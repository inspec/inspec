# Copyright 2016 Matt Wrock <matt@mattwrock.com>
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

module WinRM
  # PowerShell Remoting Protcol module
  module PSRP
    # PowerShell Remoting Protocol message fragment.
    class Fragment
      # Creates a new PSRP message fragment
      # @param object_id [Integer] The id of the fragmented message.
      # @param blob [Array] Array of fragmented bytes.
      # @param fragment_id [Integer] The id of this fragment
      # @param start_fragment [Boolean] If the fragment is the first fragment
      # @param end_fragment [Boolean] If the fragment is the last fragment
      def initialize(object_id, blob, fragment_id = 0, start_fragment = true, end_fragment = true)
        @object_id = object_id
        @blob = blob
        @fragment_id = fragment_id
        @start_fragment = start_fragment
        @end_fragment = end_fragment
      end

      attr_reader :object_id, :fragment_id, :end_fragment, :start_fragment, :blob

      # Returns the raw PSRP message bytes ready for transfer to Windows inside a
      # WinRM message.
      # @return [Array<Byte>] Unencoded raw byte array of the PSRP message.
      def bytes
        [
          int64be(object_id),
          int64be(fragment_id),
          end_start_fragment,
          int16be(blob.length),
          blob
        ].flatten
      end

      private

      def end_start_fragment
        end_start = 0
        end_start += 0b10 if end_fragment
        end_start += 0b1 if start_fragment
        [end_start]
      end

      def int64be(int64)
        [int64 >> 32, int64 & 0x00000000ffffffff].pack('N2').unpack('C8')
      end

      def int16be(int16)
        [int16].pack('N').unpack('C4')
      end
    end
  end
end
