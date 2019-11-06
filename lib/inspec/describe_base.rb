require "inspec/input_dsl_helpers"

module Inspec
  class DescribeBase

    include Inspec::InputDslHelpers

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
      @action.call("describe.one", @checks, nil)
    end

    def input(input_name, options = {})
      input_with_profile_id(__profile_id, input_name, options)
    end

    def input_object(name)
      Inspec::InputRegistry.find_or_register_input(name, __profile_id)
    end

    def method_missing(method_name, *arguments)
      Inspec::DSL.method_missing_resource(inspec, method_name, *arguments)
    end

    def describe(*args, &block)
      @checks.push(["describe", args, block])
    end

    private

    # While this is marked private, it gets consumed during an instance_eval,
    # so it is fully visible. The double underscore is there to discourage
    # use - this is a private API.
    def __profile_id
      # Excavate the profile ID. The action is a Method calling __add_check on
      # a Rule whose profile ID we want
      @action.receiver.instance_variable_get(:@__profile_id)
    end

  end
end
