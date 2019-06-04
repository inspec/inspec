# Functional tests related to plugin facility
require 'functional/helper'


#=========================================================================================#
#                                Loader Errors
#=========================================================================================#
describe 'plugin loader' do
  include FunctionalHelper

  before {
    skip_windows!
  }

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
#                              Disabling Plugins
#=========================================================================================#
describe 'when disabling plugins' do
  include FunctionalHelper

  before {
    skip_windows!
  }

  describe 'when disabling the core plugins' do
    it 'should not be able to use core-provided commands' do
      run_result = run_inspec_process('--disable-core-plugins habitat')
      run_result.stderr.must_include 'Could not find command "habitat".'
      # One might think that this should be code 2 (plugin error)
      # But because the core plugins are not loaded, 'habitat' is not
      # a known command, which makes it a usage error, code 1.
      run_result.exit_status.must_equal 1
    end
  end

  describe 'when disabling the user plugins' do
    it 'should not be able to use user commands' do
      run_result = run_inspec_process('--disable-user-plugins meaningoflife answer', env: { INSPEC_CONFIG_DIR: File.join(config_dir_path, 'meaning_by_path') })
      run_result.stderr.must_include 'Could not find command "meaningoflife"'
      run_result.exit_status.must_equal 1
    end
  end
end

#=========================================================================================#
#                           CliCommand plugin type
#=========================================================================================#
describe 'cli command plugins' do
  include FunctionalHelper

  before {
    skip_windows!
  }

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
#                                Plugin Disable Messaging
#=========================================================================================#
describe 'disable plugin usage message integration' do
  include FunctionalHelper

  before {
    skip_windows!
  }

  it "mentions the --disable-{user,core}-plugins options" do
    outcome = inspec('help')
    ['--disable-user-plugins', '--disable-core-plugins'].each do |option|
      outcome.stdout.must_include(option)
    end
  end
end

#=========================================================================================#
#                           DSL Plugin Support
#=========================================================================================#

describe 'DSL plugin types support' do
  include PluginFunctionalHelper

  before {
    skip_windows!
  }

  let(:fixture_path) { File.join(profile_path, 'dsl_plugins', 'controls', profile_file)}
  let(:dsl_plugin_path) { File.join(mock_path, 'plugins', 'inspec-dsl-test', 'lib', 'inspec-dsl-test.rb')}
  let(:run_result) { run_inspec_with_plugin("exec #{fixture_path}",  plugin_path: dsl_plugin_path) }
  let(:json_result) { run_result.payload.json }

  describe 'outer profile dsl plugin type support' do
    let(:profile_file) { 'outer_profile_dsl.rb' }
    it 'works correctly with outer_profile dsl extensions' do
      run_result.stderr.must_equal ''

      # The outer_profile_dsl.rb file has control-01, then a call to favorite_grain
      # (which generates a control), then control-03.
      # If the plugin exploded, we'd see control-01 but not control-03
      controls = json_result['profiles'][0]['controls']
      controls.count.must_equal 3

      # We expect the second controls id to be 'sorghum'
      # (this is the functionality of the outer_profile_dsl we installed)
      generated_control = json_result['profiles'][0]['controls'][1]
      generated_control['id'].must_equal 'sorghum'
      generated_control['results'][0]['status'].must_equal 'passed'
    end
  end

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

  describe 'resource dsl plugin type support' do
    let(:profile_file) { 'unused' }
    it 'works correctly with test dsl extensions' do
      # We have to build a custom command line - need to load the whole profile,
      # so the libraries get loaded.
      cmd = 'exec '
      cmd += File.join(profile_path, 'dsl_plugins')
      cmd += ' --controls=/^rdsl-control/ '
      run_result = run_inspec_with_plugin(cmd, plugin_path: dsl_plugin_path)
      run_result.stderr.must_equal ''

      # We should have three controls; 01 and 03 just do a string match.
      # 02 uses the custom resource, which relies on calls to the resource DSL.
      # If the plugin exploded, we'd see rdsl-control-01 but not rdsl-control-02
      json_result = run_result.payload.json
      results = json_result['profiles'][0]['controls']
      results.count.must_equal 3

      # Control 2 has 2 describes; one uses a simple explicit matcher,
      # while the second uses a matcher defined via a macro provided by the resource DSL.
      control2_results = results[1]['results']
      control2_results[0]['status'].must_equal 'passed'
      control2_results[0]['code_desc'].must_include 'favorite_berry'
      control2_results[0]['code_desc'].must_include 'blendable'

      control2_results[1]['status'].must_equal 'passed'
      control2_results[1]['code_desc'].must_include 'favorite_berry'
      control2_results[1]['code_desc'].must_include 'have drupals'
    end
  end
end

#=========================================================================================#
#                           Train Plugin Support
#=========================================================================================#

describe 'train plugin support'  do
  before {
    skip_windows!
  }

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
