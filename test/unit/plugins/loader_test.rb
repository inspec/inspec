# Unit tests for Inspec::PluginLoader and Registry

require 'minitest/autorun'
require 'minitest/spec'
require_relative '../../../lib/inspec/plugins'

describe Inspec::PluginLoader do

  let(:repo_path) { File.expand_path(File.join( __FILE__, '..', '..', '..', '..')) }
  let(:mock_path) { File.join(repo_path, 'test', 'unit', 'mock') }
  let(:config_dir_path) { File.join(mock_path, 'config_dirs') }
  let(:bundled_plugins) { [ :artifact, :compliance, :habitat, :init, :supermarket ] }

  before { Inspec::PluginRegistry.instance.__reset }

  orig_home = Dir.home
  after { ENV['HOME'] = orig_home }
  after { ENV['INSPEC_CONFIG_DIR'] = nil }

  it "should not load anything automatically" do
    reg = Inspec::PluginRegistry.instance
    loader = Inspec::PluginLoader.new
    reg.loaded_count.must_equal 0
  end

  it "should detect the built-ins" do
    reg = Inspec::PluginRegistry.instance
    loader = Inspec::PluginLoader.new
    bundled_plugins.each do |bundled_plugin_name|
      reg.plugin_names.must_include bundled_plugin_name
    end
  end

  it "should omit the built-ins when told to" do
    reg = Inspec::PluginRegistry.instance
    loader = Inspec::PluginLoader.new(omit_bundles: true)
    bundled_plugins.each do |bundled_plugin_name|
      refute reg.plugin_names.include? bundled_plugin_name
    end
  end

  it "should recognize plugins declared in the default location" do
    ENV['HOME'] = File.join(config_dir_path, 'fakehome')
    reg = Inspec::PluginRegistry.instance
    loader = Inspec::PluginLoader.new
    assert reg.known_plugin?(:'inspec-test-home-marker')
  end

  it "should behave well when no plugin.json file is present" do
    ENV['INSPEC_CONFIG_DIR'] = File.join(config_dir_path, 'empty')
    reg = Inspec::PluginRegistry.instance
    loader = Inspec::PluginLoader.new
    assert reg.known_plugin?(:init)
  end

  it "should throw an exception when plugins.json is corrupt" do
    ENV['INSPEC_CONFIG_DIR'] = File.join(config_dir_path, 'corrupt')
    assert_raises(Inspec::PluginException::ConfigError) { Inspec::PluginLoader.new }
  end

  it "should throw an exception when plugins.json is a bad version" do
    ENV['INSPEC_CONFIG_DIR'] = File.join(config_dir_path, 'bad_plugin_conf_version')
    assert_raises(Inspec::PluginException::ConfigError) { Inspec::PluginLoader.new }
  end

  # it "should list plugins declared with a custom plugin file" do
  # end

end