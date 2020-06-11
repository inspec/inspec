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

require 'rexml/document'

module WinRM
  module PSRP
    module MessageData
      # Handles decoding a raw powershell output response
      class PipelineOutput < Base
        def output
          extract_out_string(remove_bom(raw.force_encoding('utf-8')))
        end

        private

        def extract_out_string(text)
          doc = REXML::Document.new(text)
          doc.root.get_elements('//S').map do |node|
            text = ''
            if node.text
              text << node.text.gsub(/(_x\h\h\h\h_)+/) do |match|
                match.scan(/_x(\h\h\h\h)_/).flatten.map(&:hex)
                     .pack('S*').force_encoding('utf-16le').encode('utf-8')
              end.chomp
            end
            text << "\r\n"
          end.join
        end

        def remove_bom(text)
          text.sub("\xEF\xBB\xBF", '')
        end
      end
    end
  end
end
