require_relative "../../../shared/core_plugin_test_helper"
require_relative "../../lib/inspec-streaming-reporter-progress-bar"
require "inspec/plugin/v2"

describe InspecPlugins::StreamingReporterProgressBar::Plugin do
  let(:plugin_name) { :'inspec-streaming-reporter-progress-bar' }
  let(:registry) { Inspec::Plugin::V2::Registry.instance }

  # During full unit testing, the registry is purged by test/unit/plugins/v2/loader_test.rb
  def load_plugin
    Inspec::Plugin::V2::Loader.new.load_all
  end

  before(:each) do
    load_plugin
  end

  it "should be registered successfully" do
    _(registry.known_plugin?(plugin_name)).must_equal true
  end
end
