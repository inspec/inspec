require_relative "helper"

class PluginManagerCliInstall < Minitest::Test
  include CorePluginFunctionalHelper # gives us instance methods, like `let` aliases inside test methods
  extend CorePluginFunctionalHelper  # gives us class methods, like `let` aliases out here outside test methods

  parallelize_me!

  include PluginManagerHelpers
  ruby_abi_version = (Gem.ruby_version.segments[0, 2] << 0).join(".")
  # Test multiple hueristics of the path-mode install.
  # These are all positive tests; they should resolve the entry point to the same path in each case.
  {
    "is_perfect" => {
      given: File.join(core_fixture_plugins_path, "inspec-test-fixture", "lib", "inspec-test-fixture.rb"),
    },
    "refers_to_the_entry_point_with_no_extension" => {
      given: File.join(core_fixture_plugins_path, "inspec-test-fixture", "lib", "inspec-test-fixture"),
    },
    "refers_to_the_src_root_of_a_plugin" => {
      given: File.join(core_fixture_plugins_path, "inspec-test-fixture"),
    },
    "refers_to_a_versioned_gem_install" => {
      given: File.join(core_config_dir_path, "test-fixture-1-float", "gems", ruby_abi_version, "gems", "inspec-test-fixture-0.1.0", "lib", "inspec-test-fixture.rb"),
      resolved_path: File.join(core_config_dir_path, "test-fixture-1-float", "gems", ruby_abi_version, "gems", "inspec-test-fixture-0.1.0", "lib", "inspec-test-fixture.rb"),
    },
    "refers_to_a_versioned_gem_install_missing_extension" => {
      given: File.join(core_config_dir_path, "test-fixture-1-float", "gems", ruby_abi_version, "gems", "inspec-test-fixture-0.1.0", "lib", "inspec-test-fixture"),
      resolved_path: File.join(core_config_dir_path, "test-fixture-1-float", "gems", ruby_abi_version, "gems", "inspec-test-fixture-0.1.0", "lib", "inspec-test-fixture.rb"),
    },
    "refers_to_a_relative_path" => {
      given: File.join("test", "fixtures", "plugins", "inspec-test-fixture", "lib", "inspec-test-fixture.rb"),
    },
    "refers_to_a_train_plugin" => {
      plugin_name: "train-test-fixture",
      given: File.join(core_config_dir_path, "train-test-fixture", "gems", ruby_abi_version, "gems", "train-test-fixture-0.1.0", "lib", "train-test-fixture.rb"),
      resolved_path: File.join(core_config_dir_path, "train-test-fixture", "gems", ruby_abi_version, "gems", "train-test-fixture-0.1.0", "lib", "train-test-fixture.rb"),
    },
  }.each do |test_name, fixture_info|
    define_method(("test_install_from_path_when_path_" + test_name).to_sym) do
      fixture_info = {
        plugin_name: "inspec-test-fixture",
        resolved_path: File.join(core_fixture_plugins_path, "inspec-test-fixture", "lib", "inspec-test-fixture.rb"),
      }.merge(fixture_info)

      install_result = run_inspec_process_with_this_plugin("plugin install #{fixture_info[:given]}", post_run: list_after_run)

      # Check UX messaging
      success_message = install_result.stdout.split("\n").grep(/installed/).last
      assert_empty install_result.stderr
      refute_nil success_message, "Should find a success message at the end"
      assert_includes success_message, fixture_info[:plugin_name]
      assert_includes success_message, "plugin installed via source path reference"

      # Check round-trip UX via list
      itf_plugin = @list_result.detect { |p| p[:name] == fixture_info[:plugin_name] }
      refute_nil itf_plugin, "plugin name should now appear in the output of inspec list"
      assert_equal "path", itf_plugin[:type], "list output should show that it is a path installation"

      # Check plugin statefile. Extra important in this case, since all should resolve to the same entry point.
      plugin_data = @plugin_data
      entry = plugin_data["plugins"].detect { |e| e["name"] == fixture_info[:plugin_name] }
      assert_equal fixture_info[:resolved_path], entry["installation_path"], "Regardless of input, the entry point should be correct."

      assert_exit_code 0, install_result
    end
  end

  def test_fail_install_from_nonexistant_path
    bad_path = File.join(project_fixtures_path, "none", "such", "inspec-test-fixture-nonesuch.rb")
    install_result = run_inspec_process_with_this_plugin("plugin install #{bad_path}")

    error_message = install_result.stdout
    assert_includes error_message, "No such source code path"
    assert_includes error_message, "inspec-test-fixture-nonesuch.rb"
    assert_includes error_message, "installation failed"

    assert_empty install_result.stderr

    assert_exit_code 1, install_result
  end

  def test_fail_install_from_path_with_wrong_name
    bad_path = File.join(project_fixtures_path, "plugins", "wrong-name", "lib", "wrong-name.rb")
    install_result = run_inspec_process_with_this_plugin("plugin install #{bad_path}")

    error_message = install_result.stdout
    assert_includes error_message, "Invalid plugin name"
    assert_includes error_message, "wrong-name"
    assert_includes error_message, "All inspec plugins must begin with either 'inspec-' or 'train-'"
    assert_includes error_message, "installation failed"

    assert_empty install_result.stderr

    assert_exit_code 1, install_result
  end

  def test_fail_install_from_path_when_it_is_not_a_plugin
    bad_path = File.join(project_fixtures_path, "plugins", "inspec-egg-white-omelette", "lib", "inspec-egg-white-omelette.rb")
    install_result = run_inspec_process_with_this_plugin("plugin install #{bad_path}")

    error_message = install_result.stdout
    assert_includes error_message, "Does not appear to be a plugin"
    assert_includes error_message, "inspec-egg-white-omelette"
    assert_includes error_message, "After probe-loading the supposed plugin, it did not register"
    assert_includes error_message, "Ensure something inherits from 'Inspec.plugin(2)'"
    assert_includes error_message, "installation failed"

    assert_empty install_result.stderr

    assert_exit_code 1, install_result
  end

  def test_fail_install_from_path_when_it_is_already_installed
    plugin_path = File.join(core_fixture_plugins_path, "inspec-test-fixture", "lib", "inspec-test-fixture.rb")
    pre_block = Proc.new do |plugin_data, _tmp_dir|
      plugin_data["plugins"] << {
        "name" => "inspec-test-fixture",
        "installation_type" => "path",
        "installation_path" => plugin_path,
      }
    end

    install_result = run_inspec_process_with_this_plugin("plugin install #{plugin_path}", pre_run: pre_block)

    error_message = install_result.stdout
    assert_includes error_message, "Plugin already installed"
    assert_includes error_message, "inspec-test-fixture"
    assert_includes error_message, "Use 'inspec plugin list' to see previously installed plugin"
    assert_includes error_message, "installation failed"

    assert_empty install_result.stderr

    assert_exit_code 2, install_result
  end

  def test_fail_install_from_path_when_the_dir_structure_is_wrong
    bad_path = File.join(project_fixtures_path, "plugins", "inspec-wrong-structure")
    install_result = run_inspec_process_with_this_plugin("plugin install #{bad_path}")

    error_message = install_result.stdout
    assert_includes error_message, "Unrecognizable plugin structure"
    assert_includes error_message, "inspec-wrong-structure"
    assert_includes error_message, " When installing from a path, please provide the path of the entry point file"
    assert_includes error_message, "installation failed"

    assert_empty install_result.stderr

    assert_exit_code 1, install_result
  end

  def test_install_from_gemfile
    fixture_gemfile_path = File.join(core_fixture_plugins_path, "inspec-test-fixture", "pkg", "inspec-test-fixture-0.1.0.gem")
    install_result = run_inspec_process_with_this_plugin("plugin install #{fixture_gemfile_path}", post_run: list_after_run)

    success_message = install_result.stdout.split("\n").grep(/installed/).last
    refute_nil success_message, "Should find a success message at the end"
    assert_includes success_message, "installed from local .gem file"

    itf_plugin = @list_result.detect { |p| p[:name] == "inspec-test-fixture" }
    refute_nil itf_plugin, "plugin name should now appear in the output of inspec list"
    assert_equal "gem (user)", itf_plugin[:type]
    assert_equal "0.1.0", itf_plugin[:version]

    assert_empty_ignoring_27_warnings install_result.stderr
    assert_exit_code 0, install_result
  end

  def test_fail_install_from_nonexistant_gemfile
    bad_path = File.join(project_fixtures_path, "none", "such", "inspec-test-fixture-nonesuch-0.3.0.gem")
    install_result = run_inspec_process_with_this_plugin("plugin install #{bad_path}")

    assert_match(/No such plugin gem file .+ - installation failed./, install_result.stdout)

    assert_empty install_result.stderr

    assert_exit_code 1, install_result
  end

  def test_install_from_rubygems_latest
    install_result = run_inspec_process_with_this_plugin("plugin install inspec-test-fixture", post_run: list_after_run)

    success_message = install_result.stdout.split("\n").grep(/installed/).last
    refute_nil success_message, "Should find a success message at the end"
    assert_includes success_message, "inspec-test-fixture"
    assert_includes success_message, "0.2.0"
    assert_includes success_message, "installed from rubygems.org"

    itf_plugin = @list_result.detect { |p| p[:name] == "inspec-test-fixture" }
    refute_nil itf_plugin, "plugin name should now appear in the output of inspec list"
    assert_equal "gem (user)", itf_plugin[:type]
    assert_equal "0.2.0", itf_plugin[:version]

    assert_empty_ignoring_27_warnings install_result.stderr
    assert_exit_code 0, install_result
  end

  def test_fail_install_from_nonexistant_remote_rubygem
    install_result = run_inspec_process_with_this_plugin("plugin install inspec-test-fixture-nonesuch")

    assert_match(/No such plugin gem .+ could be found on rubygems.org - installation failed./, install_result.stdout)

    assert_empty install_result.stderr

    assert_exit_code 1, install_result
  end

  def test_install_from_rubygems_with_pinned_version
    install_result = run_inspec_process_with_this_plugin("plugin install inspec-test-fixture -v 0.1.0", post_run: list_after_run)

    success_message = install_result.stdout.split("\n").grep(/installed/).last
    refute_nil success_message, "Should find a success message at the end"
    assert_includes success_message, "inspec-test-fixture"
    assert_includes success_message, "0.1.0"
    assert_includes success_message, "installed from rubygems.org"

    itf_plugin = @list_result.detect { |p| p[:name] == "inspec-test-fixture" }
    refute_nil itf_plugin, "plugin name should now appear in the output of inspec list"
    assert_equal "gem (user)", itf_plugin[:type]
    assert_equal "0.1.0", itf_plugin[:version]

    assert_empty_ignoring_27_warnings install_result.stderr

    assert_exit_code 0, install_result
  end

  def test_fail_install_from_nonexistant_rubygem_version
    install_result = run_inspec_process_with_this_plugin("plugin install inspec-test-fixture -v 99.99.99")

    fail_message = install_result.stdout.split("\n").grep(/failed/).last
    refute_nil fail_message, "Should find a failure message at the end"
    assert_includes fail_message, "inspec-test-fixture"
    assert_includes fail_message, "99.99.99"
    assert_includes fail_message, "no such version"
    assert_includes fail_message, "on rubygems.org"

    assert_empty install_result.stderr

    assert_exit_code 1, install_result
  end

  def test_refuse_install_when_missing_prefix
    install_result = run_inspec_process_with_this_plugin("plugin install test-fixture")

    fail_message = install_result.stdout.split("\n").grep(/failed/).last
    refute_nil fail_message, "Should find a failure message at the end"
    assert_includes fail_message, "test-fixture"
    assert_includes fail_message, "All inspec plugins must begin with either 'inspec-' or 'train-'"

    assert_empty install_result.stderr

    assert_exit_code 1, install_result
  end

  def test_refuse_install_when_already_installed_same_version
    pre_block = Proc.new do |plugin_statefile_data, tmp_dir|
      plugin_statefile_data.clear # Signal not to write a file, we'll provide one.
      copy_in_core_config_dir("test-fixture-2-float", tmp_dir)
    end

    install_result = run_inspec_process_with_this_plugin("plugin install inspec-test-fixture", pre_run: pre_block)

    refusal_message = install_result.stdout.split("\n").grep(/refusing/).last
    refute_nil refusal_message, "Should find a failure message at the end"
    assert_includes refusal_message, "inspec-test-fixture"
    assert_includes refusal_message, "0.2.0"
    assert_includes refusal_message, "Plugin already installed at latest version"

    assert_empty install_result.stderr

    assert_exit_code 2, install_result
  end

  def test_refuse_install_when_already_installed_can_update
    pre_block = Proc.new do |plugin_statefile_data, tmp_dir|
      plugin_statefile_data.clear # Signal not to write a file, we'll provide one.
      copy_in_core_config_dir("test-fixture-1-float", tmp_dir)
    end

    install_result = run_inspec_process_with_this_plugin("plugin install inspec-test-fixture", pre_run: pre_block)

    refusal_message = install_result.stdout.split("\n").grep(/refusing/).last
    refute_nil refusal_message, "Should find a failure message at the end"
    assert_includes refusal_message, "inspec-test-fixture"
    assert_includes refusal_message, "0.1.0"
    assert_includes refusal_message, "0.2.0"
    assert_includes refusal_message, "Update required"
    assert_includes refusal_message, "inspec plugin update"

    assert_empty install_result.stderr

    assert_exit_code 2, install_result
  end

  def test_install_from_rubygems_latest_with_train_plugin
    install_result = run_inspec_process_with_this_plugin("plugin install train-test-fixture", post_run: list_after_run)

    success_message = install_result.stdout.split("\n").grep(/installed/).last
    refute_nil success_message, "Should find a success message at the end"
    assert_includes success_message, "train-test-fixture"
    assert_includes success_message, "0.1.0"
    assert_includes success_message, "installed from rubygems.org"

    ttf_plugin = @list_result.detect { |p| p[:name] == "train-test-fixture" }
    refute_nil ttf_plugin, "plugin name should now appear in the output of inspec list"
    assert_equal "gem (user)", ttf_plugin[:type]
    assert_equal "0.1.0", ttf_plugin[:version]

    assert_empty_ignoring_27_warnings install_result.stderr
    assert_exit_code 0, install_result
  end

  def test_refuse_install_when_plugin_on_exclusion_list
    # Here, 'inspec-core', 'inspec-multi-server', and 'train-tax-collector'
    # are the names of real rubygems.  They are not InSpec/Train plugins, though,
    # and installing them would be a jam-up.
    # This is configured in 'etc/plugin-filter.json'.
    %w{
      inspec-core
      inspec-multi-server
      train-tax-calculator
    }.each do |plugin_name|
      install_result = run_inspec_process_with_this_plugin("plugin install #{plugin_name}")
      refusal_message = install_result.stdout
      refute_nil refusal_message, "Should find a failure message at the end"
      assert_includes refusal_message, plugin_name
      assert_includes refusal_message, "Plugin on Exclusion List"
      assert_includes refusal_message, "refusing to install"
      assert_includes refusal_message, "Rationale:"
      assert_includes refusal_message, "etc/plugin_filters.json"
      assert_includes refusal_message, "github.com/inspec/inspec/issues/new"

      assert_empty install_result.stderr

      assert_exit_code 2, install_result
    end
  end

  def test_error_install_with_debug_enabled
    skip "this test requires bundler to pass" unless defined? ::Bundler

    install_result = run_inspec_process_with_this_plugin("plugin install inspec-test-fixture -v 0.1.1 --log-level debug")

    assert_includes install_result.stdout, "DEBUG"

    assert_includes install_result.stderr, "can't activate rake"

    assert_exit_code 1, install_result
  end
end
