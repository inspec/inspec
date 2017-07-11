# encoding: utf-8
# author: Rony Xavier, rx294@nyu.edu

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::Elasticsearch' do

  describe 'Elasticsearch Methods' do
    resource = load_resource('elasticsearch')
    it 'Verify Elasticsearch nodes exist' do
      _(resource.nodes.exists?).must_equal true
    end
    it 'Verify Elasticsearch node version' do
      _(resource.nodes.version).must_include '5.4.1'
    end
    it 'Verify elasticsearch node mlockall state' do
      resource.nodes.process.each do |node_process|
        _(node_process.mlockall).must_equal false
      end
    end
    it 'Verify elasticsearch node count' do
      _(resource.nodes.count).must_equal 3
    end
    it 'Verify elasticsearch conf path' do
      resource.nodes.settings.each do |node_settings|
        _(node_settings.path.conf).must_equal '/etc/elasticsearch'
      end
    end
    it 'Verify elasticsearch node roles' do
      resource.nodes.roles.each do |node_roles|
        _(node_roles).must_include 'master'
      end
    end
    resource_with_url = load_resource('elasticsearch','http://localhost:9200/_nodes/')
    it 'Verify elasticsearch with custom url' do
      resource.nodes.roles.each do |node_roles|
        _(node_roles).must_include 'master'
      end
    end
  end
end
