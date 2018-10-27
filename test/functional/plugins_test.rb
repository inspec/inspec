# Functional tests related to plugin facility
require 'functional/helper'


#=========================================================================================#
#                                Support
#=========================================================================================#
module PluginFunctionalHelper
  include FunctionalHelper

  def run_inspec_with_plugin(command, opts)
    pre = Proc.new do |tmp_dir|
      content = JSON.generate(__make_plugin_file_data_structure_with_path(opts[:plugin_path]))
      File.write(File.join(tmp_dir, 'plugins.json'), content)
    end

    opts.merge!({
      pre_run: pre,
      tmpdir: true,
      json: true,
      env: {
        "INSPEC_CONFIG_DIR" => '.' # We're in tmpdir
      }
    })
    run_inspec_process(command, opts)
  end

  def __make_plugin_file_data_structure_with_path(path)
    # TODO: dry this up, refs #3350
    plugin_name = File.basename(path, '.rb')
    data = __make_empty_plugin_file_data_structure
    data['plugins'] << {
      'name' => plugin_name,
      'installation_type' => 'path',
      'installation_path' => path,
    }
    data
  end

  def __make_empty_plugin_file_data_structure
    # TODO: dry this up, refs #3350
    {
      'plugins_config_version' => '1.0.0',
      'plugins' => [],
    }
  end
end

#=========================================================================================#
#                                Loader Errors
#=========================================================================================#
describe 'plugin loader' do
  include FunctionalHelper

  it 'handles an unloadable plugin correctly' do
    outcome = inspec_with_env('version',  INSPEC_CONFIG_DIR: File.join(config_dir_path, 'plugin_error_on_load'))
    outcome.exit_status.must_equal 2
    outcome.stdout.must_include('ERROR', 'Have an error on stdout')
    outcome.stdout.must_include('Could not load plugin inspec-divide-by-zero', 'Name the plugin in the stdout error')
    outcome.stdout.wont_include('ZeroDivisionError', 'No stacktrace in error by default')
    outcome.stdout.must_include('Errors were encountered while loading plugins', 'Friendly message in error')
    outcome.stdout.must_include('Plugin name: inspec-divide-by-zero', 'Plugin named in error')
    outcome.stdout.must_include('divided by 0', 'Exception message in error')

    outcome = inspec_with_env('version --debug',  INSPEC_CONFIG_DIR: File.join(config_dir_path, 'plugin_error_on_load'))
    outcome.exit_status.must_equal 2
    outcome.stdout.must_include('ZeroDivisionError', 'Include stacktrace in error with --debug')
  end
end

#=========================================================================================#
#                           CliCommand plugin type
#=========================================================================================#
describe 'cli command plugins' do
  include FunctionalHelper

  it 'is able to respond to a plugin-based cli subcommand' do
    outcome = inspec_with_env('meaningoflife answer',  INSPEC_CONFIG_DIR: File.join(config_dir_path, 'meaning_by_path'))
    outcome.stderr.wont_include 'Could not find command "meaningoflife"'
    outcome.stderr.must_equal ''
    outcome.stdout.must_equal ''
    outcome.exit_status.must_equal 42
  end

  it 'is able to respond to [help subcommand] invocations' do
    outcome = inspec_with_env('help meaningoflife',  INSPEC_CONFIG_DIR: File.join(config_dir_path, 'meaning_by_path'))
    outcome.exit_status.must_equal 0
    outcome.stderr.must_equal ''
    outcome.stdout.must_include 'inspec meaningoflife answer'
    # Full text:
    # 'Exits immediately with an exit code reflecting the answer to life the universe, and everything.'
    # but Thor will ellipsify based on the terminal width
    outcome.stdout.must_include 'Exits immediately'
  end

  # This is an important test; usually CLI plugins are only activated when their name is present in ARGV
  it 'includes plugin-based cli commands in top-level help' do
    outcome = inspec_with_env('help',  INSPEC_CONFIG_DIR: File.join(config_dir_path, 'meaning_by_path'))
    outcome.exit_status.must_equal 0
    outcome.stdout.must_include 'inspec meaningoflife'
  end
end

#=========================================================================================#
#                           inspec plugin command
#=========================================================================================#
# See lib/plugins/inspec-plugin-manager-cli/test

#=========================================================================================#
#                                CLI Usage Messaging
#=========================================================================================#
describe 'plugin cli usage message integration' do
  include FunctionalHelper

  [' help', ''].each do |invocation|
    it "includes v2 plugins in `inspec#{invocation}` output" do
      outcome = inspec(invocation)
      outcome.stderr.must_equal ''

      # These are some subcommands provided by core v2 plugins
      ['habitat', 'artifact'].each do |subcommand|
        outcome.stdout.must_include('inspec ' + subcommand)
      end
    end
  end
end

#=========================================================================================#
#                           DSL Plugin Support
#=========================================================================================#

describe 'DSL plugin types support' do
  include PluginFunctionalHelper

  let(:fixture_path) { File.join(profile_path, 'dsl_plugins', 'controls', profile_file)}
  let(:dsl_plugin_path) { File.join(mock_path, 'plugins', 'inspec-dsl-test', 'lib', 'inspec-dsl-test.rb')}
  let(:run_result) { run_inspec_with_plugin("exec #{fixture_path}",  plugin_path: dsl_plugin_path) }
  let(:json_result) { run_result.payload.json }

  describe 'control dsl plugin type support' do

    let(:profile_file) { 'control_dsl.rb' }
    it 'works correctly with control dsl extensions' do
      run_result.stderr.must_equal ''

      # The control_dsl.rb file has one control, with a describe-01, then a call to favorite_fruit, then describe-02
      # If the plugin exploded, we'd see describe-01 but not describe-02
      results = json_result['profiles'][0]['controls'][0]['results']
      results.count.must_equal 2

      # We expect the descriptions to include that the favorite fruit is banana
      # (this is the functionality of the control_dsl we installed)
      first_description_section = json_result['profiles'][0]['controls'][0]['descriptions'].first
      first_description_section.wont_be_nil
      first_description_section['label'].must_equal 'favorite_fruit'
      first_description_section['data'].must_equal 'Banana'
    end
  end

  describe 'describe dsl plugin type support' do
    let(:profile_file) { 'describe_dsl.rb' }
    it 'works correctly with describe dsl extensions' do
      run_result.stderr.must_equal ''

      # The describe_dsl.rb file has one control, with
      # describe-01, describe-02 which contains a call to favorite_vegetable, then describe-03
      # If the plugin exploded, we'd see describe-01 but not describe-02
      results = json_result['profiles'][0]['controls'][0]['results']
      results.count.must_equal 3

      # We expect the description of describe-02 to include the word aubergine
      # (this is the functionality of the describe_dsl we installed)
      second_result = json_result['profiles'][0]['controls'][0]['results'][1]
      second_result.wont_be_nil
      second_result['code_desc'].must_include 'aubergine'
    end
  end

  describe 'test dsl plugin type support' do
    let(:profile_file) { 'test_dsl.rb' }
    it 'works correctly with test dsl extensions' do
      run_result.stderr.must_equal ''

      # The test_dsl.rb file has one control, with
      # describe-01, describe-02 which contains a call to favorite_legume, then describe-03
      # If the plugin exploded, we'd see describe-01 but not describe-02
      results = json_result['profiles'][0]['controls'][0]['results']
      results.count.must_equal 3

      # I spent a while trying to find a way to get the test to alter its name;
      # that won't work for various setup reasons.
      # So, it just throws an exception with the word 'edemame' in it.
      second_result = json_result['profiles'][0]['controls'][0]['results'][1]
      second_result.wont_be_nil
      second_result['status'].must_equal 'failed'
      second_result['message'].must_include 'edemame'
    end
  end
end

#=========================================================================================#
#                           Train Plugin Support
#=========================================================================================#

describe 'train plugin support'  do
  describe 'when a train plugin is installed' do
    include FunctionalHelper
    it 'can run inspec detect against a URL target' do
      outcome = inspec_with_env('detect -t test-fixture://',  INSPEC_CONFIG_DIR: File.join(config_dir_path, 'train-test-fixture'))
      outcome.exit_status.must_equal(0)
      outcome.stderr.must_be_empty
      lines = outcome.stdout.split("\n")
      lines.grep(/Name/).first.must_include('test-fixture')
      lines.grep(/Name/).first.wont_include('train-test-fixture')
      lines.grep(/Release/).first.must_include('0.1.0')
      lines.grep(/Families/).first.must_include('os')
      lines.grep(/Families/).first.must_include('windows')
      lines.grep(/Families/).first.must_include('unix')
      lines.grep(/Arch/).first.must_include('mock')
    end

    it 'can run inspec detect against a test-fixture backend' do
      outcome = inspec_with_env('detect -b test-fixture',  INSPEC_CONFIG_DIR: File.join(config_dir_path, 'train-test-fixture'))
      outcome.exit_status.must_equal(0)
      outcome.stderr.must_be_empty
      lines = outcome.stdout.split("\n")
      lines.grep(/Name/).first.must_include('test-fixture')
      lines.grep(/Name/).first.wont_include('train-test-fixture')
      lines.grep(/Release/).first.must_include('0.1.0')
      lines.grep(/Families/).first.must_include('os')
      lines.grep(/Families/).first.must_include('windows')
      lines.grep(/Families/).first.must_include('unix')
      lines.grep(/Arch/).first.must_include('mock')
    end

    it 'can run inspec shell and read a file' do
      outcome = inspec_with_env("shell -t test-fixture:// -c 'file(\"any-path\").content'",  INSPEC_CONFIG_DIR: File.join(config_dir_path, 'train-test-fixture'))
      outcome.exit_status.must_equal(0)
      outcome.stderr.must_be_empty
      outcome.stdout.chomp.must_equal 'Lorem Ipsum'
    end

    it 'can run inspec shell and run a command' do
      outcome = inspec_with_env("shell -t test-fixture:// -c 'command(\"echo hello\").exit_status'",  INSPEC_CONFIG_DIR: File.join(config_dir_path, 'train-test-fixture'))
      outcome.exit_status.must_equal(0)
      outcome.stderr.must_be_empty
      outcome.stdout.chomp.must_equal "17"

      outcome = inspec_with_env("shell -t test-fixture:// -c 'command(\"echo hello\").stdout'",  INSPEC_CONFIG_DIR: File.join(config_dir_path, 'train-test-fixture'))
      outcome.exit_status.must_equal(0)
      outcome.stderr.must_be_empty
      outcome.stdout.chomp.must_equal "Mock Command Result stdout"
    end
  end
end