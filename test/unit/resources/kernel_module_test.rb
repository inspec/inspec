# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::KernelModule' do
  it 'verify kernel_module parsing' do
    resource = load_resource('kernel_module', 'bridge')
    _(resource.loaded?).must_equal true
  end

  it 'verify kernel_module parsing' do
    resource = load_resource('kernel_module', 'bridges')
    _(resource.loaded?).must_equal false
  end

  it 'verify kernel_module parsing' do
    resource = load_resource('kernel_module', 'dhcp')
    _(resource.loaded?).must_equal false
  end
end
