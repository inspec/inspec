require 'minitest/autorun'
require 'minitest/test'
require 'fileutils'
require 'json'
require_relative '../../../../lib/inspec/plugin/v2'
require_relative '../../../../lib/inspec/plugin/v2/installer'

require 'byebug'

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

    @ruby_abi_version = (RUBY_VERSION.split('.')[0,2] << '0').join('.')

    @installer = Inspec::Plugin::V2::Installer.instance
    reset_globals
  end

  def teardown
    reset_globals

    # We use the 'empty' config dir for exercising a lot of installs.
    # Purge it after every test.
    unless ENV['INSPEC_TEST_PRESERVE_PLUGIN']
      Dir.glob(File.join(@config_dir_path, 'empty', '*')).each do |path|
        next if path.end_with? '.gitkeep'
        FileUtils.rm_rf(path)
      end
    end

    # TODO: may need to edit the $LOAD_PATH, if it turns out that we need to "deactivate" gems after installation
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
    expected = File.join(ENV['HOME'], '.inspec', 'gems', @ruby_abi_version)
    assert_equal expected, @installer.gem_path
  end

  def test_it_should_know_its_gem_path_with_a_custom_config_dir_from_env
    ENV['INSPEC_CONFIG_DIR'] = File.join(@config_dir_path, 'empty')
    expected = File.join(ENV['INSPEC_CONFIG_DIR'], 'gems', @ruby_abi_version)
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
    gem_file = File.join(@plugin_fixture_pkg_path, 'inspec-test-fixture-0.1.0.gem')
    @installer.install('inspec-test-fixture', gem_file: gem_file)

    # Installing a gem places it under the config dir gem area
    spec_path = File.join(@installer.gem_path, 'specifications', 'inspec-test-fixture-0.1.0.gemspec')
    assert File.exists?(spec_path), 'After installation from a gem file, the gemspec should be installed to the gem path'
    installed_gem_base = File.join(@installer.gem_path, 'gems', 'inspec-test-fixture-0.1.0')
    assert Dir.exists?(installed_gem_base), 'After installation from a gem file, the gem tree should be installed to the gem path'

    # Installation != gem activation
    spec = Gem::Specification.load(spec_path)
    refute spec.activated?, 'Installing a gem should not cause the gem to activate'
  end

  def test_install_a_gem_from_local_file_creates_plugin_json
    ENV['INSPEC_CONFIG_DIR'] = File.join(@config_dir_path, 'empty')
    gem_file = File.join(@plugin_fixture_pkg_path, 'inspec-test-fixture-0.1.0.gem')
    @installer.install('inspec-test-fixture', gem_file: gem_file)

    # Should now be present in plugin.json
    plugin_json_path = File.join(ENV['INSPEC_CONFIG_DIR'], 'plugins.json')
    assert File.exist?(plugin_json_path), 'plugins.json should now exist'
    plugin_json_data = JSON.parse(File.read(plugin_json_path))

    assert_includes plugin_json_data.keys, 'plugins_config_version'
    assert_equal '1.0.0', plugin_json_data['plugins_config_version'], 'Plugin config version should ve initted to 1.0.0'
    assert_includes plugin_json_data.keys, 'plugins'
    assert_kind_of Array, plugin_json_data['plugins']
    assert_equal 1, plugin_json_data['plugins'].count, 'plugins.json should have one entry'
    entry = plugin_json_data['plugins'].first
    assert_kind_of Hash, entry
    assert_includes entry.keys, 'name'
    assert_equal 'inspec-test-fixture', entry['name']
    # TODO: any other fields to check? gem version?
  end

  def test_install_a_gem_from_rubygems_org
    ENV['INSPEC_CONFIG_DIR'] = File.join(@config_dir_path, 'empty')

    @installer.install('inspec-test-fixture')

    # Installing a gem places it under the config dir gem area
    spec_path = File.join(@installer.gem_path, 'specifications', 'inspec-test-fixture-0.2.0.gemspec')
    assert File.exists?(spec_path), 'After installation from rubygems.org, the gemspec should be installed to the gem path'
    installed_gem_base = File.join(@installer.gem_path, 'gems', 'inspec-test-fixture-0.2.0')
    assert Dir.exists?(installed_gem_base), 'After installation from rubygems.org, the gem tree should be installed to the gem path'

    # installing a gem with dependencies should result in the deps being installed under the config dir
    spec_path = File.join(@installer.gem_path, 'specifications', 'ordinal_array-0.2.0.gemspec')
    assert File.exists?(spec_path), 'After installation from a gem file, the emspec should be installed to the gem path'
    installed_gem_base = File.join(@installer.gem_path, 'gems', 'inspec-test-fixture-0.2.0')
    assert Dir.exists?(installed_gem_base), 'After installation from a gem file, the gem tree should be installed to the gem path'


    # Installation != gem activation
    spec = Gem::Specification.load(spec_path)
    refute spec.activated?, 'Installing a gem should not cause the gem to activate'
  end

  def test_handle_no_such_gem
    ENV['INSPEC_CONFIG_DIR'] = File.join(@config_dir_path, 'empty')

    assert_raises(Inspec::Plugin::V2::InstallError) { @installer.install('inspec-test-fixture-nonesuch') }
  end

  # Should be able to install a plugin while pinning the version
  def test_install_a_pinned_gem_from_rubygems_org
    ENV['INSPEC_CONFIG_DIR'] = File.join(@config_dir_path, 'empty')

    @installer.install('inspec-test-fixture', version: '= 0.1.0')

    # Installing a gem places it under the config dir gem area
    spec_path = File.join(@installer.gem_path, 'specifications', 'inspec-test-fixture-0.1.0.gemspec')
    assert File.exists?(spec_path), 'After pinned installation from rubygems.org, the gemspec should be installed to the gem path'
    spec_path = File.join(@installer.gem_path, 'specifications', 'inspec-test-fixture-0.2.0.gemspec')
    refute File.exists?(spec_path), 'After pinned installation from rubygems.org, the wrong gemspec version should be absent'

    plugin_json_path = File.join(ENV['INSPEC_CONFIG_DIR'], 'plugins.json')
    plugin_json_data = JSON.parse(File.read(plugin_json_path))
    entry = plugin_json_data['plugins'].detect { |e| e["name"] == 'inspec-test-fixture'}
    assert_includes entry.keys, 'version', 'plugins.json should include version pinning key'
    assert_equal '= 0.1.0', entry['version'], 'plugins.json should include version pinning value'
 end


  # Should be able to install a v2 CLI plugin
  # Should be able to install a train plugin

  # Should be able to install a path-based plugin
end

#-----------------------------------------------------------------------#
# Upgrading
#-----------------------------------------------------------------------#

# it should be able to update a plugin to a specified later version
# it should be able to update a plugin to the latest version
# trying to upgrade a plugin that is already installed at the requested version is a graceful error 2
# trying to install a plugin that is already installed at the requested version is a graceful error 2
# trying to install a plugin that is already installed at different version is a graceful error 2 with error mentioning upgrade command

# Stretch:
#   update all
#   downgrade

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
# Should be able to suggest a train transport plugin when an unsupported --target schema is used and a gem search is successful
# Should be able to suggest a train transport plugin when an unrecognized profile platform declaration is used and a gem search is successful
# Should raise an error if no train transport plugin exists and an unsupported --target schema is used
# Should raise an error if no train transport plugin exists and an unrecognized profile platform declaration is used
