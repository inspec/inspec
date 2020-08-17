require_relative "helper"

class PluginManagerCliHelp < Minitest::Test
  include CorePluginFunctionalHelper

  # Main inspec help subcommand listing
  def test_inspec_help_includes_plugin
    result = run_inspec_process_with_this_plugin("help")
    assert_includes result.stdout, "inspec plugin"
  end

  # inspec plugin help subcommand listing
  def test_inspec_plugin_help_includes_plugin
    result = run_inspec_process_with_this_plugin("plugin help")
    assert_includes result.stdout, "inspec plugin list"
    assert_includes result.stdout, "inspec plugin search"
    assert_includes result.stdout, "inspec plugin install"
    assert_includes result.stdout, "inspec plugin update"
    assert_includes result.stdout, "inspec plugin uninstall"
  end
end
