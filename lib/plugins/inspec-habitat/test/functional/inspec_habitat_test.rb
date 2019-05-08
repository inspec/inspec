require_relative '../../../shared/core_plugin_test_helper.rb'
require 'fileutils'

class ProfileCli < Minitest::Test
  include CorePluginFunctionalHelper

  def setup
    @tmpdir = Dir.mktmpdir
    @habitat_profile = File.join(@tmpdir, 'habitat-profile')
    run_inspec_process('init profile ' + @habitat_profile)
  end

  def teardown
    FileUtils.remove_entry_secure(@tmpdir)
  end

  def test_setup_subcommand
    result = run_inspec_process('habitat profile setup ' + @habitat_profile + ' --log-level debug')

    # Command runs without error
    assert_empty result.stderr
    assert_equal 0, result.exit_status

    # Command creates only expected files
    base_dir = File.join(@tmpdir, 'habitat-profile', 'habitat')
    files = %w{
      default.toml
      plan.sh
      config
      config/inspec_exec_config.json
      hooks
      hooks/run
    }
    actual_files = Dir.glob(File.join(base_dir, '**/*'))
    expected_files = files.map { |x| File.join(base_dir, x) }
    assert_equal actual_files.sort, expected_files.sort
  end
end
