# encoding: utf-8

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::KernelModule' do
  describe 'kernel_module' do
    let(:resource) { loadResource('kernel_module', 'bridge') }

    it 'verify kernel_module parsing' do
      _(resource.loaded?).must_equal true
    end
  end

  describe 'kernel_module' do
    let(:resource) { loadResource('kernel_module', 'dhcp') }

    it 'verify kernel_module parsing' do
      _(resource.loaded?).must_equal false
    end
  end
end
