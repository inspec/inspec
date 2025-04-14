require_relative "helper"

class PluginManagerCliList < Minitest::Test
  include CorePluginFunctionalHelper
  include PluginManagerHelpers

  # Listing all plugins is now default behavior
  LIST_CASES = [
    { arg: "-c", name: "inspec-plugin-manager-cli", type: "core", description: "CLI plugin for InSpec" },
    { arg: "-c", name: "inspec-supermarket", type: "core", description: "" },
    { arg: "-s", name: "train-aws", type: "gem (system)", description: "AWS API Transport for Train" },
  ].freeze

  def test_list_all_when_no_user_plugins_installed
    result = run_inspec_process_with_this_plugin("plugin list --all")
    plugins_seen = parse_plugin_list_lines(result.stdout, result.stderr)
    # Look for a specific plugin of each type - core, bundle, and system
    LIST_CASES.each do |test_case|
      plugin_line = plugins_seen.detect { |plugin| plugin[:name] == test_case[:name] }
      refute_nil plugin_line, "#{test_case[:name]} should be detected in plugin list --all output"
      assert_equal test_case[:type], plugin_line[:type], "#{test_case[:name]} should be detected as a '#{test_case[:type]}' type in list --all "
      assert_equal test_case[:description], plugin_line[:description], "#{test_case[:name]} should have description '#{test_case[:description]}' in list --all "
    end
    assert_exit_code 0, result
  end

  def test_list_selective_when_no_user_plugins_installed
    LIST_CASES.each do |test_case|
      result = run_inspec_process_with_this_plugin("plugin list #{test_case[:arg]}")
      plugins_seen = parse_plugin_list_lines(result.stdout, result.stderr)
      plugin_line = plugins_seen.detect { |plugin| plugin[:name] == test_case[:name] }
      refute_nil plugin_line, "#{test_case[:name]} should be detected in plugin list #{test_case[:arg]} output"
      assert_equal plugin_line[:type], test_case[:type], "#{test_case[:name]} should be detected as a '#{test_case[:type]}' type in list #{test_case[:arg]} "
      assert_equal test_case[:description], plugin_line[:description], "#{test_case[:name]} should have description '#{test_case[:description]}' in list --all "
      assert_exit_code 0, result
    end
  end

  def test_list_when_gem_and_path_plugins_installed
    pre_block = Proc.new do |plugin_statefile_data, tmp_dir|
      plugin_statefile_data.clear
      copy_in_core_config_dir("test-fixture-1-float", tmp_dir)
      ENV["INSPEC_CONFIG_DIR"] = tmp_dir # 👈 Force InSpec to use only this
    end

    result = run_inspec_process_with_this_plugin("plugin list --user", pre_run: pre_block)

    plugins_seen = parse_plugin_list_lines(result.stdout, result.stderr)

    # Debug print (optional)
    # puts "Plugins seen:\n" + plugins_seen.map(&:inspect).join("\n")

    assert_equal 2, plugins_seen.count

    meaning = plugins_seen.detect { |p| p[:name] == "inspec-meaning-of-life" }
    refute_nil meaning
    assert_equal "path", meaning[:type]

    fixture = plugins_seen.detect { |p| p[:name] == "inspec-test-fixture" }
    refute_nil fixture
    assert_equal "gem (user)", fixture[:type]
    assert_equal "0.1.0", fixture[:version]
    assert_match(/A simple test plugin gem/, fixture[:description])

    assert_exit_code 0, result
  end

  def test_list_when_a_train_plugin_is_installed
    pre_block = Proc.new do |plugin_statefile_data, tmp_dir|
      plugin_statefile_data.clear # Signal not to write a file, we'll provide one.
      copy_in_core_config_dir("train-test-fixture", tmp_dir)
    end

    result = run_inspec_process_with_this_plugin("plugin list --user ", pre_run: pre_block)

    plugins_seen = parse_plugin_list_lines(result.stdout, result.stderr)
    assert_equal 1, plugins_seen.count
    assert_includes result.stdout, "1 plugin(s) total", "list train should show one plugins"

    # Plugin Name                   Version   Via        ApiVer     Description
    # -------------------------------------------------------------------------------
    #  train-test-fixture            0.1.0    gem (user)  train-1    Test train plugin. Not intended for use as an example
    # -------------------------------------------------------------------------------
    #  1 plugin(s) total
    train_plugin = plugins_seen.detect { |p| p[:name] == "train-test-fixture" }
    refute_nil train_plugin
    assert_equal "gem (user)", train_plugin[:type]
    assert_equal "train-1", train_plugin[:generation]
    assert_equal "0.1.0", train_plugin[:version]
    assert_match(/Test train plugin/, train_plugin[:description])
    assert_exit_code 0, result
  end
end
