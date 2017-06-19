# encoding: utf-8
# copyright: 2017
# author: Rony Xavier, rx294@nyu.edu
# author: Aaron Lippold, lippold@gmail.com
# license: All rights reserved

require 'utils/filter'

module Inspec::Resources
  class Elasticsearch < Inspec.resource(1)
    name 'elasticsearch'
    desc 'See Description below'
    # Use the Elasticsearch InSpec audit resource to test the Elasticsearch
    # configuration settings. The data is extract from the live elastic search
    # cluster using the curl command `curl localhost:9200/_nodes/`. The resource
    # makes uses of FilterTable and its functionality can be used

    example 'See example below'
    # elasticsearch.where{ cluster_name == 'elasticsearch' }.version.each do |node_version|
    #   describe node_version do
    #     it {should eq '5.4.1'}
    #   end
    # end

    attr_reader :params, :content

    def initialize(es_ip = 'localhost', es_port = 9200)
      @es_ip   = es_ip
      @es_port = es_port

      # skip if connection refused
      @content = inspec.command("curl http://#{es_ip}:#{es_port}/_nodes/").stdout

      if content =~ /Connection refused/
        return skip_resource 'Connection refused please check ip and port provided'
      end

      # skip if node provided is not found
      @content = JSON.parse(@content)
      if content['_nodes']['successful'].zero?
        return skip_resource 'Invalid node provided'
      end

      @params = parse_cluster(@content)
    end

    param_keys = %w{cluster_name node_id node_name host ip version build_hash total_indexing_b roles conf_path data_path log_path home_path client_type http_type transport_type os process mlockall transport http pidfile transport_addres pid jvm_version vm_name vm_version vm_vendor start_time_in_mi mem gc_collectors memory_pools input_arguments module_list using_compressed_ordinary_object_pointers}
    filter = FilterTable.create
    filter.add_accessor(:where)
          .add_accessor(:entries)
    param_keys.each do |param|
      filter.add(param.to_sym, field: param)
    end

    filter.add(:node_count) { |t, _|
      t.entries.length
    }
    filter.connect(self, :params)

    def parse_cluster(content)
      content['nodes'].map do |node|
        params_hash = {}
        params_hash.merge!(parse_node_config(node))
        params_hash.merge!(parse_node_process(node[1]['process']))
        params_hash.merge!(parse_node_settings(node[1]['settings']))
        params_hash.merge!(parse_node_jvm(node[1]['jvm']))
        params_hash.merge!(parse_node_module_list(node[1]['modules']))
      end
    end

    def parse_node_config(node)
      {
        'cluster_name'          => content['cluster_name'],
        'node_id'               => node.first,
        'node_name'             => node[1]['name'],
        'host'                  => node[1]['host'],
        'ip'                    => node[1]['ip'],
        'version'               => node[1]['version'],
        'build_hash'            => node[1]['build_hash'],
        'total_indexing_buffer' => node[1]['total_indexing_buffer'],
        'roles'                 => node[1]['roles'],
        'os'                    => node[1]['os'],
        'transport'             => node[1]['transport'],
        'http'                  => node[1]['http'],
        'transport_address'     => { 'ip_addr' => node[1]['transport_address'].split(':')[0], 'port' => node[1]['transport_address'].split(':')[1] },
      }
    end

    def parse_node_process(node)
      {
        'process'               => node,
        'mlockall'              => node['mlockall'],
      }
    end

    def parse_node_settings(node)
      {
        'conf_path'             => node['path']['conf'],
        'data_path'             => node['path']['data'],
        'log_path'              => node['path']['logs'],
        'home_path'             => node['path']['home'],
        'client_type'           => node['client']['type'],
        'http_type'             => node['http']['type'],
        'transport_type'        => node['transport']['type'],
        'pidfile'               => node['pidfile'],
      }
    end

    def parse_node_jvm(node)
      {
        'pid'                   => node['pid'],
        'jvm_version'           => node['version'],
        'vm_name'               => node['vm_name'],
        'vm_version'            => node['vm_version'],
        'vm_vendor'             => node['vm_vendor'],
        'start_time_in_millis'  => node['start_time_in_millis'],
        'mem'                   => node['mem'],
        'gc_collectors'         => node['gc_collectors'],
        'memory_pools'          => node['memory_pools'],
        'input_arguments'       => node['input_arguments'],
        'using_compressed_ordinary_object_pointers' => node['using_compressed_ordinary_object_pointers'],

      }
    end

    def parse_node_module_list(node)
      modules_list = {}
      node.each do |mod|
        modules_list[mod['name']] = mod
      end
      {
        'module_list' => modules_list.keys,
      }
    end

    def to_s
      'Elasticsearch Environment'
    end
  end
end
