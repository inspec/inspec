# encoding: utf-8
require 'helper'

describe 'v1 Transport Plugin' do
  describe 'empty v1 transport plugin' do
    let(:plugin) { Class.new(Train.plugin(1)) }

    it 'initializes an empty configuration' do
      plugin.new.config.must_equal({})
    end

    it 'saves the provided configuration' do
      conf = { a: rand }
      plugin.new(conf).config.must_equal(conf)
    end

    it 'saves the provided configuration' do
      conf = { a: rand }
      plugin.new(conf).config.must_equal(conf)
    end

    it 'provides a default logger' do
      conf = { a: rand }
      plugin.new(conf)
        .instance_variable_get(:@logger)
        .must_be_instance_of(Logger)
    end

    it 'can configure own loggers' do
      l = rand
      plugin.new({ logger: l })
        .instance_variable_get(:@logger)
        .must_equal(l)
    end
  end

  describe 'configure a named plugin' do
    before do
      Train::Plugins.registry.clear
    end

    it 'doesnt have any plugins in the registry if none were configured' do
      Train::Plugins.registry.empty?.must_equal true
    end

    it 'registers a plugin with a name' do
      plugin_name = rand
      Train::Plugins.registry.wont_include(plugin_name)

      plugin = Class.new(Train.plugin(1)) do
        name plugin_name
      end

      Train::Plugins.registry[plugin_name].must_equal(plugin)
    end
  end
end
