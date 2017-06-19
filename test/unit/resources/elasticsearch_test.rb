# encoding: utf-8
# copyright: 2017
# author: Rony Xavier, rx294@nyu.edu
# license: All rights reserved

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::Elasticsearch' do
  describe 'elasticsearch' do
    it 'Verify Elasticsearch node version' do
      resource = load_resource('elasticsearch')
      _(resource.version).must_equal ["5.4.1"]
    end

      it 'Verify elasticsearch node mlockall state' do
        resource = load_resource('elasticsearch')
        _(resource.mlockall).must_equal [false]
      end

      it 'Verify elasticsearch node count' do
        resource = load_resource('elasticsearch')
        _(resource.node_count).must_equal 1
      end

      it 'Verify elasticsearch conf path' do
        resource = load_resource('elasticsearch')
        _(resource.conf_path).must_equal  ["/etc/elasticsearch"]
      end

      it 'Verify elasticsearch node roles' do
        resource = load_resource('elasticsearch')
        _(resource.roles).must_equal [["master", "data", "ingest"]]
      end
   end
end
