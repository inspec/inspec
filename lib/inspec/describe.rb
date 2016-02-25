# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

module Inspec
  class DescribeBase
    def initialize(action)
      @action = action
      @checks = []
    end

    # Evaluate the given block and collect all checks. These will be registered
    # with the callback function under the 'describe.one' name.
    #
    # @param [Proc] ruby block containing checks (e.g. via describe)
    # @return [nil]
    def one(&block)
      return unless block_given?
      instance_eval(&block)
      @action.call('describe.one', @checks, nil)
    end

    def describe(*args, &block)
      @checks.push(['describe', args, block])
    end
  end
end
