require "inspec/resources/json"
require "inspec/resources/cassandra"

module Inspec::Resources
  class CassandradbConf < JsonConfig
    name "cassandradb_conf"
    supports platform: "unix"
    supports platform: "windows"
    desc "Use the cql_conf InSpec audit resource to test the contents of the configuration file for Cassandra DB"
    example <<~EXAMPLE
      describe cassandradb_conf do
        its('listen_address') { should eq '0.0.0.0' }
      end
    EXAMPLE

    def initialize(conf_path = nil)
      cassandra = nil
      if conf_path.nil?
        cassandra = inspec.cassandra
        @conf_path = cassandra.conf_path
      else
        @conf_path = conf_path
      end

      if cassandra && cassandra.resource_failed?
        raise cassandra.resource_exception_message
      elsif @conf_path.nil?
        return skip_resource "Cassandra db conf path is not set"
      end

      super(@conf_path)
    end

    private

    def parse(content)
      YAML.load(content)
    rescue => e
      raise Inspec::Exceptions::ResourceFailed, "Unable to parse `cassandra.yaml` file: #{e.message}"
    end

    def resource_base_name
      "Cassandra Configuration"
    end

  end
end
