# encoding: utf-8

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::KernelParameter' do
  describe 'kernel_parameter' do
    let(:resource) { loadResource('kernel_parameter', 'net.ipv4.conf.all.forwarding') }

    it 'verify kernel_parameter parsing' do
      _(resource.value).must_equal 1
    end

  end
end
