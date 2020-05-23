require_relative "../../../shared/core_plugin_test_helper.rb"
require_relative "../../lib/inspec-reporter-html2"

describe InspecPlugins::Html2Reporter::Plugin do
  let(:plugin_name) { :'inspec-reporter-html2' }
  let(:registry) { Inspec::Plugin::V2::Registry.instance }
  let(:status) { registry[plugin_name] }

  it "should be registered" do
    registry.known_plugin?(plugin_name)
  end

  it "should be an api-v2 plugin" do
    _(status.api_generation).must_equal(2)
  end

  it "should include a reporter activator hook" do
    _(status.plugin_types).must_include(:reporter)
  end
end
