# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'helper'

describe 'Vulcano::Plugins::Backend' do
  let(:cls) { Vulcano::Plugins::Backend }
  let(:child) { Class.new(cls) }

  it 'provides a name method for registering' do
    child.must_respond_to :name
  end

  describe 'when registering a plugin' do
    let(:registry) { Vulcano::Backend.registry }

    before do
      child.name 'test'
    end

    after do
      registry.delete('test')
    end

    it 'must have the backend registered' do
      registry.keys.must_include 'test'
      registry['test'].must_equal child
    end

    it 'must raise an error if file is not implemented' do
      t = registry['test'].new
      proc { t.run_command }.must_raise NotImplementedError
    end

    it 'must raise an error if run_command is not implemented' do
      t = registry['test'].new
      proc { t.file }.must_raise NotImplementedError
    end

    it 'must raise an error if os is not implemented' do
      t = registry['test'].new
      proc { t.os }.must_raise NotImplementedError
    end
  end

end
