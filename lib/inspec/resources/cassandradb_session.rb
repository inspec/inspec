module Inspec::Resources
  class Lines
    attr_reader :output

    def initialize(raw, desc)
      @output = raw
      @desc = desc
    end

    def to_s
      @desc
    end
  end

  class CassandradbSession < Inspec.resource(1)
    name "cassandradb_session"
    supports platform: "unix"
    supports platform: "windows"
    desc "Use the cassandradb_session InSpec resource to test commands against an Cassandra database"
    example <<~EXAMPLE
      cql = cassandradb_session(user: 'my_user', password: 'password', host: 'host', port: 'port')
      describe cql.query("SELECT cluster_name FROM system.local") do
        its('output') { should match /Test Cluster/ }
      end
    EXAMPLE

    attr_reader :user, :password, :host, :port

    def initialize(opts = {})
      @user = opts[:user] || "cassandra"
      @password = opts[:password] || "cassandra"
      @host = opts[:host]
      @port = opts[:port]
    end

    def query(q)
      cassandra_cmd = create_cassandra_cmd(q)
      cmd = inspec.command(cassandra_cmd)
      out = cmd.stdout + "\n" + cmd.stderr
      if cmd.exit_status != 0 || out =~ /Unable to connect to any servers/ || out.downcase =~ /^error:.*/
        raise Inspec::Exceptions::ResourceFailed, "Cassandra query with errors: #{out}"
      else
        Lines.new(cmd.stdout.strip, "Cassandra query: #{q}")
      end
    end

    def to_s
      "Cassandra DB Session"
    end

    private

    def create_cassandra_cmd(q)
      # TODO: simple escape, must be handled by a library
      # that does this securely
      escaped_query = q.gsub(/\\/, "\\\\").gsub(/"/, '\\"').gsub(/\$/, '\\$')

      # construct the query
      command = "cqlsh"
      command += " #{@host}" unless @host.nil?
      command += " #{@port}" unless @port.nil?
      command += " -u #{@user}"
      command += " -p #{@password}"
      command += " --execute '#{escaped_query}'"
      command
    end
  end
end
