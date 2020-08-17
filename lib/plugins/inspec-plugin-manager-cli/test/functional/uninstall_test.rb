require_relative "helper"

class PluginManagerCliUninstall < Minitest::Test
  include CorePluginFunctionalHelper
  include PluginManagerHelpers

  def test_when_a_gem_plugin_can_be_uninstalled
    pre_block = Proc.new do |plugin_statefile_data, tmp_dir|
      plugin_statefile_data.clear # Signal not to write a file, we'll provide one.
      copy_in_core_config_dir("test-fixture-1-float", tmp_dir)
    end

    # Attempt uninstall
    uninstall_result = run_inspec_process_with_this_plugin("plugin uninstall inspec-test-fixture", pre_run: pre_block, post_run: list_after_run)

    success_message = uninstall_result.stdout.split("\n").grep(/uninstalled/).last
    refute_nil success_message, "Should find a success message at the end"
    assert_includes success_message, "inspec-test-fixture"
    assert_includes success_message, "0.1.0"
    assert_includes success_message, "has been uninstalled"

    itf_plugins = @list_result.select { |p| p[:name] == "inspec-test-fixture" }
    assert_empty itf_plugins, "inspec-test-fixture should not appear in the output of inspec list"

    assert_empty uninstall_result.stderr
    assert_exit_code 0, uninstall_result
  end

  def test_when_a_path_plugin_can_be_uninstalled
    pre_block = Proc.new do |plugin_statefile_data, tmp_dir|
      plugin_statefile_data.clear # Signal not to write a file, we'll provide one.
      # This fixture includes a path install for inspec-meaning-of-life
      copy_in_core_config_dir("test-fixture-1-float", tmp_dir)
    end
    uninstall_result = run_inspec_process_with_this_plugin("plugin uninstall inspec-meaning-of-life", pre_run: pre_block, post_run: list_after_run)

    success_message = uninstall_result.stdout.split("\n").grep(/uninstalled/).last
    refute_nil success_message, "Should find a success message at the end"
    assert_includes success_message, "inspec-meaning-of-life"
    assert_includes success_message, "path-based plugin install"
    assert_includes success_message, "has been uninstalled"

    itf_plugins = @list_result.select { |p| p[:name] == "inspec-meaning-of-life" }
    assert_empty itf_plugins, "inspec-meaning-of-life should not appear in the output of inspec list"

    assert_empty uninstall_result.stderr
    assert_exit_code 0, uninstall_result
  end

  def test_fail_uninstall_from_plugin_that_is_not_installed
    uninstall_result = run_inspec_process_with_this_plugin("plugin uninstall inspec-test-fixture-nonesuch")

    refute_includes "Inspec::Plugin::V2::UnInstallError", uninstall_result.stdout # Stacktrace marker
    assert_match(/No such plugin installed:.+ - uninstall failed/, uninstall_result.stdout)

    assert_empty uninstall_result.stderr

    assert_exit_code 1, uninstall_result
  end
end
