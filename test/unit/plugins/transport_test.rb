# encoding: utf-8
require 'helper'

describe 'v1 Transport Plugin' do
  describe 'empty v1 transport plugin' do
    let(:plugin) { Class.new(Train.plugin(1)) }

    it 'initializes an empty configuration' do
      plugin.new.options.must_equal({})
    end

    it 'saves the provided configuration' do
      conf = { a: rand }
      plugin.new(conf).options.must_equal(conf)
    end

    it 'saves the provided configuration' do
      conf = { a: rand }
      plugin.new(conf).options.must_equal(conf)
    end

    it 'provides a default logger' do
      conf = { a: rand }
      plugin.new(conf)
        .method(:log).call
        .must_be_instance_of(Logger)
    end

    it 'can configure custom loggers' do
      l = rand
      plugin.new({ logger: l })
        .method(:log).call
        .must_equal(l)
    end

    it 'provides a connection method' do
      proc { plugin.new.connection }.must_raise Train::ClientError
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
