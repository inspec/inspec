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

require_relative 'message_data/base'
require_relative 'message_data/error_record'
require_relative 'message_data/pipeline_output'
require_relative 'message_data/pipeline_host_call'
require_relative 'message_data/pipeline_state'
require_relative 'message_data/runspacepool_host_call'
require_relative 'message_data/runspacepool_state'
require_relative 'message_data/session_capability'

module WinRM
  # PowerShell Remoting Protcol module
  module PSRP
    # PowerShell Remoting Protocol message data.
    module MessageData
      def self.parse(message)
        type_key = WinRM::PSRP::Message::MESSAGE_TYPES.key(message.type)
        type = camelize(type_key.to_s).to_sym
        const_get(type).new(message.data) if MessageData.constants.include?(type)
      end

      def self.camelize(underscore)
        underscore.split('_').collect(&:capitalize).join
      end
    end
  end
end
