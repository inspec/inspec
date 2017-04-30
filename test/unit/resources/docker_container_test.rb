# encoding: utf-8
# author: Christoph Hartmann

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::DockerContainer' do
  describe 'docker_container' do
    it 'check container parsing for alpine' do
      resource = load_resource('docker_container', 'laughing_austin')
      _(resource.id).must_equal 'd94f854370d2b02912e8fc636502bc72b74fbd567a7eba3fc6a52045bb28904e'
      _(resource.image).must_equal 'alpine'
      _(resource.repo).must_equal 'alpine'
      _(resource.tag).must_equal nil
      _(resource.command).must_equal '/bin/sh'
      _(resource.ports).must_equal ''
    end

    it 'check container parsing for alpine' do
      resource = load_resource('docker_container', 'sleepy_khorana')
      _(resource.id).must_equal '3def9aa450f8bd772c3d5b07e27ec934e5f58575e955367a0aca2d93e0687536'
      _(resource.image).must_equal 'ubuntu:12.04'
      _(resource.repo).must_equal 'ubuntu'
      _(resource.tag).must_equal '12.04'
      _(resource.command).must_equal '/bin/bash'
      _(resource.ports).must_equal ''
    end

    it 'prints as a docker resource' do
      resource = load_resource('docker_container', 'laughing_austin')
      resource.to_s.must_equal 'Docker Container laughing_austin'
    end
  end
end
