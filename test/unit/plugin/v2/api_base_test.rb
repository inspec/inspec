require 'minitest/autorun'

require_relative '../../../../lib/inspec/plugin/v2'

class PluginV2VersionedApiTests < Minitest::Test
  # you can call Inspec.plugin(2) and get the plugin base class
  def test_calling_Inspec_dot_plugin_with_2_returns_the_plugin_base_class
    klass = Inspec.plugin(2)
    assert_kind_of Class, klass
    assert_equal 'Inspec::Plugin::V2::PluginBase', klass.name
  end

  def test_calling_Inspec_dot_plugin_with_2_and_mock_plugin_returns_the_mock_plugin_base_class
    klass = Inspec.plugin(2, :mock_plugin_type)
    assert_kind_of Class, klass, '2-arg form of Inspec.plugin() should return a specific plugin type base class'
    assert_equal 'Inspec::Plugin::V2::PluginType::Mock', klass.name
  end

end

class PluginV2BaseMgmtMethods < Minitest::Test
  def test_plugin_v2_management_class_methods_present
    [
      :base_class_for_type,
      :registry,
      :register_plugin_type,
      :plugin_name,
    ].each do |method_name|
      klass = Inspec::Plugin::V2::PluginBase
      assert_respond_to klass, method_name, "Base class plugin management class method: #{method_name}"
    end
  end

  def test_plugin_type_base_classes_can_be_accessed_by_name
    klass = Inspec::Plugin::V2::PluginBase.base_class_for_type(:mock_plugin_type)
    assert_kind_of Class, klass, 'base_class_for_type should work for mock_plugin_type'
    assert_equal 'Inspec::Plugin::V2::PluginType::Mock', klass.name
  end
end

class PluginV2BaseDslMethods < Minitest::Test
  def test_plugin_v2_dsl_methods_present
    [
      :plugin_name,
      :mock_plugin_type,
      # [ :input_provider, :platform, :fetcher, :source_reader, :reporter ]
    ].each do |method_name|
      klass = Inspec::Plugin::V2::PluginBase
      assert_respond_to klass, method_name, 'Plugin DSL methods'
    end
  end

  def test_when_calling_plugin_name_the_plugin_is_registered
    test_plugin_name = :dsl_plugin_name_test
    reg = Inspec::Plugin::V2::Registry.instance
    reg.__reset
    refute reg.known_plugin?(test_plugin_name), 'should not know plugin name in advance'
    assert_equal 0, reg.loaded_count, 'Should start with no plugins loaded'
    assert_equal 0, reg.known_count, 'Should start with no plugins known'


    assert_raises(Inspec::Plugin::V2::LoadError, 'plugin definitions must include the plugin_name call') do
      # Make a plugin class, including calling the plugin type DSL definition method, but do not call plugin_name
      Class.new(Inspec.plugin(2)) do
        # Plugin class body
        mock_plugin_type :dsl_plugin_name_test do
          Class.new(Inspec.plugin(2, :mock_plugin_type))
        end
      end
    end
    refute reg.known_plugin?(test_plugin_name), 'failing to load a nameless plugin should not somehow register the plugin'
    assert_equal 0, reg.loaded_count, 'Should have no plugins loaded after failing to load a nameless plugin'
    assert_equal 0, reg.known_count, 'Should have no plugins known after failing to load a nameless plugin'

    # Now create another plugin class, but this time *do* call plugin_name
    name_provided_class = Class.new(Inspec.plugin(2)) do
      # Plugin class body
      plugin_name :dsl_plugin_name_test
      mock_plugin_type :dsl_plugin_name_test do
        Class.new(Inspec.plugin(2, :mock_plugin_type))
      end
    end

    assert reg.known_plugin?(test_plugin_name), 'plugin name should register the plugin'
    assert_equal 0, reg.loaded_count, 'plugin_name should not load the plugin'
    assert_equal 1, reg.known_count, 'plugin_name should cause one plugin to be known'
    status = reg[test_plugin_name]
    assert_equal name_provided_class, status.plugin_class
    assert_equal 2, status.api_generation
    assert_includes status.plugin_types, :mock_plugin_type
  end

  def test_plugin_type_registers_an_activation_dsl_method
    klass = Inspec::Plugin::V2::PluginBase
    assert_respond_to klass, :mock_plugin_type, 'Activation method for mock_plugin_type'
  end
end

