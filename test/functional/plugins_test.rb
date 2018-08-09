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
# Should be able to uninstall a gem plugin
# Uninstalling a nonexistant plugin is a code 2 error

# Should be able to install a path-based plugin
# Should be able to uninstall a path-based plugin

# Should be able to install a legacy "versionless" plugin
# Should be able to install a v1 (converted legacy) plugin
# Should be able to install a v2 CLI plugin
# Should be able to install a v2 platform plugin

# Should refuse to install gems that do not begin with train- or inspec-

#=========================================================================================#
#                           CliCommand plugin type
#=========================================================================================#

# should be able to use a CLI subcommand provided by a plugin
# should be able to use a CLI subcommand provided by a plugin when the userdir is in a custom location
