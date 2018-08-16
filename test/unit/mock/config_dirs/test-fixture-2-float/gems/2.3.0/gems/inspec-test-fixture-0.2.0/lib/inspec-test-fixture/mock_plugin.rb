require 'ordinal_array'

module InspecPlugins::TextFixture
  class MockPlugin < Inspec.plugin(2, :mock_plugin_type)
    def execute(opts = {})
      # Check to see if Array responds to 'third'
      Array.respond_to?(:third)
    end
  end
end