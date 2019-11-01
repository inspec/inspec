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
      @action.call("describe.one", @checks, nil)
    end

    def __profile_id
      # Excavate the profile ID. The action is a Method calling __add_check on a Rule whose profile ID we want
      @action.receiver.instance_variable_get(:@__profile_id)
    end

    def input(input_name, options = {})
      profile_id = __profile_id

      # TODO: DRY up - remainder of this code is identical to input() in rspec_extensions.rb
      if options.empty?
        # Simply an access, no event here
        Inspec::InputRegistry.find_or_register_input(input_name, profile_id).value
      else
        options[:priority] = 20
        options[:provider] = :inline_control_code
        evt = Inspec::Input.infer_event(options)
        Inspec::InputRegistry.find_or_register_input(input_name, profile_id, event: evt).value
      end
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
  end
end
