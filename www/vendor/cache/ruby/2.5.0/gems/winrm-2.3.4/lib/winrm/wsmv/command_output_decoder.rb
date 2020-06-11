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

require 'base64'

module WinRM
  module WSMV
    # Handles decoding a raw output response
    class CommandOutputDecoder
      # Decode the raw SOAP output into decoded and human consumable text,
      # Decodes and replaces invalid unicode characters.
      # @param raw_output [String] The raw encoded output
      # @return [String] The decoded output
      def decode(raw_output)
        decoded_text = decode_raw_output(raw_output)
        decoded_text = handle_invalid_encoding(decoded_text)
        decoded_text = remove_bom(decoded_text)
        decoded_text
      end

      private

      def decode_raw_output(raw_output)
        Base64.decode64(raw_output).force_encoding('utf-8')
      end

      def handle_invalid_encoding(decoded_text)
        return decoded_text if decoded_text.valid_encoding?

        if decoded_text.respond_to?(:scrub)
          decoded_text.scrub
        else
          decoded_text.encode('utf-16', invalid: :replace, undef: :replace).encode('utf-8')
        end
      end

      def remove_bom(decoded_text)
        # remove BOM which 2008R2 applies
        decoded_text.sub("\xEF\xBB\xBF", '')
      end
    end
  end
end
