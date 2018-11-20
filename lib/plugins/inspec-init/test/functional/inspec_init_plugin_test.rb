require_relative '../../../shared/core_plugin_test_helper.rb'

class InitPluginCli < MiniTest::Test
  include CorePluginFunctionalHelper

  def test_generating_inspec_plugin_correct_prefix_required
    Dir.mktmpdir do |dir|
      plugin = 'wacky-name'
      run_result = run_inspec_process("init plugin #{plugin}", prefix: "cd #{dir} &&")
      assert_equal 1, run_result.exit_status
      assert_empty run_result.stderr
      assert_includes run_result.stdout, 'ERROR'
      assert_includes run_result.stdout, 'Plugin names must begin with'
    end
  end

  def test_generating_inspec_plugin_with_default_options
    Dir.mktmpdir do |dir|
      plugin = 'inspec-test-generated-plugin'
      snake_case = plugin.tr('-', '_')
      camel_case = plugin.sub(/^inspec\-/, '').split('-').map(&:capitalize).join('')

      run_result = run_inspec_process("init plugin #{plugin}", prefix: "cd #{dir} &&")
      assert_empty run_result.stderr
      assert_equal 0, run_result.exit_status
      assert_includes run_result.stdout, 'Creating new inspec plugin at'
      assert_includes run_result.stdout, plugin

      # Check generated files and contents.
      # Each file must exist, and its contents must match each of the regexen given.
      {
        File.join(plugin, 'README.md') => [],
        File.join(plugin, 'LICENSE') => [],
        File.join(plugin, 'Gemfile') => [],
        File.join(plugin, 'Rakefile') => [],
        File.join(plugin, plugin + '.gemspec') => [],
        File.join(plugin, 'lib', plugin + '.rb') => [],
        File.join(plugin, 'lib', plugin, 'plugin.rb') => [],
        File.join(plugin, 'lib', plugin, 'version.rb') => [],
        File.join(plugin, 'lib', plugin, 'cli_command.rb') => [],
        File.join(plugin, 'test', 'helper.rb') => [],
        File.join(plugin, 'test', 'functional', snake_case + '_test.rb') => [],
        File.join(plugin, 'test', 'unit', 'plugin_def_test.rb') => [],
        File.join(plugin, 'test', 'unit', 'cli_args_test.rb') => [],
      }.each do |path, regexen|
        full_path = File.join(dir, path)
        assert(File.exist?(full_path), "#{path} should have been generated")
      end
    end
  end
end