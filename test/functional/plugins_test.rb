# Functional tests related to plugin facility
require 'functional/helper'

#=========================================================================================#
#                                Loader Errors
#=========================================================================================#
describe 'plugin loader' do
  include FunctionalHelper

  it 'handles a corrupt plugins.json correctly' do
    outcome = inspec_with_env('version',  INSPEC_CONFIG_DIR: File.join(config_dir_path, 'corrupt'))
    outcome.exit_status.must_equal 2
    outcome.stdout.wont_include('Inspec::Plugin::V2::ConfigError', 'No stacktrace in error by default')
    outcome.stdout.must_include('Failed to load plugins JSON configuration', 'Friendly message in error')
    outcome.stdout.must_include('unit/mock/config_dirs/corrupt/plugins.json', 'Location of bad file in error')

    outcome = inspec_with_env('version --debug',  INSPEC_CONFIG_DIR: File.join(config_dir_path, 'corrupt'))
    outcome.exit_status.must_equal 2
    outcome.stdout.must_include('Inspec::Plugin::V2::ConfigError', 'Include stacktrace in error with --debug')
  end

  it 'handles a misversioned plugins.json correctly' do
    outcome = inspec_with_env('version',  INSPEC_CONFIG_DIR: File.join(config_dir_path, 'bad_plugin_conf_version'))
    outcome.exit_status.must_equal 2
    outcome.stdout.wont_include('Inspec::Plugin::V2::ConfigError', 'No stacktrace in error by default')
    outcome.stdout.must_include('Unsupported plugins.json file version', 'Friendly message in error')
    outcome.stdout.must_include('unit/mock/config_dirs/bad_plugin_conf_version/plugins.json', 'Location of bad file in error')
    outcome.stdout.must_include('99.99.9', 'Incorrect version in error')

    outcome = inspec_with_env('version --debug',  INSPEC_CONFIG_DIR: File.join(config_dir_path, 'bad_plugin_conf_version'))
    outcome.exit_status.must_equal 2
    outcome.stdout.must_include('Inspec::Plugin::V2::ConfigError', 'Include stacktrace in error with --debug')
  end

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
