
require 'inspec/utils/filter'
require 'hashie/mash'
require 'inspec/resources/package'

module Inspec::Resources
  class Elasticsearch < Inspec.resource(1)
    name 'elasticsearch'
    supports platform: 'unix'
    desc "Use the Elasticsearch InSpec audit resource to test the status of nodes in
      an Elasticsearch cluster."

    example <<~EXAMPLE
      describe elasticsearch('http://eshost.mycompany.biz:9200/', username: 'elastic', password: 'changeme', ssl_verify: false) do
        its('node_count') { should >= 3 }
      end

      describe elasticsearch do
        its('node_name') { should include 'node1' }
        its('os') { should_not include 'MacOS' }
        its('version') { should cmp > 1.2.0 }
      end
    EXAMPLE

    filter = FilterTable.create
    filter.register_custom_matcher(:exists?) { |x| !x.entries.empty? }
    filter.register_column(:cluster_name,          field: 'cluster_name')
          .register_column(:node_name,             field: 'name')
          .register_column(:transport_address,     field: 'transport_address')
          .register_column(:host,                  field: 'host')
          .register_column(:ip,                    field: 'ip')
          .register_column(:version,               field: 'version')
          .register_column(:build_hash,            field: 'build_hash')
          .register_column(:total_indexing_buffer, field: 'total_indexing_buffer')
          .register_column(:roles,                 field: 'roles')
          .register_column(:settings,              field: 'settings')
          .register_column(:os,                    field: 'os')
          .register_column(:process,               field: 'process')
          .register_column(:jvm,                   field: 'jvm')
          .register_column(:transport,             field: 'transport')
          .register_column(:http,                  field: 'http')
          .register_column(:plugins,               field: 'plugins')
          .register_column(:plugin_list,           field: 'plugin_list')
          .register_column(:modules,               field: 'modules')
          .register_column(:module_list,           field: 'module_list')
          .register_column(:node_id,               field: 'node_id')
          .register_column(:ingest,                field: 'ingest')
          .register_custom_property(:node_count) { |t, _|
            t.entries.length
          }

    filter.install_filter_methods_on_resource(self, :nodes)

    attr_reader :nodes, :url

    def initialize(opts = {})
      return skip_resource 'Package `curl` not avaiable on the host' unless inspec.command('curl').exist?

      @url = opts.fetch(:url, 'http://localhost:9200')

      username   = opts.fetch(:username, nil)
      password   = opts.fetch(:password, nil)
      ssl_verify = opts.fetch(:ssl_verify, true)

      cmd = inspec.command(curl_command_string(username, password, ssl_verify))

      # after implementation of PR #2235, this begin..rescue won't be necessary.
      # The checks in verify_curl_success! can raise their own skip message exception.
      begin
        verify_curl_success!(cmd)
      rescue => e
        return skip_resource e.message
      end

      begin
        content = JSON.parse(cmd.stdout)
        # after implementation of PR #2235, this can be broken out of the begin..rescue
        # clause. The checks in verify_json_payload! can raise their own skip message exception.
        verify_json_payload!(content)
      rescue JSON::ParserError => e
        return skip_resource "Couldn't parse the Elasticsearch response: #{e.message}"
      rescue => e
        return skip_resource e.message
      end

      @nodes = parse_cluster(content)
    end

    def to_s
      "Elasticsearch Cluster #{url}"
    end

    private

    def parse_cluster(content)
      return [] unless content['nodes']

      nodes = []

      content['nodes'].each do |node_id, node_data|
        node_data = fix_mash_key_collision(node_data)

        node = Hashie::Mash.new(node_data)
        node.node_id = node_id
        node.plugin_list = node.plugins.map(&:name)
        node.module_list = node.modules.map(&:name)
        node.cluster_name = node.settings.cluster.name
        nodes << node
      end

      nodes
    end

    #
    # Hashie::Mash will throw warnings if the Mash contains a key that is the same as a built-in
    # method on a Hashie::Mash instance. This is a crude way of avoiding those warnings without
    # hard-coding a bunch of key renames.
    #
    # Any key that is in conflict will be renamed "es_ORIGINALKEY"
    #
    def fix_mash_key_collision(data)
      test_mash = Hashie::Mash.new

      new_data = {}
      data.each do |key, value|
        new_key = test_mash.respond_to?(key.to_sym) ? "es_#{key}" : key
        new_value = value.is_a?(Hash) ? fix_mash_key_collision(value) : value

        new_data[new_key] = new_value
      end

      new_data
    end

    def curl_command_string(username, password, ssl_verify)
      cmd_string = ['curl']
      cmd_string << '-k' unless ssl_verify
      cmd_string << "-H 'Content-Type: application/json'"
      cmd_string << " -u #{username}:#{password}" unless username.nil? || password.nil?
      cmd_string << URI.join(url, '_nodes')

      cmd_string.join(' ')
    end

    def verify_curl_success!(cmd)
      # the following lines captures known possible curl command errors and provides compact skip resource messeges
      if cmd.stderr =~ /Failed to connect/
        raise "Connection refused - please check the URL #{url} for accuracy"
      end

      if cmd.stderr =~ /Peer's Certificate issuer is not recognized/
        raise 'Connection refused - peer certificate issuer is not recognized'
      end

      raise "Error fetching Elastcsearch data from curl #{url}: #{cmd.stderr}" unless cmd.exit_status.zero?
    end

    def verify_json_payload!(content)
      unless content['error'].nil?
        raise "#{content['error']['type']}: #{content['error']['reason']}"
      end

      raise 'No successful nodes available in cluster' if content['_nodes']['successful'].zero?
    end
  end
end
