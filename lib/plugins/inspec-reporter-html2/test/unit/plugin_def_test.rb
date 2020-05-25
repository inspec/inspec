require_relative "../../../shared/core_plugin_test_helper.rb"
require_relative "../../lib/inspec-reporter-html2"
require "inspec/plugin/v2"

describe InspecPlugins::Html2Reporter::Plugin do
  let(:plugin_name) { :'inspec-reporter-html2' }
  let(:registry) { Inspec::Plugin::V2::Registry.instance }
  let(:status) { registry[plugin_name] }

  # During full unit testing, the registry is purged by test/unit/plugins/v2/loader_test.rb
  def setup
    Inspec::Plugin::V2::Loader.new.load_all
  end

  def teardown
    registry.__reset
  end

  it "should be registered" do
    _(registry.known_plugin?(plugin_name)).must_equal true
  end

  it "should be an api-v2 plugin" do
    _(status.api_generation).must_equal(2)
  end

  it "should include a reporter activator hook" do
    _(status.plugin_types).must_include(:reporter)
  end
end
