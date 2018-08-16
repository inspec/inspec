require 'minitest/autorun'
require 'minitest/test'
require_relative '../../../../lib/inspec/plugin/v2'
require_relative '../../../../lib/inspec/plugin/v2/installer'

module InstallerTestHelpers
  def reset_globals
    ENV['HOME'] = @orig_home
    ENV['INSPEC_CONFIG_DIR'] = nil
  end

  def setup
    @orig_home = Dir.home

    repo_path = File.expand_path(File.join( __FILE__, '..', '..', '..', '..', '..'))
    mock_path = File.join(repo_path, 'test', 'unit', 'mock')

    @config_dir_path = File.join(mock_path, 'config_dirs')
    @installer = Inspec::Plugin::V2::Installer.instance
    reset_globals
  end

  def teardown
    reset_globals
  end
end

#-----------------------------------------------------------------------#
# basics
#-----------------------------------------------------------------------#
class PluginInstallerBasicTests < MiniTest::Test
  include InstallerTestHelpers

  # it's a singleton
  def test_it_should_be_a_singleton
    klass = Inspec::Plugin::V2::Installer
    assert_equal klass.instance, klass.instance, "Calling instance on the Installer should always return the same object"
    assert_raises(NoMethodError, 'Installer should have a private constructor') { klass.new }
  end

  # it should know its gem path
  def test_it_should_know_its_gem_path_with_a_default_location
    ENV['HOME'] = File.join(@config_dir_path, 'fakehome')
    expected = File.join(ENV['HOME'], '.inspec', 'gems', RUBY_VERSION)
    assert_equal expected, @installer.gem_path
  end

  def test_it_should_know_its_gem_path_with_a_custom_config_dir_from_env
    ENV['INSPEC_CONFIG_DIR'] = File.join(@config_dir_path, 'empty')
    expected = File.join(ENV['INSPEC_CONFIG_DIR'], 'gems', RUBY_VERSION)
    assert_equal expected, @installer.gem_path
  end

  # it should be able to list gems present in the gem path
  # it should be able to list plugins in the gem path
end

#-----------------------------------------------------------------------#
# Installing
#-----------------------------------------------------------------------#

# it should raise an exception when trying to install a gem-plugin that does not exist
# installing a gem with dependencies should result in the deps being installed under the config dir
# Should be able to install a gem-based plugin
# Installing a gem places it under the config dir gem area
# Should be able to install a v2 CLI plugin
# Should be able to install a v2 platform plugin
# Should be able to install a path-based plugin
# Should refuse to install gems that do not begin with train- or inspec-
# Should be able to install a plugin while pinning the version

#-----------------------------------------------------------------------#
# Upgrading
#-----------------------------------------------------------------------#

# it should be able to update a plugin

#-----------------------------------------------------------------------#
# Removing
#-----------------------------------------------------------------------#

# Should be able to uninstall a gem plugin
# Should be able to uninstall a path-based plugin
# Uninstalling a nonexistant plugin is a code 2 error

#-----------------------------------------------------------------------#
# Searching
#-----------------------------------------------------------------------#

# Should be able to search for available plugins
# Should be able to search for plugins and assume the inspec- or train- prefixes.
# Should be able to suggest a train transport plugin when a gem search is successful
# Should raise an error if no train transport plugin exists