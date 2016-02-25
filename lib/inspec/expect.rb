# encoding: utf-8
# copyright: 2016, Chef Software Inc.
# author: Dominik Richter
# author: Christoph Hartmann

require 'rspec/expectations'

module Inspec
  class Expect
    attr_reader :calls, :value, :block
    def initialize(value, &block)
      @value = value
      @block = block
      @calls = []
    end

    def to(*args, &block)
      @calls.push([:to, args, block, caller])
    end

    def not_to(*args, &block)
      @calls.push([:not_to, args, block, caller])
    end

    def example_group
      that = self

      opts = { 'caller' => calls[0][3] }
      if !calls[0][3].nil? && !calls[0][3].empty? &&
         (m = calls[0][3][0].match(/^([^:]*):(\d+):/))
        opts['file_path'] = m[0]
        opts['line_number'] = m[1]
      end

      RSpec::Core::ExampleGroup.describe(that.value, opts) do
        that.calls.each do |method, args, block, clr|
          it(nil, caller: clr) do
            x = expect(that.value, &that.block).method(method)
            x.call(*args, &block)
          end
        end
      end
    end
  end
end
