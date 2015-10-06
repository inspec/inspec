# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::KernelParameter' do
  let(:resource) { load_resource('kernel_parameter', 'net.ipv4.conf.all.forwarding') }

  it 'verify kernel_parameter parsing' do
    _(resource.value).must_equal 1
  end
end
