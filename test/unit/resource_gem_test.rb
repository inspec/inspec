# encoding: utf-8

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::Passwd' do
  describe 'gem' do
    let(:resource) { loadResource('gem', 'rubocop') }

    it 'verify gem package detail parsing' do
      pkg = { name: 'rubocop', version: '0.33.0', type: 'gem' }
      _(resource.installed?).must_equal true
      _(resource.info).must_equal pkg
    end

  end
end
