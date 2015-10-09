# encoding: utf-8
require 'helper'

describe Train::Plugins do
  it 'provides a method to create new v1 transport plugins' do
    Train.plugin(1).must_equal Train::Plugins::Transport
  end

  it 'fails when called with an unsupported plugin version' do
    proc {
      Train.plugin(2)
    }.must_raise Train::ClientError
  end

  it 'defaults to v1 plugins' do
    Train.plugin.must_equal Train::Plugins::Transport
  end

  it 'provides a registry of plugins' do
    Train::Plugins.registry.must_be_instance_of(Hash)
  end
end
