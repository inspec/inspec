require 'minitest/autorun'
# Other unit tests include the webmock framework, which is process-wide.
# We need to disable it, or else mock many, many rubygems API calls.
require 'webmock/minitest'

require 'fileutils'
require 'json'
require_relative '../../../../lib/inspec/plugin/v2'
require_relative '../../../../lib/inspec/plugin/v2/installer'

require 'byebug'

module InstallerTestHelpers
  def reset_globals
    ENV['HOME'] = @orig_home
    ENV['INSPEC_CONFIG_DIR'] = nil
    @installer.__reset
  end

  def copy_in_config_dir(fixture_name)
    src = Dir.glob(File.join(@config_dir_path, fixture_name, '*'))
    dest = File.join(@config_dir_path, 'empty')
    src.each { |path| FileUtils.cp_r(path, dest) }
  end

  def setup
    @orig_home = Dir.home

    repo_path = File.expand_path(File.join( __FILE__, '..', '..', '..', '..', '..'))
    mock_path = File.join(repo_path, 'test', 'unit', 'mock')
    @config_dir_path = File.join(mock_path, 'config_dirs')
    @plugin_fixture_src_path = File.join(mock_path, 'plugins', 'inspec-test-fixture')
    @plugin_fixture_pkg_path = File.join(@plugin_fixture_src_path, 'pkg')

    # This is unstable under CI; see https://github.com/inspec/inspec/issues/3355
    # @ruby_abi_version = (RUBY_VERSION.split('.')[0,2] << '0').join('.')
    @ruby_abi_version = (Gem.ruby_version.segments[0, 2] << 0).join('.')

    @installer = Inspec::Plugin::V2::Installer.instance
    reset_globals
    WebMock.disable_net_connect!(allow: %r{(api\.)?rubygems\.org/.*})
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

    # Clean up any activated gems
    Gem.loaded_specs.delete('inspec-test-fixture')
  end
end

#-----------------------------------------------------------------------#
# basics
#-----------------------------------------------------------------------#
class PluginInstallerBasicTests < Minitest::Test
  include InstallerTestHelpers

  # it's a singleton
  def test_it_should_be_a_singleton
    klass = Inspec::Plugin::V2::Installer
    assert_equal klass.instance, klass.instance, "Calling instance on the Installer should always return the same object"
    assert_kind_of Inspec::Plugin::V2::Installer, klass.instance, 'Calling instance on the INstaller should return the right class'
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
class PluginInstallerInstallationTests < Minitest::Test
  include InstallerTestHelpers

  # While this is a negative test case on the prefix checking, there are
  # several positive test cases following.
  def test_refuse_to_install_gems_with_wrong_name_prefix
    ENV['INSPEC_CONFIG_DIR'] = File.join(@config_dir_path, 'empty')

    # Here, ordinal_array is the name of a simple, small gem available on rubygems.org
    # There is no significance in choosing that gem over any other.
    # Main point here is that its name does not begin with 'inspec-'.
    assert_raises(Inspec::Plugin::V2::InstallError) { @installer.install('ordinal_array')}
  end

  def test_install_a_gem_from_local_file
    ENV['INSPEC_CONFIG_DIR'] = File.join(@config_dir_path, 'empty')
    gem_file = File.join(@plugin_fixture_pkg_path, 'inspec-test-fixture-0.1.0.gem')
    @installer.install('inspec-test-fixture', gem_file: gem_file)
    # Because no exception was thrown, this is a positive test case for prefix-checking.

    # Installing a gem places it under the config dir gem area
    # Two things should happen: a copy of the gemspec should be left there...
    spec_path = File.join(@installer.gem_path, 'specifications', 'inspec-test-fixture-0.1.0.gemspec')
    assert File.exist?(spec_path), 'After installation from a gem file, the gemspec should be installed to the gem path'
    # ... and the actual library code should be decompressed into a directory tree.
    installed_gem_base = File.join(@installer.gem_path, 'gems', 'inspec-test-fixture-0.1.0')
    assert Dir.exist?(installed_gem_base), 'After installation from a gem file, the gem tree should be installed to the gem path'

    # Installation = gem activation
    spec = Gem.loaded_specs['inspec-test-fixture']
    assert spec.activated?, 'Installing a gem should cause the gem to activate'
  end

  def test_install_a_gem_from_missing_local_file
    ENV['INSPEC_CONFIG_DIR'] = File.join(@config_dir_path, 'empty')
    gem_file = File.join(@plugin_fixture_pkg_path, 'inspec-test-fixture-nonesuch-0.0.0.gem')
    refute File.exist?(gem_file), "The nonexistant gem should not exist prior to install attempt"
    ex = assert_raises(Inspec::Plugin::V2::InstallError) { @installer.install('inspec-test-fixture-nonesuch', gem_file: gem_file)}
    assert_includes ex.message, 'Could not find local gem file'
  end

  def test_install_a_gem_from_local_file_creates_plugin_json
    ENV['INSPEC_CONFIG_DIR'] = File.join(@config_dir_path, 'empty')
    gem_file = File.join(@plugin_fixture_pkg_path, 'inspec-test-fixture-0.1.0.gem')
    @installer.install('inspec-test-fixture', gem_file: gem_file)

    # Should now be present in plugin.json
    plugin_json_path = File.join(ENV['INSPEC_CONFIG_DIR'], 'plugins.json')
    assert File.exist?(plugin_json_path), 'plugins.json should now exist'
    config_file = Inspec::Plugin::V2::ConfigFile.new(plugin_json_path)

    assert_equal 1, config_file.count, 'plugins.json should have one entry'
    assert config_file.existing_entry?(:'inspec-test-fixture')
  end

  def test_install_a_gem_from_rubygems_org
    ENV['INSPEC_CONFIG_DIR'] = File.join(@config_dir_path, 'empty')

    @installer.install('inspec-test-fixture')
    # Because no exception was thrown, this is a positive test case for prefix-checking.

    # Installing a gem places it under the config dir gem area
    spec_path = File.join(@installer.gem_path, 'specifications', 'inspec-test-fixture-0.2.0.gemspec')
    assert File.exist?(spec_path), 'After installation from rubygems.org, the gemspec should be installed to the gem path'
    installed_gem_base = File.join(@installer.gem_path, 'gems', 'inspec-test-fixture-0.2.0')
    assert Dir.exist?(installed_gem_base), 'After installation from rubygems.org, the gem tree should be installed to the gem path'

    # installing a gem with dependencies should result in the deps being installed under the config dir
    spec_path = File.join(@installer.gem_path, 'specifications', 'ordinal_array-0.2.0.gemspec')
    assert File.exist?(spec_path), 'After installation from a gem file, the gemspec should be installed to the gem path'
    installed_gem_base = File.join(@installer.gem_path, 'gems', 'inspec-test-fixture-0.2.0')
    assert Dir.exist?(installed_gem_base), 'After installation from a gem file, the gem tree should be installed to the gem path'

    # Installation != gem activation
    spec = Gem.loaded_specs['inspec-test-fixture']
    assert spec.activated?, 'Installing a gem should cause the gem to activate'
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
    assert File.exist?(spec_path), 'After pinned installation from rubygems.org, the gemspec should be installed to the gem path'
    spec_path = File.join(@installer.gem_path, 'specifications', 'inspec-test-fixture-0.2.0.gemspec')
    refute File.exist?(spec_path), 'After pinned installation from rubygems.org, the wrong gemspec version should be absent'

    config_file = Inspec::Plugin::V2::ConfigFile.new
    entry = config_file.plugin_by_name(:'inspec-test-fixture')
    assert_includes entry.keys, :version, 'plugins.json should include version pinning key'
    assert_equal '= 0.1.0', entry[:version], 'plugins.json should include version pinning value'
  end

  def test_install_a_gem_with_conflicting_depends_from_rubygems_org
    ENV['INSPEC_CONFIG_DIR'] = File.join(@config_dir_path, 'empty')

    ex = assert_raises(Inspec::Plugin::V2::InstallError) do
      @installer.install('inspec-test-fixture', version: '= 0.1.1')
    end
    assert_includes ex.message, "can't activate rake-0.4.8, already activated rake-"
  end

  def test_install_a_gem_with_invalid_depends_from_rubygems_org
    ENV['INSPEC_CONFIG_DIR'] = File.join(@config_dir_path, 'empty')

    ex = assert_raises(Inspec::Plugin::V2::InstallError) do
      @installer.install('inspec-test-fixture', version: '= 0.1.2')
    end
    assert_includes ex.message, "Could not find 'fake_plugin_dependency' (>= 0)"
  end

  def test_install_a_plugin_from_a_path
    ENV['INSPEC_CONFIG_DIR'] = File.join(@config_dir_path, 'empty')

    @installer.install('inspec-test-fixture', path: @plugin_fixture_src_path)

    # No gemspec should exist in the plugins area
    specs = Dir.glob(File.join(@installer.gem_path, 'specifications', '*.gemspec'))
    assert_empty specs, 'After install-from-path, no gemspecs should be installed'

    config_file = Inspec::Plugin::V2::ConfigFile.new
    entry = config_file.plugin_by_name(:'inspec-test-fixture')
    assert_includes entry.keys, :installation_type, 'plugins.json should include installation_type key'
    assert_equal :path, entry[:installation_type], 'plugins.json should include path installation_type'

    assert_includes entry.keys, :installation_path, 'plugins.json should include installation_path key'
    assert_equal @plugin_fixture_src_path, entry[:installation_path], 'plugins.json should include correct value for installation path'
  end

  def test_refuse_to_install_gem_whose_name_is_on_the_reject_list
    ENV['INSPEC_CONFIG_DIR'] = File.join(@config_dir_path, 'empty')

    # Here, 'inspec-core', 'inspec-multi-server', and 'train-tax-collector'
    # are the names of real rubygems.  They are not InSpec/Train plugins, though,
    # and installing them would be a jam-up.
    # This is configured in 'etc/plugin-filter.json'.
    [
      'inspec-core',
      'inspec-multi-server',
      'train-tax-calculator',
    ].each do |plugin_name|
      ex = assert_raises(Inspec::Plugin::V2::InstallError) { @installer.install(plugin_name)}
      assert_includes(ex.message, 'on the Plugin Exclusion List')
      assert_includes(ex.message, 'Rationale:')
    end
  end
end

#-----------------------------------------------------------------------#
# Updating
#-----------------------------------------------------------------------#
class PluginInstallerUpdaterTests < Minitest::Test
  include InstallerTestHelpers

  def test_update_using_path_not_allowed
    ENV['INSPEC_CONFIG_DIR'] = File.join(@config_dir_path, 'empty')

    assert_raises(Inspec::Plugin::V2::UpdateError) do
      @installer.update('inspec-test-fixture', path: @plugin_fixture_src_path)
    end
  end

  def test_update_existing_plugin_at_same_version_not_allowed
    copy_in_config_dir('test-fixture-1-float')
    ENV['INSPEC_CONFIG_DIR'] = File.join(@config_dir_path, 'empty')

    assert_raises(Inspec::Plugin::V2::UpdateError) do
      @installer.update('inspec-test-fixture', version: '0.1.0')
    end
  end

  def test_install_plugin_at_existing_version_not_allowed
    copy_in_config_dir('test-fixture-1-float')
    ENV['INSPEC_CONFIG_DIR'] = File.join(@config_dir_path, 'empty')

    assert_raises(Inspec::Plugin::V2::InstallError) do
      @installer.install('inspec-test-fixture', version: '0.1.0')
    end
  end

  def test_install_existing_plugin_not_allowed
    copy_in_config_dir('test-fixture-1-float')
    ENV['INSPEC_CONFIG_DIR'] = File.join(@config_dir_path, 'empty')

    ex = assert_raises(Inspec::Plugin::V2::InstallError) do
      @installer.install('inspec-test-fixture')
    end
    assert_includes ex.message, "Use 'inspec plugin update'"
  end

  def test_update_to_latest_version
    copy_in_config_dir('test-fixture-1-float')
    ENV['INSPEC_CONFIG_DIR'] = File.join(@config_dir_path, 'empty')
    @installer.__reset_loader
    @installer.update('inspec-test-fixture')

    # Verify presence of gemspecs
    spec_path = File.join(@installer.gem_path, 'specifications', 'inspec-test-fixture-0.2.0.gemspec')
    assert File.exist?(spec_path), 'After update, the 0.2.0 gemspec should be installed to the gem path'
    spec_path = File.join(@installer.gem_path, 'specifications', 'inspec-test-fixture-0.1.0.gemspec')
    assert File.exist?(spec_path), 'After update, the 0.1.0 gemspec should remain'

    # Plugins file entry should not be version pinned
    plugin_json_path = File.join(ENV['INSPEC_CONFIG_DIR'], 'plugins.json')
    plugin_json_data = JSON.parse(File.read(plugin_json_path))
    entry = plugin_json_data['plugins'].detect { |e| e["name"] == 'inspec-test-fixture'}
    refute_includes entry.keys, 'version', 'plugins.json should NOT include version pinning key'
  end

  def test_update_to_specified_later_version
    copy_in_config_dir('test-fixture-1-float')
    ENV['INSPEC_CONFIG_DIR'] = File.join(@config_dir_path, 'empty')
    @installer.__reset_loader

    # Update to specific (but later) version
    @installer.update('inspec-test-fixture', version: '0.2.0')

    # Verify presence of gemspecs
    spec_path = File.join(@installer.gem_path, 'specifications', 'inspec-test-fixture-0.2.0.gemspec')
    assert File.exist?(spec_path), 'After update, the 0.2.0 gemspec should be installed to the gem path'
    spec_path = File.join(@installer.gem_path, 'specifications', 'inspec-test-fixture-0.1.0.gemspec')
    assert File.exist?(spec_path), 'After update, the 0.1.0 gemspec should remain'

    # Plugins file entry should be version pinned
    config_file = Inspec::Plugin::V2::ConfigFile.new
    entry = config_file.plugin_by_name(:'inspec-test-fixture')
    assert_includes entry.keys, :version, 'plugins.json should include version pinning key'
    assert_equal '= 0.2.0', entry[:version], 'plugins.json should include version pinning value'
  end

  # TODO: Prevent updating a gem if it will lead to unsolveable dependencies
  # TODO: allow updating a gem that will lead to unsolveable dependencies if :force is provided
  # TODO: Prevent downgrading a gem if it will lead to unsolveable dependencies
  # TODO: allow downgrading a gem that will lead to unsolveable dependencies if :force is provided
  # TODO: update all
  # TODO: downgrade a plugin
  # TODO: Trying to do a gemfile install with an update is an error if the file version matches the installed version

end

#-----------------------------------------------------------------------#
# Uninstalling
#-----------------------------------------------------------------------#
class PluginInstallerUninstallTests < Minitest::Test
  include InstallerTestHelpers

  def test_uninstalling_a_nonexistant_plugin_is_an_error
    # Try a mythical one
    ex = assert_raises(Inspec::Plugin::V2::UnInstallError) do
      @installer.uninstall('inspec-test-fixture-nonesuch')
    end
    assert_includes ex.message, "'inspec-test-fixture-nonesuch' is not installed, refusing to uninstall."

    # Try a real plugin that is not installed
    ex = assert_raises(Inspec::Plugin::V2::UnInstallError) do
      @installer.uninstall('inspec-test-fixture')
    end
    assert_includes ex.message, "'inspec-test-fixture' is not installed, refusing to uninstall."
  end

  def test_uninstalling_a_path_based_plugin_works
    copy_in_config_dir('meaning_by_path')
    ENV['INSPEC_CONFIG_DIR'] = File.join(@config_dir_path, 'empty')
    @installer.__reset_loader

    @installer.uninstall('inspec-meaning-of-life')

    # Plugins file entry should be removed
    plugin_json_path = File.join(ENV['INSPEC_CONFIG_DIR'], 'plugins.json')
    plugin_json_data = JSON.parse(File.read(plugin_json_path))
    entries = plugin_json_data['plugins'].select { |e| e["name"] == 'inspec-meaning-of-life'}
    assert_empty entries, "After path-based uninstall, plugin name should be removed from plugins.json"

  end

  def test_uninstall_a_gem_plugin
    copy_in_config_dir('test-fixture-1-float')
    ENV['INSPEC_CONFIG_DIR'] = File.join(@config_dir_path, 'empty')
    @installer.__reset_loader

    @installer.uninstall('inspec-test-fixture')

    # UnInstalling a gem physically removes the gemspec and the gem library code
    spec_path = File.join(@installer.gem_path, 'specifications', 'inspec-test-fixture-0.1.0.gemspec')
    refute File.exist?(spec_path), 'After uninstallation of a gem plugin, the gemspec should be removed.'
    installed_gem_base = File.join(@installer.gem_path, 'gems', 'inspec-test-fixture-0.1.0')
    refute Dir.exist?(installed_gem_base), 'After uninstallation of a gem plugin, the gem tree should be removed.'

    # Rubygems' idea of what we have installed should be changed.
    # It should no longer be able to satisfy a request for the formerly installed gem.
    universe_set = @installer.send(:build_gem_request_universe) # private method
    request_set = Gem::RequestSet.new(Gem::Dependency.new('inspec-test-fixture'))
    assert_raises(Gem::UnsatisfiableDependencyError) { request_set.resolve(universe_set) }

    # Plugins file entry should be removed
    config_file = Inspec::Plugin::V2::ConfigFile.new
    refute config_file.existing_entry?(:'inspec-test-fixture'), "After gem-based uninstall, plugin name should be removed from plugins.json"
  end

  def test_uninstall_a_gem_plugin_removes_deps
    copy_in_config_dir('test-fixture-2-float')
    ENV['INSPEC_CONFIG_DIR'] = File.join(@config_dir_path, 'empty')
    @installer.__reset_loader

    @installer.uninstall('inspec-test-fixture')

    # UnInstalling a gem removes the gemspec and the gem library code
    spec_path = File.join(@installer.gem_path, 'specifications', 'inspec-test-fixture-0.2.0.gemspec')
    refute File.exist?(spec_path), 'After uninstallation of a gem plugin with deps, the gemspec should be removed.'
    installed_gem_base = File.join(@installer.gem_path, 'gems', 'inspec-test-fixture-0.2.0')
    refute Dir.exist?(installed_gem_base), 'After uninstallation of a gem plugin with deps, the gem tree should be removed.'

    # UnInstalling a gem with dependencies should result in the deps being removed
    spec_path = File.join(@installer.gem_path, 'specifications', 'ordinal_array-0.2.0.gemspec')
    refute File.exist?(spec_path), 'After uninstallation of a gem plugin with deps, the dep gemspec should be removed.'
    installed_gem_base = File.join(@installer.gem_path, 'gems', 'ordinal_array-0.2.0')
    refute Dir.exist?(installed_gem_base), 'After installation a gem plugin with deps, the gem tree should be removed.'

    # Rubygems' idea of what we have installed should be changed.
    # It should no longer be able to satisfy a request for the formerly installed *dependency*
    universe_set = @installer.send(:build_gem_request_universe) # private method
    request_set = Gem::RequestSet.new(Gem::Dependency.new('ordinal_array'))
    assert_raises(Gem::UnsatisfiableDependencyError) { request_set.resolve(universe_set) }
  end

  # TODO: Able to uninstall a specific version of a gem plugin
  # TODO: Prevent removing a gem if it will lead to unsolveable dependencies
  # TODO: Allow removing a gem that will lead to unsolveable dependencies if :force is provided
end

#-----------------------------------------------------------------------#
# Searching
#-----------------------------------------------------------------------#
class PluginInstallerSearchTests < Minitest::Test
  include InstallerTestHelpers

  def test_search_for_plugin_by_exact_name
    results = @installer.search('inspec-test-fixture', exact: true)
    assert_kind_of Hash, results, 'Results from searching should be a Hash'
    assert results.key?('inspec-test-fixture'), 'Search results should have a key for the sought plugin'
    assert_equal 1, results.count, 'There should be exactly one search result'
    version_list = results['inspec-test-fixture']
    assert_includes version_list, '0.1.0', 'Version list should contain 0.1.0'
    assert_includes version_list, '0.2.0', 'Version list should contain 0.2.0'
  end

  def test_search_for_plugin_that_does_not_exist
    results = @installer.search('inspec-test-fixture-nonesuch', exact: true)
    assert_empty results
  end

  def test_search_for_plugin_by_wildard
    results = @installer.search('inspec-test-')
    assert_kind_of Hash, results, 'Results from searching should be a Hash'
    assert results.key?('inspec-test-fixture'), 'Search results should have a key for at least one plugin'
    version_list = results['inspec-test-fixture']
    assert_includes version_list, '0.1.0', 'Version list should contain 0.1.0'
    assert_includes version_list, '0.2.0', 'Version list should contain 0.2.0'
  end

  def test_search_omits_inspec_gem_on_the_reject_list
    results = @installer.search('inspec-')
    assert results.key?('inspec-test-fixture')

    # Here, 'inspec-core', 'inspec-multi-server'
    # are the names of real rubygems.  They are not InSpec/Train plugins, though,
    # and installing them would be a jam-up.
    # This is configured in 'etc/plugin_filters.json'.
    [
      'inspec-core',
      'inspec-multi-server',
    ].each do |plugin_name|
      refute results.key(plugin_name)
    end
  end

  def test_search_omits_train_gem_on_the_reject_list
    results = @installer.search('train-')
    assert results.key?('train-test-fixture')

    # Here, train-tax-calculator'
    # is the name of a real rubygem.  It is not a InSpec/Train plugin, though,
    # and installing it would be a jam-up.
    # This is configured in 'etc/plugin_filters.json'.
    [
      'train-tax-calculator'
    ].each do |plugin_name|
      refute results.key(plugin_name)
    end
  end
end

