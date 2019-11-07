
require "inspec/input_registry"

module Inspec
  # A mixin to provide implementations for the input() DSL methods
  module InputDslHelpers

    # Find or create an input, explicitly named by a profile ID and
    #  input name. Evaluate the input and return the value.
    # @param [String] Profile ID
    # @param [String] Input Name
    # @param [Hash] Input options - see input docs on website
    # @returns [Object] Input value
    def input_with_profile_id(profile_id, input_name, options)
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
  end
end
