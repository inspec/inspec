# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::Npm' do
  it 'verify npm package detail parsing' do
    resource = load_resource('npm', 'bower')
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
