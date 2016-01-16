# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

module Inspec
  class RunnerMock
    attr_reader :tests
    def initialize
      @tests = []
    end

    def add_test(example, _rule_id)
      @tests.push(example)
    end

    def example_group(*in_args, &in_block)
      Class.new do
        def args
          in_args
        end
        def block
          in_block
        end
      end
    end

    def run(_with = nil)
      puts 'uhm.... nothing or something... dunno, ask your admin'
    end
  end
end
