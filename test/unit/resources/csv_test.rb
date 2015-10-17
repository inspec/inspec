# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::CSV' do
  it 'verify csv parsing' do
    resource = load_resource('csv', 'example.csv')
    _(resource.params).wont_equal nil
    _(resource.send('1.addressable')).must_equal 'astrolabe'
    _(resource.send('addressable')).must_equal %w{ast astrolabe berkshelf}
  end
end
