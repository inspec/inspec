# encoding: utf-8
# author: Rony Xavier, rx294@nyu.edu
# author: Aaron Lippold, lippold@gmail.com

require 'utils/filter'
require 'hashie/mash'
require 'resources/package'

module Inspec::Resources
  class ElasticsearchNodeFilter
    filter = FilterTable.create
    filter.add_accessor(:where)
          .add_accessor(:entries)
          .add(:cluster,                field: 'cluster')
          .add(:name,                   field: 'name')
          .add(:transport_address,      field: 'transport_address')
          .add(:host,                   field: 'host')
          .add(:ip,                     field: 'ip')
          .add(:version,                field: 'version')
          .add(:build_hash,             field: 'build_hash')
          .add(:total_indexing_buffer,  field: 'total_indexing_buffer')
          .add(:roles,                  field: 'roles')
          .add(:settings,               field: 'settings')
          .add(:os,                     field: 'os')
          .add(:process,                field: 'process')
          .add(:jvm,                    field: 'jvm')
          .add(:transport,              field: 'transport')
          .add(:http,                   field: 'http')
          .add(:plugins,                field: 'plugins')
          .add(:plugin_list,            field: 'plugin_list')
          .add(:modules,                field: 'modules')
          .add(:module_list,            field: 'module_list')
          .add(:node_id,                field: 'node_id')
          .add(:ingest,                 field: 'ingest')
          .add(:exists?) { |x| !x.entries.empty? }
          .add(:count) { |t, _|
            t.entries.length
          }

    filter.connect(self, :nodes)

    attr_reader :nodes
    def initialize(nodes)
      @nodes = nodes
    end
  end

  class Elasticsearch < Inspec.resource(1)
    name 'elasticsearch'
    desc "Use the Elasticsearch InSpec audit resource to test the Elasticsearch
    configuration settings. The data is extract from the live elastic search
    cluster using the curl command `curl localhost:9200/_nodes/`. The resource
    makes uses of FilterTable and its functionality can be used "

    example "
      describe elasticsearch.nodes do
        it { should exist }
      end
      describe elasticsearch.nodes do
        its('name') { should include 'my_node' }
      end
      describe elasticsearch.nodes do
          its('name') { should_not include 'node_name' }
      end
      elasticsearch.nodes.os.each do |nodeos|
      	describe nodeos do
      		its('name'){ should_not cmp 'MacOS' }
      	end
      end
      elasticsearch.nodes.version.each do |node_version|
      	describe node_version do
      		it{ should be > '1.2.0' }
      	end
      end
      elasticsearch.nodes.where{os.name == 'Linux' }.settings.each do |node_settings|
        describe node_settings do
          its('path.conf') {should cmp '/etc/elasticsearch'}
        end
      end
		  elasticsearch.nodes.where{name == 'package-centos-72' }.settings.each do |node_settings|
        describe node_settings do
          its('path.conf') {should cmp '/etc/elasticsearch'}
        end
      end
        "

    def initialize(url = 'http://localhost:9200/_nodes/')
      return skip_resource 'Package `curl` not avaiable on the host' unless inspec.package('curl').installed?
      command = inspec.command("curl #{url}")
      if command.stderr =~ /Failed to connect/
        return skip_resource 'Connection refused please check ip and port provided'
      end
      @content = JSON.parse(command.stdout)
      return skip_resource 'Invalid node provided' unless !@content['_nodes']['successful'].zero?
      @nodes = []
      parse_cluster
    end

    def nodes
      ElasticsearchNodeFilter.new(@nodes)
    end

    def parse_cluster
      @content['nodes'].each do |node_id, node_data|
        # resolve Hashie Mash Conflicts
        node_data.delete('thread_pool')
        node_data['settings']['http']['type']['default_http_type'] = node_data['settings']['http']['type'].delete('default')
        node_data['settings']['transport']['type']['default_transport_type'] = node_data['settings']['transport']['type'].delete('default')
        node_data['settings']['default_path'] = node_data['settings'].delete('default')
        node = Hashie::Mash.new(node_data)
        node.node_id = node_id
        node.plugin_list = plugin_list(node)
        node.module_list = module_list(node)
        node.cluster = node.settings.cluster.name
        @nodes.push(node)
      end
    rescue JSON::ParserError => _e
      return Hashie::Mash.new({})
    end

    def plugin_list(node)
      plugins_list = []
      node.plugins.each do |plugins|
        plugins_list.push(plugins.name)
      end
      plugins_list
    end

    def module_list(node)
      module_list = []
      node.modules.each do |modules|
        module_list.push(modules.name)
      end
      module_list
    end

    def to_s
      'Elasticsearch ClusterInfo'
    end
  end
end
