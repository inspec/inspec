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

module WinRM
  module PSRP
    module MessageData
      # runspace pool state message type
      class RunspacepoolState < Base
        BEFORE_OPEN = 0
        OPENING = 1
        OPENED = 2
        CLOSED = 3
        CLOSING = 4
        BROKEN = 5
        NEGOTIATION_SENT = 6
        NEGOTIATION_SUCCEEDED = 7
        CONNECTING = 8
        DISCONNECTED = 9

        def runspace_state
          clixml[:i32].to_i
        end
      end
    end
  end
end
