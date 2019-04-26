require 'inspec/input_registry'
require 'inspec/plugin/v2'
require 'rspec/core/example_group'

# Any additions to RSpec::Core::ExampleGroup (the RSpec class behind describe blocks) should go here.

module Inspec
  # This module exists to intercept the method_missing *class* method on RSpec::Core::ExampleGroup
  # and is part of support for DSL plugintypes
  module DescribeDslLazyLoader
    # Support for Describe DSL plugins
    def method_missing(method_name, *arguments, &block)
      # Check to see if there is a describe_dsl plugin activator hook with the method name
      registry = Inspec::Plugin::V2::Registry.instance
      hook = registry.find_activators(plugin_type: :describe_dsl, activator_name: method_name).first

      if hook
        # OK, load the hook if it hasn't been already.  We'll then know a module,
        # which we can then inject into the context
        hook.activate

        # Inject the module's methods into the example group contexts.
        # implementation_class is the field name, but this is actually a module.
        # RSpec works by having these helper methods defined as class methods
        # (see the definition of `let` as an example)
        # So, we use extend to inject the new DSL methods.
        RSpec::Core::ExampleGroup.extend(hook.implementation_class)

        # We still haven't called the method we were looking for, so do so now.
        send(method_name, *arguments, &block)
      else
        super
      end
    end
  end

  # This module exists to intercept the method_missing *instance* method on RSpec::Core::ExampleGroup
  # and is part of support for DSL plugintypes
  module TestDslLazyLoader
    # Support for test DSL plugins
    def method_missing(method_name, *arguments, &block)
      # Check to see if there is a test_dsl plugin activator hook with the method name
      registry = Inspec::Plugin::V2::Registry.instance
      hook = registry.find_activators(plugin_type: :test_dsl, activator_name: method_name).first

      if hook
        # OK, load the hook if it hasn't been already.  We'll then know a module,
        # which we can then inject into the context
        hook.activate

        # Inject the module's methods into the example group contexts.
        # implementation_class is the field name, but this is actually a module.
        # RSpec works by having these helper methods defined as instance methods.
        # So, we use include to inject the new DSL methods.
        RSpec::Core::ExampleGroup.include(hook.implementation_class)

        # We still haven't called the method we were looking for, so do so now.
        send(method_name, *arguments, &block)
      else
        super
      end
    end
  end
end

class RSpec::Core::ExampleGroup
  # This DSL method allows us to access the values of inputs within InSpec tests
  def attribute(name)
    Inspec::InputRegistry.find_or_register_input(name, self.class.metadata[:profile_id]).value
  end
  define_example_method :attribute
  def input_obj(name)
    Inspec::InputRegistry.find_or_register_input(name, self.class.metadata[:profile_id])
  end
  define_example_method :input_obj

  # Here, we have to ensure our method_missing gets called prior
  # to RSpec::Core::ExampleGroup.method_missing (the class method).
  # So, we use prepend.
  # Because it is a class method we're attempting to prepend, we must
  # prepend against the singleton class.
  singleton_class.prepend Inspec::DescribeDslLazyLoader

  # Here, we have to ensure our method_missing gets called prior
  # to RSpec::Core::ExampleGroup#method_missing (the instance method).
  # So, we use prepend.
  prepend Inspec::TestDslLazyLoader
end
