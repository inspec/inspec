# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::Passwd' do
  let(:resource) { load_resource('passwd') }

  it 'verify passwd parsing' do
    _(resource.usernames).must_equal %w{root www-data}
    _(resource.uids).must_equal %w{0 33}
  end

  it 'verify root passwd resource' do
    root = resource.uid(0)
    _(root.username).must_equal 'root'
    _(root.count).must_equal 1
  end

  it 'verify www-data resource' do
    www = resource.uid(33)
    _(www.username).must_equal 'www-data'
    _(www.count).must_equal 1
  end
end
