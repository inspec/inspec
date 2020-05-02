require "inspec-reporter-test-fixture/version"

module InspecPlugins
  module ReporterTestFixture
    class Plugin < ::Inspec.plugin(2)
      plugin_name :'inspec-reporter-test-fixture'
      reporter :"test-fixture" do
        require "inspec-reporter-test-fixture/reporter"
        InspecPlugins::ReporterTestFixture::ReporterImplementation
      end
    end
  end
end
