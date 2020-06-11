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

require 'nori'

module WinRM
  # PowerShell Remoting Protcol module
  module PSRP
    # PowerShell Remoting Protocol message data.
    module MessageData
      # base class for message data
      class Base
        def initialize(data)
          @raw = data
        end

        # @return [String] raw message data
        attr_reader :raw

        protected

        def clixml
          @clixml ||= begin
            parser = Nori.new(
              parser: :rexml,
              advanced_typecasting: false,
              convert_tags_to: ->(tag) { tag.snakecase.to_sym },
              strip_namespaces: true
            )
            parser.parse(raw)[:obj][:ms]
          end
        end
      end
    end
  end
end
