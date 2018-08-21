require 'rspec/core/dsl'

# This file allows you to add ExampleGroups to be used in rspec tests
class RSpec::Core::ExampleGroup
  define_method :attribute do |name, options = nil|
    Inspec::Attributes.instance[self.class.metadata[:profile_id]][name].value
  end
end
