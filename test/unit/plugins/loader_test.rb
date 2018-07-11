# Unit tests for Inspec::PluginLoader and Registry

require 'minitest/autorun'
require 'minitest/spec'
require_relative '../../../lib/inspec/plugins'

describe Inspec::PluginLoader do
  it "should not load anything automatically" do
    reg = Inspec::PluginRegistry.instance
    reg.loaded_count.must_equal 0
  end

  # it "should detect the built-ins" do

  # end

  # it "should omit the built-ins when told to" do
  # end

  # it "should list plugins declared in the default location" do
  # end

  # it "should list plugins declared with a custom plugin file" do
  # end

end