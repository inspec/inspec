require 'helper'

describe 'Vulcano::Plugins::Backend' do
  before do
    @backend = Vulcano::Plugins::Backend
    @child = Class.new(@backend)
  end

  it 'provides a name method for registering' do
    @child.must_respond_to :name
  end

  describe 'when registering a plugin' do
    before do
      @child.name 'test'
      @reg = Vulcano::Backend.registry
    end

    after do
      @reg.delete('test')
    end

    it 'must have the backend registered' do
      @reg.keys.must_include 'test'
      @reg['test'].must_equal @child
    end

    it 'must raise an error if file is not implemented' do
      t = @reg['test'].new
      proc { t.run_command }.must_raise NotImplementedError
    end

    it 'must raise an error if run_command is not implemented' do
      t = @reg['test'].new
      proc { t.file }.must_raise NotImplementedError
    end

    it 'must raise an error if os is not implemented' do
      t = @reg['test'].new
      proc { t.os }.must_raise NotImplementedError
    end
  end

end
