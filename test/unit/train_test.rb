# encoding: utf-8
#
# Author:: Dominik Richter (<dominik.richter@gmail.com>)
require 'helper'

describe Train do
  describe '#create' do
    before do
      Train::Plugins.registry.clear
    end

    it 'raises an error if the plugin isnt found' do
      proc { Train.create('missing') }.must_raise Train::UserError
    end

    it 'load a plugin if it isnt in the registry yet' do
      Kernel.stub :require, true do
        ex = Class.new(Train.plugin 1) { name 'existing' }
        train = Train.create('existing')
        train.class.must_equal ex
      end
    end
  end
end
