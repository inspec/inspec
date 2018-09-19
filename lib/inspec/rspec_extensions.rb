require 'inspec/attribute_registry'
require 'rspec/core/example_group'

# This file allows you to add ExampleGroups to be used in rspec tests
#
class RSpec::Core::ExampleGroup
  # This DSL method allows us to access the values of attributes within InSpec tests
  def attribute(name)
    Inspec::AttributeRegistry.find_attribute(name, self.class.metadata[:profile_id]).value
  end
  define_example_method :attribute
end
