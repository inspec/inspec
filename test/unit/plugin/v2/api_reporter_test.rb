require "helper"

require "inspec/plugin/v2"

describe "Reporter plugin type" do
  describe "when registering the plugin type superclass" do
    it "returns the superclass when calling the global definition method" do
      klass = Inspec.plugin(2, :reporter)
      _(klass).must_be_kind_of Class
      _(klass).must_equal Inspec::Plugin::V2::PluginType::Reporter
    end

    it "returns the superclass when referenced by alias" do
      klass = Inspec::Plugin::V2::PluginBase.base_class_for_type(:reporter)
      _(klass).must_be_kind_of Class
      _(klass).must_equal Inspec::Plugin::V2::PluginType::Reporter
    end

    it "registers an activation dsl method" do
      klass = Inspec::Plugin::V2::PluginBase
      _(klass).must_respond_to :reporter
    end
  end

  describe "when examining the specific plugin type API" do
    [
      # API instance methods
      :render,           # pure virtual
      :output,           # helper
      :rendered_output,  # accessor
      :run_data,         # accessor
    ].each do |api_method|
      it "should define a '#{api_method}' method in the superclass" do
        klass = Inspec::Plugin::V2::PluginType::Reporter
        _(klass.method_defined?(api_method)).must_equal true
      end
    end
  end
end
