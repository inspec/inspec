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
#                      `inspec plugin SUBCOMMAND` facility
#=========================================================================================#

# Should be able to install a gem-based plugin
# Should be able to list plugins when none installed
# Should be able to list plugins when some installed
# Train plugins should be included in the list
# Should be able to list core plugins as well
# Should be able to uninstall a gem plugin
# Uninstalling a nonexistant plugin is a code 2 error

# Should be able to install a path-based plugin
# Should be able to uninstall a path-based plugin

# Should be able to install a v1 (converted legacy) plugin
# Should be able to install a v2 CLI plugin
# Should be able to install a train plugin

# Should refuse to install gems that do not begin with train- or inspec-

# Should be able to install a plugin while pinning the version
# Should be able to upgrade a plugin

# Should be able to search for available plugins
# Should be able to search for plugins and assume the inspec- or train- prefixes.

# Should be able to suggest a train transport plugin when a gem search is successful
# Should raise an error if no train transport plugin exists

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
#                           Train plugins type
#=========================================================================================#
  # TODO: when a train plugin is installed, we can use it in the -b option
  # TODO: when a train plugin is installed, we can use it in the -t option schema
# Should be able to suggest a train transport plugin when an unsupported --target schema is used and a gem search is successful
# Should be able to suggest a train transport plugin when an unrecognized profile platform declaration is used and a gem search is successful
