require 'inspec/attributes'
require 'rspec/core/example_group'

# This file allows you to add ExampleGroups to be used in rspec tests
#
class RSpec::Core::ExampleGroup
  def attribute(name, options = {})
    Inspec::Attributes.instance.find_or_create(name, self.class.metadata[:profile_id], options).value
  end
  define_example_method :attribute
end
