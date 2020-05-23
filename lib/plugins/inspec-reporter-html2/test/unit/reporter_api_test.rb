require_relative "../../../shared/core_plugin_test_helper.rb"
require_relative "../../lib/inspec-reporter-html2"
require_relative "../../lib/inspec-reporter-html2/reporter"

describe InspecPlugins::Html2Reporter::Reporter do
  [
    # API instance methods
    :render,
  ].each do |api_method|
    it "should implement a '#{api_method}' instance method" do
      klass = InspecPlugins::Html2Reporter::Reporter
      _(klass.method_defined?(api_method)).must_equal true
    end
  end

  [
    # API class methods
    :run_data_schema_constraints
  ].each do |api_method|
    it "should implement a '#{api_method}' class method" do
      klass = InspecPlugins::Html2Reporter::Reporter
      _(klass.singleton_methods).must_include(api_method)
    end
  end

end
