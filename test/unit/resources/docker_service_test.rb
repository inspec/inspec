
require 'helper'

describe 'Inspec::Resources::DockerService' do
  describe 'docker_service' do
    it 'check docker service parsing' do
      resource = load_resource('docker_service', 'service1')
      _(resource.id).must_equal '2ghswegspre1'
      _(resource.tag).must_equal '1.0'
      _(resource.image).must_equal 'foo/image:1.0'
      _(resource.repo).must_equal 'foo/image'
      _(resource.image_name).must_equal 'foo/image'
      _(resource.replicas).must_equal '3/3'
      _(resource.mode).must_equal 'replicated'
      _(resource.ports).must_equal '*:1234->1234/tcp'
    end

    it 'check docker service from id' do
      resource = load_resource('docker_service', id: '2ghswegspre1')
      _(resource.id).must_equal '2ghswegspre1'
      _(resource.tag).must_equal '1.0'
      _(resource.image).must_equal 'foo/image:1.0'
      _(resource.repo).must_equal 'foo/image'
      _(resource.image_name).must_equal 'foo/image'
      _(resource.replicas).must_equal '3/3'
      _(resource.mode).must_equal 'replicated'
      _(resource.ports).must_equal '*:1234->1234/tcp'
    end

    it 'check docker service from image' do
      resource = load_resource('docker_service', image: 'foo/image:1.0')
      _(resource.id).must_equal '2ghswegspre1'
      _(resource.tag).must_equal '1.0'
      _(resource.image).must_equal 'foo/image:1.0'
      _(resource.repo).must_equal 'foo/image'
      _(resource.image_name).must_equal 'foo/image'
      _(resource.replicas).must_equal '3/3'
      _(resource.mode).must_equal 'replicated'
      _(resource.ports).must_equal '*:1234->1234/tcp'
    end

    it 'prints as a docker_image resource' do
      resource = load_resource('docker_service', 'service1')
      resource.to_s.must_equal 'Docker Service service1'
    end
  end

  describe '#parse_components_from_image' do
    let(:resource) { load_resource('docker_service', 'service1') }
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
