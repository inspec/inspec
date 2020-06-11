#
# Author:: John Keiser (<jkeiser@chef.io>)
# Copyright:: Copyright (c) 2013-2018, Chef Software Inc.
# License:: Apache License, Version 2.0
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
#

module Mixlib
  module Config
    class Configurable
      attr_reader :symbol
      attr_reader :default_value
      attr_reader :default_block

      def initialize(symbol)
        @symbol = symbol
      end

      def has_default?
        instance_variable_defined?(:@default_value)
      end

      def writes_value?
        instance_variable_defined?(:@writes_value)
      end

      def default_block?
        instance_variable_defined?(:@default_block)
      end

      alias_method :has_default, :has_default?

      def defaults_to(default_value = nil, &block)
        @default_value = default_value
        @default_block = block if block_given?
        self
      end

      def writes_value(&block)
        @writes_value = block
        self
      end

      def get(config)
        if config.key?(symbol)
          config[symbol]
        elsif default_block?
          default_block.call
        else
          config[symbol] = safe_dup(default_value)
        end
      end

      def set(config, value)
        config[symbol] = writes_value? ? @writes_value.call(value) : value
      end

      def default
        if default_block?
          default_block.call
        else
          default_value
        end
      end

      def is_default?(config)
        !config.key?(symbol) || config[symbol] == default_value
      end

      private

      def safe_dup(e)
        e.dup
      rescue TypeError
        e
      end
    end
  end
end
