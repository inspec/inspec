require 'helper'

describe 'Input plugin type' do
  describe 'when registering the plugin type superclass' do
    it 'returns the superclass when calling the global defintion method' do
      klass = Inspec.plugin(2, :input)
      klass.must_be_kind_of Class
      klass.name.must_equal 'Inspec::Plugin::V2::PluginType::Input'
    end

    it 'returns the superclass when referenced by alias' do
      klass = Inspec::Plugin::V2::PluginBase.base_class_for_type(:input)
      klass.must_be_kind_of Class
      klass.name.must_equal 'Inspec::Plugin::V2::PluginType::Input'
    end

    it 'registers an activation dsl method' do
      klass = Inspec::Plugin::V2::PluginBase
      klass.must_respond_to :input
    end
  end

  describe 'when examining the specific plugin type API' do
    [
      # TODO - API instance methods
      # fetch?
      # default_priority?
    ].each do |api_method|
      it "should define an #{api_method} in the superclass" do
        klass = Inspec::Plugin::V2::PluginType::CliCommand
        klass.method_defined?(api_method).must_eq true
      end
    end
  end
end