require 'inspec/attribute_registry'
require 'rspec/core/example_group'

# This file allows you to add ExampleGroups to be used in rspec tests
#
class RSpec::Core::ExampleGroup
  # this allows us to use the attribute method in inspec tests
  def attribute(name)
    Inspec::AttributeRegistry.find_attribute(name, self.class.metadata[:profile_id]).value
  end
  define_example_method :attribute
end
