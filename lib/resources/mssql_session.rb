# encoding: utf-8
# author: Nolan Davidson
# author: Christoph Hartmann
# author: Dominik Richter

require 'hashie/mash'
require 'utils/database_helpers'

module Inspec::Resources
  # STABILITY: Experimental
  # This resource needs further testing and refinement
  #
  # This requires the `sqlcmd` tool available on platform
  # @see https://docs.microsoft.com/en-us/sql/relational-databases/scripting/sqlcmd-use-the-utility
  # @see https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-connect-and-query-sqlcmd
  class MssqlSession < Inspec.resource(1)
    name 'mssql_session'
    desc 'Use the mssql_session InSpec audit resource to test SQL commands run against a MS Sql Server database.'
    example "
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
    "

    attr_reader :user, :password, :host, :port, :instance
    def initialize(opts = {})
      @user = opts[:user]
      @password = opts[:password] || opts[:pass]
      if opts[:pass]
        warn '[DEPRECATED] use `password` option to supply password instead of `pass`'
      end
      @host = opts[:host] || 'localhost'
      @port = opts[:port] || '1433'
      @instance = opts[:instance]

      # check if sqlcmd is available
      raise Inspec::Exceptions::ResourceSkipped, 'sqlcmd is missing' unless inspec.command('sqlcmd').exist?
      # check that database is reachable
      raise Inspec::Exceptions::ResourceSkipped, "Can't connect to the MS SQL Server." unless test_connection
    end

    def query(q)
      escaped_query = q.gsub(/\\/, '\\\\').gsub(/"/, '\\"').gsub(/\$/, '\\$')
      # surpress 'x rows affected' in SQLCMD with 'set nocount on;'
      cmd_string = "sqlcmd -Q \"set nocount on; #{escaped_query}\" -W -w 1024 -s ','"
      cmd_string += " -U '#{@user}' -P '#{@password}'" unless @user.nil? || @password.nil?
      if @instance.nil?
        cmd_string += " -S '#{@host},#{@port}'"
      else
        cmd_string += " -S '#{@host},#{@port}\\#{@instance}'"
      end
      cmd = inspec.command(cmd_string)
      out = cmd.stdout + "\n" + cmd.stderr
      if cmd.exit_status != 0 || out =~ /Sqlcmd: Error/
        # TODO: we need to throw an exception here
        # change once https://github.com/chef/inspec/issues/1205 is in
        warn "Could not execute the sql query #{out}"
        DatabaseHelper::SQLQueryResult.new(cmd, Hashie::Mash.new({}))
      else
        DatabaseHelper::SQLQueryResult.new(cmd, parse_csv_result(cmd))
      end
    end

    def to_s
      'MSSQL session'
    end

    private

    def test_connection
      !query('select getdate()').empty?
    end

    def parse_csv_result(cmd)
      require 'csv'
      table = CSV.parse(cmd.stdout, { headers: true })

      # remove first row, since it will be a seperator line
      table.delete(0)

      # convert to hash
      headers = table.headers

      results = table.map { |row|
        res = {}
        headers.each { |header|
          res[header.downcase] = row[header]
        }
        Hashie::Mash.new(res)
      }
      results
    end
  end
end
