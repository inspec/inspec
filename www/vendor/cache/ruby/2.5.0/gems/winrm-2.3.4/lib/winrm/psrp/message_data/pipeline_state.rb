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
      # pipeline state message type
      class PipelineState < Base
        NOT_STARTED = 0
        RUNNING = 1
        STOPPING = 2
        STOPPED = 3
        COMPLETED = 4
        FAILED = 5
        DISCONNECTED = 6

        def pipeline_state
          clixml[:i32].to_i
        end

        def exception_as_error_record
          @exception_as_error_record ||= ErrorRecord.new(raw) if pipeline_state == FAILED
        end
      end
    end
  end
end
