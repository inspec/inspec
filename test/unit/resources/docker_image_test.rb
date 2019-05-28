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

  describe '#parse_components_from_image' do
    let(:resource) { load_resource('docker_image', 'alpine') }
    let(:parsed)   { resource.send(:parse_components_from_image, image_string) }

    describe 'a nil image string' do
      let(:image_string) { nil }

      it 'returns an empty hash' do
        parsed.must_equal({})
      end
    end

    describe 'an image string containing a simple repo' do
      let(:image_string) { 'chef/inspec' }

      it 'returns correct data' do
        parsed[:repo].must_equal 'chef/inspec'
        parsed[:tag].must_be_nil
      end
    end

    describe 'parses an image string containing a repo with a port number' do
      let(:image_string) { 'localhost:5000/chef/inspec' }

      it 'returns correct data' do
        parsed[:repo].must_equal 'localhost:5000/chef/inspec'
        parsed[:tag].must_be_nil
      end
    end

    describe 'parses an image string containing a repo with a tag' do
      let(:image_string) { 'chef/inspec:1.46.3' }

      it 'returns correct data' do
        parsed[:repo].must_equal 'chef/inspec'
        parsed[:tag].must_equal '1.46.3'
      end
    end

    describe 'parses an image string containing a repo with a port number and a tag' do
      let(:image_string) { 'localhost:5000/chef/inspec:1.46.3' }

      it 'returns correct data' do
        parsed[:repo].must_equal 'localhost:5000/chef/inspec'
        parsed[:tag].must_equal '1.46.3'
      end
    end
  end
end
