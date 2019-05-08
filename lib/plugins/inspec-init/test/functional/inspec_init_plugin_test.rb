require_relative '../../../shared/core_plugin_test_helper.rb'

class InitPluginCli < Minitest::Test
  include CorePluginFunctionalHelper

  def test_generating_inspec_plugin_correct_prefix_required
    Dir.mktmpdir do |dir|
      plugin = 'wacky-name'
      run_result = run_inspec_process("init plugin --no-prompt #{plugin} ", prefix: "cd #{dir} &&")
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
      module_name = plugin.sub(/^inspec\-/, '').split('-').map(&:capitalize).join('')

      run_result = run_inspec_process("init plugin --no-prompt #{plugin}", prefix: "cd #{dir} &&")
      assert_empty run_result.stderr

      assert_equal 0, run_result.exit_status
      assert_includes run_result.stdout, 'Creating new inspec plugin at'
      assert_includes run_result.stdout, plugin

      # Check generated files and contents.
      # Each file must exist, and its contents must match each of the regexen given.
      {
        File.join(plugin, 'README.md') => [
          /#{plugin}/
        ],
        File.join(plugin, 'LICENSE') => [
          /(?!opyright)/, # No copyright by default
          /Apache License/,
        ],
        File.join(plugin, 'Gemfile') => [], # No interpolation
        File.join(plugin, 'Rakefile') => [], # No interpolation
        File.join(plugin, plugin + '.gemspec') => [
          /require '#{plugin}\/version'/,
          /spec\.name\s+=\s+'#{plugin}'/,
          /spec\.version\s+=\s+InspecPlugins::#{module_name}::VERSION/,
          /README\.md\s+#{snake_case}\.gemspec\s+Gemfile/,
          /spec\.authors\s+=\s+\['Your Name'\]/,
          /spec\.email\s+=\s+\['you@example\.com'\]/,
          /spec\.summary\s+=\s+'A plugin with a default summary'/,
          /spec\.description\s+=\s+''/,
          /spec\.homepage\s+=\s+'https:\/\/github.com\/you\/#{plugin}'/,
          /spec\.license\s+=\s+'Apache-2\.0'/,
        ],
        File.join(plugin, 'lib', plugin + '.rb') => [
          /require\s'#{plugin}\/plugin'/,
        ],
        File.join(plugin, 'lib', plugin, 'plugin.rb') => [
          /require\s'#{plugin}\/version'/,
          /\#\s#{plugin}\s=>\s#{module_name}/,
          /module\s#{module_name}/,
          /plugin_name\s+:'#{plugin}'/,
          # Default assumes one cli hook
          /cli_command :my_command/,
          /require\s'#{plugin}\/cli_command'/,
          /InspecPlugins::#{module_name}::CliCommand/,
        ],
        File.join(plugin, 'lib', plugin, 'version.rb') => [
          /module\s#{module_name}/,
        ],
        File.join(plugin, 'lib', plugin, 'cli_command.rb') => [
          /module\sInspecPlugins::#{module_name}/,
          /\#\smakes\s`inspec\smy-command\s\.\.\.`\swork\./,
          /subcommand_desc\s'my_command\s\[COMMAND\]'/,
          /\#\sas\s`inspec\smy-command\sdo-something/,
          /\#\sin\s`inspec\shelp\smy-command`/,
          /\#\sruns\s`inspec\smy-command\sdo-something`./,
          /Edit\slib\/#{plugin}\/cli_command\.rb\sto\smake\sit\sdo/,
        ],
        File.join(plugin, 'test', 'helper.rb') => [], # No interpolation
        File.join(plugin, 'test', 'functional', 'README.md') => [], # No interpolation
        File.join(plugin, 'test', 'functional', snake_case + '_test.rb') => [
          # Whatever goes here
        ],
        File.join(plugin, 'test', 'unit', 'plugin_def_test.rb') => [
          /require\s'#{plugin}\/plugin'/,
          /describe InspecPlugins::#{module_name}::Plugin\sdo/,
          /let\(:plugin_name\) \{ \:'#{plugin}\' \}/,
        ],
        File.join(plugin, 'test', 'unit', 'cli_args_test.rb') => [
          /require '#{plugin}\/cli_command'/,
          /describe InspecPlugins::#{module_name}::CliCommand do/,
          /let\(\:cli_class\) \{ InspecPlugins::#{module_name}::CliCommand \}/,
        ],
        File.join(plugin, 'test', 'unit', 'README.md') => [
          /cli_args_test\.rb/,
        ],
      }.each do |path, regexen|
        full_path = File.join(dir, path)
        assert(File.exist?(full_path), "#{path} should have been generated")
        next if regexen.empty?
        contents = File.read(full_path)
        regexen.each do |re|
          assert_match re, contents, "#{path} should match #{re}"
        end
      end
    end
  end

  def test_generating_inspec_plugin_with_custom_options
    Dir.mktmpdir do |dir|
      plugin = 'inspec-test-generated-plugin'
      snake_case = plugin.tr('-', '_')
      camel_case = plugin.sub(/^inspec\-/, '').split('-').map(&:capitalize).join('')

      opts = ''
      opts += ' --author-email bob@example.com '
      opts += ' --author-name Bob '
      opts += ' --copyright "Copyright © 2018 Bob" '
      opts += ' --description "That you will really like" '
      opts += ' --license-name BSD-3-Clause '
      opts += ' --summary "A fantastic plugin" '

      opts += ' --homepage http://example.com '
      opts += ' --module_name FunPlugin'

      run_result = run_inspec_process("init plugin #{plugin} --no-prompt #{opts}", prefix: "cd #{dir} &&")
      assert_empty run_result.stderr
      assert_equal 0, run_result.exit_status
      assert_includes run_result.stdout, 'Creating new inspec plugin at'
      assert_includes run_result.stdout, plugin

      # Check generated files and contents.
      # Each file must exist, and its contents must match each of the regexen given.
      {
        File.join(plugin, 'README.md') => [],
        File.join(plugin, 'LICENSE') => [
          /Copyright © 2018 Bob/,
          /used to endorse or promote/,
        ],
        File.join(plugin, 'Gemfile') => [],
        File.join(plugin, 'Rakefile') => [],
        File.join(plugin, plugin + '.gemspec') => [
          /spec\.version\s+=\s+InspecPlugins::FunPlugin::VERSION/,
          /spec\.authors\s+=\s+\['Bob'\]/,
          /spec\.email\s+=\s+\['bob@example\.com'\]/,
          /spec\.summary\s+=\s+'A fantastic plugin'/,
          /spec\.description\s+=\s+'That you will really like'/,
          /spec\.homepage\s+=\s+'http:\/\/example.com'/,
          /spec\.license\s+=\s+'BSD-3-Clause'/,
        ],
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
        next if regexen.empty?
        contents = File.read(full_path)
        regexen.each do |re|
          assert_match re, contents, "#{path} should match #{re}"
        end
      end
    end
  end



end