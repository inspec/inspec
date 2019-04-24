# Tests for the *DSL plugin types

require 'minitest/autorun'
require 'byebug'

require_relative '../../../../lib/inspec/plugin/v2'

module DslUnitTests

  [
    :outer_profile_dsl,
    :control_dsl,
    :describe_dsl,
    :test_dsl,
    :resource_dsl,
  ].each do |plugin_type_under_test|

    Class.new(Minitest::Test) do
      # Assign name to anonymous class, so test output is meaningful
      Object.const_set(plugin_type_under_test.to_s.upcase + '_UnitTests', self)

      # One day I will understand Ruby scoping and closures.
      # Until then, re-expose this as class variable.
      @@plugin_type = plugin_type_under_test

      def test_calling_Inspec_dot_plugin_with_plugin_type_returns_the_base_class
        klass = Inspec.plugin(2, @@plugin_type)
        assert_kind_of Class, klass
        assert_equal 'Inspec::Plugin::V2::PluginType::Dsl', klass.name
      end

      def test_plugin_type_base_classes_can_be_accessed_by_name
        klass = Inspec::Plugin::V2::PluginBase.base_class_for_type(@@plugin_type)
        assert_kind_of Class, klass
        assert_equal 'Inspec::Plugin::V2::PluginType::Dsl', klass.name
      end

      def test_plugin_type_registers_an_activation_dsl_method
        klass = Inspec::Plugin::V2::PluginBase
        assert_respond_to klass, @@plugin_type, "Activation method for #{@@plugin_type}"
      end
    end
  end
end
