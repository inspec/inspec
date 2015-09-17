# encoding: utf-8

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::Passwd' do
  describe 'oneget' do
    let(:resource) { loadResource('oneget', 'Mozilla Firefox') }

    it 'verify oneget package detail parsing' do
      pkg = {
        name: 'Mozilla Firefox 40.0.3 (x86 en-US)',
        version: '40.0.3',
        type: 'oneget',
        installed: true,
      }
      _(resource.installed?).must_equal true
      _(resource.info).must_equal pkg
    end
  end
end
