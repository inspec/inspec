# encoding: utf-8

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::Passwd' do
  describe 'package' do

    # TODO: set operating system to arch
    # let(:resource) { loadResource('package', 'curl') }

    # arch linux
    # it 'verify package parsing' do
    #   pkg = { name: 'curl', installed: true, version: '7.37.0-1', type: 'pacman' }
    #   _(resource.installed?).must_equal true
    #   _(resource.info).must_equal pkg
    # end

    # ubuntu
    # it 'verify package parsing' do
    #   pkg = { name: 'curl', installed: true, version: '7.35.0-1ubuntu2', type: 'deb' }
    #   _(resource.installed?).must_equal true
    #   _(resource.info).must_equal pkg
    # end

    # centos
    #
    # it 'verify package parsing' do
    #   pkg = { name: 'curl', installed: true, version: '7.29.0', type: 'rpm' }
    #   _(resource.installed?).must_equal true
    #   _(resource.info).must_equal pkg
    # end

  end
end
