require_relative "../../../shared/core_plugin_test_helper.rb"

#-----------------------------------------------------------------------#
# Plugin Definition
#-----------------------------------------------------------------------#
class PluginManagerCliDefinitionTests < Minitest::Test
  include CorePluginUnitHelper

  @@orig_home = Dir.home

  def setup
    mock_path = File.expand_path "test/unit/mock"

    @config_dir_path = File.join(mock_path, "config_dirs")
    ENV["HOME"] = File.join(@config_dir_path, "fakehome")
  end

  def teardown
    reset_globals
  end

  def reset_globals # TODO: REFACTOR this with install/loader tests
    ENV["HOME"] = @@orig_home
    ENV["INSPEC_CONFIG_DIR"] = nil
    Inspec::Plugin::V2::Registry.instance.__reset
  end

  def test_plugin_registered
    loader = Inspec::Plugin::V2::Loader.new
    loader.load_all # We want to ensure it is auto-loaded

    assert registry.known_plugin?(:'inspec-plugin-manager-cli'), "inspec-plugin-manager-cli should be registered"
    assert registry.loaded_plugin?(:'inspec-plugin-manager-cli'), "inspec-plugin-manager-cli should be loaded"

    status = registry[:'inspec-plugin-manager-cli']
    assert_equal 2, status.api_generation, "inspec-plugin-manager-cli should be v2"
    assert_includes status.plugin_types, :cli_command, "inspec-plugin-manager-cli should have cli_command activators"
  end
end
