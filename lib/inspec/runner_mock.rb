# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

module Inspec
  class RunnerMock
    attr_reader :tests, :profiles
    attr_writer :backend
    def initialize
      reset
    end

    def reset
      @tests = []
      @profiles = []
    end

    def add_profile(profile)
      @profiles.push(profile)
    end

    def add_test(example, _rule)
      @tests.push(example)
    end

    def example_group(*in_args, &in_block)
      Class.new do
        define_method :args do
          in_args
        end
        define_method :block do
          in_block
        end
      end
    end

    def run(_with = nil)
      puts 'uhm.... nothing or something... dunno, ask your admin'
    end
  end
end
