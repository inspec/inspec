# copyright: 2015, Vulcano Security GmbH

require "shellwords" unless defined?(Shellwords)

module Inspec::Resources
  class Lines
    attr_reader :output, :exit_status

    def initialize(raw, desc, exit_status)
      @output = raw
      @desc = desc
    end

    def lines
      output.split("\n").map(&:strip)
    end

    def to_s
      @desc
    end
  end

  class PostgresSession < Inspec.resource(1)
    name "postgres_session"
    supports platform: "unix"
    supports platform: "windows"
    desc "Use the postgres_session InSpec audit resource to test SQL commands run against a PostgreSQL database."
    example <<~EXAMPLE
      sql = postgres_session('username', 'password', 'host', 'port')
      query('sql_query', ['database_name'])` contains the query and (optional) database to execute

      # default values:
      # username: 'postgres'
      # host: 'localhost'
      # port: 5432
      # db: databse == db_user running the sql query

      describe sql.query('SELECT * FROM pg_shadow WHERE passwd IS NULL;') do
        its('output') { should eq '' }
      end
    EXAMPLE

    def initialize(user, pass, host = nil, port = nil, socket_path = nil)
      @user = user || "postgres"
      @pass = pass
      @host = host || "localhost"
      @port = port || 5432
      @socket_path = socket_path
      raise Inspec::Exceptions::ResourceFailed, "Can't run PostgreSQL SQL checks without authentication." if @user.nil? || @pass.nil?
    end

    def query(query, db = [])
      raise Inspec::Exceptions::ResourceFailed, "#{resource_exception_message}" if resource_failed?

      psql_cmd = create_psql_cmd(query, db)
      cmd = inspec.command(psql_cmd, redact_regex: %r{(:\/\/[a-z]*:).*(@)})
      out = cmd.stdout + "\n" + cmd.stderr
      if cmd.exit_status != 0 && ( out =~ /could not connect to/ || out =~ /password authentication failed/ ) && out.downcase =~ /error:/
        raise Inspec::Exceptions::ResourceFailed, "PostgreSQL connection error: #{out}"
      elsif cmd.exit_status != 0 && out.downcase =~ /error:/
        Lines.new(out, "PostgreSQL query with error: #{query}", cmd.exit_status)
      else
        Lines.new(cmd.stdout.strip, "PostgreSQL query: #{query}", cmd.exit_status)
      end
    end

    def resource_id
      "postgress_session:User:#{@user}:Host:#{@host}"
    end

    private

    def escaped_query(query)
      Shellwords.escape(query)
    end

    def create_psql_cmd(query, db = [])
      dbs = db.map { |x| "#{x}" }.join(" ")

      if @socket_path && !inspec.os.windows?
        # Socket path and empty host in the connection string establishes socket connection
        # Socket connection only enabled for non-windows platforms
        # Windows does not support unix domain sockets
        option_port = @port.nil? ? "" : "-p #{@port}" # add explicit port if specified
        "psql -d postgresql://#{@user}:#{@pass}@/#{dbs}?host=#{@socket_path} #{option_port} -A -t -w -c #{escaped_query(query)}"
      else
        # Host in connection string establishes tcp/ip connection
        if inspec.os.windows?
          warn "Socket based connection not supported in windows, connecting using host" if @socket_path
          "psql -d postgresql://#{@user}:#{@pass}@#{@host}:#{@port}/#{dbs} -A -t -w -c \"#{query}\""
        else
          "psql -d postgresql://#{@user}:#{@pass}@#{@host}:#{@port}/#{dbs} -A -t -w -c #{escaped_query(query)}"
        end
      end
    end
  end
end
