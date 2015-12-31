# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'inspec/resource'

describe Inspec::Resources::File do
  let(:resource) { load_resource('mount', '/') }

  it 'parses the mount data properly' do
    resource.send(:device).must_equal('/dev/xvda1')
    resource.send(:type).must_equal('ext4')
    resource.send(:options).must_equal(['rw','discard'])
  end
end
