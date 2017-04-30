# encoding: utf-8
# author: Christoph Hartmann

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::DockerImage' do
  describe 'docker_image' do
    it 'check docker image parsing' do
      resource = load_resource('docker_image', 'alpine')
      _(resource.id).must_equal 'sha256:4a415e3663882fbc554ee830889c68a33b3585503892cc718a4698e91ef2a526'
      _(resource.tag).must_equal 'latest'
      _(resource.image).must_equal 'alpine:latest'
      _(resource.repo).must_equal 'alpine'
    end

    it 'prints as a docker_image resource' do
      resource = load_resource('docker_image', 'alpine')
      resource.to_s.must_equal 'Docker Image alpine:latest'
    end
  end
end
