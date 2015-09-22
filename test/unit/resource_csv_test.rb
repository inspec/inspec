# encoding: utf-8

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::CSV' do
  describe 'cars' do
  let(:resource) { load_resource('csv', 'example.csv') }


    it 'verify csv parsing' do
      _(resource.params).wont_equal nil
      _(resource.send('1.addressable')).must_equal 'astrolabe'
      _(resource.send('addressable')).must_equal %w{ast astrolabe berkshelf}
    end
  end
end
