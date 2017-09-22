# encoding: utf-8
# author: Matt Ray

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::Hotfix' do

  # ubuntu 14.04
  it 'fail hotfix on ubuntu' do
    resource = MockLoader.new(:ubuntu1404).load_resource('hotfix', 'KB4019215')
    _(resource.installed?).must_equal false
  end

  # windows
  it 'verify hotfix on windows' do
    resource = MockLoader.new(:windows).load_resource('hotfix', 'KB4019215')
    _(resource.installed?).must_equal true
  end
end
