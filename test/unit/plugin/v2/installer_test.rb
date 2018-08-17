require 'minitest/autorun'
require 'minitest/test'
require 'fileutils'
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
    @plugin_fixture_pkg_path = File.join(mock_path, 'plugins', 'inspec-test-fixture', 'pkg')

    @installer = Inspec::Plugin::V2::Installer.instance
    reset_globals
  end

  def teardown
    reset_globals

    # We use the 'empty' config dir for exercising a lot of installs.
    # Purge it after every test.
    Dir.glob(File.join(@config_dir_path, 'empty', '*')).each do |path|
      next if path.end_with? '.gitkeep'
      FileUtils.rm_rf(path)
    end
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
end

#-----------------------------------------------------------------------#
# Installing
#-----------------------------------------------------------------------#
class PluginInstallerInstallationTests < MiniTest::Test
  include InstallerTestHelpers

  def test_refuse_to_install_gems_with_wrong_prefix
    ENV['INSPEC_CONFIG_DIR'] = File.join(@config_dir_path, 'empty')
    assert_raises(Inspec::Plugin::V2::InstallError) { @installer.install('ordinal_array')}
  end

  def test_install_a_gem_from_local_file
    ENV['INSPEC_CONFIG_DIR'] = File.join(@config_dir_path, 'empty')
    gem_file = File.join(@plugin_fixture_pkg_path, 'inspec-test-fixture-0.2.0.gem')
    @installer.install('inspec-test-fixture', gem_file: gem_file)

    # Installing a gem places it under the config dir gem area
    spec_path = File.join(@installer.gem_path, 'specifications', 'inspec-test-fixture-0.2.0.gemspec')
    assert File.exists?(spec_path), 'After installation from a gem file, the gemspec should be installed to the gem path'
    installed_gem_base = File.join(@installer.gem_path, 'gems', 'inspec-test-fixture-0.2.0')
    assert Dir.exists?(installed_gem_base), 'After installation from a gem file, the gem tree should be installed to the gem path'

    # Installation != gem activation
    spec = Gem::Specification.load(spec_path)
    refute spec.activated?, 'Installing a gem should not cause the gem to activate'
  end

  def test_install_a_gem_from_rubygems_org
    ENV['INSPEC_CONFIG_DIR'] = File.join(@config_dir_path, 'empty')

    @installer.install('inspec-test-fixture')

    # Installing a gem places it under the config dir gem area
    spec_path = File.join(@installer.gem_path, 'specifications', 'inspec-test-fixture-0.2.0.gemspec')
    assert File.exists?(spec_path), 'After installation from a gem file, the gemspec should be installed to the gem path'
    installed_gem_base = File.join(@installer.gem_path, 'gems', 'inspec-test-fixture-0.2.0')
    assert Dir.exists?(installed_gem_base), 'After installation from a gem file, the gem tree should be installed to the gem path'

    # Installation != gem activation
    spec = Gem::Specification.load(spec_path)
    refute spec.activated?, 'Installing a gem should not cause the gem to activate'
  end

  # it should raise an exception when trying to install a gem-plugin that does not exist
  # installing a gem with dependencies should result in the deps being installed under the config dir
  # Should be able to install a v2 CLI plugin
  # Should be able to install a train plugin
  # Should be able to install a path-based plugin
  # Should be able to install a plugin while pinning the version
end

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