# encoding: utf-8
# author: Thomas Cate

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::GrubConfig' do

  it 'verify kernel include' do
    resource = MockLoader.new(:centos6).load_resource('grub_conf')
    _(resource.kernel).must_be_kind_of Array
  end

  it 'verify initrd include' do
    resource = MockLoader.new(:centos6).load_resource('grub_conf')
    _(resource.initrd).must_be_kind_of String
  end

  it 'verify default' do
    resource = MockLoader.new(:centos6).load_resource('grub_conf')
    _(resource.default).must_equal '0'
  end

  it 'verify timeout' do
    resource = MockLoader.new(:centos6).load_resource('grub_conf')
    _(resource.timeout).must_equal '5'
  end

end
