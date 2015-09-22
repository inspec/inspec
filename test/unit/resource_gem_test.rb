# encoding: utf-8

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::Passwd' do
  describe 'gem' do

    it 'verify gem package detail parsing' do
      pkg = {
        name: 'rubocop',
        version: '0.33.0',
        type: 'gem',
        installed: true,
      }
      _(resource.installed?).must_equal true
      _(resource.info).must_equal pkg
    end
  let(:resource) { load_resource('gem', 'rubocop') }

  end
end
