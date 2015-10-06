# encoding: utf-8

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::Group' do

  # ubuntu 14.04
  it 'verify group on ubuntu' do
    resource = MockLoader.new(:ubuntu1404).load_resource('group', 'root')
    _(resource.exists?).must_equal true
    _(resource.gid).must_equal 0
    _(resource.has_gid?(0)).must_equal true
  end

  # mac
  it 'verify group on mac' do
    resource = MockLoader.new(:osx104).load_resource('group', 'root')
    _(resource.exists?).must_equal true
    _(resource.gid).must_equal 0
    _(resource.has_gid?(0)).must_equal true
  end
end
