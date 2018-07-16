# Unit tests for Inspec::PluginLoader and Registry

require 'minitest/autorun'
require 'minitest/test'
require_relative '../../../lib/inspec/plugin'

require 'byebug'

class PluginLoaderTests < MiniTest::Test

  @@orig_home = Dir.home

  def reset_globals
    # These are effectively globals
    Inspec::Plugin::Registry.instance.__reset
    ENV['HOME'] = @@orig_home
    ENV['INSPEC_CONFIG_DIR'] = nil
  end

  def setup
    reset_globals

    repo_path = File.expand_path(File.join( __FILE__, '..', '..', '..', '..'))
    mock_path = File.join(repo_path, 'test', 'unit', 'mock')

    @config_dir_path = File.join(mock_path, 'config_dirs')
    @bundled_plugins = [ :artifact, :compliance, :habitat, :init, :supermarket ]
  end

  def teardown
    reset_globals
  end

  #====================================================================#
  #            basic constructor usage and bundle detection            #
  #====================================================================#

  def test_constructor_should_not_load_anything_automatically
    reg = Inspec::Plugin::Registry.instance
    loader = Inspec::Plugin::Loader.new
    assert_equal 0, reg.loaded_count, "\nRegistry load count"
  end

  def test_constructor_should_detect_bundled_plugins
    reg = Inspec::Plugin::Registry.instance
    loader = Inspec::Plugin::Loader.new
    @bundled_plugins.each do |bundled_plugin_name|
      assert reg.known_plugin?(bundled_plugin_name), "\n#{bundled_plugin_name} should be detected as a bundled plugin"
    end
  end

  def test_constructor_should_skip_bundles_when_option_is_set
    reg = Inspec::Plugin::Registry.instance
    loader = Inspec::Plugin::Loader.new(omit_bundles: true)
    @bundled_plugins.each do |bundled_plugin_name|
      refute reg.known_plugin?(bundled_plugin_name), "\n#{bundled_plugin_name} should not be detected when omit_bundles is set"
    end
  end

  def test_constructor_when_using_home_dir_detects_declared_plugins
    ENV['HOME'] = File.join(@config_dir_path, 'fakehome')
    reg = Inspec::Plugin::Registry.instance
    loader = Inspec::Plugin::Loader.new
    assert reg.known_plugin?(:'inspec-test-home-marker'), "\ninspec-test-home-marker should be detected as a plugin"
  end

  #====================================================================#
  #                 unusual plugin.json situations                     #
  #====================================================================#

  def test_constructor_when_the_plugin_config_is_absent_it_detects_bundled_plugins
    ENV['INSPEC_CONFIG_DIR'] = File.join(@config_dir_path, 'empty')
    reg = Inspec::Plugin::Registry.instance
    loader = Inspec::Plugin::Loader.new
    @bundled_plugins.each do |bundled_plugin_name|
      assert reg.known_plugin?(bundled_plugin_name), "\n#{bundled_plugin_name} should be detected as a bundled plugin"
    end
  end

  def test_constuctor_when_the_plugin_config_is_corrupt_it_throws_an_exception
    ENV['INSPEC_CONFIG_DIR'] = File.join(@config_dir_path, 'corrupt')
    assert_raises(Inspec::Plugin::ConfigError) { Inspec::Plugin::Loader.new }
  end

  def test_constuctor_when_the_plugin_config_is_a_bad_version_it_throws_an_exception
    ENV['INSPEC_CONFIG_DIR'] = File.join(@config_dir_path, 'bad_plugin_conf_version')
    assert_raises(Inspec::Plugin::ConfigError) { Inspec::Plugin::Loader.new }
  end

  #====================================================================#
  #                        basic loading                               #
  #====================================================================#

  def test_load_no_plugins_should_load_no_plugins
    reg = Inspec::Plugin::Registry.instance
    loader = Inspec::Plugin::Loader.new(omit_bundles: true)
    loader.load_all
    assert_equal 0, reg.loaded_count, "\nRegistry load count"
  end

  def test_load_only_bundled_plugins_should_load_bundled_plugins
    reg = Inspec::Plugin::Registry.instance
    loader = Inspec::Plugin::Loader.new
    loader.load_all
    @bundled_plugins.each do |bundled_plugin_name|
      assert reg.loaded_plugin?(bundled_plugin_name), "\n#{bundled_plugin_name} should be loaded"
      assert_equal :cli, reg[bundled_plugin_name].plugin_type, "annotate plugin type of bundled plugins"
      assert_equal 0, reg[bundled_plugin_name].api_generation, "annotate API generation of bundled plugins"
      assert_kind_of(Class, reg[bundled_plugin_name].class)
    end
    assert_equal @bundled_plugins.count, reg.loaded_count, "\nRegistry load count"
  end

  #def test_load_

  # load core plugins (or assert that we can interrogate the v1 registr(ies))
  # output error but not raise when bad entry point

  # it should handle a gem conflict correctly
  #   # it "should list plugins declared with a custom plugin file" do
  #   # end

  #   # it should be able to load a config-specified v2 plugin

  #   # it should be able to load a config-specified v1 plugin


end