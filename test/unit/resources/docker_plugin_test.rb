require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::DockerContainer' do
  describe 'docker_plugin' do
    it 'check plugin parsing for docker4x/cloudstor' do
      resource = load_resource('docker_plugin', 'docker4x/cloudstor')
      _(resource.id).must_equal '771d3ee7c7ea'
      _(resource.version).must_equal '18.03.1-ce-aws1'
      _(resource.enabled?).must_equal false
      _(resource.exist?).must_equal true
    end

    it 'check plugin parsing for store/weaveworks/net-plugin' do
      resource = load_resource('docker_plugin', 'store/weaveworks/net-plugin')
      _(resource.id).must_equal '6ea8176de74b'
      _(resource.version).must_equal '2.3.0'
      _(resource.enabled?).must_equal true
      _(resource.exist?).must_equal true
    end

    it 'check plugin parsing when there are no plugins' do
      resource = load_resource('docker_plugin')
      assert_nil resource.id
      assert_nil resource.version
      assert_nil resource.id
      assert_nil resource.enabled?
      _(resource.exist?).must_equal false
    end

    it 'prints as a docker resource' do
      resource = load_resource('docker_plugin', 'store/weaveworks/net-plugin')
      resource.to_s.must_equal 'Docker plugin store/weaveworks/net-plugin'
    end
  end
end
