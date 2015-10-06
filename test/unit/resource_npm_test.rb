# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::Passwd' do
  let(:resource) { load_resource('npm', 'bower') }

  it 'verify npm package detail parsing' do
    pkg = {
      name: 'bower',
      version: '1.4.1',
      type: 'npm',
      installed: true,
    }
    _(resource.installed?).must_equal true
    _(resource.info).must_equal pkg
  end
end
