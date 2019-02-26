require 'minitest/autorun'
require 'minitest/test'
require_relative '../../../../lib/inspec'

module PluginV2BackCompat
  class PluginV1TypeClassFetchers < MiniTest::Test

    # Note: we can't call klass.name, because that is redefined as a setter.

    # cli had a base class (which was really a registry), but no class fetcher
    # There was no Inspec.plugin(...)

    def test_get_plugin_v1_base_for_fetchers
      klass = Inspec.fetcher(1)
      assert_kind_of Class, klass
      assert Inspec::Plugins.const_defined? :Fetcher
      assert_equal Inspec::Plugins::Fetcher, klass
    end

    def test_get_plugin_v1_base_for_source_readers
      klass = Inspec.source_reader(1)
      assert_kind_of Class, klass
      assert Inspec::Plugins.const_defined? :SourceReader
      assert_equal Inspec::Plugins::SourceReader, klass
    end

  end
end