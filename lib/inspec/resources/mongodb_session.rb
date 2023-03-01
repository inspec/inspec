require "mongo"

module Inspec::Resources
  class Lines
    attr_reader :params

    def initialize(raw, desc, exit_status = nil)
      @params = raw
      @desc = desc
      @exit_status = exit_status
    end

    def to_s
      @desc
    end
  end

  class MongodbSession < Inspec.resource(1)
    name "mongodb_session"
    supports platform: "unix"
    supports platform: "windows"

    desc "Use the mongodb_session InSpec audit resource to run MongoDB command against a MongoDB Database."
    example <<~EXAMPLE
      # default values:
      # host: "127.0.0.1"
      # port: "27017"
      # auth_source - default to database name
      # auth_mech - :scram

      describe mongodb_session(user: "foo", password: "bar", database: "test").query(usersInfo: "ian").params["users"].first["roles"].first do
        its(["role"]) { should eq "readWrite" }
      end
    EXAMPLE
    attr_reader :user, :host, :port, :database, :params

    def initialize(opts = {})
      @user = opts[:user] || nil
      @password = opts[:password] || nil
      @host = opts[:host] || "127.0.0.1"
      @port = opts[:port] || "27017"
      @database = opts[:database] || nil
      @auth_mech = opts[:auth_mech] || :scram
      @auth_source = opts[:auth_source] || @database
      @ssl = opts[:ssl] || false
      @ssl_cert = opts[:ssl_cert] || nil
      @ssl_key = opts[:ssl_key] || nil
      @ssl_ca_cert = opts[:ssl_ca_cert] || nil
      @auth_mech_properties = opts[:auth_mech_properties] || {}
      @client = nil

      fail_resource "Can't run MongoDB checks without authentication." unless user && @password
      fail_resource "You must provide a database name for the session." unless database

      create_session
    end

    def query(command)
      raise Inspec::Exceptions::ResourceFailed, "#{resource_exception_message}" if resource_failed?

      Lines.new(@client.command(command).documents.first, "MongoDB query: #{command}")
    rescue => e
      raise Inspec::Exceptions::ResourceFailed, "Can't run MongoDB command Error: #{e.message}"
    end

    def resource_id
      "mongodb_session:User:#{@user}:Host:#{@host}:Database:#{@database}"
    end

    private

    def create_session
      raise Inspec::Exceptions::ResourceFailed, "#{resource_exception_message}" if resource_failed?

      options = { user: "#{user}",
        password: "#{@password}",
        database: "#{database}",
        auth_source: "#{@auth_source}",
        auth_mech: @auth_mech,
        }
      options[:auth_mech_properties] = @auth_mech_properties unless @auth_mech_properties.empty?
      options[:ssl] = @ssl
      opitons[:ssl_key] = @ssl_key unless @ssl_key.nil?
      options[:ssl_cert] = @ssl_cert unless @ssl_cert.nil?
      options[:ssl_ca_cert] = @ssl_ca_cert unless @ssl_ca_cert.nil?

      # Setting the logger level to INFO as mongo gem version 2.13.2 is using DEBUG as the log level Ref: https://github.com/mongodb/mongo-ruby-driver/blob/v2.13.2/lib/mongo/logger.rb#L79
      # Latest version of the mongo gem don't have this issue as it set to INFO level Ref: https://github.com/mongodb/mongo-ruby-driver/blob/master/lib/mongo/logger.rb#L82
      # We pinned the version to 2.13.2 as the latest version of the mongo gem has broken symlink https://jira.mongodb.org/browse/RUBY-2546 which causes omnibus build failure.
      # Once we get the latest version working we can remove logger level set here.
      Mongo::Logger.logger.level = Logger::INFO
      @client = Mongo::Client.new([ "#{host}:#{port}" ], options)

    rescue => e
      raise Inspec::Exceptions::ResourceFailed, "Can't run MongoDB command. Error: #{e.message}"
    end
  end
end
