# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::Gem' do
  it 'verify gem package detail parsing' do
    resource = load_resource('gem', 'rubocop')
    pkg = {
      name: 'rubocop',
      version: '0.33.0',
      type: 'gem',
      installed: true,
    }
    _(resource.installed?).must_equal true
    _(resource.info).must_equal pkg
  end
end
