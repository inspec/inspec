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

  def copy_in_project_config_dir(fixture_name)
    src = Dir.glob(File.join(project_config_dirs_path, fixture_name, '*'))
    dest = File.join(project_config_dirs_path, 'empty')
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
class PluginManagerCliHelp < MiniTest::Test
  include CorePluginFunctionalHelper

  # Main inspec help subcommand listing
  def test_inspec_help_includes_plugin
    result = run_inspec_process('help')
    assert_includes result.stdout, 'inspec plugin'
  end

  # inspec plugin help subcommand listing
  def test_inspec_plugin_help_includes_plugin
    result = run_inspec_process('plugin help')
    assert_includes result.stdout, 'inspec plugin list'
    assert_includes result.stdout, 'inspec plugin search'
  end
end

#-----------------------------------------------------------------------------------------#
#                                 inspec plugin list
#-----------------------------------------------------------------------------------------#
class PluginManagerCliList < MiniTest::Test
  include CorePluginFunctionalHelper
  include PluginManagerHelpers

  def test_list_when_no_user_plugins_installed
    result = run_inspec_process('plugin list', INSPEC_CONFIG_DIR: empty_config_dir_path)
    assert_equal 0, result.exit_status, 'exist status must be 0'
    assert_includes result.stdout, '0 plugin(s) total', 'Empty list should include zero count'
  end

  def test_list_all_when_no_user_plugins_installed
    result = run_inspec_process('plugin list --all', INSPEC_CONFIG_DIR: empty_config_dir_path)
    assert_equal 0, result.exit_status, 'exist status must be 0'
    assert_includes result.stdout, '6 plugin(s) total', '--all list should find six'
    assert_includes result.stdout, 'inspec-plugin-manager-cli', '--all list should find inspec-plugin-manager-cli'
    assert_includes result.stdout, 'habitat', '--all list should find habitat'

    result = run_inspec_process('plugin list -a', INSPEC_CONFIG_DIR: empty_config_dir_path)
    assert_equal 0, result.exit_status, 'exist status must be 0'
    assert_includes result.stdout, '6 plugin(s) total', '-a list should find six'
  end

  def test_list_when_gem_and_path_plugins_installed
    fixture_path = File.join(core_config_dir_path, 'test-fixture-1-float')
    result = run_inspec_process('plugin list', INSPEC_CONFIG_DIR: fixture_path)
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
end

#-----------------------------------------------------------------------------------------#
#                               inspec plugin search
#-----------------------------------------------------------------------------------------#
class PluginManagerCliList < MiniTest::Test
  include CorePluginFunctionalHelper
  include PluginManagerHelpers

  def test_search_for_a_real_gem_with_full_name_no_options
    result = run_inspec_process('plugin search inspec-test-fixture')
    assert_equal 0, result.exit_status, 'Search should exit 0 on a hit'
    assert_includes result.stdout, 'inspec-test-fixture', 'Search result should contain the gem name'
    assert_includes result.stdout, '1 plugin(s) found', 'Search result should find 1 plugin'
    line = result.stdout.split("\n").grep(/inspec-test-fixture/).first
    assert_match(/\s*inspec-test-fixture\s+\((\d+\.\d+\.\d+){1}\)/,line,'Plugin line should include name and exactly one version')
  end

  def test_search_for_a_real_gem_with_stub_name_no_options
    result = run_inspec_process('plugin search inspec-test-')
    assert_equal 0, result.exit_status, 'Search should exit 0 on a hit'
    assert_includes result.stdout, 'inspec-test-fixture', 'Search result should contain the gem name'
    assert_includes result.stdout, '1 plugin(s) found', 'Search result should find 1 plugin'

    line = result.stdout.split("\n").grep(/inspec-test-fixture/).first
    assert_match(/\s*inspec-test-fixture\s+\((\d+\.\d+\.\d+){1}\)/,line,'Plugin line should include name and exactly one version')
  end

  def test_search_for_a_real_gem_with_full_name_and_exact_option
    result = run_inspec_process('plugin search --exact inspec-test-fixture')
    assert_equal 0, result.exit_status, 'Search should exit 0 on a hit'
    assert_includes result.stdout, 'inspec-test-fixture', 'Search result should contain the gem name'
    assert_includes result.stdout, '1 plugin(s) found', 'Search result should find 1 plugin'

    result = run_inspec_process('plugin search -e inspec-test-fixture')
    assert_equal 0, result.exit_status, 'Search should exit 0 on a hit'
  end

  def test_search_for_a_real_gem_with_stub_name_and_exact_option
    result = run_inspec_process('plugin search --exact inspec-test-')
    assert_equal 2, result.exit_status, 'Search should exit 2 on a miss'
    assert_includes result.stdout, '0 plugin(s) found', 'Search result should find 0 plugins'

    result = run_inspec_process('plugin search -e inspec-test-')
    assert_equal 2, result.exit_status, 'Search should exit 2 on a miss'
  end

  def test_search_for_a_real_gem_with_full_name_and_all_option
    result = run_inspec_process('plugin search --all inspec-test-fixture')
    assert_equal 0, result.exit_status, 'Search should exit 0 on a hit'
    assert_includes result.stdout, 'inspec-test-fixture', 'Search result should contain the gem name'
    assert_includes result.stdout, '1 plugin(s) found', 'Search result should find 1 plugin'

    line = result.stdout.split("\n").grep(/inspec-test-fixture/).first
    assert_match(/\s*inspec-test-fixture\s+\((\d+\.\d+\.\d+(,\s)?){2,}\)/,line,'Plugin line should include name and at least two versions')

    result = run_inspec_process('plugin search -a inspec-test-fixture')
    assert_equal 0, result.exit_status, 'Search should exit 0 on a hit'
  end

  def test_search_for_a_gem_with_missing_prefix
    result = run_inspec_process('plugin search test-fixture')
    assert_equal 1, result.exit_status, 'Search should exit 1 on user error'
    assert_includes result.stdout, "All inspec plugins must begin with either 'inspec-' or 'train-'"
  end

  def test_search_for_a_gem_that_does_not_exist
    result = run_inspec_process('plugin search inspec-test-fixture-nonesuch')
    assert_equal 2, result.exit_status, 'Search should exit 2 on a miss'
    assert_includes result.stdout, '0 plugin(s) found', 'Search result should find 0 plugins'
  end

end

#-----------------------------------------------------------------------------------------#
#                               inspec plugin install
#-----------------------------------------------------------------------------------------#
# plugin install help
# plugin install from path
# plugin install from gemfile
# plugin install from gem when gem exists, get latest version
# plugin install train plugin
# Should refuse to install gems that do not begin with train- or inspec-
# plugin install with pinned version
# plugin install nonesuch
# plugin install already installed same version
# plugin install already installed need update

#-----------------------------------------------------------------------------------------#
#                               inspec plugin update
#-----------------------------------------------------------------------------------------#
# plugin update help
# plugin update
# plugin update already current
# plugin update when not installed
# plugin update nonesuch

#-----------------------------------------------------------------------------------------#
#                               inspec plugin uninstall
#-----------------------------------------------------------------------------------------#
# plugin uninstall help
# plugin uninstall gem-based
# plugin uninstall path-based
# plugin uninstall when not installed
