require_relative "helper"

class PluginManagerCliUpdate < Minitest::Test
  include CorePluginFunctionalHelper
  include PluginManagerHelpers

  def test_when_a_plugin_can_be_updated
    skip "this test requires bundler to pass" unless defined? ::Bundler

    pre_block = Proc.new do |plugin_statefile_data, tmp_dir|
      plugin_statefile_data.clear # Signal not to write a file, we'll provide one.
      copy_in_core_config_dir("test-fixture-1-float", tmp_dir)
    end

    update_result = run_inspec_process_with_this_plugin("plugin update inspec-test-fixture", pre_run: pre_block, post_run: list_after_run)

    success_message = update_result.stdout.split("\n").grep(/updated/).last
    refute_nil success_message, "Should find a success message at the end"
    assert_includes success_message, "inspec-test-fixture"
    assert_includes success_message, "0.1.0"
    assert_includes success_message, "0.2.0"
    assert_includes success_message, "updated from rubygems.org"

    itf_plugin = @list_result.detect { |p| p[:name] == "inspec-test-fixture" }
    refute_nil itf_plugin, "plugin name should now appear in the output of inspec list"
    assert_equal "gem (user)", itf_plugin[:type]
    assert_equal "0.2.0", itf_plugin[:version]

    assert_empty_ignoring_27_warnings update_result.stderr
    assert_exit_code 0, update_result
  end

  def test_refuse_update_when_already_current
    pre_block = Proc.new do |plugin_statefile_data, tmp_dir|
      plugin_statefile_data.clear # Signal not to write a file, we'll provide one.
      copy_in_core_config_dir("test-fixture-2-float", tmp_dir)
    end

    update_result = run_inspec_process_with_this_plugin("plugin update inspec-test-fixture", pre_run: pre_block)

    refusal_message = update_result.stdout.split("\n").grep(/refusing/).last
    refute_nil refusal_message, "Should find a failure message at the end"
    assert_includes refusal_message, "inspec-test-fixture"
    assert_includes refusal_message, "0.2.0"
    assert_includes refusal_message, "Already installed at latest version"

    assert_empty update_result.stderr

    assert_exit_code 2, update_result
  end

  def test_fail_update_from_nonexistant_gem
    update_result = run_inspec_process_with_this_plugin("plugin update inspec-test-fixture-nonesuch")

    assert_match(/No such plugin installed:.+ - update failed/, update_result.stdout)

    assert_empty update_result.stderr

    assert_exit_code 1, update_result
  end

  def test_fail_update_path
    pre_block = Proc.new do |plugin_statefile_data, tmp_dir|
      plugin_statefile_data.clear # Signal not to write a file, we'll provide one.
      copy_in_core_config_dir("meaning_by_path", tmp_dir)
    end

    update_result = run_inspec_process_with_this_plugin("plugin update inspec-meaning-of-life", pre_run: pre_block)

    refusal_message = update_result.stdout.split("\n").grep(/refusing/).last
    refute_nil refusal_message, "Should find a failure message at the end"
    assert_includes refusal_message, "inspec-meaning-of-life"
    assert_includes refusal_message, "inspec plugin uninstall"
    assert_includes refusal_message, "Cannot update path-based install"

    assert_empty update_result.stderr

    assert_exit_code 2, update_result
  end
end
