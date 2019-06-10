require 'inspec-input-test-fixture/version'

module InspecPlugins
  module InputTestFixture
    class Plugin < ::Inspec.plugin(2)
      plugin_name :'inspec-input-test-fixture'
      input :test_fixture do
        require 'inspec-input-test-fixture/input'
        InspecPlugins::InputTestFixture::InputImplementation
      end
    end
  end
end