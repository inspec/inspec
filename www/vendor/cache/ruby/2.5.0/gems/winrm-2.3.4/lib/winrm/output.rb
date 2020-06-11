# Copyright 2014 Max Lincoln <max@devopsy.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

module WinRM
  # This class holds raw output and has convenience methods to parse.
  class Output
    def initialize
      @data = []
    end

    # @return [Integer] exitcode returned from command
    attr_reader :exitcode

    # @return [String] Aggregated stdout and stderr streams
    def output
      @data.flat_map do |line|
        [line[:stdout], line[:stderr]]
      end.compact.join
    end

    # @return [String] stdout stream output
    def stdout
      @data.map do |line|
        line[:stdout]
      end.compact.join
    end

    # @return [String] stderr stream output
    def stderr
      @data.map do |line|
        line[:stderr]
      end.compact.join
    end

    # Sets the exitcode
    def exitcode=(code)
      raise WinRM::InvalidExitCode unless code.is_a? Integer

      @exitcode = code
    end

    # Appends stream data to the output
    def <<(data)
      @data << data
    end
  end
end
