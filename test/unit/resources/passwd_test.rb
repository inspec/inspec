# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::Passwd' do
  it 'verify passwd parsing' do
    resource = load_resource('passwd')
    _(resource.usernames).must_equal %w{root www-data}
    _(resource.uids).must_equal %w{0 33}

    # verify root passwd resource
    root = resource.uid(0)
    _(root.username).must_equal 'root'
    _(root.count).must_equal 1

    # verify www-data resource
    www = resource.uid(33)
    _(www.username).must_equal 'www-data'
    _(www.count).must_equal 1
  end
end
