require 'minitest/autorun'
require 'minitest/test'
require 'byebug'

require_relative '../../../../lib/inspec/plugin/v2'

class PluginV2VersionedApiCLITests < MiniTest::Test
  # you can call Inspec.plugin(2, :cli_command) and get the plugin base class
  def test_calling_Inspec_dot_plugin_with_cli_returns_the_cli_base_class
    klass = Inspec.plugin(2, :cli_command)
    assert_kind_of Class, klass
    assert_equal 'Inspec::Plugin::V2::PluginType::CliCommand', klass.name
  end

  def test_plugin_type_base_classes_can_be_accessed_by_name
    klass = Inspec::Plugin::V2::PluginBase.base_class_for_type(:cli_command)
    assert_kind_of Class, klass
    assert_equal 'Inspec::Plugin::V2::PluginType::CliCommand', klass.name
  end

  def test_plugin_type_registers_an_activation_dsl_method
    klass = Inspec::Plugin::V2::PluginBase
    assert_respond_to klass, :cli_command, 'Activation method for cli_method'
  end
end

class CliCommandPluginV2API < MiniTest::Test
  def test_cli_command_api_methods_present
    # instance methods
    [
      :invoke,
    ].each do |method_name|
      klass = Inspec::Plugin::V2::PluginType::CliCommand
      assert klass.method_defined?(method_name), "CliCommand api instance method: #{method_name}"
    end
  end

  def test_cli_command_api_methods_abstract_throws_not_implemented
    [
      :invoke,
    ].each do |method_name|
      cmd = Inspec::Plugin::V2::PluginType::CliCommand.new
      assert_raises(NotImplementedError, "CliCommand api abstract class method: #{method_name}") do
        cmd.send(method_name)
      end
    end
  end

end

# cli base class responds to a list of methods
# cli base class throws NotImplemented on abstract methods