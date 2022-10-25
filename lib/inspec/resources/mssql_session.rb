require "inspec/resources/command"
require "hashie/mash"
require "inspec/utils/database_helpers"

module Inspec::Resources
  # STABILITY: Experimental
  # This resource needs further testing and refinement
  #
  # This requires the `sqlcmd` tool available on platform
  # @see https://docs.microsoft.com/en-us/sql/relational-databases/scripting/sqlcmd-use-the-utility
  # @see https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-connect-and-query-sqlcmd
  class MssqlSession < Inspec.resource(1)
    name "mssql_session"
    supports platform: "windows"
    supports platform: "darwin"
    supports platform: "debian"
    supports platform: "redhat"
    supports platform: "suse"
    desc "Use the mssql_session InSpec audit resource to test SQL commands run against a MS Sql Server database."
    example <<~EXAMPLE
      # Using SQL authentication
      sql = mssql_session(user: 'myuser', pass: 'mypassword')
      describe sql.query('SELECT * FROM table').row(0).column('columnname') do
        its('value') { should cmp == 1 }
      end

      # Passing no credentials to mssql_session forces it to use Windows authentication
      sql_windows_auth = mssql_session
      describe sql_windows_auth.query(\"SELECT SERVERPROPERTY('IsIntegratedSecurityOnly') as \\\"login_mode\\\";\").row(0).column('login_mode') do
        its('value') { should_not be_empty }
        its('value') { should cmp == 1 }
      end
    EXAMPLE

    attr_reader :user, :password, :host, :port, :instance, :local_mode, :db_name
    def initialize(opts = {})
      @user = opts[:user]
      @password = opts[:password] || opts[:pass]
      if opts[:pass]
        Inspec.deprecate(:mssql_session_pass_option, "The mssql_session `pass` option is deprecated. Please use `password`.")
      end
      @local_mode = opts[:local_mode]
      unless local_mode?
        @host = opts[:host] || "localhost"
        @port = opts[:port]
      end
      @instance = opts[:instance]
      @db_name = opts[:db_name]

      # check if sqlcmd is available
      raise Inspec::Exceptions::ResourceSkipped, "sqlcmd is missing" unless inspec.command("sqlcmd").exist?
      # check that database is reachable
      raise Inspec::Exceptions::ResourceSkipped, "Can't connect to the MS SQL Server." unless test_connection
    end

    def query(q) # rubocop:disable Metrics/PerceivedComplexity
      escaped_query = q.gsub(/\\/, "\\\\").gsub(/"/, '""').gsub(/\$/, '\\$')
      # surpress 'x rows affected' in SQLCMD with 'set nocount on;'
      cmd_string = "sqlcmd -Q \"set nocount on; #{escaped_query}\" -W -w 1024 -s ','"
      cmd_string += " -U '#{@user}' -P '#{@password}'" unless @user.nil? || @password.nil?
      cmd_string += " -d '#{@db_name}'" unless @db_name.nil?
      unless local_mode?
        if @port.nil?
          cmd_string += " -S '#{@host}"
        else
          cmd_string += " -S '#{@host},#{@port}"
        end
        if @instance.nil?
          cmd_string += "'"
        else
          cmd_string += "\\#{@instance}'"
        end
      end
      cmd = inspec.command(cmd_string)
      out = cmd.stdout + "\n" + cmd.stderr
      if cmd.exit_status != 0 || out =~ /Sqlcmd: Error/
        raise Inspec::Exceptions::ResourceFailed, "Could not execute the sql query #{out}"
      else
        DatabaseHelper::SQLQueryResult.new(cmd, parse_csv_result(cmd.stdout))
      end
    end

    def resource_id
      "mssql_session:User:#{@user}:Host:#{@host}:Database:#{@db_name}:Instance:#{@instance}"
    end

    def to_s
      "MSSQL session"
    end

    private

    def local_mode?
      !!@local_mode # rubocop:disable Style/DoubleNegation
    end

    def test_connection
      !query("select getdate()").empty?
    end

    def parse_csv_result(stdout)
      require "csv" unless defined?(CSV)

      # replaces \n with \r since multiline data in older versions of database returns faulty
      # formatted multiline data, example name\r\n----\r\nThis is\na multiline field\r\n
      out = stdout.gsub("\n", "\r")
      out = out.gsub("\r\r", "\r")

      # row separator used since row delimiters \n (in linux) or \r\n (in windows)
      # are converted to \r for consistency and handling faulty formatted multiline data
      table = CSV.parse(out, headers: true, row_sep: "\r")

      # remove first row, since it will be a seperator line
      table.delete(0)

      # convert to hash
      headers = table.headers

      results = table.map do |row|
        res = {}
        headers.each do |header|
          res[header.downcase] = row[header] if header
        end
        Hashie::Mash.new(res)
      end
      results
    end
  end
end
