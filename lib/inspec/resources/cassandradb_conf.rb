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
        # skip_resource marks the resource as skipped; the explicit return
        # prevents super(@conf_path) from running with a nil path.
        # (No return value — void context; return is control-flow only.)
        skip_resource "Cassandra db conf path is not set"
        return
      end

      super(@conf_path)
    end

    # if system unables to determine the cassandra conf path the @conf_path can be nil so in that case sending "" string as resource_id
    def resource_id
      @conf_path || "cassandradb_conf"
    end

    private

    def parse(content)
      # safe_load prevents arbitrary Ruby object deserialization (RCE risk).
      YAML.safe_load(content)
    rescue StandardError => e
      raise Inspec::Exceptions::ResourceFailed, "Unable to parse `cassandra.yaml` file: #{e.message}"
    end

    def resource_base_name
      "Cassandra Configuration"
    end

  end
end
