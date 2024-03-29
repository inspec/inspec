require "helper"

require "inspec/plugin/v2"

describe "Input plugin type" do
  describe "when registering the plugin type superclass" do
    it "returns the superclass when calling the global definition method" do
      klass = Inspec.plugin(2, :input)
      _(klass).must_be_kind_of Class
      _(klass).must_equal Inspec::Plugin::V2::PluginType::Input
    end

    it "returns the superclass when referenced by alias" do
      klass = Inspec::Plugin::V2::PluginBase.base_class_for_type(:input)
      _(klass).must_be_kind_of Class
      _(klass).must_equal Inspec::Plugin::V2::PluginType::Input
    end

    it "registers an activation dsl method" do
      klass = Inspec::Plugin::V2::PluginBase
      _(klass).must_respond_to :input
    end
  end

  describe "when examining the specific plugin type API" do
    [
      # API instance methods
      :fetch,
      :default_priority,
      :list_inputs,
    ].each do |api_method|
      it "should define a '#{api_method}' method in the superclass" do
        klass = Inspec::Plugin::V2::PluginType::Input
        _(klass.method_defined?(api_method)).must_equal true
      end
    end
  end
end
