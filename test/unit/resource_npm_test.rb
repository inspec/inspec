# encoding: utf-8

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::Passwd' do
  describe 'npm' do
    let(:resource) { loadResource('npm', 'bower') }

    it 'verify npm package detail parsing' do
      pkg = { name: 'bower', version: '1.4.1', type: 'npm'}
      _(resource.installed?).must_equal true
      _(resource.info).must_equal pkg
    end
  end
end
