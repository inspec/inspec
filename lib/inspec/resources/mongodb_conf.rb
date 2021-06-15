require "inspec/resources/json"
require "inspec/resources/mongodb"

module Inspec::Resources
  class MongodbConf < JsonConfig
    name "mongodb_conf"
    supports platform: "unix"
    supports platform: "windows"
    desc "Use the mongodb_conf InSpec audit resource to test the contents of the configuration file for MongoDB, typically located at `/etc/mongod.conf` or `C:\\Program Files\\MongoDB\\Server\\<version>\\bin\\mongod.cfg`, depending on the platform."
    example <<~EXAMPLE
      describe mongodb_conf do
        its(["storage", "dbPath"]) { should eq "/var/lib/mongodb" }
        its(["net", "port"]) { should eq 27017 }
      end
    EXAMPLE

    def initialize(conf_path = nil)
      @conf_path = conf_path || inspec.mongodb.conf_path

      if @conf_path.nil?
        return skip_resource "MongoDB conf path is not set."
      end

      super(@conf_path)
    end

    private

    def parse(content)
      YAML.load(content)
    rescue => e
      raise Inspec::Exceptions::ResourceFailed, "Unable to parse `mongod.conf` or `mongod.cfg` file: #{e.message}"
    end

    def resource_base_name
      "MongoDB Configuration"
    end
  end
end
