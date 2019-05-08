#=========================================================================================#
#                      `inspec plugin SUBCOMMAND` facility
#=========================================================================================#
require_relative '../../../shared/core_plugin_test_helper.rb'

#-----------------------------------------------------------------------------------------#
#                                   utilities
#-----------------------------------------------------------------------------------------#
module PluginManagerHelpers
  let(:project_repo_path) { File.expand_path(File.join(__FILE__, '..', '..', '..')) }
  let(:project_fixtures_path) { File.join(project_repo_path, 'test', 'fixtures') }
  let(:project_config_dirs_path) { File.join(project_fixtures_path, 'config_dirs') }
  let(:empty_config_dir_path) { File.join(project_config_dirs_path, 'empty') }

  let(:list_after_run) do
    Proc.new do |run_result, tmp_dir|
      # After installing/uninstalling/whatevering, run list with config in the same dir, and capture it.
      run_result.payload.list_result = run_inspec_process('plugin list', env: { INSPEC_CONFIG_DIR: tmp_dir })
    end
  end

  def copy_in_project_config_dir(fixture_name, dest = nil)
    src = Dir.glob(File.join(project_config_dirs_path, fixture_name, '*'))
    dest ||= File.join(project_config_dirs_path, 'empty')
    src.each { |path| FileUtils.cp_r(path, dest) }
  end

  def copy_in_core_config_dir(fixture_name, dest = nil)
    src = Dir.glob(File.join(core_config_dir_path, fixture_name, '*'))
    dest ||= File.join(project_config_dirs_path, 'empty')
    src.each { |path| FileUtils.cp_r(path, dest) }
  end

  def clear_empty_config_dir
    Dir.glob(File.join(project_config_dirs_path, 'empty', '*')).each do |path|
      next if path.end_with? '.gitkeep'
      FileUtils.rm_rf(path)
    end
  end

  def teardown
    clear_empty_config_dir
  end
end

#-----------------------------------------------------------------------------------------#
#                                   inspec help
#-----------------------------------------------------------------------------------------#
class PluginManagerCliHelp < Minitest::Test
  include CorePluginFunctionalHelper

  # Main inspec help subcommand listing
  def test_inspec_help_includes_plugin
    result = run_inspec_process_with_this_plugin('help')
    assert_includes result.stdout, 'inspec plugin'
  end

  # inspec plugin help subcommand listing
  def test_inspec_plugin_help_includes_plugin
    result = run_inspec_process_with_this_plugin('plugin help')
    assert_includes result.stdout, 'inspec plugin list'
    assert_includes result.stdout, 'inspec plugin search'
    assert_includes result.stdout, 'inspec plugin install'
    assert_includes result.stdout, 'inspec plugin update'
    assert_includes result.stdout, 'inspec plugin uninstall'
  end
end

#-----------------------------------------------------------------------------------------#
#                                 inspec plugin list
#-----------------------------------------------------------------------------------------#
class PluginManagerCliList < Minitest::Test
  include CorePluginFunctionalHelper
  include PluginManagerHelpers

  def test_list_when_no_user_plugins_installed
    result = run_inspec_process_with_this_plugin('plugin list')
    assert_equal 0, result.exit_status, 'exist status must be 0'
    assert_includes result.stdout, '0 plugin(s) total', 'Empty list should include zero count'
  end

  def test_list_all_when_no_user_plugins_installed
    result = run_inspec_process_with_this_plugin('plugin list --all')
    assert_equal 0, result.exit_status, 'exist status must be 0'
    assert_includes result.stdout, '6 plugin(s) total', '--all list should find six'
    assert_includes result.stdout, 'inspec-plugin-manager-cli', '--all list should find inspec-plugin-manager-cli'
    assert_includes result.stdout, 'habitat', '--all list should find habitat'

    result = run_inspec_process_with_this_plugin('plugin list -a')
    assert_equal 0, result.exit_status, 'exist status must be 0'
    assert_includes result.stdout, '6 plugin(s) total', '-a list should find six'
  end

  def test_list_when_gem_and_path_plugins_installed
    pre_block = Proc.new do |plugin_statefile_data, tmp_dir|
      plugin_statefile_data.clear # Signal not to write a file, we'll provide one.
      copy_in_core_config_dir('test-fixture-1-float', tmp_dir)
    end

    result = run_inspec_process_with_this_plugin('plugin list', pre_run: pre_block)
    assert_equal 0, result.exit_status, 'exist status must be 0'
    assert_includes result.stdout, '2 plugin(s) total', 'gem+path should show two plugins'

    # Plugin Name                   Version   Via     ApiVer
    # -------------------------------------------------------
    #  inspec-meaning-of-life        src       path    2
    #  inspec-test-fixture           0.1.0     gem     2
    # -------------------------------------------------------
    #  2 plugin(s) total
    gem_line = result.stdout.split("\n").grep(/gem/).first
    assert_match(/\s*inspec-\S+\s+\d+\.\d+\.\d+\s+gem\s+2/, gem_line)
    path_line = result.stdout.split("\n").grep(/path/).first
    assert_match(/\s*inspec-\S+\s+src\s+path\s+2/, path_line)
  end

  def test_list_when_a_train_plugin_is_installed
    pre_block = Proc.new do |plugin_statefile_data, tmp_dir|
      plugin_statefile_data.clear # Signal not to write a file, we'll provide one.
      copy_in_core_config_dir('train-test-fixture', tmp_dir)
    end

    result = run_inspec_process_with_this_plugin('plugin list', pre_run: pre_block)
    assert_equal 0, result.exit_status, 'exist status must be 0'
    assert_includes result.stdout, '1 plugin(s) total', 'list train should show one plugins'

    # Plugin Name                   Version   Via     ApiVer
    # -------------------------------------------------------
    #  train-test-fixture            0.1.0    gem     train-1
    # -------------------------------------------------------
    #  1 plugin(s) total
    train_line = result.stdout.split("\n").grep(/train/).first
    assert_includes(train_line, 'train-test-fixture')
    assert_includes(train_line, '0.1.0')
    assert_includes(train_line, 'gem')
    assert_includes(train_line, 'train-1')
  end
end

#-----------------------------------------------------------------------------------------#
#                               inspec plugin search
#-----------------------------------------------------------------------------------------#
class PluginManagerCliSearch < Minitest::Test
  include CorePluginFunctionalHelper
  include PluginManagerHelpers

  # TODO: Thor can't hide options, but we wish it could.
  # def test_search_include_fixture_hidden_option
  #   result = run_inspec_process_with_this_plugin('plugin help search')
  #   refute_includes result.stdout, '--include-test-fixture'
  # end

  def test_search_for_a_real_gem_with_full_name_no_options
    result = run_inspec_process('plugin search --include-test-fixture inspec-test-fixture')
    assert_equal 0, result.exit_status, 'Search should exit 0 on a hit'
    assert_includes result.stdout, 'inspec-test-fixture', 'Search result should contain the gem name'
    assert_includes result.stdout, '1 plugin(s) found', 'Search result should find 1 plugin'
    line = result.stdout.split("\n").grep(/inspec-test-fixture/).first
    assert_match(/\s*inspec-test-fixture\s+\((\d+\.\d+\.\d+){1}\)/,line,'Plugin line should include name and exactly one version')
  end

  def test_search_for_a_real_gem_with_stub_name_no_options
    result = run_inspec_process('plugin search --include-test-fixture inspec-test-')
    assert_equal 0, result.exit_status, 'Search should exit 0 on a hit'
    assert_includes result.stdout, 'inspec-test-fixture', 'Search result should contain the gem name'
    assert_includes result.stdout, '1 plugin(s) found', 'Search result should find 1 plugin'

    line = result.stdout.split("\n").grep(/inspec-test-fixture/).first
    assert_match(/\s*inspec-test-fixture\s+\((\d+\.\d+\.\d+){1}\)/,line,'Plugin line should include name and exactly one version')
  end

  def test_search_for_a_real_gem_with_full_name_and_exact_option
    result = run_inspec_process('plugin search --exact --include-test-fixture inspec-test-fixture')
    assert_equal 0, result.exit_status, 'Search should exit 0 on a hit'
    assert_includes result.stdout, 'inspec-test-fixture', 'Search result should contain the gem name'
    assert_includes result.stdout, '1 plugin(s) found', 'Search result should find 1 plugin'

    result = run_inspec_process('plugin search -e --include-test-fixture inspec-test-fixture')
    assert_equal 0, result.exit_status, 'Search should exit 0 on a hit'
  end

  def test_search_for_a_real_gem_with_stub_name_and_exact_option
    result = run_inspec_process('plugin search --exact --include-test-fixture inspec-test-')
    assert_equal 2, result.exit_status, 'Search should exit 2 on a miss'
    assert_includes result.stdout, '0 plugin(s) found', 'Search result should find 0 plugins'

    result = run_inspec_process('plugin search -e --include-test-fixture inspec-test-')
    assert_equal 2, result.exit_status, 'Search should exit 2 on a miss'
  end

  def test_search_for_a_real_gem_with_full_name_and_all_option
    result = run_inspec_process('plugin search --all --include-test-fixture inspec-test-fixture')
    assert_equal 0, result.exit_status, 'Search should exit 0 on a hit'
    assert_includes result.stdout, 'inspec-test-fixture', 'Search result should contain the gem name'
    assert_includes result.stdout, '1 plugin(s) found', 'Search result should find 1 plugin'

    line = result.stdout.split("\n").grep(/inspec-test-fixture/).first
    assert_match(/\s*inspec-test-fixture\s+\((\d+\.\d+\.\d+(,\s)?){2,}\)/,line,'Plugin line should include name and at least two versions')

    result = run_inspec_process('plugin search -a --include-test-fixture inspec-test-fixture')
    assert_equal 0, result.exit_status, 'Search should exit 0 on a hit'
  end

  def test_search_for_a_gem_with_missing_prefix
    result = run_inspec_process('plugin search --include-test-fixture test-fixture')
    assert_equal 1, result.exit_status, 'Search should exit 1 on user error'
    assert_includes result.stdout, "All inspec plugins must begin with either 'inspec-' or 'train-'"
  end

  def test_search_for_a_gem_that_does_not_exist
    result = run_inspec_process('plugin search --include-test-fixture inspec-test-fixture-nonesuch')
    assert_equal 2, result.exit_status, 'Search should exit 2 on a miss'
    assert_includes result.stdout, '0 plugin(s) found', 'Search result should find 0 plugins'
  end

  def test_search_for_a_real_gem_with_full_name_no_options_and_train_name
    result = run_inspec_process('plugin search --include-test-fixture train-test-fixture')
    assert_equal 0, result.exit_status, 'Search should exit 0 on a hit'
    assert_includes result.stdout, 'train-test-fixture', 'Search result should contain the gem name'
    assert_includes result.stdout, '1 plugin(s) found', 'Search result should find 1 plugin'
    line = result.stdout.split("\n").grep(/train-test-fixture/).first
    assert_match(/\s*train-test-fixture\s+\((\d+\.\d+\.\d+){1}\)/,line,'Plugin line should include name and exactly one version')
  end

  def test_search_omit_excluded_inspec_plugins
    result = run_inspec_process('plugin search --include-test-fixture inspec-')
    assert_equal 0, result.exit_status, 'Search should exit 0'
    assert_includes result.stdout, 'inspec-test-fixture', 'Search result should contain the test gem'
    [
      'inspec-core',
      'inspec-multi-server',
    ].each do |plugin_name|
      refute_includes result.stdout, plugin_name, 'Search result should not contain excluded gems'
    end
  end
  def test_search_for_a_real_gem_with_full_name_no_options_filter_fixtures
    result = run_inspec_process('plugin search inspec-test-fixture')
    refute_includes result.stdout, 'inspec-test-fixture', 'Search result should not contain the fixture gem name'
  end

  def test_search_for_a_real_gem_with_full_name_no_options_filter_fixtures_train
    result = run_inspec_process('plugin search train-test-fixture')
    refute_includes result.stdout, 'train-test-fixture', 'Search result should not contain the fixture gem name'
  end


end

#-----------------------------------------------------------------------------------------#
#                               inspec plugin install
#-----------------------------------------------------------------------------------------#
class PluginManagerCliInstall < Minitest::Test
  include CorePluginFunctionalHelper # gives us instance methods, like `let` aliases inside test methods
  extend CorePluginFunctionalHelper  # gives us class methods, like `let` aliases out here outside test methods

  include PluginManagerHelpers
  ruby_abi_version = (Gem.ruby_version.segments[0, 2] << 0).join('.')
  # Test multiple hueristics of the path-mode install.
  # These are all positive tests; they should resolve the entry point to the same path in each case.
  {
    'is_perfect' => {
      given: File.join(core_fixture_plugins_path, 'inspec-test-fixture', 'lib', 'inspec-test-fixture.rb'),
    },
    'refers_to_the_entry_point_with_no_extension' => {
      given: File.join(core_fixture_plugins_path, 'inspec-test-fixture', 'lib', 'inspec-test-fixture'),
    },
    'refers_to_the_src_root_of_a_plugin' => {
      given: File.join(core_fixture_plugins_path, 'inspec-test-fixture'),
    },
    'refers_to_a_versioned_gem_install' => {
      given: File.join(core_config_dir_path, 'test-fixture-1-float', 'gems', ruby_abi_version, 'gems', 'inspec-test-fixture-0.1.0', 'lib', 'inspec-test-fixture.rb'),
      resolved_path: File.join(core_config_dir_path, 'test-fixture-1-float', 'gems', ruby_abi_version, 'gems', 'inspec-test-fixture-0.1.0', 'lib', 'inspec-test-fixture.rb'),
    },
    'refers_to_a_versioned_gem_install_missing_extension' => {
      given: File.join(core_config_dir_path, 'test-fixture-1-float', 'gems', ruby_abi_version, 'gems', 'inspec-test-fixture-0.1.0', 'lib', 'inspec-test-fixture'),
      resolved_path: File.join(core_config_dir_path, 'test-fixture-1-float', 'gems', ruby_abi_version, 'gems', 'inspec-test-fixture-0.1.0', 'lib', 'inspec-test-fixture.rb'),
    },
    'refers_to_a_relative_path' => {
      given: File.join('test', 'unit', 'mock', 'plugins', 'inspec-test-fixture', 'lib', 'inspec-test-fixture.rb'),
    },
    'refers_to_a_train_plugin' => {
      given: File.join(core_config_dir_path, 'train-test-fixture', 'gems', ruby_abi_version, 'gems', 'train-test-fixture-0.1.0', 'lib', 'train-test-fixture.rb'),
      plugin_name: 'train-test-fixture',
      resolved_path: File.join(core_config_dir_path, 'train-test-fixture', 'gems', ruby_abi_version, 'gems', 'train-test-fixture-0.1.0', 'lib', 'train-test-fixture.rb'),
    },
  }.each do |test_name, fixture_info|
    define_method(('test_install_from_path_when_path_' + test_name).to_sym) do
      fixture_info = {
        plugin_name: 'inspec-test-fixture',
        resolved_path: File.join(core_fixture_plugins_path, 'inspec-test-fixture', 'lib', 'inspec-test-fixture.rb')
      }.merge(fixture_info)

      install_result = run_inspec_process_with_this_plugin("plugin install #{fixture_info[:given]}", post_run: list_after_run)

      assert_empty install_result.stderr
      assert_equal 0, install_result.exit_status, 'Exit status should be 0'

      # Check UX messaging
      success_message = install_result.stdout.split("\n").grep(/installed/).last
      refute_nil success_message, 'Should find a success message at the end'
      assert_includes success_message, fixture_info[:plugin_name]
      assert_includes success_message, 'plugin installed via source path reference'

      # Check round-trip UX via list
      list_result = install_result.payload.list_result
      itf_line = list_result.stdout.split("\n").grep(Regexp.new(fixture_info[:plugin_name])).first
      refute_nil itf_line, 'plugin name should now appear in the output of inspec list'
      assert_match(/\s*(inspec|train)-test-fixture\s+src\s+path\s+/, itf_line, 'list output should show that it is a path installation')

      # Check plugin statefile. Extra important in this case, since all should resolve to the same entry point.
      plugin_data = install_result.payload.plugin_data
      entry = plugin_data['plugins'].detect { |e| e['name'] == fixture_info[:plugin_name] }
      assert_equal fixture_info[:resolved_path], entry['installation_path'], 'Regardless of input, the entry point should be correct.'
    end
  end

  def test_fail_install_from_nonexistant_path
    bad_path = File.join(project_fixtures_path, 'none', 'such', 'inspec-test-fixture-nonesuch.rb')
    install_result = run_inspec_process_with_this_plugin("plugin install #{bad_path}")

    assert_empty install_result.stderr
    assert_equal 1, install_result.exit_status, 'Exit status should be 1'

    error_message = install_result.stdout.split("\n").last
    assert_includes error_message, "No such source code path"
    assert_includes error_message, 'inspec-test-fixture-nonesuch.rb'
    assert_includes error_message, 'installation failed'
  end

  def test_fail_install_from_path_with_wrong_name
    bad_path = File.join(project_fixtures_path, 'plugins', 'wrong-name', 'lib', 'wrong-name.rb')
    install_result = run_inspec_process_with_this_plugin("plugin install #{bad_path}")

    assert_empty install_result.stderr
    assert_equal 1, install_result.exit_status, 'Exit status should be 1'

    error_message = install_result.stdout.split("\n").last
    assert_includes error_message, "Invalid plugin name"
    assert_includes error_message, 'wrong-name'
    assert_includes error_message, "All inspec plugins must begin with either 'inspec-' or 'train-'"
    assert_includes error_message, 'installation failed'
  end

  def test_fail_install_from_path_when_it_is_not_a_plugin
    bad_path = File.join(project_fixtures_path, 'plugins', 'inspec-egg-white-omelette', 'lib', 'inspec-egg-white-omelette.rb')
    install_result = run_inspec_process_with_this_plugin("plugin install #{bad_path}")

    assert_empty install_result.stderr
    assert_equal 1, install_result.exit_status, 'Exit status should be 1'

    error_message = install_result.stdout.split("\n").last
    assert_includes error_message, "Does not appear to be a plugin"
    assert_includes error_message, 'inspec-egg-white-omelette'
    assert_includes error_message, "After probe-loading the supposed plugin, it did not register"
    assert_includes error_message, "Ensure something inherits from 'Inspec.plugin(2)'"
    assert_includes error_message, 'installation failed'
  end

  def test_fail_install_from_path_when_it_is_already_installed
    plugin_path = File.join(core_fixture_plugins_path, 'inspec-test-fixture', 'lib', 'inspec-test-fixture.rb')
    pre_block = Proc.new do |plugin_data, _tmp_dir|
      plugin_data["plugins"] << {
        "name" => "inspec-test-fixture",
        "installation_type" => "path",
        "installation_path" => plugin_path,
      }
    end

    install_result = run_inspec_process_with_this_plugin("plugin install #{plugin_path}", pre_run: pre_block)
    assert_empty install_result.stderr
    assert_equal 2, install_result.exit_status, 'Exit status on second install should be 2'

    error_message = install_result.stdout.split("\n").last
    assert_includes error_message, "Plugin already installed"
    assert_includes error_message, 'inspec-test-fixture'
    assert_includes error_message, "Use 'inspec plugin list' to see previously installed plugin"
    assert_includes error_message, 'installation failed'
  end

  def test_fail_install_from_path_when_the_dir_structure_is_wrong
    bad_path = File.join(project_fixtures_path, 'plugins', 'inspec-wrong-structure')
    install_result = run_inspec_process_with_this_plugin("plugin install #{bad_path}")

    assert_empty install_result.stderr
    assert_equal 1, install_result.exit_status, 'Exit status should be 1'

    error_message = install_result.stdout.split("\n").last
    assert_includes error_message, "Unrecognizable plugin structure"
    assert_includes error_message, 'inspec-wrong-structure'
    assert_includes error_message, ' When installing from a path, please provide the path of the entry point file'
    assert_includes error_message, 'installation failed'
  end

  def test_install_from_gemfile
    fixture_gemfile_path = File.join(core_fixture_plugins_path, 'inspec-test-fixture', 'pkg', 'inspec-test-fixture-0.1.0.gem')
    install_result = run_inspec_process_with_this_plugin("plugin install #{fixture_gemfile_path}", post_run: list_after_run)

    assert_empty install_result.stderr
    assert_equal 0, install_result.exit_status, 'Exit status should be 0'

    success_message = install_result.stdout.split("\n").grep(/installed/).last
    refute_nil success_message, 'Should find a success message at the end'
    assert_includes success_message, 'inspec-test-fixture'
    assert_includes success_message, '0.1.0'
    assert_includes success_message, 'installed from local .gem file'

    list_result = install_result.payload.list_result
    itf_line = list_result.stdout.split("\n").grep(/inspec-test-fixture/).first
    refute_nil itf_line, 'inspec-test-fixture should now appear in the output of inspec list'
    assert_match(/\s*inspec-test-fixture\s+0.1.0\s+gem\s+/, itf_line, 'list output should show that it is a gem installation with version')
  end

  def test_fail_install_from_nonexistant_gemfile
    bad_path = File.join(project_fixtures_path, 'none', 'such', 'inspec-test-fixture-nonesuch-0.3.0.gem')
    install_result = run_inspec_process_with_this_plugin("plugin install #{bad_path}")

    assert_empty install_result.stderr
    assert_equal 1, install_result.exit_status, 'Exit status should be 1'
    assert_match(/No such plugin gem file .+ - installation failed./, install_result.stdout)
  end

  def test_install_from_rubygems_latest
    install_result = run_inspec_process_with_this_plugin('plugin install inspec-test-fixture', post_run: list_after_run)

    assert_empty install_result.stderr
    assert_equal 0, install_result.exit_status, 'Exit status should be 0'

    success_message = install_result.stdout.split("\n").grep(/installed/).last
    refute_nil success_message, 'Should find a success message at the end'
    assert_includes success_message, 'inspec-test-fixture'
    assert_includes success_message, '0.2.0'
    assert_includes success_message, 'installed from rubygems.org'

    list_result = install_result.payload.list_result
    itf_line = list_result.stdout.split("\n").grep(/inspec-test-fixture/).first
    refute_nil itf_line, 'inspec-test-fixture should now appear in the output of inspec list'
    assert_match(/\s*inspec-test-fixture\s+0.2.0\s+gem\s+/, itf_line, 'list output should show that it is a gem installation with version')
  end

  def test_fail_install_from_nonexistant_remote_rubygem
    install_result = run_inspec_process_with_this_plugin('plugin install inspec-test-fixture-nonesuch')

    assert_empty install_result.stderr
    assert_equal 1, install_result.exit_status, 'Exit status should be 1'
    assert_match(/No such plugin gem .+ could be found on rubygems.org - installation failed./, install_result.stdout)
  end

  def test_install_from_rubygems_with_pinned_version
    install_result = run_inspec_process_with_this_plugin('plugin install inspec-test-fixture -v 0.1.0', post_run: list_after_run)

    assert_empty install_result.stderr
    assert_equal 0, install_result.exit_status, 'Exit status should be 0'

    success_message = install_result.stdout.split("\n").grep(/installed/).last
    refute_nil success_message, 'Should find a success message at the end'
    assert_includes success_message, 'inspec-test-fixture'
    assert_includes success_message, '0.1.0'
    assert_includes success_message, 'installed from rubygems.org'

    list_result = install_result.payload.list_result
    itf_line = list_result.stdout.split("\n").grep(/inspec-test-fixture/).first
    refute_nil itf_line, 'inspec-test-fixture should now appear in the output of inspec list'
    assert_match(/\s*inspec-test-fixture\s+0.1.0\s+gem\s+/, itf_line, 'list output should show that it is a gem installation with version')
  end

  def test_fail_install_from_nonexistant_rubygem_version
    install_result = run_inspec_process_with_this_plugin('plugin install inspec-test-fixture -v 99.99.99')

    assert_empty install_result.stderr
    assert_equal 1, install_result.exit_status, 'Exit status should be 1'

    fail_message = install_result.stdout.split("\n").grep(/failed/).last
    refute_nil fail_message, 'Should find a failure message at the end'
    assert_includes fail_message, 'inspec-test-fixture'
    assert_includes fail_message, '99.99.99'
    assert_includes fail_message, 'no such version'
    assert_includes fail_message, 'on rubygems.org'
  end

  def test_refuse_install_when_missing_prefix
    install_result = run_inspec_process_with_this_plugin('plugin install test-fixture')

    assert_empty install_result.stderr
    assert_equal 1, install_result.exit_status, 'Exit status should be 1'

    fail_message = install_result.stdout.split("\n").grep(/failed/).last
    refute_nil fail_message, 'Should find a failure message at the end'
    assert_includes fail_message, 'test-fixture'
    assert_includes fail_message, "All inspec plugins must begin with either 'inspec-' or 'train-'"
  end

  def test_refuse_install_when_already_installed_same_version
    pre_block = Proc.new do |plugin_statefile_data, tmp_dir|
      plugin_statefile_data.clear # Signal not to write a file, we'll provide one.
      copy_in_core_config_dir('test-fixture-2-float', tmp_dir)
    end

    install_result = run_inspec_process_with_this_plugin('plugin install inspec-test-fixture', pre_run: pre_block)
    assert_empty install_result.stderr
    assert_equal 2, install_result.exit_status, 'Exit status should be 2'

    refusal_message = install_result.stdout.split("\n").grep(/refusing/).last
    refute_nil refusal_message, 'Should find a failure message at the end'
    assert_includes refusal_message, 'inspec-test-fixture'
    assert_includes refusal_message, '0.2.0'
    assert_includes refusal_message, 'Plugin already installed at latest version'
  end

  def test_refuse_install_when_already_installed_can_update
    pre_block = Proc.new do |plugin_statefile_data, tmp_dir|
      plugin_statefile_data.clear # Signal not to write a file, we'll provide one.
      copy_in_core_config_dir('test-fixture-1-float', tmp_dir)
    end

    install_result = run_inspec_process_with_this_plugin('plugin install inspec-test-fixture', pre_run: pre_block)
    assert_empty install_result.stderr
    assert_equal 2, install_result.exit_status, 'Exit status should be 2'

    refusal_message = install_result.stdout.split("\n").grep(/refusing/).last
    refute_nil refusal_message, 'Should find a failure message at the end'
    assert_includes refusal_message, 'inspec-test-fixture'
    assert_includes refusal_message, '0.1.0'
    assert_includes refusal_message, '0.2.0'
    assert_includes refusal_message, 'Update required'
    assert_includes refusal_message, 'inspec plugin update'
  end

  def test_install_from_rubygems_latest_with_train_plugin
    install_result = run_inspec_process_with_this_plugin('plugin install train-test-fixture', post_run: list_after_run)

    assert_empty install_result.stderr
    assert_equal 0, install_result.exit_status, 'Exit status should be 0'

    success_message = install_result.stdout.split("\n").grep(/installed/).last
    refute_nil success_message, 'Should find a success message at the end'
    assert_includes success_message, 'train-test-fixture'
    assert_includes success_message, '0.1.0'
    assert_includes success_message, 'installed from rubygems.org'

    list_result = install_result.payload.list_result
    itf_line = list_result.stdout.split("\n").grep(/train-test-fixture/).first
    refute_nil itf_line, 'train-test-fixture should now appear in the output of inspec list'
    assert_match(/\s*train-test-fixture\s+0.1.0\s+gem\s+/, itf_line, 'list output should show that it is a gem installation with version')
  end

  def test_refuse_install_when_plugin_on_exclusion_list

    # Here, 'inspec-core', 'inspec-multi-server', and 'train-tax-collector'
    # are the names of real rubygems.  They are not InSpec/Train plugins, though,
    # and installing them would be a jam-up.
    # This is configured in 'etc/plugin-filter.json'.
    [
      'inspec-core',
      'inspec-multi-server',
      'train-tax-calculator',
    ].each do |plugin_name|
      install_result = run_inspec_process_with_this_plugin("plugin install #{plugin_name}")
      assert_empty install_result.stderr
      assert_equal 2, install_result.exit_status, 'Exit status should be 2'

      refusal_message = install_result.stdout
      refute_nil refusal_message, 'Should find a failure message at the end'
      assert_includes refusal_message, plugin_name
      assert_includes refusal_message, 'Plugin on Exclusion List'
      assert_includes refusal_message, 'refusing to install'
      assert_includes refusal_message, 'Rationale:'
      assert_includes refusal_message, 'etc/plugin_filters.json'
      assert_includes refusal_message, 'github.com/inspec/inspec/issues/new'
    end
  end

  def test_error_install_with_debug_enabled
    install_result = run_inspec_process_with_this_plugin('plugin install inspec-test-fixture -v 0.1.1 --log-level debug')

    assert_equal 1, install_result.exit_status, 'Exit status should be 1'
    assert_includes install_result.stdout, 'DEBUG'
    assert_includes install_result.stderr, "can't activate rake"
  end
end


#-----------------------------------------------------------------------------------------#
#                               inspec plugin update
#-----------------------------------------------------------------------------------------#
class PluginManagerCliUpdate < Minitest::Test
  include CorePluginFunctionalHelper
  include PluginManagerHelpers

  def test_when_a_plugin_can_be_updated
    pre_block = Proc.new do |plugin_statefile_data, tmp_dir|
      plugin_statefile_data.clear # Signal not to write a file, we'll provide one.
      copy_in_core_config_dir('test-fixture-1-float', tmp_dir)
    end

    update_result = run_inspec_process_with_this_plugin('plugin update inspec-test-fixture', pre_run: pre_block, post_run: list_after_run)
    assert_empty update_result.stderr
    assert_equal 0, update_result.exit_status, 'Exit status should be 0'

    success_message = update_result.stdout.split("\n").grep(/updated/).last
    refute_nil success_message, 'Should find a success message at the end'
    assert_includes success_message, 'inspec-test-fixture'
    assert_includes success_message, '0.1.0'
    assert_includes success_message, '0.2.0'
    assert_includes success_message, 'updated from rubygems.org'

    list_result = update_result.payload.list_result
    itf_line = list_result.stdout.split("\n").grep(/inspec-test-fixture/).first
    refute_nil itf_line, 'inspec-test-fixture should appear in the output of inspec list'
    assert_match(/\s*inspec-test-fixture\s+0.2.0\s+gem\s+/, itf_line, 'list output should show that it is a gem installation with version 0.2.0')
  end

  def test_refuse_update_when_already_current
    pre_block = Proc.new do |plugin_statefile_data, tmp_dir|
      plugin_statefile_data.clear # Signal not to write a file, we'll provide one.
      copy_in_core_config_dir('test-fixture-2-float', tmp_dir)
    end

    update_result = run_inspec_process_with_this_plugin('plugin update inspec-test-fixture', pre_run: pre_block)
    assert_empty update_result.stderr
    assert_equal 2, update_result.exit_status, 'Exit status should be 2'

    refusal_message = update_result.stdout.split("\n").grep(/refusing/).last
    refute_nil refusal_message, 'Should find a failure message at the end'
    assert_includes refusal_message, 'inspec-test-fixture'
    assert_includes refusal_message, '0.2.0'
    assert_includes refusal_message, 'Already installed at latest version'
  end

  def test_fail_update_from_nonexistant_gem
    update_result = run_inspec_process_with_this_plugin('plugin update inspec-test-fixture-nonesuch')

    assert_empty update_result.stderr
    assert_equal 1, update_result.exit_status, 'Exit status should be 1'
    assert_match(/No such plugin installed: .+ - update failed/, update_result.stdout)
  end

  def test_fail_update_path
    pre_block = Proc.new do |plugin_statefile_data, tmp_dir|
      plugin_statefile_data.clear # Signal not to write a file, we'll provide one.
      copy_in_core_config_dir('meaning_by_path', tmp_dir)
    end

    update_result = run_inspec_process_with_this_plugin('plugin update inspec-meaning-of-life', pre_run: pre_block)
    assert_empty update_result.stderr
    assert_equal 2, update_result.exit_status, 'Exit status should be 2'

    refusal_message = update_result.stdout.split("\n").grep(/refusing/).last
    refute_nil refusal_message, 'Should find a failure message at the end'
    assert_includes refusal_message, 'inspec-meaning-of-life'
    assert_includes refusal_message, 'inspec plugin uninstall'
    assert_includes refusal_message, 'Cannot update path-based install'
  end
end

#-----------------------------------------------------------------------------------------#
#                               inspec plugin uninstall
#-----------------------------------------------------------------------------------------#
class PluginManagerCliUninstall < Minitest::Test
  include CorePluginFunctionalHelper
  include PluginManagerHelpers

  def test_when_a_gem_plugin_can_be_uninstalled
    pre_block = Proc.new do |plugin_statefile_data, tmp_dir|
      plugin_statefile_data.clear # Signal not to write a file, we'll provide one.
      copy_in_core_config_dir('test-fixture-1-float', tmp_dir)
    end

    # Attempt uninstall
    uninstall_result = run_inspec_process_with_this_plugin('plugin uninstall inspec-test-fixture', pre_run: pre_block, post_run: list_after_run)
    assert_empty uninstall_result.stderr
    assert_equal 0, uninstall_result.exit_status, 'Exit status should be 0'

    success_message = uninstall_result.stdout.split("\n").grep(/uninstalled/).last
    refute_nil success_message, 'Should find a success message at the end'
    assert_includes success_message, 'inspec-test-fixture'
    assert_includes success_message, '0.1.0'
    assert_includes success_message, 'has been uninstalled'

    list_result = uninstall_result.payload.list_result
    itf_line = list_result.stdout.split("\n").grep(/inspec-test-fixture/).first
    assert_nil itf_line, 'inspec-test-fixture should not appear in the output of inspec list'
  end

  def test_when_a_path_plugin_can_be_uninstalled
    pre_block = Proc.new do |plugin_statefile_data, tmp_dir|
      plugin_statefile_data.clear # Signal not to write a file, we'll provide one.
      # This fixture includes a path install for inspec-meaning-of-life
      copy_in_core_config_dir('test-fixture-1-float', tmp_dir)
    end

    uninstall_result = run_inspec_process_with_this_plugin('plugin uninstall inspec-meaning-of-life', pre_run: pre_block, post_run: list_after_run)
    assert_empty uninstall_result.stderr
    assert_equal 0, uninstall_result.exit_status, 'Exit status should be 0'

    success_message = uninstall_result.stdout.split("\n").grep(/uninstalled/).last
    refute_nil success_message, 'Should find a success message at the end'
    assert_includes success_message, 'inspec-meaning-of-life'
    assert_includes success_message, 'path-based plugin install'
    assert_includes success_message, 'has been uninstalled'

    list_result = uninstall_result.payload.list_result
    itf_line = list_result.stdout.split("\n").grep(/inspec-meaning-of-life/).first
    assert_nil itf_line, 'inspec-meaning-of-life should not appear in the output of inspec list'
  end

  def test_fail_uninstall_from_plugin_that_is_not_installed
    uninstall_result = run_inspec_process_with_this_plugin('plugin uninstall inspec-test-fixture-nonesuch')

    assert_empty uninstall_result.stderr
    assert_equal 1, uninstall_result.exit_status, 'Exit status should be 1'
    refute_includes 'Inspec::Plugin::V2::UnInstallError', uninstall_result.stdout # Stacktrace marker
    assert_match(/No such plugin installed: .+ - uninstall failed/, uninstall_result.stdout)
  end
end
