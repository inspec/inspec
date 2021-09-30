module Inspec::Resources
  class Cassandra < Inspec.resource(1)
    name "cassandra"
    supports platform: "unix"
    supports platform: "windows"

    desc "The 'cassandra' resource is a helper for the 'cql_conf'"

    attr_reader :conf_path

    def initialize
      case inspec.os[:family]
      when "debian", "redhat", "linux", "suse"
        determine_conf_dir_and_path_in_linux
      when "windows"
        determine_conf_dir_and_path_in_windows
      end
    end

    def to_s
      "CassandraDB"
    end

    private

    def determine_conf_dir_and_path_in_linux
      cassandra_home = inspec.os_env("CASSANDRA_HOME").content

      if cassandra_home.nil? || cassandra_home.empty?
        warn "$CASSANDRA_HOME env value not set in the system"
        nil
      else
        conf_path = "#{cassandra_home}/cassandra.yaml"
        if !inspec.file(conf_path).exist?
          warn "No cassandra conf file found in CASSANDRA_HOME directory"
          nil
        else
          @conf_path = conf_path
        end
      end
    rescue => e
      fail_resource "Errors reading cassandra conf file: #{e}"
    end

    def determine_conf_dir_and_path_in_windows
      cassandra_home = inspec.os_env("CASSANDRA_HOME").content

      if cassandra_home.nil? || cassandra_home.empty?
        warn "CASSANDRA_HOME env value not set in the system"
        nil
      else
        conf_path = "#{cassandra_home}\\conf\\cassandra.yaml"
        if !inspec.file(conf_path).exist?
          warn "No cassandra conf file found in CASSANDRA_HOME\\conf"
          nil
        else
          @conf_path = conf_path
        end
      end
    rescue => e
      fail_resource "Errors reading cassandra conf file: #{e}"
    end
  end
end
