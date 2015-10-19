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
        .method(:logger).call
        .must_be_instance_of(Logger)
    end

    it 'can configure custom loggers' do
      l = rand
      plugin.new({ logger: l })
        .method(:logger).call
        .must_equal(l)
    end

    it 'provides a connection method' do
      proc { plugin.new.connection }.must_raise Train::ClientError
    end
  end

  describe 'registered with a name' do
    before do
      Train::Plugins.registry.clear
    end

    it 'doesnt have any plugins in the registry if none were configured' do
      Train::Plugins.registry.empty?.must_equal true
    end

    it 'is is added to the plugins registry' do
      plugin_name = rand
      Train::Plugins.registry.wont_include(plugin_name)

      plugin = Class.new(Train.plugin(1)) do
        name plugin_name
      end

      Train::Plugins.registry[plugin_name].must_equal(plugin)
    end
  end

  describe 'with options' do
    def train_class(opts = {})
      name = rand.to_s
      plugin = Class.new(Train.plugin(1)) do
        option name, opts
      end
      [name, plugin]
    end

    it 'exposes the parameters via api' do
      name, plugin = train_class
      plugin.default_options.keys.must_equal [name]
    end

    it 'exposes the parameters via api' do
      default = rand.to_s
      name, plugin = train_class({ default: default })
      plugin.default_options[name][:default].must_equal default
    end

    it 'option must be required' do
      name, plugin = train_class(required: true)
      plugin.default_options[name][:required].must_equal true
    end

    it 'default option must not be required' do
      name, plugin = train_class
      plugin.default_options[name][:required].must_equal nil
    end

    it 'can include options from another module' do
      nameA, pluginA = train_class
      b = Class.new(Train.plugin(1)) do
        include_options(pluginA)
      end
      b.default_options[nameA].wont_be_nil
    end

    it 'overwrites existing options when including' do
      old = rand.to_s
      nu = rand.to_s
      nameA, pluginA = train_class({ default: nu })
      b = Class.new(Train.plugin(1)) do
        option nameA, default: old
        include_options(pluginA)
      end
      b.default_options[nameA][:default].must_equal nu
    end
  end
end
