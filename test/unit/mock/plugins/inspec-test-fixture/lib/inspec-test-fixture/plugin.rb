module InspecPlugins
  module TestFixture

    class Plugin < Inspec.plugin(2)
      plugin_name :test_fixture

      mock_plugin :test_fixture do
        require 'mock_plugin'
        InspecPlugins::TestFixture
      end
    end
  end
end